# Copyright (c) 2026 Zeko Labs
# SPDX-License-Identifier: MIT
"""Negative fixtures for material proposal inconsistencies, not bridge tests."""
import importlib.util
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('package', ROOT / 'scripts/build_package.py')
package = importlib.util.module_from_spec(spec)
spec.loader.exec_module(package)
APP = 'ironlimb-zcash-grant-application.md'
BUDGET = 'ironlimb-delivery-budget-and-continuity.md'


class ProposalValidation(unittest.TestCase):
    def fixture(self):
        directory = tempfile.TemporaryDirectory()
        self.addCleanup(directory.cleanup)
        root = Path(directory.name)
        for name in (*package.PACKAGE_FILES, package.ARCHIVE):
            target = root / name
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(ROOT / name, target)
        return root

    def validate(self, root):
        return subprocess.run(
            ['ruby', str(ROOT / 'scripts/validate_proposal.rb'), str(root)],
            text=True, capture_output=True, check=False,
        )

    def mutate(self, root, name, before, after):
        path = root / name
        source = path.read_text()
        self.assertIn(before, source)
        path.write_text(source.replace(before, after, 1))

    def rejected(self, root, diagnostic):
        result = self.validate(root)
        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn(diagnostic, result.stderr)

    def test_current_proposal_passes(self):
        result = self.validate(ROOT)
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_category_mismatch_is_rejected(self):
        root = self.fixture()
        self.mutate(root, APP, '$299,500', '$298,500')
        self.rejected(root, 'Category totals do not reconcile')

    def test_startup_is_not_silently_omitted(self):
        root = self.fixture()
        self.mutate(root, BUDGET,
                    '| Startup | $4,000 | $0 | $1,000 | $5,000 |',
                    '| Startup | $4,000 | $0 | $0 | $4,000 |')
        self.rejected(root, 'Budget matrix and application categories differ')

    def test_rationale_must_match_payment_matrix(self):
        root = self.fixture()
        self.mutate(root, APP, 'Compensation $27,000', 'Compensation $26,000')
        self.rejected(root, 'Milestone 5 rationale differs from matrix')

    def test_dates_must_be_sequential(self):
        root = self.fixture()
        self.mutate(root, APP,
                    'Expected Completion Date: "2027-11-14"',
                    'Expected Completion Date: "2027-11-15"')
        self.rejected(root, 'Milestone 5 date is not sequential')

    def test_supporting_document_must_exist(self):
        root = self.fixture()
        (root / 'ironlimb-technical-design-and-threat-model.md').unlink()
        self.rejected(root, 'Missing required file')

    def test_unresolved_staffing_placeholder_is_rejected(self):
        root = self.fixture()
        path = root / APP
        path.write_text(path.read_text() + '\n[CONFIRM: unknown owner]\n')
        self.rejected(root, 'Unresolved filing placeholder')

    def test_license_and_application_must_agree(self):
        root = self.fixture()
        self.mutate(root, APP,
                    '## Open Source License\n\n```text\nMIT\n```',
                    '## Open Source License\n\n```text\nApache 2.0\n```')
        self.rejected(root, 'Application license must match MIT LICENSE')

    def test_broken_local_link_is_rejected(self):
        root = self.fixture()
        self.mutate(root, 'README.md', '(REFERENCES.md)', '(missing-resource.md)')
        self.rejected(root, 'Missing local link target')

    def test_snapshot_matches_sources(self):
        package.verify(ROOT)

    def test_snapshot_drift_is_rejected(self):
        root = self.fixture()
        path = root / 'README.md'
        path.write_text(path.read_text() + '\nUnpackaged source change.\n')
        with self.assertRaisesRegex(ValueError, 'Stale archive entry: README.md'):
            package.verify(root)


if __name__ == '__main__':
    unittest.main()

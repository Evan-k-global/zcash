# Copyright (c) 2026 Zeko Labs
# SPDX-License-Identifier: MIT
"""Build or verify the source-based, nonrecursive proposal download."""
import argparse
from pathlib import Path
from zipfile import ZipFile, ZipInfo, ZIP_DEFLATED

ROOT = Path(__file__).resolve().parents[1]
ARCHIVE = 'ironlimb-submission-package.zip'
PACKAGE_FILES = (
    'README.md', 'ironlimb-zcash-grant-application.md', 'ironlimb-forum-post.md',
    'ironlimb-technical-design-and-threat-model.md',
    'ironlimb-delivery-budget-and-continuity.md',
    'ironlimb-cryptographic-fit-and-alternatives.md',
    'LICENSE', 'CONTRIBUTING.md', 'REFERENCES.md', '.gitignore',
    'scripts/validate_proposal.rb', 'scripts/build_package.py',
    'tests/test_proposal.py', '.github/workflows/validate.yml',
)


def verify(root=ROOT):
    with ZipFile(root / ARCHIVE) as archive:
        if archive.testzip() is not None:
            raise ValueError('Archive integrity check failed')
        if archive.namelist() != list(PACKAGE_FILES):
            raise ValueError('Archive inventory differs from current source manifest')
        for name in PACKAGE_FILES:
            if archive.read(name) != (root / name).read_bytes():
                raise ValueError(f'Stale archive entry: {name}')


def build(root=ROOT):
    temporary = root / 'ironlimb-submission-package.tmp.zip'
    try:
        with ZipFile(temporary, 'w', ZIP_DEFLATED) as archive:
            for name in PACKAGE_FILES:
                info = ZipInfo(name, (2026, 11, 5, 0, 0, 0))
                info.compress_type = ZIP_DEFLATED
                info.create_system = 3
                info.external_attr = 0o100644 << 16
                archive.writestr(info, (root / name).read_bytes())
        temporary.replace(root / ARCHIVE)
    finally:
        temporary.unlink(missing_ok=True)
    verify(root)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='verify without changing files')
    args = parser.parse_args()
    try:
        if not args.check:
            build()
        verify()
    except (OSError, ValueError) as error:
        parser.exit(1, f'FAIL: {error}\n')
    print(f'PASS: {ARCHIVE} matches all {len(PACKAGE_FILES)} current source files')

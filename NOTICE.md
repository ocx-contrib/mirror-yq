# NOTICE

This repository packages and redistributes upstream software published by
[Mike Farah](https://github.com/mikefarah). The Apache-2.0 license in
[`LICENSE`](LICENSE) covers the OCX pipeline files authored here. It does
**not** cover any upstream-derived asset — each package's redistributed bytes
carry their own license, recorded below.

Each package's logo is reproduced for catalog identification only, under
nominative fair use. The marks remain the property of their respective owners
and no endorsement is implied.

| Package | GHCR path | Upstream SPDX |
|---|---|---|
| `yq` | `ghcr.io/ocx-contrib/yq/yq` | `MIT` |

---

## `yq`

Upstream: <https://github.com/mikefarah/yq>
Published to `ghcr.io/ocx-contrib/yq/yq`.

| Component | SPDX | Holder |
|---|---|---|
| yq (`yq`) | **MIT** | Copyright (c) 2017 Mike Farah |

Permissive; redistribution of the compiled binary is granted provided the
copyright notice and permission notice are retained. Upstream ships raw
binaries with no bundled `LICENSE` file, so the notice is reproduced above and
the terms are those of <https://github.com/mikefarah/yq/blob/master/LICENSE>.
The published binaries statically link third-party Go modules under permissive
licenses, enumerated in upstream's `go.mod`.

The yq name is used for catalog identification under nominative fair use. The
logo shipped with this package is an OCX-authored lettermark, not an official
yq mark.

No modifications are made to any upstream artifact in this repository; they are
republished byte-for-byte inside an OCX bundle.

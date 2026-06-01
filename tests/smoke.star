# Stable smoke test — assert on the contract (exit code, version shape,
# computed result), never on help/version prose. yq's version banner and
# help text are upstream's to reword; the digits and the YAML it computes
# are the contract.
YQ = "yq.exe" if ocx.target_platform.os == ocx.os.Windows else "yq"

# Tier 1 + 2: liveness + version SHAPE (yq prints version to stdout).
r_version = ocx.run(YQ, "--version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

# Tier 3: functional behavior on hermetic input — assert the computed
# value, not prose. `yq '.a' in.yaml` over `a: 1` must yield `1`.
ocx.write_file("in.yaml", "a: 1\n")
r = ocx.run(YQ, ".a", "in.yaml")
expect.ok(r)
expect.contains(r.stdout, "1")

# Tier 4: yq is a pure transform CLI — PATH only (proven by Tier 1). No
# non-PATH env var to wire, so no Tier 4 check.

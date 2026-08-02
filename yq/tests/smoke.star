# yq/tests/smoke.star — stable across upstream releases.
# Assert on the contract (exit code, version shape, computed result), never on
# help/version prose. yq's banner and help text are upstream's to reword; the
# digits and the documents it computes are the contract.
YQ = "yq.exe" if ocx.target_platform.os == ocx.os.Windows else "yq"

# Tier 1 + 2: liveness + version SHAPE (yq prints its version to stdout).
r_version = ocx.run(YQ, "--version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

# Tier 3a: path extraction on hermetic input — the computed value, exactly.
# Anchored so a substring match on some longer number cannot pass it.
ocx.write_file("in.yaml", "a: 42\nb:\n  - x\n  - y\n")
r = ocx.run(YQ, ".a", "in.yaml")
expect.ok(r)
expect.matches(r.stdout, r"^42\s*$")

# Tier 3b: format conversion — yq's headline capability, and the check that
# fails if the YAML parser or the JSON encoder regresses. Offline, no network.
j = ocx.run(YQ, "-o=json", ".", "in.yaml")
expect.ok(j)
expect.contains(j.stdout, "\"a\": 42")
expect.contains(j.stdout, "\"x\"")

# Tier 4: yq is a pure transform CLI — PATH only (proven by Tier 1). No
# non-PATH env var to wire, so no Tier 4 check.

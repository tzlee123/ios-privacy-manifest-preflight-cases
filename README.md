# iOS Privacy Manifest Preflight Cases

[![AccessVerdict CLI Demo](https://github.com/tzlee123/ios-privacy-manifest-preflight-cases/actions/workflows/accessverdict-cli-demo.yml/badge.svg)](https://github.com/tzlee123/ios-privacy-manifest-preflight-cases/actions/workflows/accessverdict-cli-demo.yml)

Minimal synthetic cases for understanding App Store privacy-manifest preflight findings.

The cases cover `PrivacyInfo.xcprivacy`, app-owned Required-Reason API signals, and Apple-listed SDK dependency review.

These folders are intentionally small teaching fixtures, not complete buildable Xcode applications.

## Cases

| Case | Expected preflight signal |
| --- | --- |
| `cases/01-missing-manifest` | App-owned UserDefaults signal with no PrivacyInfo.xcprivacy |
| `cases/02-missing-category` | Privacy manifest exists, but the UserDefaults category is not declared |
| `cases/03-structure-review` | Accessed API type appears without a matching reasons declaration |
| `cases/04-sdk-review` | Apple-listed SDK name appears in a dependency file |
| `cases/05-clean` | UserDefaults category and a reasons array are present |

## Why these are separate cases

A privacy-manifest preflight should distinguish between:

- evidence that can be treated as a blocker for the bounded static check;
- dependency inventory that still needs version-specific human review;
- uncertainty that only the final built product can resolve.

AccessVerdict does not claim to reproduce App Review.

## Try the cases locally with the AccessVerdict CLI

The CLI runs the deterministic preflight on your machine. It does not upload repository source code to AccessVerdict.

```bash
npx @accessverdict/cli scan ./cases/01-missing-manifest
```

Try the clean case:

```bash
npx @accessverdict/cli scan ./cases/05-clean
```

For review-only findings such as SDK inventory, use strict mode if you want a non-zero CI exit:

```bash
npx @accessverdict/cli scan ./cases/04-sdk-review --strict
```

The CLI reports only bounded static repository evidence. A clean result is not a guarantee of App Store approval.

## CI example

This repository runs the public CLI in GitHub Actions on every push and pull request. The workflow verifies two behaviors:

- `cases/05-clean` exits successfully;
- `cases/01-missing-manifest` returns blocker exit code `2`.

See `.github/workflows/accessverdict-cli-demo.yml` for a minimal CI integration you can copy into another repository.

The CLI sends only minimal anonymous usage telemetry: a random installation id, CLI version, outcome class, and whether `--json` or `--strict` was used. It does not send repository names, paths, filenames, source code, or finding text. Set `DO_NOT_TRACK=1` or `ACCESSVERDICT_TELEMETRY=0` to disable it.

## Try the web preflight

Prefer a browser and GitHub connection? Use the read-only web preflight:

https://accessverdict.dev/app-store-preflight?utm_source=github&utm_medium=referral&utm_campaign=privacy_preflight_cases

The scanner reports file-level evidence, then you fix locally and rescan.

## About the clean case

`cases/05-clean` uses `CA92.1` only as a concrete teaching example for app-scoped UserDefaults behavior. In a real app, choose an Apple-approved reason only when its documented conditions match the actual behavior.

## Scope

The examples demonstrate static repository evidence only. They do not validate the final binary, generated code, bundle ownership, or the final Xcode privacy report.

AccessVerdict is not affiliated with Apple.

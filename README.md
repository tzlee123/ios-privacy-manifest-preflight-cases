# iOS Privacy Manifest Preflight Cases

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

## Try a repository preflight

Connect a repository using the read-only web preflight:

https://accessverdict.dev/app-store-preflight?utm_source=github&utm_medium=referral&utm_campaign=privacy_preflight_cases

The scanner reports file-level evidence, then you fix locally and rescan.

## About the clean case

`cases/05-clean` uses `CA92.1` only as a concrete teaching example for app-scoped UserDefaults behavior. In a real app, choose an Apple-approved reason only when its documented conditions match the actual behavior.

## Scope

The examples demonstrate static repository evidence only. They do not validate the final binary, generated code, bundle ownership, or the final Xcode privacy report.

AccessVerdict is not affiliated with Apple.

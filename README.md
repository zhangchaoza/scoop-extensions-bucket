# Scoop Bucket Template

[![Tests](https://github.com/zhangchaoza/scoop-extensions-bucket/actions/workflows/ci.yml/badge.svg)](https://github.com/zhangchaoza/scoop-extensions-bucket/actions/workflows/ci.yml) [![Excavator](https://github.com/zhangchaoza/scoop-extensions-bucket/actions/workflows/excavator.yml/badge.svg)](https://github.com/zhangchaoza/scoop-extensions-bucket/actions/workflows/excavator.yml)

## How do I install these manifests?

After manifests have been committed and pushed, run the following:

```pwsh
scoop bucket add scoop-extensions-bucket https://github.com/zhangchaoza/scoop-extensions-bucket
scoop install scoop-extensions-bucket/<manifestname>
```

## How do I contribute new manifests?

To make a new manifest contribution, please read the [Contributing
Guide](https://github.com/ScoopInstaller/.github/blob/main/.github/CONTRIBUTING.md)
and [App Manifests](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests)
wiki page.

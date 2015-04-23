# r-dependencies
[![wercker status](https://app.wercker.com/status/897ade61fbdb92ac450cf84c4006a281/s "wercker status")](https://app.wercker.com/project/bykey/897ade61fbdb92ac450cf84c4006a281)

A step to install R dependencies for a package.  Best used with one of the
[rocker](https://registry.hub.docker.com/repos/rocker/) images.

If you want to install dependencies that are on Github use the `github_packages`
parameter.


```yaml
    - jimhester/r-dependencies:
        github_packages: jimhester/covr jimhester/lintr
```

## Options
* `github_packages` (optional). A list of additional Github dependencies to
  install, separated by whitespace.

## Example

Basic usage:
```
    - jimhester/r-dependencies
```

If you want to install additional dependencies from Github.

```
    - jimhester/r-dependencies:
        github_packages: jimhester/covr jimhester/lintr
```

# License

The MIT License (MIT)

Copyright (c) 2015 Jim Hester

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Changelog

## 0.0.2
- Correct silly typo

## 0.0.1
- initial release

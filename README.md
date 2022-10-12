# InteliiJ IDEA Auto Installer

A script to automatically install the latest version of IntelliJ IDEs on Linux.

## Supported IDEs

| IDE Name | package |
| ---------| ------- |
| IntelliJ IDEA Ultimate | `idea-ultimate` |
| IntelliJ IDEA Community Edition | `idea-community` |
| PyCharm Professional | `pycharm-professional` |
| PyCharm Community Edition | `pycharm-community` |
| WebStorm | `webstorm` |
| PhpStorm | `phpstorm` |
| RubyMine | `rubymine` |
| CLion | `clion` |
| GoLand | `goland` |
| DataGrip | `datagrip` |
| PhpStorm | `phpstorm` |
| Rider | `rider` |

## Usage

The installer script requires `curl` & `jq` to be installed. 

To install `jq` on Debian/Ubuntu and derivatives run `sudo apt install curl jq`. On CentOS/Fedora/RHEL and deriavaties run `sudo dnf install curl jq`.

```bash
curl -fsSL https://raw.github.com/recrsn/intellij-idea-installer/main/installer.sh | sh -s [package]
```

For example, to install the latest version of IntelliJ IDEA Community Edition run:

```bash
curl -fsSL https://raw.github.com/recrsn/intellij-idea-installer/main/installer.sh | sh -s idea-community
```

Or to install the latest version of PyCharm Community run:

```bash
curl -fsSL https://raw.github.com/recrsn/intellij-idea-installer/main/installer.sh | sh -s pycharm-community
```
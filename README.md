# config-repo

Repository for all configuration files on my system.

## Contents
- bash
- i3
- kitty
- polybar
- ranger
- rofi
- vim

## Tips

To add a new item to the repo, first move the config file, or directory to the
repo, then create a simlink back to the original location.

Create symlink:
`ln -s ~/config-repo/<path> ~/<path>`

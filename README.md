# robbertkl/ssh

[![](https://badge.imagelayers.io/robbertkl/ssh:latest.svg)](https://imagelayers.io/?images=robbertkl/ssh:latest)

Docker container running OpenSSH server:

* Exposes port 22
* Fills `~/.ssh/authorized_keys` from an environment variable

## Usage

Run like this:

```
docker run -d -e AUTHORIZED_KEYS="..." -p 2222:22 robbertkl/ssh
```

You can then SSH with user root.

## Environment variables

* `AUTHORIZED_KEYS` (comma-separated list of SSH keys)

## Authors

* Robbert Klarenbeek, <robbertkl@renbeek.nl>

## License

This repo is published under the [MIT License](http://www.opensource.org/licenses/mit-license.php).

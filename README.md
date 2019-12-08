# robbertkl/ssh

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

## Preserving host keys

Fresh host keys for OpenSSH are generated on first run. This is fine, but when later recreating the container (like after pulling a new image) they are generated again and you'll get an error trying to SSH because the old one is in your `.ssh/known_hosts`.

If you don't want to fix this every time after an upgrade, you can preserve the host keys in a number of ways:

* Keep `/etc/ssh` in a Docker volume (not recommended because you won't get `sshd_config` changes in new versions)
* Pregenerate host keys and mount them inside the container
* Pregenerate host keys, create your own Docker image using robbertkl/ssh as the base and copy in the host keys

## Authors

* Robbert Klarenbeek, <robbertkl@renbeek.nl>

## License

This repo is published under the [MIT License](http://www.opensource.org/licenses/mit-license.php).

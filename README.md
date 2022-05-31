# OpenPunk's ansible recovery

This is my failsafe (and also my helpful migration tool) for restoring the OpenPunk server. This handles setting everything back up, including:

- gitea
- blog
- nginx
- tor mirror

## Usage

```sh
ansible-playbook -i hosts --ask-vault-pass run.yml
```
> NOTE: The 'secrets' directory has been omitted from the repo

## Example hosts file

```
[hosts]
openpunk-vps ansible_host=104.238.138.76 ansible_user=root ansible_connection=ssh
```
# OpenPunk's Ansible playbook

This is my failsafe (and also my helpful migration tool) for restoring the OpenPunk server. This handles setting everything back up, including:

- gitea
- blog
- tor mirror
- nginx (for the above mentioned)
- my shell theme (zsh + powerlevel10k)
- deadswitch (& the ssh + git config to allow pushes)

## Notes to my future self

The deadswitch is disabled by default. Delete the file lock at `/root/.deadlock` to enable it.

## Usage

```sh
ansible-playbook -i hosts --ask-vault-pass run.yml
```
> NOTE: The 'secrets' directory has been omitted from this repo (so it's not going to run without the provided files)

## Example hosts file

```
[hosts]
openpunk-vps ansible_host=104.238.138.76 ansible_user=root ansible_connection=ssh
```
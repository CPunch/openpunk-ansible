# OpenPunk's Ansible playbook

This is my failsafe (and also my helpful migration tool) for restoring the OpenPunk server. This handles setting everything back up, including:

- gitea
- blog
- tor mirror
- nginx (for the above mentioned)
- my shell theme (zsh + powerlevel10k)
- deadswitch (& the ssh + git config to allow pushes)

This playbook assumes the target VPS is running the latest debian stable release.

## Notes to my future self

The deadswitch has the deadtrigger setup every run, so you have a 14-day timer to add a one-liner to your crontab to keep that deadtrigger set.

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
# OpenPunk's Ansible playbook

This is my failsafe (and also my helpful migration tool) for restoring the OpenPunk server. This handles setting everything back up, including:

- gitea
    - backup and restoring are also supported
- blog
    - cron job for grabbing the `HEAD` of https://github.com/CPunch/openpunk && building the hugo site
- tor mirror
- nginx (for the above mentioned)
    - certbot's Let's Encrypt
- my shell theme (zsh + powerlevel10k)
- deadswitch (& the ssh + git config to allow pushes)

This playbook assumes the target VPS is running the latest debian stable release.

## Notes to my future self
Add this to your local machine's crontab:

```sh
ssh openpunk 'touch /root/.deadtrigger'
```

Some DNS records also need to be set:
- an A record with a `git.*` subdomain

A Gitea Act Runner is also setup if the `giteaRunnerToken` variable is defined in your hosts file.

## Usage
First, make sure to install the requirements:
```sh
ansible-galaxy install -r requirements.yml
```

Then, run the playbook:

```sh
ansible-playbook -i hosts --ask-vault-pass run.yml
```
> NOTE: The 'secrets' directory has been omitted from this repo (so it's not going to run without the provided files)

## Backup and restore

Backup Gitea using the 'backup' tag
```sh
ansible-playbook -i hosts run.yml --tags backup
```

then, restore from the backup using the 'restore' tag
```sh
ansible-playbook -i hosts run.yml --tags restore
```

## Example hosts file
```
[hosts]
openpunk-vps ansible_host=104.238.138.76 ansible_user=root ansible_connection=ssh giteaRunnerToken=my-token-yayy
```
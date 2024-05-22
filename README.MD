# Setuo

Execute:
* `./install` installs [base config](./base.yaml)
* `./install base` installs [base links config](./dotbot-profiles/base.yaml)
* `./install-aur aur` installs [aur packages](./dotbot-profiles/aur.yaml)
* `./install-yay arch` installs [arch pacman packages](./dotbot-profiles/arch.yaml)
 
# Confgiuration

## Terminal
set terminal font to MesloLGS NF
disable systemd-networkd in favour of NetworkManager
enable ananicy





add zimfw install instructions


change shell

set XDG_CONFIG_HOME   DEFAULT=@{HOME}/.config in /etc/security/pam_env.conf

usned kdewallet as secret storage sevice
set keepassxc as secret store service + autostart via https://github.com/keepassxreboot/keepassxc/issues/6274#issuecomment-810983553


configure rclone units:
+ copy rclone config from ~/.config/rclone/rclone.conf to new location
* enable and start units with --user

configure printer

configure laptop power - https://wiki.archlinux.org/title/Power_management#Power_management_with_systemd

* disable NMI watchdog, adjust writeback time, laptop mode (mostly related to spinining disk)

* enable ssd trim
- systemctl enable fstrim.timer
- enable https://wiki.archlinux.org/title/Dm-crypt/Specialties#Discard/TRIM_support_for_solid_state_drives_(SSD)

# Confiure git

https://docs.gitlab.com/ee/user/project/repository/signed_commits/ssh.html


# Adjust makepkg options

- https://wiki.archlinux.org/title/makepkg - (3.2)

# Battery life

Enable acpid service
```
sudo systemctl enable acpid
```
disable ballo as it causing issues with sleep

enable tlp service
https://wiki.archlinux.org/title/TLP


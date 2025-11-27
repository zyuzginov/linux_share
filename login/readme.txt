скрипт, который нужно будет положить /etc/profile.d
а так же закомментировать строку "session optional pam_motd.so noupdate" в файле /etc/pam.d/sshd
и перезапустить sshd:
systemctl reload sshd

# sftp
Securely share your files via SFTP

This work is forked from that on https://github.com/atmoz/sftp.

What I did is:

  *  Update to latest Debian Stable
  *  Delete the www-data user. This because we might need to access a folder owned by www-data and the entrypoint script does not work on already existing users 


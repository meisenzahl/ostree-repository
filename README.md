# OSTree Repository

```bash
sudo ostree admin init-fs /
sudo ostree admin os-init meisenzahl-daily
sudo ostree remote add --if-not-exists --no-gpg-verify meisenzahl-daily 'http://ostree.meisenzahl.me/repo/daily/'
sudo ostree pull --depth=1 meisenzahl-daily io.elementary.desktop/x86_64/7
sudo ostree admin deploy --karg-proc-cmdline --os=meisenzahl-daily io.elementary.desktop/x86_64/7
```

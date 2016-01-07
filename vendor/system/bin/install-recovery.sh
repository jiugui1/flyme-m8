#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 18417664 6f84a984d899f46d272dfd0ec013a5287c9eb3f0 13527040 06aaf181aecf338041ac934351d0c7ed3c278f12
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:18417664:6f84a984d899f46d272dfd0ec013a5287c9eb3f0; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:13527040:06aaf181aecf338041ac934351d0c7ed3c278f12 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 6f84a984d899f46d272dfd0ec013a5287c9eb3f0 18417664 06aaf181aecf338041ac934351d0c7ed3c278f12:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

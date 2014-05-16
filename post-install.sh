#!/bin/bash
# "$3/pear-$1" could also be used in place of "$2/bin/pear"
# (both refer to the pear installer for this specific version of PHP).

phpfpmconf="$2/etc/php-fpm.conf";

cp "$phpfpmconf.default" "$phpfpmconf";

exts=(mongo redis);

for ext in "${exts[@]}"
do
  "$3/pear-$1" install "$ext";
  echo "extension=$ext.so" > "$2/etc/conf.d/$ext.ini";
done

inidscript="/etc/init.d/php-fpm"

echo "php_fpm_BIN=$3/../current/sbin/php-fpm\n" | sudo tee -a "$inidscript"
echo "php_fpm_CONF=$3/../current/etc/php-fpm.conf\n" | sudo tee -a "$inidscript"

cat "$3/../../custom/php-fpm" | sudo tee -a "$inidscript"

sudo update-rc.d php-fpm defaults

# The exit status must be 0 when the scripts terminates without any error.
# Any other value will be treated as an error.
exit 0;


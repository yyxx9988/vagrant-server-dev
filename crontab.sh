# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'
# command to install the new version when you edit this file
# and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# m h dom mon dow user  command
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )

47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly
)
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly
 )
#
*/30 * * * *  root  chown -R webmaster:webmaster /usr/local/nginx > /dev/null 2>&1
*/30 * * * *  root  chown -R mysql:mysql /usr/local/mysql > /dev/null 2>&1
*/30 * * * *  root  chown -R mysql:mysql /www/mysql > /dev/null 2>&1
*/15 * * * *  root  chown -R mysql:mysql /tmp/mysql.sock > /dev/null 2>&1
*/30 * * * *  root  chown -R webmaster:webmaster /usr/local/redis > /dev/null 2>&1
*/30 * * * *  root  chown -R webmaster:webmaster /usr/local/php > /dev/null 2>&1
#
@reboot root /usr/local/mysql/support-files/mysql.server start \
&& /usr/local/redis/bin/redis-server /usr/local/redis/conf/redis.conf \
&& /usr/local/php/sbin/php-fpm

#/bin/sh
wget -qO - http://greatwords.ru/random |sed -ne '/quote-p\|info-p/!b;s/<[^>]*>//g;s/&nbsp;/ /g;p' |fold -sw 160

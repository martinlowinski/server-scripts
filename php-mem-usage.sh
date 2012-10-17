#!/bin/bash

PHP_CGI_SIZE=$(ps aux | grep php-cgi | awk '{SUM+=$4} END {print (1027300*(SUM/100))/1024}' - | bc -l)
PHP_FPM_SIZE=$(ps aux | grep php-fpm | awk '{SUM+=$4} END {print (1027300*(SUM/100))/1024}' - | bc -l)

echo "Memory usage of all php-cgi processes:" $PHP_CGI_SIZE "MB"
echo "Memory usage of all php-fpm processes:" $PHP_FPM_SIZE "MB"

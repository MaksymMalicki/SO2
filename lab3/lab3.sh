#!/bin/bash -eu

### zad. 1
# 10 unikalnych adresów ip
grep -o -E "\b(?:\d{1,3}\.){3}\d{1,3}\b" access_log | uniq -u | head -n 10;

# zapytania z frazą 'denied' w linku
grep -E "/.*denied.*/" access_log

# zapytania wysłane z ip 64.242.88.10
grep "64.242.88.10" access_log

# unikalne zapytania typu DELETE
grep "DELETE" access_log | uniq -u;


### zad. 2
# z pliku yolo.csv nieparzyste id
cut -d ',' -f 1- yolo.csv | grep -E '^[0-9]*[13579],' 1>&2

# z pliku yolo.csv wszystkie ip, które w pierwszym i drugim oktecie mają po jednej cyfrze
cut -d ',' -f 6 yolo.csv | grep -E '\b\d\.\d\.\d{1,3}\.\d{1,3}\b'


### zad. 3
# zamiana $HEADER$ na /temat/ we wszystkich plikach w katalogu groovies
sed -i '' 's/\$HEADER\$/\/temat\//g' groovies/*

# usunięcie we wszystkich plikach w katalogu groovies linijek zawierających frazę 'Help docs'
sed -i '' '/Help docs:/d' groovies/*


### zad. 4
# uruchom skrypt fakaping.sh, wszystkie linijki mające zakończenie .conf zachowaj. Wypisz na ekran i do pliku find_results.log. Odfiltruj błędy do pliku: errors.log.
./fakaping.sh 2>errors.log | tee >(grep '\.conf$' | tee find_results.log)

# Uruchom skrypt fakaping.sh, standardowe wyjście przekieruj do nicości, a błedy posortuj (nie usuwaj duplikatów).
./fakaping.sh 2>&1 > /dev/null | sort

# uruchom skrypt fakaping.sh, wszystkie errory zawierające ""permission denied"" (bez względu na wielkośc liter) wypisz na konsolę i do pliku denied.log. Wyniki powinny być unikalne.
./fakaping.sh 2>&1 | grep -i "permission denied" | sort -u | tee denied.log
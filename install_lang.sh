#!/bin/bash

# Проверка раскомментированной строки в locale
if grep -qE "^[^#]*ru_RU.UTF-8 UTF-8" /etc/default/locale.gen; then
  echo "Русский язык уже установлен! "
  sleep 3
else

  # Бэкапы
  echo "Делаем бэкапы..."
  sleep 2
  cp /etc/default/pacman.conf /etc/default/pacman_conf.bak
  cp /etc/default/locale.gen /etc/default/locale_gen.bak

  # Cнимаем ограничение на запись
  echo "Cнимаем ограничение на запись..."
  sleep 2
  sudo steamos-readonly disable

  
  # Выключение проверки ключей шифрования
  echo "Выключаем проверку ключей шифрования..."
  sleep 2
  sed -i 's/^SigLevel    = Required DatabaseOptional$/SigLevel = TrustAll/' /etc/default/pacman.conf
  
  # Инициализация связки ключей
  echo "Инициализация связки ключей..."
  sleep 2
  sudo pacman-key --init

  # Редактируем системную локаль
  echo "Редактируем системную локаль..."
  sleep 2
  sed -i 's/^#ru_RU.UTF-8 UTF-8  $/ru_RU.UTF-8 UTF-8  /' /etc/default/locale.gen
  
  # Переустанавливаем glibc
  echo "Переустанавливаем glibc..."
  sleep 2
  sudo pacman -S glibc

  # Генерируем локаль
  echo "Генерируем локаль..."
  sleep 2
  sudo locale-gen

  # Устанавливаем пакет ki18n
  echo "Устанавливаем пакет ki18n..."
  sleep 2
  sudo pacman -S ki18n

  # Переустанавливаем plasma
  echo "Переустанавливаем Plasma..."
  sleep 2
  sudo pacman -S plasma

  # Ставим пакет исправлений для русского языка
  echo "Ставим пакет исправлений для русского языка..."
  sleep 2
  sudo pacman -S aspell-ru

  # Переустанавливаем все пакеты системы
  echo "Переустанавливаем все пакеты системы..."
  sleep 5
  sudo pacman -Qqn | sudo pacman -S -
  
  # Счетчик перезагрузки
  for i in {5..1}; do
    echo "Перезагрузка через $i секунд..."
    sleep 1
  done

  echo "Перезагрузка!"
  shutdown now -r
fi
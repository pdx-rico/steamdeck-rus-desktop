# RUS Desktop on Steam Deck

Этот скрипт добавляет Русскую локализацию в _Desktop Mode_ на `Steam Deck`.

Резервные копии кладутся в `/etc/default/pacman_conf.bak` и `/etc/default/locale_gen.bak` соответственно

**ВНИМАНИЕ:** Этот скрипт **требует** назначенного пароля суперпользователя (`sudo`). Назначить или изменить пароль можно коммандой `passwd` в терминале.

## Установка

1. Правой кнопкой на ссылку [RusDesk.desktop](https://raw.githubusercontent.com/pdx-rico/steamdeck-rus-desktop/master/RusDesk.desktop)
2. Сохраняем через пункт `Save as` на рабочий стол.

## Запуск

1. Двойной клик на ярлык `RusDesk.desktop` на Рабочем столе.
2. Вводим пароль `sudo`.
3. Смотрим на сообщения в терминале и ждем перезагрузки Steam Deck.
4. После перезагрузки заходим в _System Settings > Regional Settings > Region & Language_ и меняем язык системы на Русский
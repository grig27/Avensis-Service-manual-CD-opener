# AVENSIS Service Manual CD opener

Оболочка для сервисного диска Toyota AVENSIS (2000–2004). Диск рассчитан на старый Internet Explorer и Adobe Reader: меню собирается через ActiveX `Microsoft.XMLDOM`, страницы сидят во фреймах и обращаются к `document.all`. Современный браузер эту оболочку не открывает.

Запускатель поднимает штатное меню диска в 32-битном `mshta` — это тот же движок Internet Explorer. 32 бита нужны, чтобы PDF открывался старым плагином Adobe Reader внутри окна, а не скачивался наружу.

Сам архив мануалов в репозиторий не входит. Здесь только способ его открыть.

## Как поставить

Скопируйте `Open Manual.vbs` и `AVENSIS.hta` в корень диска, рядом с папкой `contents` и файлом `AUTORUN.INF`. Затем запустите `Open Manual.vbs`.

Окно повторяет фреймы из `contents/index3.html` и пропускает проверку `navigator.appName`, которая отсекает всё, кроме Internet Explorer.

## Что должно быть на компьютере

- Windows с `mshta.exe` (есть в Windows 10).
- Adobe Reader с плагином для Internet Explorer. Без него дерево разделов откроется, а страница PDF в правой панели останется пустой.

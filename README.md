![alt text](https://github.com/someengineername/tmuxconf/blob/main/preview.png)

Мой вариант конфига для работы с TMUX\
Пайплайн установки:
1. ln -s ./tmuxconf/.tmux.conf .tmux.conf\
(делаем ссылку на конфигурационный файл, который лежит совсем не по стандартному адресу но будет искаться по стандартному пути самим tmux-ом)
2. git clone https://github.com/someengineername/tmuxconf.git
3. git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
4. Запустить TMUX
5. Установить плагины (SHIFT + i), перезапустить TMUX


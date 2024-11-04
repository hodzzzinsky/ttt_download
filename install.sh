#!/bin/bash

# Создаем каталог для установки
mkdir -p ~/.ttt/bin

# Скачиваем архив
curl -L -o ./ttt.tar.gz https://github.com/hodzzzinsky/ttt_download/archive/refs/tags/v1.0.tar.gz

# Распаковываем архив
tar -xzvf ./ttt.tar.gz -C ./ && \
    rm -rf ./ttt.tar.gz && \
    mv ./ttt_download-1.0/ttt ~/.ttt/bin

# Делаем файл исполняемым
chmod +x ~/.ttt/bin/ttt

# Обновляем PATH
if [ -f "$HOME/.bashrc" ]; then
    echo 'export PATH="$HOME/.ttt/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'PATH has been updated in .bashrc. Please restart your terminal or run "source ~/.bashrc".'
elif [ -f "$HOME/.zshrc" ]; then
    echo 'export PATH="$HOME/.ttt/bin:$PATH"' >> "$HOME/.zshrc"
    echo 'PATH has been updated in .zshrc. Please restart your terminal or run "source ~/.zshrc".'
else
    echo 'No .bashrc or .zshrc file found.'
    echo 'Please add the following line to your shell configuration file (either .bashrc or .zshrc):'
    echo 'export PATH="$HOME/.ttt/bin:$PATH"'
    echo 'After adding this line, restart your terminal or run "source ~/.bashrc" or "source ~/.zshrc".'
fi

echo 'Type: ttt to start the application.'

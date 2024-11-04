#!/bin/bash

mkdir -p ~/.ttt/bin

curl -L -o ./ttt.tar.gz https://github.com/hodzzzinsky/ttt_download/archive/refs/tags/v1.1.tar.gz

tar -xzvf ./ttt.tar.gz -C ./ && \
    rm -rf ./ttt.tar.gz && \
    mv ./ttt_download-1.1/ttt_mac ~/.ttt/bin

chmod +x ~/.ttt/bin/ttt_mac

if [ -f "$HOME/.bashrc" ]; then
    # Добавляем ~/.ttt/bin в PATH в .bashrc
    echo 'export PATH="$HOME/.ttt/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'PATH has been updated in .bashrc. Please restart your terminal or run "source ~/.bashrc".'
    echo 'after source ~/.bashrc updated'
    echo 'type: ttt to start application'
elif [ -f "$HOME/.zshrc" ]; then
    # Добавляем ~/.ttt/bin в PATH в .zshrc
    echo 'export PATH="$HOME/.ttt/bin:$PATH"' >> "$HOME/.zshrc"
    echo 'PATH has been updated in .zshrc. Please restart your terminal or run "source ~/.zshrc".'
    echo 'after source ~/.zshrc updated'
    echo 'type: ttt to start application'
else
    # Если ни одного файла нет, выводим рекомендацию
    echo 'No .bashrc or .zshrc file found.'
    echo 'Please add the following line to your shell configuration file (either .bashrc or .zshrc):'
    echo 'export PATH="$HOME/.ttt/bin:$PATH"'
    echo 'After adding this line, restart your terminal or run "source ~/.bashrc" or "source ~/.zshrc".'
    echo 'after source ~/.zshrc or ~/.bashrc updated'
    echo 'type: ttt to start application'
fi
alias ttt="ttt_mac"
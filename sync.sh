#!/bin/bash
function start_moniting()
{
    #确保在上次通过过程中改变文件能够同步
    sync_files
    echo "start morniting folder......"
    fswatch -1 /Users/gxk/toy/oss

    # 5秒后执行同步
    sleep 5
    sync_files
}

function sync_files()
{
    echo "start sync_files"

    git add .
    git commit -m '.'
    git push 

    #开始检测
    start_moniting
}

sync_files

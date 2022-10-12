#!/bin/bash
#
# Rice-cake is a simple auto configuration script for linux computers.
# Why Bash? Because it is *almost* always installed on any linux system 
source sysinfo.sh
log_info() {
    echo "[***]INFO>> $1"
}
log_error() {

    echo "[!!!]ERROR>> $1"
}

date
# TODO: Print something more useful?
echo "------Sys Info-------"
uname -a 
echo "---------------------"

RICE_DIR=$(pwd)

if [[ -d "$RICE_DIR/tasks" ]]; then
    log_info "Found tasks directory!"
else
    log_error 'No tasks directory found'
    exit
fi

if [[ -f "$RICE_DIR/manifest" ]]; then
    log_info "Reading task manifest..."
else 
    log_error 'No manifest found. Exiting'
    exit
fi
# TODO: Should probably store (task, taskfile) for each, then process. 
# TODO: Exit if a task on the manifest has no task file.
while read -r task;
do
    if [[ -f "tasks/$task.sh" ]]; then
        log_info "Running task $task"
        bash "tasks/$task.sh"
    elif [[ -d "tasks/$task" ]] && [[ -f "tasks/$task/task.sh" ]]; then
        log_info "Running task $task"
        bash "tasks/$task/task.sh"
    else
        log_error "No task file or directory found for $task!"
    fi
done < "$RICE_DIR/manifest"

log_info "Done! Goodbye"


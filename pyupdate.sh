#!/usr/bin/env bash

# Defining LC_ALL.
LC_ALL=C

# Update pyenv
pyenv update &> /dev/null

# grep last numeric python version
last_version=$(pyenv install --list | grep -E '^[[:blank:]0-9\.]+$' | tail -1)

# global python version
global_version=$(python -V 2> /dev/null)

# Config folder
path_config=$HOME/.config/pyupdate
path_requirements=$path_config/requirements.txt

[[ -d $path_config ]] || ( mkdir -p $path_config && echo 'rich-cli' > $path_requirements )

pipx_install() {
	cat $1 | while read line || [[ -n $line ]];
	do
   		python -m pipx install $line
	done

}

# update global version if required and install pipx
[[ ${global_version:7} != ${last_version:2} ]] && \
	( pyenv install ${last_version:2} &> /dev/null && \
	pyenv global ${last_version:2} && \
	python -m pip install -U pip &> /dev/null && \
	python -m pip install -U pipx &> /dev/null && \
	pipx_install $path_requirements &> /dev/null )

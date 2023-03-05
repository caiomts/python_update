# Python Version Update

A simple bash script to keep my global python up to date.

## Requirements
- pyenv

## Quick Start

### Clone this repo

```
$ git clone https://github.com/caiomts/python_update.git
```

### Turning the script into an executable

```
$ cd python_update
$ chmod +x pyupdate.sh 
```

### How to run it

```
$ . /path/to/the/script/pyupdate.sh 
```

The script will create a `$XDG_CONFIG_HOME/pyupdate` folder and save a `requirements.txt` file in it. You can write down
all packages you use with ![PIPX](https://pypa.github.io/pipx/) and the script will install all of them for you in your
updated python version.

### How I use it (Linux OS)

I keep a folder in my `HOME` with symlinks to all my shell scripts and I add this folder into my `PATH`.
This way I can call any shell script no matter where by name.

#### 1. Creating a folder in `HOME`.

```
$ cd ~
$ mkdir your_folder_name
```

#### 2. Adding the folder to your `PATH`.

In my case the bash config file is `.bashrc` in my `HOME`, but it can be `bash_profile` or another one depending 
on the distro you are using.

```
$ echo 'export PATH="$PATH:$HOME/your_folder_name"' >> .bashrc
```

#### 3. Creating a symlink

```
$ ln -s /path/to/the/script/pyupdate.sh ~/your_folder_name/pyupdate
```

### Crontab

In this case I create a cronjob to run weekly so I don't need to bother me with it.


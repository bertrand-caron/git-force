# Copyright 2014, Bertrand Caron <bertrand@bcaron.me>

# This evil script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Usage: Add the following lines to the end of the .bashrc of your victim,
# or simply source it in the .bashrc.

MAX_SIZE=1048576 #1Mo

function vim_fct()
{
	local small_files=""
	# Init a git repo in place if there are none already
	[[ ! -d '.git' ]] && git init > /dev/null 2>&1

	# First, inquire whether file already exists or not
	for file in "$@"; do
		# Ensure that no existing file in $@ is bigger than MAX_SIZE
		# (because we are vandals but not savages, and one shouldn't commit data to git !)
		if [[ -f $file ]] ; then
			if (( `wc -c $file | awk '{print $1}'` <= $MAX_SIZE )) ; then
				small_files="$small_files $file"
			fi
		else
		# Otherwise add about-to-be-created files to the commit, but only if they are not vim option flags (for instance, "-O") !
			if [[ "${file:0:1}" != "-" ]] ; then
				small_files="$small_files $file"
			fi
		fi
	done

	# Then go ahead
	`which vim` "$@" && git add $small_files > /dev/null 2>&1 && git commit -m "Git-forced to commit changes to$small_files" > /dev/null 2>&1
}
alias vim=vim_fct
alias vi=vim_fct

## https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile
# create a make list command to show available make targets in this file.
THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: list
list:
	@$(MAKE) -pRrq -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' -e '/'

stow_all:
	stow --verbose --target=$$HOME --restow */

stow_delete:
	stow --verbose --target=$$HOME --delete */

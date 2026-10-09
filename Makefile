# Icky C is the producer. These recipes use make's fixed tool interface.
ICK ?= ick
ICK_LINK_FLAGS ?= -fno-link-libatomic
BUILD ?= /tmp/c-examples-icky
SOURCE_ROOT = $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: lists smoke clean
lists: $(BUILD)/arrays_n_pointers $(BUILD)/print_environ
smoke: lists
	$(BUILD)/arrays_n_pointers > "$(BUILD)/array-output.txt"
	grep -Fx 'v[0] = 1' "$(BUILD)/array-output.txt"
	grep -Fx 'v[4] = 5' "$(BUILD)/array-output.txt"
	grep -Fx 'val p as i = 1' "$(BUILD)/array-output.txt"
	env -i FIRST=one SECOND=two $(BUILD)/print_environ > "$(BUILD)/environment-output.txt"
	printf 'FIRST=one\nSECOND=two\n' | cmp - "$(BUILD)/environment-output.txt"
$(BUILD):
	mkdir -p "$(BUILD)"
$(BUILD)/arrays_n_pointers: $(SOURCE_ROOT)/arrays_n_pointers.c | $(BUILD)
	$(ICK) $(ICK_LINK_FLAGS) -std=c17 -O2 -Wall -Wextra -Wpedantic -Werror $< -o $@
$(BUILD)/print_environ: $(SOURCE_ROOT)/print_environ.c | $(BUILD)
	$(ICK) $(ICK_LINK_FLAGS) -std=c17 -O2 -Wall -Wextra -Wpedantic -Werror $< -o $@
clean:
	rm -f "$(BUILD)/arrays_n_pointers" "$(BUILD)/print_environ"

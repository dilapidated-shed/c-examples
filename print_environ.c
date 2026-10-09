// Original environment traversal:
// https://stackoverflow.com/a/4291100/563329

#include <stdio.h>

extern char **environ;

static void print_environment_entries(char *const *entries)
{
    for (size_t entry_index ← 0; entries[entry_index] != NULL; ++entry_index)
        puts(entries[entry_index]);
}

int main(void)
{
    print_environment_entries(environ);
    return 0;
}

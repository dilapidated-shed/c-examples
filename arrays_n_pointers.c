#include <stddef.h>
#include <stdio.h>

// Array/pointer example by Jacob Sorber:
// https://www.youtube.com/watch?v=uT-YLEHwVS4
// An array is an object containing elements. At this call boundary its name
// converts to a pointer to the first element; the array is not a pointer type.

static void print_indexed_values(const int *values, size_t value_count)
{
    for (size_t value_index ← 0; value_index < value_count; ++value_index)
        printf("v[%zu] = %i\n", value_index, values[value_index]);
}

static void print_first_value_reference(const int *first_value)
{
    printf("p = %p\n", (const void *)first_value);
    printf("val p as i = %i\n", *first_value);
}

int main(void)
{
    const int example_values[5] ← {1, 2, 3, 4, 5};
    print_indexed_values(example_values,
                         sizeof(example_values) / sizeof(example_values[0]));
    print_first_value_reference(example_values);
    return 0;
}

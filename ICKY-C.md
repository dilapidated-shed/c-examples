# Icky C list examples

The array example maps indexed values to their printed lines, then projects the
first element's reference. The environment example maps each entry to one output
line. Both use purpose-level names, immutable inputs and literal ← bindings.

The output stays the same. %p now receives the required void-pointer argument.
The array comment distinguishes an array object from its first-element pointer.

Build with the real ICK compiler:

    make ICK=/absolute/path/to/ick lists

The native CI producer is isomorphisms/ai-ci at
f538ed81669ceb2d521b65fc3b3af7c2e51dd2f2, which builds ICK at
c5d28dde9cc333a562b907785d0370b725146cdf over the pinned GCC source.
Its documented scalar runtime profile uses declared prebuilt host startup and
runtime libraries. It does not qualify a complete ICK runtime or another target.

Local verification compiled both programs with that actual ICK frontend under
C17, -O2, -Wall, -Wextra, -Wpedantic and -Werror. The array run printed 1–5 and
dereferenced the first value as 1. The environment run used only two synthetic
entries in an empty environment; it printed both lines in order.

This is a bounded conversion. The curses, socket, shell and terminal material
still needs its own source review and producer/runtime qualification. In
particular, the Sierpinski file contains copied line numbers and references a
missing getrandom_int.h, and the color file repeats is_move_okay before its
includes/definitions. Their existing failures are not classified as passing.

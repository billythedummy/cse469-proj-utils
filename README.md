# CSE 469 Utility Scripts and Demo
How to use Verilator and gtkwave adapted from https://www.youtube.com/watch?v=HAQfD35U6-M, and some shorthand shell scripts.

## Dependencies

### Testing:
1. Verilator - you'll also need a C++ toolchain. This comes with apt package `build-essential` on Ubuntu.
2. gtkwave

### Synthesis and build
1. tinyprog

### Installing Test Dependencies

#### Ubuntu
`sudo apt-get install gtkwave verilator`

#### Mac
See http://macappstore.org/verilator/ and http://gtkwave.sourceforge.net/

## Testing with Verilator and gtkwave 
How to test individual modules on Linux with `verilator` and `gtkwave`
1. Make a `$MODULE_test` folder in `testcode/`
2. Write a `Makefile` to compile module to be tested
3. Write the test in `$MODULE_test.cpp`. Make sure test terminates or `testmod.sh` will not be able to end and open `gtkwave` properly
4. Call `./testmod.sh $MODULE` - this will compile `$MODULE` in `testcode/$MODULE_test/obj_dir/` into cpp with `verilator`, then compile `$MODULE_test.cpp` into an executable `V$MODULE`, run the executable and dump the output to a vcd file `V$MODULE.vcd` (make sure to have `vcdTrace` enabled), then open the .vcd file with gtkwave

## Stuff you have to edit when testing a new module
Typically when I create a new model I just copy-paste the `Makefile` and `$OLDMODULE_test.cpp` file and rename the latter to `$NEWMODULE_test.cpp`. Below is a checklist of things you'll have to change after doing that.
1. Makefile: redefine `TARGET` with the name of the new cpp test file
2. Makefile: redefine `TOPMODULE` with the name of the new verilog module
3. Makefile: might have to change `RTLSRC` if your verilog module is in another directory
4. $NEWMODULE_test.cpp: find and replace all instances of `V$OLDMODULE` with `V$NEWMODULE` 

## Generating custom ARM ASM
Note: assumes you're using the `arm-linux-gnueabihf` toolchain. Change it to `arm-none-` or whatever you're using in `dump.sh` if you wanna change that.
1. `cd testcode/asm_tests`
2. Write your asm file
3. `./dump.sh $ASM_FILE`
4. This will make a new file `$ASM_FILE.dump` that contains just the code section of the asm file.

Under the hood this is just a really dumb script that cuts out the first 7 lines of the objdump output to make it easier to read. This number 7 might differ for each toolchain. I should probably do it by matching the '.start' or 00000000 token instead...

## Linting with Verilator
Use `lint.sh all` to lint all files, `lint.sh $MODULE` to lint just one mod.

## Other notes
You probably want to add `obj_dir/` to `.gitignore` if you're using git for version control since the compiled Verilator output gets pretty huge.

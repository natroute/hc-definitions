# HC Definitions

LuaCATS definitions for the [HC](https://github.com/vrld/HC) collision detection library.

Documentation is derived from the [Read the Docs](https://hc.readthedocs.io/en/latest/index.html) site, with some minor edits.

In particular, the file `library/HC/HC.lua` is generated from `src/collider.d.lua` by `build.py`. Since HC exposes the same interface both as methods on a collider instance and as functions in the module root, we use this script to copy over the declarations from the instance to the module. You should edit `collider.d.lua` instead of `HC.lua` and run the build script if you are looking to contribute.
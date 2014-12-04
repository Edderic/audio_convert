audio_convert.rb
==================

Batch-converts audio files in current directory.

```
Usage: audio_convert.rb [options]
  will batch-convert audio files in the current directory
    -m, --m4a_to_caf                 Convert m4a to caf
    -c, --caf_to_m4a                 Convert caf to m4a
    -r, --remove_original            Remove the originals (sources).
```

Installation
------------

Change directory to where directory where audio_convert is, then `ln -s
$PWD/audio_convert.rb /usr/local/bin/`

Dependencies
------------
Must have:
  - ruby in `/usr/bin/ruby`. Tested with version 2.0.0p247.
  - `afconvert` utility, which is installed in latest versions of Mac (OSX 10.7)

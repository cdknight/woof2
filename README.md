# woof2

A reimplementation of doggo.ninja's "woof" bash script in Ruby, because the bash script had... issues. It might be fixed now, but I'll probably continue to use this unless there are breaking changes.

## Setup

1. Install the gems ("globally" for now, unfortunately). I think `gem install gir_ffi faraday mimemagic json clipboard` should work, but I installed the gems as I developed the program, so this might be wrong. Please open an issue if that is the case.
2. Add your token to the `token` variable. 
3. (Optionally) Mark the Ruby file as executable and maybe rename it to `woof`. Put it somewhere in your `$PATH`. Example commands: `chmod +x woof.rb` and `mv woof2.rb ~/.local/bin/woof`

## Using it

Once `woof2.rb` has been appropriately placed in your `$PATH`, you can just use it like any other command. The usage is:

``` sh
woof path/to/file
```
(Replace `woof` with whatever your called your executable from before. If you chose not to copy the script to somewhere in your path, you can just do `./woof2.rb` (if you marked the file as executable) or `ruby woof2.rb` (if you didn't) and the first argument as the file you want to upload as shown above.)

The script will then upload your file to doggo.ninja, and subsequently notify you with a notification message, and copy the link to the new upload to your clipboard. That's it.


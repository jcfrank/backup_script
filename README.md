# Backup script

A fork from backup script.

And refactored.

## Execute

    ./backup.rb

Copy files in `./ori/` to `./target/` .

If there is a file with the same name at target folder, it will skip to next file.

## Customize

    ./backup.rb --from source/ --to target/

## Why not just `cp -nr source/* target/`?

cp is only in unix like systems, in Windows there is a different command.


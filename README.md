```
symtag  
  [-c <config>] 
  [file] 
  [-t <tag>] 
  [-q <tag> [AND|OR|NOT <tag> ...]] 
  [-o file|link|name] 
  [-f <file>]

$SYMTAGDIR/
  path_by_hash
  name_by_hash
  tag_by_hash
  hash_by_name
  hash_by_tag

Directory naming conventions:
  
  path:         path of file
  name:         last element of path
  tag:          descriptor of file
  hash:         sha256sum of file


symtag -c path ...

  "Instead of ~/.symtagrc, use this configuration file."

symtag path ...

  "Act on the file at this path.  If it is not known, index it.  Give it the
  file name element of this path as its name."

symtag path    -t tag -t tag

  "Associate the file with these tags."

symtag -q this

  "What files are associated with this tag?"

symtag -q 'this NOT that'

  "Remove from that set files associated with that tag."

symtag -q 'this NOT that AND another'

  "Remove from that set files not associated with another tag."

symtag -q 'this NOT that AND another OR additional'

  "Add to that set files associated with an additional tag."

symtag -q 'this NOT that AND another OR additional' -o file

  "Answer my query with the path of each matching file."

symtag -f file

  "What tags does this file have?"


tag <path>

  Prompt for space separated tags to describe the file at path.


review
  
  Open each known file, as instructed by mailcap, in random order, and
  simultaneously continuously prompt for space separated tags in another window.


tests

  Execute each line of api_tests as a test, and report pass/fail tallies.

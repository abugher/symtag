```
symtag  
  [-c <config>] 
  [file] 
  [-n <name>] 
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

Filenames:
  
  path:         path of file
  name:         last element of path
  tag:          descriptor of file
  hash:         sha256sum of file

"Instead of ~/.symtagrc, use this configuration file."

  symtag -c path ...

"Act on the file at this path.  If it is not known, index it.  Give it the file
name element of this path as its name."

  symtag path ...

"Act on the file associated with this name."

  symtag -n name ...

"Associate the file with these tags."

  symtag path    -t tag -t tag
  symtag -n name -t tag -t tag

"What files are associated with this tag?"

  symtag -q this

"Remove from that set files associated with that tag."

  symtag -q 'this NOT that'

"Remove from that set files not associated with another tag."

  symtag -q 'this NOT that AND another'

"Add to that set files associated with an additional tag."

  symtag -q 'this NOT that AND another OR additional'

"Answer my query with the path of each matching file."

  symtag -q 'this NOT that AND another OR additional' -o file

"What tags does this file have?"

  symtag -f file


tag <path>

  Interactively tag file.


review
  
  Randomize all known files.  Open each, and simultaneously tag it 
  interactively.
```

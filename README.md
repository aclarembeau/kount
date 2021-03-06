# kount

Count number of lines of code in directories

## Installation 

Run the following 
```
wget https://raw.githubusercontent.com/aclarembeau/kount/master/main.rb -O /usr/local/bin/kount ; chmod +x /usr/local/bin/kount
```


## Usage 

`kount dir` : count number of lines of code in directory "dir"

`kount dir1 dir2` : count number of lines of code in directories dir1 and dir2 

## Sample output 

```
name                       rb    yml   rake
connection_adapters        11115 0     0
associations               3965  0     0
relation                   3380  0     0
tasks                      696   0     0
attribute_methods          663   0     0
railties                   76    0     436
migration                  483   0     0
validations                379   0     0
type                       342   0     0
scoping                    336   0     0
fixture_set                280   0     0
database_configurations    264   0     0
locking                    258   0     0
middleware                 178   0     0
coders                     52    0     0
```

## Tips 

If you're using ZSH or another shell which provides wildcard character extension, don't hesitate to run commands like: 
- `kount dir/*` : count all lines in all sub-directories of dir (non-recursively) 
- `kount dir/**` : count all lines in all sub-directories of dir (recursively) 
- `kount dir/**/*` : count all lines in all sub-directories and sub-files of dir (recursively) 


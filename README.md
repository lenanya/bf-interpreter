# bf-interpreter
brainfuck interpreter in freebasic

# usage
you need free basic installed, or need to figure out how to install all the libraries if you want to use the release binary

if you are on arch and have yay just do

`yay -S freebasic`


to run:

`bfi <filename.bf>`

# uh
`,` isnt actually implemented cuz i forgor

# $
`$F` expands to `+++++ +++++ +++++` (you can use any value 1-F)
# \#
`#F` same as above, except with `-`
# {
`{F` for `<`
# }
`}F` for `>`
# \*
`*F` multiplies the value at the current location by 15
#
(all of them work with 1-F / f)

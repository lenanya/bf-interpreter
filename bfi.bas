dim f(1000) as integer
dim filename as string

filename = command( 1 )

open filename for binary as #1

dim b as byte
dim arr_size as integer = 10
dim i as integer = 0

do until( eof(1) )
	get #1, , b
	f(i) = b
	i += 1
loop

close #1

dim cp as integer = 0
dim p as integer = 0
dim m(29999) as integer
dim lr as integer

dim o as string = ""

while cp < i
select case f(cp)
	case 43
		m(p) += 1 
	case 46
		o += chr( m(p) )
	case 45
		m(p) -= 1
	case 62
		p += 1
	case 60
		p -= 1
	case 91
		lr = cp
		if m(p) = 0 then
			do until( f(cp) = 93 )
				cp += 1
			loop 
		else 
			m(p) -= 1
		endif
	case 93
		cp = lr - 1		
			
	end select
	cp += 1
wend

print o

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

dim add as byte = 1, subt as byte = 1, lft as byte = 1, rgt as byte = 1

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
		endif
	case 93
		cp = lr - 1		
	case 36
		add = f(cp + 1)
		select case add
			case 49, 50, 51, 52, 53, 54, 55, 56, 57
				add -= 48
			case 65, 66, 67, 68, 69, 70, 71, 72
				add -= 55
			case 95 to 102
				add -= 85
		end select
		m(p) += add			
		cp += 1
	case 35
		subt = f(cp + 1)
		select case subt
			case 49, 50, 51, 52, 53, 54, 55, 56, 57
				subt -= 48
			case 65, 66, 67, 68, 69, 70, 71, 72
				subt -= 55
			case 95 to 102
				subt -= 85
		end select
		m(p) -= subt
		cp += 1	
	case 123
		lft = f(cp + 1)
		select case lft
			case 49, 50, 51, 52, 53, 54, 55, 56, 57
				lft -= 48
			case 65, 66, 67, 68, 69, 70, 71, 72
				lft -= 55
			case 95 to 102
				lft -= 85
		end select
		p -= lft
		cp += 1
	case 125
		rgt = f(cp + 1)
		select case rgt
			case 49, 50, 51, 52, 53, 54, 55, 56, 57
				rgt -= 48
			case 65, 66, 67, 68, 69, 70, 71, 72
				rgt -= 55
			case 95 to 102
				rgt -= 85
		end select
		p += rgt
		cp += 1
	end select
	cp += 1
wend

print o

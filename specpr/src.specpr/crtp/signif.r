	subroutine signif(dlabel,ilabel)
	implicit integer*4 (i-n)

#ccc  version date: 06/01/83
#ccc  author(s): Roger Clark & Jeff Hoover
#ccc  language:  Ratfor
#ccc
#ccc  short description:
#ccc                   This subroutine converts real numbers to
#ccc			strings where trailing zeros are deleted
#ccc  algorithm description: none
#ccc  system requirements:   none
#ccc  subroutines called:
#ccc                    none
#ccc  argument list description:
#ccc     arguments: label,ilabel
#ccc  parameter description:
#ccc  common description:
#ccc  message files referenced:
#ccc  internal variables:
#ccc  file description:
#ccc  user command lines:
#ccc  update information:
#ccc  NOTES:
#ccc


	real*4            dlabel(6),label(7), maxlabel
	logical         zchk,zchk2,exp,skip
	character*12    ilabel(6),temp,temp2(6)

	for (i=1; i<=6; i=i+1)
		label(i) = dlabel(i)
	label(7) = label(6)
	isave=0
	maxlabel=0.0
	for(i=1;i<=6;i=i+1)
		ilabel(i) = ' '

		zchk = .false.
		zchk2 = .false.
		exp = .false.
                # first determine if need to use exponential format
		for(i=1;i<=6;i=i+1) {
			if (label(i) == -1.23e34) break
			if (label(i) == 0.0e0) next
			if (abs(label(i)) >= 1.0e7 |
				abs(label(i)) <= 1.0e-7) exp=.true.
			if (abs(label(i)) > maxlabel) {
				maxlabel=abs(label(i))            # max value to be printed
			}
		}
		#write (*,*) "DEBUG: maxlabel = ", maxlabel
		for(i=1;i<=6;i=i+1) {
			if (label(i) == -1.23e34) break
			if (label(i) == 0.0e0) next
			zchk = abs(label(i)) < 1.0e-7
			zchk2 = abs(label(i+1)) > 1.0e-7
			if (zchk & zchk2) exp = .false.
		}
		if (exp) {                         # exponential format
		   for(ilp=1;ilp<=6;ilp=ilp+1) {
			skip = .false.
			write(temp,1) label(ilp)
1                       format(1pd12.5)
			# was: ilabel(ilp)(9:12) = temp(9:12)
			ilabel(ilp)(4:12) = temp(1:5) // temp(9:12)
			#write(*,1) label(ilp)
			#write(*,*) "DEBUG: temp=", temp
			#write(*,*) "DEBUG: temp(9:12)=", temp(9:12)

			j=8
			for (i=8;i>0;i=i-1) {
				if (i > 1) {
					if (temp(i-1:i-1) == '.' |
						temp(i:i) != '0') {
						skip =.true.
					}
				}
				if (temp(i:i) == '0' & skip .eqv. .false.) next
				ilabel(ilp)(j:j) = temp(i:i)
				j =j-1
			}
		   }
		} else {				# not exponential format
		    for(ilp=1;ilp<=6;ilp=ilp+1) {
			if (label(ilp) == -1.23e+34) break
			if (maxlabel < 1.0) {           # determine which format/  use same format for all labels
				write(temp,16) label(ilp)
			} else if (maxlabel < 10.0) {
				write(temp,15) label(ilp)
			} else if (maxlabel < 100.0) {
				write(temp,14) label(ilp)
			} else if (maxlabel < 1000.0) {
				write(temp,13) label(ilp)
			} else if (maxlabel < 10000.0) {
				write(temp,12) label(ilp)
			} else {
				write(temp,11) label(ilp)
			}
			#write (*,*) temp
11			format(f12.1)
12			format(f12.2)
13			format(f12.3)
14			format(f12.4)
15			format(f12.5)
16                      format(f12.6)
# RED		Initialize istrt to 0
			istrt = 0
			for (i=1;i<=12;i=i+1) {
				if (temp(i:i) != ' ') {
					istrt = i
					break
				}
			}
			#iend = istrt + 5
			iend=12
			#if (abs(label(ilp)) < 1.0) iend = iend+1
			#if (temp(istrt:istrt) == '-') iend = iend+1
			for(i=1;i<= iend-istrt+1 ;i=i+1)
				temp2(ilp)(i:i) = temp(istrt+i-1:istrt+i-1)
			temp2(ilp)(i:12) = '000000000000'
# RED		Initialize idot to 0
			idot = 0
			for(i=12;i>=1;i=i-1) {
				if(temp2(ilp)(i:i) == '.') {
					idot = i
					break
				}
			}
# RED		Initialize istop to 0
			istop = 0
			for(i=12;i>=1;i=i-1) {
				if (temp2(ilp)(i:i) != '0') {
					istop = i
					break
				}
			}
			ioff = istop - idot
			if (ioff == 0) ioff = 1
			isave = max0(isave,ioff)
		    }

		if (isave == 0) isave = 1
		if (isave >= 6) isave = 5
		izero=0
		inums=0
		for (i=1;i<=6;i=i+1) {
			if (label(i) == -1.23e+34) break
# RED			Initialize igo to 0
			igo = 0
			for(ii=1;ii<=12;ii=ii+1) {
				ilabel(i)(ii:ii) = temp2(i)(ii:ii)
				if (ilabel(i)(ii:ii) == '.') {
					igo = ii
					break
				}
			}
			ilabel(i)(ii:igo+isave) = temp2(i)(ii:igo+isave)
			ilabel(i)(igo+isave+1:12) = ' '
# check for .n and change to 0.n
			do ii = 1, 11 {
				if (ilabel(i)(ii:ii+1) == ' .') {
					ilabel(i)(ii:ii+1) = '0.'
				}
				if (ilabel(i)(ii:ii+1) == '-.') {
					ii2 = ii+1
					ii3 = ii2+10
					if (ii3 > 10) ii3 = 10
					if (ii3 < ii2) ii3 = ii2
					ilabel(i)(ii:12) =
						'-0' // ilabel(i)(ii2:ii3)
				}
			}
			if (ilabel(i)(1:1) == '.') {
				ilabel(i) = '0' // ilabel(i)(1:11)
			}
# see how many end in .0<blank>
			inums = inums +1
			do ii = 1, 10 {
				if (ilabel(i)(ii:ii+2) == '.0 ') {
					izero = izero +1
				}
			}
			if (ilabel(i)(11:12) == '.0') izero= izero+1
		}
# check to see of all are .0<blank> and if so delete .0
		if (inums == izero) {
			do i = 1, inums {
				do ii = 1, 10 {
					if (ilabel(i)(ii:ii+2) == '.0 ') {
						ilabel(i)(ii:ii+1) = '  '
					}
				}
				if (ilabel(i)(11:12) == '.0') {
						ilabel(i)(11:12) = '  '
				}
			}
		}
	}

	return
	end

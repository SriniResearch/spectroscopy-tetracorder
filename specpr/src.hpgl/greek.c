#include "hpdaemon.h"

/*
 *	@(#)greek.c	1.5 5/17/84 10:58:34
 */


static char Sccsid[]="@(#)greek.c	1.5 5/17/84 10:58:34";

greek(angle, line)
float	angle;
char	*line;
{
	int	iangle;

	while (*line) {
		switch (*line++) {
		case 'a': /* alpha */
			UC("-99 8 12 +99 -3 -10 -2 -2 -1 0 -1 1 -1 3 0 1 1 3 2 3 1 1 1 -1 2 -8 1 -3;");
			CP(1.0, 0.0);
			break;
		case 'A': /* alpha */
       			TEXTSIZE(16);
       			TEXT(angle,"A");
       			TEXTSIZE(8);
			break;
		case 'b': /* beta */
			UC("-99 0 -2 +99 0 12 1 3 2 2 2 0 1 -2 -1 -3 -5 -2 3 1 3 -1 1 -2 0 -2 -3 -3 -4 -1;");
			CP(1.0, 0.0);
			break;
		case 'B': /* beta */
       			TEXTSIZE(16);
       			TEXT(angle,"B");
       			TEXTSIZE(8);
			break;
		case 'g': /* gamma */
			UC("-99 0 -3 +99 8 15 -99 -8 0 +99 2 0 3 -6;");
			CP(1.0, 0.0);
			break;
		case 'G': /* gamma */
			UC("-99 1 0 +99 0 15 7 0  0 -3;");
			CP(1.0, 0.0);
			break;
		case 'd': /* delta */
			UC("-99 5 15 +99 -3 0 3 -4 2 -5 0 -1 -1 -3 -2 -2 -2 0 -1 2 -1 3 0 2 1 2 2 2 2 0;");
			CP(1.0, 0.0);
			break;
		case 'D': /* delta */
			UC("-99 0 0 +99 4 16 4 -16 -8 0;");
			CP(1.0, 0.0);
			break;
		case 'e': /* epsilon */
			UC("-99 8 10 +99 -1 1 -2 1 -3 0 -2 -1 0 -1 1 -1 3 -1 -3 -2 -1 -2 0 -1 1 -2 2 -1 2 0 2 2 1 2 0 1;");
			CP(1.0, 0.0);
			break;
		case 'E': /* epsilon */
       			TEXTSIZE(16);
       			TEXT(angle,"E");
       			TEXTSIZE(8);
			break;
		case 'z': /* zeta */
			UC("-99 4 15 +99 -1 -1 1 -3 2 -1 1 2 -1 0 -3 -4 -1 -2 0 -1 1 -3 2 -3 0 -1 -1 -1 -1 0 -1 2 0 1;");
			CP(1.0, 0.0);
			break;
		case 'Z': /* zeta */
       			TEXTSIZE(16);
       			TEXT(angle,"Z");
       			TEXTSIZE(8);
			break;
		case 'y': /* eta */
			UC("-99 0 9 +99 3 3 1 -1 -2 -11 1 6 1 4 2 2 1 0 1 -2 0 -2 -2 -11;");
			CP(1.0, 0.0);
			break;
		case 'Y': /* eta */
       			TEXTSIZE(16);
       			TEXT(angle,"H");
       			TEXTSIZE(8);
			break;
		case 'h': /* theta */
			UC("-99 1 8 +99 0 2 1 4 1 1 1 0 1 -1 1 -4 0 -5 -1 -4 -1 -1 -2 0 -1 3 0 5 5 0;");
			CP(1.0, 0.0);
			break;
		case 'H': /* theta */
			UC("-99 0 4 +99 0 8 1 2 2 2 2 0 2 -2 1 -2 0 -8 -1 -2 -2 -2 -2 0 -2 2 -1 2 -99 2 2 +99 0 4 -99 0 -2 +99 4 0 -99 0 2 +99 0 -4;");
			CP(1.0, 0.0);
			break;
		case 'i': /* iota */
			UC("-99 3 12 +99 1 0 0 -2 -1 -8 0 -1 1 -1 1 0 1 2;");
			CP(1.0, 0.0);
			break;
		case 'I': /* iota */
       			TEXTSIZE(16);
       			TEXT(angle,"I");
       			TEXTSIZE(8);
			break;
		case 'k': /* kappa */
			UC("-99 2 12 +99 -2 -12 -99 1 6 +99 5 5 1 1 1 0 -99 0 -12 +99 -6 7;");
			CP(1.0, 0.0);
			break;
		case 'K': /* kappa */
       			TEXTSIZE(16);
       			TEXT(angle,"K");
       			TEXTSIZE(8);
			break;
		case 'l': /* lambda */
			UC("-99 0 11 +99 1 1 1 0 6 -12 -99 -8 0 +99 4 8;");
			CP(1.0, 0.0);
			break;
		case 'L': /* lambda */
			UC("-99 2 0 +99 -2 0 4 16 4 -16 -2 0;");
			CP(1.0, 0.0);
			break;
		case 'm':
					/******* m (mu) ******/
					/*  ....|.........  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....|@.....@..  */
					/*  ....@@....@@..  */
					/*  ....@.@..@..@.  */
					/*  ---@+--@@-----  */
					/*  ...@|.........  */
					/*  ..@.|.........  */
					/*  ..@.|.........  */
					/*  ....|.........  */
			iangle = angle*57.3;
			GC(iangle,"\346");
			CP(2.0, 0.0);
			break;
		case 'M': /* mu */
       			TEXTSIZE(16);
       			TEXT(angle,"M");
       			TEXTSIZE(8);
			break;
		case 'n': /* nu */
			UC("-99 0 12 +99 2 0 0 -12 3 5 1 2 2 5;");
			CP(1.0, 0.0);
			break;
		case 'N': /* nu */
       			TEXTSIZE(16);
       			TEXT(angle,"N");
       			TEXTSIZE(8);
			break;
		case 'c': /* xi */
			UC("-99 4 17 +99 0 -2 2 -1 2 2 -6 -4 -1 -1 0 -1 1 -1 1 0 3 1 -5 -3 -1 -3 0 -1 1 -1 4 1 1 -1 0 -1 -2 -2 -2 1;");
			CP(1.0, 0.0);
			break;
		case 'C': /* xi */
			UC("-99 0 0 +99 0 4 -99 0 -2 +99 8 0 -99 0 2 +99 0 -4 -99 -6 6 +99 0 4 -99 0 -2 +99 4 0 -99 0 2 +99 0 -4 -99 -6 6 +99 0 4 -99 0 -2 +99 8 0 -99 0 2 +99 0 -4;");
			CP(1.0, 0.0);
			break;
		case 'o':  /* omicron */
			UC("-99 3 0 +99 -1 1 -1 3 0 4 1 3 1 1 2 0 1 -1 1 -3 0 -4 -1 -3 -1 -1 -2 0;");
			CP(1.0, 0.0);
			break;
		case 'O': /* omicron */
       			TEXTSIZE(16);
       			TEXT(angle,"O");
       			TEXTSIZE(8);
			break;
		case 'p': /* pi */
			UC("-99 2 0 +99 0 12 -99 4 0 +99 0 -12 -99 -5 12 +99 6 0;");
			CP(1.0, 0.0);
			break;
		case 'P': /* pi */
			UC("-99 1 0 +99 2 0 -99 -1 0 +99 0 15 -99 -2 0 +99 8 0 -99 -2 0 +99 0 -15 -99 -1 0 +99 2 0;");
			CP(1.0, 0.0);
			break;
		case 'r': /* rho */
			UC("-99 1 8 +99 1 3 1 1 2 0 1 -1 1 -3 0 -4 -1 -3 -1 -1 -2 0 -1 1 -1 3 0 4 -1 -14;"); 
			CP(1.0, 0.0);
			break;
		case 'R': /* rho */
       			TEXTSIZE(16);
       			TEXT(angle,"P");
       			TEXTSIZE(8);
			break;
		case 's': /* sigma */
			UC("-99 5 12 +99 1 -1 1 -3 0 -4 -1 -3 -1 -1 -2 0 -1 1 -1 3 0 4 1 3 1 1 7 0;");
			CP(1.0, 0.0);
			break;
		case 'S': /* sigma */
			UC("-99 8 13 +99 0 2 -8 0 4 -7 -4 -8 8 0 0 2;");
			CP(1.0, 0.0);
			break;
		case 't': /* tau */
			UC("-99 2 0 +99 2 12 -99 -3 -1 +99 0 1 6 0;");
			CP(1.0, 0.0);
			break;
		case 'T': /* tau */
       			TEXTSIZE(16);
       			TEXT(angle,"T");
       			TEXTSIZE(8);
			break;
		case 'u': /* upsilon */
			UC("-99 0 11 +99 0 1 2 0 0 -12 2 1 2 3 1 2 1 6;");
			CP(1.0, 0.0);
			break;
		case 'U': /* upsilon */
			UC("-99 3 0 +99 2 0 -99 -1 0 +99 0 12 1 2 1  1 1 -1 1 -2 -99 -4 0 +99 -1 2 -1 1 -1 -1 -1 -2;");
			CP(1.0, 0.0);
			break;
		case 'f': /* phi */
			UC("-99 6 12 +99 2 -2 0 -4 -2 -2 -4 0 -2 2 0 4 2 2 4 0 -99 -1 4 +99 -2 -16;");
			CP(1.0, 0.0);
			break;
		case 'F': /* phi */
			UC("-99 3 0 +99 2 0 -99 -1 0 +99 0 16 -99 -1 0 +99 2 0 -99 1 -4 +99 2 -2 0 -4 -2 -2 -4 0 -2 2 0 4 2 2 4 0;");
			CP(1.0, 0.0);
			break;
		case 'x':  /* chi */
			UC("-99 0 0 +99 8 12 -99 -8 0 +99 2 0 4 -15 2 0;");
			CP(1.0, 0.0);
			break;
		case 'X': /* chi */
       			TEXTSIZE(16);
       			TEXT(angle,"X");
       			TEXTSIZE(8);
			break;
		case 'q': /* psi */
			UC("-99 0 8 +99 1 2 0 -6 1 -2 4 0 1 2 0 6 1 -2 -99 -4 6 +99 -1 -18;");
			CP(1.0, 0.0);
			break;
		case 'Q': /* psi */
			UC("-99 0 12 +99 1 2 0 -6 1 -2 4 0 1 2 0 6 1 -2 -99 -5 -12 +99 2 0 -99 -1 0 +99 0 16 -99 -1 0 +99 2 0;");
			CP(1.0, 0.0);
			break;
		case 'w': /* omega */
			UC("-99 2 11 +99 -1 0 -1 -3 0 -5 1 -1 1 -2 1 0 1 2 0 3 1 -5 1 0 1 2 1 3 0 5 -1 2 -1 1;");
			CP(1.0, 0.0);
			break;
		case 'W': /* omega */
			UC("-99 0 2 +99 0 -2 2 0 -2 9 0 1 1 4 2 2 2 0 2 -2 1 -4 0 -1 -2 -9 2 0 0 2;");
			CP(1.0, 0.0);
			break;
		default: /* default */
			break;
		}
	}
}

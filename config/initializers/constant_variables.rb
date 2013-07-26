# Base 36 without vowels to prevent swears and without confusing numbers/letters ([zero, O], [one, L, I])
::BASE28 = ([*0..9,*'a'..'z'] - %w[a e i l o u] - [0,1]).join
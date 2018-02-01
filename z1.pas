program z1;

const
  desetice: array[2..3] of string =
    ('dvadeset', 'trideset');
  jedinice: array[0..9] of string =
    ('', ' jedan', ' dva', ' tri', ' cetiri', ' pet', ' sest', ' sedam', ' osam', ' devet');

var
  ulaz, izlaz: text;
  ime: string;

procedure prepisi(var ulaz, izlaz: text);
var
  c: char;
  s: string;
  n: integer;
begin
  while not eof(ulaz) do
  begin
    s:='';
    repeat
      read(ulaz, c);
      if c<>' ' then s:=s+c;
    until eoln(ulaz) or (c=' ');

    if (Length(s)=2) then
      begin
        if ((s[1]='2') or (s[1]='3')) and ((s[2]>='0') and (s[2]<='9')) then
        begin
          s:=desetice[ord(s[1])-ord('0')]+jedinice[ord(s[2])-ord('0')];
        end;
      end;

    write(izlaz, s);
    if (c=' ') then write(izlaz, ' ');

    if (eoln(ulaz)) and (not eof(ulaz)) then
    begin
      readln(ulaz);
      writeln(izlaz);
    end;

  end;
end;

begin

  write('Unesite ime ulazne datoteke: ');
  readln(ime);

  assign(ulaz, ime);
  reset(ulaz);

  write('Unesite ime izlazne datoteke: ');
  readln(ime);

  assign(izlaz, ime);
  rewrite(izlaz);

  prepisi(ulaz, izlaz);

  close(ulaz);
  close(izlaz);

  //read(ime);

end.


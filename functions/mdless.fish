function mdless
  if test -d $argv
    echo "Usage: mdless <filename>"
  else if test -e $argv
    command pandoc -t plain $argv | less
  else
    echo "File does not exist"
  end
end

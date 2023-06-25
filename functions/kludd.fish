function kludd
  set -l path ~/work/kludd
  if test (count $argv) -eq 2
    set -l cmd $argv[1]
    set -l file $path/$argv[2].md
    if test $cmd = "e"
      $EDITOR $file
    else if test $cmd = "gui"
      if test -e $file
        set -l tmpfile (mktemp)
        pandoc -f markdown -t html $file -o $tmpfile --self-contained --css=$path/style.css
        xdg-open $tmpfile &>/dev/null &
      else
        echo "$file does not exist"
      end
    end
  else
    set -l file $path/$argv[1].md
    if test -d $argv[1]
      kludd README
    else if test $argv[1] = "ls"
      ls $path/*.md | xargs -n 1 basename | cut -f 1 -d '.'
    else if test $argv[1] = "e"
      echo "test"
    else if test -e $file
      mdless $file
    else
      echo "$file does not exist"
    end
  end
end

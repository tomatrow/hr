# AJ Caldwell
# tomatrow@gmail.com

# Original at github.com/LuRsT/hr
function hr --description 'Creates barriers'

	set -g COLS (tput cols)

	if test $COLS -eq 0 
	    set COLS (math $COLUMNS - 80)
	end

	function header
		set -l WORD $argv[1]
		if test -n $WORD
			set -l LINE ''
			while test (math (echo -n $LINE | wc -m)) -lt $COLS #This is horrible
				set LINE $LINE$WORD
			end 
			echo $LINE | cut -c -$COLS
		end 
	end 

	function headers
		set -l WORD
		for WORD in $argv
			header "$WORD"
		end 
	end

	if test (count $argv) -eq 0 
		set argv[1] '#'
	end 
	headers $argv
end
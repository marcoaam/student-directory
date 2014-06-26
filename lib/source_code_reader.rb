file = File.open($PROGRAM_NAME, "r")
file.readlines.each { |line| puts line }
file.close
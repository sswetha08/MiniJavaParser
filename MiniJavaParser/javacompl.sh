cd Parser && ./parser

if [[ $? -gt 0 ]]; 
then
	cd ..
	cd Symtable && ./symtable
else
	echo "Cant create symbol Table"
fi



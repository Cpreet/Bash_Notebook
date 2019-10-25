#!/bin/bash
#This is a cli notebook for taking notes and reviewing fast
#It will have the following features:
#Taking notes in a template
#Indexing of topics
#searching through title
#Tl;Dr summaries for topics

function usage {
	echo -e "Notebook.sh: create notes and search through them like a pro \n"
	echo -e "-h | --help   prints out this help file \n"
	echo -e "-n | --new [templateName]    creates a new text file in the current directory"
	echo -e "   templateName: makes a new file with the given template \n"
	echo -e "-d | --delete [notebookName]   deletes the notbook \"notebookName.txt\" "
	echo -e "-t | --template [templateName] opens the editor to make a template \"templateName\" "
	echo -e "-i | --index  Indexs notebooks by Topic field"
}

function createNewFile {
	touch ./"$1".txt
	echo "NOTEBOOK" >> ./"$1".txt
	cat Default.txt >> ./"$1".txt
	nano "$1".txt
}

function deleteNotebook {
	echo -e "Do you really want to remove your Notebook ?"
	read INPUT
	case $INPUT in
	y | Y)
		rm ./"$1".txt
		;;
	n | N)
		echo -e "\nAborted deletion"
		continue
		;;
	*)
		echo -e "\nAborted deletion"
		exit 1
		;;
	esac
}

function createNewTemplate {
	echo -e "\nCreating new template"
	touch template.txt
}

function indexAllNotebooks {
	echo -e "\nIndex: "
	list=$(ls | grep .txt)

	for val in ${list}
	do
		header=$(head -n 1 "$val")
		compare="NOTEBOOK"
		num=0
# fix this 
		if [ "$header" = "$compare" ]
		then
	 		list[$num]=$(cat "$val" | grep Topic: )
			num=+
		else
			num=+
		fi

	done
	echo $list
}

argument=$1

case ${argument} in
 -h | --help)
	usage
	;;
 -n | --new)
	shift
	createNewFile "$1"
	;;
 -d | --delete)
	shift
	deleteNotebook "$1"
	;;
 -t | --template)
	shift
	createNewTemplate "$1"
	;;
 -i | --index)
	indexAllNotebooks
	;;
 *)
	usage
	exit 1
	;;
esac

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
}

function createNewFile {
	touch ./"$1".txt
	
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
	echo -e "\n Creating new template"
	touch template.txt
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
 *)
	usage
	exit 1
	;;
esac

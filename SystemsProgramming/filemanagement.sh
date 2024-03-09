#Start of the program

#$ Note !! filename indicates full path to file or Directory

#start of the methods

#this function create new directory
create_directory() {
    local filename=$1
    mkdir "$filename"
    echo -e "\nSucessfully create new Directory in path $filename"
}

#this function lists content of a directory
list_content() {
    local filename=$1
    echo -e "\nListing Content of Directory in path $filename\n"
    ls "$filename"
}

#thi function create an empty file
create_file() {
    local filename=$1
    echo -e "\nWait a minute...\n"
    touch "${filename}"
   
    if [ -e "$filename" ]; then {
      echo -e "\nSucessfully created new File name in path $filename "
    } else
      echo -e "\n....... Failed to create new file."
    fi
}

#this function write a content to a file
edit_file() {
    local filename=$1
    nano "$filename"
    echo -e "\nSucessfully edited file in path $filename"
}

#this file display content of a file
display_content() {
    local filename=$1
    echo -e "\nDisplaying Content of file in path $filename\n"
    cat "$filename"
}

#this function delete a file
delete_file() {
    local filename=$1
    rm "$filename"
    echo -e "\nfile in path $filename is deleted."
}

#this function delete a directory
delete_dir() {
    local filename=$1
    rmdir "$filename"
    echo -e "\nDirectory in path $filename is Deleted"
}

#List of operations
list_operation() {
    clear
    echo "Enter 1 to create Directory"
    echo "Enter 2 to List content of a Directory"
    echo "Enter 3 to create new file"
    echo "Enter 4 to write content to a file"
    echo "Enter 5 to display the content"
    echo "Enter 6 to delete a file"
    echo "Enter 7 to delete a directory"
    echo -e "\n"
    read_input
}

#read input from users
read_input() {
    read -p "Enter the Operation: " input
    echo -e "Current Location $(pwd)\n"
    read -p "Enter full path to file or directory: " file_name
    operation_check $file_name $input
}


#check for user choice and call operation according to user choice
operation_check() {
    local file_name=$1
    local input=$2
    case "$input" in
      "1")
        check_file $file_name $input
        create_directory $file_name
      ;;
      "2")
        validate_file $file_name
        list_content $file_name
      ;;
      "3")
        check_file $file_name $input
        create_file $file_name
      ;;
      "4")
        validate_file $file_name
        edit_file $file_name
      ;;
      "5")
        validate_file $file_name
        display_content $file_name
      ;;
      "6")
        validate_file $file_name
        delete_file $file_name
      ;;
      "7")
        validate_file $file_name
        delete_dir $file_name
      ;;
      *) 
        echo -e "\nInvalid Choice"
        echo -e "Please enter your choice according to above display list\n"
        read_input
      ;;
      esac

      #call user to continue or not
      prompt_user
}

#This function checks for existing file or directory. and if it already exits
#it will prompt user to create new one with different name. or create new
#file or Directory if it doesn't exits already.
check_file() {
    local file_name=$1
   
    if [ -d "$file_name" ]; then { #checks for directory 
        re_try $file_name $input
    } 
    elif [ -e "$file_name" ]; then { #check for files
        re_try $file_name $input
    }
    else 
       echo -e "\nNo file or Directory with path $file_name"
       echo -e "\n.....Creating new File or Directory in path $file_name" 
    fi
}

re_try() { #this method return new file or directory name
   local file_name=$1
   local input=$2
   echo -e "\nThe Directory or File with path $file_name already exists."
   read -p "Re-enter Directory or File name with different name or path: " file_name  
   operation_check $file_name $input
}


#This method only validate files or Directory
validate_file() {
    local file_name=$1
 
     if [ -d "$file_name" ]; then { #checks for directory 
        echo -e "\nThe Directory with path $file_name exits."
        echo -e "Okay Performing Operation...."
    } 
    elif [ -e "$file_name" ]; then { #check for files
        echo -e "\nThe file with path $file_name already exists."
        echo -e "Okay Performing Operation...."     
    } 
    else 
      echo -e "\nMissing File or Directory in path $file_name"
      prompt_user
    fi
}

#prompt user to continue or exits program
prompt_user() {
  echo -e "\n"
  read -p "Do you want to continue ? If yes then enter 1 : " cond 
  if [ "$cond" -eq 1 ]; then
    list_operation
  else 
    echo -e "\n\n\t\tThank You !! Let's meet again in Future.."
    exit
  fi
}


list_operation




source check_files.sh

#read path of file
read_path() {
  read -p "Enter full path to file or directory: " file_path
  echo "$file_path"
}

#1-this function create new directory
create_directory() {
    file_path=$(read_path)
    result=$(check_file "$file_path")

    if [ "$result" -eq 0 ]; then
        mkdir "$file_path"
        echo -e "\nSuccessfully created new Directory $file_path"
    else 
        echo -e "\nThe Directory with path $file_path exists."
        echo -e "Try Again !!\n"
        create_directory
    fi   
}

#2-this function lists content of a directory
list_content() {
    file_path=$(read_path)
    result=$(check_file $file_path)

    if [ "$result" -eq 1 ]; then
        echo -e "\nThe Directory with path $file_path exists.\n"
        echo -e "\nListing Content of Directory in path $file_path\n"
        ls "$file_path"
    else 
        echo -e "\nNo file or Directory with path $file_path"
        echo -e "Try Again !!\n"
        list_content
    fi
}

#3-this function create an empty file
create_file() {
    file_path=$(read_path)
    result=$(check_file $file_path)
   
   if [ "$result" -eq 0 ]; then
        touch "$file_path"
        echo -e "\nSuccessfully created new file $file_path"
    else 
        echo -e "\nThe file with path $file_path exists."
        echo -e "Try Again !!\n"
        create_file
    fi   
}

#4-this function write a content to a file
edit_file() {
    file_path=$(read_path)
    result=$(check_file $file_path)

    if [ "$result" -eq 1 ]; then
        echo -e "\nThe File with path $file_path exists.\n"
        nano "$file_path"
        echo -e "\nSucessfully edited file in path $file_path"    
    else 
        echo -e "\nNo file with path $file_path"
        echo -e "Try Again !!\n"
        edit_file
    fi
}

#5-this file display content of a file
display_content() {
    file_path=$(read_path)
    result=$(check_file $file_path)

     if [ "$result" -eq 1 ]; then
        echo -e "\nThe File with path $file_path exists.\n"
        echo -e "\nDisplaying Content of file\n"
        cat "$file_path"  
    else 
        echo -e "\nNo file with path $file_path"
        echo -e "Try Again !!\n"
        display_content
    fi  
}

#6-this function delete a file
delete_file() {
    file_path=$(read_path)
    result=$(check_file $file_path)

    if [ "$result" -eq 1 ]; then
        echo -e "\nThe File with path $file_path exists.\n"
        rm "$file_path"
        echo -e "\nfile in path $file_path is deleted." 
    else 
        echo -e "\nNo file with path $file_path"
        echo -e "Try Again !!\n"
        delete_file
    fi  
}

#7-this function delete a directory
delete_dir() {
    file_path=$(read_path)
    result=$(check_file $file_path)

   if [ "$result" -eq 1 ]; then
        echo -e "\nThe Directory with path $file_path exists.\n"
        rm -rf "$file_path"
        echo -e "\nDirectory in path $file_path is Deleted"
    else 
        echo -e "\nNo Directory with path $file_path"
        echo -e "Try Again !!\n"
        delete_dir
    fi  
}

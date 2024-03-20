source file_operations.sh

read_input() { #read operation
   read -p "Enter the Operation: " input 
   echo "$input"
}

#check for user choice and call operation according to user choice
operation_check() {
    echo -e "Current Location $(pwd)\n"
    input=$(read_input)
    
    case "$input" in
      "1")
        create_directory 
      ;;
      "2")
        list_content 
      ;;
      "3")
        create_file 
      ;;
      "4")
        edit_file 
      ;;
      "5")
        display_content 
      ;;
      "6")
        delete_file 
      ;;
      "7")
        delete_dir 
      ;;
      "8")
          echo "Logging Out ..... "
          exit
      ;;
      *) 
        echo -e "\nInvalid Choice"
        echo -e "Please enter your choice according to above display list\n"
        operation_check
      ;;
      esac
}
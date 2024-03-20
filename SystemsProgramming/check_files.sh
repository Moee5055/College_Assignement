#checks files
check_file() {
    local file_path=$1
    
    if [ -d "$file_path" ]; then # Checks for directory
        echo 1
    elif [ -e "$file_path" ]; then # Checks for files
        echo 1
    else 
        echo 0
    fi
}
    


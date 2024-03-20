
#prompt user to continue or exits program
prompt_user() {
  echo -e "\n"
  read -p "Do you want to continue ? If yes then enter 1 : " cond 
  if [ "$cond" -eq 1 ]; then
    mainFunction
  else 
    echo -e "\n\n\t\tLogging out ....."
    exit
  fi
}







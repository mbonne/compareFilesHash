#!/bin/bash

## Check md5 and sha1 hash
# https://www.dyclassroom.com/howto-mac/how-to-verify-checksum-on-a-mac-md5-sha1-sha256-etc
# http://osxdaily.com/2012/02/05/check-sha1-checksum-in-mac-os-x/
# http://osxdaily.com/2009/10/13/check-md5-hash-on-your-mac/

read -p "Enter Path To File: " fileToCompare

read -p "Enter Files Correct Hash: " correctHash

# Below is the Bash Menu

PS3='Select Hash comparison you need: '
options=("SHA-1" "SHA-256" "SHA-512" "md5" "Quit")
select opt in "${options[@]}"
do
  case $opt in
    "SHA-1")
      echo "Comparing SHA-1 values"
      hashOption=$(shasum -a 1 "$fileToCompare" | awk '{print $1}')
      break
      ;;
    "SHA-256")
      echo "Comparing SHA-256 values"
      hashOption=$(shasum -a 256 "$fileToCompare" | awk '{print $1}')
      break
      ;;
    "SHA-512")
      echo "Comparing SHA-512 values"
      hashOption=$(shasum -a 512 "$fileToCompare" | awk '{print $1}')
      break
      ;;
    "md5")
      echo "you chose choice $REPLY which is $opt"
      hashOption=$(md5 "$fileToCompare" | awk '{print $4}')
      break
      ;;
    "Quit")
      echo -e "\033[33;31m Comparison Aborted"
      exit 0
      ;;
    *) echo -e "\033[33;31m invalid option $REPLY";;
  esac
done

# Finished showing user menu options, and setting the variable with users selection
calculatedHash=$hashOption

# Comparing the values
if [[ $calculatedHash == $correctHash ]]; then
  echo -e "\033[33;32m Looks good. Calculated hash matches input value."
  echo -e "\033[33;32m Correct Hash:    $correctHash"
  echo -e "\033[33;32m Your files Hash: $calculatedHash"
else
  echo -e "\033[33;31m Uh Oh Hash does not match..." # RED \033[33;31m
  echo -e "\033[33;32m The Correct Hash: $correctHash" # GREEN \033[33;32m
  echo -e "\033[33;31m Your files Hash:  $calculatedHash"
fi

exit 0

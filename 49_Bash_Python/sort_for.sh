#!/bin/bash

echo -n "Укажи через пробел числа для сортировки и нажми Enter когда закончишь: "
read -a INPUT_ARRAY
TARGET=7

# Validation block
for item in "${!INPUT_ARRAY[@]}"; do
  VALIDATE=$(echo "${INPUT_ARRAY[$item]}" | awk '$0 ~/[^0-9]/ { print "NOT_NUMBER" }')
  if [ "${INPUT_ARRAY[*]}" == "" ] || [ "$VALIDATE" == "NOT_NUMBER" ]; then
      echo "Не корректные данные. Принимаются только числа."
      exit 1
  elif [[ ${INPUT_ARRAY[item]} -le $TARGET ]]; then
      unset "INPUT_ARRAY[item]"
  fi
done

# Bubble-sort block
for ((i = 0; i<${#INPUT_ARRAY[@]}; i++)); do
   for((j = 0; j<${#INPUT_ARRAY[@]} - i - 1; j++)); do
       if [[ "${INPUT_ARRAY[j]}" -gt "${INPUT_ARRAY[$((j + 1))]}" ]]; then
           temp=${INPUT_ARRAY[j]}
           INPUT_ARRAY[$j]=${INPUT_ARRAY[$((j + 1))]}
           INPUT_ARRAY[$((j + 1))]=$temp
       fi
   done
done

echo "Отсортированный список: ${INPUT_ARRAY[*]}"
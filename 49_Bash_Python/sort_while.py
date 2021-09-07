list_sort = []
numbers_input = input("Укажи через пробел числа для сортировки и нажми Enter когда закончишь: ")
list_input = numbers_input.split()

for item in list_input:
    try:
        list_sort.append(int(item))
    except ValueError:
        print("Не корректный формат данных: ", item, " Ожидается целое число.")

print('\n')
print("Не сортированный список", '\n', list_sort)

item = 0
while item < len(list_sort) - 1:
    number = 0
    while number < len(list_sort) - 1 - item:
        if list_sort[number] > list_sort[number+1]:
            list_sort[number], list_sort[number+1] = list_sort[number+1], list_sort[number]
        number += 1
    item += 1

print(list_sort)
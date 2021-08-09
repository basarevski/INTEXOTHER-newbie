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

for item in range(len(list_sort)):
    for number in range(len(list_sort)-item-1):
        if list_sort[number] > list_sort[number+1]:
            list_sort[number], list_sort[number+1] = list_sort[number+1], list_sort[number]

print("Сортированный список", '\n', list_sort)

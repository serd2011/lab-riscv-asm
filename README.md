# Проектирование систем на кристалле <br> Лабораторная работа №1

## Задание

Задание представляет собой простую задачу на обработку двумерного массива. Непосредственную обработку массива необходимо реализовать в виде отдельной функции с необходимыми аргументами.

Необходимо реализовать алгоритм на языке ассемблера RISCV ISA и на языке программирования Си. Скомпилировать программу на языке Си и получить `.dump` файл. Результат работы ассемблерной программы продемонстрировать в симуляторе Venus.

Вариант | Задание |   N   |   M   | Передача параметров
:-----: |:-------------- | :---: | :---: | :------------------
10 | Найти строчку в массиве с максимальной <br> суммой элементов | 6 | 6 | Размер: по значению <br> Массив: по ссылке

## Результаты работы

Программа на языке ассемблера: [Lab1.S](src/asm/Lab1.S)  
Программа на языке Си: [Lab1.c](src/c/Lab1.c)  
Дамп-файл программы на Си без оптимизаций: [Lab1-O0.dump](results/Lab1-O0.dump)  
Дамп-файл программы на Си с уровнем оптимизации O3: [Lab1-O3.dump](results/Lab1-O3.dump)  

## Тестирование
Тестирование программы на языке Си производилось с помощью симулятора `riscv64-unknown-elf-run`. Тестирование ассемблерной программы выполнялось с помощью расширения `RISC-V Venus Simulator` для VSCode.

<details><summary>Результат тестирования программы на языке Си</summary>
<p>

```
$ riscv64-unknown-elf-run --architecture riscv:rv32 --model RV32I -v build/Lab1.elf
riscv64-unknown-elf-run build/Lab1.elf
99 67 55 68 11  4
 1 43 41 10 17  0
33 81 78 34 71 37
45  9 63 53 15 49
63 81 88 46 25 76
68  7 59 86 24 76

63 81 88 46 29 78
Simulator Execution Speed

  Total execution time:    < 1 second
```

</p>
</details>

<details><summary>Результат тестирования программы на языке ассемблера</summary>
<p>

```
-------------------------------------------------------------------------------------------
Starting program /home/serd/repos/lab-riscv-asm/src/asm/Lab1.S

63 81 88 46 25 76 Exited with error code 0
Stop program execution!
-------------------------------------------------------------------------------------------
```

</p>
</details>

## Сборка
Для сборки программы на Си используется `GNU Make`. Сборка осуществляется в директорию `build`.

Необходим компилятор `riscv64-unknown-elf-gcc` и `riscv64-unknown-elf-objdump`. Альтернативный путь к директории установки можно указать через `GCC_PATH`, например `make dump GCC_PATH=/opt/riscv-gnu-toolchain/bin`.

По умолчанию используются ISA `rv32i` и ABI `ilp32`. Они могут быть изменены параметрами `ISA` и `ABI` соответственно.

Для получения `.dump` файла можно использовать команду:
```
make dump
```

//
//  main.swift
//  SwiftLanguageBasics
//
//  Created by Иван Крылов on 28.09.2021.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет.
func EvenNumber (_ a:Int) {
    if a%2 == 0 {
    print("Число четное")
    }
    else{
        print("Число не четное")
    }
}

//2.Написать функцию, которая определяет, делится ли число без остатка на 3.
func NumberDel3(_ a:Int){
    if a%3 == 0 {
    print("Число делиться на 3 без отстатка")
    }
    else{
        print("Число не делиться на 3 без отстатка. Остаток = ", a%3)
    }
}

EvenNumber(7)
NumberDel3(7)

// Создать возрастающий массив из 100 чисел.
var Array1: [Int] = []
for i in 0 ... 99 {
    Array1.append(i)
}
print(Array1)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for i in  Array1 {
    if (i == 0) || (i % 3 != 0) {
        Array1.remove(at: Array1.firstIndex(of: i)!)
    }
   }
print(Array1)



// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов. Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func Fubonaci (_ count: Int) -> [Double]{
    var Array2 = [Double]()
    if count == 1 {
        let F1: Double = 0.0
        Array2.append(F1)
    }
    if count == 2{
        let F1: Double = 0.0
        let F2: Double = 1.0
        Array2.append(F1)
        Array2.append(F2)
    }
    if count > 2 {
        let F1: Double = 0.0
        let F2: Double = 1.0
        Array2.append(F1)
        Array2.append(F2)
        var n: Int = 2
        while n < count {
            Array2.append(Array2[n-1]+Array2[n-2])
            n+=1
        }
}
    return Array2
}

print(Fubonaci(50))

/* 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно. */

var Array3 = [Int](2...1000)
for i in Array3{
    for j in Array3{
        if j % i == 0 && j != i {
            Array3.remove(at: Array3.firstIndex(of: j)!)
        }
    }
    if Array3.count > 100 {
        Array3.removeLast()
    }
}

print(Array3)

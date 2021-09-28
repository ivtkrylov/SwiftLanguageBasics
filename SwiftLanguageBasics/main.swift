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
for i in 0 ... 100 {
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




//
//  main.swift
//  SwiftLanguageBasics
//
//  Created by Иван Крылов on 28.09.2021.
//


/* Задание
1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/

import Foundation

// правила очереди первый вошел -> первй вышел
struct queue<Type: Comparable> {
    var element: [Type] = []
    
    //добавление  в очередь
    mutating func Enqeue(_ element: Type){
        self.element.append(element)
    }
//Удаляет первый помещенный элемент из очереди и возвращает
    mutating func Dequeue(){
        if(element.count == 0){
            print("Очередь пуста")
        }
        else{
            self.element.remove(at: 0)
            
        }
    }
    //Возвращает элемент, который вернет следующий вызов Dequeue
    func peek() -> Type? {
         if(element.count == 0){
             print("Очередь пуста")
             return nil
        }else{
            return element[0]
        }
    }
    
    //количество элементов в очереди
    func count() -> Int {
        return self.element.count
    }
    
    /* Так как из контекста понятно, что в замыкание будет передан один аргумент, можно убрать и его, а в теле замыкания он будет доступен через переменную «$0». Если бы переменных передавалось несколько, например три, они были бы доступны по именам «$0», «$1», «$2». Так как мы убираем имя аргумента, мы обязаны убрать и ключевое слово «in».*/
    
    func filter(elem: Type) -> [Type] {
        return element.filter {$0 == elem}  // закрывающие замыкание
    }
    
    mutating func sort1() -> [Type]{
        return element.sorted(by: <)
    }
   /*
    // Преобразование массива
    func map(){
        
    }
    //вычисляет результат агрегирования элементов
    func reduce(){
        
    }
    // итерирование массива по аналогии с for
    func forEach(){
        
    }
    */
    subscript(index: Int) -> Type? {
        if index < element.count && index >= 0 {
            return element[index]
            
        }
        else{
            print("Выход за пределы массива")
            return nil
        }
            
    }
}


var TestQueue = queue<Int>()
TestQueue.Enqeue(1)
print(TestQueue)
TestQueue.Enqeue(5)
TestQueue.Enqeue(9)
print(TestQueue)
TestQueue.Dequeue()
print(TestQueue)
print(TestQueue.peek()!)
TestQueue.Dequeue()
print(TestQueue.peek()!)
print(TestQueue.count())
print(TestQueue[0]!)
print(TestQueue[9])
TestQueue.Enqeue(9)
TestQueue.Enqeue(4)
TestQueue.Enqeue(5)
TestQueue.Enqeue(89)
TestQueue.Enqeue(54)
TestQueue.Enqeue(48)
print(TestQueue)
print(TestQueue.filter(elem: 9))
print(TestQueue.sort1())

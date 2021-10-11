//
//  main.swift
//  SwiftLanguageBasics
//
//  Created by Иван Крылов on 28.09.

/*
Урок 5. ООП: требование к классам, протоколы, расширения, полиморфизм, композиция
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести сами объекты в консоль.
*/

import Foundation


// объявление протокола Сar c общими свойствами класса
protocol Car: AnyObject{   // AnyObject означает, что только класс сможет соответствовать этому протоколу.
    var marka: String {get set}
    var age: Int {get set}
    var Vtrunk: Double {get set}
    var engine: ActionCar {get set}
}

// расширение протокола с описанием метода
extension Car{
   
    func izmEngine(_ enum1:ActionCar){
            switch enum1 {
            case .start_engine:
                 self.engine = .start_engine    // без AnyObject ошибка на self.
            case .close_engine:
                self.engine = .close_engine
            }
    }
}


 // 1. Перечисления из предыдущего ДЗ
 
enum ActionCar: String{ //запуск двигателя
    case start_engine = "Запущен"
    case close_engine = "Заглушен"
}

enum ActionTrailer: String{ // состояние прицепа грузового автомобиля
    case in_Trailer = "Соединен"
    case off_Trailer = "Разьединен"
}

enum Spoiler: String {
    case on = "Спойлер установлен на автомобиль"
    case off = "Спойлер не установлен на автомобиль"
}

// перечисление с связанными значениями
enum Action {
    case switchActionCar(ActionCar)
    case swichActionTrailer(ActionTrailer)
    case switchSpoiler(Spoiler)
    
}

protocol sportCar:Car{
    
    var d_spoiler: Spoiler {get set}
    var maxSpeed: Int {get set}
}

extension sportCar{
    func izmAction(_ action: Action) {
        switch action {
        case .switchSpoiler(let status):
            d_spoiler = status
        default: break
        }
    }
}

protocol TrunkCar:Car {
    var numerTrailer: String {get set}//номер прицепа
    var SizeTrail: Double  {get set}// объем.размер прицепа
    var Trailer: ActionTrailer {get set}
}
extension TrunkCar{
func izmAction(_ action: Action) {
   switch action {
   case .swichActionTrailer(let status):
       Trailer = status
   default: break
   }
}
}
class SportCar:sportCar{
    // по протоколу
    var marka: String
    var age: Int
    var Vtrunk: Double
    var engine: ActionCar
    
    // собственные свойства
    var d_spoiler: Spoiler
    var maxSpeed: Int
    
    init (_ marka: String, _ age: Int, _ Vtrunk: Double,_ engine: ActionCar, _ maxSpeed: Int, _ d_spoiler: Spoiler){
        self.maxSpeed = maxSpeed
        self.d_spoiler = d_spoiler
        self.marka = marka
        self.age = age
        self.Vtrunk = Vtrunk
        self.engine = engine
    }
    
    deinit {
        print("Спортивная машина удалена")
    }
}

class trunkCar:TrunkCar {
    
    // по протоколу
    var marka: String
    var age: Int
    var Vtrunk: Double
    var engine: ActionCar
    
    var numerTrailer: String  //номер прицепа
    var SizeTrail: Double  // объем.размер прицепа
    var Trailer: ActionTrailer
    
    init (_ marka: String, _ age: Int, _ Vtrunk: Double,_ engine: ActionCar, _ numerTrailer: String, _ SizeTrail: Double, _ Trailer: ActionTrailer ){
        self.numerTrailer = numerTrailer
        self.SizeTrail = SizeTrail
        self.Trailer = Trailer
        self.marka = marka
        self.age = age
        self.Vtrunk = Vtrunk
        self.engine = engine
     
    }
    deinit{
        print("Грузовая машина удалена")
    }
    
}

//{return String} - видимо конструкция замыкания?
extension SportCar: CustomStringConvertible {
    var description: String {return "Марка автомобиля \(marka), год выпуска \(age), \n объем багажника \(Vtrunk), состояние двигателя \(engine.rawValue), \n Максимальная скорость автомобиля \(maxSpeed), \(d_spoiler.rawValue)\n"}

}

//{return String} - видимо конструкция замыкания?
extension trunkCar: CustomStringConvertible{
    var description: String {return "Марка автомобиля \(marka), год выпуска \(age), объем багажника \(Vtrunk),\n состояние двигателя \(engine.rawValue), \n номер прицепа \(numerTrailer), размер прицепа \(SizeTrail), принцеп \(Trailer.rawValue)\n"}

}


var NissanSport = SportCar("HissanSport", 2021, 8, .start_engine, 310, .off)
var HondaSport = SportCar("HondaSport", 2008, 10, .close_engine, 300, .on)

var Iveco = trunkCar("Iveco", 2019, 60, .close_engine, "В356ЕН134", 50, .in_Trailer)
var Man: trunkCar = trunkCar("Man", 2015, 6,.start_engine," А444ПА134", 60,.off_Trailer)


print(HondaSport.description)

HondaSport.izmEngine(.start_engine)
HondaSport.izmAction(.switchSpoiler(.off))
print(HondaSport.description)

print(NissanSport.description)

Iveco.izmAction(.swichActionTrailer(.off_Trailer))
print(Iveco.description)

print(Man.description)


//Iveco.PrintCar()
//Man.PrintCar()

/*
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
*/



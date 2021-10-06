//
//  main.swift
//  SwiftLanguageBasics
//
//  Created by Иван Крылов on 28.09.2021.
//

import Foundation

 // 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 
class Car {
    var marka: String
    var age: Int
    var Vtrunk: Double
    var engine: ActionCar
    func PrintCar(){
        print("Марка автомобиля \(marka), год выпуска \(age), объем багажника \(Vtrunk), состояние двигателя \(engine.rawValue)")
    }
    func izmEngine(_ enum1:ActionCar){
            switch enum1 {
            case .start_engine:
                 self.engine = .start_engine
            case .close_engine:
                self.engine = .close_engine
            }
    }
    
    init(_ marka: String, _ age: Int, _ Vtrunk: Double,_ engine: ActionCar ){
        self.marka = marka
        self.age = age
        self.Vtrunk = Vtrunk
        self.engine = engine
    }
    
    deinit{
        print("Машина удалена")
    }
    // пустая функция для переопределения в наследуемых классах
    func izmAction(_ action: Action) {
        switch action {
        case .switchActionCar(let status):
            engine = status
        default: break
        }
    }
}

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

//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
class SportCar:Car{
    var d_spoiler: Spoiler
    var maxSpeed: Int
    override func PrintCar() {
        print("Марка автомобиля \(marka), год выпуска \(age), объем багажника \(Vtrunk), состояние двигателя \(engine.rawValue), Максимальная скорость автомобиля \(maxSpeed), \(d_spoiler.rawValue)")
    }
    override func izmAction(_ action: Action) {
        switch action {
        case .switchSpoiler(let status):
            d_spoiler = status
        default: break
        }
    }
    init (_ marka: String, _ age: Int, _ Vtrunk: Double,_ engine: ActionCar, _ maxSpeed: Int, _ d_spoiler: Spoiler){
        self.maxSpeed = maxSpeed
        self.d_spoiler = d_spoiler
        super.init(marka, age, Vtrunk, engine)
    }
    
    deinit {
        print("Спортивная машина удалена")
    }
}

class trunkCar:Car{
    
    var numerTrailer: String  //номер прицепа
    var SizeTrail: Double  // объем.размер прицепа
    var Trailer: ActionTrailer
    
    override func PrintCar() {
        print("Марка автомобиля \(marka), год выпуска \(age), объем багажника \(Vtrunk), состояние двигателя \(engine.rawValue), номер прицепа \(numerTrailer), размер прицепа \(SizeTrail), принцеп \(Trailer.rawValue)")
    }
    
    override func izmAction(_ action: Action) {
        switch action {
        case .swichActionTrailer(let status):
            Trailer = status
        default: break
        }
    }
    
    init (_ marka: String, _ age: Int, _ Vtrunk: Double,_ engine: ActionCar, _ numerTrailer: String, _ SizeTrail: Double, _ Trailer: ActionTrailer ){
        self.numerTrailer = numerTrailer
        self.SizeTrail = SizeTrail
        self.Trailer = Trailer
            super.init(marka, age, Vtrunk, engine)
     
    }
    deinit{
        print("Грузовая машина удалена")
    }
    
}
var Honda = Car("Honda", 2008, 10, .close_engine)
var BMW = Car("BMW",2010,11,.start_engine)

var NissanSport = SportCar("HissanSport", 2021, 8, .start_engine, 310, .off)
var HondaSport = SportCar("HondaSport", 2008, 10, .close_engine, 300, .on)

var Iveco = trunkCar("Iveco", 2019, 60, .close_engine, "В356ЕН134", 50, .in_Trailer)
var Man: trunkCar = trunkCar("Man", 2015, 6,.start_engine," А444ПА134", 60,.off_Trailer)

Honda.PrintCar()
Honda.izmAction(.switchActionCar(.start_engine))
Honda.PrintCar()

BMW.PrintCar()

HondaSport.PrintCar()
NissanSport.PrintCar()
HondaSport.izmEngine(.start_engine)
HondaSport.PrintCar()

Iveco.PrintCar()
Man.PrintCar()

/*
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
*/


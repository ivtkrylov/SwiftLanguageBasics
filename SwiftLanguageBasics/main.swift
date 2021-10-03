//
//  main.swift
//  SwiftLanguageBasics
//
//  Created by Иван Крылов on 28.09.2021.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct SportCar{
    var marka: String
    var age: Int
    var Vtrunk: Double
    var engine: ActionCar{
        willSet{
            print("Изменено состояние двигателя на \(newValue.rawValue)")
        }
    }
    var window: ActionWindow
    var deltaVtrunk: Double
    var km: Double{
    didSet{ // наблюдатели свойств вызываеться когда значение измениться
        let distance = km - oldValue
        print("Пройден новый участок пути \(distance)")
    }
    }
    
    func PrintSportCar(){
        print("Марка машины \(marka), год выпуска автомобиля \(age), Объем багажника \(Vtrunk), состояние двигателя \(engine.rawValue), состояние окна \(window), заполненный объем багажника \(deltaVtrunk), пройденное расстояние автомобилем \(km) km" )
    }
    
    //4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

    mutating func izmEngine(enum1: ActionCar ){
        switch enum1 {
        case .start_engine:
             self.engine = .start_engine
        case .close_engine:
            self.engine = .close_engine
        }
    }
    
    mutating func izmWindows(enum1: ActionWindow ){
        switch enum1 {
        case .open_windows:
            self.window = .open_windows
        case .close_windows:
            self.window = .close_windows
        }
    }
    
 /*   init () { // инициализатор структуры по умолчанию, при наличии пропадает стандартный инициализатор структуры и требуеться описание
        marka = "BMW"
        age = 2020
        Vtrunk = 15
        engine = .start_engine
        window = .close_windows
        deltaVtrunk = 0
        km = 0
    }
     */
}

    
struct TrunkCar{
    var marka: String
    var age: Int
    var Vtrunk: Double
    var engine: ActionCar
    var window: ActionWindow
    var deltaVtrunk: Double
    
    mutating func izmWindows(_ enum1: ActionWindow ){
        switch enum1 {
        case .open_windows:
            self.window = .open_windows
        case .close_windows:
            self.window = .close_windows
        }
    }
    
    func PrintTrunkCar(){
        print("Марка машины \(marka), год выпуска автомобиля \(age), Объем багажника \(Vtrunk), состояние двигателя \(engine.rawValue), состояние окна \(window), заполненный объем багажника \(deltaVtrunk)" )
    }
}

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
enum ActionCar: String{
    case start_engine = "Запущен двигатель"
    case close_engine = "Заглушен двигатель"
}

enum ActionWindow:String {
        case open_windows = "Открыть окно"
        case close_windows = "Закрыть окно"
    }
enum ActionCargo: String {
    case in_cargo = "Погрузить груз"
    case off_cargo = "Выгрузить окно"
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.
    var Car1 = SportCar(marka:"Mersedes", age: 2020, Vtrunk: 10, engine: .start_engine, window: .open_windows,deltaVtrunk: 0, km: 0)
    Car1.PrintSportCar()
    Car1.km = 100   // проверка работы наблюдателя свойств
    Car1.PrintSportCar()
    Car1.izmEngine(enum1: .close_engine)
    Car1.PrintSportCar()

var Car2 = TrunkCar(marka: "Iveco", age: 2001, Vtrunk: 5, engine: .close_engine, window: .close_windows, deltaVtrunk: 5)
Car2.PrintTrunkCar()
Car2.izmWindows(.open_windows)
Car2.PrintTrunkCar()


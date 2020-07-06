//
//  main.swift
//  3I_DonskayaEkaterina
//
//  Created by Ekaterina Donskaya on 04/07/2020.
//  Copyright © 2020 Ekaterina Donskaya. All rights reserved.
//

import Foundation


//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.


enum WindowsPosition {
    case open, close
}

enum EngineOnOff {
    case on(Bool)
    case off(Bool)
}

enum cargoWeight: Int {
    case lightLoading = 50
    case halfLoading = 150
    case fullLoading = 250
    
}

enum loadCargo {
    case cargo(cargoWeight)
    case empty
}

struct Car {
    let model: String
    let year: Int
    let trank: Int
    var engine: EngineOnOff
    var windows: WindowsPosition
    var filledTheTrank: loadCargo

    mutating func openWindows() {
        self.windows = .open
    }
    mutating func closeWindows() {
        self.windows = .close
    }
    
    func drive() {
        print("Lets drive! \(model)")
    }
    
    
}

enum AutotruckLoad: Int {
    case fullTruckLoad = 3000
    case lowTruckLoad = 1000
    case fullContainerLoad = 2000
}

struct Autotruck {
    let model: String
    let year: Int
    var engine: EngineOnOff
    var windows: WindowsPosition
    var truckload: AutotruckLoad {
        willSet {
            if newValue == .fullTruckLoad {
                print("Грузовик загружен полностью")
            } else if newValue == .fullContainerLoad {
                print("Заполнен один контейнер")
            } else {
               print("Еще есть место для груза")
            }
        }
    }
    
    mutating func engineOn() {
        self.engine = .on(true)
    }
    mutating func engineOff () {
        self.engine = .off(false)
    }
    
    
}

var jeep = Car(model: "Jeep", year: 2003, trank: 300, engine: .off(false), windows: .close, filledTheTrank: .cargo(.fullLoading))
jeep.engine = .on(true)
jeep.drive()
var audi = Car(model: "Audi", year: 2020, trank: 200, engine: .on(true), windows: .open, filledTheTrank: .cargo(.lightLoading))
print(jeep)
print(audi)


//var loadTheTruck = AutotruckLoad.fullContainerLoad
//switch loadTheTruck {
//    case .fullTruckLoad:
//        print("Грузовик загружен полностью")
//    case .lowTruckLoad:
//        print("Еще есть место для груза")
//    case .fullContainerLoad:
//        print("Заполнен один контейнер")
//}

var scania = Autotruck(model: "Scania", year: 2018, engine: .off(false), windows: .open, truckload: .lowTruckLoad)
scania.truckload = .fullTruckLoad
print(scania)

var zil = Autotruck(model: "ZIL", year: 1995, engine: .on(true), windows: .open, truckload: .fullTruckLoad)
print(zil)

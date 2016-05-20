//
//  TIPricesModel.swift
//  TestInnova
//
//  Created by ROMAN RESENCHUK on 20.05.16.
//  Copyright © 2016 ROMAN RESENCHUK. All rights reserved.
//

import UIKit

class TIPricesModel: NSObject {
    var price: NSNumber?
    var currency: String?
    var type: String?
    var movie: TIMovieModel = TIMovieModel()
    
    class func createMockOne() -> TIPricesModel {
        let model = TIPricesModel()
        model.price = 199
        model.currency = "$"
        model.type = "DVD-качество"
        return model
    }
    
    class func createMockTwo() -> TIPricesModel {
        let model = TIPricesModel()
        model.price = 299
        model.currency = "$"
        model.type = "HD-качество"
        return model
    }
    
    class func createMockThree() -> TIPricesModel {
        let model = TIPricesModel()
        model.price = 399
        model.currency = "$"
        model.type = "DVD-качество"
        return model
    }
    
    class func createMockFour() -> TIPricesModel {
        let model = TIPricesModel()
        model.price = 499
        model.currency = "$"
        model.type = "4k-качество"
        return model
    }
}

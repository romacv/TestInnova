//
//  TIMovieModel.swift
//  TestInnova
//
//  Created by ROMAN RESENCHUK on 20.05.16.
//  Copyright © 2016 ROMAN RESENCHUK. All rights reserved.
//

import UIKit

class TIMovieModel: NSObject {
    var imageName: String?
    var trailerYoutubeCode: String?
    var name: String?
    var shortcut: String?
    var imdb: NSNumber?
    var rating: NSNumber?
    var ageRating: NSNumber?
    var textDescription: String?

    class func createMock() -> TIMovieModel {
        let model = TIMovieModel()
        model.imageName = "Bitmap"
        model.trailerYoutubeCode = "NftSKKqZE0M"
        model.name = "Первый Мститель:\nПротивостояние"
        model.shortcut = "CIVIL WAR (2016)"
        model.imdb = 9.1
        model.rating = 9.1
        model.ageRating = 12
        model.textDescription = "Мстители под руководством Капитана Америки оказываются участниками разрушительного инцидента, имеющего международный масштаб. Эти события заставляют правительство задуматься над тем, чтобы начать регулировать действия всех людей с особыми способностями, введя «Акт о регистрации супергероев», вынуждая их раскрыть свои личности и работать на правительственные службы. Мстители под руководством Капитана Америки оказываются участниками разрушительного инцидента, имеющего международный масштаб. Эти события заставляют правительство задуматься над тем, чтобы начать регулировать действия всех людей с особыми способностями, введя «Акт о регистрации супергероев», вынуждая их раскрыть свои личности и работать на правительственные службы."
        return model
    }
}

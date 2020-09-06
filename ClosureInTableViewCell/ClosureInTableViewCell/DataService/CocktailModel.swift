//
//  CocktailModel.swift
//  ClosureInTableViewCell
//
//  Created by Boss on 9/6/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

struct BaseDataModel: Codable {
    var drinks: [CocktailModel]?
}
struct CocktailModel: Codable {
    var strInstructions: String?
    var strDrinkThumb: String?
    var dateModified: String?
}

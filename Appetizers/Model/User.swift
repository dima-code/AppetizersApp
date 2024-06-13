//
//  User.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 12.06.2024.
//

import Foundation

struct User: Codable{
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}

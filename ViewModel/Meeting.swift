//
//  Meeting.swift
//  UI-251
//
//  Created by nyannyan0328 on 2021/07/04.
//

import SwiftUI

struct Meeting: Identifiable {
    var id = UUID().uuidString
    var title : String
    var turnedON : Bool = true
    var timing : Date
    var color : Color = Color("Blue")
    var menmbertypist = "Public"
    var members : [String] = Array(repeating: "", count: 10)
}



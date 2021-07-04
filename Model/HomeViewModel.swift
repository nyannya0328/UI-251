//
//  HomeViewModel.swift
//  UI-251
//
//  Created by nyannyan0328 on 2021/07/04.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var addNewMeeting = false
    @Published var meetings : [Meeting] = [
        
//        Meeting(title: "Super", timing: Date()),
//        Meeting(title: "Busy", timing: Date()),
    

    
    ]
   
}


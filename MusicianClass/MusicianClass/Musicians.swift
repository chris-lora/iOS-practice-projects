//
//  Musicians.swift
//  MusicianClass
//
//  Created by Christopher Lora on 12/23/21.
//

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violinist
}

class Musicians {
    
    //attributes
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    //initializer constructor
    init(nameInit: String, ageInit: Int, instrumentInit: String, typeInit: MusicianType) {
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
    
    func sing() {
        print("nothing else matters")
    }
    
}

//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Christopher Lora on 12/23/21.
//

import Foundation

class SuperMusician : Musicians {
    
    func sing2() {
        print("enter night")
    }
    
    override func sing() {
        super.sing()
        print("exit light")
    }
}

//
//  weddingPage.swift
//  Flowerios
//
//  Created by Lumi on 02/12/21.
//

import Foundation
import SwiftUI

struct Wedding: Hashable, Codable{
    var name: String
    var description: String
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
}

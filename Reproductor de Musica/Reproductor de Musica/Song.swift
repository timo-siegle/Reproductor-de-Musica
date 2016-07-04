//
//  Song.swift
//  Reproductor de Musica
//
//  Created by Timo Siegle on 04.07.16.
//  Copyright © 2016 Timo Siegle. All rights reserved.
//

import Foundation
import UIKit

struct Song {
    var title: String
    var artist: String
    var image: UIImage
    var nameMp3: String
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
        self.image = UIImage()
        self.nameMp3 = ""
    }
}
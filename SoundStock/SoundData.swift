//
//  SoundData.swift
//  SoundStock
//
//  Created by lot-uni on 2021/01/16.
//

import UIKit

class Sound{
    var SoundName: String!
    var SoundImage: String!
    var SoundFile: String!
    
    init(SoundName: String!, SoundImage: String!, SoundFile: String!){
        self.SoundName = SoundName
        self.SoundImage = SoundImage
        self.SoundFile = SoundFile
    }
    
    func getImage() -> UIImage{
        return UIImage(named: SoundImage)!
    }
}

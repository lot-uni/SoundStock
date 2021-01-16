//
//  data.swift
//  SoundStock
//
//  Created by lot-uni on 2021/01/09.
//

//import UIKit
//
//class Sound {
//    var SoundData: String!
//    var SoundName: String!
//    var SoundImage: String!
//
//    init(SoundData: String, SoundName: String, SoundImage: String){
//        self.SoundData = SoundData
//        self.SoundName = SoundName
//        self.SoundImage = SoundImage
//    }
//
//    func getImage() ->UIImage{
//        return UIImage(named: SoundImage)!
//    }
//}

import UIKit

class Data {
    
    var name: String!
    var imageName: String!
    
    
    init(name: String,imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    func getImage() -> UIImage{
        return UIImage(named: imageName)!
    }
    
}

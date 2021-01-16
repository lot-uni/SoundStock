//
//  PlayerViewController.swift
//  SoundStock
//
//  Created by lot-uni on 2021/01/09.
//

import UIKit
import CoreMotion
import AVFoundation
import AudioToolbox

class PlayerViewController: UIViewController {

//プログラムのセットアップ
    var dataArray: [Data] = []
    let motionManager = CMMotionManager()
//    var audioPlayer = AVAudioPlayer()
    var audioPlayerInstance : AVAudioPlayer! = nil
    var startAudioPlayer = AVAudioPlayer()
    var index: Int = 0
//    @IBOutlet var sund: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var soundName : String!
    
//音のインスタンスを作成
//    let SinePlayer = try! AVAudioPlayer(data: NSDataAsset(name: "mens-ou1")!.data)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let soundFilePath = Bundle.main.path(forResource: soundName, ofType: "wav")!
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        
        do {
                  audioPlayerInstance = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
        } catch {
            print("AVAudioPlayerインスタンス作成でエラー")
        }
        audioPlayerInstance.prepareToPlay()
        dataArray.append(Data(name: "ドのハンドベル", imageName: "bell1.png"))
        dataArray.append(Data(name: "レのハンドベル", imageName: "bell2.png"))
        dataArray.append(Data(name: "ミのハンドベル", imageName: "bell3.png"))
        dataArray.append(Data(name: "ファのハンドベル", imageName: "bell4.png"))
        dataArray.append(Data(name: "ソのハンドベル", imageName: "bell5.png"))
        dataArray.append(Data(name: "ラのハンドベル", imageName: "bell6.png"))
        dataArray.append(Data(name: "シのハンドベル", imageName: "bell7.png"))
        setUI()
        
//getAccelerometerを取得
        getAccelerometer()
    }
    
    func setUI() {
        imageView.image = dataArray[index].getImage()
        nameLabel.text = dataArray[index].name
        
    }
    
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//
//    }
    
    @IBAction func mae() {
        if(index != 0){
            index = index - 1
            setUI()
        }
    }
    @IBAction func tugi() {
        if(index != 6){
            index = index + 1
            setUI()
        }
    }
    func getAccelerometer() {
        var preBool = false
        var postBool = false
        motionManager.accelerometerUpdateInterval = 1 / 5
        motionManager.startAccelerometerUpdates(to: OperationQueue.current! , withHandler: { [self] (accelerometerData, error) in
            
            guard error == nil else {
                return
            }
            
            let x = accelerometerData!.acceleration.x
            let y = accelerometerData!.acceleration.y
            let z = accelerometerData!.acceleration.z
            let synthetic = (x * x) + (y * y) + (z * z)

            if preBool {
                postBool = true
            }
            
            if !postBool && synthetic >= 3 {
                self.audioPlayerInstance.currentTime = 0         // 再生箇所を頭に移す
                        
                self.audioPlayerInstance.play()                  // 再生する

                
                preBool = true
                
            }
            
            if postBool && synthetic >= 3 {
                self.audioPlayerInstance.currentTime = 0         // 再生箇所を頭に移す
                self.audioPlayerInstance.play()                  // 再生する

                
                postBool = false
                preBool = false
            }
        })
    }
    
    
    func setSound() {
        if(index == 1){
            
            soundName = "sound1"
        }else if(index == 2){
            soundName = "sound2"
            
        }else if(index == 3){
            soundName = "sound3"
        }else if(index == 4){
            soundName = "sound4"
        }else if(index == 5){
            soundName = "sound5"
        }else if(index == 6){
            soundName = "sound6"
        }else if(index == 7){
            soundName = "sound7"
        }
        super.didReceiveMemoryWarning()
    }
    
}


//SoundArray.append(Sound(SoundData: "sound0.wav", SoundName: "ド", SoundImage: "bell1.png"))
//        SoundArray.append(Sound(SoundData: "sound1.wav", SoundName: "レ", SoundImage: "bell2.png"))
//        SoundArray.append(Sound(SoundData: "sound2.wav", SoundName: "ミ", SoundImage: "bell3.png"))
//        SoundArray.append(Sound(SoundData: "sound3.wav", SoundName: "ファ", SoundImage: "bell4.png"))
//        SoundArray.append(Sound(SoundData: "sound4.wav", SoundName: "ソ", SoundImage: "bell5.png"))
//        SoundArray.append(Sound(SoundData: "sound5.wav", SoundName: "ラ", SoundImage: "bell6.png"))
//        SoundArray.append(Sound(SoundData: "sound6.wav", SoundName: "シ", SoundImage: "bell7.png"))

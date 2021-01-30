//
//  PlayerViewController.swift
//  SoundStock
//
//  Created by lot-uni on 2021/01/09.
//

//import AudioToolbox
import UIKit
import CoreMotion
import AVFoundation

class PlayerViewController: UIViewController {
//AVFoundationのセットアップ
    var sound:AVAudioPlayer!
    var audioPlayerInstance : AVAudioPlayer! = nil
    var startAudioPlayer = AVAudioPlayer()
//加速度検知のセットアップ
    let MotionSensor = CMMotionManager()
//SoundDataクラスをインスタンス化
    var SoundArray: [Sound] = []
    
//UIのセットアップ
    @IBOutlet var SoundImage: UIImageView!
    @IBOutlet var SoundName: UILabel!
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SoundArray.append(Sound(SoundName: "ド", SoundImage: "bell1.png", SoundFile: "sound0"))
        SoundArray.append(Sound(SoundName: "レ", SoundImage: "bell2.png", SoundFile: "sound1"))
        SoundArray.append(Sound(SoundName: "ミ", SoundImage: "bell3.png", SoundFile: "sound2"))
        SoundArray.append(Sound(SoundName: "ファ", SoundImage: "bell4.png", SoundFile: "sound3"))
        SoundArray.append(Sound(SoundName: "ソ", SoundImage: "bell5.png", SoundFile: "sound4"))
        SoundArray.append(Sound(SoundName: "ラ", SoundImage: "bell6.png", SoundFile: "sound5"))
        SoundArray.append(Sound(SoundName: "シ", SoundImage: "bell7.png", SoundFile: "sound6"))
        
        setUI()
//getAccelerometer関数を呼び出す
        getAccelerometer()
    }
    func setUI(){
        SoundImage.image = SoundArray[index].getImage()
        SoundName.text = SoundArray[index].SoundName
        let SoundData = URL(fileURLWithPath: Bundle.main.path(forResource: SoundArray[index].SoundFile, ofType: "wav")!)
        sound = try? AVAudioPlayer(contentsOf: SoundData)
    }
    func PlayMethod(){
        setUI()
        sound.play()
    }
    @IBAction func play(){
        self.PlayMethod()
    }
    @IBAction func before(){
        if (index >= 1) {
            index -= 1
            setUI()
        }
    }
    @IBAction func After(){
        if (index <= 5) {
            index += 1
            setUI()
        }
    }
    
    func getAccelerometer() {
//        加速度の更新時間設定0.2秒
        MotionSensor.accelerometerUpdateInterval = 0.2
        
        MotionSensor.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {
            accelerometerData,error in
            let x = accelerometerData!.acceleration.x
            let y = accelerometerData!.acceleration.y
            let z = accelerometerData!.acceleration.z
            let synthetic = (x * x) + (y * y) + (z * z)
            
            if synthetic >= 6 {
                self.PlayMethod()
            }
        })
//        MotionSensor.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(motion:CMDeviceMotion?) in
            
    }

}

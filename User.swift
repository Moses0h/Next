//
//  User.swift
//  NXT
//
//  Created by Moses Oh on 8/10/17.
//  Copyright © 2017 Moses Oh. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
class User{

    var p: AVAudioPlayer!
    var engine: AVAudioEngine!
    var file:  AVAudioFile!
    var buffer: AVAudioPCMBuffer!
    var player:  AVAudioPlayerNode!
    var output: AVAudioOutputNode!
    var mixer: AVAudioMixerNode!
    var mixer3d: AVAudioEnvironmentNode!
    var image: UIImage!
    var title: String!
    var isOn: Bool!
    
    
    init(name: String, img: UIImage) {
        
        guard let filePath1 = Bundle.main.url(forResource: name, withExtension: "wav", subdirectory:"Sounds")     else {
            print("Cannot find file")
            return
        }
        do {
            file = try AVAudioFile(forReading: filePath1)
            
        }
        catch {
            print("Cannot load audiofile!")
        }
        let audioFormat = file.processingFormat
        let audioFrameCount = UInt32(file.length)
        buffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: audioFrameCount)
        do {
            try file.read(into: buffer, frameCount: audioFrameCount)
            print("File loaded")
        }
        catch{
            print("Could not load file into buffer")
        }
        
        do {
            try p = AVAudioPlayer(contentsOf: Bundle.main.url(forResource: name, withExtension: "wav", subdirectory:"Sounds")!)
        }
        catch {
            print("Cannot load audiofile!")
        }
        p.volume = 0.0
        p.isMeteringEnabled = true
        engine = AVAudioEngine()
        player = AVAudioPlayerNode()
        mixer3d = AVAudioEnvironmentNode()
        // Helper function to initialize the player (source) and head (mixer3D or EnvironmentNode)
        // Here we connect the nodes following a signal flow chain
        mixer = engine.mainMixerNode
        engine.attach(player)
        engine.attach(mixer3d)
        player.renderingAlgorithm = AVAudio3DMixingRenderingAlgorithm(rawValue: 2)!
        engine.connect(player, to: mixer3d, format: file.processingFormat)
        engine.connect(mixer3d, to: mixer, format: mixer3d.outputFormat(forBus: 0))
        
        player.scheduleBuffer(buffer, at: nil,completionHandler: nil)
        do {
            try engine.start()
        }
        catch {
            print("Cannot initialize engine")
        }
        
        image = img
        title = name
    }
}
extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return
            lhs.p == rhs.p &&
            lhs.engine == rhs.engine &&
            lhs.file == rhs.file &&
            lhs.buffer == rhs.buffer &&
            lhs.player == rhs.player &&
            lhs.output == rhs.output &&
            lhs.mixer == rhs.mixer &&
            lhs.mixer3d == rhs.mixer3d &&
            lhs.image == rhs.image &&
            lhs.title == rhs.title &&
            lhs.isOn == rhs.isOn
       
    }
}

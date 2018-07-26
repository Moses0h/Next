//
//  SoundManager.swift
//  NXT
//
//  Created by Moses Oh on 8/6/17.
//  Copyright © 2017 Moses Oh. All rights reserved.
//

import Foundation
import AVFoundation



class SoundManager{
    
    var p1: AVAudioPlayer!
    var engine1: AVAudioEngine!
    var file1:  AVAudioFile!
    var buffer1: AVAudioPCMBuffer!
    var player1:  AVAudioPlayerNode!
    var output1: AVAudioOutputNode!
    var mixer1: AVAudioMixerNode!
    var mixer3d1: AVAudioEnvironmentNode!
    
    var p2: AVAudioPlayer!
    var engine2: AVAudioEngine!
    var file2:  AVAudioFile!
    var buffer2: AVAudioPCMBuffer!
    var player2:  AVAudioPlayerNode!
    var output2: AVAudioOutputNode!
    var mixer2: AVAudioMixerNode!
    var mixer3d2: AVAudioEnvironmentNode!
    var selectedAlgorithm2: Int!
    
    var p3: AVAudioPlayer!
    var engine3: AVAudioEngine!
    var file3:  AVAudioFile!
    var buffer3: AVAudioPCMBuffer!
    var player3:  AVAudioPlayerNode!
    var output3: AVAudioOutputNode!
    var mixer3: AVAudioMixerNode!
    var mixer3d3: AVAudioEnvironmentNode!
    
    func Init1(){
        guard let filePath1 = Bundle.main.url(forResource: "mo", withExtension: "wav", subdirectory:"Sounds")     else {
            print("Cannot find file")
            return
        }
        do {
            file1 = try AVAudioFile(forReading: filePath1)
            
        }
        catch {
            print("Cannot load audiofile!")
        }
        let audioFormat1 = file1.processingFormat
        let audioFrameCount1 = UInt32(file1.length)
        buffer1 = AVAudioPCMBuffer(pcmFormat: audioFormat1, frameCapacity: audioFrameCount1)
        do {
            try file1.read(into: buffer1, frameCount: audioFrameCount1)
            print("File loaded")
        }
        catch{
            print("Could not load file into buffer")
        }
        
        do {
            try p1 = AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "mo", withExtension: "wav", subdirectory:"Sounds")!)
        }
        catch {
            print("Cannot load audiofile!")
        }
        p1.volume = 0.0
        p1.isMeteringEnabled = true
        engine1 = AVAudioEngine()
        player1 = AVAudioPlayerNode()
        mixer3d1 = AVAudioEnvironmentNode()
        // Helper function to initialize the player (source) and head (mixer3D or EnvironmentNode)
        // Here we connect the nodes following a signal flow chain
        mixer1 = engine1.mainMixerNode
        engine1.attach(player1)
        engine1.attach(mixer3d1)
        player1.renderingAlgorithm = AVAudio3DMixingRenderingAlgorithm(rawValue: 2)!
        engine1.connect(player1, to: mixer3d1, format: file1.processingFormat)
        engine1.connect(mixer3d1, to: mixer1, format: mixer3d1.outputFormat(forBus: 0))
        
        player1.scheduleBuffer(buffer1, at: nil,completionHandler: nil)
        do {
            try engine1.start()
        }
        catch {
            print("Cannot initialize engine")
        }

    }
    func Init2(){
        guard let filePath2 = Bundle.main.url(forResource: "an", withExtension: "wav", subdirectory:"Sounds")     else {
            print("Cannot find file")
            return
        }
        do {
            file2 = try AVAudioFile(forReading: filePath2)
        }
        catch {
            print("Cannot load audiofile!")
        }
        let audioFormat2 = file2.processingFormat
        let audioFrameCount2 = UInt32(file2.length)
        buffer2 = AVAudioPCMBuffer(pcmFormat: audioFormat2, frameCapacity: audioFrameCount2)
        do {
            try file2.read(into: buffer2, frameCount: audioFrameCount2)
            print("File loaded")
        }
        catch{
            print("Could not load file into buffer")
        }
        do {
            try p2 = AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "an", withExtension: "wav", subdirectory:"Sounds")!)
        }
        catch {
            print("Cannot load audiofile!")
        }
        p2.volume = 0.0
        p2.isMeteringEnabled = true
        engine2 = AVAudioEngine()
        player2 = AVAudioPlayerNode()
        mixer3d2 = AVAudioEnvironmentNode()
        // Helper function to initialize the player (source) and head (mixer3D or EnvironmentNode)
        // Here we connect the nodes following a signal flow chain
        mixer2 = engine2.mainMixerNode
        engine2.attach(player2)
        engine2.attach(mixer3d2)
        player2.renderingAlgorithm = AVAudio3DMixingRenderingAlgorithm(rawValue: 2)!
        engine2.connect(player2, to: mixer3d2, format: file2.processingFormat)
        engine2.connect(mixer3d2, to: mixer2, format: mixer3d2.outputFormat(forBus: 0))
        
        player2.scheduleBuffer(buffer2, at: nil, completionHandler: nil)
        do {
            try engine2.start()
        }
        catch {
            print("Cannot initialize engine")
        }

    }
    func Init3(){
        guard let filePath3 = Bundle.main.url(forResource: "al", withExtension: "wav", subdirectory:"Sounds")     else {
            print("Cannot find file")
            return
        }
        do {
            file3 = try AVAudioFile(forReading: filePath3)
        }
        catch {
            print("Cannot load audiofile!")
        }
        let audioFormat3 = file3.processingFormat
        let audioFrameCount3 = UInt32(file3.length)
        buffer3 = AVAudioPCMBuffer(pcmFormat: audioFormat3, frameCapacity: audioFrameCount3)
        do {
            try file3.read(into: buffer3, frameCount: audioFrameCount3)
            print("File loaded")
        }
        catch{
            print("Could not load file into buffer")
        }
        do {
            try p3 = AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "al", withExtension: "wav", subdirectory:"Sounds")!)
        }
        catch {
            print("Cannot load audiofile!")
        }
        p3.volume = 0.0
        p3.isMeteringEnabled = true
        engine3 = AVAudioEngine()
        player3 = AVAudioPlayerNode()
        mixer3d3 = AVAudioEnvironmentNode()
        // Helper function to initialize the player (source) and head (mixer3D or EnvironmentNode)
        // Here we connect the nodes following a signal flow chain
        mixer3 = engine3.mainMixerNode
        engine3.attach(player3)
        engine3.attach(mixer3d3)
        player3.renderingAlgorithm = AVAudio3DMixingRenderingAlgorithm(rawValue: 2)!
        engine3.connect(player3, to: mixer3d3, format: file3.processingFormat)
        engine3.connect(mixer3d3, to: mixer3, format: mixer3d3.outputFormat(forBus: 0))
        
        player3.scheduleBuffer(buffer3, at: nil, completionHandler: nil)
        do {
            try engine3.start()
        }
        catch {
            print("Cannot initialize engine")
        }
        

    }
}

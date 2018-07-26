//
//  ViewController.swift
//  NXT
//
//  Created by Student on 7/23/17.
//  Copyright © 2017 Moses Oh. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMotion
var arrayOfSpots : Array<UIButton> = []
var arrayOfDb : Array<UIImageView> = []
var users : Array<User> = []
var indexOfSound : Int?
var circle : UIImageView!
class ViewController: UIViewController, AVAudioPlayerDelegate{
    // User class
    var counter1 = 0
    var counter2 = 0
    var counter3 = 0
    var counter4 = 0
    var counter5 = 0
    var counter6 = 0
    var counter7 = 0

    //
    var ownercenter: CGPoint!
    var callcounter = 0
    var virtcounter = 1
    var lockcounter = 1
    var popUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "contactView") as! contactList
    var arrayOfFocus: Array<String> = []
    var motionManager : CMMotionManager!
    var arrayOfIndex : Array<Int> = []
    var arrayOfUserson : Array<AVAudioPlayer> = []
    @IBOutlet weak var owner: UIButton!
    @IBOutlet weak var user1: UIButton!
    @IBOutlet weak var user2: UIButton!
    @IBOutlet weak var user3: UIButton!
    @IBOutlet weak var user4: UIButton!
    @IBOutlet weak var user5: UIButton!
    @IBOutlet weak var user6: UIButton!
    @IBOutlet weak var user7: UIButton!
    
    @IBOutlet weak var user1db: UIImageView!
    @IBOutlet weak var user2db: UIImageView!
    @IBOutlet weak var user3db: UIImageView!
    @IBOutlet weak var user4db: UIImageView!
    @IBOutlet weak var user5db: UIImageView!
    @IBOutlet weak var user6db: UIImageView!
    @IBOutlet weak var user7db: UIImageView!

    @IBOutlet weak var cent: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        users.append(User(name: "mo", img: #imageLiteral(resourceName: "MO")))
        users.append(User(name: "an", img: #imageLiteral(resourceName: "AN")))
        users.append(User(name: "al", img: #imageLiteral(resourceName: "AL")))
        users.append(User(name: "BC", img: #imageLiteral(resourceName: "BC")))
        users.append(User(name: "JP", img: #imageLiteral(resourceName: "JP")))
        users.append(User(name: "MK", img: #imageLiteral(resourceName: "MK")))
        users.append(User(name: "WK", img: #imageLiteral(resourceName: "WK")))

        
        owner.addTarget(self, action: #selector(drag(control:event:)), for: UIControlEvents.touchDragInside)
        owner.addTarget(self, action: #selector(drag(control:event:)), for: [UIControlEvents.touchDragExit, UIControlEvents.touchDragOutside])
        
        arrayOfSpots.append(user1)
        arrayOfSpots.append(user2)
        arrayOfSpots.append(user3)
        arrayOfSpots.append(user4)
        arrayOfSpots.append(user5)
        arrayOfSpots.append(user6)
        arrayOfSpots.append(user7)
        
        arrayOfDb.append(user1db)
        arrayOfDb.append(user2db)
        arrayOfDb.append(user3db)
        arrayOfDb.append(user4db)
        arrayOfDb.append(user5db)
        arrayOfDb.append(user6db)
        arrayOfDb.append(user7db)

        circle = cent
        ownercenter = owner.center
        
        placeBack()

        let lp1 = UILongPressGestureRecognizer(target: self, action: #selector(longpress1(sender:)))
        lp1.minimumPressDuration = 0.3
        let lp2 = UILongPressGestureRecognizer(target: self, action: #selector(longpress2(sender:)))
        lp2.minimumPressDuration = 0.3
        let lp3 = UILongPressGestureRecognizer(target: self, action: #selector(longpress3(sender:)))
        lp3.minimumPressDuration = 0.3
        let lp4 = UILongPressGestureRecognizer(target: self, action: #selector(longpress4(sender:)))
        lp4.minimumPressDuration = 0.3
        let lp5 = UILongPressGestureRecognizer(target: self, action: #selector(longpress5(sender:)))
        lp5.minimumPressDuration = 0.3
        let lp6 = UILongPressGestureRecognizer(target: self, action: #selector(longpress6(sender:)))
        lp6.minimumPressDuration = 0.3
        let lp7 = UILongPressGestureRecognizer(target: self, action: #selector(longpress7(sender:)))
        lp7.minimumPressDuration = 0.3

        arrayOfSpots[0].addGestureRecognizer(lp1)
        arrayOfSpots[1].addGestureRecognizer(lp2)
        arrayOfSpots[2].addGestureRecognizer(lp3)
        arrayOfSpots[3].addGestureRecognizer(lp4)
        arrayOfSpots[4].addGestureRecognizer(lp5)
        arrayOfSpots[5].addGestureRecognizer(lp6)
        arrayOfSpots[6].addGestureRecognizer(lp7)
        
        motionManager = CMMotionManager()
        motionManager.deviceMotionUpdateInterval = 1/40

    }
    func longpress1(sender : UIGestureRecognizer){
        popUp.clicked = 0
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
    }
    
    @IBAction func press1(_ sender: UIButton) {
        if(sender.image(for: .normal) != #imageLiteral(resourceName: "circlebutton"))
        {
        if(counter1 % 2 == 0)
        {
            for user in users{
                if(user.title == sender.currentTitle)
                {
                    arrayOfFocus.append(user.title)
                }
            }
            for user in users{
                if arrayOfFocus.contains(user.title)
                {
                    user.player.volume = 1
                }
                else{
                    user.player.volume = 0.1
                }
            }
            arrayOfSpots[0].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            counter1 += 1
        }
        else if(counter1 % 2 != 0){
            arrayOfFocus.remove(at: arrayOfFocus.index(of: sender.currentTitle!)!)
            if(arrayOfFocus.isEmpty)
            {
                for user in users{
                        user.player.volume = 1
                }
            }
            else{
                for user in users{
                    if(user.title == sender.currentTitle)
                    {
                        user.player.volume = 0.1
                    }
                }
            }
            arrayOfSpots[0].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            counter1 += 1
        }
        }
        }
    func longpress2(sender : UIGestureRecognizer){
        popUp.clicked = 1
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)

    }
    @IBAction func press2(_ sender: UIButton) {
        if(sender.image(for: .normal) != #imageLiteral(resourceName: "circlebutton"))
        {
        if(counter2 % 2 == 0)
        {
            for user in users{
                if(user.title == sender.currentTitle)
                {
                    arrayOfFocus.append(user.title)
                }
            }
            for user in users{
                if arrayOfFocus.contains(user.title)
                {
                    user.player.volume = 1
                }
                else{
                    user.player.volume = 0.1
                }
            }
            arrayOfSpots[1].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            counter2 += 1
        }
        else if(counter2 % 2 != 0){
            arrayOfFocus.remove(at: arrayOfFocus.index(of: sender.currentTitle!)!)
            if(arrayOfFocus.isEmpty)
            {
                for user in users{
                    user.player.volume = 1
                }
            }
            else{
                for user in users{
                    if(user.title == sender.currentTitle)
                    {
                        user.player.volume = 0.1
                    }
                }
            }
            arrayOfSpots[1].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            counter2 += 1
        }
        }
    }
    func longpress3(sender : UIGestureRecognizer){
        popUp.clicked = 2
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
    }
    @IBAction func press3(_ sender: UIButton) {
        if(sender.image(for: .normal) != #imageLiteral(resourceName: "circlebutton"))
        {
        if(counter3 % 2 == 0)
        {
            for user in users{
                if(user.title == sender.currentTitle)
                {
                    arrayOfFocus.append(user.title)
                }
            }
            for user in users{
                if arrayOfFocus.contains(user.title)
                {
                    user.player.volume = 1
                }
                else{
                    user.player.volume = 0.1
                }
            }
            arrayOfSpots[2].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            counter3 += 1
        }
        else if(counter3 % 2 != 0){
            arrayOfFocus.remove(at: arrayOfFocus.index(of: sender.currentTitle!)!)
            if(arrayOfFocus.isEmpty)
            {
                for user in users{
                    user.player.volume = 1
                }
            }
            else{
                for user in users{
                    if(user.title == sender.currentTitle)
                    {
                        user.player.volume = 0.1
                    }
                }
            }
            arrayOfSpots[2].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            counter3 += 1
        }
        }
                  }
    func longpress4(sender : UIGestureRecognizer){
        popUp.clicked = 3
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
    }
    @IBAction func press4(_ sender: UIButton) {
        if(sender.image(for: .normal) != #imageLiteral(resourceName: "circlebutton"))
        {
        if(counter4 % 2 == 0)
        {
            for user in users{
                if(user.title == sender.currentTitle)
                {
                    arrayOfFocus.append(user.title)
                }
            }
            for user in users{
                if arrayOfFocus.contains(user.title)
                {
                    user.player.volume = 1
                }
                else{
                    user.player.volume = 0.1
                }
            }
            arrayOfSpots[3].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            counter4 += 1
        }
        else if(counter4 % 2 != 0){
            arrayOfFocus.remove(at: arrayOfFocus.index(of: sender.currentTitle!)!)
            if(arrayOfFocus.isEmpty)
            {
                for user in users{
                    user.player.volume = 1
                }
            }
            else{
                for user in users{
                    if(user.title == sender.currentTitle)
                    {
                        user.player.volume = 0.1
                    }
                }
            }
            arrayOfSpots[3].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            counter4 += 1
        }
        }
            }
    func longpress5(sender : UIGestureRecognizer){
        popUp.clicked = 4
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
    }
    @IBAction func press5(_ sender: UIButton) {
        if(sender.image(for: .normal) != #imageLiteral(resourceName: "circlebutton"))
        {
            if(counter5 % 2 == 0)
            {
                for user in users{
                    if(user.title == sender.currentTitle)
                    {
                        arrayOfFocus.append(user.title)
                    }
                }
                for user in users{
                    if arrayOfFocus.contains(user.title)
                    {
                        user.player.volume = 1
                    }
                    else{
                        user.player.volume = 0.1
                    }
                }
                arrayOfSpots[4].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                counter5 += 1
            }
            else if(counter5 % 2 != 0){
                arrayOfFocus.remove(at: arrayOfFocus.index(of: sender.currentTitle!)!)
                if(arrayOfFocus.isEmpty)
                {
                    for user in users{
                        user.player.volume = 1
                    }
                }
                else{
                    for user in users{
                        if(user.title == sender.currentTitle)
                        {
                            user.player.volume = 0.1
                        }
                    }
                }
                arrayOfSpots[4].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                counter5 += 1
            }
        }
    }
    func longpress6(sender : UIGestureRecognizer){
        popUp.clicked = 5
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
    }
    @IBAction func press6(_ sender: UIButton) {
        if(sender.image(for: .normal) != #imageLiteral(resourceName: "circlebutton"))
        {
        if(counter6 % 2 == 0)
        {
            for user in users{
                if(user.title == sender.currentTitle)
                {
                    arrayOfFocus.append(user.title)
                }
            }
            for user in users{
                if arrayOfFocus.contains(user.title)
                {
                    user.player.volume = 1
                }
                else{
                    user.player.volume = 0.1
                }
            }
            arrayOfSpots[5].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            counter6 += 1
        }
        else if(counter6 % 2 != 0){
            arrayOfFocus.remove(at: arrayOfFocus.index(of: sender.currentTitle!)!)
            if(arrayOfFocus.isEmpty)
            {
                for user in users{
                    user.player.volume = 1
                }
            }
            else{
                for user in users{
                    if(user.title == sender.currentTitle)
                    {
                        user.player.volume = 0.1
                    }
                }
            }
            arrayOfSpots[5].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            counter6 += 1
        }
        }
    }
    func longpress7(sender : UIGestureRecognizer){
        popUp.clicked = 6
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
    }
    @IBAction func press7(_ sender: UIButton) {
        if(sender.image(for: .normal) != #imageLiteral(resourceName: "circlebutton"))
        {
        if(counter7 % 2 == 0)
        {
            for user in users{
                if(user.title == sender.currentTitle)
                {
                    arrayOfFocus.append(user.title)
                }
            }
            for user in users{
                if arrayOfFocus.contains(user.title)
                {
                    user.player.volume = 1
                }
                else{
                    user.player.volume = 0.1
                }
            }
            arrayOfSpots[6].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            counter7 += 1
        }
        else if(counter7 % 2 != 0){
            arrayOfFocus.remove(at: arrayOfFocus.index(of: sender.currentTitle!)!)
            if(arrayOfFocus.isEmpty)
            {
                for user in users{
                    user.player.volume = 1
                }
            }
            else{
                for user in users{
                    if(user.title == sender.currentTitle)
                    {
                        user.player.volume = 0.1
                    }
                }
            }
            arrayOfSpots[6].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            counter7 += 1
        }
        }
    }
    
    
    func drag(control: UIControl, event: UIEvent) {
        
        if let center = event.allTouches?.first?.location(in: self.view) {
            if (sqrt(pow(abs(center.x-circle.center.x),2)+pow(abs(center.y-circle.center.y),2)) < 150)
            {
            control.center = center
            for user in users{
                if(user.isOn != nil)
                {
                    if(center.x >= circle.center.x && center.y <= circle.center.y)
                    {
                       
                                user.mixer3d.listenerPosition.x = Float(center.x - circle.center.x)/3
                                user.mixer3d.listenerPosition.z = -(Float(circle.center.y-center.y))/3
                        
                    }
                    else if(center.x <= circle.center.x && center.y <= circle.center.y)
                        
                    {
                       
                                user.mixer3d.listenerPosition.x = -Float(circle.center.x-center.x)/3
                                user.mixer3d.listenerPosition.z = -(Float(circle.center.y-center.y))/3
                        
                    }
                    else if(center.x <= circle.center.x && center.y >= circle.center.y)
                    {
                        
                                user.mixer3d.listenerPosition.x = -Float(circle.center.x-center.x)/3
                                user.mixer3d.listenerPosition.z = Float(center.y - circle.center.y)/3
                        
                    }
                    else if(center.x >= circle.center.x && center.y >= circle.center.y)
                    {
                                user.mixer3d.listenerPosition.x = Float(center.x - circle.center.x)/3
                                user.mixer3d.listenerPosition.z = Float(center.y - circle.center.y)/3
                       
                    }

                }
            }
            }
        }
    }
    
    func placeBack(){
        
        if(ownercenter.x >= circle.center.x && ownercenter.y <= circle.center.y)
        {
            for user in users{
                user.mixer3d.listenerPosition.x = Float(ownercenter.x - circle.center.x)/3
                user.mixer3d.listenerPosition.z = -(Float(circle.center.y-ownercenter.y))/3
            }
            
        }
        else if(ownercenter.x <= circle.center.x && ownercenter.y <= circle.center.y)
            
        {
            for user in users{
                user.mixer3d.listenerPosition.x = -Float(circle.center.x-ownercenter.x)/3
                user.mixer3d.listenerPosition.z = -(Float(circle.center.y-ownercenter.y))/3
            }
            
        }
        else if(ownercenter.x <= circle.center.x && ownercenter.y >= circle.center.y)
        {
            for user in users{
                user.mixer3d.listenerPosition.x = -Float(circle.center.x-ownercenter.x)/3
                user.mixer3d.listenerPosition.z = Float(ownercenter.y - circle.center.y)/3
            }
            
        }
        else if(ownercenter.x >= circle.center.x && ownercenter.y >= circle.center.y)
        {
            for user in users{
                user.mixer3d.listenerPosition.x = Float(ownercenter.x - circle.center.x)/3
                user.mixer3d.listenerPosition.z = Float(ownercenter.y - circle.center.y)/3
            }
            
        }
        
        
    }

    func isEmpty() -> Bool{
        var x = true
        for button in arrayOfSpots{
            if(button.image(for: .normal) != #imageLiteral(resourceName: "circlebutton"))
            {
                x = false
            }
        }
        return x
    }
    
    
    
    //button functions
    
    @IBOutlet weak var test: UIImageView!
    @IBOutlet weak var glow1: UIImageView!
    @IBOutlet weak var glow2: UIImageView!
    @IBOutlet weak var glow3: UIImageView!
    @IBOutlet var views: UIImageView!
    
    
    @IBAction func onCall(_ sender: UIButton) {
        if(callcounter%2 == 0)
        {
            if(isEmpty() == false)
            {
            UIView.animate(withDuration: 0.5, animations: {
                self.test.transform = CGAffineTransform(rotationAngle: 2.355)
            })
            for user in users{
                if(user.isOn != nil)
                {
                    user.player.play()
                    user.p.play()
                    for button in arrayOfSpots{
                        if(button.image(for: .normal) == user.image)
                        {
                            arrayOfUserson.append(user.p)
                            arrayOfIndex.append(arrayOfSpots.index(of: button)!)
                        }
                    }
                }
            }
            
            motionManager.startDeviceMotionUpdates(using: CMAttitudeReferenceFrame.xArbitraryZVertical, to: OperationQueue.main) {
                (motion: CMDeviceMotion?, _) in
                for x in 0...self.arrayOfIndex.count-1{
                    self.arrayOfUserson[x].updateMeters()
                    UIView.animate(withDuration: 0.2, animations: {
                        if(self.arrayOfUserson[x].peakPower(forChannel: 0) > -10)
                        {
                            arrayOfDb[self.arrayOfIndex[x]].transform = CGAffineTransform(scaleX: CGFloat(1.0 + 1-(-self.arrayOfUserson[x].peakPower(forChannel: 0)/10)), y: CGFloat(1.0 + 1-(-self.arrayOfUserson[x].peakPower(forChannel: 0)/10)))
                        }
                    })
                }
            }
            callcounter += 1
            }
        }
        else if(callcounter%2 != 0)
        {
            motionManager.stopDeviceMotionUpdates()
            for img in arrayOfDb{
                img.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
            for user in users{
                user.player.pause()
                user.p.pause()
            }
            callcounter += 1
            UIView.animate(withDuration: 0.5, animations: {
                self.test.transform = CGAffineTransform(rotationAngle: 0)
            })
        }

    }
       
    @IBAction func onReset(_ sender: UIButton) {
        if(callcounter%2 == 0)
        {
           
            for buttons in arrayOfSpots{
                buttons.setImage(#imageLiteral(resourceName: "circlebutton"), for: .normal)
                buttons.setTitle("", for: .normal)
                buttons.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
            for user in users{
                user.player.pause()
                user.p.pause()
                user.isOn = nil
            }
            arrayOfUserson.removeAll()
            arrayOfIndex.removeAll()
            arrayOfFocus.removeAll()
        }
    
    }
    
    
    @IBOutlet weak var returnbtn: UIImageView!
    @IBAction func onReturn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.owner.center = self.ownercenter
        })
        placeBack()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



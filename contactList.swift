//
//  contactList.swift
//  NXT
//
//  Created by Moses Oh on 8/6/17.
//  Copyright © 2017 Moses Oh. All rights reserved.
//

import UIKit
import AVFoundation


class contactList: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var list: UICollectionView!
    
    var clicked: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        list.layer.cornerRadius = 10;
        list.layer.masksToBounds = true;
        self.list.delegate = self
        self.list.dataSource = self
        //
        
       
    }
   
    @IBAction func exitButton(_ sender: UIButton) {
        
        removeAnimate()
    }
    @IBAction func exit(_ sender: UIButton) {
        // let x = IndexPath(item: users.index(of: sender.image(for: .normal)!)!, section: 0)
        //users.remove(at: users.index(of: sender.image(for: .normal)!)!)
        //list.deleteItems(at: [x])
        for user in users{
            if(sender.currentTitle == user.title)
            {
                arrayOfSpots[clicked].setImage(user.image, for: .normal)
                arrayOfSpots[clicked].setTitle(user.title, for: .normal)
                calculate(player: user.player, x: arrayOfSpots[clicked].center.x, y: arrayOfSpots[clicked].center.y)
                user.isOn = true
                
            }
        }
        removeAnimate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friend", for: indexPath) as! contactListCell
        cell.contactAction.setImage(users[indexPath.row].image, for: .normal)
        cell.contactAction.setTitle(users[indexPath.row].title, for: .normal)
        return cell
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.05, y:1.05)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
            self.view.transform = CGAffineTransform.identity
        }, completion: nil)    }
    
    func removeAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 0.98, y:0.98)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
            self.view.transform = CGAffineTransform.identity
        }, completion: {(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        })
    }
    
    func calculate(player: AVAudioPlayerNode, x: CGFloat, y: CGFloat)
    {
        if(x >= circle.center.x && y <= circle.center.y)
        {
            player.position.x = Float(x - circle.center.x)/3
            player.position.z = -(Float(circle.center.y-y))/3
           	
            
        }
        else if(x <= circle.center.x && y <= circle.center.y)
            
        {
            player.position.x = -Float(circle.center.x-x)/3
            player.position.z = -(Float(circle.center.y-y))/3
            
            
        }
        else if(x <= circle.center.x && y >= circle.center.y)
        {
            player.position.x = -Float(circle.center.x-x)/3
            player.position.z = Float(y - circle.center.y)/3
            
        }
        else if(x >= circle.center.x && y >= circle.center.y)
        {
            player.position.x = Float(x - circle.center.x)/3
            player.position.z = Float(y - circle.center.y)/3
        }
        
    }

    
}

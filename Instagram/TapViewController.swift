//
//  TapViewController.swift
//  Instagram
//
//  Created by Dhriti Chawla on 2/6/18.
//  Copyright © 2018 Dhriti Chawla. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TapViewController: UIViewController {
    
    @IBOutlet weak var uploadImage: PFImageView!
    @IBOutlet weak var myCaption: UILabel!
    @IBOutlet weak var myUser: UILabel!
    @IBOutlet weak var myTime: UILabel!
    
    var instagramPost: PFObject!
    
//    var instagramPost: PFObject! {
//        willSet {
//
//
//            print()
//            //print(myCaption.text!)
//           // print(uploadImage.file)
//            print(newValue["caption"])
//
//            self.myCaption.text = newValue["caption"] as?
//            self.myUser.text = PFUser.current()!.username
//            self.uploadImage.file = newValue["media"] as? PFFile
//            self.uploadImage.loadInBackground()
//            self.myTime.text = "\(instagramPost.createdAt!)"
//
//        }
//    }
    
    func timeStamp(seconds: Int!) -> String{
        var date : String = ""
        
        if seconds < 60 {
            date = "1m"
        }
        else if seconds < 3600 {
            date = "\(seconds / 60)m"
        }
        else if seconds < 86400 {
            date = "\(seconds / 3600)h"
        }
        else {
            date = "\(seconds / 86400)d"
        }
        
        return date
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCaption.text = instagramPost["caption"] as? String
        self.myUser.text = PFUser.current()!.username
        self.uploadImage.file = instagramPost["media"] as? PFFile
        self.uploadImage.loadInBackground()
        self.myTime.text = "\(instagramPost.createdAt!)"

        // Do any additional setup after loading the view.
        
        print("comes here")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

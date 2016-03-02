//
//  PhotosViewController.swift
//  Instagram2.0
//
//  Created by Victor Li Wang on 3/1/16.
//  Copyright © 2016 Victor Li Wang. All rights reserved.
//

import UIKit
import Parse

class PhotosViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                print(media[0]["caption"])
                print("media fetched")
                // do something with the data fetched
            } else {
                print("media failed to be fetched")
                // handle error
            }
        }
        
        
        //        var query = PFQuery(className: "UserMedia")
        //        query.getObjectInBackgroundWithId("imkmJsHVIH") {
        //            (userMedia: PFObject?, error: NSError?) -> Void in
        //            if error == nil && gameScore != nil {
        //                print(userMedia)
        //            } else {
        //                print(error)
        //            }
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

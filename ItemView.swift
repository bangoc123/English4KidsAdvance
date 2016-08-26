//
//  ItemView.swift
//  English4Kids
//
//  Created by Ngoc on 8/25/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class ItemView: UIViewController {

    
    @IBOutlet weak var imv_Item: UIImageView!
    
    var path:String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imv_Item.image = UIImage(named: "\(path)")
        
        imv_Item.contentMode = .ScaleAspectFit

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

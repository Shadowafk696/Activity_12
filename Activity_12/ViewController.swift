//
//  ViewController.swift
//  Activity_12
//
//  Created by Alumno IDS on 12/04/18.
//  Copyright © 2018 Alumno IDS. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
    @IBOutlet weak var Cell: UITableViewCell!
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var Table: UITableView!
    var Change = 0;
    
    @objc public func Appear(gesture: UIGestureRecognizer) {
        let Size: CGRect = UIScreen.main.bounds
        if (gesture.view as? UIImageView) != nil && (Change == 0) {
            print("Fap, digo Tap")
            UIView.animate(withDuration: 0.50, delay: 0, options: .curveLinear, animations: {
                self.Image.frame = CGRect(x: 0, y: 0, width: Size.width*0.8, height: Size.height*0.8)
                self.Cell.backgroundColor = .blue
            }, completion: nil)
            Change = 1
        }
        else if (Change == 1) {
            UIView.animate(withDuration: 0.50, delay: 0, options: .curveLinear, animations: {
                self.Image.frame = CGRect(x: 0, y: 0, width: Size.width / 2, height: Size.height / 2)
                self.Cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }, completion: nil)
            Change = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.Appear(gesture:)))
        // add it to the image view;
        Image.addGestureRecognizer(tap)
        // make sure imageView can be interacted with by user
        Image.isUserInteractionEnabled = true        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


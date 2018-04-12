//
//  ViewController.swift
//  Activity_12
//
//  Created by Alumno IDS on 12/04/18.
//  Copyright © 2018 Alumno IDS. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  //Se llaman las variables que se alojan sobre nuestro storyboard.
    @IBOutlet weak var Cell: UITableViewCell!
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var Table: UITableView!
    var Change = 0;
    
    @objc public func Appear(gesture: UIGestureRecognizer) {
        let Size: CGRect = UIScreen.main.bounds
        if (gesture.view as? UIImageView) != nil && (Change == 0) {
            //Se genera un mensaje el cual corrobora que si este trabajando el tap sobre la imagen
            print("Fap, digo Tap")
            //Se genera posicion, y tamaño de la imagen al dar clic
            UIView.animate(withDuration: 0.50, delay: 0, options: .curveLinear, animations: {
                self.Image.frame = CGRect(x: 0, y: 0, width: Size.width*0.8, height: Size.height*0.8)
                //Se cambia el color de la celda trabajada al dar clic sobre la imagen que se encuentra posicionada.
                self.Cell.backgroundColor = .blue
            }, completion: nil)
            Change = 1
        }
            //Aqui se instancia igual el tamaño y posicion pero al regresar de nuevo con su background original.
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
        //Se genera el gestureRecognizer para la imagen
        Image.addGestureRecognizer(tap)
        
        Image.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


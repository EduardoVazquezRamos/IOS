//
//  AgregarViewController.swift
//  AppDemo
//
//  Created by ADMINISTRADORUTM on 06/12/16.
//  Copyright © 2016 cursodeios. All rights reserved.
//

import UIKit

protocol AgregarViewControllerDelegate{
    func modificarRegistro(nombre: String, edad: Int, fila : Int)
    func agregarRegistro(nombre: String, edad: Int )
    
}

class AgregarViewController: UIViewController {

  var Nombre = ""
    var Edad : Int = 0
    var fila = -1
    
    @IBAction func btnGuardar_Click(_ sender: Any) {
        if delegado != nil{
            if (txbNombre.text != nil && (txbNombre.text?.characters.count)! > 0) && (txbNumero.text != nil && (txbNumero.text?.characters.count)! > 0)
            {
                if fila == -1 {delegado?.agregarRegistro(nombre: txbNombre.text!, edad: Int(txbNumero.text!)!)
                } else {
                    delegado?.modificarRegistro(nombre: txbNombre.text!, edad: Int(txbNumero.text!)!, fila: fila)
                }
                self.navigationController?.popViewController(animated: true)
            }
            else {
                let alert = UIAlertController(title: "Error", message: "Los campos introducidos no son válidos.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) in })
                let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: {(UIAlertAction) in })
                
                alert.addAction(defaultAction)
                alert.addAction(cancelAction)
                present(alert, animated: true, completion: {
                    
                })
            }
        }
    }
    @IBOutlet weak var txbNombre: UITextField!
    
    @IBOutlet weak var txbNumero: UITextField!
    
    var delegado : AgregarViewControllerDelegate? = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()
        txbNombre.text = Nombre
        txbNumero.text = "\(Edad)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



//
//  ViewController.swift
//  AppDemo
//
//  Created by ADMINISTRADORUTM on 05/12/16.
//  Copyright © 2016 cursodeios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetalleViewControllerDelegate, AgregarViewControllerDelegate {
    
    
    @IBAction func btnAgregar_Click(_ sender: Any) {
        performSegue(withIdentifier: "Agregar Segue", sender: self)
    }
    
    @IBOutlet weak var tblTabla: UITableView!
    var arreglo = [("Eduardo",20), ("Luisa", 19), ("Alan", 26), ("Dulio",40)]
    var filaSeleccionada = -1
    var esEdicion = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Vista cargada")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numeroCambiado(numero: Int) {
        print("Numero cambiado: \(numero)")
        arreglo[numero].1 = arreglo[numero].1 + 1
        tblTabla.reloadData()
    }
    func modificarRegistro(nombre: String, edad: Int, fila: Int) {
        arreglo.remove(at: fila)
        arreglo.insert((nombre,edad), at: fila)
        tblTabla.reloadData()
    }
    //MARK: - UIView Delegates
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier! {
            case "Detalle Segue":
                let view = segue.destination as! DetalleViewController
                view.numeroFila = filaSeleccionada
                view.dato = arreglo[filaSeleccionada].0
                view.datoNumero = arreglo[filaSeleccionada].1
                view.delegado = self
            break
            
            case "Agregar Segue":
                let view = segue.destination as! AgregarViewController
                if (esEdicion){
                    view.fila = filaSeleccionada
                    view.Nombre = arreglo[filaSeleccionada].0
                    view.Edad = arreglo[filaSeleccionada].1
                    esEdicion = false
                }
                view.delegado = self
            break
        default:
            break
        
        }
        
        
        
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return arreglo.count
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let eliminar = UITableViewRowAction(style: .destructive, title: "Borrar", handler: borrarFila)
        let editar = UITableViewRowAction(style: .normal, title: "Editar", handler: editarFila)
        
        return [eliminar, editar]
    }
    func borrarFila(sender : UITableViewRowAction, indexPath : IndexPath){
        arreglo.remove(at: indexPath.row)
        tblTabla.reloadData()
        
    }
    func editarFila(sender : UITableViewRowAction, indexPath : IndexPath){
        esEdicion = true
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "Agregar Segue", sender: sender)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let proto = (indexPath.row % 2 == 0) ? "proto1" : "proto2"
        let vista = tableView.dequeueReusableCell(withIdentifier: proto, for: indexPath) as! FilaTableViewCell
        vista.lblIzquierda.text = arreglo[indexPath.row].0
        vista.lblDerecha.text = "\(arreglo[indexPath.row].1)"
        
        return vista
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Fila\(indexPath.row)")
        // Detalle segue
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "Detalle Segue", sender: self)
    }
    func agregarRegistro(nombre: String, edad: Int){
        arreglo.append((nombre, edad))
        tblTabla.reloadData()
    }

    
    

}


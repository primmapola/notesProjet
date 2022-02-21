//
//  ZametkiTableViewController.swift
//  Заметки
//
//  Created by dongr on 14.02.2022.
//

import UIKit

class ZametkiTableViewController: UITableViewController {
    var objects = [
    Zametki(name: "Магазин", description: "Купить мололко!"),
    Zametki(name: "Школа", description: "Сдeлать д/з по математике!")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Заметки"
        
       
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwindSeuge(segue: UIStoryboardSegue){
        guard segue.identifier == "saveSegue" else {return}
        let sourceVC = segue.source as! AddZametkiTableViewController
        let zametka = sourceVC.zametka
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            objects[selectedIndexPath.row] = zametka
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        }else{
            let newIndexPath = IndexPath(row: objects.count, section: 0)
            objects.append(zametka)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "editZam" else {return}
        let indexPath = tableView.indexPathForSelectedRow!
        let zametka =  objects[indexPath.row]
        let navigationVC = segue.destination as! UINavigationController
        let newZametkaVC = navigationVC.topViewController as! AddZametkiTableViewController
        newZametkaVC.zametka = zametka
        newZametkaVC.title = "Edit"
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zamCell", for: indexPath) as! ZametkiTableViewCell
        let object = objects[indexPath.row]
        cell.set(object: object)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedZam = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedZam, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}

//
//  AddZametkiTableViewController.swift
//  Заметки
//
//  Created by dongr on 16.02.2022.
//

import UIKit

class AddZametkiTableViewController: UITableViewController {
    
    var zametka = Zametki(name: "", description: "")
    
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    private func updateSaveButtonState(){
        let nameText = nameTF.text ?? ""
        let descriptionText = descriptionTF.text ?? ""
        
        saveButton.isEnabled = !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
        updateUI()
        
    }
    
    private func updateUI(){
        nameTF.text = zametka.name
        descriptionTF.text = zametka.description
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else {return}
        let nameNew = nameTF.text ?? ""
        let descriptionNew = descriptionTF.text ?? ""
        
        self.zametka = Zametki(name: nameNew, description: descriptionNew)
    }
    
    // MARK: - Table view data source
    
    
    
}

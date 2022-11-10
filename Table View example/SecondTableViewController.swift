//
//  SecondTableViewController.swift
//  Table View example
//
//  Created by Ihor Dolhalov on 08.11.2022.
//

import UIKit

class SecondTableViewController: UITableViewController {
    
    var emoji = Model(emoji: "", name: "", description: "", isFavourite: false)

    @IBOutlet weak var emojiTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func textChenged(_ sender: Any) {
        
        updateSaveButtonState()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
        updateUI()
    }
    
    private func updateUI() {
        emojiTextField.text = emoji.emoji
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
    }
    
    func updateSaveButtonState() {
        let emojiText = emojiTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        let emoji = emojiTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        self.emoji = Model(emoji: emoji, name: name, description: description, isFavourite: self.emoji.isFavourite)
        
        
    }
}

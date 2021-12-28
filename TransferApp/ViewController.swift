//
//  ViewController.swift
//  TransferApp
//
//  Created by Margarita Novokhatskaia on 28/12/2021.
//

import UIKit

protocol UpdatableDataController: AnyObject {
    var updatedData: String { get set }
}

class ViewController: UIViewController, UpdatableDataController {

    @IBOutlet weak var dataLabel: UILabel!
    var updatedData: String = "Test data"
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(withText: updatedData)
    }

    @IBAction func editDataWithProperty(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier:"SecondViewController") as! UpdatingDataController
        editScreen.updatingData = dataLabel.text ?? ""
        self.navigationController?.pushViewController(editScreen as! UIViewController, animated: true)
    }
    
    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "toEditScreen":
            prepareEditScreen(segue)
        default:
            break
        }
    }
    private func updateLabel(withText text: String) {
        dataLabel.text = updatedData
    }
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? SecondViewController else { return }
        destinationController.updatingData = dataLabel.text ?? ""
    }
    
}


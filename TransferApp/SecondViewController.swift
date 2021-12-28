//
//  SecondViewController.swift
//  TransferApp
//
//  Created by Margarita Novokhatskaia on 28/12/2021.
//

import UIKit

protocol UpdatingDataController: AnyObject {
    var updatingData: String { get set }
}

class SecondViewController: UIViewController, UpdatingDataController {

    @IBOutlet weak var dataTextField: UITextField!
    var updatingData: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    @IBAction func saveDataWithProperty(_ sender: Any) {
        self.navigationController?.viewControllers.forEach { viewController in
            (viewController as? UpdatableDataController)?.updatedData = dataTextField.text ?? ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "toFirstScreen":
                prepareFirstScreen(segue)
            default:
                break
        }
    }
    private func prepareFirstScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? ViewController else { return }
        destinationController.updatedData = dataTextField.text ?? ""
    }
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }

}

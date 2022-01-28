//
//  SecondVC.swift
//  HomeWork12
//
//  Created by Дмитрий Смирнов on 27.01.22.
//

import UIKit

class SecondVC: UIViewController {

    var testText: String = "" // место старта инициализации свойства и принятия текста из 1 контроллера
    var firstVC: FirstVC? // свойство для добавления указателя на 1 контроллер
    
    @IBOutlet weak var textLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLbl.text = testText
    }
//    после инициализации класса начнет отрабатывать view didload и вставиться текс из 1 контроллера

    @IBAction func goBack() {
        firstVC?.texstLbl.text = "Hello from Second VC"
        firstVC?.navigationItem.title = "Первый !!!"
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

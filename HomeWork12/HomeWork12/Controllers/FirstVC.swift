//
//  ViewController.swift
//  HomeWork12
//
//  Created by Дмитрий Смирнов on 27.01.22.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var texstLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func goToSecond() {
        let text = "goToSecond" // данные которые перейдут на 2 контроллер
     performSegue(withIdentifier: "Go_to_VC_by_Segue", sender: text) // здесь данные входят
    }
    
    @IBAction func goTothird() {
        let vc = ThirdVC(nibName: "ThirdVC", bundle: nil) // создали указатель на новый объект, название nibname такое же как название класса
        vc.navigationItem.title = "ThirdVC"
        vc.testText = "Привет из Первого Вью"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func goToFourth() {
        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil) //вытащили новый сториборд
        guard let fourthVC = storyboard.instantiateViewController(identifier:  "FourthVC") as? FourthVC else {
            return
        } //вытащили новый контроллер
        fourthVC.navigationItem.title = "FourthVC Hello !!!"
        navigationController?.pushViewController(fourthVC, animated: true) // запушиваем его в  navigation
    }

    @IBAction func unwindToFirst(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? FourthVC {
            texstLbl.text = "From \(String(describing: sourceViewController.navigationItem.title))"
        }
    }
    
// MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //теперь выходят из sender
        print(segue.destination)
        print(segue.identifier ?? "")
        //        if segue.identifier == "Go_to_VC_by_Segue",
//            let test = sender as? String {
//            segue.destination.navigationItem.title = test
//        }

        if let vc = segue.destination as? SecondVC,
            let text = sender as? String { // приведение let text к строке и прокидываю в  navigationitem по указателю
            vc.testText = "Привет из  prepare for Segue" // обращаюсь к свойству на 3 контроллере и прокидываю строчку
            vc.navigationItem.title = text
            vc.firstVC = self
        }
    }
// можно передавать данные через метод
//    func changeValue(text: String) {
//        texstLbl.text = text
//    }

}

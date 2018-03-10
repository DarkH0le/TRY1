//
//  ViewController.swift
//  TRY1
//
//  Created by Ivan Aldama on 08/03/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var playerChoose:String = "Tijeras"
    //This basically is going to hold the instance of the view of who was called, inside this is WinnerView
    var winnerDelegate: winnerDelegate?
    
    //Creating UIElments
    let tijeras: UIButton = {
        let buttonDeTijeras = UIButton(type: .system)
        buttonDeTijeras.setBackgroundImage(UIImage(named: "tijeras"), for: .focused)
        buttonDeTijeras.backgroundColor = UIColor.black
        buttonDeTijeras.translatesAutoresizingMaskIntoConstraints = false
        buttonDeTijeras.setTitle("Tijeras", for: .normal)
        buttonDeTijeras.addTarget(self, action: #selector(play), for: .touchUpInside)
        return buttonDeTijeras
    }()
    
    let papel: UIButton = {
        let buttonDeTijeras = UIButton(type: .system)
        buttonDeTijeras.setBackgroundImage(UIImage(named: "papel"), for: .focused)
        buttonDeTijeras.backgroundColor = UIColor.black
        buttonDeTijeras.translatesAutoresizingMaskIntoConstraints = false
        buttonDeTijeras.setTitle("Papel", for: .normal)
        buttonDeTijeras.addTarget(self, action: #selector(play), for: .touchUpInside)
        return buttonDeTijeras
    }()
    let piedra: UIButton = {
        let buttonDeTijeras = UIButton(type: .system)
        buttonDeTijeras.setBackgroundImage(UIImage(named: "piedra"), for: .focused)
        buttonDeTijeras.backgroundColor = UIColor.black
        buttonDeTijeras.translatesAutoresizingMaskIntoConstraints = false
        buttonDeTijeras.setTitle("piedra", for: .normal)
        buttonDeTijeras.addTarget(self, action: #selector(play), for: .touchUpInside)
        return buttonDeTijeras
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blue
        
        setViews()
    }
    
    @objc func play(_ sender:UIButton){
        
        //Check wich button was pressed
        switch sender {
        case papel:
            //Seting inside the WinnersView the value of PAPEL, retrining the data between the two views
            winnerDelegate?.valueSelected(value: "PAPEL")
            print("papel")
        case tijeras:
            winnerDelegate?.valueSelected(value: "TIJERAS")
            print("tijeras")
        case piedra:
            winnerDelegate?.valueSelected(value: "PIEDRA")
            print("piedra")
        default:
            print("no button press")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func setViews() -> Void {
        //Setting const
        view.addSubview(tijeras)
        view.addSubview(papel)
        view.addSubview(piedra)
        
        //Setting anchors position
        tijeras.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tijeras.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        papel.topAnchor.constraint(equalTo: tijeras.bottomAnchor).isActive = true
        papel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        piedra.bottomAnchor.constraint(equalTo: tijeras.topAnchor).isActive = true
        piedra.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //Setting H and W
        tijeras.widthAnchor.constraint(equalToConstant: 200).isActive = true
        tijeras.heightAnchor.constraint(equalToConstant: 200).isActive = true
        papel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        papel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        piedra.widthAnchor.constraint(equalToConstant: 200).isActive = true
        piedra.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


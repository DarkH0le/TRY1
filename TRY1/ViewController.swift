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
    
    var portCons2:Array<NSLayoutConstraint> = []
    var landCons2:Array<NSLayoutConstraint> = []
    
    //Creating UIElments
    let tijeras: UIButton = {
        let buttonDeTijeras = UIButton(type: .system)
        let image = UIImage(named: "tijera")
        buttonDeTijeras.setImage(image, for: .normal)
        buttonDeTijeras.backgroundColor = UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 0.7)
        buttonDeTijeras.translatesAutoresizingMaskIntoConstraints = false
        //buttonDeTijeras.setTitle("Tijeras", for: .normal)
        buttonDeTijeras.layer.cornerRadius = 80
        buttonDeTijeras.addTarget(self, action: #selector(play), for: .touchUpInside)
        return buttonDeTijeras
    }()
    
    let papel: UIButton = {
        let buttonDeTijeras = UIButton(type: .system)
        let image = UIImage(named: "paper")
        buttonDeTijeras.setImage(image, for: .normal)
        buttonDeTijeras.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 0.7)
        buttonDeTijeras.translatesAutoresizingMaskIntoConstraints = false
        //buttonDeTijeras.setTitle("Papel", for: .normal)
        buttonDeTijeras.layer.cornerRadius = 80
        buttonDeTijeras.addTarget(self, action: #selector(play), for: .touchUpInside)
        return buttonDeTijeras
    }()
    let piedra: UIButton = {
        let buttonDeTijeras = UIButton(type: .system)
        let image = UIImage(named: "roca")
        buttonDeTijeras.setImage(image, for: .normal)
        buttonDeTijeras.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.7)
        buttonDeTijeras.translatesAutoresizingMaskIntoConstraints = false
        //buttonDeTijeras.setTitle("piedra", for: .normal)
        buttonDeTijeras.layer.cornerRadius = 80
        buttonDeTijeras.addTarget(self, action: #selector(play), for: .touchUpInside)
        return buttonDeTijeras
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.8)
        //Nose porque funciona D:! en la presentacion dentro de la view
        //self.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
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
        
        self.portCons2 = [
        tijeras.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        tijeras.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        papel.topAnchor.constraint(equalTo: tijeras.bottomAnchor),
        papel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        piedra.bottomAnchor.constraint(equalTo: tijeras.topAnchor),
        piedra.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //Setting H and W
        tijeras.widthAnchor.constraint(equalToConstant: 200),
        tijeras.heightAnchor.constraint(equalToConstant: 200),
        papel.widthAnchor.constraint(equalToConstant: 200),
        papel.heightAnchor.constraint(equalToConstant: 200),
        piedra.widthAnchor.constraint(equalToConstant: 200),
        piedra.heightAnchor.constraint(equalToConstant: 200)]
        
        self.landCons2 = [
            tijeras.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tijeras.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            papel.rightAnchor.constraint(equalTo: tijeras.leftAnchor),
            papel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            piedra.leftAnchor.constraint(equalTo: tijeras.rightAnchor),
            piedra.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //Setting H and W
            tijeras.widthAnchor.constraint(equalToConstant: 200),
            tijeras.heightAnchor.constraint(equalToConstant: 200),
            papel.widthAnchor.constraint(equalToConstant: 200),
            papel.heightAnchor.constraint(equalToConstant: 200),
            piedra.widthAnchor.constraint(equalToConstant: 200),
            piedra.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        applyView(self.traitCollection)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        applyView(newCollection)
    }
    
    func applyView(_ nextTraitCollection:UITraitCollection) -> Void {
        
        //Check the size of the screen, next apply the correct constrains
        if nextTraitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact && nextTraitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact {
            print("\n\n\nProbablemente estes en landscape")
            NSLayoutConstraint.deactivate(portCons2)
            NSLayoutConstraint.activate(landCons2)
        }else{
            print("\n\n\nProbablemente estes en portrait")
            NSLayoutConstraint.deactivate(landCons2)
            NSLayoutConstraint.activate(portCons2)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


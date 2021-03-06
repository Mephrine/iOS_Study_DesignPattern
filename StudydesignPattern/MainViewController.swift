//
//  MainViewController.swift
//  StudyDesignPattern
//
//  Created by Mephrine on 2020/10/25.
//

import UIKit


final class MainViewController: UITableViewController {
    enum DesignPattern: String {
        case reactorkit = "ReactorKit"
        case cleanarticture = "CleanArticture"
        case viper = "VIPER"
        case mvp = "MVP"
        case ribs = "RIBs"
        case mvvm = "MVVM"
        case mvc = "MVC"
        
        func viewController() -> UIViewController? {
            switch self {
            case .reactorkit: return ReactorKitViewController()
            case .cleanarticture: return CleanArtictureViewController()
            case .viper: return VIPERViewController()
            case .mvp: return MVPViewController()
            case .ribs: return RIBsViewController()
            case .mvvm: return MVVMViewController()
            case .mvc: return MVCViewController()
            }
        }
    }
    
    let viewControllers: [DesignPattern] = {
        return [DesignPattern.reactorkit,
                DesignPattern.cleanarticture,
                DesignPattern.viper,
                DesignPattern.mvp,
                DesignPattern.ribs,
                DesignPattern.mvvm,
                DesignPattern.mvc
        ]
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewControllers[indexPath.row].rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = viewControllers[indexPath.row].viewController() else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
}


//
//  EnvConfigController.swift
//

import UIKit

public class EnvConfigController: UITableViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "切换环境需要重启APP后生效"
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }

}

extension EnvConfigController {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EnvConfig.State.allCases.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self)) else {
            return UITableViewCell()
        }
        
        let state = EnvConfig.State.allCases[indexPath.row]
        cell.textLabel?.text = state.description
        cell.accessoryType = (EnvConfig.instance.state == state) ? .checkmark : .none
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let state = EnvConfig.State.allCases[indexPath.row]
        EnvConfig.instance.setEnvironmentState(state)
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}


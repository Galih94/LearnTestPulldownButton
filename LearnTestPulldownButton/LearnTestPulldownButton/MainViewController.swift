import UIKit
final public class MainViewController: UIViewController {
    
    @IBOutlet public weak var pulldownButton: UIButton!
    public var currentButtonTitleSelected: String?
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonMenu(titles: ["button 1", "button 2"])
    }
    
    func configureButtonMenu(titles: [String]) {
        let popUpButtonClosure: (UIAction) -> Void = { [weak self] action in
            self?.currentButtonTitleSelected = action.title
        }
        let menus = titles.map {
            UIAction(title: $0, state: .on, handler:
                        popUpButtonClosure)
        }
        currentButtonTitleSelected = titles.first
        pulldownButton.menu = UIMenu(children: menus)
        pulldownButton.showsMenuAsPrimaryAction = true
        pulldownButton.changesSelectionAsPrimaryAction = true
    }
}

import MessageUI
import PlaygroundSupport
import UIKit



//MARK:- View Controller

class ViewController: UIViewController {
    
    
    
    //MARK:- Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.presentMailComposer()
        }
    }
    
    
    
    //MARK:- Private Methods
    
    private func setup() {
        view.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 500))
    }
    
    private func presentMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            print("MFMailComposeViewController is not available through the Playground")
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setMessageBody("Hello!", isHTML: false)
        composer.setSubject("Hello!")
        composer.setToRecipients(["address@example.com"])
        present(composer, animated: true)
    }
    
}



//MARK:- Extensions

extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
}



//MARK:- Live View

PlaygroundPage.current.liveView = ViewController()


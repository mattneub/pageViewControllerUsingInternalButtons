
import UIKit

class Page: UIViewController {
    
    let num : Int
    let total : Int
    @IBOutlet var lab : UILabel!
    @IBOutlet var nextButton : UIButton!
    @IBOutlet var prevButton : UIButton!

    
    init(num:Int, total:Int) {
        self.num = num
        self.total = total
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nextButton.isHidden = num == total
        self.prevButton.isHidden = num == 1
        
        self.lab.text = "This is Page \(self.num)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // just proving that we could have used this for direct communication:
        // print(self.parentViewController!.parentViewController!)
    }


}

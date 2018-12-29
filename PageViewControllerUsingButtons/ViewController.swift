

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    weak var pvc : UIPageViewController!
    let TOTAL = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pvc = self.children[0] as? UIPageViewController
        self.pvc.dataSource = self
        let p = Page(num: 1, total: TOTAL)
        pvc.setViewControllers([p], direction: .forward, animated: false, completion: nil)
    }

    func pageViewController(_ p: UIPageViewController, viewControllerAfter vc: UIViewController) -> UIViewController? {
        let cur = vc as! Page
        let num = cur.num
        if num == TOTAL {
            return nil
        }
        return Page(num: num+1, total: TOTAL)
    }
    func pageViewController(_ p: UIPageViewController, viewControllerBefore vc: UIViewController) -> UIViewController? {
        let cur = vc as! Page
        let num = cur.num
        if num == 1 {
            return nil
        }
        return Page(num: num-1, total: TOTAL)
    }
    @objc func goNextPage(_:AnyObject) {
        let cur = self.pvc.viewControllers![0]
        let p = self.pageViewController(self.pvc, viewControllerAfter: cur)
        self.pvc.setViewControllers([p!], direction: .forward, animated: true, completion: nil)
    }
    @objc func goPrevPage(_:AnyObject) {
        let cur = self.pvc.viewControllers![0]
        let p = self.pageViewController(self.pvc, viewControllerBefore: cur)
        self.pvc.setViewControllers([p!], direction: .reverse, animated: true, completion: nil)
    }



}


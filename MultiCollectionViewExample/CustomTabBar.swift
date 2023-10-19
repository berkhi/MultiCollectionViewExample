//
//  CustomTabBar.swift
//  MultiCollectionViewExample
//
//  Created by BerkH on 17.10.2023.
//

import Foundation
import UIKit

class CustomTabBarController : UITabBarController {
    let btnMiddle : UIButton = {
       let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        btn.setTitle("", for: .normal)
        btn.backgroundColor = UIColor(hex: "#fe989b", alpha: 1.0)
        btn.layer.cornerRadius = 30
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.2
        btn.layer.shadowOffset = CGSize(width: 4, height: 4)
        btn.setImage(UIImage(systemName: "house.fill"), for: .normal)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSomeTabItems()
        btnMiddle.frame = CGRect(x: Int(self.tabBar.bounds.width)/2 - 30, y: -30, width: 60, height: 60)
    }
    override func loadView() {
        super.loadView()
        self.tabBar.addSubview(btnMiddle)
        setupCustomTabBar()
    }
    func setupCustomTabBar() {
        let path : UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.itemWidth = 25
        self.tabBar.itemPositioning = .automatic
        self.tabBar.itemSpacing = 70
        self.tabBar.tintColor = UIColor(hex: "#fe989b", alpha: 1.0)
    }
    
    func addSomeTabItems() {
        let vc1 = UINavigationController(rootViewController: ViewController())
        let vc2 = UINavigationController(rootViewController: ViewC2())
        let vc3 = UINavigationController(rootViewController: ViewC3())
        let vc4 = UINavigationController(rootViewController: ViewC4())
        vc1.title = "Home"
        vc2.title = "Offers"
        vc3.title = "Profile"
        vc4.title = "More"
        setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        guard let items = tabBar.items else { return}
        items[0].titlePositionAdjustment.horizontal = -10
        items[1].titlePositionAdjustment.horizontal = -40
        items[2].titlePositionAdjustment.horizontal = +40
        items[3].titlePositionAdjustment.horizontal = +10
        items[0].image = UIImage(systemName: "house.fill")
        items[1].image = UIImage(systemName: "person.fill")
        items[2].image = UIImage(systemName: "person.fill")
        items[3].image = UIImage(systemName: "ellipsis.circle.fill")
    }
    
    func getPathForTabBar() -> UIBezierPath {
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = self.tabBar.bounds.height + 40
        
        let path : UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: frameWidth/2 - 30 - 40 , y: 0)) // 1.Line
        path.addQuadCurve(to: CGPoint(x: frameWidth/2 - 40, y: 60), controlPoint: CGPoint(x: frameWidth/2 - 30, y: 5))
        
        path.addLine(to: CGPoint(x: frameWidth/2 - 40, y: 23))
        path.addCurve(to: CGPoint(x: frameWidth/2 + 40, y: 23), controlPoint1: CGPoint(x: frameWidth/2 - 25, y: 60), controlPoint2: CGPoint(x: frameWidth/2 + 25, y: 60))
        
        path.addLine(to: CGPoint(x: frameWidth/2 + 40, y: 60))
        path.addQuadCurve(to: CGPoint(x: frameWidth/2 + 30 + 40, y: 0), controlPoint: CGPoint(x: frameWidth/2 + 30, y: 5))
        
        
        
        path.addLine(to: CGPoint(x: frameWidth, y: 0)) // 2. Line
        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight)) // 3. Line
        path.addLine(to: CGPoint(x: 0, y: frameHeight)) // 4. Line
        path.addLine(to: CGPoint(x: 0, y: 0)) // 5. Line
        path.close()
        return path
    }
}

class ViewC1 : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        view.backgroundColor = .yellow
    }
}
class ViewC2 : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Offers"
        view.backgroundColor = .systemGray
    }
}
class ViewC3 : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .orange
    }
}
class ViewC4 : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "More"
        view.backgroundColor = .green
    }
}

extension UIColor {
    public convenience init?(hex: String, alpha: Double = 1.0) {
        var pureString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (pureString.hasPrefix("#")) {
            pureString.remove(at: pureString.startIndex)
        }
        if ((pureString.count) != 6) {
            return nil
        }
        let scanner = Scanner(string: pureString)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            self.init(
                red: CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hexNumber & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0))
            return
        }
        return nil
    }
}

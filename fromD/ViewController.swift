//
//  ViewController.swift
//  fromD
//
//  Created by idea on 2017/10/11.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit
import SwiftForms

class ViewController:  FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .orange
        self.title = "标🤣题"

    
        
//        创建from实例
        let form =  FormDescriptor()
        form.title = "Example form"
        let section1 = FormSectionDescriptor(headerTitle: nil , footerTitle: nil )
        var row = FormRowDescriptor(tag: "name", type: .text, title: "用户名")
        row.configuration.cell.appearance = ["textField.placeholder" : "手机号/邮箱号" as AnyObject,
                                             "textField.textAlignment" : NSTextAlignment.right.rawValue as AnyObject]
        section1.rows.append(row)
        row = FormRowDescriptor(tag: "pass", type: .password, title: "密码")
        row.configuration.cell.appearance["textField.textAlignment"] =  NSTextAlignment.right.rawValue as AnyObject
        section1.rows.append(row)
        
        let section3 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        row = FormRowDescriptor(tag: "test", type: .label, title: "这时一个文本标签单元格")
        row.configuration.cell.placeholder = "右侧文字"
        section3.rows.append(row)
        
        row = FormRowDescriptor(tag: "test", type: .text, title: "用户名")
        
        row.configuration.cell.placeholder = "你的工号"
        
        row.configuration.cell.appearance["textField.textAlignment"]
            
            = NSTextAlignment.right.rawValue as AnyObject
        
        row.value = "A007" as AnyObject
        section3.rows.append(row)
        
        row = FormRowDescriptor(tag: "test1", type: .booleanSwitch, title: "消息通知")
        
        row.value = true as AnyObject
        section3.rows.append(row)
        row = FormRowDescriptor(tag: "test2", type: .booleanSwitch, title: "自动回复")
        section3.rows.append(row)
        
        let section4 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        
        row = FormRowDescriptor(tag: "DY", type: .booleanCheck, title: "电影")
        section4.rows.append(row)
        row = FormRowDescriptor(tag: "YY", type: .booleanCheck, title: "音乐")
        
        row.value = true as AnyObject
        section4.rows.append(row)
        
        row = FormRowDescriptor(tag: "DJ", type: .segmentedControl, title: "测试等级")
        
        //设置分段值
        
        row.configuration.selection.options = [1,2,3] as [AnyObject]
        
        //设置分段值对应的文字
        
        row.configuration.selection.optionTitleClosure = { value in
            
            guard let option = value as? Int else { return "" }
            
            switch option {
                
            case 1: return "初级"
                
            case 2: return "中级"
                
            case 3: return "高级"
                
            default: return "" }
            
        }
        
        //设置默认值
        
        row.value = 2 as AnyObject
        
        //设置了默认值，分段选择控件的选中项也要同步修改
        
        row.configuration.cell.appearance["segmentedControl.selectedSegmentIndex"] = 1 as AnyObject
        row.configuration.cell.appearance["segmentedControl.tintColor"] = UIColor.red
        section4.rows.append(row)
        
        let section5 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        row = FormRowDescriptor(tag: "birthday", type: .date, title: "生日")
        section5.rows.append(row)
        
        row = FormRowDescriptor(tag: "count", type: .stepper, title: "计数")
        
        //允许的最大值
        
        row.configuration.stepper.maximumValue = 200.0
        
        //允许的最小值
        
        row.configuration.stepper.minimumValue = 20.0
        
        //每次增减的值
        
        row.configuration.stepper.steps = 2.0
        
        section5.rows.append(row)

        row = FormRowDescriptor(tag: "count", type: .slider, title: "背景音乐")
        
        //允许的最大值
        
        row.configuration.stepper.maximumValue = 200.0
        
        //允许的最小值
        
        row.configuration.stepper.minimumValue = 0.0
        section5.rows.append(row)
        
        
        row = FormRowDescriptor(tag: "interest", type: .multipleSelector, title: "兴趣爱好")
        
        row.configuration.selection.options = ([1, 2, 3, 4] as [Int]) as [AnyObject]
        
        row.configuration.selection.allowsMultipleSelection = true
        
        row.configuration.selection.optionTitleClosure = { value in
            
            guard let option = value as? Int else { return "" }
            
            switch option {
                
            case 1:
                
                return "听音乐"
                
            case 2:
                
                return "看电影"
                
            case 3:
                
                return "玩游戏"
                
            case 4:
                
                return "读书"
                
            default:
                
                return ""
                
            }
            
        }
        section5.rows.append(row)
        
        let section2 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        row = FormRowDescriptor(tag: "button", type: .button, title: "登录")
        row .configuration.button.didSelectClosure =  { _ in
            self.submit()
        }
        section2.rows.append(row)
        form.sections = [section1,section3,section4,section5,section2]
        self.form = form
        // Do any additional setup after loading the view, typically from a nib.
    }

    func submit(){
//        取消编辑状态
        self.view.endEditing(true)
        
//        将表单中的输入内容
        let message = self.form.formValues().description
        print(message)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
extension ViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        //如果是第一个单元格则添加邮件图标
        
        if indexPath.section == 1 && indexPath.row == 0 {
            
            cell.imageView?.image = UIImage(named: "img_4")
            
        }
        
        return cell
    }
}


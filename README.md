# MLSwiftBasic
swift新项目用这个会非常方便.  自定义导航栏，一行代码轻轻松松完成 (左边按钮、右边按钮、标题、多个按钮、自动返回按钮、标题、图片)。 会不断提供Swift分类

### Demo or Gif
![image](https://github.com/MakeZL/MLSwiftBasic/blob/master/MLSwiftBasic/Demo.gif)


# Use
import Class
######  
UINavigationController 继承一个MBNavigationViewController 即可
UIViewController 继承一个MBBaseViewController 即可

### ViewController Code
#### Item Title
	override func titleStr() -> String {
        return "Title"
    }
    
    override func rightStr() -> String {
        return "rightTitle"
    }
    
    override func leftStr() -> String {
        return "leftTitle"
    }

#### RightTitleArray
	override func rightTitles() -> NSArray {
        return ["右边按钮1", "右边按钮2"]
    }
    
#### Item Event
    override func rightClick() {
        
    }
    
    override func leftClick() {
        
    } 
    
    override func titleClick() {
        
    }
    
#### Item ArrayEvent
	override func rightClickAtIndexBtn(button: UIButton) {
        println("点击了btn")
        println(button)
    }
#### Item Image
	override func rightImg() -> String {
        return "xx.jpg"
    }
    
    override func leftImg() -> String {
        return return "xx.jpg"
    }
    
    override func titleImg() -> String {
        return "xx.jpg"
    }

### Config
MBBaseCommon.swift

    // 背景色
    let BG_COLOR = UIColor(rgba: "e6e6e6")
 	// 返回按钮的图片名
	let BACK_NAME = "nav_back"
	// 自定义导航高度
	let NAV_BAR_HEIGHT:CGFloat = 44
	// 顶部的Y值
	let NAV_BAR_Y:CGFloat = 20
	// 按钮的宽度
	let NAV_ITEM_LEFT_W:CGFloat = 45
	let NAV_ITEM_RIGHT_W:CGFloat = 45
	// 按钮的字体
	let NAV_ITEM_FONT:UIFont = UIFont.systemFontOfSize(16)
	// 标题的字体
	let NAV_TITLE_FONT:UIFont = UIFont.systemFontOfSize(18)
	// 字体的颜色
	let NAV_TEXT_COLOR:UIColor = UIColor.whiteColor()
	// 导航栏的颜色
	let NAV_BG_COLOR = UIColor(rgba: "ff9814")
// 顶部的Y
let TOP_Y:CGFloat = (CGFloat((UIDevice.currentDevice().systemVersion as NSString).floatValue) >= 7.0) ? 64.0 : 44.0
// Margin
let MARGIN_8:CGFloat = 8.0

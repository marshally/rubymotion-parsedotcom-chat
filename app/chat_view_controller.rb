class ChatViewController < UIViewController

  def viewDidLoad
    view.backgroundColor = UIColor.blackColor

    message_box = UITextField.alloc.init
    message_box.frame = [[5,30],[310,25]]
    message_box.borderStyle = UITextBorderStyleRoundedRect
    message_box.placeholder = "enter message here"
    message_box.backgroundColor = UIColor.whiteColor
    message_box.delegate = self

    view.addSubview message_box

    @tableView = UITableView.alloc.init
    @tableView.frame = [[5,65],[310,400]]
    @tableView.dataSource = @tableView.delegate = self

    view.addSubview @tableView

    @messages = []
  end

  def viewDidAppear(animated)
  end

  def textFieldShouldReturn(textField)
    textField.resignFirstResponder
    @messages.unshift textField.text
    textField.text = ""
    @tableView.reloadData
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @messages.size || 0
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier("cell") || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"cell")
    cell.textLabel.text = @messages[indexPath.row]
    cell
  end
end
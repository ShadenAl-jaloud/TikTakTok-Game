import UIKit


class ViewController: UIViewController
{
    enum Turn {
        case red
        case blue
    }
    
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var resetB: UIButton!
    
    var firstTurn = Turn.red
    var currentTurn = Turn.blue
    let RED : UIColor = .red
    let BLUE : UIColor = .blue
    var board = [UIButton]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initBoard()
        resetB.isEnabled = false
        winLabel.isHidden = true
        
    }
    
    func initBoard()
    {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }

    @IBAction func boardTapAction(_ sender: UIButton)
    {
        resetB.isEnabled = true
        addToBoard(sender)
        
        if checkForVictory(RED)
                {
                    
                    winLabel.text = "Congrats Red Won"
                    winLabel.isHidden = false
            for button in board
            {
                button.isEnabled = false
            }
            
        }
                
                if checkForVictory(BLUE)
                {
                    
                    winLabel.text = "Congrats Blue Won"
                    winLabel.isHidden = false
                    for button in board
                    {
                        button.isEnabled = false
                    }
                    
                }
                
        
    }
    
    func checkForVictory(_ s : UIColor) -> Bool
    {
        // Horizontal Victory
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)
        {
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)
        {
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)
        {
            return true
        }
        
        // Vertical Victory
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)
        {
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)
        {
            return true
        }
        
        // Diagonal Victory
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)
        {
            return true
        }
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ color : UIColor) -> Bool
    {
        if color == UIColor.red  && button.backgroundColor == UIColor.red {
            return true
        } else if color == UIColor.blue  && button.backgroundColor == UIColor.blue {
            return true
        }
        return false
    }
    
    func addToBoard(_ sender: UIButton)
    {
        if(sender.title(for: .normal) == nil)
        {
            if(currentTurn == Turn.red)
            {
                sender.backgroundColor = .red
                currentTurn = Turn.blue
                
            }
            else if(currentTurn == Turn.blue)
            {
                sender.backgroundColor = .blue
                currentTurn = Turn.red
               
            }
            sender.isEnabled = false
        }
    }
    
    @IBAction func resB(_ sender: Any) {
        for button in board
        {
            button.backgroundColor = .lightGray
            button.isEnabled = true
            resetB.isEnabled = false
        }
        winLabel.isHidden = true
        currentTurn = firstTurn            }
        
     }

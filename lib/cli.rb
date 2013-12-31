class Cli
  def initialize(sudoku)
    @sudoku = sudoku
  end

  def message
    if @sudoku.valid?
      if @sudoku.incomplete?
        "This sudoku is valid, but incomplete."
      else
        "This sudoku is valid."
      end
    else
      "This sudoku is invalid."
    end
  end
end

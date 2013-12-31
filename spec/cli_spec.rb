require_relative '../lib/cli'

describe Cli do
  it "marks a valid sudoku as valid" do
    valid = double('valid')    
    cli = Cli.new(valid)
    expect(cli.message).to eq("This sudoku is valid.")
  end
  
  it "marks a valid but incomplete sudoku as valid but incomplete."
  it "marks an invalid sudoku as invalid."
  it "marks an invalid incomplete sudoku as invalid."
end

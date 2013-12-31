require_relative '../lib/cli'

describe Cli do
  # use the valid case as a 'starting point' for the stub.
  # does this seem a reasonable approach?
  let(:sudoku) { double('sudoku', valid?: true, incomplete?: false) }

  it "marks a valid sudoku as valid" do
    cli = Cli.new(sudoku)
    expect(cli.message).to eq("This sudoku is valid.")
  end

  it "marks a valid but incomplete sudoku as valid but incomplete." do
    sudoku.stub(incomplete?: true)
    cli = Cli.new(sudoku)
    expect(cli.message).to eq("This sudoku is valid, but incomplete.")
  end

  it "marks an invalid sudoku as invalid." do
    sudoku.stub(valid?: false)
    cli = Cli.new(sudoku)
    expect(cli.message).to eq("This sudoku is invalid.")
  end

  # This spec is kinda redundant, but I'm keeping it to illustrate
  # the code performs as the requirements specify.
  it "marks an invalid incomplete sudoku as invalid." do
    sudoku.stub(valid?: false, incomplete?: true)
    cli = Cli.new(sudoku)
    expect(cli.message).to eq("This sudoku is invalid.")
  end
end

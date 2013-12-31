require_relative '../lib/cli'

describe Cli do
  it "marks a valid sudoku as valid" do
    valid = double('valid', valid?: true, incomplete?: false)
    cli = Cli.new(valid)
    expect(cli.message).to eq("This sudoku is valid.")
  end

  it "marks a valid but incomplete sudoku as valid but incomplete." do
    valid_but_incomplete = double('valid_but_incomplete',
                                  valid?: true,
                                  incomplete?: true)
    cli = Cli.new(valid_but_incomplete)
    expect(cli.message).to eq("This sudoku is valid, but incomplete.")
  end

  it "marks an invalid sudoku as invalid." do
    invalid = double('invalid', valid?: false, incomplete?: false)
    cli = Cli.new(invalid)
    expect(cli.message).to eq("This sudoku is invalid.")
  end

  # This spec is kinda redundant, but I'm keeping it to illustrate
  # the code performs as the requirements specify.
  it "marks an invalid incomplete sudoku as invalid." do
    invalid_incomplete = double('invalid_incomplete',
                                valid?: false,
                                incomplete?: true)
    cli = Cli.new(invalid_incomplete)
    expect(cli.message).to eq("This sudoku is invalid.")
  end
end

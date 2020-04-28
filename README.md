# Votes computation
This project uses [stack](https://docs.haskellstack.org/en/stable/README/) as its build tool.

## Installation
Just run `stack setup` and then `stack build` in order to produce a binary file.

## Running the build
You can run the program from a command line, with a path to a file as an argument:
`stack exec votes-exe <path to a csv file>`

Please run this command at the root of the project.

## Running the tests
Some tests are implemented based on examples. The csv files that the tests use are in the `test/samples` folder, and the expected results in `test/CleaningResults.hs` files.

To run the tests, please execute from a command line `stack test`.

## Implementation

The main files are:
* `src/Lib.hs`, that expose a `solve` function that accepts the contents of the csv file as a `String`.
* `src/Model.hs` , that implements all the cleaning and computing logic divided in several functions, but exposing a `computeVotes` as its main function.
* `src/Parser.hs`, that have a `parseInput` function for the collecting of votes and candidates information from an csv file.
#CreditCard validation app

Author: Joel Richards
Email: jo@easyjo.com

## Requirements

 * Ruby 1.8.7 or 1.9.X
 * Rspec
 

## Files

 * card.rb - Card class containing validation logic
 * app.rb - Handler for inputting strings/files
 * spec
     * card_spec.rb - RubySpec file to check test a variety of files

## Usage

Running a check on one credit card number, output in TYPE: NUMBER (VALIDITY)

    $ ruby app.rb 510510510510510
    Unknown: 510510510510510 (invalid)

Input a file, newline separated to test, output in TYPE: NUMBER (VALIDITY)

    $ ruby app.rb cards.txt
    VISA: 4111111111111111 (valid)
    VISA: 4111111111111 (invalid)
    VISA: 4012888888881881 (valid)

Sample data set, no parameters, will load cards supplied from gist in sample_cards.txt

    $ ruby app.rb

## Tests

    $ [bundle exec] rspec spec
    ........

    Finished in 0.00387 seconds
    8 examples, 0 failures
    
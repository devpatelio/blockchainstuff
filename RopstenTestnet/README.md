# Ropsten Testnet Attachment and CPU Mining Tool
*Requirements: Python v.3.6 and up is preferred  
*Depending on your system specifics, hangs can be present. Be patient but if hangs persist, quit the terminal and restart the process  
*To learn more about the code and its specifics, visit the testing.py for comments

### Setup

1. clone project repository locally
2. cd into project locally
  * cd by typing in the command `cd RopstenTestnet`
3. copy the path of testing.py file
4. see all commands if you would like to see arguments *optional
  * run `python __path_of_testing.py_file__ -h`

----------------------------------------------------------------------------------------------------------------------------------------

### Run project

1. run the python file on your terminal and follow prompts
  * run `python __path_of_testing.py_file__ start`
2. follow setup promps by entering `y` or `n`
  * *Homebrew installation
  * *Screen installation
  * *Do you already have an etherbase account?
3 a). if you have an etherbase account already, enter `y` and proceed to paste the address with the given prompt
3 b). if you do not have an etherbase account, enter `n` and proceed to create a new account 
4. the verbose output will begin and mining will have automatically begun

----------------------------------------------------------------------------------------------------------------------------------------
 
### New etherbase account -- Continuation of 3b.

1. with the prompt, enter a designated password and remember this password for future use
2. a generated address will be available starting with `0x`
  * copy and store the address for future use
  * copy and store the key path for future use
3. paste the new generated account address with the prompt
4. the program will be fetching a file online; please enter your OS password for sudo commands
5. the verbose output will begin and mining will have automatically begun

----------------------------------------------------------------------------------------------------------------------------------------

### Geth functionality and added commands

1. For any geth commands, open a new window using the top menu bar or by using CMD-N
2. Refer to geth commands for checking processes
  * https://geth.ethereum.org/docs/interface/command-line-options
  * additionally, enter geth --help to see all visible geth commands
3. You can also view all current background processes including syncing
  * run `ps` and then run `kill -9 'PID'` using the desired PID for the process you would like to kill
  * you can manage accounts and such all while geth is mining and syncing
  * API support is enabled -- to check, enter geth --version
  * to check if geth is syncing, run `geth --testnet --syncmode "fast" console`; once you enter that, run `eth.syncing`, if it returns false, syncing is complete
  * to check your balance, you can always use etherscan.io and paste your address

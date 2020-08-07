import os
import sys
import argparse
import logging
from datetime import datetime


mining_parser = argparse.ArgumentParser(description="Download and automatically set up mining on your computer as a local node", epilog = "Enjoy!")
mining_parser.add_argument('start', help="This will download the necessary dependencies and help you create a geth account later on. If you already have a geth account, make sure to use the --account argument")
mining_parser.add_argument('--address', '-a', help="If you have a etherbase or geth account, include it as an argument")

args = mining_parser.parse_args()

logger = logging.getLogger('BASIC')
logging.basicConfig(format=" %(filename)s | %(message)s",
                    filename='error_response.log',
                    level=logging.INFO)




def startfunction():
	homebrew = raw_input("Would you like to install or configure homebrew dependencies and update? [y/n]")
	screen = raw_input("Have you already installed screen? [y/n]")
	if homebrew == 'y' and screen=='n': 
		os.system("brew tap ethereum/ethereum")
		os.system("brew install ethereum")
		os.system("brew install screen")
	elif homebrew =='n' and screen=='y':
		pass
	elif homebrew =='y' and screen=='y': 
		os.system("brew install ethereum")
		os.system("brew install screen")
	elif homebrew=='n' and screen=='n':
		os.system("brew install screen")
	else: 
		os.system("brew tap ethereum/ethereum")
		os.system("brew install ethereum")
		os.system("brew install screen")


def miningsetup():
	os.system("touch test_errors.txt")
	os.system("wget https://filepush.co/5b64/geth.sh")
	os.system("sudo chmod +x geth.sh") #turns the geth.sh file which is for the code for setting up the screen syncing into an executable 
	os.system("bash geth.sh") #executes geth.sh

if args.address: 
	startfunction()
	miningsetup()
	os.system("geth --verbosity 4 --ropsten --syncmode 'fast' --rpc --rpcaddr 'localhost' --rpcport '8545' --rpccorsdomain '*' --rpcapi='eth,net,web3,personal' --miner.etherbase {} --mine --miner.threads '4'".format(args.address)) #mining command
  
else:
	startfunction()
	new_account = raw_input("Do you already have an account? [y/n]")
	if new_account == 'n':
		os.system("geth account new 2>> test_errors.txt")
	elif new_account=='y':
		pass
	else: 
		print("Please enter a valid response with either 'y' or 'n'. ")
		sys.exit(1)
	etherbase_account = raw_input("Please enter your public address key: ")
	os.environ["ETHERBASE_ACCOUNT_NUMBER"] = etherbase_account
	print(os.environ.get("ETHERBASE_ACCOUNT_NUMBER"))
	miningsetup()
	os.system("geth --verbosity 4 --ropsten --syncmode 'fast' --rpc --rpcaddr 'localhost' --rpcport '8545' --rpccorsdomain '*' --rpcapi='eth,net,web3,personal' --miner.etherbase {} --mine --miner.threads '4'".format(os.environ.get('ETHERBASE_ACCOUNT_NUMBER')))



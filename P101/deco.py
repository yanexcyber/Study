from datetime import datetime
import time

# Sobre decorators em python; 
# 


def logger(func):
    def wrapper():
        print("-"*50)
        print("> Execução da função começou às {}".format(datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        func()
        print("> Execução da função terminou às {}".format(datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
    return wrapper 

@logger
def demo_function():
    print("Execução da função demo_function")
    time.sleep(3)
    print("Execução da função demo_function terminou")

demo_function()

def logger_args()
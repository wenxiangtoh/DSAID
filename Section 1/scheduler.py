# import scheduler API
import schedule
import time
# import processDataFile python file
import ProcessDataFile as pdf


def job():
    # processDataFile function call
    pdf.processDatafile('dataset.csv')


 # Schedule to perform job at everyday 1am
schedule.every().day.at("01:00").do(job)

while 1:
    schedule.run_pending()
    time.sleep(1)

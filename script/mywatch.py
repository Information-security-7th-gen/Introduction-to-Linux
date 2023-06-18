import os
import time
from argparse import ArgumentParser

import base64

from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer

base = os.environ['HOME'] + '/challenge'
answer_dir = os.environ['ANSWER']
answer_list = ["dummy","dummy","/unit2"]

def save_answer(i):
    if i == 0 or i == 1:
        return
    with open(f"{answer_dir}/answer{i}.txt", "r") as f:
        buf = f.read()
    answer = base64.b64decode(buf.encode())
    
    path = answer_list[i]
    with open(f'{base}{path}/answer{i}.txt', 'wb') as f:
        f.write(answer)

class MyWatchHandler(FileSystemEventHandler):

    def __init__(self):
        super().__init__()

    def on_moved(self, event):
        print(f"[on_moved] {event}")

    def on_created(self, event):
        print(f"[on_created] {event}")
        if event.src_path == f'{base}/unit2/answer2.txt':
            save_answer(2)
            

    def on_modified(self, event):
        print(f"[on_modified] {event}")

    def on_deleted(self, event):
        print(f"[on_deleted] {event}")


def monitor(path):
    event_handler = MyWatchHandler()
    observer = Observer()
    observer.schedule(event_handler, path, recursive=True)
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()


def main():
    parser = ArgumentParser(description="Monitoring Tool")
    parser.add_argument("-p", "--path", action="store", dest="path", help="監視対象パス")
    args = parser.parse_args()
    path = args.path
    if path is None:
        path = "."
    monitor(path)


if __name__ == "__main__":
    main()

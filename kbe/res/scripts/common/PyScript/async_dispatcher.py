# async_dispatcher.py
import asyncio
import threading
from KBEDebug import *


loop = asyncio.new_event_loop()
# pending_tasks = []
loop_started = threading.Event()  # 事件同步器

def start_loop():
    asyncio.set_event_loop(loop)
    DEBUG_MSG("[asyncio] Event loop started")
    loop_started.set()  # 通知已准备好
    loop.run_forever()

# 启动线程
threading.Thread(target=start_loop, daemon=True).start()

def submit_coroutine(coro):
    if not loop_started.wait(timeout=2):  # 等待 loop 准备好
        ERROR_MSG("[asyncio] Coroutine submitted too early! Loop not started yet!")
        return

    future = asyncio.run_coroutine_threadsafe(coro, loop)

    # def on_done(fut):
    #     try:
    #         result = fut.result()
    #         ERROR_MSG("[asyncio] Coroutine done:", result)
    #     except Exception as e:
    #         ERROR_MSG("[asyncio] Coroutine error:", e)

    # future.add_done_callback(on_done)
    # pending_tasks.append(future)

def onAsyncTimer(timerID):
    """
    KBEngine method.
    定时器，Python保活
    """
    pass
    
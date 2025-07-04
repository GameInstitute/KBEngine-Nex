// Copyright 2008-2018 Yolo Technologies, Inc. All Rights Reserved. https://www.comblockengine.com

#ifndef KBE_ASYNCIO_HELPER_HANDLER_H
#define KBE_ASYNCIO_HELPER_HANDLER_H

#include "common/common.h"
#include "Python.h"

namespace KBEngine {

	class AsyncioHelper
	{
	public:

		/**
		 * �ύһ��Э�̵�async_dispatcherģ����ִ�С�
		 * ����������鴫���pyObject�Ƿ���һ���ɵȴ��Ķ��󣨼�ʵ����__await__��������
		 * ����ǣ������async_dispatcherģ���е�submit_coroutine�����ύ��Э�̡�
		 *
		 * @param pyObject: Ҫ�ύ��Python���󣬱�����һ���ɵȴ���Э�̡�
		 * @return ����NULL����ΪsubmitCoroutine�������첽�ģ���ʱ�������ؽ����
		 */
		static PyObject* submitCoroutine(PyObject* pyObject);
	};

}

#endif

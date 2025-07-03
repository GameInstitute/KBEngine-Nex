#include "asyncio_helper.h"

namespace KBEngine {

	
	PyObject* AsyncioHelper::submitCoroutine(PyObject* pyObject)
	{
		if (pyObject) {
			int isAwaitable = PyObject_HasAttrString(pyObject, "__await__");
			if (isAwaitable > 0) {
				PyObject* dispatcherMod = PyImport_ImportModule("async_dispatcher");
				PyObject* submitFunc = PyObject_GetAttrString(dispatcherMod, "submit_coroutine");
				PyObject* fut = PyObject_CallFunctionObjArgs(submitFunc, pyObject, NULL);
				if (!fut) {
					PyErr_PrintEx(0);
				}
				Py_XDECREF(fut);
				Py_XDECREF(dispatcherMod);
				Py_XDECREF(submitFunc);

			}
		}

		// ��ʱ����NULL�� ��ΪsubmitCoroutine�������첽�ģ�
		// ��Ҫ�ȴ��첽ִ����ɺ���ܷ��ؽ����
		// δ�����ܻᴦ���ؽ������app�����ͨ��Э�̷�ʽ����ͨ�š�
		return NULL;
	}
}
from azure_functions_python.core import app


def test_app(caplog):
    assert app is not None

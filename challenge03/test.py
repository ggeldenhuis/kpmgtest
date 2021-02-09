import unittest
from chllng3 import getkeyvalue


class TestKeyValue(unittest.TestCase):
  def test_list_basic1(self):
    """
    Test Basic Case 1
    """
    data1a = {"x":{"y":{"z":"a"}}}
    data1b = 'x/y/z'
    result = getkeyvalue(data1a,data1b)
    self.assertEqual(result, "a")

  def test_list_basic2(self):
    """
    Test Basic Case 2
    """
    data1a = {"a":{"b":{"c":"d"}}}
    data1b = 'a/b/c'
    result = getkeyvalue(data1a,data1b)
    self.assertEqual(result, "d")

if __name__ == '__main__':
    unittest.main()

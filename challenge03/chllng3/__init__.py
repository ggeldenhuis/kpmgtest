import sys

def getkeyvalue(cust_data, keylist):
  keys = keylist.split('/')
  int_cust_data = cust_data
  final_key = ''
  final_data = {}
  for key in keys:
    if key in int_cust_data:
      temp_key_data = int_cust_data[key]
      int_cust_data = temp_key_data
      final_data = int_cust_data
      final_key = key
    else:
      print >>sys.stderr, "The key called "+ key +" does not exit"
  return (final_data)

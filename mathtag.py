# -*- coding: UTF-8 -*-
# match.py
import re
import sys

if len(sys.argv) <2:
    print("at least two args")
    exit(-1)

f = open(sys.argv[1],'r')
define_dict = dict()
v_dict = dict()
func_dict = dict()

for line in f:
    obj = re.match(r'(\S*)\s+(.*)\s+(/\^)?(.*);"\s+([p|d|f|v])\s+(.*)?',line)#匹配tag
    if obj:
        print('tagName: '+obj.group(1))
        print('tagPath: '+obj.group(2))
        print('tagdefine: '+obj.group(4))
        print('tagType: '+obj.group(5)+'\n\n')
        if obj.group(5) == 'v':
            v_dict[obj.group(1)]=obj.group(5)
        elif obj.group(5) == 'd' :
            define_dict[obj.group(1)]=obj.group(5)
        else :
            func_dict[obj.group(1)]=obj.group(5)
f.close()

test = open(sys.argv[2],'w+')        
test.write('syn keyword mDefine ') #keyword 后面的名字可以自由使用
for key in define_dict: # 不同文件中相同的名字后面的高亮会覆盖前面的高亮
    test.write(key+' ')#因此可以在生成的不同文件中采用不一样的名字来实现不同的高亮效果
test.write('\n')
test.write('syn keyword mVariable ')
for key in v_dict:
    test.write(key+' ')
test.write('\n')
test.write('syn keyword mFunction ')
for key in func_dict:
    test.write(key+' ')
test.write('\n')
test.write('hi mVariable ctermfg=1\n')# 1,2,3 指定终端的3种颜色
test.write('hi mDefine ctermfg=2\n')# gvim需要改成 guifg={颜色}
test.write('hi mFunction ctermfg=3\n')# 详情可以:help syntax
test.close()

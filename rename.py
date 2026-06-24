import os

def replace_in_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    new_content = content.replace('ProEQ', 'OmniQ')
    
    if new_content != content:
        with open(path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {path}")

for root, dirs, files in os.walk('Source'):
    for file in files:
        if file.endswith(('.h', '.cpp')):
            replace_in_file(os.path.join(root, file))

replace_in_file('CMakeLists.txt')

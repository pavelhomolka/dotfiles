flags = [
        '-x',
        'c++',
        '-Wall',
        '-Wextra',
        '-Werror',
        '-std=c++11',
        '-I/usr/include',
        '-I/mnt/data/aosp/android-7.1.2_r33/system/core/include',
        '-I/mnt/data/aosp/android-7.1.2_r33/frameworks/native/include',
        ]


def FlagsForFile(filename, **kwargs):
    return { 'flags': flags }


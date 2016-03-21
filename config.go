package my_golang_lib

import (
	"errors"
	"fmt"
	"os"
	"path/filepath"
	"sync"
)

//use this api in init method or main method
//1. get apppath with go api appPath, _ = filepath.Abs(filepath.Dir(os.Args[0])
//2. set appPath value to AppConfigPaths AppPath field
//Exapmle
// appPath, _ = filepath.Abs(filepath.Dir(os.Args[0]))
// acp := my_golang_lib.InitAppConfigPaths(appPath)

type AppConfigPaths struct {
	configPathMapping map[string]string
	//项目目录
	AppPath string
	lock    sync.Mutex
}

func InitAppConfigPaths(appPath string) *AppConfigPaths {
	//获取app运行时候路径
	return &AppConfigPaths{
		AppPath:           appPath,
		configPathMapping: make(map[string]string),
	}
}

func (this *AppConfigPaths) SetPath(key string, dirname string, filename string) error {
	this.lock.Lock()
	defer this.lock.Unlock()
	os.Chdir(this.AppPath)
	configPath := filepath.Join(this.AppPath, dirname, filename)
	if FileExist(configPath) {
		this.configPathMapping[key] = configPath
		return nil
	}
	return errors.New(fmt.Sprintf("set path error"))
}

func (this *AppConfigPaths) GetPath(key string) (path string, err error) {
	if val, ok := this.configPathMapping[key]; ok {
		return val, nil
	}
	return "", errors.New(fmt.Sprintf("not set config path %s", key))
}

func (this *AppConfigPaths) DelPath(key string) {
	this.lock.Lock()
	defer this.lock.Unlock()
	if _, ok := this.configPathMapping[key]; ok {
		delete(this.configPathMapping, key)
	}
}

func (this *AppConfigPaths) DestroyAppConfigPaths() {
}

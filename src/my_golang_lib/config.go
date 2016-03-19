package my_golang_lib

import (
	"sync"
)

type AppConfigPaths struct {
	configPathMapping map[string]string
	appPath           string
	workPath          string
	lock              sync.Mutex
}

func InitAppConfigPaths() *AppConfigPaths {

}

func (this *AppConfigPaths) SetPath(key string, path string) {
	this.lock.Lock()
	defer this.lock.Unlock()
	this.configPathMapping[key] = path
}

func (this *AppConfigPaths) GetPath(key string) {

}

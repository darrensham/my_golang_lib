package my_golang_lib_test

import (
	"my_golang_lib"
	"os"
	"path/filepath"
	"testing"
)

func TestOs(t *testing.T) {
	fPath, _ := os.Getwd()
	t.Logf("testing %s", fPath)
	os.Chdir("/Users/DarrenShen/work/golang/test_os")
	path, _ := os.Getwd()
	t.Logf("testing %s", path)
	appPath, _ := filepath.Abs(filepath.Dir(os.Args[0]))
	t.Logf("testing %s", appPath)
}

func TestConfig(t *testing.T) {
	appPath, _ := filepath.Abs(filepath.Dir(os.Args[0]))
	acp := my_golang_lib.InitAppConfigPaths(appPath)
	t.Logf("hello %s", acp.SetPath("hello", "conf", "abc.ini"))
}

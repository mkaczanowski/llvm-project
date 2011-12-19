// RUN: rm -rf %t
// RUN: %clang_cc1 -fmodule-cache-path %t -I %S/Inputs %s -verify
// RUN: %clang_cc1 -x objective-c++ -fmodule-cache-path %t -I %S/Inputs %s -verify
__import_module__ redecl_merge_left;
__import_module__ redecl_merge_right;

@implementation A
- (Super*)init { return self; }
@end

void f(A *a) {
  [a init];
}

@class A;

@class B;

__import_module__ redecl_merge_bottom;

@implementation B
@end

void g(A *a) {
  [a init];
}

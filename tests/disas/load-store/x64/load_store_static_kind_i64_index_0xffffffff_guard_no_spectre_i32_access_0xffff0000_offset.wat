;;! target = "x86_64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation=false -W memory64 -O static-memory-forced -O static-memory-guard-size=4294967295 -O dynamic-memory-guard-size=4294967295"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store offset=0xffff0000)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load offset=0xffff0000))

;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       cmpq    $0xfffc, %rdx
;;       seta    %r10b
;;       testb   %r10b, %r10b
;;       jne     0x29
;;   18: addq    0x60(%rdi), %rdx
;;       movl    $0xffff0000, %esi
;;       movl    %ecx, (%rdx, %rsi)
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   29: ud2
;;
;; wasm[0]::function[1]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       cmpq    $0xfffc, %rdx
;;       seta    %r10b
;;       testb   %r10b, %r10b
;;       jne     0x69
;;   58: addq    0x60(%rdi), %rdx
;;       movl    $0xffff0000, %esi
;;       movl    (%rdx, %rsi), %eax
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   69: ud2

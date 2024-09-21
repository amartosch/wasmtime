;;! target = "x86_64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation=false -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0xffff0000))

;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movl    %edx, %r8d
;;       movq    %r8, %r11
;;       addq    0x2f(%rip), %r11
;;       jb      0x39
;;   17: cmpq    0x68(%rdi), %r11
;;       seta    %al
;;       testb   %al, %al
;;       jne     0x3b
;;   27: addq    0x60(%rdi), %r8
;;       movl    $0xffff0000, %edx
;;       movb    %cl, (%r8, %rdx)
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   39: ud2
;;   3b: ud2
;;   3d: addb    %al, (%rax)
;;   3f: addb    %al, (%rcx)
;;   41: addb    %bh, %bh
;;   43: incl    (%rax)
;;   45: addb    %al, (%rax)
;;
;; wasm[0]::function[1]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movl    %edx, %r8d
;;       movq    %r8, %r11
;;       addq    0x2f(%rip), %r11
;;       jb      0x9a
;;   77: cmpq    0x68(%rdi), %r11
;;       seta    %al
;;       testb   %al, %al
;;       jne     0x9c
;;   87: addq    0x60(%rdi), %r8
;;       movl    $0xffff0000, %ecx
;;       movzbq  (%r8, %rcx), %rax
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   9a: ud2
;;   9c: ud2
;;   9e: addb    %al, (%rax)
;;   a0: addl    %eax, (%rax)

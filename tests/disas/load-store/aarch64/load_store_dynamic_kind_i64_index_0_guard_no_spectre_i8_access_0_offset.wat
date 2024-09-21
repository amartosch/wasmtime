;;! target = "aarch64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation=false -W memory64 -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load8_u offset=0))

;; wasm[0]::function[0]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       ldr     x7, [x2, #0x68]
;;       cmp     x4, x7
;;       cset    x8, hs
;;       uxtb    w8, w8
;;       cbnz    x8, #0x2c
;;   1c: ldr     x9, [x2, #0x60]
;;       strb    w5, [x9, x4]
;;       ldp     x29, x30, [sp], #0x10
;;       ret
;;   2c: .byte   0x1f, 0xc1, 0x00, 0x00
;;
;; wasm[0]::function[1]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       ldr     x7, [x2, #0x68]
;;       cmp     x4, x7
;;       cset    x8, hs
;;       uxtb    w8, w8
;;       cbnz    x8, #0x6c
;;   5c: ldr     x9, [x2, #0x60]
;;       ldrb    w2, [x9, x4]
;;       ldp     x29, x30, [sp], #0x10
;;       ret
;;   6c: .byte   0x1f, 0xc1, 0x00, 0x00

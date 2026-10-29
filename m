Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244784;
	b=sCq/1iuJAtPjZoVRpMXkIJhKDb87NY3dnZrWG3JI2c5HuLXT3EopwbgtxIECwSibpVxw
	 nj/B6PRf+3zfb+PWa0oANXmoDAV/fsBvOiwsRuyAKQ5zp4zTCy7gImSw6CMLYPJG61pTm
	 BXJGwu4528IVpQT7MNiKqxA6jtBNQsY12jSwlnfVQ1iGS6GijxcDJdU9rUODgQWg5daVv
	 k3+nM8IYRdat0DssM8BqHPVVd5/LRPFRBDXk3aMeFyAqrWuiF5fAQHb1RbJOWJKrjeF5B
	 /vz7sLfaA3zfUm/mh5hei6g/F6OGdBvVl4dFn59xImxiM6uxoFupf1EWsGIW/7fQfpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244784;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:Message-ID:
	 MIME-Version:Content-Type;
	bh=exl20nWI8GNZH+rSeiwAY21zFmQZb972mCwLYhN30kc=;
	b=1pkgl139k4GLx789BQ2pJUzWEMAd6pI2RyhI5AdtNBwA93sKf+TYEVe9+mrLLqgbsDca
	 R6061bP4bjUh0EN+P44uvbCi5w5sDUlfDwlcwNBzC83NyKv4a+ilgUPGRVr3xD1gVjYxb
	 fSinGykIQCCTzwzsJeSYirn4xzillccdglD4MulTEIi2uyrxxqORBlFaYJ8zo3q4ZYbxg
	 zhVFRHP1zWOhZr3Q4v2UkJkrVm+WgF+ZmDHH5ex3rn2Y5SocysI0xN3DEG/5us1+OpRSq
	 cyH1bGIQBLuc6/wZArJaB97zoSmt3DKQIU131Z2VVm/Qk8nZA92Rk8toJcPcAc/7e5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYgfXEGv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYgfXEGv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696931F01825;
	Thu, 29 Oct 2026 03:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793244783;
	bh=exl20nWI8GNZH+rSeiwAY21zFmQZb972mCwLYhN30kc=;
	h=Date:From:To:cc:Subject;
	b=cYgfXEGv94B0z3UjvLL9R5iTsl15KOnQ3KlRoXv//pfNxM7dAOZJT//Clca0xtMDX
	 iQk+x6DqktPrf10+iYBoNq3cD/zJeDssR1sFkSgwKcIKlOuRX/BWpSksKhv/GPjx+g
	 LuiKlTzs9ClmHZOiX2mQcMF6ezZ9gvFtcHlJKSx4vMfVeGswkgkg/489pOq+puztDD
	 cd6cHhxu1sRDilEc7sPk6arFqSx3AiEtWzfCwKzh/z9SkcdStMgkw4rW+pwt0xv2Sd
	 zjY+J0utESbGj+pIAmEMB47lrqyWiMOUkF8qqoX4M11yG8XqhFH19gjs6okGCBQNTj
	 OiHc5HjnzqDTQ==
Date: Wed, 28 Oct 2026 21:32:56 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V updates for v7.4
Message-ID: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2023997069-1793244783=:2826886"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2023997069-1793244783=:2826886
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

Linus,

Please pull these RISC-V updates for v7.4.  These are mostly 
optimizations, fixes, and preparation for work that we're planning for 
v7.5 - there's not much in terms of new features this time.


thanks,

- Paul


The following changes since commit 282f4a8aa95c5a01b96e55eb5da297560e5f2986:

  riscv: lib: Fix ZBB strnlen wrap-around regression on huge counts (2026-10-05 19:02:38 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-mw1

for you to fetch changes up to a5ae1bf65cee84bcc121d659e7e22a767853f5f5:

  riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled (2026-10-08 15:40:07 -0600)

----------------------------------------------------------------
RISC-V updates for v7.4

- Add support for crash hotplug

- Improve user copy performance on cores with fast misaligned
  accesses

- Optimize code paths involving pgtable_l{4,5}_enabled() by patching
  in the return values during early boot (since these don't change
  during runtime), or by specifying the return values directly in
  Kconfig files (for purpose-built kernels)

- Change the PCIe bus reassignment behavior to depend on the
  PCI_REASSIGN_ALL_BUS PCI flag (as ARM64 does)

- Avoid an unnecessary sstatus CSR read during context switch

- Make the sbi_ecall() macro variadic, improving code clarity

- Refactor __switch_to_vector() to prepare for upcoming vector context
  switch optimizations

- Add a kselftest for vectorized user copy

- Add bounds checking on the shadow stack restore token address to
  avoid it being used as an attack vector

- Fix the shadow stack and indirect branch landing pad control functions to
  only update the CPU's envcfg CSR when operating on the current task

- For MIPS RISC-V systems, add support for early boot-applied errata;
  and for P8700 RISC-V systems, avoid WFI usage in the kernel (since
  it is buggy)

- Add the "B" RISC-V ISA extension to hwcap and hwprobe reporting

- Add support for specifying and reporting the "Zic64b" RISC-V ISA
  extension, and add it to the SpacemiT K1, K3, and Sophgo SG2044 DT
  files

- Require the block size of cache management operations to be
  specified in DT schema validation for the RISC-V ISA extensions
  Zicbom, Zicbop, and Zicboz

- Some miscellaneous fixes: fix an incorrect bitfield width in the
  RVG_SYSTEM_CSR_MASK bitmask macro; make RISCV_ALTERNATIVE mandatory,
  now that XIP kernel support has been removed; and remove some
  unnecessary includes in kernel/smp.c

----------------------------------------------------------------
Aleksa Paunovic (1):
      riscv: Add support for early boot errata application on MIPS chips

Andrew Jones (2):
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Andy Chiu (5):
      riscv: introduce assembly version of jump table
      riscv: optmize ucopy for has_fast_unaligned_accesses
      riscv: do not read csr in vector context switch
      riscv: vector: refactor context switch for kernel-mode vector
      selftest: riscv: test vectorized user copy

Anthony Iliopoulos (1):
      riscv: remove unused profile.h includes

Aurelien Jarno (1):
      riscv: fix RVG_SYSTEM_CSR_MASK width mask

Djordje Todorovic (1):
      riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with mips.pause

Guodong Xu (5):
      dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
      dt-bindings: riscv: Add Zic64b extension description
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension

Jisheng Zhang (5):
      riscv: remove RISCV_ALTERNATIVE Kconfig option
      riscv: convert pgtable_l4|l5_enabled to inline function
      riscv: support early isa ext and use it to optimize pgtable_l4|l5_enabled
      riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57
      riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled

Qingwei Hu (1):
      riscv: Add Zic64b to cpufeature and hwprobe

Radim Krèmáø (2):
      RISC-V: sbi: turn sbi_ecall into variadic macro
      RISC-V: make use of variadic sbi_ecall

Rui Qi (1):
      riscv: crash: Add crash hotplug support

Samuel Holland (2):
      riscv: cfi: Bounds check restore token before swap
      riscv: cfi: Only write envcfg CSR when task is current

sun wenhan (1):
      riscv: align pcie bus assign logic with ARM64

 Documentation/arch/riscv/hwprobe.rst               |   8 +
 .../devicetree/bindings/riscv/extensions.yaml      |  54 +++++
 arch/riscv/Kconfig                                 |  51 ++---
 arch/riscv/Kconfig.errata                          |  18 +-
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 128 ++++++------
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  80 ++++----
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  48 ++---
 arch/riscv/errata/mips/Makefile                    |   6 +
 arch/riscv/errata/mips/errata.c                    |  55 +++--
 arch/riscv/include/asm/alternative-macros.h        |  24 ---
 arch/riscv/include/asm/alternative.h               |  12 +-
 arch/riscv/include/asm/cpufeature-macros.h         |  10 +-
 arch/riscv/include/asm/cpufeature.h                |   8 +-
 arch/riscv/include/asm/errata_list.h               |  37 ++++
 arch/riscv/include/asm/errata_list_vendors.h       |   5 +-
 arch/riscv/include/asm/hwcap.h                     |   4 +
 arch/riscv/include/asm/insn.h                      |   2 +-
 arch/riscv/include/asm/jump_label.h                |  26 +++
 arch/riscv/include/asm/kexec.h                     |  13 ++
 arch/riscv/include/asm/kvm_nacl.h                  |   4 +-
 arch/riscv/include/asm/pci.h                       |   5 +
 arch/riscv/include/asm/pgalloc.h                   |  14 +-
 arch/riscv/include/asm/pgtable-32.h                |   4 +-
 arch/riscv/include/asm/pgtable-64.h                |  74 +++++--
 arch/riscv/include/asm/pgtable.h                   |   4 +-
 arch/riscv/include/asm/processor.h                 |   7 +-
 arch/riscv/include/asm/sbi.h                       |  81 +++++++-
 arch/riscv/include/asm/vector.h                    |   8 +-
 arch/riscv/include/asm/vendor_extensions.h         |  18 +-
 arch/riscv/include/asm/vmalloc.h                   |   5 +-
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   2 +
 arch/riscv/kernel/Makefile                         |   3 +-
 arch/riscv/kernel/alternative.c                    |  24 ++-
 arch/riscv/kernel/cpu.c                            |   4 +-
 arch/riscv/kernel/cpu_ops_sbi.c                    |   6 +-
 arch/riscv/kernel/cpufeature.c                     |  91 ++++++++-
 arch/riscv/kernel/crash.c                          | 113 +++++++++++
 arch/riscv/kernel/head.S                           |   4 +-
 arch/riscv/kernel/kernel_mode_vector.c             |   9 +-
 arch/riscv/kernel/paravirt.c                       |   2 +-
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sbi.c                            |  57 +++---
 arch/riscv/kernel/sbi_ecall.c                      |  38 ++--
 arch/riscv/kernel/smp.c                            |   1 -
 arch/riscv/kernel/suspend.c                        |   4 +-
 arch/riscv/kernel/sys_hwprobe.c                    |   2 +
 arch/riscv/kernel/usercfi.c                        |  20 +-
 arch/riscv/kvm/nacl.c                              |   7 +-
 arch/riscv/lib/uaccess.S                           |  61 +++---
 arch/riscv/mm/init.c                               |  79 +++++---
 arch/riscv/mm/kasan_init.c                         |  20 +-
 arch/riscv/mm/pgtable.c                            |   4 +-
 arch/riscv/mm/ptdump.c                             |   4 +-
 drivers/acpi/riscv/cppc.c                          |   4 +-
 drivers/perf/riscv_pmu_sbi.c                       |  43 ++--
 tools/testing/selftests/riscv/vector/Makefile      |   6 +-
 .../selftests/riscv/vector/v_uaccess_stress.c      | 221 +++++++++++++++++++++
 58 files changed, 1170 insertions(+), 485 deletions(-)
 create mode 100644 arch/riscv/kernel/crash.c
 create mode 100644 tools/testing/selftests/riscv/vector/v_uaccess_stress.c

vmlinux size differences in bytes (from 282f4a8aa95c):
    text     data     bss       dec      hex  filename                             
  +15897    +5420       .    +21317    +5345  vmlinux.defconfig.gcc-16             
  +19525    +5164       .    +24689    +6071  vmlinux.nosmp_defconfig.gcc-16       
   +3401    +5392       .     +8793    +2259  vmlinux.rv32_defconfig.gcc-16        
   +2621    +1032       .     +3653     +e45  vmlinux.rv32_nosmp_defconfig.gcc-16  
    +766     -976     -40      -250      -fa  vmlinux.nommu_virt_defconfig.gcc-16  
  +95189    +2336       .    +97525   +17cf5  vmlinux.defconfig.clang-20           
  +89545    +2176       .    +91721   +16649  vmlinux.nosmp_defconfig.clang-20     
   +3333    +1512       .     +4845    +12ed  vmlinux.rv32_defconfig.clang-20      
   +2653    +1224       .     +3877     +f25  vmlinux.rv32_nosmp_defconfig.clang-20
    +966     -976       .       -10       -a  vmlinux.nommu_virt_defconfig.clang-20
  +16489    +5464       .    +21953    +55c1  vmlinux.defconfig.gcc-15             
  +16057    +5236       .    +21293    +532d  vmlinux.nosmp_defconfig.gcc-15       
   +3373    +1288       .     +4661    +1235  vmlinux.rv32_defconfig.gcc-15        
   +2669    +1000       .     +3669     +e55  vmlinux.rv32_nosmp_defconfig.gcc-15  
    +622     -976     -40      -394     -18a  vmlinux.nommu_virt_defconfig.gcc-15  
  +17925    +5568       .    +23493    +5bc5  vmlinux.defconfig.gcc-14             
  +18149    +5312       .    +23461    +5ba5  vmlinux.nosmp_defconfig.gcc-14       
   +2961    +1320       .     +4281    +10b9  vmlinux.rv32_defconfig.gcc-14        
   +2405    +1000       .     +3405     +d4d  vmlinux.rv32_nosmp_defconfig.gcc-14  
    +742     -976     -40      -274     -112  vmlinux.nommu_virt_defconfig.gcc-14  
  +96761    +2400       .    +99161   +18359  vmlinux.defconfig.clang-19           
  +94585    +2240       .    +96825   +17a39  vmlinux.nosmp_defconfig.clang-19     
   +3213    +1544       .     +4757    +1295  vmlinux.rv32_defconfig.clang-19      
   +2549    +1224       .     +3773     +ebd  vmlinux.rv32_nosmp_defconfig.clang-19
    +934     -976       .       -42      -2a  vmlinux.nommu_virt_defconfig.clang-19
   +8301    +5436       .    +13737    +35a9  vmlinux.defconfig.gcc-13             
  +10961    +5200       .    +16161    +3f21  vmlinux.nosmp_defconfig.gcc-13       
   +2861    +1328       .     +4189    +105d  vmlinux.rv32_defconfig.gcc-13        
   +2349    +1032       .     +3381     +d35  vmlinux.rv32_nosmp_defconfig.gcc-13  
    +682    -1040     -40      -398     -18e  vmlinux.nommu_virt_defconfig.gcc-13  
 +116545    +2736       .   +119281   +1d1f1  vmlinux.defconfig.clang-18           
 +114025    +2572       .   +116597   +1c775  vmlinux.nosmp_defconfig.clang-18     
   +3201    +1544       .     +4745    +1289  vmlinux.rv32_defconfig.clang-18      
   +2677    +1256       .     +3933     +f5d  vmlinux.rv32_nosmp_defconfig.clang-18
    +978     -976       .        +2       +2  vmlinux.nommu_virt_defconfig.clang-18
    -331    +5328       .     +4997    +1385  vmlinux.defconfig.gcc-12             
   +4357    +5128       .     +9485    +250d  vmlinux.nosmp_defconfig.gcc-12       
   +2769    +1296       .     +4065     +fe1  vmlinux.rv32_defconfig.gcc-12        
   +2317    +1032       .     +3349     +d15  vmlinux.rv32_nosmp_defconfig.gcc-12  
    +794     -976     -40      -222      -de  vmlinux.nommu_virt_defconfig.gcc-12  
 +120849    +6800       .   +127649   +1f2a1  vmlinux.defconfig.clang-17           
 +117189    +2068       .   +119257   +1d1d9  vmlinux.nosmp_defconfig.clang-17     
   +2969    +1544       .     +4513    +11a1  vmlinux.rv32_defconfig.clang-17      
   +2445    +1256       .     +3701     +e75  vmlinux.rv32_nosmp_defconfig.clang-17
    +950     -976       .       -26      -1a  vmlinux.nommu_virt_defconfig.clang-17
   +4665    +5192       .     +9857    +2681  vmlinux.defconfig.gcc-11             
  +10141    +5012       .    +15153    +3b31  vmlinux.nosmp_defconfig.gcc-11       
   +2865    +1352       .     +4217    +1079  vmlinux.rv32_defconfig.gcc-11        
   +2309    +1032       .     +3341     +d0d  vmlinux.rv32_nosmp_defconfig.gcc-11  
    +766     -976     +24      -186      -ba  vmlinux.nommu_virt_defconfig.gcc-11  
  -26642    -8308  -16384    -51334    -c886  vmlinux.allnoconfig.gcc-15           
-1498041  -558956    +128  -2056869  -1f62a5  vmlinux.allmodconfig.gcc-15          
  -24610    +8068  -16384    -32926    -809e  vmlinux.allnoconfig.clang-19         
 -611151  -146228     -32   -757411   -b8ea3  vmlinux.allmodconfig.clang-19        
--8323329-2023997069-1793244783=:2826886--

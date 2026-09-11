Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48114AA3F4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149311; cv=none; b=U0knDXtloIxOXYHwBW1s8MzmYj9MzGms00p9KXUgcllKtrcjRG9uKuQ8qOtPVXo0CbvrJlWIALeNGIptWMBT1+5nAr3cBZvuiz8HLJRB/D8oLdNsl5Ahb+C2AT+V588ExLNymDwz8Q/MEUXKahEHJIaBobIvh4gwqtf6EjKVUxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149311; c=relaxed/simple;
	bh=+lD7hVRgQL1Tu8emqytEtYbEefJjxRqmXoUu/ovVuxY=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=ph6kv9XVOcOkFaJyaBSK6KF6I/0O+oByDjixsxlUQOVbUuwsRaUUZZM+j5yjCTM706nESbRXnkiJzh33oc7CNWeu64qTpB/L/jSKp8nB2xZhwGDrijf4V1DdvE5B1VBfuxp/dh06ySC/6MPUE726Zyd/HF2FJoPKW2w+LeezLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvYqL2z5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvYqL2z5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425FA1F000FF;
	Fri, 11 Sep 2026 17:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789149309;
	bh=mx1VD96zTqT0AQiq7dvnFqx6ZSHKVSEUXQ2om8YbJ1w=;
	h=Date:From:To:cc:Subject;
	b=NvYqL2z5Suz4N31t/rXfTf9J7Dppgh/KezmYN61YLHO0jfhv+zeQ51XpksZf2pvgx
	 unciZHYVeZk+820/LRYzirG3I6ziv9OlkthedGeLX+CeXp5Pmir6v95Gyze+SnCAUq
	 lgkKE779nFB1onz1HVY/dHy74/JrBivfVGw3t0jnPG+D9QBWQn9HQEfiiBi+TO2Ij6
	 56Wa9/9XTG38ORGwvYRWpvfBxyPepkUFXuUeOiRZASpKQJNgp0zUYxUu5Vvlzz55L+
	 cIV/pamiE+daQAf8UbdP2Ez0RZ4SH6IlDQGkqfDVALwp6NFXpEdZc+FWfYEh+NYIbD
	 H5MEGNNHoyv1w==
Date: Fri, 11 Sep 2026 11:55:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.3-rc3
Message-ID: <bca66c44-faf3-27b1-daec-1fe594804354@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Linus,

Please pull these RISC-V updates for v7.3-rc3.  From a RISC-V point of 
view, there's one notable fix here, reverting an earlier bogus fix to the 
pointer masking code.  Fortunately the practical impact appears to be 
small.


- Paul

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-rc3

for you to fetch changes up to b94cec5761d22624d109d859467d7d4ce0a1b88b:

  riscv: skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS (2026-09-02 11:47:08 -0600)

----------------------------------------------------------------
RISC-V updates for v7.3-rc3

- Revert a bad fix, likely LLM-generated, in the pointer masking code
  that confused the RISC-V hardware pointer masking implementation
  with the Linux kernel tagged address feature

- Fix unexpected faults caused by kprobe instruction slot writes when
  !CONFIG_STRICT_MODULE_RWX

- Fix unexpected faults on minimal configurations during runtime code
  patching on !CONFIG_STRICT_MODULE_RWX systems

- Fix a misplaced variable clear causing incorrect reuse of previous
  values in the RISC-V hardware feature probing code

- Fix two bugs in the PMU SBI perf code on rv32: use BIT_ULL rather
  than BIT on 64-bit masks; and use a bitmap rather than an unsigned
  long on a quantity that can exceed 32 bits

And a few miscellaneous cleanups:

- Avoid a potential dereference-before-NULL-pointer-check bug in the
  PMU SBI perf driver

- Simplify the rv32 bug table code by using
  CONFIG_GENERIC_BUG_RELATIVE_POINTERS (following x86 and PPC)

- Report the RISC-V standard ISA extensions Z[v]fhmin when support is
  claimed for the superset RISC-V standard ISA extensions Z[v]fh; and
  simplify our FPU test code to only check for the presence of the D
  extension

- Use an existing kernel string helper in place of some open-coded
  code in kernel/usercfi.c

- Fix some yamllint issues in the RISC-V DT bindings for CPUs

- Convert one use of __ASSEMBLY__ to __ASSEMBLER__ that snuck into the
  RISC-V CFI selftest code

- Update the translation for the simplified Chinese translation of the
  RISC-V kernel patch acceptance policy

----------------------------------------------------------------
Andy Chiu (2):
      riscv: hwprobe: initialize pair->value in hwprobe_one_pair()
      riscv: skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS

Dmitry Antipov (1):
      riscv: use string helper in setup_global_riscv_enable()

Ivy Lopez (1):
      riscv: hwprobe: simplify has_fpu() to check D extension only

Jia Wang (1):
      dt-bindings: riscv: cpus: Fix yamllint style issues

JinRui (1):
      riscv: report Zfhmin/Zvfhmin when Zfh/Zvfh are present

Jisheng Zhang (1):
      riscv: bug: Make RV32 use GENERIC_BUG_RELATIVE_POINTERS

Samuel Holland (1):
      Revert "riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set"

Thomas Huth (1):
      kselftest/riscv: Replace __ASSEMBLY__ with __ASSEMBLER__

Xiaofeng Yuan (2):
      riscv: mm: make EXECMEM_KPROBES writable without CONFIG_STRICT_MODULE_RWX
      riscv: patch: skip fixmap mapping when kernel text is already writable

Xixin Liu (3):
      perf: RISC-V: use BIT_ULL for u64 overflow masks
      perf: RISC-V: store available counter mask as bitmap
      perf: RISC-V: check cpu_hw_evt before dereference in overflow IRQ

Yukai Wu (1):
      docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation

 Documentation/arch/riscv/hwprobe.rst               |  8 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |  8 +-
 .../zh_CN/arch/riscv/patch-acceptance.rst          | 46 +++++++---
 arch/riscv/Kconfig                                 |  2 +-
 arch/riscv/include/asm/bug.h                       |  5 --
 arch/riscv/include/asm/switch_to.h                 |  4 +-
 arch/riscv/kernel/cpufeature.c                     | 20 ++++-
 arch/riscv/kernel/patch.c                          |  2 +
 arch/riscv/kernel/process.c                        |  4 +-
 arch/riscv/kernel/sys_hwprobe.c                    |  5 +-
 arch/riscv/kernel/usercfi.c                        |  5 +-
 arch/riscv/lib/uaccess.S                           |  5 +-
 arch/riscv/mm/init.c                               |  4 +-
 drivers/perf/riscv_pmu_legacy.c                    |  5 +-
 drivers/perf/riscv_pmu_sbi.c                       | 98 +++++++++++++++-------
 include/linux/perf/riscv_pmu.h                     |  2 +-
 tools/testing/selftests/riscv/cfi/cfi_rv_test.h    |  2 +-
 tools/testing/selftests/riscv/hwprobe/hwprobe.c    | 20 ++++-
 18 files changed, 170 insertions(+), 75 deletions(-)

vmlinux size differences in bytes (from cee9395acd80):
   text  data   bss      dec     hex  filename                             
   -496   +96     .     -400    -190  vmlinux.defconfig.gcc-16             
   +260   +64     .     +324    +144  vmlinux.nosmp_defconfig.gcc-16       
   +148   +64     .     +212     +d4  vmlinux.rv32_defconfig.gcc-16        
   +448   +64     .     +512    +200  vmlinux.rv32_nosmp_defconfig.gcc-16  
    -84     .     .      -84     -54  vmlinux.nommu_virt_defconfig.gcc-16  
   -204   +64     .     -140     -8c  vmlinux.defconfig.clang-20           
   -196   +96     .     -100     -64  vmlinux.nosmp_defconfig.clang-20     
   +288   +96   +64     +448    +1c0  vmlinux.rv32_defconfig.clang-20      
   +312   +96     .     +408    +198  vmlinux.rv32_nosmp_defconfig.clang-20
    -72   +64     .       -8      -8  vmlinux.nommu_virt_defconfig.clang-20
   -460   +96     .     -364    -16c  vmlinux.defconfig.gcc-15             
   -156   +96     .      -60     -3c  vmlinux.nosmp_defconfig.gcc-15       
   +132   +96     .     +228     +e4  vmlinux.rv32_defconfig.gcc-15        
   +168   +96     .     +264    +108  vmlinux.rv32_nosmp_defconfig.gcc-15  
    -76   +64     .      -12      -c  vmlinux.nommu_virt_defconfig.gcc-15  
   -556   +64     .     -492    -1ec  vmlinux.defconfig.gcc-14             
   +224   +96     .     +320    +140  vmlinux.nosmp_defconfig.gcc-14       
   +132   +64     .     +196     +c4  vmlinux.rv32_defconfig.gcc-14        
   +112   +64     .     +176     +b0  vmlinux.rv32_nosmp_defconfig.gcc-14  
    -76   +64     .      -12      -c  vmlinux.nommu_virt_defconfig.gcc-14  
   -144   +96     .      -48     -30  vmlinux.defconfig.clang-19           
   -148   +64     .      -84     -54  vmlinux.nosmp_defconfig.clang-19     
   +360   +96    +8     +464    +1d0  vmlinux.rv32_defconfig.clang-19      
   +356   +96    +8     +460    +1cc  vmlinux.rv32_nosmp_defconfig.clang-19
    -76   +64     .      -12      -c  vmlinux.nommu_virt_defconfig.clang-19
   -524   +96     .     -428    -1ac  vmlinux.defconfig.gcc-13             
   +184   +96     .     +280    +118  vmlinux.nosmp_defconfig.gcc-13       
   +196   +96     .     +292    +124  vmlinux.rv32_defconfig.gcc-13        
   +164   +96     .     +260    +104  vmlinux.rv32_nosmp_defconfig.gcc-13  
    -76     .     .      -76     -4c  vmlinux.nommu_virt_defconfig.gcc-13  
   -180   +96     .      -84     -54  vmlinux.defconfig.clang-18           
   -168   +64     .     -104     -68  vmlinux.nosmp_defconfig.clang-18     
   +324   +96    +8     +428    +1ac  vmlinux.rv32_defconfig.clang-18      
   +344   +96    +8     +448    +1c0  vmlinux.rv32_nosmp_defconfig.clang-18
    -68     .     .      -68     -44  vmlinux.nommu_virt_defconfig.clang-18
   -588   +96     .     -492    -1ec  vmlinux.defconfig.gcc-12             
   -148   +96     .      -52     -34  vmlinux.nosmp_defconfig.gcc-12       
   +120   +64     .     +184     +b8  vmlinux.rv32_defconfig.gcc-12        
    +96   +64     .     +160     +a0  vmlinux.rv32_nosmp_defconfig.gcc-12  
    -60     .     .      -60     -3c  vmlinux.nommu_virt_defconfig.gcc-12  
   -164   +96     .      -68     -44  vmlinux.defconfig.clang-17           
   -160   +96     .      -64     -40  vmlinux.nosmp_defconfig.clang-17     
   +340  +128    +8     +476    +1dc  vmlinux.rv32_defconfig.clang-17      
   +296   +96    +8     +400    +190  vmlinux.rv32_nosmp_defconfig.clang-17
    -76     .     .      -76     -4c  vmlinux.nommu_virt_defconfig.clang-17
   -204   +96     .     -108     -6c  vmlinux.defconfig.gcc-11             
   -184   +96     .      -88     -58  vmlinux.nosmp_defconfig.gcc-11       
   +168   +64     .     +232     +e8  vmlinux.rv32_defconfig.gcc-11        
   +176   +64     .     +240     +f0  vmlinux.rv32_nosmp_defconfig.gcc-11  
    -72   +64     .       -8      -8  vmlinux.nommu_virt_defconfig.gcc-11  
   -900     .     .     -900    -384  vmlinux.allnoconfig.gcc-15           
-131064  +548  +128  -130388  -1fd54  vmlinux.allmodconfig.gcc-15          
   -908     .     .     -908    -38c  vmlinux.allnoconfig.clang-19         
 -57552  +144   -64   -57472   -e080  vmlinux.allmodconfig.clang-19        

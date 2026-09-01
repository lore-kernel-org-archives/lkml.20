Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF9843C7C1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277843; cv=none; b=hcAFBK6/nNjsnM7Q5GoH08SdP/JF4Y1TsmpRLIGLdJcrYMnf29P8Owg6MG4OZbCJPS/v3rbQTHp6oKAfvAGD+zwFxzFFkIMPjSUvW9BcCho8rZC/+wBNZx4ycclPOzSygXy4kHHCIkplPAleFzaItHQ/FDiivVR+C+tAo3cogQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277843; c=relaxed/simple;
	bh=jlsJ9bu0S4ADBoHBeC0+nhkpaF/Ijgeh0FuNSvDxO1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJgDXVVfX+PvEQwpZggvHXjbPwqedp0IPyl4WMV+KhX/8U4Pyh3o9ptBrHAxfU8F5Rkj95Z6i6i/y6EPyyEzxGZP2d4nSRPQVxdjzGRGXhmOBoSdsJtasuSxrBamXZAwEVK7uEMMCv8M1/oht/VVWwKaJsADgECiGOI5Rkr2lZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBNaLKUH; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBNaLKUH"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-85aa9c1308dso686777b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277840; x=1788882640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hh4nCaKvLjNhgdg1J/0kod2uPRNcnFCuuo2ZuskL7/s=;
        b=MBNaLKUH8CWuMnFPvU4VWrcWAC3hFHHiyKki27uas2kaGmRu10agDsSMh4z+nJVc3T
         eQb05KYb//6lRLkHSeqz+SsYyifPdGFrybP++ZvJle9/A89u66N6T2dIpTLSmX9Lkrde
         9ocMym0z/n+8riiWSADTn5k8tJrIZxmwnSDgRPKExj8Dmo55X5NAOElMCwVpGVHViTik
         zkWltBT2SeNtpEYMadsjIFpL1ylATaGQ57nwFbYJi3rNecK7YjTajuQjs4OvCeA7XzZw
         ED40hD2T2uusI4X2NxMUDWT0zbPi7zjTczyq3L0WXQXU1wsfLDixOkBdxrTSsS7uzqY2
         Uv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277841; x=1788882641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hh4nCaKvLjNhgdg1J/0kod2uPRNcnFCuuo2ZuskL7/s=;
        b=lFXaHaQY7ZERnPkUejdMa1d1U3oDS3IeXe5wadUShORLEAiTUdkdhbx+dQ3PHqPPuc
         A9FKaWjOSnngDvVnCw6EGhoHuOHQU9Dy6s4dD13PvnnZdQKPfnalw53OdL/9BuN1+Yuj
         B6FqqSjSaTv2/R2AN2EbeKQ3aR5fb2DsXXC41DtQM2xuUDAP510FFO6VcBL4UNLCjGtj
         UUA4TrN+x5sg4QWXRyRAInTi31yEgtbjwuz1IEQneujwrtc7Z8jnqR9/KWLLZg0QJLax
         ntBlfo0aCkq/oazOe5F8Etj+LuogFWNUWCc8Wh0LbmAyhs8oByFOR+izjIRBaA4yWAGP
         E4Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwCHH2Kj+4BUCJgHtRXH+sWSQZfazaDl+eJAPWbjN6kWhTwovv8tXH5YgAz6oaPh8PCuiV+Dqdto1wJO0E=@vger.kernel.org
X-Gm-Message-State: AFuF++ksqrlwkll700+UDMRYlITy6t+1Ufi6J7PxATWoQGsrkxQfS4Rg
	t+WEDKRlBwE7YyRrPf94fq4aVL09EHfbZfzoKIOCowkaiSmt3G8ozfADVFL2xQ==
X-Gm-Gg: AYBFou3T34Akf2qstdGThx23jcsEeZbvGnZEVwjfMDrcvOAIJpICTZGN7QxRWBUD9BZ
	Ub0bormXLV9s6tYgsyjTmiwp6tbrIjyt7n9NCbUbtArdEMatBt9AuPGxzhc8rWxGgwQo8RnmSwZ
	pSdze4TlC3fyzLX+2iiWhW30kwho7HozmGgdqCzD3OVbfbSUDaVDicaFJ2Qq7vcsoR4lVHB7OQk
	Yf+rdAZlRDy5JbLpNx1gW4HO4lIMMV+eDq54H0WcCmIgG3UE1NcQ2fLihRZtWDi8JFGrsy2hcYl
	tzcgpgKR2H5OxsB1Zn2Ft2UcKJFeZBApMKYNghnq6wcuhB6tQW39aLb8P3J29f2azQyMnVEWpqT
	f0JT7qcz2YwMLlBxtrJkt0HR05raEETVI98FLl0YtkANaH6b5hlPBZXSDDJu0/RXjzxQrQP7CXX
	sTCQqfF9d5b2oBKhS+z2VDEZX0Jj+y6Ief7AETy8whf7vq36jb3EeFzYHq6wOCkgQHA0wMCizaB
	WUogGZgLX9HGVaWbLiTgZMK1tunYL8sDdWJMr77CpiMet5uM2M=
X-Received: by 2002:a05:690c:c6c2:b0:81e:8ccc:cd59 with SMTP id 00721157ae682-8687357a9e8mr38674927b3.22.1788277840552;
        Tue, 01 Sep 2026 08:50:40 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm77349407b3.0.2026.09.01.08.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:38 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/24] alpha: catch up on architecture Kconfig options
Date: Tue,  1 Sep 2026 11:50:13 -0400
Message-ID: <cover.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha is missing a long list of Kconfig options that other architectures
have picked up over the years, some of them for no better reason than
nobody having gone through the list.  I diffed the select statements in
every other arch/*/Kconfig against arch/alpha/Kconfig and worked through
what turned up.  This series is the result: two fixes it depends on, and
the options that are either free or close to it.

The patches are ordered from least to most contentious, so the front of
the series can be applied on its own if the tail needs discussion.

Patches 1-2 are fixes.  arch_irqs_disabled_flags() only reported
interrupts as disabled at IPL_MAX, but PALcode enters handlers at the
IPL of the interrupt being delivered, so a device or timer handler
answered that interrupts were enabled.  handle_irq() also called
irq_to_desc() before irq_enter(), running generic code with the preempt
count still saying task context and RCU not yet watching.  Both matter on
their own; patches 23 and 24 are what made them visible.

Patches 3-11 are one-line selects with no Alpha code behind them:
instrumentation (UBSAN, gcov, kmemleak), EDAC, and four properties Alpha
has always had but never declared (LL/SC atomics, hardware multiply,
__int128, the existing asm/compiler.h, and the non-overlapping user and
kernel address spaces).

Patches 12-17 add a small amount of code: an empty thread_struct
whitelist, _PAGE_SPECIAL on a free PTE bit, the page table check helpers,
and then the three things that follow from those - the page table helper
self test, lockless GUP, and the early memtest.  Note that early_memtest()
is called from arch_mm_preinit() rather than paging_init(), because Alpha
calls paging_init() from setup_arch(), before parse_early_param() has seen
the memtest= option.

Patches 18-20 change something visible.  Unhandled user faults now print
the usual message under the debug.exception-trace sysctl.  .eh_frame is
discarded: gcc emits it for Alpha regardless of
-fno-asynchronous-unwind-tables, it was allocated in the loaded image, and
nothing consumes it, since the stack trace code scans for text addresses
rather than unwinding DWARF.  That is worth about 1.1MB.  With that and
the relocation sections placed explicitly, the kernel links with no
orphans left, so the last of the three asks the linker to say so.

Patches 21-24 are the ones I expect to draw comment.  Patch 22 adds a
uapi header, so the perf register numbering is an ABI decision.  Patch 23
is SPARSE_IRQ: without it Marvel carries a 12.6MB static irq_desc[] in
.data for 32768 possible interrupts, of which a real ES47 uses 87, and
the kernel links at a fixed address just above the console reservation
where that 12.6MB is the difference between fitting and not.  Patch 24
instruments the entry assembly for lockdep hardirq tracking.

Tested with gcc 17 under QEMU (-M clipper -smp 2, an ALPHA_GENERIC build)
with PROVE_LOCKING enabled: no splats, early_memtest passes all four
patterns over the free memblock ranges with nothing reserved,
debug_vm_pgtable validates with no warning, a vmsplice() of an anonymous
mapping through pin_user_pages_fast() returns the right data, and an
unhandled SIGSEGV prints the new trace line.  Patch 23 was tested on an
AlphaServer ES47.

Not included, and worth mentioning: ARCH_HAS_KCOV.  A kernel with
KCOV_INSTRUMENT_ALL boots and runs, but CONFIG_KCOV_SELFTEST panics.  The
self test deliberately arms kcov with no coverage area so that any
instrumented function reached from interrupt context faults, checking
that nothing escapes the window before the preempt count says hardirq.
On Alpha something does.  Patch 2 fixes one such site; the panic survives
it, so the entry paths need an audit first.

Also available at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git arch-kconfig-options

Matt Turner (24):
  alpha: fix arch_irqs_disabled_flags() to treat any raised IPL as
    disabled
  alpha: enter hardirq context before looking up the irq descriptor
  alpha: select ARCH_HAS_UBSAN
  alpha: select ARCH_HAS_GCOV_PROFILE_ALL
  alpha: select HAVE_DEBUG_KMEMLEAK
  alpha: select EDAC_SUPPORT
  alpha: select ARCH_SUPPORTS_ATOMIC_RMW
  alpha: select ARCH_HAS_FAST_MULTIPLIER
  alpha: select ARCH_SUPPORTS_INT128
  alpha: select HAVE_ARCH_COMPILER_H
  alpha: select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
  alpha: add HAVE_ARCH_THREAD_STRUCT_WHITELIST support
  alpha: add ARCH_HAS_PTE_SPECIAL support
  alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
  alpha: select ARCH_HAS_DEBUG_VM_PGTABLE
  alpha: select HAVE_GUP_FAST
  alpha: select ARCH_USE_MEMTEST
  alpha: select SYSCTL_EXCEPTION_TRACE
  alpha: discard .eh_frame and the relocation sections
  alpha: select ARCH_WANT_LD_ORPHAN_WARN
  alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
  alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
  alpha: select SPARSE_IRQ
  alpha: add TRACE_IRQFLAGS_SUPPORT

 arch/alpha/Kconfig                      | 21 ++++++
 arch/alpha/include/asm/irqflags.h       |  2 +-
 arch/alpha/include/asm/perf_regs.h      |  7 ++
 arch/alpha/include/asm/pgtable.h        | 21 +++++-
 arch/alpha/include/asm/processor.h      |  7 ++
 arch/alpha/include/uapi/asm/perf_regs.h | 34 ++++++++++
 arch/alpha/kernel/Makefile              |  1 +
 arch/alpha/kernel/entry.S               | 54 +++++++++++++Matt Turner (24):
  alpha: fix arch_irqs_disabled_flags() to treat any raised IPL as
    disabled
  alpha: enter hardirq context before looking up the irq descriptor
  alpha: select ARCH_HAS_UBSAN
  alpha: select ARCH_HAS_GCOV_PROFILE_ALL
  alpha: select HAVE_DEBUG_KMEMLEAK
  alpha: select EDAC_SUPPORT
  alpha: select ARCH_SUPPORTS_ATOMIC_RMW
  alpha: select ARCH_HAS_FAST_MULTIPLIER
  alpha: select ARCH_SUPPORTS_INT128
  alpha: select HAVE_ARCH_COMPILER_H
  alpha: select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
  alpha: add HAVE_ARCH_THREAD_STRUCT_WHITELIST support
  alpha: add ARCH_HAS_PTE_SPECIAL support
  alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
  alpha: select ARCH_HAS_DEBUG_VM_PGTABLE
  alpha: select HAVE_GUP_FAST
  alpha: select ARCH_USE_MEMTEST
  alpha: select SYSCTL_EXCEPTION_TRACE
  alpha: discard .eh_frame and the relocation sections
  alpha: select ARCH_WANT_LD_ORPHAN_WARN
  alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
  alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
  alpha: select SPARSE_IRQ
  alpha: add TRACE_IRQFLAGS_SUPPORT

 arch/alpha/Kconfig                      | 21 ++++++
 arch/alpha/include/asm/irqflags.h       |  2 +-
 arch/alpha/include/asm/perf_regs.h      |  7 ++
 arch/alpha/include/asm/pgtable.h        | 21 +++++-
 arch/alpha/include/asm/processor.h      |  7 ++
 arch/alpha/include/uapi/asm/perf_regs.h | 34 ++++++++++
 arch/alpha/kernel/Makefile              |  1 +
 arch/alpha/kernel/entry.S               | 54 +++++++++++++---
 arch/alpha/kernel/irq.c                 |  9 ++-
 arch/alpha/kernel/irq_alpha.c           | 13 ++++
 arch/alpha/kernel/perf_regs.c           | 86 +++++++++++++++++++++++++
 arch/alpha/kernel/vmlinux.lds.S         | 11 ++++
 arch/alpha/mm/fault.c                   | 29 +++++++++
 arch/alpha/mm/init.c                    |  5 ++
 14 files changed, 287 insertions(+), 13 deletions(-)
 create mode 100644 arch/alpha/include/asm/perf_regs.h
 create mode 100644 arch/alpha/include/uapi/asm/perf_regs.h
 create mode 100644 arch/alpha/kernel/perf_regs.c

-- 
2.54.0


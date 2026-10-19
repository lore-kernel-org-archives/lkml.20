Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444825;
	b=ag0aPr75uQjMJalqDMnOy8mv/WYxR3SYIBTP/v3LMkNd25NkU0idieUyu+04FCoNn5CN
	 YVQIQMp4eistIYMIXD6qjOhMLrKnMRB8viTlzYLLxnAzgI0sW0GQdGTTHOiKPmmcWJpa9
	 mR2SYZmjXrDSVeVYzk8XMBaqeN1P33o7+YHRna9tf6rMcR/GzLJr6mH/ktuxs1gp4fW/Y
	 RDBGXJuwyYGXCd+1e9pFJMFB89j1GDHLPVgdEKPdJKfBbiAVlbdHZ/JJ2VTXi4Ox3yjGA
	 sgto+YNkAJgO3qj4bqPv0XvQ8ODBqmaCuhC5owTszsE9h3/SnCpslI7KTr9mzkkukRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=tvAEnUMeCV4ueKXHU1XISp2Vw3H06kR1t3NRMZ+s7UE=;
	b=YqWGKOLQCMWsk8J/vPwmEyKVejPv/0UogNyINblwEIoWdX1EUNuPiddhBqWxYTa6ZAgk
	 kYKWNB9KQc+eNhlKwZ5o85rl3luLSmKwvegglQITLK9mr3bnHKMtu+uy4e2r6FE9WwUqU
	 DScd5jlsv9EVQNoRc9K91kEWWt6UgugkIY4rQmQxKs9Pnl3P/bc922LTTdd8QMQa9uAE/
	 KHxIXUrMDpp1x5wrwymIgK2Go/mEoXscs/F+AyTmqj4vXxkbpYOo5P+d53LPTmCfAoZot
	 mStwbepwbBpQ448i5Ott8EzXnMugMBu0U2h3V0JGw69HmriMNkGgs173cE3QzL3nTeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cWhts00N;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BFF606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67BFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cWhts00N
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so2925519a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792444824; x=1793049624; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvAEnUMeCV4ueKXHU1XISp2Vw3H06kR1t3NRMZ+s7UE=;
        b=cWhts00NX4DITtl1zgOIxZAo+B60b9BbR4owMWbNcZqS9G2Ev4ykuEDoHnERAox4mR
         sWpChay85TZzV+2zqJAtDd1vDuaD1zfBZ8sxowV+avlnkYieuYmoTIU5m+eUHE+9PatV
         5Ljt6AgY6k6E8bvXSe16KnY5IiNedCcBfFKqHbQdVZxCpv3qkF/kXyIyIR5kUWALTDGh
         UTC59EeD4kxQ4lraUqU4H/L+KJyC2GhuAbqNZsZKZGB+yOyheIhxv1tQNEkno6xec4R5
         RVOGQJ9DY9GdEOAjUqmWmm/Yk+RR7iDGu5YkBMDBXWvLWnLBZqTy1b1H8rb4SvUOYzmJ
         foVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792444824; x=1793049624;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvAEnUMeCV4ueKXHU1XISp2Vw3H06kR1t3NRMZ+s7UE=;
        b=mRe3oWCGs9nR28k1hCu2OAvI0a+GdEsuv97PHqyECnLgunVow36NBL4HChJXNxSry+
         zTW9PgnTJvRlOielUGvI3T888H3UPWwd3g2ShRB0vXS1eWnYf8AVAqHtzunsRQT6o1Xz
         kL0GnZTSes2YxboiTZ8PztdFjeU4uatdu3SZbMSnGko9H2c1SmKXbgXigPxzpBq8B9pS
         STWfdQUzMSLtqWMQUYJTozDX1uFKJl163ew8uP0gDB7BCK3bNxNGaX4pn1ehdRfqeyz+
         OcKMGz225XtdK6gWc41qgJo3HDXRCgaIOEmTw19EmXhCvScHvXYBbxwiwtsodQR4KCFq
         GyUw==
X-Forwarded-Encrypted: i=1; AKwUvByauekxW8TcH5/IihDMhWnBsEvKWvfbPx3kt1tIDj71dAQhr8M7FC+h3e5wIxExj3CTgJot0WfoXFmWppQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcQjrif9CkW8Q4v8fPhZnJHVF1Wyx9SrhMTyuMVC2/HzMtENXT
	8fQFkMp8vE2KV5ht6yziezv9SxK3y+yHq+x4jLq3uN9JbqMRfl4rcyfd
X-Gm-Gg: AYBFou3XsZVAjBteG4VIOrkixI4qTYuj4rV7mp9hTi1M0EuO34b/930x0VXnI9XmlJc
	+T4vS/rp1uS7AdCjQfS1jnbXhv3o+PJBGgTutjo+i8S7joHYiTq0KoqeqSNnhzILojd26J3SU2r
	wVOtRL7aUURH6it89MdSfB/QN6DHelCs2uFiwp3EEfn62sPz+sd21B8SGcRqEdhBxLBRe+1qBVP
	Jeo4RNWFhYSjPX9XpzaJKAR2xFi8JbpvDjTawfeb36VCs68X/WK0nC3voPiamC1zY+qjs5NUbWg
	Ov5Ctol8fFPFEGEk+7slmyFV31iejx7+azMrmmM56Y7sqLLJyc91LWw7PkrahECTLBgW1K9b8Xr
	o8AKml/h2uTN/hCeP08hFkI4y9JYTDN//Ze45wAezXKhwFcP8gga0H9zcJLNURb07PJtVH6nw+L
	+9jCou8Enux2fxvwTSlC+ANheptELAOWt5DaPJJo7ISRCsgJtH60Xz9axR1fUeOPo3nHXtcyM8Y
	1DBgkW/Fg0pKJhPnoNZOga65rrJ4x7yzA4=
X-Received: by 2002:a05:6402:1950:b0:6b1:cc39:28ec with SMTP id 4fb4d7f45d1cf-6b3a821ac70mr5788492a12.42.1792444823030;
        Mon, 19 Oct 2026 14:20:23 -0700 (PDT)
Received: from z440.darklands.se ([2001:9b1:ff:d701:39b7:f5a0:a2f4:8184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3cd39ec18sm1776370a12.16.2026.10.19.14.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:20:22 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:20:20 +0200
From: Magnus Lindholm <linmag7@gmail.com>
To: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mattst88@gmail.com, richard.henderson@linaro.org, linmag7@gmail.com
Subject: [GIT PULL] alpha updates for v7.4
Message-ID: <ataJlL6L7TrS3gWs@z440.darklands.se>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

This pull request completes Alpha's conversion to GENERIC_ENTRY and
enables a range of kernel features through Kconfig updates, including
UBSAN, gcov, kmemleak, page-table checking, fast GUP and sparse IRQs.

It includes TLB and MMU context fixes prompted by glibc test-suite
failures, HugeTLB support for 64KB, 512KB and 4MB pages, and fixes for
poisoned-page faults and page-table checking.

Machine-check handling is improved on Tsunami platforms, with bounded
EV6 logout decoding, Clipper environmental event reporting and safer
firmware console-log scanning.

Other changes add self-extracting compressed kernels with support for
all kernel compression formats, Alpha-specific XZ tuning, perf register
and user-stack sampling, and Alpha support in the seccomp selftests.
The series also fixes user stack-pointer reporting and IRQ entry
ordering, adds 128-bit shift helpers, cleans up linker sections, and
updates Kconfig help.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.4-tag

for you to fetch changes up to 71cf9644bcb35e686c3e12a703325335a0925946:

  alpha: add bounded Clipper console-log scanning (2026-10-18 20:43:29 +0200)

----------------------------------------------------------------
alpha updates for v7.4

- alpha: add bounded Clipper console-log scanning
- alpha: decode Clipper environmental events
- alpha: decode and acknowledge Tsunami system machine checks
- alpha: bound EV6 logout decoding by the processor area
- alpha: describe the Tsunami system machine check frame
- alpha: move Tsunami machine check handling to err_tsunami.c
- alpha: fill in pc for software event samples
- alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
- alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
- alpha: stop storing the user stack pointer in pt_regs
- alpha: fix stale user_stack_pointer()
- selftests/seccomp: add Alpha support to seccomp_bpf
- alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms
- alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
- alpha: invalidate the local context in flush_icache_user_page()
- alpha: invalidate the local context in flush_tlb_mm()
- alpha: fix the local TLB invalidate in the UP flush_tlb_page()
- alpha: fix the local TLB invalidate in flush_tlb_page()
- alpha: invalidate the local context in flush_tlb_page()
- alpha: only use a targeted tbi() when the target mm is really current
- alpha: run check_mmu_context() from finish_arch_post_lock_switch()
- alpha: load the MMU context when switch_mm() switches the current task
- alpha: implement hugetlb support
- alpha: align hugetlb mappings in arch_get_unmapped_area()
- alpha: define granularity hint PTE bits
- alpha: describe the PTE read and write enable bits
- alpha: handle VM_FAULT_HWPOISON in do_page_fault()
- alpha: add missing page_table_check_pte_clear() to ptep_get_and_clear()
- alpha: default NR_CPUS to 32 for Wildfire
- alpha: link platform help text to the alphalinux.org wiki
- alpha: correct system descriptions in Kconfig help text
- alpha: replace dead links in Kconfig help text
- alpha: support the remaining kernel compression formats
- alpha: add self-extracting compressed kernel boot stub
- xz: add arch-specific tuning for alpha
- alpha: select SPARSE_IRQ
- alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
- alpha: select ARCH_WANT_LD_ORPHAN_WARN
- alpha: discard .eh_frame and the relocation sections
- alpha: select SYSCTL_EXCEPTION_TRACE
- alpha: select ARCH_USE_MEMTEST
- alpha: select HAVE_GUP_FAST
- alpha: select ARCH_HAS_DEBUG_VM_PGTABLE
- alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
- alpha: add ARCH_HAS_PTE_SPECIAL support
- alpha: add HAVE_ARCH_THREAD_STRUCT_WHITELIST support
- alpha: select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
- alpha: select HAVE_ARCH_COMPILER_H
- alpha: select ARCH_SUPPORTS_INT128
- alpha: select ARCH_HAS_FAST_MULTIPLIER
- alpha: select ARCH_SUPPORTS_ATOMIC_RMW
- alpha: select EDAC_SUPPORT
- alpha: select HAVE_DEBUG_KMEMLEAK
- alpha: select ARCH_HAS_GCOV_PROFILE_ALL
- alpha: select ARCH_HAS_UBSAN
- alpha: enter hardirq context before looking up the irq descriptor
- alpha: enable GENERIC_ENTRY

----------------------------------------------------------------
Magnus Lindholm (18):
      alpha: enable GENERIC_ENTRY
      alpha: load the MMU context when switch_mm() switches the current task
      alpha: run check_mmu_context() from finish_arch_post_lock_switch()
      alpha: only use a targeted tbi() when the target mm is really current
      alpha: invalidate the local context in flush_tlb_page()
      alpha: fix the local TLB invalidate in flush_tlb_page()
      alpha: fix the local TLB invalidate in the UP flush_tlb_page()
      alpha: invalidate the local context in flush_tlb_mm()
      alpha: invalidate the local context in flush_icache_user_page()
      alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
      alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms
      selftests/seccomp: add Alpha support to seccomp_bpf
      alpha: move Tsunami machine check handling to err_tsunami.c
      alpha: describe the Tsunami system machine check frame
      alpha: bound EV6 logout decoding by the processor area
      alpha: decode and acknowledge Tsunami system machine checks
      alpha: decode Clipper environmental events
      alpha: add bounded Clipper console-log scanning

Matt Turner (39):
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
      alpha: select SPARSE_IRQ
      xz: add arch-specific tuning for alpha
      alpha: add self-extracting compressed kernel boot stub
      alpha: support the remaining kernel compression formats
      alpha: replace dead links in Kconfig help text
      alpha: correct system descriptions in Kconfig help text
      alpha: link platform help text to the alphalinux.org wiki
      alpha: default NR_CPUS to 32 for Wildfire
      alpha: add missing page_table_check_pte_clear() to ptep_get_and_clear()
      alpha: handle VM_FAULT_HWPOISON in do_page_fault()
      alpha: describe the PTE read and write enable bits
      alpha: define granularity hint PTE bits
      alpha: align hugetlb mappings in arch_get_unmapped_area()
      alpha: implement hugetlb support
      alpha: fix stale user_stack_pointer()
      alpha: stop storing the user stack pointer in pt_regs
      alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
      alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
      alpha: fill in pc for software event samples

 Documentation/admin-guide/kernel-parameters.txt    |   2 +-
 .../debug/debug-vm-pgtable/arch-support.txt        |   2 +-
 .../debug/gcov-profile-all/arch-support.txt        |   2 +-
 .../features/debug/kmemleak/arch-support.txt       |   2 +-
 .../features/perf/perf-regs/arch-support.txt       |   2 +-
 .../features/perf/perf-stackdump/arch-support.txt  |   2 +-
 .../features/vm/pte_special/arch-support.txt       |   2 +-
 arch/alpha/Kconfig                                 | 185 ++++--
 arch/alpha/Makefile                                |   6 +-
 arch/alpha/boot/.gitignore                         |   2 +
 arch/alpha/boot/Makefile                           |  16 +-
 arch/alpha/boot/compressed/.gitignore              |   3 +
 arch/alpha/boot/compressed/Makefile                |  89 +++
 arch/alpha/boot/compressed/head.S                  |  36 ++
 arch/alpha/boot/compressed/misc.c                  | 209 +++++++
 arch/alpha/boot/compressed/trampoline.S            |  46 ++
 arch/alpha/boot/compressed/vmlinux.lds.S           |  83 +++
 arch/alpha/boot/compressed/vmlinux.scr             |  10 +
 arch/alpha/include/asm/asm-prototypes.h            |   6 +
 arch/alpha/include/asm/core_tsunami.h              |   8 +-
 arch/alpha/include/asm/entry-common.h              |  14 +
 arch/alpha/include/asm/ftrace.h                    |   5 +-
 arch/alpha/include/asm/hugetlb.h                   |  43 ++
 arch/alpha/include/asm/mmu_context.h               |  35 +-
 arch/alpha/include/asm/page.h                      |  13 +
 arch/alpha/include/asm/perf_event.h                |   7 +
 arch/alpha/include/asm/pgtable.h                   |  83 ++-
 arch/alpha/include/asm/processor.h                 |  10 +-
 arch/alpha/include/asm/ptrace.h                    |  17 +-
 arch/alpha/include/asm/stacktrace.h                |  20 +
 arch/alpha/include/asm/switch_to.h                 |   1 -
 arch/alpha/include/asm/syscall.h                   |  11 +-
 arch/alpha/include/asm/thread_info.h               |  30 +-
 arch/alpha/include/asm/tlbflush.h                  |   3 +-
 arch/alpha/include/uapi/asm/perf_regs.h            |  45 ++
 arch/alpha/include/uapi/asm/ptrace.h               |   2 +-
 arch/alpha/kernel/Makefile                         |   5 +-
 arch/alpha/kernel/asm-offsets.c                    |   6 +-
 arch/alpha/kernel/core_tsunami.c                   |  34 -
 arch/alpha/kernel/entry.S                          | 323 +++-------
 arch/alpha/kernel/err_common.c                     |  13 +
 arch/alpha/kernel/err_ev6.c                        |  38 +-
 arch/alpha/kernel/err_impl.h                       |   1 +
 arch/alpha/kernel/err_tsunami.c                    | 688 +++++++++++++++++++++
 arch/alpha/kernel/irq.c                            |   9 +-
 arch/alpha/kernel/irq_alpha.c                      |  27 +-
 arch/alpha/kernel/osf_sys.c                        |  14 +-
 arch/alpha/kernel/perf_regs.c                      |  64 ++
 arch/alpha/kernel/process.c                        |   2 +-
 arch/alpha/kernel/proto.h                          |  11 +-
 arch/alpha/kernel/ptrace.c                         | 142 ++---
 arch/alpha/kernel/signal.c                         | 164 ++++-
 arch/alpha/kernel/smp.c                            |  67 +-
 arch/alpha/kernel/sys_dp264.c                      |   3 +-
 arch/alpha/kernel/traps.c                          |   8 -
 arch/alpha/kernel/vmlinux.lds.S                    |  11 +
 arch/alpha/lib/Makefile                            |   2 +
 arch/alpha/lib/tishift.c                           |  70 +++
 arch/alpha/mm/Makefile                             |   2 +
 arch/alpha/mm/fault.c                              |  52 +-
 arch/alpha/mm/hugetlbpage.c                        | 308 +++++++++
 arch/alpha/mm/init.c                               |   5 +
 arch/alpha/mm/tlbflush.c                           |  18 +-
 scripts/xz_wrap.sh                                 |   5 +
 tools/testing/selftests/seccomp/seccomp_bpf.c      |  26 +
 65 files changed, 2610 insertions(+), 560 deletions(-)
 create mode 100644 arch/alpha/boot/.gitignore
 create mode 100644 arch/alpha/boot/compressed/.gitignore
 create mode 100644 arch/alpha/boot/compressed/Makefile
 create mode 100644 arch/alpha/boot/compressed/head.S
 create mode 100644 arch/alpha/boot/compressed/misc.c
 create mode 100644 arch/alpha/boot/compressed/trampoline.S
 create mode 100644 arch/alpha/boot/compressed/vmlinux.lds.S
 create mode 100644 arch/alpha/boot/compressed/vmlinux.scr
 create mode 100644 arch/alpha/include/asm/entry-common.h
 create mode 100644 arch/alpha/include/asm/hugetlb.h
 create mode 100644 arch/alpha/include/asm/stacktrace.h
 create mode 100644 arch/alpha/include/uapi/asm/perf_regs.h
 create mode 100644 arch/alpha/kernel/err_tsunami.c
 create mode 100644 arch/alpha/kernel/perf_regs.c
 create mode 100644 arch/alpha/lib/tishift.c
 create mode 100644 arch/alpha/mm/hugetlbpage.c

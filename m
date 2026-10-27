Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087243;
	b=CLbs49CSbzmoUf+nXop5kGT2MfzZY6yCj70rO/MmLg82zm+vb+knfJ6RU2M++UO/adGN
	 3nRFnQEf5sSs03HKw6PK03F02tsPXs6ZPbqYvN6Zfj3dB4FEv058hVJxm/0w2DwQY8VyC
	 w//G9W+87ASn63RCec/hPnbHvI4igN8ZjXiToMCQfLRCmuQvx5LZnSZLx02NTBgLnFMeN
	 Spt1mE6LVoIaG/V1D7X3jDDuSvnIMaljYt/5yQafBxeOQKk7CK9kQ3zs3LNi+05MMswb1
	 T89qfSOuF6fvOhEFUZ7O16xP2n/8Jv5wuUpdww5zM7c1/YBaNe7ROnqP2ZlKHPHC49Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t18E7UE4PFJI3gidN0TaBJ4kzWBHAiAbXIwjPN/F3kE=;
	b=C5rzLyRIEgnx/DNQFw0HXHOMUONIV1daJ20mph/x2HI3dnC8plTGY++56EihZ23di4FC
	 +HOXXjdz6TBKK59bV+s+WMJO9zsUyYMxDKG9tDjcwdEsyPTg6RMygO7aTICvqcNPrpifs
	 /fDGjw5TpjBc57UubEGLBrAyiv3fLSIX930+zekRPD2o8en4fZ6wIMb/R1pkXWYcHLES4
	 ucO3u+NRmKDgRmdAvFVK6mXbW7s8ne1jKtDCNdZfMy9J9NCD189Z3wzy61g5tZg1Skqnw
	 h7GSQcxz1eW0RO5aWaGLUpwz2srknUcLT+2vIBO3o/0pd9CokiFoCHHjVLmkP6kVIhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HKSspb2V;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C8606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HKSspb2V
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1757402c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793087242; x=1793692042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t18E7UE4PFJI3gidN0TaBJ4kzWBHAiAbXIwjPN/F3kE=;
        b=HKSspb2VGku+bFEsu7MaHWJXk8xw9WesXjKFY12EOgL24ZOYJRPi7TsNQxxggEqcJV
         sba8zB68pBRCQ8XjEHh6czD6AupeAcA/ZiVBDWiBN6CNZLXNEuJo6Ai6Xg3viBVSlcvH
         8PLcafu3CvlWFkFxl1ixwAFo0+6Buq4QfucwzGqew3WsjkSnK7am1bN9PZ9Vo0VxET3z
         mt17j8KksNDacl3DlIxuxDwmMpoxDsj3K8OcuO/1Yue3TDIEX1HrbGNJraMut5VRFxrn
         30WYBUdNacng1L5Lyqpl7o690coKuHSRIUiE8rAReVrATQ8gd7We0FZap98ZgQ2mJdg4
         joog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087242; x=1793692042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t18E7UE4PFJI3gidN0TaBJ4kzWBHAiAbXIwjPN/F3kE=;
        b=l0y0oWw4mAD5/pR9BnzhNO2vArLoWSs4kwqbpSPpQ2DLVpjyk1J2RWVPds6aTK8uH6
         ktTUvwZQEUtKRj17TlKociaLlUwAXlRrG09P8KC/nV/EN1UDV/eQkwYZCqr1byDtw20j
         hKlvTdd57R0tU6T0F5jMybwHI0ccJT5z/7dqkXAy5e0KU61wyO8ldtwpzoGWM6QpACpd
         NCNbVA5ekPv7d1VLvmSPzoSmy7zAQSb7RbTjJfukxEDNQMq1Ydnq9yFY3j9PpRfBLL+s
         RvpJTFQn4uovv1AgL6Xra1G84LSgXEGVshWBnC6vk6/By4PxZT54bmTNH4HYsKT/i0f2
         Sg5Q==
X-Forwarded-Encrypted: i=1; AKwUvBymm9gggLZFB6atUqiXtTHbytk3JbcMDEW6qpi4aMN4r65YQklDa4FU5eu5ng2MOl7BLsOdVXD0hiHlbFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLrGXUZZfb23TGaFxSt/D8HxT/CuxzW4w6p6mgOmq4h1/UftMk
	XoO2iKZXzMgUHDPSxizt0dV7EmkWpPnX+prwvdWZ6VOKie1pBQ/pSmsX
X-Gm-Gg: AYBFou1l54bo1y2ci2obs2I4jZkvhH4mmiSp4I3wrSvE/A69zgKGhhMvRctc/aX1GtR
	F8/sIRhdXrTMCYXr79/tvcd29JqeyaqpXbwBb/VaIN19HfQJO0O3UbaD2diA99jQV5ogyd+VCWp
	XPZOY3+ZH1Gnt7gbz6TI0EWbeYGfcyP7pecDIt2rBTAgmiOvjgefVQBQDIreJ7S2GpJebQhZcP/
	+gdEfkkcFGowC2S3S8YpytWSfHqLX2vRrYXlctxVEL6Z4dKHlroZWlIgD3Ij7XfWnaSoqBQPiUl
	wBUWjddFFQpRIT7VJp/wMFysTMEQUGp2MLIxVBS9dOLXeJF4WDo06X/Rme4jm/aqdqZjXsBmVhJ
	OnVIWGCYxEXBhpwsQJ0d1OMmKQ0k9fkmF8Vo0/HQesweczEq9lVJi4Znza5hqNAampXa873NNDc
	4bXAcngT4MCHsQD7QNw02zPI9pnSo7c6nQwTrKUtmL6e7YUIJSh2XJ3jvEBIHEow5zAjgoJEHAy
	9wfyBVsXa5fjHdY3Qi+k+/1Cw6JPZhruO994khlRQ+f0Pra27IUfOTiJcu0kddp1kUhsrMNygwv
	tqICVMmlsZGiFO+3Q45EydYqqueomf8=
X-Received: by 2002:a05:7022:1508:b0:195:49ee:94c7 with SMTP id a92af1059eb24-19934a926ecmr14662254c88.8.1793087242216;
        Tue, 27 Oct 2026 00:47:22 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm36526698c88.10.2026.10.27.00.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:47:21 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	mkchauras@gmail.com,
	msuchanek@suse.de,
	bwiedemann@suse.de,
	ryan.roberts@arm.com,
	mchauras@linux.ibm.com,
	agordeev@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH V2] powerpc: Support for generic TIF bits
Date: Tue, 27 Oct 2026 13:17:10 +0530
Message-ID: <20261027074710.129819-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

powerpc already uses GENERIC_ENTRY for the irq entry/exit path.  That
means the generic entry code handles all the arch-independent
thread_info flags (TIF_SIGPENDING, TIF_NOTIFY_RESUME, TIF_NOTIFY_SIGNAL,
TIF_NEED_RESCHED, TIF_NEED_RESCHED_LAZY, TIF_UPROBE, TIF_PATCH_PENDING,
TIF_MEMDIE, TIF_RSEQ, TIF_HRTIMER_REARM, TIF_USER_RETURN_NOTIFY) on
behalf of the arch.  The only remaining blocker was that powerpc defined
its own bit numbers for those flags, which conflicted with the layout
required by the common header include/asm-generic/thread_info_tif.h.

This patch selects HAVE_GENERIC_TIF_BITS and switches powerpc's
thread_info.h over to include <asm-generic/thread_info_tif.h> for the
arch-independent bits, using HAVE_TIF_NEED_RESCHED_LAZY to opt in to
the lazy-preemption flag.  The powerpc-private bits (TIF_RESTORE_TM,
TIF_SINGLESTEP, TIF_RESTOREALL, TIF_NOERROR, TIF_EMULATE_STACK_STORE,
TIF_ELF2ABI, TIF_POLLING_NRFLAG, TIF_32BIT, TIF_SYSCALL_RET) are
renumbered to start at bit 16, which is the reserved range for arch use.

Enabling HAVE_GENERIC_TIF_BITS unlocks the following features that were
previously unavailable on powerpc because their Kconfig dependencies
could not be satisfied:

  1. RSEQ_SLICE_EXTENSION (CONFIG_RSEQ_SLICE_EXTENSION)
     Allows userspace to register an RSEQ critical section and request
     a limited time-slice extension when the task is about to be
     preempted.  The kernel grants the extension (via the RSEQ shared
     data ABI) so the critical section can complete, avoiding the
     thundering-herd problem where many threads spin on the same
     lock/resource after a preemption.  This feature requires a
     dedicated TIF_RSEQ bit, which only exists when HAVE_GENERIC_TIF_BITS
     is set.  Depends on: RSEQ && HIGH_RES_TIMERS && GENERIC_ENTRY &&
     HAVE_GENERIC_TIF_BITS.

  2. HRTIMER_REARM_DEFERRED (CONFIG_HRTIMER_REARM_DEFERRED)
     Defers re-arming of the hrtimer interrupt to the return-to-user
     path, using the dedicated TIF_HRTIMER_REARM bit.  This avoids
     redundant hrtimer_interrupt() invocations within the same tick
     period and reduces latency jitter for high-resolution timer users
     (e.g., PREEMPT_RT workloads, audio, real-time tasks).  Depends on:
     GENERIC_ENTRY && HAVE_GENERIC_TIF_BITS && HIGH_RES_TIMERS &&
     SCHED_HRTICK.

  3. Dedicated TIF_RSEQ flag (fast-path RSEQ handling)
     Without HAVE_GENERIC_TIF_BITS, TIF_RSEQ falls back to aliasing
     TIF_NOTIFY_RESUME, forcing the generic entry slow-path to run on
     every return-to-user for all RSEQ-registered threads.  With the
     dedicated bit, the fast path can skip RSEQ work unless the flag
     is actually set, reducing overhead in the common case.

  4. TIF_USER_RETURN_NOTIFY
     The generic bit for the user-return-notifier subsystem
     (kernel/user-return-notifier.c).  Used by KVM on x86 to lazily
     restore guest MSRs; having the generic bit available means future
     powerpc KVM work can use the same infrastructure.

The arch-specific bits that do not exist in the generic header retain
their private numbering in the powerpc-reserved range (bits 16+), so
no existing powerpc functionality is affected.

Tested on powerpc (POWER11 pSeries CONFIG_RSEQ=y +
CONFIG_RSEQ_SLICE_EXTENSION=y + CONFIG_HRTIMER_REARM_DEFERRED=y):

  * tools/testing/selftests/rseq/ -- all tests pass (basic_test,
    param_test, basic_percpu_ops_test, syscall_errors_test,
    slice_test via run_timeslice_test.sh)
  * tools/testing/selftests/timers/hrtimer-rearm.sh -- deferred=1
    events observed; no new dmesg warnings
  * Boot and basic workload testing shows no regression

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
This patch is applicabe over
https://lore.kernel.org/all/961c058f3f3e03045552186c083a68a0fde3f43f.1791975972.git.msuchanek@suse.de/

Changelog:

V1 -> V2:
 - Commit message updated
V1: https://lore.kernel.org/all/20261021144453.232372-2-mkchauras@gmail.com/

 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/thread_info.h | 36 +++++++++-----------------
 2 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7f7910f38a67..e5527b56159a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -255,6 +255,7 @@ config PPC
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER		if !COMPILE_TEST && (PPC64 || (PPC32 && CC_IS_GCC))
 	select HAVE_GCC_PLUGINS
+	select HAVE_GENERIC_TIF_BITS
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 4b7ec1db3034..4df3f4b5bd56 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -93,44 +93,32 @@ void arch_setup_new_exec(void);
 
 #endif /* __ASSEMBLER__ */
 
+#define HAVE_TIF_NEED_RESCHED_LAZY
+
+#include <asm-generic/thread_info_tif.h>
 /*
  * thread information flag bit numbers
  */
-#define TIF_SIGPENDING		1	/* signal pending */
-#define TIF_NEED_RESCHED	2	/* rescheduling necessary */
-#define TIF_NOTIFY_SIGNAL	3	/* signal notifications exist */
-#define TIF_RESTORE_TM		5	/* need to restore TM FP/VEC/VSX */
-#define TIF_PATCH_PENDING	6	/* pending live patching update */
-#define TIF_SINGLESTEP		8	/* singlestepping active */
-#define TIF_NEED_RESCHED_LAZY	9       /* Scheduler driven lazy preemption */
-#define TIF_RESTOREALL		11	/* Restore all regs (implies NOERROR) */
-#define TIF_NOERROR		12	/* Force successful syscall return */
-#define TIF_NOTIFY_RESUME	13	/* callback before returning to user */
-#define TIF_UPROBE		14	/* breakpointed or single-stepping */
-#define TIF_EMULATE_STACK_STORE	16	/* Is an instruction emulation
+#define TIF_RESTORE_TM		16	/* need to restore TM FP/VEC/VSX */
+#define TIF_SINGLESTEP		17	/* singlestepping active */
+#define TIF_RESTOREALL		18	/* Restore all regs (implies NOERROR) */
+#define TIF_NOERROR		19	/* Force successful syscall return */
+#define TIF_EMULATE_STACK_STORE	20	/* Is an instruction emulation
 						for stack store? */
-#define TIF_MEMDIE		17	/* is terminating due to OOM killer */
 #if defined(CONFIG_PPC64)
-#define TIF_ELF2ABI		18	/* function descriptors must die! */
+#define TIF_ELF2ABI		21	/* function descriptors must die! */
 #endif
-#define TIF_POLLING_NRFLAG	19	/* true if poll_idle() is polling TIF_NEED_RESCHED */
-#define TIF_32BIT		20	/* 32 bit binary */
-#define TIF_SYSCALL_RET		21	/* syscall error value set */
+#define TIF_POLLING_NRFLAG	22	/* true if poll_idle() is polling TIF_NEED_RESCHED */
+#define TIF_32BIT		23	/* 32 bit binary */
+#define TIF_SYSCALL_RET		24	/* syscall error value set */
 
 /* as above, but as bit values */
-#define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
-#define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
-#define _TIF_NEED_RESCHED_LAZY	(1<<TIF_NEED_RESCHED_LAZY)
-#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1<<TIF_32BIT)
 #define _TIF_RESTORE_TM		(1<<TIF_RESTORE_TM)
-#define _TIF_PATCH_PENDING	(1<<TIF_PATCH_PENDING)
 #define _TIF_SINGLESTEP		(1<<TIF_SINGLESTEP)
 #define _TIF_RESTOREALL		(1<<TIF_RESTOREALL)
 #define _TIF_NOERROR		(1<<TIF_NOERROR)
-#define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
-#define _TIF_UPROBE		(1<<TIF_UPROBE)
 #define _TIF_EMULATE_STACK_STORE	(1<<TIF_EMULATE_STACK_STORE)
 
 #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
-- 
2.56.0


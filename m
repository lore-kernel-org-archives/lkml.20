Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393B83E49D8;
	Wed,  2 Sep 2026 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335693; cv=none; b=cERjX8OVNFvUjNZKk5hRIZNcLW9h/1HWzV9tqCwsANBkozSf2Pwxy5fskMZekOB+VFimHAG1LNjeEK5L2ORLXMCLPlnAtN8fVzqTy4ood6jQNp7aVQc9AEs/kU6AaKS9OzdCP5vDP8YeBdLLrxuISDaR5XEEkKgkBmZ3GCk5p/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335693; c=relaxed/simple;
	bh=uCrxAq81YyhEUe9XGbDmYyW3w5bvHQW9QHZJ6HQQAMA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qVvyCLaPtu0ocUpBJcIgqWl+iGVkks92kRwnuK/bwTQevAD7mqsLe7nmgi+r7oikTIWvN0yBYqQgmqyrEUobwA4CXZ0y0fLHjNi3iChBEmK5EZnAEx037pHS5zstHfznRqP419UG0J5Q6NfEkG9Gh8ObRhzeMP0nf/Jh5gx9fBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MvnVz+Qw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qM5E0ZV0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MvnVz+Qw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qM5E0ZV0"
Date: Wed, 02 Sep 2026 07:54:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335689;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iEja87w5r3qW9cDv3PhRQiIZJlFm1w6Yen6PaBOc4fE=;
	b=MvnVz+QwwqfyxWALYV5bi2TjA1dwx7loIwO/wluPF/WaRUys98QT3QHrsGNb+pFxoeWIDU
	UvEC82aim/s/lsshsKHUsFdpjhWe/pdJjUHbEaTA3P4tJtUCfoKLwZyK1lq5QbJxLskJgJ
	IagvKwt6rx01ixjpAOHIqO6QuGhCYyCFBXoxVe86v9Cw24NCqYNIHHVvUZgD/n86sPpr5W
	HEr1qKqKeceBktb2Or/q70qw4ARzPvwftXzsn0gL5gFCosT5m+wgJS8AH3B59AZtKUSSxA
	VyEc2p4vYqA+IALAZTc05sMYcZOtk9H4ZbRlNJSuofF+43P7m/g0eiVMFVdjiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335689;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iEja87w5r3qW9cDv3PhRQiIZJlFm1w6Yen6PaBOc4fE=;
	b=qM5E0ZV07BYE0Czg6FdgnvOzIVE0DP2r7lP89jaNIRXcIGTMDE7F8lOLZy8Os8HuHdM99J
	f3m/GjCd/xJkWeDA==
From: "tip-bot2 for Mark Rutland" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched: dynamic: Remove HAVE_PREEMPT_DYNAMIC_{CALL,KEY}
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Mete Durlu <meted@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803191731.3244294-6-mark.rutland@arm.com>
References: <20260803191731.3244294-6-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833568800.3717435.6283616671840638602.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     5b9a28eeed37513778ca6b636253aa8dcf39d55f
Gitweb:        https://git.kernel.org/tip/5b9a28eeed37513778ca6b636253aa8dcf3=
9d55f
Author:        Mark Rutland <mark.rutland@arm.com>
AuthorDate:    Mon, 03 Aug 2026 20:17:30 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:23 +02:00

sched: dynamic: Remove HAVE_PREEMPT_DYNAMIC_{CALL,KEY}

PREEMPT_DYNAMIC is now limited to the FULL and LAZY preemption models.
Switching model only changes the behaviour of dynamic_preempt_lazy(),
which uses a static key. There are no other static calls or static keys,
and so there's no need for HAVE_PREEMPT_DYNAMIC_CALL or
HAVE_PREEMPT_DYNAMIC_KEY.

The static key used by dynamic_preempt_lazy() is entirely local to
kernel/sched/core.c, and any architecture which selects
ARCH_HAS_PREEMPT_LAZY implements the necessary support. Remove
PREEMPT_DYNAMIC's dependencies on HAVE_PREEMPT_DYNAMIC_CALL and
HAVE_PREEMPT_DYNAMIC_KEY entirely, leaving the dependency on
ARCH_HAS_PREEMPT_LAZY.

For architectures which previously selected HAVE_PREEMPT_DYNAMIC_KEY,
PREEMPT_DYNAMIC will now be selected by default, matching x86. As the
runtime impact is limited to dynamic_preempt_lazy(), this shouldn't be
as concerning as previously (e.g. where calls to {cond,might}_resched()
stubs could introduce a measurable penalty).

As all of this can work without jump labels, JUMP_LABEL is not selected
explicitly. It is obviously preferable to have JUMP_LABEL enabled, but
this is not functionally necessary.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Tested-by: Mete Durlu <meted@linux.ibm.com>
Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://patch.msgid.link/20260803191731.3244294-6-mark.rutland@arm.com
---
 arch/Kconfig           | 38 --------------------------------------
 arch/arm64/Kconfig     |  1 -
 arch/loongarch/Kconfig |  1 -
 arch/powerpc/Kconfig   |  1 -
 arch/riscv/Kconfig     |  1 -
 arch/s390/Kconfig      |  1 -
 arch/x86/Kconfig       |  1 -
 kernel/Kconfig.preempt |  8 ++------
 kernel/sched/core.c    | 10 ----------
 9 files changed, 2 insertions(+), 60 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 45c6577..c0a6a13 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1712,44 +1712,6 @@ config HAVE_STATIC_CALL_INLINE
 	depends on HAVE_STATIC_CALL
 	select OBJTOOL
=20
-config HAVE_PREEMPT_DYNAMIC
-	bool
-
-config HAVE_PREEMPT_DYNAMIC_CALL
-	bool
-	depends on HAVE_STATIC_CALL
-	select HAVE_PREEMPT_DYNAMIC
-	help
-	  An architecture should select this if it can handle the preemption
-	  model being selected at boot time using static calls.
-
-	  Where an architecture selects HAVE_STATIC_CALL_INLINE, any call to a
-	  preemption function will be patched directly.
-
-	  Where an architecture does not select HAVE_STATIC_CALL_INLINE, any
-	  call to a preemption function will go through a trampoline, and the
-	  trampoline will be patched.
-
-	  It is strongly advised to support inline static call to avoid any
-	  overhead.
-
-config HAVE_PREEMPT_DYNAMIC_KEY
-	bool
-	depends on HAVE_ARCH_JUMP_LABEL
-	select HAVE_PREEMPT_DYNAMIC
-	help
-	  An architecture should select this if it can handle the preemption
-	  model being selected at boot time using static keys.
-
-	  Each preemption function will be given an early return based on a
-	  static key. This should have slightly lower overhead than non-inline
-	  static calls, as this effectively inlines each trampoline into the
-	  start of its callee. This may avoid redundant work, and may
-	  integrate better with CFI schemes.
-
-	  This will have greater overhead than using inline static calls as
-	  the call to the preemption function cannot be entirely elided.
-
 config ARCH_WANT_LD_ORPHAN_WARN
 	bool
 	help
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0..876ef29 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -217,7 +217,6 @@ config ARM64
 	select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-	select HAVE_PREEMPT_DYNAMIC_KEY
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a21f51e..9480ccf 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -170,7 +170,6 @@ config LOONGARCH
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
-	select HAVE_PREEMPT_DYNAMIC_KEY
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE if UNWINDER_ORC
 	select HAVE_RETHOOK
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2580e27..143381d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -279,7 +279,6 @@ config PPC
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-	select HAVE_PREEMPT_DYNAMIC_KEY
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_RETHOOK			if KPROBES
 	select HAVE_REGS_AND_STACK_ACCESS_API
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f8e26c4..66096a0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -195,7 +195,6 @@ config RISCV
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
-	select HAVE_PREEMPT_DYNAMIC_KEY
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK
 	select HAVE_RSEQ
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 4b51bc6..2682a2b 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -246,7 +246,6 @@ config S390
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
-	select HAVE_PREEMPT_DYNAMIC_KEY
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RETHOOK
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec..5a84998 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -297,7 +297,6 @@ config X86
 	select HAVE_STACK_VALIDATION		if HAVE_OBJTOOL
 	select HAVE_STATIC_CALL
 	select HAVE_STATIC_CALL_INLINE		if HAVE_OBJTOOL
-	select HAVE_PREEMPT_DYNAMIC_CALL
 	select HAVE_RSEQ
 	select HAVE_RUST			if X86_64
 	select HAVE_SYSCALL_TRACEPOINTS
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 68f3218..985aea6 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -132,11 +132,9 @@ config PREEMPTION
=20
 config PREEMPT_DYNAMIC
 	bool "Preemption behaviour defined on boot"
-	depends on HAVE_PREEMPT_DYNAMIC
 	depends on ARCH_HAS_PREEMPT_LAZY
-	select JUMP_LABEL if HAVE_PREEMPT_DYNAMIC_KEY
 	select PREEMPT_BUILD
-	default y if HAVE_PREEMPT_DYNAMIC_CALL
+	default y
 	help
 	  This option allows to define the preemption model on the kernel
 	  command line parameter and thus override the default preemption
@@ -146,9 +144,7 @@ config PREEMPT_DYNAMIC
 	  provide a pre-built kernel binary to reduce the number of kernel
 	  flavors they offer while still offering different usecases.
=20
-	  The runtime overhead is negligible with HAVE_STATIC_CALL_INLINE enabled
-	  but if runtime patching is not available for the specific architecture
-	  then the potential overhead should be considered.
+	  The runtime overhead is negligible.
=20
 	  Interesting if you want the same pre-built kernel should be used for
 	  both Server and Desktop workloads.
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0e9022f..0592320 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7886,16 +7886,6 @@ int sched_dynamic_mode(const char *str)
 # define preempt_dynamic_key_enable(f)	static_key_enable(&sk_dynamic_##f.key)
 # define preempt_dynamic_key_disable(f)	static_key_disable(&sk_dynamic_##f.k=
ey)
=20
-# if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-#  define preempt_dynamic_enable(f)	static_call_update(f, f##_dynamic_enable=
d)
-#  define preempt_dynamic_disable(f)	static_call_update(f, f##_dynamic_disab=
led)
-# elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-#  define preempt_dynamic_enable(f)	preempt_dynamic_key_enable(f)
-#  define preempt_dynamic_disable(f)	preempt_dynamic_key_disable(f)
-# else
-#  error "Unsupported PREEMPT_DYNAMIC mechanism"
-# endif
-
 static DEFINE_MUTEX(sched_dynamic_mutex);
=20
 static void __sched_dynamic_update(int mode)

Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0186534AB14
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364876; cv=none; b=lsSyLJjn/RB1Me+8Q3WwSMkdCiUZ0+Li/uvmz18+4lrtTPMRyNRGfJ0mZa+CFl6TEDZ+FbFcQDXdlz+r2jDjvVrshkHuGceiusdZay5LsfOtHCE6K6TWgoEXKARlbMfJno8rcoLqBgvzsbHzClJyk7Xl7BDUtNyts2gKWuEzGJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364876; c=relaxed/simple;
	bh=CUB0bt0PD/hU/NUmPEu2fjS0dBweUskEeNImyt/mS0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PuSU/4po9KsMHFrrASjvLgENeeyzzHh0WKtmlO9RrP7YNN4wzzJwiDYKRB4y1w0rDXmMrlleyGemYV/sItJwVVgrqQLc9+SZqg3n6H34OBc7WsOIbAln9huRQ9YDdzX78xuP7SSxKPtO29D1Y3uWrkmwWdVjWLV1r+5rIpjlgwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNmqefft; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNmqefft"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso35111265e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364871; x=1789969671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ZTMob0o+utf7su3CLoVCih492Ib0kyWlamzowWIdU4=;
        b=BNmqefft066SbsB30crwGRIWgqnL0yvW78QjdU8zzOBeW9EhkiPmuuEiqcwkUTVSci
         M626kp8LNNV6Qw0TpYMinKwKESCzCqeDSwJnE0zz5ODL9C+YhhT2qAL/IS9wFtN3ikpC
         RIHOseYTOQ6BYgkAY0XCXxLK6FzgcovNiw9bgbFSQw1l1P5HsRmDM14dIEBe17BlWRbP
         UNM/HaKvg4XZbET3D6K/qRrHcXtc9/QDAcMCRHmkigl9C4cq0HymgPZIUup8kmuS8dn8
         G/v8qvh2W70daKtysoZoNfNaP9RVk8SMM/W9mSOr9QAXzJadgcRses4r9CqR3G/OJhJF
         Db0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364871; x=1789969671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZTMob0o+utf7su3CLoVCih492Ib0kyWlamzowWIdU4=;
        b=MlrLhOGDzTHF/DTkwCAChWl6fUD7LiBDb2i0nQA0SyBTrsapr9QGFfbO1PppRakQPg
         1y4vr9JWsrpK95DD0dSwoXlfCR0bL6G4vKWAZo6YlaLrGFAc+hnAA0pNLuINnaCjKv4e
         zkqvkPLzqcojV/NLWQ9QfzK/Y5TsN4Vk7zNRh8g9lgqjkuhNL7e/udB6ReSjMey9KxMG
         bTYPTeSqzPkKUK+vmiKKOVlTQQV513BqwoWa0ckW6cl6pDpnwhc75dGruwhYJdtew1SW
         u/Qm9wsklzoA9oUpBtMtKL4hhaIz9b2aUu0bM6PugASyIneHXOdHpv+5mUCl81Ysj4r8
         y3iw==
X-Forwarded-Encrypted: i=1; AKwUvBwTCa4UD6KVkWS1UPGaFLJCZIEAHBw5mKiwpuyjCG6fige9ujsdUedLfdWstMubCi1/E9k6gnGsnt3+uYg=@vger.kernel.org
X-Gm-Message-State: AFuF++mk2U2L/Detl6WG8u51mlm1gBMvwi97OtzqyhtaAErflHkC/O/Y
	V+tklHtcqOGrETBEm2DdONj4uYVRKRzcvPDxnsO72UezmsXtN/rokdTy
X-Gm-Gg: AYBFou1PfH4ScZhY7z1TWheRf17VCotSVkWI48PW+C66h0TqLbnA1aONeUUiak8tEgI
	7fVcrJBnl1pHp9/XwUMs/FrKS7aEfb/Cn4528Phwl6qufIaJAtsuGfBX3mbcg4V68LJvKzOHaoz
	S0vhyxL6busv8PYgtB5vV+OyHVAtJpd8xbInbdQA+6s+7QMsFtMG8z7dZw+xut8J+2LxS3cdQSS
	125awyBC5xLmElz3ueFumFfL+9bTCmgZpr8Ro6TGKF22BKNBLszoYFXfngI4rE81iEFEbmu8gjl
	740Q34aF0xtEL0m+UWh4otC65JFcmPflvdowQEP1By4eFeZNmDwODkkHT4cdjHnaObXXazO198l
	/b6ik6ylmmAUs7zHs4IYDWzLFIY/yXi4AbsSzNiXfopH1eRLP0YJkN0GPxwIvxU97PSBYIesOf5
	WFT5HFJD5AGeLMQvRdYt1IwhE7b/EL+sTmFefT2R51HW7MnbXpkOARw9jwoh88/8PyNYf/QWYQw
	KLGXpQm3CidckpQsdPbZO5YquofXec/DoBIvZ6cM0fHzJPw3xt3ivzHz4RPu68hkkfYKaVvaHS3
	XA6xcFgdQOS1vpNtvh3HqjZLkql79wxJ+1yAp0x2oLM=
X-Received: by 2002:a05:600c:a012:b0:49e:799a:8952 with SMTP id 5b1f17b1804b1-49e7a67798fmr9540685e9.26.1789364870959;
        Sun, 13 Sep 2026 22:47:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm214537735e9.5.2026.09.13.22.47.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 22:47:50 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <include@grrlz.net>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] kcov: Suppress timer and scheduler coverage leaks
Date: Mon, 14 Sep 2026 07:46:26 +0200
Message-Id: <20260914054632.12877-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KCOV aims to exclude interrupt and scheduler coverage so syscall coverage
stays input-dependent. Instrumented callees can still record when
uninstrumented timer and scheduler paths run with in_task() true.

With the diagnostic patch in [1] applied, CONFIG_KCOV_SELFTEST exposes
three cases on x86-64: deferred hrtimer rearm, __schedule() callees and
PREEMPT_RT wakeups. Task-context wakeups and new-task enqueue also add
scheduler coverage to ordinary syscalls.

Add a nestable KCOV_PAUSED bit and a kcov_pause guard. Use the guard for
deferred hrtimer rearm, __schedule(), the try_to_wake_up() wakeup body
and wake_up_new_task(). This suppresses their instrumented callees
without excluding those callees from task-context coverage.

Changes in v3:
 - Rebase onto current mainline (22098763a10d).
 - Share flag helpers between pause and context-switch suppression, with
   READ_ONCE(), WRITE_ONCE() and compiler barriers (Alexander Potapenko).
 - Take the try_to_wake_up() pause guard before the preemption guard, so
   preemption is re-enabled before KCOV resumes.
 - Clarify that guard users must be built without KCOV instrumentation.
 - Add Alexander's Reviewed-by on patch 1.
 - Drop the broad Fixes tags from the scheduler patches.

v3 testing:
 - GCC 15.2 x86-64 full builds with KCOV, KCOV plus PREEMPT_RT, and
   CONFIG_KCOV=n; full arm64, RISC-V64 and s390 builds.
 - KCOV selftest: 10/10 x86-64 boots each with and without PREEMPT_RT;
   3/3 s390 boots; Clang/LLVM 21.1.8 x86-64 full build and 3/3 boots.
 - Affected-object builds with GCC 8.1 on x86-64; ARM32 and LoongArch64
   with and without PREEMPT_RT; RISC-V32, RISC-V64 RT and arm64 RT.
 - 1,200 KCOV-enabled fork() calls on x86-64 PREEMPT_RT, plus 3,600 futex
   handshakes across RT PC and non-RT PC/CMP modes, with 21,609 nonempty,
   nonsaturated fresh coverage probes.
 - USB remote-coverage preservation: 40 disconnect/reconnect cycles each
   on x86-64 and arm64, with arch/arm64/kernel/irq.o additionally excluded
   from KCOV for the arm64 run. Intended USB symbols and task tracing
   stayed live; no buffer saturation or detected disable race.
 - scripts/checkpatch.pl --strict and git diff --check.

Default arm64 and RISC-V selftests still failed in ways consistent with
documented entry-instrumentation issues outside this series. The USB
checks used observation mode to record additional user-return coverage;
they test remote-coverage preservation, not zero-noise task coverage.
The arm64 build exclusion is not part of v3.

Three one-hour syzkaller A/B pairs were run for v2. Each baseline and
patched run used four 2-vCPU PREEMPT_RT VMs. The patched kernel completed
22-51% more executions than base. At matched execution counts, corpus size
grew 42-54% and coverage 14-19%. No run produced a report.

[1] https://lore.kernel.org/r/20260724192122.73080-1-kmehltretter@gmail.com

v1: https://lore.kernel.org/r/20260807205027.31972-1-kmehltretter@gmail.com
v2: https://lore.kernel.org/r/20260811154111.64669-1-kmehltretter@gmail.com

Karl Mehltretter (6):
  kcov: Use unsigned int for kcov_start() mode parameter
  kcov: Add a kcov_pause guard
  hrtimer: Pause KCOV during deferred rearm
  sched/core: Pause KCOV in __schedule()
  sched/core: Pause KCOV in try_to_wake_up()
  sched/core: Pause KCOV in wake_up_new_task()

 include/linux/hrtimer_rearm.h | 18 +++++++-
 include/linux/kcov.h          | 80 +++++++++++++++++++++++++++++++----
 kernel/kcov.c                 |  7 +--
 kernel/sched/core.c           | 10 ++++-
 4 files changed, 97 insertions(+), 18 deletions(-)

Range-diff:
1:  f60b858edad9 ! 1:  cbbdcfe8483b kcov: Use unsigned int for kcov_start() mode parameter
    @@ Commit message
         Type the parameter unsigned int, like the field and the saved copy. No
         functional change.
     
    -    Assisted-by: Claude:claude-fable-5
    +    Assisted-by: LLM
         Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
    +    Reviewed-by: Alexander Potapenko <glider@google.com>
     
      ## kernel/kcov.c ##
     @@ kernel/kcov.c: EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
2:  4415cac41ca4 ! 2:  1ca1b221b7e6 kcov: Add a kcov_pause guard
    @@ Commit message
         runs on the previous task and kcov_finish_switch() on the one switched
         in, so its lifetime is not a pause section.
     
    -    Provide a kcov_pause guard backed by internal helpers that operate on
    -    current. The guard saves the previous pause state and restores it at
    -    scope exit, so sections nest. When KCOV is enabled for current, remote
    -    softirq sections save and restore the complete mode, preserving the pause
    -    state.
    +    The shared setter no longer sets KCOV_IN_CTXSW on a disabled task,
    +    since its mode already fails the coverage callbacks' exact comparison.
     
    -    The helpers are __always_inline, and guard users must be uninstrumented:
    -    inlining does not remove the caller's own coverage callbacks.
    +    Provide a kcov_pause guard backed by flag helpers shared with context
    +    switch suppression. The helpers access kcov_mode with READ_ONCE() and
    +    WRITE_ONCE() and use compiler barriers to keep instrumented calls inside
    +    the suppressed region. The guard saves the previous pause state and
    +    restores it at scope exit, so sections nest. When KCOV is enabled for
    +    current, remote softirq sections save and restore the complete mode,
    +    preserving the pause state.
     
    -    Assisted-by: Claude:claude-fable-5
    +    With CONFIG_KCOV=y, restoring a previously clear flag still writes
    +    kcov_mode even when task coverage is disabled; nested guards also take
    +    that path in this case.
    +
    +    The helpers are __always_inline. Guard users must be built without KCOV
    +    instrumentation because inlining does not remove the caller's own coverage
    +    callbacks.
    +
    +    Assisted-by: LLM
    +    Suggested-by: Alexander Potapenko <glider@google.com>
         Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
     
      ## include/linux/kcov.h ##
    @@ include/linux/kcov.h: enum kcov_mode {
     -#define KCOV_IN_CTXSW	(1 << 30)
     +#define KCOV_IN_CTXSW	BIT(30)
     +#define KCOV_PAUSED	BIT(29)
    ++
    ++static __always_inline bool kcov_mode_enabled(unsigned int mode)
    ++{
    ++	return (mode & ~(KCOV_IN_CTXSW | KCOV_PAUSED)) != KCOV_MODE_DISABLED;
    ++}
      
      void kcov_task_init(struct task_struct *t);
      void kcov_task_exit(struct task_struct *t);
    -@@ include/linux/kcov.h: do {						\
    - 	(t)->kcov_mode &= ~KCOV_IN_CTXSW;	\
    - } while (0)
      
    +-#define kcov_prepare_switch(t)			\
    +-do {						\
    +-	(t)->kcov_mode |= KCOV_IN_CTXSW;	\
    +-} while (0)
    ++static __always_inline unsigned int
    ++__kcov_set_flag(struct task_struct *t, unsigned int flag)
    ++{
    ++	unsigned int mode = READ_ONCE(t->kcov_mode);
    ++	unsigned int prev_flag = mode & flag;
    ++
    ++	if (!prev_flag && kcov_mode_enabled(mode)) {
    ++		WRITE_ONCE(t->kcov_mode, mode | flag);
    ++		barrier();
    ++	}
    ++	return prev_flag;
    ++}
    + 
    +-#define kcov_finish_switch(t)			\
    +-do {						\
    +-	(t)->kcov_mode &= ~KCOV_IN_CTXSW;	\
    +-} while (0)
    ++static __always_inline void
    ++__kcov_restore_flag(struct task_struct *t, unsigned int flag,
    ++		    unsigned int prev_flag)
    ++{
    ++	if (!prev_flag) {
    ++		barrier();
    ++		WRITE_ONCE(t->kcov_mode, READ_ONCE(t->kcov_mode) & ~flag);
    ++	}
    ++}
    ++
    ++static __always_inline void kcov_prepare_switch(struct task_struct *t)
    ++{
    ++	__kcov_set_flag(t, KCOV_IN_CTXSW);
    ++}
    ++
    ++static __always_inline void kcov_finish_switch(struct task_struct *t)
    ++{
    ++	__kcov_restore_flag(t, KCOV_IN_CTXSW, 0);
    ++}
    ++
     +/*
    -+ * Pause coverage for current. Callers must be uninstrumented.
    ++ * Pause coverage for current. Callers must be built without KCOV
    ++ * instrumentation.
     + * Pass the returned state to __kcov_resume().
     + */
     +static __always_inline unsigned int __kcov_pause(void)
     +{
    -+	unsigned int paused;
    -+
    -+	paused = current->kcov_mode & KCOV_PAUSED;
    -+	current->kcov_mode |= KCOV_PAUSED;
    -+	return paused;
    ++	return __kcov_set_flag(current, KCOV_PAUSED);
     +}
     +
     +static __always_inline void __kcov_resume(unsigned int paused)
     +{
    -+	if (!paused)
    -+		current->kcov_mode &= ~KCOV_PAUSED;
    ++	__kcov_restore_flag(current, KCOV_PAUSED, paused);
     +}
    -+
    + 
      /* See Documentation/dev-tools/kcov.rst for usage details. */
      void kcov_remote_start(u64 handle);
    - void kcov_remote_stop(void);
     @@ include/linux/kcov.h: void __sanitizer_cov_trace_switch(kcov_u64 val, void *cases);
      
      static inline void kcov_task_init(struct task_struct *t) {}
    @@ include/linux/kcov.h: static inline void kcov_remote_start_usb_softirq(u64 id) {
     + *	guard(kcov_pause)();
     + *
     + * pauses coverage for current until the end of the scope. Callers must be
    -+ * uninstrumented.
    ++ * built without KCOV instrumentation.
     + */
     +DEFINE_LOCK_GUARD_0(kcov_pause,
     +		    _T->paused = __kcov_pause(),
    @@ include/linux/kcov.h: static inline void kcov_remote_start_usb_softirq(u64 id) {
     
      ## kernel/kcov.c ##
     @@ kernel/kcov.c: static const struct file_operations kcov_fops = {
    +  * collecting coverage and copies all collected coverage into the kcov area.
    +  */
      
    - static inline bool kcov_mode_enabled(unsigned int mode)
    - {
    +-static inline bool kcov_mode_enabled(unsigned int mode)
    +-{
     -	return (mode & ~KCOV_IN_CTXSW) != KCOV_MODE_DISABLED;
    -+	return (mode & ~(KCOV_IN_CTXSW | KCOV_PAUSED)) != KCOV_MODE_DISABLED;
    - }
    - 
    +-}
    +-
      static void kcov_remote_softirq_start(struct task_struct *t)
    + 	__must_hold(&kcov_percpu_data.lock)
    + {
3:  c891839993a1 ! 3:  238cf03aa786 hrtimer: Pause KCOV during deferred rearm
    @@ Commit message
         __no_sanitize_coverage, which is empty before GCC 12. Tested with GCC 8.1
         and 15 on x86_64.
     
    +    A later patch also pauses __schedule(); keeping hrtick_schedule_exit()
    +    guarded here makes the deferred-rearm fix independent of that scheduler
    +    change.
    +
         Fixes: 15dd3a948855 ("hrtimer: Push reprogramming timers into the interrupt return path")
    -    Assisted-by: Claude:claude-fable-5
    +    Assisted-by: LLM
         Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
     
      ## include/linux/hrtimer_rearm.h ##
     @@
    - #define _LINUX_HRTIMER_REARM_H
      
      #ifdef CONFIG_HRTIMER_REARM_DEFERRED
    + #include <linux/irqflags.h>
     +#include <linux/kcov.h>
    + #include <linux/lockdep.h>
    + #include <linux/preempt.h>
      #include <linux/thread_info.h>
      
      void __hrtimer_rearm_deferred(void);
      
     +/*
     + * KCOV: Pause outside __hrtimer_rearm_deferred() to suppress entry coverage.
    -+ * Callers with KCOV enabled for current must be uninstrumented.
    ++ * Callers with KCOV enabled for current must be built without KCOV
    ++ * instrumentation.
     + */
     +static __always_inline void hrtimer_rearm_deferred_kcov_paused(void)
     +{
4:  63657f2c7ef0 ! 4:  55c364e62fb8 sched/core: Pause KCOV in __schedule()
    @@ Metadata
      ## Commit message ##
         sched/core: Pause KCOV in __schedule()
     
    -    kernel/sched/ is not instrumented, but callees such as sched_clock(),
    -    architecture CPU-capacity helpers and profile_hits() are.
    +    kernel/sched/ is built without KCOV instrumentation, but callees such
    +    as sched_clock(), architecture CPU-capacity helpers and profile_hits() are.
     
         During preemption and schedule() calls, instrumented callees can add
         nondeterministic scheduler coverage to current.
    @@ Commit message
         KCOV_PAUSED remains set while a task is switched out. The guard in its
         resumed __schedule() frame restores the prior state.
     
    -    Fixes: 5c9a8750a640 ("kernel: add kcov code coverage")
    -    Assisted-by: Claude:claude-fable-5
    +    Assisted-by: LLM
         Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
     
      ## kernel/sched/core.c ##
5:  5cf8497b8a0a ! 5:  2b6c6355917c sched/core: Pause KCOV in try_to_wake_up()
    @@ Metadata
      ## Commit message ##
         sched/core: Pause KCOV in try_to_wake_up()
     
    -    try_to_wake_up() is uninstrumented, but it calls instrumented helpers
    -    such as kthread_is_per_cpu(), CPU capacity helpers and SCHED_HRTICK
    -    arming. They can record into current while in_task() is true.
    +    try_to_wake_up() is built without KCOV instrumentation, but it calls
    +    instrumented helpers such as kthread_is_per_cpu(), CPU capacity helpers
    +    and SCHED_HRTICK arming. They can record into current while in_task() is
    +    true.
     
         CONFIG_KCOV_SELFTEST exposes this under PREEMPT_RT. The interrupt
         selftest fails on x86_64 in kthread_is_per_cpu(): RT runs the timer
    @@ Commit message
         selftest's spin. The same helpers leak into non-RT syscall wakeups such
         as a pipe write waking a reader.
     
    -    Pause the wakeup body with the kcov_pause guard. Wrapping only
    -    select_task_rq() would miss SCHED_HRTICK arming during enqueue.
    +    Pause the wakeup body with the kcov_pause guard. Take it before the
    +    preemption guard so preemption is re-enabled while KCOV remains paused.
    +    Wrapping only select_task_rq() would miss SCHED_HRTICK arming during
    +    enqueue.
     
    -    Fixes: 5c9a8750a640 ("kernel: add kcov code coverage")
    -    Assisted-by: Claude:claude-fable-5
    +    Assisted-by: LLM
         Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
     
      ## kernel/sched/core.c ##
    -@@ kernel/sched/core.c: int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
    - 	guard(preempt)();
    - 	int cpu, success = 0;
    - 
    +@@ kernel/sched/core.c: bool ttwu_state_match(struct task_struct *p, unsigned int state, int *success)
    +  */
    + int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
    + {
     +	/* Instrumented callees would leak coverage into current. */
     +	guard(kcov_pause)();
    -+
    - 	wake_flags |= WF_TTWU;
    + 	guard(preempt)();
    + 	int cpu, success = 0;
      
    - 	if (p == current) {
6:  a00870853f5a ! 6:  417784f395a8 sched/core: Pause KCOV in wake_up_new_task()
    @@ Metadata
      ## Commit message ##
         sched/core: Pause KCOV in wake_up_new_task()
     
    -    wake_up_new_task() is uninstrumented, but CPU selection and enqueue call
    -    instrumented helpers. During a KCOV-enabled fork, they can record
    -    scheduler, hrtimer and clockevent coverage into the parent.
    +    wake_up_new_task() is built without KCOV instrumentation, but CPU
    +    selection and enqueue call instrumented helpers. During a KCOV-enabled
    +    fork, they can record scheduler, hrtimer and clockevent coverage into the
    +    parent.
     
         The paths depend on runqueue and CPU state, so coverage varies between
         identical forks. Pause KCOV for the whole function, extending the
         scheduler exclusion to new-task wakeups.
     
    -    Fixes: 5c9a8750a640 ("kernel: add kcov code coverage")
    -    Assisted-by: Claude:claude-fable-5
    +    Assisted-by: LLM
         Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
     
      ## kernel/sched/core.c ##

base-commit: 22098763a10d9c1340827fcf6edab66f153b27f0
-- 
2.53.0

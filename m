Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396591;
	b=DSu5jIb6qoHYeWMfeWcORy8O7jdizimsZJyfZ7GE6/4d3dyCzpz1rlHjhPH0JM0f/Xh5
	 vvK/MRROj1Py7LQGuXsq4n/h1t6wyo46GmoEyS/lSARnOl16UULLaT3a/BU5Ejaix3S2e
	 idU07Y6SYGPGTfJNwbk5owCuovhY/T5eE4ceoNLRSAY1CN9bryGto4tZYwaoTgMzLRQ9H
	 gb8RnsIWm+MJNkFDUkqVLUzQBfh8dl+L3Mji/Ga8byFEOdcLa21ED8F/b24mnXmDy2YLi
	 haD02wovKuXMDFcum3M1UH4EJ+JUkmFY8DH01IWy0BoLZXvmL5CZqo1OqIRYco/ULqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WkB8fsr47aYLBpdq7IfPBM4C/nowCRinQnYQ8Fh6Bis=;
	b=eimXnKBe6hkxiTtbj4rbG2k8MYk31G/IFt5GMl8TF0RPHJE1fEPiybAvjair349poSRl
	 BPuVZM7MZ/IlGPao9+xihnbkuK0nk/uFrAfvvdzxZ0tQBllWMtcaWwMbM7IckjxAsVg2x
	 BqgTG0GoW25yi5dUpQXU9dU4sabMJ+30mm9cPL8XZ0nclzPBjTya7zRQGQnZ6aXcs/XQu
	 sTvrDj6QZsEFnck5X9wyaerd38HQgE78wZ/jUfvnLDeneBUIPubAK+/MTapoQTa+EQ/e/
	 nQVMz5Qhqt9e9wzC3BnpWo7u0qe3G648Uc/8n9ffvUanIOsCeupCXaOs0P1cfMWD69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YnHNKa/p";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A2606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1A2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnHNKa/p
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso21180295e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396589; x=1795001389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WkB8fsr47aYLBpdq7IfPBM4C/nowCRinQnYQ8Fh6Bis=;
        b=YnHNKa/pEyTyiqLPh+m9vbZ/BgVvBuPeFZQt2L/LzjV1XAm8jASi3mSPzn++BYW6hK
         o4VyctWI7xw8aoJTfFW/2P8AzpZ2p6VUv1B7ybCdUzBW4QZK117P7aco50/f0yZXai9E
         SVGXfkK58Jm5NZddGOanhFe8LuK4PSplLk/XFXkNbs3ptA8YcY6WBHlVVptry2ytjPPh
         MVqI9LcE1xz2K69TH0dEIQy0G5f2PZVwrM9Vn1Sg+fOUaBmONIhytNrk4+/W5Qgde7yi
         tH8S6AAZ9atoDXyT/V7oFIlPjcyWMMibaIKFIQOvFkGgl63sQAMJ2k8EKMX032u6wpZm
         2f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396589; x=1795001389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WkB8fsr47aYLBpdq7IfPBM4C/nowCRinQnYQ8Fh6Bis=;
        b=Jktd+h7chjhWHhPqEXgcU5uAShAXHsbabLuySjjYpkt8J6ryevPdCStoitaNw80y50
         Bc4eaXpGZu6tzd0DYq4d1b6JsoelhXur+gMNZJjvAXQGCdiJz8VRYlWdEjflUhaL5G9n
         E3IiFoyiUzq4FVrDZklS9s2OuMVgUDXhXCJiBUAvvYTveYq5aBqj3xO2WKDhvAXQA1o/
         DlbE4l/fyx/8Uc60v2WIrockARoXuVzeGiF975KpkhAcY3gk0m5rDcdkaM1Liafk8gJz
         OM4bbOTLvBBEvJJBXgbVMU7PWp8E8PxH4t9v5v7MzBHffvGT/2PTbP1I9DwM3x7Gfz8p
         n4vg==
X-Forwarded-Encrypted: i=1; AL+hErGycamnN+/UedSL9LGLKrMmXnsaL0m3/eCN1V5Y7fMV2/kNUJsd/NznytBzbzzpZzX+rAu9t2kDjBwUKA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O8l7q+aX1e9ZJ2NYVHws8sTXVzXilX7gLc1ono8U9cr1eMtcm
	r5c2ddHtxajv0ZRiwgcWVcgsHOiyWF/uylJQRMazYqpIbsxqVEmoWl+M
X-Gm-Gg: AYBFou0Eh/Je+Hmv9ob1knHfMJtOQyMrdzqVO+s2pbelOXzYiI57RMjIOCoaSle2eZg
	S4SZI+rOgIqIwiPKbX1udWaxkNm6ZhvKr2/1jXhrUz2eB0FkSZ9ARTiOC3bm6Mmg/M82vhuVK20
	WpQZDwFVZNDGrf+MMzwtJ1GVVCOgihx7lQ46uRF8xpBtBkaOkw0fU5Fq4JdVnsaGArCgqzi1muq
	Nb0VOGiqUSE97UMITijbJ2lFAjnT8WQHwdUXp1cHKxdnJgRcqjk47I3O/nt7yTp00Jqeh60hb5w
	L2XKPTiGFFR80oxBF6vME3Uukbi0FQk/fjOs20n0ymT9iDJn4rSxsxN29Mp4IXvHHNIDo0IHg9o
	HmmW/80tB6PRscrHCfnhpm1userFrMlULDX2JZokQPVVftzbBaD0eJ7WGawiLXXbE2ifp8tlbrT
	XDCMjWpkFi668xuw42xtsq+j/I/ZcKZVpGpAVY3NA687S/wR93gfv9Tx2+wjoZtHiQQUNVcbyXf
	xzW3qzAYDtgPwM8mhX/QXfnby+vkniNkx2OTusrcAtTas18frCi7GIcDw5ijc0gtjsggMJV7Xaw
	01XWFsN/vV5dUdRVtvTUh3pDUjuuxdqGy6+w9pIEshBK9varTnl6LCwRyT1inb3xEua2+RE5K6E
	/eQ==
X-Received: by 2002:a05:600c:630c:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4ba0931ecd1mr39827525e9.1.1794396588804;
        Wed, 11 Nov 2026 03:29:48 -0800 (PST)
Received: from localhost.localdomain ([86.124.84.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm161247285e9.2.2026.11.11.03.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:29:48 -0800 (PST)
From: Radu Toader <radu.m.toader@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	tglx@kernel.org,
	tglx@linutronix.de,
	tj@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	frederic@kernel.org,
	anna-maria@linutronix.de,
	bigeasy@linutronix.de,
	joshdon@google.com,
	haoluo@google.com,
	brho@google.com,
	boqun@kernel.org,
	joelagnelf@nvidia.com,
	enlin.mu@linux.dev,
	brads@mainlining.org,
	kmehltretter@gmail.com,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] softirq: Treat an interrupted idle task as idle in tick_irq_exit()
Date: Wed, 11 Nov 2026 11:29:44 +0000
Message-ID: <20261111112944.3868822-1-radu.m.toader@gmail.com>
X-Mailer: git-send-email 2.43.0
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

tick_irq_exit() only runs tick_nohz_irq_exit() if sched_core_idle_cpu(),
which is idle_cpu() unless core scheduling is built in. idle_cpu() is
false when the run queue has tasks while the idle task runs.

That is the normal state of a CPU under sched_ext whose BPF scheduler
holds back a runnable task of that CPU in one of its queues, e.g. a task
of a cgroup at its CPU limit: the task stays queued on the CPU's run
queue and counts in rq->nr_running, while the CPU sits in the idle loop.

tick_nohz_irq_exit() is what marks an idle CPU as idle again for the
scheduler clock after an interrupt in the idle loop
(TS_FLAG_IDLE_ACTIVE, sched_clock_idle_sleep_event()). Without it, the
next exit from the idle loop doesn't resynchronize the CPU's sched_clock
with sched_clock_idle_wakeup_event(). With an unstable sched_clock, e.g.
under kvm-clock without a stable TSC, the clock of a CPU in tick-stopped
idle is clamped to its last stamp plus a tick, so a task picked after a
reschedule IPI (which doesn't go through irq_enter()) starts with a
stale exec_start, and the next tick charges the whole idle stretch to
it.

Measured with one thread spinning 10 ms in every 100 ms in a cgroup,
kept off its CPU for a further 7 to 53 ms per period by a sched_ext
scheduler: the cgroup's cpu.stat usage_usec over the thread's own
CLOCK_MONOTONIC measurement of its busy time reached 2.00, twice the
CPU time the thread could possibly have used, and is 0.96 with this
patch. The same ratio with no BPF scheduler loaded is 1.005.

Commit 548796e2e70b ("sched/core: introduce sched_core_idle_cpu()")
fixed this same gate for the other case of "the idle task runs while
nr_running > 0", forced idle under core scheduling, where the symptom
was too little idle time in /proc/stat. sched_ext made that state
reachable without CONFIG_SCHED_CORE, and there the symptom is idle time
charged to a task as runtime.

Ask whether the idle task is running, which covers both cases. CPUs
whose run queue is really empty are unaffected; a CPU interrupted
between leaving the idle loop and switching to a task has need_resched()
set or has already left the idle accounting, see tick_nohz_irq_exit().
sched_core_idle_cpu() has no users left and goes.

The two gates test different predicates rather than one containing the
other, and the difference is deliberate. idle_cpu() is idle_rq():
rq->curr == rq->idle && !rq->nr_running && !rq->ttwu_pending.
is_idle_task() tests PF_IDLE on current. Newly covered:

 - the two "the idle task runs while nr_running > 0" cases above;

 - a CPU idling with a wakeup queued by TTWU_QUEUE whose IPI has not
   run yet;

 - injected idle. play_idle_precise() sets PF_IDLE on a SCHED_FIFO
   kthread which then loops on do_idle(), so rq->curr is not rq->idle
   there and the old gate was false off nohz_full CPUs. Interrupts
   taken during injected idle now run tick_nohz_irq_exit() with
   TS_FLAG_INIDLE set. That CPU is running an idle state and needs the
   same latch for the same reason, so this is wanted rather than merely
   harmless, but note it reaches the idle injection users in
   drivers/powercap/idle_inject.c, intel_powerclamp and
   cpuidle_cooling, and is not confined to sched_ext.

One state is no longer covered: PF_IDLE is set by cpu_startup_entry()
and not by init_idle(), so a CPU on its idle task before that point
satisfied idle_cpu() but does not satisfy is_idle_task(current). Nothing
is lost, because TS_FLAG_INIDLE is only set inside do_idle(), so
tick_nohz_irq_exit() had nothing to do there, and nohz_full CPUs are
covered by tick_nohz_full_cpu(cpu) either way.

What keeps the new gate from giving a CPU idle accounting it should not
have is that tick_nohz_irq_exit() tests TS_FLAG_INIDLE itself and only
does the idle bookkeeping inside the idle loop.

Tooling: the bug was found and this patch and changelog were written by
Claude Opus 5 (Claude Code), in a session measuring cgroup CPU limit
enforcement under sched_ext. All of the patch and all of the changelog
are tool-generated. The measurements above were taken on hosts that no
longer exist and were not repeated for this posting. By the threat model
in Documentation/process/threat-model.rst this is a regular bug and not
a vulnerability: it misreports CPU time under a legitimate configuration
and crosses no privilege or isolation boundary.

Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
Link: https://lore.kernel.org/lkml/20261106094343.174905-2-radu.m.toader@gmail.com/
Signed-off-by: Radu Toader <radu.m.toader@gmail.com>
---
Changes in v3:
 - No code change; the diff is identical to v2.
 - Moved the posting notes out of the changelog and below this line, as
   asked in review of v2. The Link: tag still points at the reproducer.
 - The Tooling: line stays in the changelog above the --- line, because
   Documentation/process/generated-content.rst asks for tool use to be
   noted there.

The reproducer is a sched_ext scheduler that parks a tagged task on an
otherwise idle CPU for a set time. It was patch 1 of v1 and is dropped
from this posting at the maintainer's request; it remains in the list
archive, see the Link: tag above.

Compile-tested in four x86_64 defconfig variants - SCHED_CORE=y with
NO_HZ_FULL=y, SCHED_CORE=n, NO_HZ_COMMON=n, and SCHED_CLASS_EXT=y with
SCHED_CORE=y and NO_HZ_FULL=y - with no new warnings at W=1.

v1: https://lore.kernel.org/lkml/20261106094343.174905-1-radu.m.toader@gmail.com/
v2 and its CI run: https://patchwork.kernel.org/series/1206104/

 include/linux/sched.h   |  2 --
 kernel/sched/syscalls.c | 12 ------------
 kernel/softirq.c        | 12 ++++++++++--
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1c93da75226e..0e704ea9416f 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2326,11 +2326,9 @@ extern void sched_core_free(struct task_struct *tsk);
 extern void sched_core_fork(struct task_struct *p);
 extern int sched_core_share_pid(unsigned int cmd, pid_t pid, enum pid_type type,
 				unsigned long uaddr);
-extern int sched_core_idle_cpu(int cpu);
 #else
 static inline void sched_core_free(struct task_struct *tsk) { }
 static inline void sched_core_fork(struct task_struct *p) { }
-static inline int sched_core_idle_cpu(int cpu) { return idle_cpu(cpu); }
 #endif
 
 extern void sched_set_stop_task(int cpu, struct task_struct *stop);
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 45a127deeadd..22e316680a86 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -194,18 +194,6 @@ struct task_struct *idle_task(int cpu)
 	return cpu_rq(cpu)->idle;
 }
 
-#ifdef CONFIG_SCHED_CORE
-int sched_core_idle_cpu(int cpu)
-{
-	struct rq *rq = cpu_rq(cpu);
-
-	if (sched_core_enabled(rq) && rq->curr == rq->idle)
-		return 1;
-
-	return idle_cpu(cpu);
-}
-#endif /* CONFIG_SCHED_CORE */
-
 /**
  * find_process_by_pid - find a process with a matching PID value.
  * @pid: the pid in question.
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 7fc2200392cd..e7d649c29c0c 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -738,8 +738,16 @@ static inline void tick_irq_exit(void)
 #ifdef CONFIG_NO_HZ_COMMON
 	int cpu = smp_processor_id();
 
-	/* Make sure that timer wheel updates are propagated */
-	if ((sched_core_idle_cpu(cpu) && !need_resched()) || tick_nohz_full_cpu(cpu)) {
+	/*
+	 * Make sure that timer wheel updates are propagated. An interrupted
+	 * idle loop counts as idle even with runnable tasks queued on the
+	 * CPU: forced idle under core scheduling, and the tasks sched_ext
+	 * keeps on a CPU's run queue while its BPF scheduler holds them back.
+	 * idle_cpu() would skip the idle bookkeeping of tick_nohz_irq_exit()
+	 * for those, and with an unstable sched_clock the CPU's clock then
+	 * isn't resynchronized when it leaves the idle loop.
+	 */
+	if ((is_idle_task(current) && !need_resched()) || tick_nohz_full_cpu(cpu)) {
 		if (hardirq_count() == HARDIRQ_OFFSET)
 			tick_nohz_irq_exit();
 	}

base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
-- 
2.43.0


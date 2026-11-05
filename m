Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909031;
	b=CoWhk5Kg7SpZ9/3tAc3cxyRFSo57SVaSftsGbNkJyC0BpFp6bxzPUmmUECIKdK26/0sn
	 CKZ6IOjYnnrHBVvdcYcQEnNpqC4O86+EMM4liPzy7Q4hfPzg1ju5HP2GAbsi9HmlHuPxZ
	 f85D4YtNmAUl+JUfQxwm7O1oSy91Uqi9vEEWR6w3fkdcX3/6vJBLkveaWC755og+68aLm
	 OYgVZhhrXWNmhtka58ACmt2BJq8YO0vdVqaPXZPsqG8cah4I/7Mnt+8nwD7JIEyrojkJB
	 Vsl9yv9VmvoecNGgrN2JE9goOCnH7uUlnDBFeeAacycEoy5poOFgCzzH0HZ39kW6L8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KJNqYYH4eS7zhfJ38fc5jVlk3yATsfNyOP5G1+rP9mE=;
	b=JulAohG1E6lkFpZS3SyWweYuebbXRWbppWUi7Gu2HhvoSjG0OOvzuXdAIq5yBbSOg4tE
	 BVfSUioTVtqOL4tb8Mf0xqjwJ9U0VGJ6QbNRGYbiRtRd+WO8XpADHfXBc8SLvkNfwWigF
	 tBbFIY2UQP+kpLAA1jbiZOD/mt5r+3YxIhCiJX70bQcm6e7peAMlK92Lfe0pB/GroozDA
	 beA6awsz4LoHDfj3fF1RHJkVBwYDtLdtIu2Fj/deT86ehH7Fm/vJZrBi1eRgB7DqIewdE
	 om1Jha6ZLvsM58+S0HwtVRy4O67IWvSPQaZtwh9Zobl73QE5sqHVeMEf64aKe3ZfyQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0MPoP73;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16AE606D80A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16AE606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0MPoP73
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so24135235e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909029; x=1794513829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJNqYYH4eS7zhfJ38fc5jVlk3yATsfNyOP5G1+rP9mE=;
        b=U0MPoP73M4axjc3quWeKwzXefidC2bo8u4p3hHYuR5+e1szw+56Ss/8zUbw/pLd2XS
         RMTMg6FauS/7gWbL8k7Ge65xAnA39/GhxOI2jd7l0UXR/UWyficvd6ULojjTwon1MZg5
         0MRrdPfDul8rpZu7Fli+zmtfEC9trEmE0G3AztYumPBdJWsC4gsAwkRvNm/tjkzjF/Mh
         CjLAZSNYaQZWAMFnab62503Xxa0OOohSajpWu3C3I7CHqVAsYlc/53iRKLDAIZ5bT/1x
         Qg9paZAFurWOheapa1zbGhx5VLDFcgzFxNygickYsVJAgv9i1p3y2yl9C9NIfh5lmkRr
         gKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909029; x=1794513829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KJNqYYH4eS7zhfJ38fc5jVlk3yATsfNyOP5G1+rP9mE=;
        b=gdtWYSNyWgl6zmfMecF2Sidx8yP/IKzp3vI85lbvDptF4K6zTpCb69q0IU7Lgx243q
         IAk8oludFOfTDnGz0sdh1qMuobMBOhWhF7JoGaXFSaoE27pQ90Pui613VI6dfOz5W3L4
         drnjq6C2qVss7UCZV+JvqOJ1yExtMT+kTJJ5sDdVnakGMZeVvV3NI9+EAMxi1n453y6n
         1Uv/6CFfRgpsb4SjiHwaHSO9buniNnsXX8Lp6UiDo2Knav4LfFDepHeqf+sF/BnUcV/8
         9ARMGqeVuGKhutNqU8VU+VY2otW8ih5Yz6rNMxCfBZKeVnS9iWOyLXBniQLQpVRAlMt9
         xJVw==
X-Forwarded-Encrypted: i=1; AKwUvByqDt43j3u6O9DLyLszAueHNknCR9cG3dBurCDE9jn/7LdA0DUu4t1oTEJOP7/scQijzt3WSm30tbB825c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HGH3sPIw4/NS1R6vH+zkPTzAmFhLeSPrWdDx1sm/5XPLIVhkT
	zcq2ho5YHwvwSmyNjWCZmsBzonv+ysl2rA0w/glt4zKtZlAc/6vjjcM5
X-Gm-Gg: AYBFou3TE1zi9RsJbBhjMiB/BhxQlFUpLaFMQ19sql5sTWX1BtBwHlg2gzqIYS9C4TQ
	fmOL2artUDv3nO0GttzWXKJAWQPZxsfRu+YRxyhtBj+0Inq4Za5uoewrIo0gRrn//Kv2TE2XiiX
	4Tg8bsrDw7cFomd2aJBlbtsJmmJk+6pWjA70k2jkx1ME03LUGhNT1kufhYvKRBSMR6GZ2ekRBUO
	iMk+0eS51xEzOOqHLTK6nQbtLh514k6iAOabNAlHBlzSQkvg5RO1P/OulnOBgKdQEmS56t674po
	8vIj7DpLbFUNwcaKRyEvmxj8GDMovKI3B7snnVhGxg1fsTvyLGUkZg8uyNI1uJjYJvWP44cSAMY
	4iCZYB73Kh80A/gNPVIvDBAS+AxRNyxZR+BD0j1AWzecSCZcZ2lGOoHTrmA0nk91luYFi6dsY97
	iA2piCUdPoz8q7hmS0mJKqRSDo8cFhf64KRvnKkmju4WU1jN5xzJwR+zZpoN1xhTqIQ9eVlzDDC
	PaSYirKERLD8mZPWyH8czwkLHFe2iR8UXU0oJeACkK9a5UEajdjW5vdNwI0ntIB/o7/TQBfwxLL
	SJC6P/j3FcGxu/oUzjJjjpN9fcugUT8qxGNX268plYwJcVHyZV/beM6R+LMXEN/g1Jrk2QRutDW
	7+Q==
X-Received: by 2002:a05:600c:1d06:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4b6df02925bmr3479715e9.14.1793909029007;
        Thu, 05 Nov 2026 12:03:49 -0800 (PST)
Received: from localhost.localdomain ([86.124.84.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm88965055e9.13.2026.11.05.12.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:03:48 -0800 (PST)
From: Radu Toader <radu.m.toader@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	frederic@kernel.org,
	anna-maria@linutronix.de,
	tglx@kernel.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Radu Toader <radu.m.toader@gmail.com>
Subject: [PATCH 2/2] softirq: Treat an interrupted idle task as idle in tick_irq_exit()
Date: Thu,  5 Nov 2026 20:02:05 +0000
Message-ID: <20261105200205.1178097-3-radu.m.toader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105200205.1178097-1-radu.m.toader@gmail.com>
References: <20261105200205.1178097-1-radu.m.toader@gmail.com>
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
it. A cgroup holding one such task was charged twice the CPU time it
could possibly have used; numbers are in the cover letter.

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

The new gate is strictly wider than the old one, and deliberately so.
idle_cpu() is idle_rq(), rq->curr == rq->idle && !rq->nr_running &&
!rq->ttwu_pending, so besides the two cases above it also skipped a CPU
idling with a wakeup queued by TTWU_QUEUE whose IPI has not run yet.
That case is now covered too, on any kernel and not just under
sched_ext. It is the same latch failure for a shorter window, so
covering it looks right rather than merely harmless, but it was reached
by reading the code and not measured on its own. What keeps the wider
gate from giving a CPU idle accounting it should not have is that
tick_nohz_irq_exit() tests TS_FLAG_INIDLE itself and only does the idle
bookkeeping inside the idle loop.

Compile-tested in four x86_64 defconfig variants - SCHED_CORE=y with
NO_HZ_FULL=y, SCHED_CORE=n, NO_HZ_COMMON=n, and SCHED_CLASS_EXT=y with
SCHED_CORE=y and NO_HZ_FULL=y - with no new warnings at W=1.

Tooling: the bug was found and this patch and changelog were written by
Claude Opus 5 (Claude Code), in a session measuring cgroup CPU limit
enforcement under sched_ext. All of the patch and all of the changelog
are tool-generated; the cover letter says what was and was not measured.
By the threat model in Documentation/process/threat-model.rst this is a
regular bug and not a vulnerability: it misreports CPU time under a
legitimate configuration and crosses no privilege or isolation boundary.

Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
Signed-off-by: Radu Toader <radu.m.toader@gmail.com>
---
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
-- 
2.43.0


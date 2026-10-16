Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A55C44E65A;
	Fri, 16 Oct 2026 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137683; cv=none; b=eu3Vwq//4qIDcfTtISM81lgUZwyl57UIuFxtYXt4sDnedRxjXMtubA0XUl5m3b0w3BgAmsEfdU+rnLZlD9GRTjJ664yxe7FyQkuk5zUiCyk91FTd9L48oSZqLs8tGr/N+TvkdT3lR+Sl0SMqbYIG+bSP+nLdUfgPhGvWDjzlsbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137683; c=relaxed/simple;
	bh=hnWBS5KoFAI27WstoINVw8hlOGbi+4TSHLHOfwW2VLQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=E0p5d3TnyshbjRuBUajEv1bM+lkwlGdlT89rl4LDg8aSEhCUYuo9yzlw1vQf3o4Wc0j0dhsSJ9RUaAY7ACmjf+Dylz/NCFeZEsiTffNAiTDPwmL2RkcKXNdU4mvfGCndW3JsufQUGbDejYCviwMhzaL/KpcPVUyQPOcEG7A7gRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bVcHIaBz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qXrBwXEH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bVcHIaBz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qXrBwXEH"
Date: Fri, 16 Oct 2026 08:01:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792137679;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eh1BrxgwlG8e0VnfRwoLbJZBuQCpQvpH0JyD+G+V3DA=;
	b=bVcHIaBzKvI4wy3Q2Mno1xZp7J4Sn9SnBLezAuiFjagDJhOwja6hLAmVFOz5B9WmlEBm3j
	igfWkQG0UBTppgPhOxlKs3NYZTtGSNs9D5xeZM6st0ClgFkbp2bFmLpy6ZmCi7YFIuZAad
	7HYjmPz9X8Fmle6gLNTUcq3yZ61xHVSDaACbcU7M/dhWxhsTWpqOAKvWj8YQ6CnkuEWCwW
	ofjCHHzHg+pCv/RYOm7WEF3kPAOj5YSqTByky1NLMyakkdxHTtQm19TTOyt7DzrqGQlotc
	vKq1FL4OvCAxub0QYW5L81GZDLLxPnWNEmH0d/dIUmr6xjni6MbSkyhCBMrFkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792137679;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eh1BrxgwlG8e0VnfRwoLbJZBuQCpQvpH0JyD+G+V3DA=;
	b=qXrBwXEHaFn/g+721eq8BHMzntL+Z52SQYSIbgC+p5OyjZtp7Vk5pl77CkXhET/Is2f6e1
	EmSiJl5pYW+xohCQ==
From: "tip-bot2 for Stian Halseth" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/cputime: Don't account idle time twice after
 dyntick-idle
Cc: Stian Halseth <stian@itx.no>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261007142950.547604-1-stian@itx.no>
References: <20261007142950.547604-1-stian@itx.no>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179213767779.2666988.12449783777877801435.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     96a494c9cfd8f4bb7b1a7a70275426db71cf98aa
Gitweb:        https://git.kernel.org/tip/96a494c9cfd8f4bb7b1a7a70275426db71c=
f98aa
Author:        Stian Halseth <stian@itx.no>
AuthorDate:    Wed, 07 Oct 2026 16:29:50 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 16 Oct 2026 09:49:03 +02:00

sched/cputime: Don't account idle time twice after dyntick-idle

On idle exit the dyntick-idle accounting accounts the time up to now,
then the tick is restarted on its old period. The first tick accounts a
whole TICK_NSEC to whatever runs, although the part of that period
before the idle exit has just been accounted as idle time, or with
IRQ_TIME_ACCOUNTING as IRQ time. That is up to a full tick per idle
exit, and /proc/stat reports more idle time than wall time.

Record how much of the current tick period dyntick-idle has accounted,
and leave it out of the tick that ends the period.

Fixes: cf6444c3e1bb7 ("tick/sched: Unify idle cputime accounting")
Signed-off-by: Stian Halseth <stian@itx.no>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://lore.kernel.org/all/20261004142724.3896396-1-stian@itx.no/
Link: https://patch.msgid.link/20261007142950.547604-1-stian@itx.no
---
 include/linux/kernel_stat.h |  7 ++++--
 kernel/sched/cputime.c      | 39 ++++++++++++++++++++++++++++++------
 kernel/time/tick-sched.c    | 22 +++++++++++++++-----
 3 files changed, 55 insertions(+), 13 deletions(-)

diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index c1e8555..9f0f91d 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -40,6 +40,9 @@ struct kernel_cpustat {
 	seqcount_t	idle_sleeptime_seq;
 	u64		idle_entrytime;
 	u64		idle_stealtime[2];
+	u64		idle_dyntick_entry;
+	u64		idle_tick_period;
+	u64		idle_tick_overlap;
 #endif
 	u64		cpustat[NR_STATS];
 };
@@ -111,7 +114,7 @@ static inline unsigned long kstat_cpu_irqs_sum(unsigned i=
nt cpu)
 #ifdef CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE
=20
 static inline void kcpustat_dyntick_start(u64 now) { }
-static inline void kcpustat_dyntick_stop(u64 now) { }
+static inline void kcpustat_dyntick_stop(u64 now, u64 tick_start) { }
 static inline void kcpustat_irq_enter(u64 now) { }
 static inline void kcpustat_irq_exit(u64 now) { }
 static inline bool kcpustat_idle_dyntick(void) { return false; }
@@ -132,7 +135,7 @@ static inline u64 kcpustat_field_iowait(int cpu)
 #else /* !CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE */
=20
 extern void kcpustat_dyntick_start(u64 now);
-extern void kcpustat_dyntick_stop(u64 now);
+extern void kcpustat_dyntick_stop(u64 now, u64 tick_start);
 extern void kcpustat_irq_enter(u64 now);
 extern void kcpustat_irq_exit(u64 now);
 extern u64 kcpustat_field_idle(int cpu);
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index f16970c..19aa804 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -381,9 +381,9 @@ void thread_group_cputime(struct task_struct *tsk, struct=
 task_cputime *times)
  * softirq as those do not count in task exec_runtime any more.
  */
 static void irqtime_account_process_tick(struct task_struct *p, int user_tic=
k,
-					 int ticks)
+					 u64 cputime)
 {
-	u64 other, cputime =3D TICK_NSEC * ticks;
+	u64 other;
=20
 	/*
 	 * When returning from idle, many ticks can get accounted at
@@ -418,7 +418,7 @@ static void irqtime_account_process_tick(struct task_stru=
ct *p, int user_tick,
=20
 #else /* !CONFIG_IRQ_TIME_ACCOUNTING: */
 static inline void irqtime_account_process_tick(struct task_struct *p, int u=
ser_tick,
-						int nr_ticks) { }
+						u64 cputime) { }
 #endif /* !CONFIG_IRQ_TIME_ACCOUNTING */
=20
 #if defined(CONFIG_NO_HZ_COMMON) && !defined(CONFIG_HAVE_VIRT_CPU_ACCOUNTING=
_IDLE)
@@ -468,18 +468,38 @@ static void kcpustat_idle_start(struct kernel_cpustat *=
kc, u64 now)
 	write_seqcount_end(&kc->idle_sleeptime_seq);
 }
=20
-void kcpustat_dyntick_stop(u64 now)
+void kcpustat_dyntick_stop(u64 now, u64 tick_start)
 {
 	struct kernel_cpustat *kc =3D kcpustat_this_cpu;
=20
 	if (!vtime_generic_enabled_this_cpu()) {
 		WARN_ON_ONCE(!kc->idle_dyntick);
+		if (kc->idle_tick_period !=3D tick_start) {
+			kc->idle_tick_period =3D tick_start;
+			kc->idle_tick_overlap =3D 0;
+		}
+		tick_start =3D max(tick_start, kc->idle_dyntick_entry);
+		if (!WARN_ON_ONCE(now < tick_start))
+			kc->idle_tick_overlap +=3D now - tick_start;
 		kcpustat_idle_stop(kc, now);
 		kc->idle_dyntick =3D false;
 		vtime_dyntick_stop();
 	}
 }
=20
+/*
+ * The first tick after dyntick-idle covers a period that the dyntick-idle
+ * accounting may already have accounted in part.
+ */
+static inline u64 kcpustat_tick_overlap(void)
+{
+	struct kernel_cpustat *kc =3D kcpustat_this_cpu;
+	u64 overlap =3D kc->idle_tick_overlap;
+
+	kc->idle_tick_overlap =3D 0;
+	return overlap;
+}
+
 void kcpustat_dyntick_start(u64 now)
 {
 	struct kernel_cpustat *kc =3D kcpustat_this_cpu;
@@ -487,6 +507,7 @@ void kcpustat_dyntick_start(u64 now)
 	if (!vtime_generic_enabled_this_cpu()) {
 		vtime_dyntick_start();
 		kc->idle_dyntick =3D true;
+		kc->idle_dyntick_entry =3D now;
 		kcpustat_idle_start(kc, now);
 	}
 }
@@ -555,6 +576,11 @@ u64 kcpustat_field_iowait(int cpu)
 }
 EXPORT_SYMBOL_GPL(kcpustat_field_iowait);
 #else
+static inline u64 kcpustat_tick_overlap(void)
+{
+	return 0;
+}
+
 static u64 kcpustat_field_dyntick(int cpu, enum cpu_usage_stat idx,
 				  bool compute_delta, ktime_t now)
 {
@@ -695,12 +721,13 @@ void account_process_tick(struct task_struct *p, int us=
er_tick)
 	if (kcpustat_idle_dyntick())
 		return;
=20
+	cputime =3D TICK_NSEC - kcpustat_tick_overlap();
+
 	if (irqtime_enabled()) {
-		irqtime_account_process_tick(p, user_tick, 1);
+		irqtime_account_process_tick(p, user_tick, cputime);
 		return;
 	}
=20
-	cputime =3D TICK_NSEC;
 	steal =3D steal_account_process_time(ULONG_MAX);
=20
 	if (steal >=3D cputime)
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea3..4e293f8 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -763,12 +763,18 @@ static ktime_t tick_forward_now(ktime_t expires, ktime_=
t now)
 	return expires + TICK_NSEC;
 }
=20
+static void tick_nohz_forward_last_tick(struct tick_sched *ts, ktime_t now)
+{
+	if (now >=3D ts->last_tick)
+		ts->last_tick =3D tick_forward_now(ts->last_tick, now);
+}
+
 static void tick_nohz_restart(struct tick_sched *ts, ktime_t now)
 {
-	ktime_t expires =3D ts->last_tick;
+	ktime_t expires;
=20
-	if (now >=3D expires)
-		expires =3D tick_forward_now(expires, now);
+	tick_nohz_forward_last_tick(ts, now);
+	expires =3D ts->last_tick;
=20
 	if (tick_sched_flag_test(ts, TS_FLAG_HIGHRES)) {
 		hrtimer_start(&ts->sched_timer,	expires, HRTIMER_MODE_ABS_PINNED_HARD);
@@ -1329,6 +1335,12 @@ unsigned long tick_nohz_get_idle_calls_cpu(int cpu)
 	return ts->idle_calls;
 }
=20
+static void tick_nohz_dyntick_stop(struct tick_sched *ts, ktime_t now)
+{
+	tick_nohz_forward_last_tick(ts, now);
+	kcpustat_dyntick_stop(now, ts->last_tick - TICK_NSEC);
+}
+
 void tick_nohz_idle_restart_tick(void)
 {
 	struct tick_sched *ts =3D this_cpu_ptr(&tick_cpu_sched);
@@ -1341,7 +1353,7 @@ void tick_nohz_idle_restart_tick(void)
 		 * no tiny amount of idle time is accounted twice.
 		 */
 		ts->idle_entrytime =3D ktime_get();
-		kcpustat_dyntick_stop(ts->idle_entrytime);
+		tick_nohz_dyntick_stop(ts, ts->idle_entrytime);
 		tick_nohz_restart_sched_tick(ts, ts->idle_entrytime);
 	}
 }
@@ -1385,7 +1397,7 @@ void tick_nohz_idle_exit(void)
=20
 	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
 		now =3D ktime_get();
-		kcpustat_dyntick_stop(now);
+		tick_nohz_dyntick_stop(ts, now);
 		tick_nohz_idle_update_tick(ts, now);
 	}
=20

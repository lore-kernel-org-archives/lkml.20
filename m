Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981206;
	b=FrAwV1808PF1zGmWKqD6DStT6BJS32F9aGVttWJco3ojXVu87qYnxjc5l8AjJP+TGDw9
	 gJzaHFaGMWTC4K3bb0DQRdavG8Qjq5GPbgm+TKjS7NUVO4Ta63aofjfZ41Hlfa43nqasA
	 UmwimMlcIJpojPVlqMogExchFo3Fc57RoXFuYUjAyC+gokcTjOlrc9g9LefwnBqD6OqKZ
	 JPr0NI5GnSL19xz6W50LB9kiILKdpj7eCF6j/zWBOCRahE431c+ej3wo1u61IyeIGiCMo
	 NjgcTmfTYnjToggPEjqR0RccJ0BO2x6983kt7N4zJHYTiNnSiOTjMoZ+FAKVdMH0cig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=57nuym7s2qtOOdADVIaAMYxmVWYpn8xP2TXcEQ55Spk=;
	b=350wqBWco77x4t8eEMvTik5+6Y0LyQimwMcWI8tKTHuSpLBd/nvLWspnKFFqd7xbPhz5
	 91ycuPO7SpnwBrd1uOzoKfNs4J8YNhbamX2qAcoaA0DVTvLTQi0SDw1rgIklO/CHxI+30
	 kinaltbw8iv5kPO535XX/ijOb8JZpYr2272TS7VXhEXoM3sr4YrPFd/lUzWbUOlvmBpA1
	 8W7YNv2GUbCV4ATF24lvlao06AQA9F3pPRy+7NcBjXwfkO20PKyDhhpkN/YL85hkMPA2I
	 ETSSS3E7Vg656CyU+NbvIbRaNLJaAKgaIxUXON/H27I+JckolVYpURaKpaxl2NWPC4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UMXzSeHH;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81696606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81696606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UMXzSeHH
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490a0e72588so431602f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793981204; x=1794586004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57nuym7s2qtOOdADVIaAMYxmVWYpn8xP2TXcEQ55Spk=;
        b=UMXzSeHHtYAjwoZYd97iTuFoXMXgWNp5HvCTk1+WcP5MAIsA9nZ62+/sTDMamXb+34
         o1OsPQuknk8+QoCwBvkniSXGjZ62xAkSkDU4LdBeZFHlAbCJpBUE6+PPld4RGt3phDKN
         6iyhKgwlCSevbrdhcu+pPnhTGsRJmPEcTefoxPy31575UvzU+GSD8wJcHh3/1hGPDi7P
         /TqWFVnzpCQNntOureixQRUxXqYsChE/CdPYABeKED3dic7LQCkw+MOwsh8rYialR2z8
         ygfLb4VX+EdGV5cSQqHCKxizPASIHr9duPyf9r3YxbLuqdx4yTzZSdpPnGEw66diVlX2
         BTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981204; x=1794586004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57nuym7s2qtOOdADVIaAMYxmVWYpn8xP2TXcEQ55Spk=;
        b=FgwBbLmBG2TSBOyiIa2L1WgU8Z4FuQt22sU5GYTovqNxMqn3ViJsq6D9KZBGxTxK0x
         xT6as6bonC8G50ZkksvfdES/+6/hPyHLC7Ce3k3dV50V4AbIejxLnb0x+df45uk1zL5G
         Beg3DusebuZzxfnP866ChBytI23Fhtr54PStXIfkAL7aMKgsBkUj1XrLPmMc9m8YYvBT
         CNy3d8ycSx6MSP9zCErttEaYinskqsOdg0GjijsiVbd/cNrLAeUm6l7xyNqZzkAEHjFs
         o4nCzaNSVKDCUhVKzu5a3SESoa1No82mk7MhdylVA27tb6f4RdfQx5CUkc5tzuKuGlke
         NSqA==
X-Gm-Message-State: APuU4Z8z6Fk2A1H7uPPDCfrdnCx20ZcjtGIMYMK9JL+sOU5j/BMcVSwt
	QHQHHADmgZ/QSLFZy6ODcJpdczDdfrjHZgv1dkRdd4HXhZEzFYgZ2HtyfGcJ7WuZaCKZmcoCklF
	9oT5vJzk=
X-Gm-Gg: AYBFou3B3Wy/RhjT2YU6Ho9LOC5oVtV3cVfGGixL+J9GErrHR7eP5M9iQT/aSYqV7sY
	sdZECjPc5u3l4H4a9SWgibL6ZrAJqE2eoJ80BGH79QHWVj7nBm3oUO9r51YZEHhFRDJCmS27rDr
	n+HxpHH3pTvX35MZfv6paWjtHTusqLxiCryMqehghD2X7a4cNZAiN5Elm4+rd58zOipF9RTK8xq
	/kOTCHF3daBh50LrkO/OPxisfiLcywmQzrJLX/IWFKluJe32ejxwHb5mT4FSbEiyT1G/6yOI7d7
	2KpkIPKiGeBRxP2aWGtLJs7cm8mAgXzBgzLSGtclNBoj6NE1ekjNZyNwyLajfxWngpiXY43djIL
	PSFJoS8Cm4QcAAQtXadyqak/w4bBxSAuDCGbOfwQAt2NYCzjkvzhYGpMM/ewt1031DRTv5pcA5r
	XWZtHYUc6Yi5BWc0do9MPr+l5do37XHV5qEvdhekGLvM1zodOyNqOPV5Frd4DPFCH94rsXA3ykO
	Ppt8MJqiPWsdNPrbHpsH9w1L7y/tVkH/pfzn+TXwfMl3ux8kSxO7huFfE6vrYS8kHLJ3R1dqxqo
	eSZhbE24rWkv5Xhl1ks/fTeUusA0k3PNdC3/L6JrbIz49HFGIvnb
X-Received: by 2002:a05:600c:e546:b0:4b7:dc0:89c with SMTP id 5b1f17b1804b1-4b70dc00de4mr36538315e9.32.1793981203927;
        Fri, 06 Nov 2026 08:06:43 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm172665795e9.15.2026.11.06.08.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:06:43 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 1/3] tick/nohz: Re-evaluate the tick on polling idle and on user entry
Date: Fri,  6 Nov 2026 17:06:13 +0100
Message-ID: <20261106160621.347228-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106160621.347228-1-marco.crivellari@suse.com>
References: <20261106160621.347228-1-marco.crivellari@suse.com>
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

On nohz_full CPUs the tick is re-evaluated on IRQ exit and on idle exit.
There are three places where this is not enough:

- A kick handled while the CPU is in polling idle: in idle,
  tick_nohz_irq_exit() only does accounting and relies on the idle loop
  iterating again. HLT and MWAIT return on any IRQ, but cpu_idle_poll()
  only returns on TIF_NEED_RESCHED. The tick always runs in polling idle
  for now, but once the next patch stops it there, a timer enqueued from
  an interrupt on the polling CPU would not be programmed until something
  else wakes the CPU up.

  Set TIF_NEED_RESCHED on the idle task when the kick is handled in idle,
  so that cpu_idle_poll() returns and tick_nohz_idle_exit() re-evaluates
  the tick.

- The return to userspace: if the tick is left running in the kernel,
  for example because a tick dependency was cleared (tick_nohz_dep_clear*()
  don't kick the CPU) or a timer that kept it running was cancelled, it
  fires at least once in userspace before tick_nohz_irq_exit() stops it.

  Stop it from context tracking right before resuming userspace. When the
  tick is already stopped, the common case, this costs a few flag tests
  on each return to userspace.

- The expiry of a stopped tick in polling idle: a stopped tick is
  programmed for the next timer only, and reprogramming it for the
  following one is left to the idle loop, which doesn't run again while
  cpu_idle_poll() spins. Timers that were already queued would then wait
  for an unrelated wakeup.

  Set TIF_NEED_RESCHED in tick_nohz_handler() when the stopped tick
  fires in idle on a nohz_full CPU.

Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 include/linux/tick.h      |  8 ++++++++
 kernel/context_tracking.c |  9 +++++++++
 kernel/time/tick-sched.c  | 41 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/include/linux/tick.h b/include/linux/tick.h
index b121c5d53e30..8bfbb053f4fd 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -269,6 +269,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
 extern void tick_nohz_full_kick_cpu(int cpu);
 extern void __tick_nohz_task_switch(void);
 extern void __init tick_nohz_full_setup(cpumask_var_t cpumask);
+extern void __tick_nohz_user_enter(void);
 #else
 static inline bool tick_nohz_full_enabled(void) { return false; }
 static inline bool tick_nohz_full_cpu(int cpu) { return false; }
@@ -294,6 +295,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
 static inline void tick_nohz_full_kick_cpu(int cpu) { }
 static inline void __tick_nohz_task_switch(void) { }
 static inline void tick_nohz_full_setup(cpumask_var_t cpumask) { }
+static inline void __tick_nohz_user_enter(void) { }
 #endif
 
 static inline void tick_nohz_task_switch(void)
@@ -302,6 +304,12 @@ static inline void tick_nohz_task_switch(void)
 		__tick_nohz_task_switch();
 }
 
+static inline void tick_nohz_user_enter(void)
+{
+	if (tick_nohz_full_enabled())
+		__tick_nohz_user_enter();
+}
+
 static inline void tick_nohz_user_enter_prepare(void)
 {
 	if (tick_nohz_full_cpu(smp_processor_id()))
diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index a743e7ffa6c0..d4274698d6f3 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -24,6 +24,7 @@
 #include <linux/export.h>
 #include <linux/kprobes.h>
 #include <trace/events/rcu.h>
+#include <linux/tick.h>
 
 
 DEFINE_PER_CPU(struct context_tracking, context_tracking) = {
@@ -466,10 +467,18 @@ void noinstr __ct_user_enter(enum ctx_state state)
 			 */
 			if (state == CT_STATE_USER) {
 				instrumentation_begin();
+				/*
+				 * On nohz_full CPUs the tick may have been left running in the
+				 * kernel, e.g. kept by a tick dependency that is now gone.
+				 * Stop it now rather than let it interrupt userspace once
+				 * more before the next IRQ exit notices.
+				 */
+				tick_nohz_user_enter();
 				trace_user_enter(0);
 				vtime_user_enter(current);
 				instrumentation_end();
 			}
+
 			/*
 			 * Other than generic entry implementation, we may be past the last
 			 * rescheduling opportunity in the entry code. Trigger a self IPI
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c6d86e4da8a9..a9f622fdeb12 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -323,8 +323,17 @@ static enum hrtimer_restart tick_nohz_handler(struct hrtimer *timer)
 	 * - to the idle task if in dynticks-idle
 	 * - to IRQ exit if in full-dynticks.
 	 */
-	if (unlikely(tick_sched_flag_test(ts, TS_FLAG_STOPPED)))
+	if (unlikely(tick_sched_flag_test(ts, TS_FLAG_STOPPED))) {
+		/*
+		 * In polling idle on nohz_full the idle loop doesn't iterate on
+		 * interrupts, so it would never reprogram the tick for the next
+		 * timer. Make cpu_idle_poll() return.
+		 */
+		if (tick_sched_flag_test(ts, TS_FLAG_INIDLE) &&
+		    tick_nohz_full_cpu(smp_processor_id()))
+			set_tsk_need_resched(current);
 		return HRTIMER_NORESTART;
+	}
 
 	hrtimer_forward(timer, now, TICK_NSEC);
 
@@ -414,6 +423,12 @@ static void nohz_full_kick_func(struct irq_work *work)
 		if (WARN_ON_ONCE(tick_sched_flag_test(ts, TS_FLAG_INIDLE)))
 			return;
 		tick_nohz_full_update_tick(ts);
+	} else if (tick_sched_flag_test(ts, TS_FLAG_INIDLE)) {
+		/*
+		 * In idle, tick_nohz_irq_exit() doesn't re-evaluate the tick, and
+		 * cpu_idle_poll() only returns on need_resched().
+		 */
+		set_tsk_need_resched(current);
 	}
 }
 
@@ -1071,6 +1086,30 @@ static void tick_nohz_full_update_tick(struct tick_sched *ts)
 	__tick_nohz_full_update_tick(ts, ktime_get());
 }
 
+#ifdef CONFIG_NO_HZ_FULL
+void __tick_nohz_user_enter(void)
+{
+	struct tick_sched *ts;
+	int cpu;
+
+	lockdep_assert_irqs_disabled();
+
+	cpu = smp_processor_id();
+	if (!tick_nohz_full_cpu(cpu))
+		return;
+
+	ts = this_cpu_ptr(&tick_cpu_sched);
+	if (!tick_sched_flag_test(ts, TS_FLAG_NOHZ))
+		return;
+
+	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED))
+		return;
+
+	if (can_stop_full_tick(cpu, ts))
+		tick_nohz_full_stop_tick(ts, cpu);
+}
+#endif
+
 /*
  * A pending softirq outside an IRQ (or softirq disabled section) context
  * should be waiting for ksoftirqd to handle it. Therefore we shouldn't
-- 
2.56.0


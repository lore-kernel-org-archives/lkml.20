Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397469;
	b=q3usg3UpG43R5qMU4w4rTvj+2SDh/IKKiiHbmx4Nt49M58/k/8z+5zEhPxo8+zPJ+GqC
	 +u/fgWxGftBJQVa3Jm/qKyTsymehg37J6ci0N73PQvBPrxnkZRYxH3q8aKOx9YzTW0oCs
	 UpIlmFcvnXQG3hYIt5cCTg4syk22Iz2WU/SABUCed8Sk+gZ40lOhrD/anQ68wlV+meNdb
	 OGe2B7iDSadLeBH93HDJ2ko0vg+DMsswJzXVHfmQY27XBbWKIVQszxBBXCX5yW/zKRv/f
	 H60Up6+tw4IFfLHe7IKvbGtBuNi2Pd4/40j2gsikKJVjH1uWuOaieUZ9QahEsfLk75Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L/Cu/Hw1kZ5Nl4sxRkc7yP4t7/DM66itNzu28I9bi7Q=;
	b=rOHUw7BAsVWmvkE40Xz+wTl/TKB/v7I7IiXZ06dEx06a3dwM9SbbLCyfq4ooplA3IByK
	 fxf/GZObdnPKZCGV9zLLEsyqkzxBKSKAn4MUNjmlb2WXZpuLai5isJt65FGuF2WzJbuoC
	 n/meBXH3NcKi5RG/LmKpRz+te2Fy4c5ND6dGzLKrCVkKTgRYBlbbeDZGFcDzUfsonOMdZ
	 MERju5waDd4/iw+IiebV8EqYsJ7PVf0IhnkCFpykxazu72/m22iBC7T7kNQPwBYT16pD+
	 pk6DuLee1QF51sDnwi7LAKao33E93/t2pVoqEzfTd5kdti8jzRc+5j1lS/unoCfd9sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gbg7x6Nk;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5711606A886
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5711606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gbg7x6Nk
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so18295495e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794397467; x=1795002267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/Cu/Hw1kZ5Nl4sxRkc7yP4t7/DM66itNzu28I9bi7Q=;
        b=gbg7x6NkA8OF4tBPhWmXk++PwThrpGk+R3CsZQnXMKS7kPV+i2DYzdZ0CCyfBftiSB
         ETi9THgLbFzzIaRm5hIDh4Mw+unHyS6A6fCGbPnTLDzK1ACaa1mdnd0cAjTJX4jPX2MA
         brK0VKXOsHcwyvnjNMsvCYbjSR4xL7LSyQDWfSNLWcLvlvWbMNt+lFGbYwEGYkM4YpGD
         FasFeHV99QyH4tCPpW7aVxhZOE1q88S8lgmu47WLvluDNZPI61TLbBtfyCT+2sXcrW8D
         9BhV7lXROoK61rsP25iIg7t41Q5N18JhPA3arN6vOzVow5iOlt9qvikeQ0pH6uvriIwX
         FiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397467; x=1795002267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/Cu/Hw1kZ5Nl4sxRkc7yP4t7/DM66itNzu28I9bi7Q=;
        b=m0plUTkXKXwefLKGsxx9Z9MksXAp0iN30P8Hb345bPJeHXSww7mguU7SdHRieengDG
         bygIbnZ/oKU8fzKFDnBZeGKHt7wLh2ycEW3JiFbj+rvOcEacmgPwc0VFs4xOmcrI+MZW
         8RoNvXXeJxT4I78F/yJRLBb6Uq7mX2KgqT0cY5lclracf3bS9L6zG/1OIvvTnuaeo3Oa
         eXFIYgcrmmsK9GXSibYtwopWQ3lJb3eC2TrADbBaWW4mbP5u+WHOUulNJ3gq8pw6nsdW
         jS6n7cUlENYsdb5ypwR649XjYbV5TiMlzrVS0fy3P1ZYpq3cOemayoC0ewSIX1zOFudo
         l/FA==
X-Gm-Message-State: APuU4Z/qVmV3AbC1Du0MEXlvmbFKzEMgsJELp51ZbtRHFysQU187yqwk
	Dv0hUUlxteApyZGyORjoDK1qhqRtnMT/x9sEqVQJ/IqWv0UCd4U0WV6Eb0J+QAuJQKPsAVvs5ev
	r7buLJEY=
X-Gm-Gg: AYBFou15Txj4Qg2eGUDm9TcVaAL/OoS+o+j52UTzDUfMVjgnGiMC9sEXzILlJ4/i+yK
	AL7AzdP3BziFvwwL2u6RQ7YlDq30RQco3J6TSpIaSJYT1sEM5/mpHESMM8cyOzkgusif0hSy8At
	0STyasqLRWYgfb8QrSpxWGJN0WCNXg/fg6AvbiNhy4rl3avlcKmgZXwxKevCPvFN3hKlfGNC0Wd
	ywjd316sc/Vjwhp21VzMviZ0wZaQYk0mBnUopP4dT+Opoh+9bsomuUmbG1KXjbjLSJAdmZyt73Z
	To/N/Xu1a6XrvBFM+EANlAIzpzYkU1hZUTk2LkWrrB5hoNK0G38ZLgxnFOaOFpc4U79HB2nrRAn
	Uccv0Iuy6YAZMrc0y1DqEK/Qg7wnbkK8m+nw0mdVJ8bSKLziLwnfm/qRTAjShgp0u24Gy6z2cz8
	HpzN08NOqz424XN20n+7ZspCOf4iiGOG3dpin7ROzjk4z1bwMwuZ+/ql+f2GvigN/DbwzhFVB4R
	6cL1JkhOlVOeIKsmwW22j7YyNvyBW3aKSBK9PmC2Tfst9cxzoStHJ8mC2VXVbcQkp4R3PaY26r5
	tyGrWEtcsPhURf2/b/d30YobuBcvnqqn/bxg337hn4neKupzm0s=
X-Received: by 2002:a05:600c:468c:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4ba093c305bmr39355775e9.24.1794397466900;
        Wed, 11 Nov 2026 03:44:26 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm43238545e9.1.2026.11.11.03.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:44:26 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 2/4] sched/idle: Don't handle polling idle as dynticks idle
Date: Wed, 11 Nov 2026 12:43:48 +0100
Message-ID: <20261111114406.346953-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111114406.346953-1-marco.crivellari@suse.com>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
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

TS_FLAG_INIDLE tells nohz whether the tick is managed by the idle loop or
on IRQ exit. With idle=poll it is set while polling, but cpu_idle_poll()
doesn't run the idle loop again on interrupts: a nohz_full kick or the
expiry of a stopped tick isn't re-evaluated until something sets
TIF_NEED_RESCHED. The tick is therefore restarted before polling, and on
nohz_full CPUs it then keeps running after the wake-up and interrupts
userspace.

Enter dynticks idle only on the cpuidle path, from cpuidle_idle_call(),
and leave it before cpu_idle_poll(). While polling, the tick is then
managed on IRQ exit as for a running task: on nohz_full CPUs it stays
stopped if possible, and nothing is left to do on wake-up, so the task
doesn't pay for a tick stop after waking up. On other CPUs, leaving
dynticks idle restarts the tick as before.

tick_nohz_idle_enter() may now be called on each idle loop iteration and
always runs with interrupts disabled; tick_nohz_idle_exit() may be called
outside dynticks idle and with interrupts disabled.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Link: https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/
Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 kernel/sched/idle.c      | 13 +++++++++++--
 kernel/time/tick-sched.c | 27 ++++++++++++++++-----------
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index e0c10a5dbda2..e0e3c06da528 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -193,6 +193,8 @@ static void cpuidle_idle_call(bool stop_tick)
 		return;
 	}
 
+	tick_nohz_idle_enter();
+
 	if (cpuidle_not_available(drv, dev)) {
 		idle_call_stop_or_retain_tick(stop_tick);
 
@@ -303,7 +305,6 @@ static void do_idle(void)
 	 */
 
 	__current_set_polling();
-	tick_nohz_idle_enter();
 
 	while (!need_resched()) {
 
@@ -349,7 +350,15 @@ static void do_idle(void)
 		 * idle as we know that the IPI is going to arrive right away.
 		 */
 		if (cpu_idle_force_poll || tick_check_broadcast_expired()) {
-			tick_nohz_idle_restart_tick();
+			/*
+			 * Polling idle is not dynticks idle: leave it before
+			 * polling so that the tick is managed on IRQ exit as for
+			 * a running task. On nohz_full CPUs it stays stopped and
+			 * nothing is left to do on wake-up that would delay the
+			 * task. On other CPUs, leaving dynticks idle restarts it
+			 * as before.
+			 */
+			tick_nohz_idle_exit();
 			cpu_idle_poll();
 		} else {
 			cpuidle_idle_call(got_tick);
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 645dba919386..0b798dc39511 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1227,23 +1227,22 @@ static void tick_nohz_clock_wakeup(struct tick_sched *ts)
 /**
  * tick_nohz_idle_enter - prepare for entering idle on the current CPU
  *
- * Called when we start the idle loop.
+ * Called with IRQs disabled on each idle loop iteration that enters
+ * cpuidle. Only the first call enters dynticks idle.
  */
 void tick_nohz_idle_enter(void)
 {
-	struct tick_sched *ts;
+	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
 
-	lockdep_assert_irqs_enabled();
+	lockdep_assert_irqs_disabled();
 
-	local_irq_disable();
+	if (tick_sched_flag_test(ts, TS_FLAG_INIDLE))
+		return;
 
-	ts = this_cpu_ptr(&tick_cpu_sched);
 	WARN_ON_ONCE(ts->timer_expires_base);
 	tick_sched_flag_set(ts, TS_FLAG_INIDLE);
 	ts->idle_entrytime = ktime_get();
 	tick_nohz_clock_sleep(ts);
-
-	local_irq_enable();
 }
 
 /**
@@ -1415,15 +1414,21 @@ static void tick_nohz_idle_update_tick(struct tick_sched *ts, ktime_t now)
  *        as long as possible.
  *   2.2) If the tick has dependencies, restart the tick.
  *
+ * Also called before polling idle, which is not dynticks idle: it may
+ * therefore be called outside dynticks idle, with or without IRQs
+ * disabled.
  */
 void tick_nohz_idle_exit(void)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
+	unsigned long flags;
 	ktime_t now;
 
-	local_irq_disable();
+	local_irq_save(flags);
+
+	if (!tick_sched_flag_test(ts, TS_FLAG_INIDLE))
+		goto out;
 
-	WARN_ON_ONCE(!tick_sched_flag_test(ts, TS_FLAG_INIDLE));
 	WARN_ON_ONCE(ts->timer_expires_base);
 
 	tick_sched_flag_clear(ts, TS_FLAG_INIDLE);
@@ -1434,8 +1439,8 @@ void tick_nohz_idle_exit(void)
 		tick_nohz_dyntick_stop(ts, now);
 		tick_nohz_idle_update_tick(ts, now);
 	}
-
-	local_irq_enable();
+out:
+	local_irq_restore(flags);
 }
 
 /*
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501508;
	b=3x80HSzKC82zI+O0EAcKpnYs54yMOnfUaDYn2B0j+PsBYIoMZFYXoxdIYxpRMyq+K3eq
	 OZp595infVvGpMl/1Fneuqp3oaXKroej1mwXrOGcBZGQDMZwaocdJ7xmmrMfZbhGaReSD
	 D+Jk814MlWBN1P28LzSQNk+PAlKITpZziHZjeJLTG9sL4bA0YNo9Upn6wxOBaBMKjN7Yb
	 LlV40+aZ7N/GfBJiSQTis71H0cLaUM+jpJK8bkCv7f2NgnEv6goq2HnH97sVArCHyRygR
	 CJPu7SEij668UWPhOZieJNLZgMqC06fhQc7bpDhck6BnvIbDp8DzTSKw7tGYuSuRgtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bluMhG8KixmV7BcQplW0BKp2owQ6pWrz4COAjVpeJtc=;
	b=OOCZlZ9Y7WXkmcAAOa7xstR9OXEk7RyFOQibl+r8k/lvYt2WoanSUamBXxqghB8Nr1Bt
	 reaZgO8XSEwfsDkpG1P1o4nSsAfvXHzvjasv5hVzhwEeURWYTcEatZ262CdONPQq4Zf70
	 iVWm9VRQ72dBc2FZivCr+VcP127DnGIw7HR70PFE0BmpaQTv03GR2yJngNd8nVEFgTASW
	 jx0cR/QLuXKm3ygB1XdnxSXgzaSlL1DD1NgfDlwcVQ4w7Zeb6MqIkrfWILFVRug0erZ/8
	 8TEw0IHc3Tz2gbHZz4VXgryXX+m6hRdwoUA1Jl/1Jj4lfFkJiopjF0BLOJ4KB/RYxWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gJ3HtdkR;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D3606A8B5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95D3606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gJ3HtdkR
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491aaed7565so2683978f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794501506; x=1795106306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bluMhG8KixmV7BcQplW0BKp2owQ6pWrz4COAjVpeJtc=;
        b=gJ3HtdkRuW9tpy3p2C8vHRLN8EP+3idltkqiF+SY1y6YwHpER+60NxPtmdlokZ1fiO
         zhEDjiPanC9Q4/qKCjv0f+N26t9FzGkddIy/SjQrbLoQQAd4Ju3Mn275IKtiqPoR4SBm
         zUq3UHl+eTL2gK+QE9Jeb+jPW53ObuC0V7QZCbbI5in5QU1VwOKd+m4J+MjTq980dAE6
         FN157LSgJ2FyRF4vT9dOYiU457eDVrxEHQnjNYR36b429hSU1qS4mukUQYDIJ/tQFCNU
         hF9BgNPO+EDsCcOR1yGvkM5NK5RAX8WVk+v9ExUYoN0D7B8lFcE6ZFQI7Qx20T9LwtgQ
         8toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501506; x=1795106306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bluMhG8KixmV7BcQplW0BKp2owQ6pWrz4COAjVpeJtc=;
        b=xXf5w1v2oTFdaUKOujHzK2dnmtDAdr3FkMNEx2zNSgIT27z34d+FIO/6RRx6fTyrsU
         fFFcLjO6E8J1jHqaD4KF+11Rgi2OaBFAt1o9V8uXx6jG3P1X/1OCBR2k4CQ9HvMLpjPL
         iYap2+dhnItCF1Cy9Zw7pxOe4KOujm0/D4FDTUdo5+F6Wqhda8e5PTfOzj+y5DU7xZkZ
         u4W8CbFZwFV8xr6qtUrqzA20Sqh+gmExXf41vAeqhMdfLXx74Seon0gEOrOdqneMouun
         4coIfKwqFzU+JWj4f/PYW64+S0cw+Y/jB3cyTWGE/27yKmj3/z27Rs6JVNhWids1FBV0
         5RHw==
X-Gm-Message-State: APuU4Z/91KRM4c5NY+lvMniKu6WyZ0dn7PZY5lF9Imk0tixkD1vrIt3P
	wOPMnQZfJI3Xvp3BY+UDilbA1vU8MXHEbxSZUptg3cLJglkJOHz7e2KBHeV1sKBs3b247qAad31
	nneCx53o=
X-Gm-Gg: AYBFou0+4m6Ke2jcb54yi51whGzSht6mmENGGaK3ki29nqAv6S0KkMmpT0y+VCn+PGU
	uhZaEOfzEwnEdcT38L0dsRX+ib1FJT70DDDAbNhF23JPiLhvnISEgKWtYEf9GGaekWwXu7cFX/t
	oxOKHkZqPGh/puTBfiDnu8UW+L4brt7APWqFmX9JzT8nuFHlvTvwRD5fNTokuk4ct9c/r6pknFI
	x/7kxNINbhjx0u52VYwXXNe/5/N6AzbK8JmCL0+gG+7YMODMl52FWyJfyRir0VipFw69FTAdAU7
	EZxVJBi/M7Cf5xR+tqKq6Kyoe5pTW5uoATLiWjAVo8t2rC03FLadnx4T/fqlEt6RLO6rCjoez3r
	P98g5Pdr0GZ7vSdAYA/cwuDRqdL0fMyk3ui9U08Icmfq4/zmou6aXyrfh5HbxRKok6Vodq4cgZe
	VHfASfpCb6EcSrEcrEwNWZYH2W+gFMFESw09yb99fFr7fOp8f8UTFgVHErWyUqqKB1896XGUGsC
	xRr+cF7x4y6zDLt/rmURx6TyAwRXcqTXzlMXi+TysizdvNWDRIO2Crip1SLTK2pCd3119AfX/ha
	Xd0pkqjO0snHY9OWXqIDENsxviVjXhQge4jFOmBDMree
X-Received: by 2002:a05:6000:186b:b0:494:6f49:246d with SMTP id ffacd0b85a97d-499c7b1b09amr12123880f8f.24.1794501505993;
        Thu, 12 Nov 2026 08:38:25 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm226827f8f.8.2026.11.12.08.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:38:25 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v3 2/5] sched/idle: Don't handle polling idle as dynticks idle
Date: Thu, 12 Nov 2026 17:38:10 +0100
Message-ID: <20261112163813.524336-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112163813.524336-1-marco.crivellari@suse.com>
References: <20261112163813.524336-1-marco.crivellari@suse.com>
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

Link: https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/
Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/idle.c      | 13 +++++++++++--
 kernel/time/tick-sched.c | 24 +++++++++++++-----------
 2 files changed, 24 insertions(+), 13 deletions(-)

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
index edaac8e7c669..cb3117453eaa 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1225,23 +1225,22 @@ static void tick_nohz_clock_wakeup(struct tick_sched *ts)
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
@@ -1413,15 +1412,20 @@ static void tick_nohz_idle_update_tick(struct tick_sched *ts, ktime_t now)
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
 	ktime_t now;
 
-	local_irq_disable();
+	guard(irqsave)();
+
+	if (!tick_sched_flag_test(ts, TS_FLAG_INIDLE))
+		return;
 
-	WARN_ON_ONCE(!tick_sched_flag_test(ts, TS_FLAG_INIDLE));
 	WARN_ON_ONCE(ts->timer_expires_base);
 
 	tick_sched_flag_clear(ts, TS_FLAG_INIDLE);
@@ -1432,8 +1436,6 @@ void tick_nohz_idle_exit(void)
 		tick_nohz_dyntick_stop(ts, now);
 		tick_nohz_idle_update_tick(ts, now);
 	}
-
-	local_irq_enable();
 }
 
 /*
-- 
2.56.0


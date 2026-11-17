Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919802;
	b=xUK6b8nU8yXlaFN5jxtn23ULLtP39ZONodxZeVnmRgCv81Ultq0OYbtQkijBQkKDvAar
	 jyl00e+lKLPveL/uMDGVNuWiJpWxifS9wbmZmKkq6b5Tx7ZG+h5y3dyb5o02IvtekCUN6
	 JfN0EM8VOQo3iA5a0/oX4XAKI/JHbt+YSDzB2aacCpTSLc5IyFWTSooF1oggFs+QL9VWi
	 W7pY/MPXzJcEfIWa//uelXhbkWyfOszfLbhxB51IjWMzieRNVSi2TrSG7diiujb0HQiSx
	 NH5a3uVLnS5ghyPbPWm97R6FpP15XMntkqsYecZxPAd6ZKPHQJ1xqp5EYGoXpy27HHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Mime-Version:
	 Message-ID:Date:Subject:From:To:Cc:Content-Type;
	bh=NJV7zhwXy6hjC1eXchzd9rCqRJ3feOn6dwGJeSBjHnY=;
	b=aopGZgTC7PMCYSgxhKQb82oj+PknCFGDjVxrxUCuI+kXs7/tCJUcrQ6tLuNuEru33R8T
	 zqZpx8srs6NpfKS/P75NDwTNITsoPFpJuE9XiCT+a1K2HE0T7skZ0bKoyrW2Jsdtl9cww
	 dsRqn5nO7J6kafbVyCTFYi3jgKeuBdJSgq1Cnu1HQKIUCdQWURpzfCGlhMHVw8uemuw0y
	 Qaou+4qFsh3PzZ1uBF2/3ZkpG0GHlhkYR6elzf6F4umb2uBRWOY4oWPl4U4KbJCGYUjzY
	 QTtL8wt0bMKAvCEQ28j2myoYJDLweENIJef0rIKB9P6WtuMXPTbnZjVFe7J45vdGHgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Sgw1Ibtm;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36569606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36569606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Sgw1Ibtm
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso3425954c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794919801; x=1795524601; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJV7zhwXy6hjC1eXchzd9rCqRJ3feOn6dwGJeSBjHnY=;
        b=Sgw1IbtmvFVAWznOVKi3pAWVJ+3mHBQQxDyEkp6zB42qHn8OQBTwE3EqhDMRJfJJeG
         y/6zu/dHdrrQYq9p4XIjpz0cZ+S0CrnAr7EAAkD5bNRnRgGyCIpUAB20ipvgyyTSwt3N
         GDYWZ7cg2X9nQFshDYo2j+a/LfGZtz6yubbRliAC93cD8i6BQyZ3FVRO8vDnUaRwvzOv
         AqlSUFubqo74qYxuERQsEddN0wqMVfqFJIXA8BWBEZj1Kcb3zNthxHOMsFFHywtXLP/A
         BXtAhlOX+nc6x01Fv/lgn4fBD9tKkf07U3efcCuxXCfosZ6P3ljJyTyyUbKEJvpvRLOx
         9L9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919801; x=1795524601;
        h=content-type:cc:to:from:subject:date:message-id:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJV7zhwXy6hjC1eXchzd9rCqRJ3feOn6dwGJeSBjHnY=;
        b=YD1sHpIWCDqyf7uMY0GDOjbrOArQL0DaHIapB326bMzO7ejWg6ykAZ+/lZStJsl6dw
         ZwZQhN94y5rki6tPPGavmxxkvmAKSkOvxpbbVxzD8KVJwcJun442qJRqmd0VJZW0yl3h
         voFFPWPr7LiKwRtRaMEoMxcDIl3e5Cug2nExE2R9WF+KRSu2Y5qNB05t2yHyRXCq3mRR
         KoqQg9cqSmVkLeQw9nznQXk1lfCO5ZXBxWeEpSK/37VrezKWpjVllRdlf9obBMJJD5nk
         NdGtZj54VI/ApiZPpUDKnwUeROBDzZ1DZSIglGC3Cfm5uftiV+VmSnZ4SElksYnOd7iC
         a6+g==
X-Forwarded-Encrypted: i=1; AL+hErF7ZKvPdULEaDh+HyZ9c42v4I6Hw9XnTxUGZrgTfvzJ6Fu5YUPOxyEOBVu+6jGF4wIxgb4Hb1pGzVeUj1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zLML20jmUrrKk/F0IOWrsoliaX9sPT/FHtjCY5ulI/dmSAFbV
	0Tz5++eHqodbjI1HxaC3XJBZARH9k2XGgx/QZ0tI2JFnuqbf/QjymgLSWP5pEvQkB4WHZYLz118
	j+oosPQaHyxixjUgaoTzJz6uR0pvB7w==
X-Received: from dlak20.prod.google.com ([2002:a05:701b:2914:b0:19a:1425:bb9c])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3a87:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b503068f8cmr13938678c88.1.1794919800995;
 Tue, 17 Nov 2026 04:50:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-ID: <18e8d60c92652608.3137322e32332e3235332e313736.371783.0000sendgmr@google.com>
Date: Tue, 17 Nov 2026 12:50:01 +0000
Subject: [PATCH v2] sched/pelt: Skip redundant decay and divisions when
 sched_avg is zero
From: Chris Wiseman <chriswiseman@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Qais Yousef <qyousef@google.com>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit d040e0734fb3 ("schied/fair: Skip calculating @contrib without
load") skipped __accumulate_pelt_segments() inside accumulate_sum() when
load is zero, noting that ___update_load_sum() is called with load == 0
45x more often than with non-zero load.

However, when load is zero and sa->load_sum, sa->runnable_sum, and
sa->util_sum have already decayed to zero, accumulate_sum() still
executes decay_load(0, periods) three times whenever a 1024us PELT
period boundary is crossed, and ___update_load_avg() still executes
three divisions of zero (0 / divider).

In addition, update_irq_load_avg(rq, 0) unconditionally invokes
cap_scale() twice and a second ___update_load_sum(rq->clock,
&rq->avg_irq, 1, 1, 1) call even when running == 0. Because the first
___update_load_sum() call already advanced last_update_time to
rq->clock & ~1023ULL, the second call sees delta < 1024 and always
returns 0 after redundant clock and capacity scaling arithmetic.

In accumulate_sum(), when !load and !(sa->load_sum | sa->runnable_sum |
sa->util_sum), update sa->period_contrib and return periods before
Step 1. In ___update_load_avg(), set *_avg to 0 instead of dividing when
the corresponding *_sum is 0. In update_irq_load_avg(), skip the
capacity scaling and second ___update_load_sum() call when !running.

Evaluating update_other_load_avgs() over 1,000,000 randomized steps
confirms bit-for-bit identical sched_avg state and return values across
all fields, while 20,000,000-iteration microbenchmarks on x86_64 and
arm64 show:

  Regime (1ms blocked-avg updates)      Base (cyc)  Patched (cyc)   Delta
  ------------------------------------  ----------  -------------  ------
  x86_64 Idle RT/DL/HW/IRQ                   78.53          32.82  -58.2%
  x86_64 100% active RT+DL+HW+IRQ           116.01         117.63   +1.4%
  arm64  Idle RT/DL/HW/IRQ                   77.78          37.91  -51.3%
  arm64  100% active RT+DL+HW+IRQ           120.40         113.52   -5.7%

Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
Changes in v2:
- Move the zero-sum fast path into accumulate_sum() before Step 1 and
  still return periods (Vincent Guittot).
- Avoid dividing in ___update_load_avg() when *_sum is 0, dropping the
  sa->load_avg check and the kernel/sched/fair.c change (Vincent Guittot).
- Add arm64 cycle measurements alongside x86_64.
- v1: https://lore.kernel.org/r/18e837a02ddbadb6.3137322e32332e3235332e313736.1b3220.0000sendgmr@google.com

 kernel/sched/pelt.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 779eb58a4261..7308fb28b0fa 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -109,6 +109,11 @@ accumulate_sum(u64 delta, struct sched_avg *sa,
 	delta += sa->period_contrib;
 	periods = delta / 1024; /* A period is 1024us (~1ms) */
 
+	if (!load && !(sa->load_sum | sa->runnable_sum | sa->util_sum)) {
+		sa->period_contrib = delta % 1024;
+		return periods;
+	}
+
 	/*
 	 * Step 1: decay old *_sum if we crossed period boundaries.
 	 */
@@ -262,9 +267,11 @@ ___update_load_avg(struct sched_avg *sa, unsigned long load)
 	/*
 	 * Step 2: update *_avg.
 	 */
-	sa->load_avg = div_u64(load * sa->load_sum, divider);
-	sa->runnable_avg = div_u64(sa->runnable_sum, divider);
-	WRITE_ONCE(sa->util_avg, sa->util_sum / divider);
+	sa->load_avg = sa->load_sum ? div_u64(load * sa->load_sum, divider) : 0;
+	sa->runnable_avg = sa->runnable_sum ?
+				div_u64(sa->runnable_sum, divider) : 0;
+	WRITE_ONCE(sa->util_avg,
+		   sa->util_sum ? sa->util_sum / divider : 0);
 }
 
 /*
@@ -437,8 +444,10 @@ int update_irq_load_avg(struct rq *rq, u64 running)
 	 * clock_task. Instead we directly scale the running time to
 	 * reflect the real amount of computation
 	 */
-	running = cap_scale(running, arch_scale_freq_capacity(cpu_of(rq)));
-	running = cap_scale(running, arch_scale_cpu_capacity(cpu_of(rq)));
+	if (running) {
+		running = cap_scale(running, arch_scale_freq_capacity(cpu_of(rq)));
+		running = cap_scale(running, arch_scale_cpu_capacity(cpu_of(rq)));
+	}
 
 	/*
 	 * We know the time that has been used by interrupt since last update
@@ -455,10 +464,12 @@ int update_irq_load_avg(struct rq *rq, u64 running)
 				0,
 				0,
 				0);
-	ret += ___update_load_sum(rq->clock, &rq->avg_irq,
-				1,
-				1,
-				1);
+	if (running) {
+		ret += ___update_load_sum(rq->clock, &rq->avg_irq,
+					1,
+					1,
+					1);
+	}
 
 	if (ret) {
 		___update_load_avg(&rq->avg_irq, 1);
-- 
2.47.0

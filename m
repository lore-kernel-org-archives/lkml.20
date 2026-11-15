Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745614;
	b=VJUtpT1+RkpkeHAX5S0NagyqMwDaT1Ki2yE+X/7PHRLKXbliM/k/D3As5UP2qSDHrw7B
	 2CAYNYLXRLhirC8aUY3ibBr2SqV+xd7ibVPBRBU4mM3xtFKC/hfPxXg8qVZlGouJCiPKM
	 oZiM8jqH+BZ1XiGJe//iaeIq0KAY+KteRly8lliIjXNC0tHDgNP2BPrPSjNORwQqGEmr6
	 xsR8vUAoMJiKqvvj7Wy6zj2CgHEoO+pDXgIVrZ/6AlpHFWK14Ln81XBcT1RBbLfhvkcXq
	 dbOKEZu0dTMQP47Pbp+jpptSlV9lVD/Gxi14nAm5dVGVWy1IiMMJ0t2UdzSD/2+GV4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:Date:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=v3tRCO+T6yH239JtCPScAIb2R7inVO9f6F3uBtqXpus=;
	b=ZowebVXYohUxRPsRSn3XZakbnB6S+fi2O5krJe3Bs25SwcY/JRUbUahQRfLv5CfpkbtY
	 jR4JjluyNH2eVm85z+DVKEeE55EsBBipbwR++wgdTboXAfmCGxGoeGsC8WfunxXhDx6ml
	 f9Dq/5cwE84zOm1wHqcrUUmUG897WehtpRsaCX9bSQVZDGq6q4cY28jmKEVREJhOHBU4Z
	 TFtGJgoDu/lYSCpxc5CV/K41l3rubm2POnXSfsgtBLv1pLHXu7EsijS2yKA9zOQD92der
	 y8hfQ2Brg1pCNfsV0SX3NJ2iMWZZ/TydVEd8r5N5RxeG98zlrJFmqyBLs7NUBlGUoTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="cb/pT3pt";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D511E606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D511E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cb/pT3pt
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so2994732eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794745613; x=1795350413; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:date:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3tRCO+T6yH239JtCPScAIb2R7inVO9f6F3uBtqXpus=;
        b=cb/pT3ptJht0aPuXK0g2XKaj13NxO3SUsOioiewxXUyFd+Sj4UXUSiFaGjWUVuchu2
         9MXHGRkluO3tglky4j32DWYk1gydT6qMdsN2kQ7YOuhJNjA0SGGhI8HQhRXDJP9X0n4v
         Z4DUug7zcmpeG0jMB2tQQ5b+TiEQY0vDzlf4rcICW5GHtXFh7y7TqMd7HYG7j7CED/GM
         74dRdMI/itGGGf0rlLkf5E6fRgf2a7rFm5ogwPaHwWZ7lGNPFx5xcH9Bw8vg5uXVEIio
         ohPAlD3DvYhW9uSYRnW4JfflItaqW33KplsbTdLt2osMwAUSTbFyY7onE/uuwLYa56+e
         NrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745613; x=1795350413;
        h=content-type:cc:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3tRCO+T6yH239JtCPScAIb2R7inVO9f6F3uBtqXpus=;
        b=vI/BZuPCn6MPynby5tC2dPPYKjICH1/tYHNQAbQ+WTgcyvNpPRDsqFWcwJ56iO9FLy
         pO05N/6gqx0oD6zab6GNqZvnXBFyAth3LRAszyZaqveokozBGkK5ZSKKphV9U8+Yag/v
         fWktLQWo9SBuf2BzTwY/hXrDeez+Hh2opUKXLmqRETudr0GgsiSU7yy+siiK8kHXvZWW
         9E66RHYR8kmWm+Lw0W0+6ek7BOfJ51nWf9/aec4M2fh9ojHhdUCalw7Sm3WP1UdCXL2h
         J7aNYkzMl4mhc3mfIlGiLdtfXH/kQzvkBNx3Z4Vgd2Qfn2rDAZ/5tDM5AiH1eO7L2zSn
         WWbA==
X-Forwarded-Encrypted: i=1; AL+hErHMJQ8t8Xr/uIbm0hcb1IhUgJ2h+F/0N9nJqjQKNsvELRNq+kxXx6B+JhOSdSS/o+lMuhX+qOSvGgp+hIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tGde+slmXXM+cRt8u0CaND20fRp0NJ8xDEoYCrPbWQaplqtq7
	Zd6D9VCa/oRopA5e3JfkjvTO5EU2bq+jE98BULI2sLZnxVLJF7xKqmIVuqeEaHPdcDIL7Kj44W9
	GPxriXpg3z30z8bjjjbS5dVT+TG50Qg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dlec2-n1.prod.google.com ([2002:a05:701b:4282:10b0:1a7:2bf1:46cc])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:418c:10b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b5030fc737mr7854539c88.18.1794745612616;
 Sun, 15 Nov 2026 04:26:52 -0800 (PST)
Date: Sun, 15 Nov 2026 12:26:51 GMT
Message-ID: <18e837a02ddbadb6.3137322e32332e3235332e313736.1b3220.0000sendgmr@google.com>
Subject: [PATCH] sched/pelt: Skip redundant decay and divisions when sched_avg
 is zero
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

However, when load is zero and sa->load_sum, sa->runnable_sum,
sa->util_sum, and sa->load_avg have already decayed to zero,
accumulate_sum() still executes decay_load(0, periods) three times and
returns periods > 0 whenever a 1024us PELT period boundary is crossed.
Consequently, ___update_load_sum() returns 1 and the caller invokes
___update_load_avg(), performing three divisions of zero (0 / divider)
and reporting a false decay to callers such as
__sched_balance_update_blocked_averages() -> cpufreq_update_util()
(wired up in commit bef69dd87828 ("sched/cpufreq: Move the
cfs_rq_util_change() call to cpufreq_update_util()")).

In addition, update_irq_load_avg(rq, 0) unconditionally invokes a second
___update_load_sum(rq->clock, &rq->avg_irq, 1, 1, 1) call even when
running == 0. Because the first ___update_load_sum() call already
advanced last_update_time to rq->clock & ~1023ULL, the second call sees
delta < 1024 and always returns 0 after redundant clock and capacity
scaling arithmetic.

When !load and unlikely(!(sa->load_sum | sa->runnable_sum |
sa->util_sum | sa->load_avg)), update sa->period_contrib and return 0
directly from ___update_load_sum(), while still flushing any pending
rate-limited cfs_rq->tg_load_avg_contrib in __update_blocked_fair().
In update_irq_load_avg(), skip the capacity scaling and second
___update_load_sum() call when !running.

Evaluating update_other_load_avgs() over 1,000,000 randomized steps
confirms bit-for-bit identical sched_avg state across all fields, while
10,000,000-iteration microbenchmarks on x86_64 show:

  Regime (1ms blocked-avg updates)      Base (cyc)  Patched (cyc)   Delta
  ------------------------------------  ----------  -------------  ------
  Idle RT/DL/HW/IRQ                          72.53          18.33  -74.7%
  100% active RT+DL+HW+IRQ (worst)           99.21          99.68   +0.5%

Spurious decay returns from update_other_load_avgs() when RT, DL, HW,
and IRQ averages are already zero drop from 100% of 1ms updates to 0.

Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
 kernel/sched/fair.c |  2 ++
 kernel/sched/pelt.c | 28 +++++++++++++++++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f77e722..83d3928 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11538,6 +11538,8 @@ static bool __update_blocked_fair(struct rq *rq, bool *done)
 
 			if (cfs_rq == &rq->cfs)
 				decayed = true;
+		} else if (cfs_rq->tg_load_avg_contrib) {
+			update_tg_load_avg(cfs_rq);
 		}
 
 		/* Propagate pending load changes to the parent, if any: */
diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 779eb58..935b8a4 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -214,8 +214,18 @@ ___update_load_sum(u64 now, struct sched_avg *sa,
 	 *
 	 * Also see the comment in accumulate_sum().
 	 */
-	if (!load)
+	if (!load) {
+		/*
+		 * Skip decay and divisions when sums are already zero; check
+		 * load_avg for newly forked tasks (init_entity_runnable_average).
+		 */
+		if (unlikely(!(sa->load_sum | sa->runnable_sum | sa->util_sum |
+			       sa->load_avg))) {
+			sa->period_contrib = (delta + sa->period_contrib) % 1024;
+			return 0;
+		}
 		runnable = running = 0;
+	}
 
 	/*
 	 * Now we know we crossed measurement unit boundaries. The *_avg
@@ -437,8 +447,10 @@ int update_irq_load_avg(struct rq *rq, u64 running)
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
@@ -455,10 +467,12 @@ int update_irq_load_avg(struct rq *rq, u64 running)
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
2.52.0.rc1

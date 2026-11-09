Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242195;
	b=mhZzbfzNzFCDrIqquE6OpwMYl/58p5o2ccsnit+Zy+wsmASoKEpuOmSJGKTte+wE2ZFs
	 CahPgbTtmYD7d2T2TBK4t8Y0I625HG2tYTj/TqhT0Fqtz38wF4XZkSVG0xAb0GRgjq4SE
	 KcQPUJcxem3zPegJRhXTWaUSU4xM9uQ0hIbN6FBthMeLL9nq0uCFrus7594RvUVfqYaYv
	 +IF4Cqon/DwnmK8KNCGtOUHQQrQe+mF9uI77iw3adak4Hu/E5mLNq2xmYvwFAmD3kIOT6
	 zl/VihxfbidKdhkZ4O1E5clddzwVbU1JhatDdIQbi5kqv2jStv2/EV4g7Xmo6wlYBEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IF9cXrQnpCZaMLl6tbZ/qIT+Y3H9j+DMc+Ad29JxSyU=;
	b=ysrawcn6NWhbdnzBhSMHNAQkM5n8HZ35QgSqBOGPlL8NCgI0dq5NAXz0muGXdUeo464J
	 17KQCaEXJzezhiv4Tql50t4mV8IRt8FvKicZDVV/fiuGXdhHZNGliD4gB17lJLx7Au/hX
	 vlkyyfaT8NWKCP5QHEvgW8TvT89jKwnnuViTQMaabT8Il0Djrpw/isGQTogrWgtFrdjPx
	 772Ec4JFatJrFDlC/d0aZGeRHSkXR3Th4Mtwd7n87ETKY7eUi0XxbU2W99+h/yZcHX6T5
	 M8c+bXTyeEluPBfsESJOUwDn4u05omId7R3svPex1oqKPAupkE8WQcYmM9YV1WwCThw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtuD168J;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF560A260C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FF560A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtuD168J
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so8133865e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242194; x=1794846994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IF9cXrQnpCZaMLl6tbZ/qIT+Y3H9j+DMc+Ad29JxSyU=;
        b=RtuD168Jkqr9RnhP3VMpSCTS57mW0ngLJEssT/lggiAeqhJ1TGtnCYEy98hldAzYg1
         +HIQKkkGGlz1rmBIMRVy4eRHzwJBC1uDy0Kecaqd5VtjjexTUe3TMA9mpLsRbMfJGm2g
         dXmUgEBKOQWFuqB0O3CZkjf8zYBYIUqgcKdMvseGuUGPpSe+xZPgb5JYfcTOUiOi6ZK9
         PF15UToNpsB7tLnNMRAer876U08Po1RtHBWhuv0NRjHC/onAiN8JR8DM382W3evZ+atb
         nMByC4W/LckRhCYxZjhjwyes0ZjZZyzC4YpqbsHTFye+awZwS8suUJzhGpJpAZsWilyo
         lGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242194; x=1794846994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IF9cXrQnpCZaMLl6tbZ/qIT+Y3H9j+DMc+Ad29JxSyU=;
        b=uhyqze1vOFbTxz1mNy5pv7KvxYQczCht9U9D1EsmSl5JVL3h0X01xqQl+N7Ur3iN8D
         ZxdWzg1M+XbPvBxPB/9pDXQ35j96m8v4XfNB0iUb1STHbgJCFj20N0bIMD7JPNdlgQEf
         GusITSrFxBcqg5O5PNNt94EeoG2GQau2PzvU7Id8VvLTR/ph7tCqrSbTIzlfigLgUNr/
         S5jqox2/Fy9YxHP57Hp40c6ZYmAvQtxXUw/aV5y9MglQng1DhzgC9r9H0UvPTLiXLmyw
         3pJonFS+2hTrZY3S49OdaApxqxTKxdJJZzD61wPybeClhpySEojv8awidKGskx+4wSYe
         uPIg==
X-Forwarded-Encrypted: i=1; AL+hErFjMKGUT+fHLFa6pt5va61e6yzbEJBZuFvv/5LrfWHi4nbaNIzorxxPZYeljJ7SgGXXdopts7Ak2NF5zbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L22AICWXnjgB0Wf+T9DV0PqoixbXMcF9z+rfMlKN7YodMeNC5
	hRS8kLB9fFGlDED4baSf48RAiWofdNULNgvVxJNUlZ9+dQ51/SiB5dhL
X-Gm-Gg: AYBFou2vDwUqQxppVArc6A4R36qc6pFPy93LLip/PjTgqn6JZDvD+XtZUYFIvwPnZL2
	798c7HUCYafgUWD9nMclPE6k2GbELXKq8coSXQ+0iOe8SckmmoWO+CEdEM9e8+aS0NK2mNQnvM+
	IO2TaQ9HHwNUzbq7qunb02jINl5Ej8zdGWich7Zx6k5/IFCLb83R3/pSzkt7E8eJk6hVCx7pNMy
	JSL89biIQSDrisfekagGS3813QysfYdrQCi6f8VEe3mH/NYb1Yz/pOy2IbRKymt/Y7dJonbBSZq
	0OWPTaB7SLzMMSClnVMt71EMQsvziJTKBfHYJGRwy91YPLokrGzS5KKbj2LgbqI6kBvG1Zs8V02
	AXN2aP7q8qtmr4eTVgG/y/5OQkLHiuWgAC+lbMN3cCYVLnC3g++u9aDuk7rqQXmhkOeELo6tZZz
	S6uDOYdlxuxoTKzwLha/1V2vpxx60/3qPC9Wj4I/uGuCD5olF++hgf7KPra6YL/lplBvKVkyWph
	lLwtR2IoPtSluDk4ByF22UuHsqgmt9ysERooEVM//4+Jd59aeTsFDSPXDbXYmRYt5FYQz1L9XAG
	/gM8agnPZrChD5ZZ5D4K1Aye1w==
X-Received: by 2002:a05:600c:524d:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4b960d9c550mr90005315e9.8.1794242193648;
        Mon, 09 Nov 2026 08:36:33 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:32 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH v7 07/29] sched/rt: Remove unnecessary runqueue pointer in struct rt_rq
Date: Mon,  9 Nov 2026 17:35:53 +0100
Message-ID: <20261109163616.195264-8-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109163616.195264-1-yurand2000@gmail.com>
References: <20261109163616.195264-1-yurand2000@gmail.com>
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

Remove the rq field in struct rt_rq.
  The rq field now is just caching the pointer to the global runqueue of the
  given rt_rq, so it is unnecessary as the global runqueue can be retrieved
  in other ways.

Introduce global_rq_of_rt_rq to retrieve the global runqueue which serves a
rt_rq's dl_server.
Rework rq_of_rt_rq to retrieve the runqueue a rt_rq is serving.

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/rt.c    | 21 +++++++++------------
 kernel/sched/sched.h | 16 ++++++++++++----
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 6b819adcab4a..16eb027d4bdd 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -101,10 +101,7 @@ void init_tg_rt_entry(struct task_group *tg, struct rt_rq *rt_rq,
 		struct sched_rt_entity *rt_se, int cpu,
 		struct sched_rt_entity *parent)
 {
-	struct rq *rq = cpu_rq(cpu);
-
 	rt_rq->highest_prio.curr = MAX_RT_PRIO-1;
-	rt_rq->rq = rq;
 	rt_rq->tg = tg;

 	tg->rt_rq[cpu] = rt_rq;
@@ -184,7 +181,7 @@ static void pull_rt_task(struct rq *);

 static inline void rt_queue_push_tasks(struct rt_rq *rt_rq)
 {
-	struct rq *rq = container_of_const(rt_rq, struct rq, rt);
+	struct rq *rq = global_rq_of_rt_rq(rt_rq);

 	if (!has_pushable_tasks(rt_rq))
 		return;
@@ -194,7 +191,7 @@ static inline void rt_queue_push_tasks(struct rt_rq *rt_rq)

 static inline void rt_queue_pull_task(struct rt_rq *rt_rq)
 {
-	struct rq *rq = container_of_const(rt_rq, struct rq, rt);
+	struct rq *rq = global_rq_of_rt_rq(rt_rq);

 	queue_balance_callback(rq, &per_cpu(rt_pull_head, rq->cpu), pull_rt_task);
 }
@@ -222,7 +219,7 @@ static void enqueue_pushable_task(struct rt_rq *rt_rq, struct task_struct *p)
 		rt_rq->highest_prio.next = p->prio;

 	if (!rt_rq->overloaded) {
-		rt_set_overload(rq_of_rt_rq(rt_rq));
+		rt_set_overload(global_rq_of_rt_rq(rt_rq));
 		rt_rq->overloaded = 1;
 	}
 }
@@ -240,7 +237,7 @@ static void dequeue_pushable_task(struct rt_rq *rt_rq, struct task_struct *p)
 		rt_rq->highest_prio.next = MAX_RT_PRIO-1;

 		if (rt_rq->overloaded) {
-			rt_clear_overload(rq_of_rt_rq(rt_rq));
+			rt_clear_overload(global_rq_of_rt_rq(rt_rq));
 			rt_rq->overloaded = 0;
 		}
 	}
@@ -495,7 +492,7 @@ update_stats_wait_start_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se)
 	if (!stats)
 		return;

-	__update_stats_wait_start(rq_of_rt_rq(rt_rq), p, stats);
+	__update_stats_wait_start(global_rq_of_rt_rq(rt_rq), p, stats);
 }

 static inline void
@@ -512,7 +509,7 @@ update_stats_enqueue_sleeper_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_
 	if (!stats)
 		return;

-	__update_stats_enqueue_sleeper(rq_of_rt_rq(rt_rq), p, stats);
+	__update_stats_enqueue_sleeper(global_rq_of_rt_rq(rt_rq), p, stats);
 }

 static inline void
@@ -540,7 +537,7 @@ update_stats_wait_end_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se)
 	if (!stats)
 		return;

-	__update_stats_wait_end(rq_of_rt_rq(rt_rq), p, stats);
+	__update_stats_wait_end(global_rq_of_rt_rq(rt_rq), p, stats);
 }

 static inline void
@@ -564,11 +561,11 @@ update_stats_dequeue_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se,
 		state = READ_ONCE(p->__state);
 		if (state & TASK_INTERRUPTIBLE)
 			__schedstat_set(p->stats.sleep_start,
-					rq_clock(rq_of_rt_rq(rt_rq)));
+					rq_clock(global_rq_of_rt_rq(rt_rq)));

 		if (state & TASK_UNINTERRUPTIBLE)
 			__schedstat_set(p->stats.block_start,
-					rq_clock(rq_of_rt_rq(rt_rq)));
+					rq_clock(global_rq_of_rt_rq(rt_rq)));
 	}
 }

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 13eebde95ec0..27cb594cdfe9 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -902,8 +902,6 @@ struct rt_rq {
 	raw_spinlock_t		rt_runtime_lock;

 	unsigned int		rt_nr_boosted;
-
-	struct rq		*rq; /* this is always top-level rq, cache? */
 #endif
 #ifdef CONFIG_CGROUP_SCHED
 	struct task_group	*tg; /* this tg has "this" rt_rq on given CPU for runnable entities */
@@ -3500,9 +3498,14 @@ static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)

 static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
 {
-	/* Cannot fold with non-CONFIG_RT_GROUP_SCHED version, layout */
 	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
-	return rt_rq->rq;
+	return container_of_const(rt_rq, struct rq, rt);
+}
+
+static inline struct rq *global_rq_of_rt_rq(struct rt_rq *rt_rq)
+{
+	/* Cannot fold with non-CONFIG_RT_GROUP_SCHED version, layout */
+	return cpu_rq(rq_of_rt_rq(rt_rq)->cpu);
 }

 static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
@@ -3521,6 +3524,11 @@ static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
 	return container_of(rt_rq, struct rq, rt);
 }

+static inline struct rq *global_rq_of_rt_rq(struct rt_rq *rt_rq)
+{
+	return container_of_const(rt_rq, struct rq, rt);
+}
+
 static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
 {
 	struct rq *rq = task_rq(rt_task_of(rt_se));
--
2.56.0


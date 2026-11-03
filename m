Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667610;
	b=m2wLtFCQtHxB4jTnf4uSrXN98Qj60Fdlb5DV8fXZMxb5LdrkCghJbIQUlfd7rAJ8wDrU
	 a+6R9/GXAsDIYhdg6myneedfsfsSDe1DsNZZZOj9tRgxuLBrC/zcFvBUCQz0LC5zphZVQ
	 vIuZ3EI7kNB8afrmAdEbrpGTsm38imDGeqW9z/FAJR1TPxsDyfDr/KaXmbZ5ZgPE+BLdz
	 RemwIFMlpGNkQOxD7TaNlQwkwx5yBkCyr6/cnLtM3lAqA/7/cJEek3EKyHD+aUsan+fjD
	 IU4WCVrUlQnwgd0Qy2x8C6yGDsvEd6RaanSV6CBqMF2UXE4qelvJAilW027V4mABCZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wJ1S47F4nhVA038Xum/+a5T5G3fRAloi8j1wxPx6vUQ=;
	b=nrMFNoywdrN/Nohm8K+XT/7lC8Z4dwZXp7urQ7Wzxjrl3Q0CS/LYG8g8QSdrLzSa2vp/
	 5X5qdCOPOnVtHEUaiyJv1wHNE4BDfIxkv/fdY/QMnufvhSwSfXWUiaduqm1ku2RDMK5y7
	 wpnU8Rbgv0DszfxDjaXn9E+jXCxw2m3ElLba7BqqGe6Pv/YFtHscU6vHzBfhqRfHggApr
	 XyfkbjxiyOFZUqYf2hUPLGgZq1wUTgpQ7UP1zZlwZh646CIme9TS9rHpzWTgOiVPEQhRz
	 tlxQ7TaoSGAb/sAHKO7w9GHAdbjcfSdP+Ltg1E/iJuCThRxTC9h0D+G2QUf2RLicQnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lciJXU6o;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBFA606EE84
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DBFA606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lciJXU6o
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3436795f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793667608; x=1794272408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJ1S47F4nhVA038Xum/+a5T5G3fRAloi8j1wxPx6vUQ=;
        b=lciJXU6opR8zL9olgDjgRySAqHMJYloLPWcY04kUsXESlYCp6EXKOM4+5NmVFgGP9K
         nbLaQWm/pH2DjkaNLtZBgTRkSEdjSAz+TV1dDtJpnU1+Agnc+Y4UF5IwIJm2rHdls581
         gf0VD9qzJmow+OTxN7/OGmzjHpLSWvpr3KezVXYkA3RuuC7/qbf2Nrk71qL9brTrGD5v
         VQ/goUBYBgf2jAgQRofxh1MLOoJR/9culyHU/PNmzaKgzKerikWA/IGhPffOuneYq4F+
         FIFVtdvge63uh6Gs/8ht1sNToIVFIIEvxH1Ub0uwpuIQBrrLxskCMQrZiynrbdzvGBkN
         Sesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667608; x=1794272408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJ1S47F4nhVA038Xum/+a5T5G3fRAloi8j1wxPx6vUQ=;
        b=I5RXjXe32l469/amPA3KvhBd0rfSAzm8bdOrsu7z52usbacUgPKop78hBUG2B2/79L
         CSojEIlszu1fGwPiGJcZR496m8+ydBzSnD3P9mZZpqi8rwKWgnRsCnomQ2hThXnKXPm6
         hdK81mkE5UN0VDNC4HwP0lJgwRqyOySt/R2sYVjmhgxM1JB44C3xJTD1MtgAgvTqDX8s
         95lhXbIXQyvB9nHU0RnKWuoshQaU6185fxTBXRFmvYuk4PgiwLDewqE/6rV2zxXhX/tg
         cabUGw1y5iKqU2uIf1LPQYnN+TKQbTGdMH3yHBKSzwnfcKhRPuLPDiOroSq+enFmZrc2
         vkKg==
X-Forwarded-Encrypted: i=1; AKwUvBwH96zu5DtFG7uPf98sKEaz1XVQ89ukb9A3cgnWMUMCsqlHY4yDf+tNUYvjm+k1mQr2Yq7+WkLsJCRbU5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iJd1UI0aOsNVMMBrk3sMgXRzND4QpJnrj1bPaemaV72m/eHgc
	SziBH8EQA/EIAS8BiVB119DjJ3Y6h//rbW8CjPFHV0nPuoysETX3yGtPl7cNsq4q5GR1EdsBTJA
	Pd/TUOAc=
X-Gm-Gg: AYBFou32i+D5Vz7e5BF04+3j8RZFNd9ib3v04gV/xp/WjLyT/AXYkUicVrNGZ+7kwTS
	PFWtYYDaDVUoz5ueloSA3GRTtf1o61PYSv6RBCBdKqEj8lXYm2R3T5j/WQPetLMBvQba0atp0Aj
	4dp9kd/AO5YUkD60g88WLqa/Frg0CBHiZ9JtD9bkwYovjslE/DpMg8P+8RIl23s8OTk2NFBzRpn
	8Kc6GLYyngvtyyyfCgxqM61Q5WALi7pg9r84TGW0UiQTYTToq8VVBUfl5wLlJUCSb2hztJoeSF9
	vk9Ao5CeeLZEU3pFrpzEKNO5eq1npfX+RqUqR5htATlegiwJLkUoncHlOCQDjjC8SQN8zlanjlh
	rH+4UsWv5m+9jZnh6DaIKvVxRa7tvLJHugtBHXsiCqNxMM2FGR4fuN1K5r/weToZNfn5JohC6UF
	SW332uG0HIeHZGFSxPeQST6LBKzITVOONPzphvbXIDWq0u2ZdD8xT3eHoNPqCphxoIm+rdoXSHj
	vZwlUPNDFS0a3y51g6+WO677xMRJRLnLjZMmga9VfTMAUf5ybYYMoqKoppXh8cbMby10x6mFT6S
	1vC9Ei08vgunsN+zB75o46hlKu2LAwsIX64/r5MHdGB1CRpH8QZcjzVxxnyHQ9fF3NuECH+NJN1
	+Kw==
X-Received: by 2002:a05:6000:184d:b0:48d:fbf2:555f with SMTP id ffacd0b85a97d-48e6e518487mr28521997f8f.55.1793667607966;
        Mon, 02 Nov 2026 17:00:07 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm22351872f8f.49.2026.11.02.17.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:00:06 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH RFC v5 3/4] Revert "sched/rt: Substract number of tasks of throttled queues from rq->nr_running"
Date: Tue,  3 Nov 2026 00:59:52 +0000
Message-ID: <20261103005953.56271-4-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103005953.56271-1-qyousef@layalina.io>
References: <20261103005953.56271-1-qyousef@layalina.io>
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

This partially reverts commit f4ebcbc0d7e009783256c9daf76bc4b90e645c14.

While trying to address uclamp static key race condition the throttling
logic in RT and fair has highlighted that both perform incomplete
dequeue since they don't go through core. RT logic seemed to diverge
from fair pattern where rq->nr_running was management oddly.

Digging into the history highlighted this partially reverted patch has
added this out-of-line management of rq->nr_running instead in the usual
place when tasks are actually added or removed from internal
structures. It also had a confusing call in sched_rt_rq_dequeue() to
dequeue_top_rt_rq() when it is essentially a dead code - in existing
code base at least.

Revert the logic, but don't break the functionality. Instead do {add,
sub}_nr_running() in {inc, dec}_rt_tasks() where the rest of the
housekeeping is done.

Drop rt_queued usage in rt_rq_is_runnable() since it was unnecessary
check. And make sched_rt_is_runnable() an alias to rt_rq_is_runnable()
since we no longer have rt_queued and both functions are essentially
identical.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/rt.c    | 74 ++++++--------------------------------------
 kernel/sched/sched.h |  6 ++--
 2 files changed, 11 insertions(+), 69 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ffa..cefb0a8d37e81 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -82,8 +82,6 @@ void init_rt_rq(struct rt_rq *rt_rq)
 	rt_rq->highest_prio.next = MAX_RT_PRIO-1;
 	rt_rq->overloaded = 0;
 	plist_head_init(&rt_rq->pushable_tasks);
-	/* We start is dequeued state, because no RT tasks are queued */
-	rt_rq->rt_queued = 0;
 
 #ifdef CONFIG_RT_GROUP_SCHED
 	rt_rq->rt_time = 0;
@@ -429,8 +427,6 @@ static void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
 	}
 }
 
-static void enqueue_top_rt_rq(struct rt_rq *rt_rq);
-static void dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count);
 
 static inline int on_rt_rq(struct sched_rt_entity *rt_se)
 {
@@ -535,9 +531,7 @@ static void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
 	rt_se = rt_rq->tg->rt_se[cpu];
 
 	if (rt_rq->rt_nr_running) {
-		if (!rt_se)
-			enqueue_top_rt_rq(rt_rq);
-		else if (!on_rt_rq(rt_se))
+		if (rt_se && !on_rt_rq(rt_se))
 			enqueue_rt_entity(rt_se, 0);
 
 		if (rt_rq->highest_prio.curr < donor->prio)
@@ -553,7 +547,6 @@ static void sched_rt_rq_dequeue(struct rt_rq *rt_rq)
 	rt_se = rt_rq->tg->rt_se[cpu];
 
 	if (!rt_se) {
-		dequeue_top_rt_rq(rt_rq, rt_rq->rt_nr_running);
 		/* Kick cpufreq (see the comment in kernel/sched/sched.h). */
 		cpufreq_update_util(rq_of_rt_rq(rt_rq), 0);
 	}
@@ -920,18 +913,12 @@ static inline struct rt_rq *group_rt_rq(struct sched_rt_entity *rt_se)
 
 static inline void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
 {
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-
-	if (!rt_rq->rt_nr_running)
-		return;
-
-	enqueue_top_rt_rq(rt_rq);
-	resched_curr(rq);
+	if (rt_rq->rt_nr_running)
+		resched_curr(rq_of_rt_rq(rt_rq));
 }
 
 static inline void sched_rt_rq_dequeue(struct rt_rq *rt_rq)
 {
-	dequeue_top_rt_rq(rt_rq, rt_rq->rt_nr_running);
 }
 
 static inline int rt_rq_throttled(struct rt_rq *rt_rq)
@@ -1007,44 +994,6 @@ static void update_curr_rt(struct rq *rq)
 #endif /* CONFIG_RT_GROUP_SCHED */
 }
 
-static void
-dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count)
-{
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-
-	BUG_ON(&rq->rt != rt_rq);
-
-	if (!rt_rq->rt_queued)
-		return;
-
-	BUG_ON(!rq->nr_running);
-
-	sub_nr_running(rq, count);
-	rt_rq->rt_queued = 0;
-
-}
-
-static void
-enqueue_top_rt_rq(struct rt_rq *rt_rq)
-{
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-
-	BUG_ON(&rq->rt != rt_rq);
-
-	if (rt_rq->rt_queued)
-		return;
-
-	if (rt_rq_throttled(rt_rq))
-		return;
-
-	if (rt_rq->rt_nr_running) {
-		add_nr_running(rq, rt_rq->rt_nr_running);
-		rt_rq->rt_queued = 1;
-	}
-
-	/* Kick cpufreq (see the comment in kernel/sched/sched.h). */
-	cpufreq_update_util(rq, 0);
-}
 
 static void
 inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
@@ -1182,6 +1131,9 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 
 	inc_rt_prio(rt_rq, prio);
 	inc_rt_group(rt_se, rt_rq);
+
+	if (!group_rt_rq(rt_se))
+		add_nr_running(rq_of_rt_rq(rt_rq), 1);
 }
 
 static inline
@@ -1194,6 +1146,9 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 
 	dec_rt_prio(rt_rq, rt_se_prio(rt_se));
 	dec_rt_group(rt_se, rt_rq);
+
+	if (!group_rt_rq(rt_se))
+		sub_nr_running(rq_of_rt_rq(rt_rq), 1);
 }
 
 /*
@@ -1383,39 +1338,29 @@ static void __dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flag
 static void dequeue_rt_stack(struct sched_rt_entity *rt_se, unsigned int flags)
 {
 	struct sched_rt_entity *back = NULL;
-	unsigned int rt_nr_running;
 
 	for_each_sched_rt_entity(rt_se) {
 		rt_se->back = back;
 		back = rt_se;
 	}
 
-	rt_nr_running = rt_rq_of_se(back)->rt_nr_running;
-
 	for (rt_se = back; rt_se; rt_se = rt_se->back) {
 		if (on_rt_rq(rt_se))
 			__dequeue_rt_entity(rt_se, flags);
 	}
-
-	dequeue_top_rt_rq(rt_rq_of_se(back), rt_nr_running);
 }
 
 static void enqueue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 {
-	struct rq *rq = rq_of_rt_se(rt_se);
-
 	update_stats_enqueue_rt(rt_rq_of_se(rt_se), rt_se, flags);
 
 	dequeue_rt_stack(rt_se, flags);
 	for_each_sched_rt_entity(rt_se)
 		__enqueue_rt_entity(rt_se, flags);
-	enqueue_top_rt_rq(&rq->rt);
 }
 
 static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 {
-	struct rq *rq = rq_of_rt_se(rt_se);
-
 	update_stats_dequeue_rt(rt_rq_of_se(rt_se), rt_se, flags);
 
 	dequeue_rt_stack(rt_se, flags);
@@ -1426,7 +1371,6 @@ static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 		if (rt_rq && rt_rq->rt_nr_running)
 			__enqueue_rt_entity(rt_se, flags);
 	}
-	enqueue_top_rt_rq(&rq->rt);
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4706f73838a86..0cab55963657c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -872,8 +872,6 @@ struct rt_rq {
 	bool			overloaded;
 	struct plist_head	pushable_tasks;
 
-	int			rt_queued;
-
 #ifdef CONFIG_RT_GROUP_SCHED
 	int			rt_throttled;
 	u64			rt_time; /* consumed RT time, goes up in update_curr_rt */
@@ -892,7 +890,7 @@ struct rt_rq {
 
 static inline bool rt_rq_is_runnable(struct rt_rq *rt_rq)
 {
-	return rt_rq->rt_queued && rt_rq->rt_nr_running;
+	return rt_rq->rt_nr_running;
 }
 
 /* Deadline class' related fields in a runqueue */
@@ -2918,7 +2916,7 @@ static inline bool sched_dl_runnable(struct rq *rq)
 
 static inline bool sched_rt_runnable(struct rq *rq)
 {
-	return rq->rt.rt_queued > 0;
+	return rt_rq_is_runnable(&rq->rt);
 }
 
 static inline bool sched_fair_runnable(struct rq *rq)
-- 
2.53.0


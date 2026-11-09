Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242186;
	b=wmGm47VTP2ykQdnWOm3770EQr23h8XW5H/S6hc/ji/qbGQXsFyI1uqXUN33ZvstyUi0J
	 baYvptbtuQZEoo7dBAdNWN8fCJfcGP7+9MpLMmy197NJTO+EsDu4lv32o/6M5cXZCgWfb
	 OeMtyxdRUhWjli6Jp1SZj4/pNzXXQbBP5P/ION91xzHvVs+EUdnIwoGhZ1Xl2/YLgdsU1
	 M/vcpz/JOh6JibsGNjTNYaFyHIb0XxvoobxYACa1qPzK/rbG/LKz2TcPNEtqUfcaryjRE
	 FTHlNt2LRPVffPHf6Sks8gwJ4FxhhCUBLthTx6+XU2g1M3ZPygvAc9UVbg9Ysfpjw/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vX/Ij4B+c+ygkXkYe3AnRw/EZD7Awd9zH7+Rm7r2cHs=;
	b=1z5gJElZgGqAtb8bkV8EJRLet8Jf6Ub8pZ8/vP9lNOxpDj5fzSAsoEIoZyhIpilNF905
	 VolzS2nxyPEmG4sqsh4GpRFSD0FatpA2VCaSWFMn+fxTw3PEXwMrhfEe8/6bD2Sn2mWu9
	 ev0JFJp5zwOUEYECZqp1iSLXQmoQ0ER6J3Tnb5i3dxvcp/YQU9vEbhK9a2Y9RHAEHkpXZ
	 rACB7Cd3UkIqTkv9PDo6/V9UFhhPlk7yu+gp/1A/ma8p6oB3+V/I3rINM28MnBG/8rPKl
	 rI4waxDQYzwirEJGKbhPN5LKGzAE9FG96XN9V53DchhfqDZ1k5QAyGfwCUNHUPZdRxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PXb7r4BA;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED97606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED97606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PXb7r4BA
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so11587695e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242184; x=1794846984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vX/Ij4B+c+ygkXkYe3AnRw/EZD7Awd9zH7+Rm7r2cHs=;
        b=PXb7r4BAUYHVB11xOTCwg70XBVpyKICRH4gDHGkCFyLFKrzpNnfzGs7QBlZDvX6T6e
         ZQgzt5PGdBg0hnCW1hTd/JXEsFozylta4SWID31BWnYC8X/A9SN64pp31yx06JKh9EBq
         J/W8RfH3QHrlbOI676TPQTCa9ZGqkmlR+WuuaBHs5hMfg/e74UJR8B0e1cnPYJXDEgou
         W4uyv7MqDDNM/ehNzpY0QMb1XNKx6ZZX6c1R4DoNX3b/Ed3V9wNyx+mpfCctDucyatx5
         5FCpz9Rp92+YDUXaLjP7jXwaCohedqRL2/1DyKasi/lg1c5X+Y+hxPsCI55yJIK/7MoW
         U5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242184; x=1794846984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vX/Ij4B+c+ygkXkYe3AnRw/EZD7Awd9zH7+Rm7r2cHs=;
        b=1iry2u0/t1xGCkbTdzLygDwB1JIBSMzDYGfthQTBrhBzeiuRnsicZTZ1VirqXs4eMo
         c5nKKc6mM1rgpi3+zcVqYpE6DRPaNC1ogDuPBfmaMVniMyX0514r1pxhv/X8JxFZH2KC
         3C/DFa/jTmOkAabJLY24weIFBRNS145xMKA7s6rAmfvyAxAmHh9qzL8LpGOfHyBvbEGp
         7zK/LSRihqcukcqDSPk5AhfYkMIrTj41FBUOamnqHgZRbi12fG7k3hbhIi9CWwmMSSyU
         iEaIHXnqy5LQkZPUtQh1fbERiXis1XzJ9BwKvRkzbX80Tnwlxm3Q14bM3htURu2hZVar
         /cBg==
X-Forwarded-Encrypted: i=1; AL+hErFwhSvrWZcw49Q4abvD4JvDKsY6qG9Xet7KzBcLIA4raMggnpraj2KDwi/4wFOcsk0q03Okaoi4oe3olQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JKJvKTdS36PmPk/fkFI6nLZdXud6/zmASnYKCf+gX7I/FxIuq
	tvqPreiwXHJ8djzp/8n8pMzAD73iWp39j6jky6zi64xSRNW/BpKFmzi4
X-Gm-Gg: AYBFou2eCTnufs+V4BP9fl8QrzTi4K/2qX2Yqfk70YplG2rjcwYhKqPYbpZr8gI5Etg
	G+JDZmPY+2jeGx6/1RoGWFhILSYcypQel/4LeZ+tpeWMUlOLJQFVnwLoI8TQeSZc8X0Wk6HrT3H
	UBbCw4PQcIbT3x19nZBtcnwapVx0xK4O1K6jFfNnzSwACkEuPoHp3fOxxSbeZoU21qS8Q/KvtjV
	tByb7NrFSJJ7ZACpRenR696iob7ltPw4okBflGbS+QEvebP2hJL69mxMVIA254fTQZyPrE/nAQt
	pnLYUevjRX3soKNwf9QDr+v3j+KOkRDvy6zaLDtUS2a2puBNbdvoTJnGjEylHfRsH0sonAhyQR3
	5ohCNND5n5G82RJwhtugBZJ2/EGCgxt5TR9PDzx/2pvcjfKImgGqXIy3+zEOHZm5mfzVqVmoUmK
	Ca9OWrjoMyW/HDhKbrBJ07KkM8P/t7vz0Vxbv5MX8eixgeGD5RSXGTNU64U5Oxgoil6VmN5d8DG
	KVGzVLeKra1slPFN4tFMitnJcMWx+rDeRZyiOCCfOO8lFZ9LMV7k6V4XUdpwH4qYPA4WD8zcbiY
	QvAdQJGrziDdq/JkM3O1Z39BBg==
X-Received: by 2002:a05:600c:800e:b0:4b3:ad9d:e21 with SMTP id 5b1f17b1804b1-4b963c7f2f2mr85628795e9.12.1794242183820;
        Mon, 09 Nov 2026 08:36:23 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:23 -0800 (PST)
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
Subject: [RFC PATCH v7 02/29] sched/deadline: Do not access dl_se->rq directly
Date: Mon,  9 Nov 2026 17:35:48 +0100
Message-ID: <20261109163616.195264-3-yurand2000@gmail.com>
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

From: luca abeni <luca.abeni@santannapisa.it>

Make deadline.c code access the runqueue of a scheduling entity saved in
the sched_dl_entity data structure. This allows future patches to save
different runqueues in sched_dl_entity other than the global runqueues.

Move dl_server_apply_params call in sched_init_dl_servers as the rq_of_dl_se
function will return the correct deadline entity only if the dl_server flag
is set.

Add a WARN_ON on the return value of dl_server_apply_params in
sched_init_dl_servers as this function may fail if the kernel is not
configured correctly.

Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/deadline.c | 46 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 57c7a8802d8e..00f584c7bbd5 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -869,7 +869,7 @@ static void replenish_dl_entity(struct sched_dl_entity *dl_se)
 	 * and arm the defer timer.
 	 */
 	if (dl_se->dl_defer && !dl_se->dl_defer_running &&
-	    dl_time_before(rq_clock(dl_se->rq), dl_se->deadline - dl_se->runtime)) {
+	    dl_time_before(rq_clock(rq), dl_se->deadline - dl_se->runtime)) {
 		if (!is_dl_boosted(dl_se)) {
 
 			/*
@@ -1171,11 +1171,11 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
 			 * of time. The dl_server_min_res serves as a limit to avoid
 			 * forwarding the timer for a too small amount of time.
 			 */
-			if (dl_time_before(rq_clock(dl_se->rq),
+			if (dl_time_before(rq_clock(rq),
 					   (dl_se->deadline - dl_se->runtime - dl_server_min_res))) {
 
 				/* reset the defer timer */
-				fw = dl_se->deadline - rq_clock(dl_se->rq) - dl_se->runtime;
+				fw = dl_se->deadline - rq_clock(rq) - dl_se->runtime;
 
 				hrtimer_forward_now(timer, ns_to_ktime(fw));
 				return HRTIMER_RESTART;
@@ -1186,7 +1186,7 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
 
 		enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
 
-		if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &dl_se->rq->curr->dl))
+		if (!dl_task(rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
 			resched_curr(rq);
 
 		__push_dl_task(rq, rf);
@@ -1482,7 +1482,7 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 
 		hrtimer_try_to_cancel(&dl_se->dl_timer);
 
-		replenish_dl_new_period(dl_se, dl_se->rq);
+		replenish_dl_new_period(dl_se, rq);
 
 		if (idle)
 			dl_se->dl_defer_idle = 1;
@@ -1579,14 +1579,14 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 void dl_server_update_idle(struct sched_dl_entity *dl_se, s64 delta_exec)
 {
 	if (dl_se->dl_server_active && dl_se->dl_runtime && dl_se->dl_defer)
-		update_curr_dl_se(dl_se->rq, dl_se, delta_exec);
+		update_curr_dl_se(rq_of_dl_se(dl_se), dl_se, delta_exec);
 }
 
 void dl_server_update(struct sched_dl_entity *dl_se, s64 delta_exec)
 {
 	/* 0 runtime = fair server disabled */
 	if (dl_se->dl_server_active && dl_se->dl_runtime)
-		update_curr_dl_se(dl_se->rq, dl_se, delta_exec);
+		update_curr_dl_se(rq_of_dl_se(dl_se), dl_se, delta_exec);
 }
 
 /*
@@ -1795,7 +1795,7 @@ void dl_server_update(struct sched_dl_entity *dl_se, s64 delta_exec)
  */
 void dl_server_start(struct sched_dl_entity *dl_se)
 {
-	struct rq *rq = dl_se->rq;
+	struct rq *rq;
 
 	dl_se->dl_defer_idle = 0;
 	if (!dl_server(dl_se) || dl_se->dl_server_active || !dl_se->dl_runtime ||
@@ -1805,16 +1805,16 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 	/*
 	 * Update the current task to 'now'.
 	 */
+	rq = rq_of_dl_se(dl_se);
 	rq->donor->sched_class->update_curr(rq);
-
 	if (WARN_ON_ONCE(!cpu_online(cpu_of(rq))))
 		return;
 
 	trace_sched_dl_server_start_tp(dl_se, cpu_of(rq), dl_get_type(dl_se, rq));
 	dl_se->dl_server_active = 1;
 	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
-	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
-		resched_curr(dl_se->rq);
+	if (!dl_task(rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
+		resched_curr(rq);
 }
 
 void dl_server_stop(struct sched_dl_entity *dl_se)
@@ -1858,9 +1858,9 @@ void sched_init_dl_servers(void)
 
 		WARN_ON(dl_server(dl_se));
 
-		dl_server_apply_params(dl_se, runtime, period, 1);
-
 		dl_se->dl_server = 1;
+		WARN_ON(dl_server_apply_params(dl_se, runtime, period, 1));
+
 		dl_se->dl_defer = 1;
 		dl_se->dl_freq_invariant = 1;
 		setup_new_dl_entity(dl_se);
@@ -1870,9 +1870,9 @@ void sched_init_dl_servers(void)
 
 		WARN_ON(dl_server(dl_se));
 
-		dl_server_apply_params(dl_se, runtime, period, 1);
-
 		dl_se->dl_server = 1;
+		WARN_ON(dl_server_apply_params(dl_se, runtime, period, 1));
+
 		dl_se->dl_defer = 1;
 		dl_se->dl_freq_invariant = 1;
 		setup_new_dl_entity(dl_se);
@@ -1910,7 +1910,7 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 	u64 old_bw = (init || !dl_se->dl_bw_attached) ? 0 :
 		     to_ratio(dl_se->dl_period, dl_se->dl_runtime);
 	u64 new_bw = to_ratio(period, runtime);
-	struct rq *rq = dl_se->rq;
+	struct rq *rq = rq_of_dl_se(dl_se);
 	int cpu = cpu_of(rq);
 	struct dl_bw *dl_b;
 	unsigned long cap;
@@ -1957,7 +1957,7 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 static int __dl_server_attach_bw_locked(struct sched_dl_entity *dl_se,
 					struct dl_bw *dl_b, int cpus)
 {
-	struct rq *rq = dl_se->rq;
+	struct rq *rq = rq_of_dl_se(dl_se);
 	unsigned long cap;
 
 	/*
@@ -1985,7 +1985,7 @@ static int __dl_server_attach_bw_locked(struct sched_dl_entity *dl_se,
 static void __dl_server_detach_bw_locked(struct sched_dl_entity *dl_se,
 					 struct dl_bw *dl_b, int cpus)
 {
-	struct rq *rq = dl_se->rq;
+	struct rq *rq = rq_of_dl_se(dl_se);
 
 	/*
 	 * If the server is still active (on_rq), dequeue it via
@@ -2030,7 +2030,7 @@ static void __dl_server_detach_bw_locked(struct sched_dl_entity *dl_se,
  */
 int dl_server_attach_bw(struct sched_dl_entity *dl_se)
 {
-	struct rq *rq = dl_se->rq;
+	struct rq *rq = rq_of_dl_se(dl_se);
 	int cpu = cpu_of(rq);
 	struct dl_bw *dl_b;
 	int cpus, ret;
@@ -2071,7 +2071,7 @@ int dl_server_attach_bw(struct sched_dl_entity *dl_se)
  */
 void dl_server_detach_bw(struct sched_dl_entity *dl_se)
 {
-	int cpu = cpu_of(dl_se->rq);
+	int cpu = cpu_of(rq_of_dl_se(dl_se));
 	struct dl_bw *dl_b;
 	int cpus;
 
@@ -2096,12 +2096,12 @@ void dl_server_detach_bw(struct sched_dl_entity *dl_se)
 int dl_server_swap_bw(struct sched_dl_entity *detach_se,
 		      struct sched_dl_entity *attach_se)
 {
-	struct rq *rq = detach_se->rq;
+	struct rq *rq = rq_of_dl_se(detach_se);
 	int cpu = cpu_of(rq);
 	struct dl_bw *dl_b;
 	int cpus, ret;
 
-	WARN_ON_ONCE(attach_se->rq != rq);
+	WARN_ON_ONCE(rq_of_dl_se(attach_se) != rq);
 
 	scoped_guard (raw_spinlock, &dl_bw_of(cpu)->lock) {
 		dl_b = dl_bw_of(cpu);
@@ -2162,7 +2162,7 @@ static enum hrtimer_restart inactive_task_timer(struct hrtimer *timer)
 		p = dl_task_of(dl_se);
 		rq = task_rq_lock(p, &rf);
 	} else {
-		rq = dl_se->rq;
+		rq = rq_of_dl_se(dl_se);
 		rq_lock(rq, &rf);
 	}
 
-- 
2.56.0


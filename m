Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213853;
	b=dQBnRFW+1guynwJgnoePqW76q4B69vafpkif0Cthr4b/o9Ikpxd2+93+df/+91e+V3X1
	 IGWulhqq7TTUCjhRwCF+0juBEANZHY1ffNYXxejPXJEy10jKqxM9MPjTyAn2hKHfCduwN
	 awbc1A8YGPkW3wadKM9TKWPbhGPifmRLWS/EvgvQd+Y62CmIIE6ao267NZjQHMWXHy7FW
	 YEaMl3xGf9wcnio7/BI4G5WJyOCFeyM33ePmHCyxNH/T0C3FZjffd9uUVDAjBDpZtQV4Y
	 sZtDHIN75ip2WprepyfmIZfQDJCKmi7GcG5YqGANYPdUQNux4VnjLH09bTCIofQTdig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213853;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=K+9PPTcBn+PULHzD/w6nkLJJ5dMDCHhKxeThVtOEyVc=;
	b=1zfSJ2mrag84JG95T5Amo60Xoovj3ltaoHablCbLMeT5KQDQqfliwGuysBzOs+nRWaH1
	 oJs+v1X5fw6jEDBcOtCJ/gCofbT0MlzpbdYGqqPgV3jUKsOZ5X6MmjM4zg0rXNJbegpmS
	 fmupbxte+eMEdFgqiaDHk3FgjpC4W1eP3oSGUMgaJShsHx+j7ZmsAugWU6JAJlHv5Z223
	 loE5QNlXi+bemI4yQi51/88T1qOAhVlZZQ9G2UkG0Vg8OnhIkg+xDkkTwRH5WEr0C10IF
	 D9QDiaxgOa1iUnx99qCHHSA7ptTDke1PnSdBBZNcRGT2VOJmhEqTBIL0GCLGRvYesBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FNy11VKb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NCUTZNMl;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0D6083607;
	Mon,  9 Nov 2026 08:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C0D6083607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FNy11VKb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NCUTZNMl
Date: Mon, 09 Nov 2026 08:44:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213851;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+9PPTcBn+PULHzD/w6nkLJJ5dMDCHhKxeThVtOEyVc=;
	b=FNy11VKbyo1mkDcRNRJEzTQdTNpFL8MkMu2bf9oaI0hXqtkO2AuWsZ4ki0dB4iUDSFxoly
	X/UOMPieMATDsJpOfdbeQ/GJS/6/BB+/1y+kJjDVwgNPe48EKjerkj5IeRYRcNR9wULLMC
	J7WdZyIz2JhtvjvJDao6+jJ+K0SixTH1z/1bMyAS5HZu3gHnMwKxlGQ6M/x8cL3xiKAcV5
	ic8DQtDAR4T9SGe2t0eoIqrkSQrlgmTthwHM4IAIKpMEGBaEMMawsOZZmjotVuZ6zXqktY
	TzzhZbVrwkVgKXNPwlYj70bDodTyr5PDNJ1/rESZTGxmq3UHYF8bjfeVMDtOCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213851;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+9PPTcBn+PULHzD/w6nkLJJ5dMDCHhKxeThVtOEyVc=;
	b=NCUTZNMlNdzI/UbNi9qnOtQ3hwyXWS+dvxH1mf7gi9WkZ6n6Vg627R/ACmG6nJQ4jBX/r9
	47RRCuT/iQkJu1Dw==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Rename/clarify
 sched_class::task_tick(.queued) argument
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kayra Cizmeci <kayracizmeci@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260929085319.981147568@infradead.org>
References: <20260929085319.981147568@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421384987.2093942.15101996646487218559.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     09ab8d5fce27bc995366754f284347450b8d9085
Gitweb:        https://git.kernel.org/tip/09ab8d5fce27bc995366754f284347450b8=
d9085
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 29 Sep 2026 10:49:24 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 09 Nov 2026 09:39:55 +01:00

sched: Rename/clarify sched_class::task_tick(.queued) argument

For some reason the sched_class::task_tick() argument that indicates it being
an hrtick, is called @queued. I'm sure naming is hard and all, but lets fix
this.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Link: https://patch.msgid.link/20260929085319.981147568@infradead.org
---
 kernel/sched/deadline.c |  4 ++--
 kernel/sched/ext/ext.c  |  2 +-
 kernel/sched/fair.c     | 12 ++++++------
 kernel/sched/idle.c     |  2 +-
 kernel/sched/rt.c       |  2 +-
 kernel/sched/sched.h    |  2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index dfae086..35345ae 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2879,7 +2879,7 @@ static void put_prev_task_dl(struct rq *rq, struct task=
_struct *p, struct task_s
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_dl(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_dl(struct rq *rq, struct task_struct *p, int hrtick)
 {
 	update_curr_dl(rq);
=20
@@ -2889,7 +2889,7 @@ static void task_tick_dl(struct rq *rq, struct task_str=
uct *p, int queued)
 	 * not being the leftmost task anymore. In that case NEED_RESCHED will
 	 * be set and schedule() will start a new hrtick for the next task.
 	 */
-	if (hrtick_enabled_dl(rq) && queued && p->dl.runtime > 0 &&
+	if (hrtick_enabled_dl(rq) && hrtick && p->dl.runtime > 0 &&
 	    is_leftmost(&p->dl, &rq->dl))
 		start_hrtick_dl(rq, &p->dl);
 }
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index f74ffb3..ebdf7b9 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -4486,7 +4486,7 @@ void scx_tick(struct rq *rq)
 	update_other_load_avgs(rq);
 }
=20
-static void task_tick_scx(struct rq *rq, struct task_struct *donor, int queu=
ed)
+static void task_tick_scx(struct rq *rq, struct task_struct *donor, int hrti=
ck)
 {
 	struct scx_sched *sch =3D scx_task_sched(donor);
=20
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c8af1c..a9da1bc 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6726,7 +6726,7 @@ static void put_prev_entity(struct cfs_rq *cfs_rq, stru=
ct sched_entity *prev)
 }
=20
 static void
-entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int queued)
+entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int hrtick)
 {
 	/*
 	 * Update run-time statistics of the 'current'.
@@ -6741,10 +6741,10 @@ entity_tick(struct cfs_rq *cfs_rq, struct sched_entit=
y *curr, int queued)
=20
 #ifdef CONFIG_SCHED_HRTICK
 	/*
-	 * queued ticks are scheduled to match the slice, so don't bother
+	 * hrticks are scheduled to match the slice, so don't bother
 	 * validating it and just reschedule.
 	 */
-	if (queued) {
+	if (hrtick) {
 		resched_curr(rq_of(cfs_rq));
 		return;
 	}
@@ -15353,7 +15353,7 @@ static inline void task_tick_core(struct rq *rq, stru=
ct task_struct *curr) {}
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queu=
ed)
+static void task_tick_fair(struct rq *rq, struct task_struct *curr, int hrti=
ck)
 {
 	struct sched_entity *se =3D &curr->se;
=20
@@ -15363,7 +15363,7 @@ static void task_tick_fair(struct rq *rq, struct task=
_struct *curr, int queued)
=20
 		for_each_sched_entity(se) {
 			cfs_rq =3D cfs_rq_of(se);
-			entity_tick(cfs_rq, se, queued);
+			entity_tick(cfs_rq, se, hrtick);
=20
 			weight =3D __calc_prop_weight(cfs_rq, se, weight);
 		}
@@ -15372,7 +15372,7 @@ static void task_tick_fair(struct rq *rq, struct task=
_struct *curr, int queued)
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
 	}
=20
-	if (queued)
+	if (hrtick)
 		return;
=20
 	if (static_branch_unlikely(&sched_numa_balancing))
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index e0c10a5..f7dd151 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -542,7 +542,7 @@ dequeue_task_idle(struct rq *rq, struct task_struct *p, i=
nt flags)
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_idle(struct rq *rq, struct task_struct *curr, int queu=
ed)
+static void task_tick_idle(struct rq *rq, struct task_struct *curr, int hrti=
ck)
 {
 	update_curr_idle(rq);
 }
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046..adcf5f0 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2541,7 +2541,7 @@ static inline void watchdog(struct rq *rq, struct task_=
struct *p) { }
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_rt(struct rq *rq, struct task_struct *p, int hrtick)
 {
 	struct sched_rt_entity *rt_se =3D &p->rt;
=20
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 92134ce..cf5dba1 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2786,7 +2786,7 @@ struct sched_class {
 	 * sched_tick: rq->lock
 	 * sched_tick_remote: rq->lock
 	 */
-	void (*task_tick)(struct rq *rq, struct task_struct *p, int queued);
+	void (*task_tick)(struct rq *rq, struct task_struct *p, int hrtick);
 	/*
 	 * sched_cgroup_fork: p->pi_lock
 	 */

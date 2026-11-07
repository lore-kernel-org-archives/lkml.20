Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052982;
	b=tU0FFZFy615XwWrweRv2aV7xsdh54HV1XQBXX1vB4LpobeyBE+Tjj4AT57zxc1Qn07qs
	 I7vkae9f7h2JwieptQZyyzbJc49kG8ljq35Vse7aqVjwGX0ca+anqD+9vQRDNxz4yxiMj
	 dmahUuq9ynPOQkkhBtCGrqRmNfY5blIR+HUcAF7BzMZ7kz/KGI01K80V7nesDsdQV6DFr
	 uLh8j1YuU65oNN6ZI7CNF07rV1rdlbEy/NaFhh83XuY7Ck//2DMnqzo5j50LUJIQj70v0
	 eAzELPmgG+ZS3n8Xc6uuuFJWNHBxbjNsZ69D8eVdjf2LVAMhWod9iiYhfpPeSDkmCkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052982;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=kBHLg+ntb7NI4DqSvvGf38nL9giq212hxsWWBSsdAfo=;
	b=Hhkc/vFN1m3WbRrdV99KDKUdzG6OABbRNaQLrBVl7nsymrAhdfY20unt4sGU+OMQBVCv
	 9xUpGWwk2KzMHJ7JRgKlBX8S96TGwXdoTRnGdG4q4LHDUE/FJdHUhpY5YKDze/K3Abw6k
	 axCrzqfFzrX6ux+f4CrLPTiMl9aRW6AI6wXIBIllB3faf9Q+piJqKnKICGhIomjR2DWPB
	 NVSUBJ1Toy7SqvF5O4Sk1UTe8kb01n7NAb7wTrg11WG27ezrpHPIE1z5XEkzhoa/yxQmi
	 l3EqNQl0d2acYZckPh4NviRthkUYGekXDcGhXGE17R0H/xq7trFknUubi3WuRvTQcjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GWlPrcR9;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5078606D804
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5078606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GWlPrcR9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=kBHLg+ntb7NI4DqSvvGf38nL9giq212hxsWWBSsdAfo=; b=GWlPrcR9ZogNXjyimGsffehW5l
	EqMGba8U6glTiPUkp4xqGNLPOenDUnnRkNNa2fjrPcwQN3eOpSUk7QGxRH3XX8/Fv0ytZ/BMRyN59
	AxnxjleGOmrb4eDz6thXUwEJ6EBl+PzzqWGAW3H1ZWLqZ0/JLN+RPZGa8WiLdTJ4/YHHXjTyt0qxo
	qJY+Q8tGGCYHPvc7hYZQIxVwxqE1E5xhs8T7ZgHGhY6HXUJsrubqg5DKgIOCUYcHqnmjOIp4LQzBd
	H25zsJP5rYe4g18NDupT+jQ4QiDY7IqWUoP/351pYf7LKueMLgoHUjU5X2HoFmA9onEBvRd+0ivfr
	r85fKy7A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf8B-00000005BYh-1zUn;
	Sat, 07 Nov 2026 12:02:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 256FA301574; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120207.242460109@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:18 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org,
 ziqianlu@bytedance.com
Subject: [PATCH v2 05/12] sched/core: Abstract/fix rq_clock_start_loop_update()
References: <20261107115913.261163891@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The existing rq_clock_start_loop_update() / rq_lock_stop_loop_update() almost
do what we need rq_drop_lock() / rq_repin_lock() to do. They freeze time by
setting ACT_SKIP.

Rename them rq_clock_freeze() / rq_clock_thaw() and have them operate on a new
bit RQCF_FREEZE. This is such that schedule() can safely nest inside
rq_clock_freeze() as is required for rq_drop_lock().

Sanitize the rq->clock_update_flags handling while adding the new bit --
notably do away with the full shift left which makes a mess of things.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c  |    4 +--
 kernel/sched/fair.c  |   15 +++++++-----
 kernel/sched/sched.h |   63 +++++++++++++++++++++++++++++----------------------
 3 files changed, 48 insertions(+), 34 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7185,9 +7185,9 @@ static void __sched notrace __schedule(i
 	hrtick_schedule_enter(rq);
 
 	/* Promote REQ to ACT */
-	rq->clock_update_flags <<= 1;
+	rq->clock_update_flags |= (rq->clock_update_flags & RQCF_REQ_SKIP) << 1;
 	update_rq_clock(rq);
-	rq->clock_update_flags = RQCF_UPDATED;
+	rq->clock_update_flags &= (RQCF_FREEZE|RQCF_UPDATED);
 
 	switch_count = &prev->nivcsw;
 
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5445,6 +5445,7 @@ static inline void clear_tg_load_avg(str
 static void __maybe_unused clear_tg_offline_cfs_rqs(struct rq *rq)
 {
 	struct task_group *tg;
+	unsigned int cuf;
 
 	lockdep_assert_rq_held(rq);
 
@@ -5453,7 +5454,7 @@ static void __maybe_unused clear_tg_offl
 	 * set_rq_offline(), so we should skip updating
 	 * the rq clock again in unthrottle_cfs_rq().
 	 */
-	rq_clock_start_loop_update(rq);
+	cuf = rq_clock_freeze(rq);
 
 	guard(rcu)();
 
@@ -5463,7 +5464,7 @@ static void __maybe_unused clear_tg_offl
 		clear_tg_load_avg(cfs_rq);
 	}
 
-	rq_clock_stop_loop_update(rq);
+	rq_clock_thaw(rq, cuf);
 }
 
 /*
@@ -7331,6 +7332,7 @@ static void __cfsb_csd_unthrottle(void *
 {
 	struct cfs_rq *cursor, *tmp;
 	struct rq *rq = arg;
+	unsigned int cuf;
 
 	guard(rq_lock)(rq);
 
@@ -7340,7 +7342,7 @@ static void __cfsb_csd_unthrottle(void *
 	 * Do it once and skip the potential next ones.
 	 */
 	update_rq_clock(rq);
-	rq_clock_start_loop_update(rq);
+	cuf = rq_clock_freeze(rq);
 
 	/*
 	 * Since we hold rq lock we're safe from concurrent manipulation of
@@ -7359,7 +7361,7 @@ static void __cfsb_csd_unthrottle(void *
 			unthrottle_cfs_rq(cursor);
 	}
 
-	rq_clock_stop_loop_update(rq);
+	rq_clock_thaw(rq, cuf);
 }
 
 static inline void __unthrottle_cfs_rq_async(struct cfs_rq *cfs_rq)
@@ -7865,6 +7867,7 @@ static void __maybe_unused update_runtim
 static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 {
 	struct task_group *tg;
+	unsigned int cuf;
 
 	lockdep_assert_rq_held(rq);
 
@@ -7877,7 +7880,7 @@ static void __maybe_unused unthrottle_of
 	 * set_rq_offline(), so we should skip updating
 	 * the rq clock again in unthrottle_cfs_rq().
 	 */
-	rq_clock_start_loop_update(rq);
+	cuf = rq_clock_freeze(rq);
 
 	guard(rcu)();
 
@@ -7904,7 +7907,7 @@ static void __maybe_unused unthrottle_of
 		unthrottle_cfs_rq(cfs_rq);
 	}
 
-	rq_clock_stop_loop_update(rq);
+	rq_clock_thaw(rq, cuf);
 }
 
 bool cfs_task_bw_constrained(struct task_struct *p)
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1790,24 +1790,33 @@ extern void update_rq_clock(struct rq *r
  * %RQCF_ACT_SKIP - is set from inside of __schedule() when skipping is
  *  in effect and calls to update_rq_clock() are being ignored.
  *
+ * %RQCF_FREEZE - set from rq_clock_freeze(), much like ACT_SKIP it
+ *  makes update_rq_clock() a noop.
+ *
  * %RQCF_UPDATED - is a debug flag that indicates whether a call has been
  *  made to update_rq_clock() since the last time rq::lock was pinned.
  *
- * If inside of __schedule(), clock_update_flags will have been
- * shifted left (a left shift is a cheap operation for the fast path
- * to promote %RQCF_REQ_SKIP to %RQCF_ACT_SKIP), so you must use,
- *
- *	if (rq-clock_update_flags >= RQCF_UPDATED)
- *
- * to check if %RQCF_UPDATED is set. It'll never be shifted more than
- * one position though, because the next rq_unpin_lock() will shift it
- * back.
+ *
+ * yield():
+ *   will generally result in REQ_SKIP.
+ *
+ * update_rq_clock():
+ *   sets UPDATED, will not modify rq->clock when NOP_MASK
+ *
+ * schedule():
+ *   will promote REQ_SKIP to ACT_SKIP before its update_rq_clock() to ensure
+ *   the yield() and schedule() appear to happen instantaneous.
+ *
+ * rq_clock_freeze()/rq_clock_thaw():
+ *   set FREEZE to make 'nested' update_rq_clock() calls NOP and avoid
+ *   time being moved forward. Also used in rq_drop_lock()/rq_repin_lock().
  */
 #define RQCF_REQ_SKIP		0x01
 #define RQCF_ACT_SKIP		0x02
-#define RQCF_UPDATED		0x04
+#define RQCF_FREEZE		0x04
+#define RQCF_UPDATED		0x08
 
-#define RQCF_NOP_MASK		(RQCF_ACT_SKIP | RQCF_UPDATED)
+#define RQCF_NOP_MASK		(RQCF_ACT_SKIP | RQCF_FREEZE | RQCF_UPDATED)
 
 static inline void assert_clock_updated(struct rq *rq)
 {
@@ -1815,7 +1824,7 @@ static inline void assert_clock_updated(
 	 * The only reason for not seeing a clock update since the
 	 * last rq_pin_lock() is if we're currently skipping updates.
 	 */
-	WARN_ON_ONCE(rq->clock_update_flags < RQCF_ACT_SKIP);
+	WARN_ON_ONCE(!(rq->clock_update_flags & RQCF_UPDATED));
 }
 
 static inline u64 rq_clock(struct rq *rq)
@@ -1851,25 +1860,27 @@ static inline void rq_clock_cancel_skipu
 }
 
 /*
- * During cpu offlining and rq wide unthrottling, we can trigger
- * an update_rq_clock() for several cfs and rt runqueues (Typically
- * when using list_for_each_entry_*)
- * rq_clock_start_loop_update() can be called after updating the clock
- * once and before iterating over the list to prevent multiple update.
- * After the iterative traversal, we need to call rq_clock_stop_loop_update()
- * to clear RQCF_ACT_SKIP of rq->clock_update_flags.
+ * FREEZE rq_clock. This is used in a number of places to
+ * ensure things appears to happen at the same time.
+ *
+ * Eg. during cpu offlining and rq wide unthrottling, we can trigger an
+ * update_rq_clock() for several cfs and rt runqueues (Typically when using
+ * list_for_each_entry_*)
  */
-static inline void rq_clock_start_loop_update(struct rq *rq)
+static inline unsigned int rq_clock_freeze(struct rq *rq)
 {
+	unsigned int flags = rq->clock_update_flags;
 	lockdep_assert_rq_held(rq);
-	WARN_ON_ONCE(rq->clock_update_flags & RQCF_ACT_SKIP);
-	rq->clock_update_flags |= RQCF_ACT_SKIP;
+	assert_clock_updated(rq);
+	rq->clock_update_flags |= RQCF_FREEZE;
+	return flags;
 }
 
-static inline void rq_clock_stop_loop_update(struct rq *rq)
+static inline void rq_clock_thaw(struct rq *rq, bool flags)
 {
 	lockdep_assert_rq_held(rq);
-	rq->clock_update_flags &= ~RQCF_ACT_SKIP;
+	rq->clock_update_flags &= ~RQCF_FREEZE;
+	rq->clock_update_flags |= RQCF_UPDATED | (flags & RQCF_FREEZE);
 }
 
 struct rq_flags {
@@ -1938,14 +1949,14 @@ static inline void rq_pin_lock(struct rq
 {
 	rf->cookie = lockdep_pin_lock(__rq_lockp(rq));
 
-	rq->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
+	rq->clock_update_flags &= ~RQCF_UPDATED;
 	rf->clock_update_flags = 0;
 	assert_balance_callbacks_empty(rq);
 }
 
 static inline void rq_unpin_lock(struct rq *rq, struct rq_flags *rf)
 {
-	if (rq->clock_update_flags > RQCF_ACT_SKIP)
+	if (rq->clock_update_flags & RQCF_UPDATED)
 		rf->clock_update_flags = RQCF_UPDATED;
 
 	scx_rq_clock_invalidate(rq);



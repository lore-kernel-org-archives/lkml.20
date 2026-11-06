Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958643;
	b=qMO7Lzep8PBpx2nStYzR2IaMo01FGg3d6iUdXVyBJ6QpkxkO0+SMS5f89YvIX+uM5dZo
	 qZOUnOM7a7ccziQZsBQkoKGo4MQRmV2IvEbf7EKC94k6jDzzvLEbXS7rGIl1zNC4qkqYS
	 ipamnRDJPv6oLQQxy/E881ztfJicDKY1CHwa/0g59l2pQEbA7dG0LEPab7jK8NRO4NLy0
	 KhpAMmS5CoT+C4hE+RVwyzulDYjhjg+BYprW/kaiaBDnT6SDA7n4QF0ErkS7o/tm0Nm/X
	 l56OHIrAbDGbJB8GwRKSr1xrlXRYPjeUIEecoe+7/smVSoxePq5r7c3xUcw/mmQYR5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958643;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=+SOP8fW8rHC6QvsENjYoGEzi4a+KgOSZlffYb8mBkKQ=;
	b=wu40RhcJtyZj6RrsvB5aKQHEebp9BktBYy5wMq5Tbjw2MSHtX+HLcwIL9Uv72YbOgk7y
	 ECiEZrjStUpzWKpBjwV1t4v3dKjFnUTDXud4MHt78iOrXoypWrsr1mtFZ1OIhStMM1gH0
	 bLqqOGUiLn0xOjowvcydWLApXluNyo2xeSuFeFqJEFK2AYGOiHCaeJ4fsym8rOjn28mn6
	 GYh+TfqEAe83YeDz2TfbRVd5VH5fkuC5BQwqTFLjiS3B7cXJoFaJlRiByMVw0Sx4+CflK
	 prddqB4kuHggU4DQhd5kcD4LpgJCBVhA1vJIEKgjD562J/OHH8THDJ5Iqxw2OA4WUCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qsxyjcDG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vzz3a2xq;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5DC6082BE9;
	Fri,  6 Nov 2026 09:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5DC6082BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qsxyjcDG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vzz3a2xq
Date: Fri, 06 Nov 2026 09:50:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958641;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+SOP8fW8rHC6QvsENjYoGEzi4a+KgOSZlffYb8mBkKQ=;
	b=qsxyjcDG/9U0PvEZKq+IsPMcdZnCAQAsOGGNd3hBKg+OzcjSCeE2+uHNDGQs6SZ3I8JlUa
	ZGn87X/SMr45/px5sEp7ANLXf8iFmCSTZuASe6tYNbtq0KAr2HNohjId6vGaLL2pd5k1AO
	yS2aAs8KUFnh8Y/i7l1VkkS8huU0OELFlyV6p8ZqAdWKNdgLgBEA0SkOwkxCZUNfalItV9
	zSuTNy7dzqLDps6/ZXj86yuEt5vl8A/kCQSqTZIQt9vozRh9U+EOAgUBMw0/EKTPKnktMR
	rxst/08qbundnm8PpoIvU6dFwB0QBCKLtqvbPatAvImjVkYOB/d6wSZZg0xuJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958641;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+SOP8fW8rHC6QvsENjYoGEzi4a+KgOSZlffYb8mBkKQ=;
	b=vzz3a2xqH8MS9DUGujqJWWu/0IJJjuOCvYdMW24T7qTLywcJTJQIZ1KQVgxqr7eRMkGqgf
	pgutoEt9uj5X15BA==
From: "tip-bot2 for Christian Loehle" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/core: Account I/O waits independently of
 delayed dequeue
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
 Christian Loehle <christian.loehle@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Kayra Cizmeci <kayracizmeci@gmail.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <fd8578a1-e60b-4993-ab51-2b5d63abcf77@arm.com>
References: <fd8578a1-e60b-4993-ab51-2b5d63abcf77@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395863965.1009794.4319804414871563617.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     0965587d00b84f0a3b0fc94930d4a5f8ff011eda
Gitweb:        https://git.kernel.org/tip/0965587d00b84f0a3b0fc94930d4a5f8ff0=
11eda
Author:        Christian Loehle <christian.loehle@arm.com>
AuthorDate:    Thu, 15 Oct 2026 12:37:54 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 10:01:52 +01:00

sched/core: Account I/O waits independently of delayed dequeue

Starting blkio delay accounting and incrementing rq->nr_iowait in
__block_task() ties both to removal from the runqueue. With EEVDF delayed
dequeue, this misses the initial part of an I/O sleep, or the entire
sleep if the task wakes before it is dequeued. Such tasks are also
missing from procs_blocked while their dequeue is delayed. Final dequeue
can run in another task's context, causing delayacct_blkio_start() to
timestamp the wrong task.

Start both forms of accounting in try_to_block_task(), when the current
task commits to blocking, before delayed dequeue or proxy execution can
retain it on the runqueue. End both when clearing is_blocked, including
queued wakeups and the proxy execution paths that let the current task
continue. Checking is_blocked excludes wakeups that precede blocking.

Save the CPU charged at the start of the wait. Delayed tasks can migrate
while still queued, and proxy execution can also move blocked tasks.
Decrement the saved CPU's counter on unblock, regardless of the task's
current placement, and remove the old dequeue-based accounting.

CPU iowait continues to classify idle time using the counter on the
charged CPU; it does not accumulate the full per-task blocked duration.

Closes: https://lore.kernel.org/r/20261014081731.1068794-1-zhanxusheng@xiaomi=
.com
Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Reported-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Link: https://patch.msgid.link/fd8578a1-e60b-4993-ab51-2b5d63abcf77@arm.com
---
 include/linux/sched.h |  2 ++
 kernel/sched/core.c   | 33 ++++++++++++++++++++-------------
 kernel/sched/sched.h  |  5 -----
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1c93da7..e4f6323 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -881,6 +881,8 @@ struct task_struct {
 	 */
 	int				recent_used_cpu;
 	int				wake_cpu;
+	/* CPU charged while is_blocked && in_iowait. */
+	int				iowait_cpu;
=20
 	int				prio;
 	int				static_prio;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c1..1a088d4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -636,7 +636,7 @@ int task_llc(const struct task_struct *p)
  *
  * p->is_blocked <- { 0, 1 }:
  *
- *   is set by try_to_block_task() and cleared by ttwu_do_wakeup() and tracks
+ *   is set by try_to_block_task() and cleared by unblock_task() and tracks
  *   if the task is blocked. Traditionally this would mirror p->on_rq, howev=
er
  *   due things like DELAY_DEQUEUE and PROXY_EXEC, this can diverge.
  *
@@ -3773,12 +3773,22 @@ ttwu_stat(struct task_struct *p, int cpu, int wake_fl=
ags)
 		__schedstat_inc(p->stats.nr_wakeups_sync);
 }
=20
+static inline void unblock_task(struct task_struct *p)
+{
+	if (p->is_blocked && p->in_iowait) {
+		delayacct_blkio_end(p);
+		atomic_dec(&cpu_rq(p->iowait_cpu)->nr_iowait);
+	}
+
+	p->is_blocked =3D 0;
+}
+
 /*
  * Mark the task runnable.
  */
 static inline void ttwu_do_wakeup(struct task_struct *p)
 {
-	p->is_blocked =3D 0;
+	unblock_task(p);
 	WRITE_ONCE(p->__state, TASK_RUNNING);
 	trace_sched_wakeup(p);
 }
@@ -3889,10 +3899,6 @@ ttwu_do_activate(struct rq *rq, struct task_struct *p,=
 int wake_flags,
 		en_flags |=3D ENQUEUE_RQ_SELECTED;
 	if (wake_flags & WF_MIGRATED)
 		en_flags |=3D ENQUEUE_MIGRATED;
-	else if (p->in_iowait) {
-		delayacct_blkio_end(p);
-		atomic_dec(&task_rq(p)->nr_iowait);
-	}
=20
 	activate_task(rq, p, en_flags);
 	wakeup_preempt(rq, p, wake_flags);
@@ -4465,11 +4471,6 @@ int try_to_wake_up(struct task_struct *p, unsigned int=
 state, int wake_flags)
=20
 		cpu =3D select_task_rq(p, p->wake_cpu, &wake_flags);
 		if (task_cpu(p) !=3D cpu) {
-			if (p->in_iowait) {
-				delayacct_blkio_end(p);
-				atomic_dec(&task_rq(p)->nr_iowait);
-			}
-
 			wake_flags |=3D WF_MIGRATED;
 			psi_ttwu_dequeue(p);
 			set_task_cpu(p, cpu);
@@ -6813,6 +6814,12 @@ static bool try_to_block_task(struct rq *rq, struct ta=
sk_struct *p,
=20
 	p->is_blocked =3D 1;
=20
+	if (p->in_iowait) {
+		p->iowait_cpu =3D cpu_of(rq);
+		atomic_inc(&rq->nr_iowait);
+		delayacct_blkio_start();
+	}
+
 	/*
 	 * We check should_block after signal_pending because we
 	 * will want to wake the task in that case. But if
@@ -7020,7 +7027,7 @@ find_proxy_task(struct rq *rq, struct task_struct *dono=
r, struct rq_flags *rf)
 		if (!mutex) {
 			clear_task_blocked_on(p, mutex);
 			if (task_current(rq, p)) {
-				p->is_blocked =3D 0;
+				unblock_task(p);
 				return p;
 			}
 			goto deactivate;
@@ -7056,7 +7063,7 @@ find_proxy_task(struct rq *rq, struct task_struct *dono=
r, struct rq_flags *rf)
 			 */
 			__clear_task_blocked_on(p, NULL);
 			if (task_current(rq, p)) {
-				p->is_blocked =3D 0;
+				unblock_task(p);
 				return p;
 			}
 			goto deactivate;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c7c563..1d76950 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3124,11 +3124,6 @@ static inline void __block_task(struct rq *rq, struct =
task_struct *p)
 	if (p->sched_contributes_to_load)
 		rq->nr_uninterruptible++;
=20
-	if (p->in_iowait) {
-		atomic_inc(&rq->nr_iowait);
-		delayacct_blkio_start();
-	}
-
 	ASSERT_EXCLUSIVE_WRITER(p->on_rq);
=20
 	/*

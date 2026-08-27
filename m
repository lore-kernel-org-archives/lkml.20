Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79D420469
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822403; cv=pass; b=Y/uNHB5SALMPlNeeX2d9Yl41EKAKMfyWEb59yZpWLtXNlB8QwU1bcG6pHgUHDY8v2dSh7I2KmZaTbMnoq5EnRzGhhS3q5jQ6SSQ8OBlB4wJ+PCSW1LLpgFq9vAeeAkRdJ0UuX7JMr0WwGd5gK49GWFHHgwksfQ1pGBN7SHNbnu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822403; c=relaxed/simple;
	bh=FL6ifWcp39huPX6W+6NwoC2YhCWbA8UPtW1SoQCEXNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FgyFKuS1JAEK5F0IueSjLUVtgoQYVEMOJNzd9YzEsFFc0e1LZVSrq+QaVmLHM9Gf+FomQTzvRcL5wO52O4aZk0NBEe1BXfw+jxLE1KzHK5F747J8ft1GiolL+oJW+kvVl4KszY/S3lFQEYktdSRWPRVVoPQIcSJZAm4NbDalgec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=RjyYq8iT; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="RjyYq8iT"
ARC-Seal: i=1; a=rsa-sha256; t=1787822361; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eZR9M8ZwXkpb+upweUXjMdvTeigc2bdbWsu+sBeoOqvV9gIGYIXSMJmn3WxrOdYNgM3xiqcq9ehKEmiULmdpk8tnU5rEz6JGlQYm9Lg3esgzORiwaKCsgtbxFeUnKYUhgm2Axu0SHBv6+mWvmrLURVAVBV/F4UUTwZLa1Jk4+2o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787822361; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6IdOOt4Sr8qr1MITAQoJBhI6vph4R1RjIrJEfMCPaoI=; 
	b=X/5p+za0DKT0ZWhjPEoSSZz0Q79EFmEkZiUA3S1qxnjR/zB6A6dKCORw2CLy31y1+r3pN8eZ7bkRqnD0VmmNAAZdsx6lWcaQ+wvDwWMBvBgZJ2VRCVJi4SX1Fwmv0W5YPNzuoSyLjk7OswgGjMWztnWfev0ppkLtewIn3IG5waE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787822361;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=6IdOOt4Sr8qr1MITAQoJBhI6vph4R1RjIrJEfMCPaoI=;
	b=RjyYq8iTWpp2yvtiSEDnGpb8Ywgfq8zzg6dJYOW2RwsyQfiPYGMmReocJBzDVFCC
	RUONFw3tWIrSbFPWKptERDQwnM3TeDcDgE0YuEnKrZYuykH0dIRRIpTpqyT6VQ0Dg1p
	sVZiFvhIbJgG8vXdbumeI+EHN03VqPOwu75y2j3w=
Received: by mx.zohomail.com with SMTPS id 1787822353100103.49421188611166;
	Thu, 27 Aug 2026 02:19:13 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Thu, 27 Aug 2026 17:18:59 +0800
Subject: [PATCH RFC v3] sched/proxy: Defer donor commit until after proxy
 resolution
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-sched-proxy-v3-1-1af63ac5ae56@zohomail.com>
X-B4-Tracking: v=1; b=H4sIAAIBkGoC/22OzU7EIBSFX6VhLYZyKdBZmZj4AG6NC34uFmOHE
 TrNjJO+u4izUOPy3JzvO/dCCuaIhey6C8m4xhLTvga46YibzP4FafQ1E864ZIopWtyEnh5yOp2
 pEExYiaMyfiSVOGQM8dRsT+Tx4Z48fx/L0b6iW74811rG92PdWq5dawpSl+Y5LrtOagQltNI9M
 +CNACc0CBaMVWYYLNTF4A1Cs0+xLCmf2/9r32T/vrr2lNFh5NoG6dEHdveRpjSb+HZbd5tq5T/
 wHn7jvOKKj71iTHMJ8Afftu0TKecU5ksBAAA=
X-Change-ID: 20260707-sched-proxy-4404b6e97ad9
To: Ingo Molnar <mingo@redhat.com>, John Stultz <jstultz@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Xukai Wang <kingxukai@zohomail.com>
X-Mailer: b4 0.15.2
Feedback-ID: zu080112278f67e380996ee161957f900d00001bf691fc69554659ab1e3c3d2a901b47172071667e25bd3c41:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External

pick_next_task() currently couples selecting a task with committing that
selection through put_prev_set_next_task().

With proxy execution, the selected task may be a blocked donor which
still has to go through find_proxy_task(). If proxy resolution returns
NULL, __schedule() retries through pick_again, and the following pick may
select a different task. In that case, the put_prev_task()/set_next_task()
work done for the previous pick is followed by another
put_prev_set_next_task() for the new pick, even though the previous pick
was ultimately abandoned.

Temporary instrumentation was added to the kernel without this patch to
measure how often this happens. In one 60 second proxy-mutex stress run:
	spec_commit_blocked 5407
	spec_commit_then_null 3224
	spec_commit_then_idle 1660
	spec_commit_then_success 523

For the 3224 NULL cases, the following retry selected:
	null_retry_same_donor 0
	null_retry_diff_donor 2258
	null_retry_to_idle 966

The temporary counters mean:
- spec_commit_blocked: pick_next_task() selected a blocked donor, and in
the baseline code that donor had already gone through
put_prev_set_next_task() before proxy-chain resolution.

- spec_commit_then_null: the blocked donor had already been committed,
but find_proxy_task() returned NULL and __schedule() retried.

- spec_commit_then_idle: the blocked donor had already been committed,
but find_proxy_task() returned rq->idle.

- spec_commit_then_success: the blocked donor had already been committed,
and find_proxy_task() successfully found a task to run.

- null_retry_same_donor: after find_proxy_task() returned NULL, the next
pick selected the same donor again.

- null_retry_diff_donor: after find_proxy_task() returned NULL, the next
pick selected a different non-idle donor.

- null_retry_to_idle: after find_proxy_task() returned NULL, the next
pick selected idle.

Thus, in this run, none of the NULL retries selected the same donor
again. 2258 selected a different non-idle donor and 966 selected idle.

These measurements only characterize how frequently the redundant
put_prev/set_next case occurs. The cycle cost of those callbacks and
the end-to-end performance impact were not measured.

Separate candidate selection from donor commit. Make pick_next_task()
return only the selected candidate and move put_prev_set_next_task() to
__schedule(), after proxy-chain resolution.

Keep the selected donor separate from the task that will actually run:
	donor = pick_next_task(rq, &rf);
	next = donor;
	...
	next = find_proxy_task(rq, donor, &rf);
	...
	put_prev_set_next_task(rq, rq->donor, donor);
	rq_set_donor(rq, donor);

If proxy resolution abandons the candidate, the candidate is discarded
without first doing the sched-class put_prev/set_next work for that
pick.

Deferring put_prev_set_next_task() also changes the rq->dl_server state
seen by find_proxy_task(). Before this change, put_prev_set_next_task()
has already consumed and cleared rq->dl_server by the time
find_proxy_task() is entered. Preserve that behavior by saving and
clearing rq->dl_server around proxy resolution and restoring it only
when resolution succeeds.

A proxy candidate is also no longer necessarily the committed
rq->donor. Update proxy_deactivate() accordingly: only switch to idle
before blocking the candidate when it is still the committed donor.
proxy_migrate_task() continues to switch the committed donor to idle
before dropping the rq lock.

Move zap_balance_callbacks() into proxy_resched_idle(), next to the idle
commit. Since the remaining callers of zap_balance_callbacks() are
proxy-exec specific, guard its definition with CONFIG_SCHED_PROXY_EXEC.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
Changes in v3:
- Add the motivation and retry-frequency measurements previously posted
in the v1 discussion.
- Preserve rq->dl_server == NULL while find_proxy_task() is running by
saving and clearing the candidate DL-server state around proxy
resolution and restoring it only on success.
- Make the donor/execution-task distinction explicit in __schedule().
- Preserve the existing DL-server/accounting ordering by doing the
common put_prev_set_next_task() before the same-donor sched-class
callback refresh.
- Fix a W=1 !CONFIG_SCHED_PROXY_EXEC unused-function warning reported by
the kernel test robot.
- Link to v2: https://patch.msgid.link/20260713-sched-proxy-v2-0-729170082633@zohomail.com

Changes in v2:
- Move the final put_prev_set_next_task()/rq_set_donor() after the
  proxy/non-proxy branches.
- Move zap_balance_callbacks() from the NULL/idle proxy-resolution
  paths into proxy_resched_idle(), next to the idle commit.
- Link to v1: https://patch.msgid.link/20260707-sched-proxy-v1-0-5928bf6dedf0@zohomail.com

To: Ingo Molnar <mingo@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
To: Ben Segall <bsegall@google.com>
To: Mel Gorman <mgorman@suse.de>
To: Valentin Schneider <vschneid@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/sched/core.c | 136 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 78 insertions(+), 58 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2e7cde033a31..bd6c0252b820 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5090,6 +5090,7 @@ static inline void finish_task(struct task_struct *prev)
 	smp_store_release(&prev->on_cpu, 0);
 }
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
 /*
  * Only called from __schedule context
  *
@@ -5117,6 +5118,7 @@ static void zap_balance_callbacks(struct rq *rq)
 	}
 	rq->balance_callback = found ? &balance_push_callback : NULL;
 }
+#endif
 
 static void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
 {
@@ -6146,7 +6148,6 @@ __pick_next_task(struct rq *rq, struct rq_flags *rf)
 		if (!p)
 			p = pick_task_idle(rq, rf);
 
-		put_prev_set_next_task(rq, rq->donor, p);
 		return p;
 	}
 
@@ -6157,10 +6158,8 @@ __pick_next_task(struct rq *rq, struct rq_flags *rf)
 		p = class->pick_task(rq, rf);
 		if (unlikely(p == RETRY_TASK))
 			goto restart;
-		if (p) {
-			put_prev_set_next_task(rq, rq->donor, p);
+		if (p)
 			return p;
-		}
 	}
 
 	BUG(); /* The idle class should always have a runnable task. */
@@ -6257,7 +6256,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 		rq->dl_server = rq->core_dl_server;
 		rq->core_pick = NULL;
 		rq->core_dl_server = NULL;
-		goto out_set_next;
+		goto out_return_next;
 	}
 
 	prev_balance(rq, rf);
@@ -6311,7 +6310,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 			 */
 			WARN_ON_ONCE(fi_before);
 			task_vruntime_update(rq, next, false);
-			goto out_set_next;
+			goto out_return_next;
 		}
 	}
 
@@ -6441,8 +6440,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 		resched_curr(rq_i);
 	}
 
-out_set_next:
-	put_prev_set_next_task(rq, rq->donor, next);
+out_return_next:
 	if (rq->core->core_forceidle_count && next == rq->idle)
 		queue_core_balance(rq);
 
@@ -6745,6 +6743,14 @@ static inline struct task_struct *proxy_resched_idle(struct rq *rq)
 	rq->next_class = &idle_sched_class;
 	rq_set_donor(rq, rq->idle);
 	set_tsk_need_resched(rq->idle);
+
+	/*
+	 * This helper performs a real idle commit. Some callers return to
+	 * __schedule() without dropping rq->lock, so clear callbacks
+	 * generated by the idle commit here. Paths that later drop
+	 * rq->lock may zap again.
+	 */
+	zap_balance_callbacks(rq);
 	return rq->idle;
 }
 
@@ -6755,15 +6761,23 @@ static void proxy_deactivate(struct rq *rq, struct task_struct *donor)
 	WARN_ON_ONCE(state == TASK_RUNNING);
 	WARN_ON_ONCE(donor->blocked_on);
 	/*
-	 * Because we got donor from pick_next_task(), it is *crucial*
-	 * that we call proxy_resched_idle() before we deactivate it.
-	 * As once we deactivate donor, donor->on_rq is set to zero,
-	 * which allows ttwu() to immediately try to wake the task on
-	 * another rq. So we cannot use *any* references to donor
-	 * after that point. So things like cfs_rq->curr or rq->donor
-	 * need to be changed from next *before* we deactivate.
+	 * A proxy candidate is not necessarily the committed rq->donor.
+	 * pick_next_task() only selected it; the class current state is
+	 * updated later, after proxy-chain resolution.
+	 *
+	 * If @donor is still the committed donor, the rq and the scheduling
+	 * class may hold current references to it, such as rq->donor or
+	 * cfs_rq->curr/h_curr. Drop those references before block_task(),
+	 * because block_task() clears donor->on_rq and a concurrent wakeup
+	 * may then move the task elsewhere.
+	 *
+	 * If @donor is only an uncommitted proxy candidate, it is still a
+	 * queued task, not the class current task, so it can be blocked
+	 * directly.
 	 */
-	proxy_resched_idle(rq);
+	if (donor == rq->donor)
+		proxy_resched_idle(rq);
+
 	block_task(rq, donor, state);
 }
 
@@ -6816,15 +6830,17 @@ static void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
 	lockdep_assert_rq_held(rq);
 	WARN_ON(p == rq->curr);
 	/*
-	 * Since we are migrating a blocked donor, it could be rq->donor,
-	 * and we want to make sure there aren't any references from this
-	 * rq to it before we drop the lock. This avoids another cpu
-	 * jumping in and grabbing the rq lock and referencing rq->donor
-	 * or cfs_rq->curr, etc after we have migrated it to another cpu,
-	 * and before we pick_again in __schedule.
+	 * Migrating a task found in the proxy chain abandons the current proxy
+	 * pick attempt and drops this rq's lock.
+	 *
+	 * The picked proxy candidate has not necessarily been committed, so
+	 * @p is not necessarily rq->donor. Switch the currently committed
+	 * donor to idle before dropping the lock, leaving rq->donor and the
+	 * class current state in a well-defined state while the chain is
+	 * modified and @p is attached elsewhere.
 	 *
-	 * So call proxy_resched_idle() to drop the rq->donor references
-	 * before we release the lock.
+	 * If @p is rq->donor, this also drops the direct rq/class-current
+	 * references to @p before it leaves this rq.
 	 */
 	proxy_resched_idle(rq);
 
@@ -7057,7 +7073,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
  */
 static void __sched notrace __schedule(int sched_mode)
 {
-	struct task_struct *prev, *next;
+	struct task_struct *prev, *next, *donor;
 	/*
 	 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
 	 * as a preemption by schedule_debug() and RCU.
@@ -7143,45 +7159,49 @@ static void __sched notrace __schedule(int sched_mode)
 
 pick_again:
 	assert_balance_callbacks_empty(rq);
-	next = pick_next_task(rq, &rf);
-	rq->next_class = next->sched_class;
+	donor = pick_next_task(rq, &rf);
+	rq->next_class = donor->sched_class;
+	next = donor;
 	if (sched_proxy_exec()) {
-		struct task_struct *prev_donor = rq->donor;
-
-		rq_set_donor(rq, next);
-		next->blocked_donor = NULL;
-		if (unlikely(next->is_blocked)) {
-			next = find_proxy_task(rq, next, &rf);
-			if (!next) {
-				zap_balance_callbacks(rq);
+		donor->blocked_donor = NULL;
+		if (unlikely(donor->is_blocked)) {
+			struct sched_dl_entity *donor_dl_server = rq->dl_server;
+
+			rq->dl_server = NULL;
+
+			next = find_proxy_task(rq, donor, &rf);
+			if (!next)
 				goto pick_again;
-			}
-			if (next == rq->idle) {
-				zap_balance_callbacks(rq);
+			if (next == rq->idle)
 				goto keep_resched;
-			}
-		}
-		if (rq->donor == prev_donor && prev != next) {
-			struct task_struct *donor = rq->donor;
-			/*
-			 * When transitioning like:
-			 *
-			 *         prev         next
-			 * donor:    B            B
-			 * curr:     A          B or C
-			 *
-			 * then put_prev_set_next_task() will not have done
-			 * anything, since B == B. However, A might have
-			 * missed a RT/DL balance opportunity due to being
-			 * on_cpu.
-			 */
-			donor->sched_class->put_prev_task(rq, donor, donor);
-			donor->sched_class->set_next_task(rq, donor, true);
+
+			rq->dl_server = donor_dl_server;
 		}
-	} else {
-		rq_set_donor(rq, next);
+
 	}
 
+	put_prev_set_next_task(rq, rq->donor, donor);
+
+	if (sched_proxy_exec() &&
+	    donor == rq->donor && prev != next) {
+		/*
+		 * When transitioning like:
+		 *
+		 *         prev         next
+		 * donor:    B            B
+		 * curr:     A          B or C
+		 *
+		 * then put_prev_set_next_task() will not have called
+		 * the class->put_prev_task()/set_next_task() callbacks,
+		 * since B == B. However, A might have missed a RT/DL
+		 * balance opportunity due to being on_cpu.
+		 */
+		donor->sched_class->put_prev_task(rq, donor, donor);
+		donor->sched_class->set_next_task(rq, donor, true);
+	}
+
+	rq_set_donor(rq, donor);
+
 picked:
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();

---
base-commit: 68e37487810a3da43c48340fab7a55b3b6efdae3
change-id: 20260707-sched-proxy-4404b6e97ad9

Best regards,
--  
Xukai Wang <kingxukai@zohomail.com>


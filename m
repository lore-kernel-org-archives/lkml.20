Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281933793B0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185793; cv=none; b=rbJ1lhn+96K00bFXPPLIxEDl6yYiFr5Q/O+gcWWjRgw0tLRKeE+sE+TwxKrMGljcP35eJ02mNka/BKzN+eFNbuhcLwcBkbDTNwzHfoAqAHQ/0fBxgwvh00DsAssks7zB+HkyLciSupbZUFXsFA5VqN+NoCxUHmKkTsP4pF82+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185793; c=relaxed/simple;
	bh=Ad0n9ZA89xXmqMjwuB2q1H5LH+tJ6kFsoi5mEz/Sjfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j372NvT6tk/QQ+AWIjiEXhUT3yJL8KC1ERE+MXWWg6KAmhrQjN0wFsT0MUCYpcAI2npaHWoBT6iZBSAuAfktBEMSQhz2s6yBQ0Iwc/0VIqzQT7j44raoKWBkmCl9Z3SxhMg+RdwwQiaNkgcqy2bcYThSK3sK2Ix7EKYjRst4m1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=qKiTj1as; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="qKiTj1as"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792185222;
	bh=Ad0n9ZA89xXmqMjwuB2q1H5LH+tJ6kFsoi5mEz/Sjfo=;
	h=From:Date:Subject:To:Cc:From;
	b=qKiTj1asVrluA7UyYrQKAiJ/CeA7nXYcQytYMuxLfOztAceXhNnv0Z/TTBWfsaTxg
	 58SkTTEE0EnlMviiD0z0Ma5UDLTElED9a/2lTd6tZq+2zZPXfRDtsJG7SWuBmI+Xgi
	 GvzfKsu+NykxfwiGrayhSo4QDGOFEcTYYF1ECp+A=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 377D34010C;
	Fri, 16 Oct 2026 14:13:42 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Fri, 16 Oct 2026 14:13:39 -0700
Subject: [PATCH] sched/core: Use the scheduling context for remote ticks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-remote-tick-proxy-v1-1-272757a50a07@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAIKT0moC/x3MQQqAIBBA0avErBtIA4uuEi3EphoijVHCiO6et
 HyL/x+IJEwRhuoBoYsjB1+g6grcZv1KyHMx6EYb1SiDQkdIhIndjqeEfKNuu8Wp2ZrW9VC6U2j
 h/D/H6X0/2Wimy2MAAAA=
X-Change-ID: 20261016-remote-tick-proxy-237fc1da63c8
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Connor O'Brien <connoro@google.com>, John Stultz <jstultz@google.com>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-kernel@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185222; l=2995;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=Ad0n9ZA89xXmqMjwuB2q1H5LH+tJ6kFsoi5mEz/Sjfo=;
 b=b5KgE4ZZ0rnRAGDtBkn+qZ/eV6rzrIKZv3k1H32Kc1H2ycU7H6NP6Vcy90FEVQNawGEKxqypN
 WJu5vsYJ2vKDq26HLb63shL7D1wmMI1NviBVOfS1BAkhXacoGDtVAYK
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

sched_tick_remote() invokes task_tick() for rq->curr. With proxy
execution, rq->curr is the mutex-owner execution context while
rq->donor is the blocked task that supplies the scheduling context.

A mutex-blocked task remains queued for proxy execution. If that task
is SCHED_FIFO, or the only SCHED_RR task, sched_can_stop_tick() permits
the full-nohz tick to stop. find_proxy_task() can then select its mutex
owner as rq->curr while retaining the blocked task as rq->donor.

sched_tick() and hrtick() already invoke task_tick() for rq->donor.
Make sched_tick_remote() do the same. Keep rq->curr for the execution
time sanity check.

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Testing was performed on an Ampere Altra system with
CONFIG_SCHED_PROXY_EXEC=y and CONFIG_NO_HZ_FULL=y, booted with:

  sched_proxy_exec=1 nohz_full=78

On the unpatched baseline: 70dd4ee72eb2 (7.3.0-rc7), mutex locktorture
with four writers pinned to CPU 78 and RT boosting triggered:

  WARNING: kernel/sched/core.c:5895 at sched_tick_remote...
  Workqueue: events_unbound sched_tick_remote

This warning is WARN_ON_ONCE(rq->curr != rq->donor), demonstrating that
a full-nohz remote tick can run while the executing task and scheduling
context differ.

The patched kernel completed the same 10-minute workload without
scheduler warnings or locktorture failures.
---
 kernel/sched/core.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de6ebe3cb9a8cfa2e6104a2a4cd4515f739..14aab4cde12b4dc9cccf45087ca956ecec2aa379 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5885,14 +5885,9 @@ static void sched_tick_remote(struct work_struct *work)
 	if (tick_nohz_tick_stopped_cpu(cpu)) {
 		guard(rq_lock_irq)(rq);
 		struct task_struct *curr = rq->curr;
+		struct task_struct *donor = rq->donor;
 
 		if (cpu_online(cpu)) {
-			/*
-			 * Since this is a remote tick for full dynticks mode,
-			 * we are always sure that there is no proxy (only a
-			 * single task is running).
-			 */
-			WARN_ON_ONCE(rq->curr != rq->donor);
 			update_rq_clock(rq);
 
 			if (!is_idle_task(curr)) {
@@ -5903,7 +5898,11 @@ static void sched_tick_remote(struct work_struct *work)
 				u64 delta = rq_clock_task(rq) - curr->se.exec_start;
 				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 30);
 			}
-			curr->sched_class->task_tick(rq, curr, 0);
+			/*
+			 * Proxy execution runs the mutex owner in @curr on behalf of the
+			 * blocked task in @donor. The scheduler tick applies to @donor.
+			 */
+			donor->sched_class->task_tick(rq, donor, 0);
 
 			calc_load_nohz_remote(rq);
 		}

---
base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
change-id: 20261016-remote-tick-proxy-237fc1da63c8

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>


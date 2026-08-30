Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B911231A3B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075668; cv=none; b=swrj4qUmwO1aP9DpTC/v0rwhCcT+dwly7ylLXgPo4OW6Ms+6Mzgfhnq5d+gSuYb57E64CB40SEigxr64vLyk+4z/YtXvOoHykzRaLQxIT/jqqNiHA6N5NZH87h+CudCmk59+WIyk31JCNb9jqJhpf9EQf4VS3fBhjtdo4HRs2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075668; c=relaxed/simple;
	bh=HJX6rVGRzchhfl0LK5UYbAONX5xLucqG0vyAkcALXU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DSPl4Yj14BRGTz4hTx5da08kGGUdar5jbKWavcEsTuWv9pFmG5xsaeACidISfjVRsh1epVwERoK64n2OlaayqGMRxAjGky1rrEpijFH90dy8pYERuUTaGon8GzIfwbBvuc3V6/VlT2iLilp8kzHhalCmr5ewTn/cab3QXUjs3kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IYLHgWHz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IYLHgWHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788075666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aXoUJxuS1mRtVSrOpvHKE2/qrhG/UJoXo+mvRC6oA6Q=;
	b=IYLHgWHz5O+y9bhvAC8ric3NSCkfJTegboRel5ks+XGfZwnoJm0JI1PeQEPTbXhrJOOYJN
	Rg+Zj9f+1WUsfCindn3UfQ48fN+Z62kf2wsD47zHE9oaxS1EvlCESrmJOLCzGL6N17BgYg
	VDDzJ1xAIvDILX8OfjndADTtdUmUYDE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-JcjjZu-CMkGdY12_lXaVyw-1; Sun,
 30 Aug 2026 03:41:02 -0400
X-MC-Unique: JcjjZu-CMkGdY12_lXaVyw-1
X-Mimecast-MFC-AGG-ID: JcjjZu-CMkGdY12_lXaVyw_1788075660
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBF891956096;
	Sun, 30 Aug 2026 07:40:59 +0000 (UTC)
Received: from snishika-thinkpadp16vgen1.tokyo.csb (unknown [10.64.240.8])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6217930001A2;
	Sun, 30 Aug 2026 07:40:54 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	snishika@redhat.com
Subject: [PATCH] sched/rt,dl: Skip migrate-disabled tasks when picking a push candidate
Date: Sun, 30 Aug 2026 16:37:46 +0900
Message-ID: <20260830073746.2189355-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

A migrate_disable()'d RT task cannot be moved to another CPU, but the
scheduler still keeps such a task on that CPU's pushable list
(rq->rt.pushable_tasks) and still marks the runqueue RT-overloaded
(rq->rt.overloaded = 1). So the RT balancer keeps treating this CPU as
having a task to move away, and keeps trying to move the task, but the
push can never succeed. When the head is pinned, push_rt_task() does not
give up either. It falls back to pushing rq->curr instead, using the
per-CPU stopper, as added by commit a7c81556ec4d ("sched: Fix
migrate_disable() vs rt/dl balancing").

The CPU spends tens of milliseconds in this retry loop. The core is
isolated for real-time work, but during the loop nearly half of its time
is consumed by pushes that cannot succeed.

An ftrace capture of the affected CPU, with sched_switch enabled and
commit 94894c9c477e ("sched/rt: Skip currently executing CPU in
rto_next_cpu()") applied, shows where the CPU time went. Two SCHED_FIFO
tasks at equal priority shared the CPU, taskA migrate_disable()'d and
queued, taskB as rq->curr. In one 89 ms window, taskB got only 52 ms of
CPU. The other 37 ms went to the stopper thread.

The scheduler kept trying to push taskA, the pinned head of the pushable
list, fell back to pushing taskB instead, and woke the stopper 5204
times. Every one of those pushes failed and no task was moved. taskA
stayed runnable and queued the whole time, and never ran.

Pushing taskB fails on a re-check. find_lock_lowest_rq() drops the rq
lock to take the target rq lock, then checks again with
"task != pick_next_pushable_task(rq)".

The task being pushed is taskB, but the pick returns taskA, the head of
the pushable list. taskB is rq->curr, and set_next_task_rt() removes the
running task from that list, so taskB can never be the head. The check
expects a candidate taken from the pushable list, but the fallback
pushes rq->curr, which is never on that list. So the check fails every
time.

   .--> push-IPI arrives
   |          |
   |          v
   |     pushable head = taskA   ->  pinned, cannot be pushed
   |          |
   |          v
   |     so push taskB instead   ->  wake migration/N, a stop-class
   |          |                      thread, so it preempts taskB
   |          v
   |     re-check compares taskB against the pushable head,
   |     which is still taskA                        ->  give up
   |          |
   |          v
   |     nothing moved, taskA still queued, rq still overloaded
   |          |
   '----------'
         repeats every ~17 us, 5204 times, for 89 ms

   The loop cannot stop itself. Every round leaves the runqueue
   exactly as it was, so the next push-IPI does the same thing. In
   the capture it ended only when taskB went to sleep on its own.
   taskA was then picked locally and left the pushable list.

   CPU time per task in the window, from sched_switch:

     taskB         51.95 ms   real work
     migration/N   37.18 ms   nothing moved
     taskA          0.00 ms   queued the whole time, never picked
     idle           0.01 ms

   Counts over the same window:

      7667  push-IPIs handled on this CPU
     17481  pick_next_pushable_task() returned taskA, still pinned
      5204  find_lock_lowest_rq() gave up on the re-check
         1  push that actually completed
         0  migrations of taskA

   The CPU times and the window length come from the standard
   sched_switch tracepoint. The counts needed tracepoints added inside
   the RT balancer for this investigation.

The self-IPI path is closed by the rto_next_cpu() fix above, and that
part works. But the runqueue is still marked overloaded, because the
pinned task is still advertised as pushable. Other CPUs now send the
push-IPIs during their own RT balancing, and the same loop runs again.
Closing the self-IPI path did not stop a pinned task from triggering
push balancing.

A pinned task should never have been returned as a push candidate in the
first place. A migrate_disable()'d task cannot be migrated, so it
belongs in the same skip that was added for on_cpu tasks by
commit e0ca8991b2de ("sched: Make class_schedulers avoid pushing
current, and get rid of proxy_tag_curr()"). Add is_migration_disabled()
to the skip condition in pick_next_pushable_task() and
pick_next_pushable_dl_task().

With the skip in place, if the pinned task is the only extra runnable
task the helpers return NULL, push_rt_task() and push_dl_task() give up
early, and no stopper is woken. The pinned task then runs locally once
curr yields. If a task that really can be migrated is queued behind the
pinned head, it is now picked and pushed for real.

This makes the fallback that pushes rq->curr unreachable when the
pushable head is migrate-disabled. Nothing is lost, because that path
was always stopped by the re-check described above. In the capture it
ran 5204 times and moved nothing.

Fixes: a7c81556ec4d ("sched: Fix migrate_disable() vs rt/dl balancing")
Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
---
 kernel/sched/deadline.c | 4 ++--
 kernel/sched/rt.c       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 857dbe3519a8..0663c00c41c0 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3028,8 +3028,8 @@ static struct task_struct *pick_next_pushable_dl_task(struct rq *rq)
 	next_node = rb_first_cached(&rq->dl.pushable_dl_tasks_root);
 	while (next_node) {
 		i = __node_2_pdl(next_node);
-		/* make sure task isn't on_cpu (possible with proxy-exec) */
-		if (!task_on_cpu(rq, i)) {
+		/* skip tasks that cannot be migrated */
+		if (!task_on_cpu(rq, i) && !is_migration_disabled(i)) {
 			p = i;
 			break;
 		}
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e6e5f8a2caaf..85303add726d 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1872,8 +1872,8 @@ static struct task_struct *pick_next_pushable_task(struct rq *rq)
 		return NULL;
 
 	plist_for_each_entry(i, head, pushable_tasks) {
-		/* make sure task isn't on_cpu (possible with proxy-exec) */
-		if (!task_on_cpu(rq, i)) {
+		/* skip tasks that cannot be migrated */
+		if (!task_on_cpu(rq, i) && !is_migration_disabled(i)) {
 			p = i;
 			break;
 		}
-- 
2.55.0


Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED43D3DB655;
	Wed,  2 Sep 2026 07:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333731; cv=none; b=BJQ4sy9zfM5N4dkaZ4DrucjJ1AbgtMMPEIj4voezWhrSnezLZo86yHOy5AIlTt5saC2XBpcAl/uu3wCrGpJAoWhDLXk2aibVSrippfsbw831emRj9xocX6upmIvu+jaZFfvCKQeg6iwqRG3JEx9Zuv0Zy8thAJnvtPGv8UKRtrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333731; c=relaxed/simple;
	bh=v7x5imYCBXa3URJcWXtIK5ae5CgzNxymQAlt6znqHBg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=e/xrAEzB/dFAE2ZTlWiUhOCFxd0KwMQ4JkbO0RC7PbrC+xt7KEZ9QigWweMie9f9lcpEBmRnGj4If48Hnka24PJ8UJ6ZD9g6OYc+/lbIWx9cpEcWtWs5ZCkLCl4QBmYj/QqESaOhQNbTdcjsZ63yVdK8Ca8IwWkzpwbNXSpTchE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XdCUDHNZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fHGIKSzL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XdCUDHNZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fHGIKSzL"
Date: Wed, 02 Sep 2026 07:22:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788333725;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRw3POh5l+IRFA/VaNga4qYsshWebmhlp59YQ0keKUM=;
	b=XdCUDHNZVN/vSOJo+bkO0TIN66Nczev0xrF+tdFH/X6+g3rvpLjjfAzFefjGR8gcHCrjHT
	du1ALWGL6vFLtNuRP/DEBfRv4lqZdP65RnfwozYO8PLE22go1N2PWhn+9nb3k2hy4fUMkx
	pD9BBwQIXFnjbjY/Il5deTv2SqIUGA3ZmufrBfwLWpoist6wsx/wZA1cKNPyHedihMQx2c
	58ibVKCfJ/UDbkYkWNulxFvaoGE9qHB14psXyh41+7/2eVK+4ssSEaDvldv2Sv9tRC4qNH
	v0Vrrti380dB/2WXNN9H31jbulvSnYY4+8ded78Z3Q1Q81HX8zYzuWxSIU33dQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788333725;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRw3POh5l+IRFA/VaNga4qYsshWebmhlp59YQ0keKUM=;
	b=fHGIKSzLGZOGwHHfwtj2pOCNPsmUUDR4sKgGVFULfJC7KJXGcM2baMeNIjL71nWEvQhuEQ
	v84jrIlDpYxBVuAg==
From: "tip-bot2 for Seiji Nishikawa" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/rt,dl: Skip migrate-disabled tasks when
 picking a push candidate
Cc: Seiji Nishikawa <snishika@redhat.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260830073746.2189355-1-snishika@redhat.com>
References: <20260830073746.2189355-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833372384.3717435.9283330313829938009.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     dae5c0292080dd7b9c7d784268dcf443f1f3d15e
Gitweb:        https://git.kernel.org/tip/dae5c0292080dd7b9c7d784268dcf443f1f=
3d15e
Author:        Seiji Nishikawa <snishika@redhat.com>
AuthorDate:    Sun, 30 Aug 2026 16:37:46 +09:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:17:49 +02:00

sched/rt,dl: Skip migrate-disabled tasks when picking a push candidate

A migrate_disable()'d RT task cannot be moved to another CPU, but the
scheduler still keeps such a task on that CPU's pushable list
(rq->rt.pushable_tasks) and still marks the runqueue RT-overloaded
(rq->rt.overloaded =3D 1). So the RT balancer keeps treating this CPU as
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
"task !=3D pick_next_pushable_task(rq)".

The task being pushed is taskB, but the pick returns taskA, the head of
the pushable list. taskB is rq->curr, and set_next_task_rt() removes the
running task from that list, so taskB can never be the head. The check
expects a candidate taken from the pushable list, but the fallback
pushes rq->curr, which is never on that list. So the check fails every
time.

   .--> push-IPI arrives
   |          |
   |          v
   |     pushable head =3D taskA   ->  pinned, cannot be pushed
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
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260830073746.2189355-1-snishika@redhat.com
---
 kernel/sched/deadline.c | 4 ++--
 kernel/sched/rt.c       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 857dbe3..0663c00 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3028,8 +3028,8 @@ static struct task_struct *pick_next_pushable_dl_task(s=
truct rq *rq)
 	next_node =3D rb_first_cached(&rq->dl.pushable_dl_tasks_root);
 	while (next_node) {
 		i =3D __node_2_pdl(next_node);
-		/* make sure task isn't on_cpu (possible with proxy-exec) */
-		if (!task_on_cpu(rq, i)) {
+		/* skip tasks that cannot be migrated */
+		if (!task_on_cpu(rq, i) && !is_migration_disabled(i)) {
 			p =3D i;
 			break;
 		}
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e6e5f8a..85303ad 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1872,8 +1872,8 @@ static struct task_struct *pick_next_pushable_task(stru=
ct rq *rq)
 		return NULL;
=20
 	plist_for_each_entry(i, head, pushable_tasks) {
-		/* make sure task isn't on_cpu (possible with proxy-exec) */
-		if (!task_on_cpu(rq, i)) {
+		/* skip tasks that cannot be migrated */
+		if (!task_on_cpu(rq, i) && !is_migration_disabled(i)) {
 			p =3D i;
 			break;
 		}

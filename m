Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53F45199D;
	Fri, 16 Oct 2026 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137684; cv=none; b=rVw26hsL/XBaS5npKTwZuuEWy/Gj0iQgA5qoRrFFrg91redorvMKNlLUa8K7VjM8+vS229q8euL3jg3Zuj1tIjtjaVAx19wFdvBI9vsdKatphl7RXLUpg5WOl0oKQwFeTxQwA3F2L1LVoNh36K86xOO6nKb+5q4Y1bk1NwcHTes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137684; c=relaxed/simple;
	bh=KgeiPL4IdqgxfhyEZY0dK4ghIFWu2ixrSxY6B3QD+Tg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=nlYWpgXRWE4iR7jmdkZW+v50JzMHj28CLfvWXcCB0tXSb32OclaK3MiBURtIh85+NzZDZqO0r8hGfIjBcT73bp5w0QOI8mSQgjrGHLzJdfiv+1RrJPT8ORkiutigdXXmA6ygifFlOVusRv1kbMP0BXuBLPM/oiN/O0szxlLIIJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EGnmsGzk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WwwLjder; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EGnmsGzk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WwwLjder"
Date: Fri, 16 Oct 2026 08:01:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792137681;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7d/HX4K4prstI1I3JourTIqpVgeSukQrb+8R8A2dTAw=;
	b=EGnmsGzkhjCQYxKEMkhskpq/txKNaZRNPnQn3g5lJw/3KvH51KKKrxpqPEcdy4yOj6HrZr
	0zjwbigrPFFhamLjb8S1maNbR1nxoaSqx7DmVBEAdyiu0jPfu3YqZogo80iVrzCMHOWRun
	pb1FlGhxnEwWQGOb/0TeCiG4jxGhBH7bG9kAiV8HmJI5YZhMSpbLvqYd1zoPdu2NscYjWG
	XOnZD/+Tn5SLo4TV253fmRLpQLa3Yx3VZZg5spXyHEqPtQpIpJ2ckiy+PwdAi2vwhA+R06
	NaL+AJtdDCEyGoJuJnuY+H2bcQLDYE5R0+FmyTi1QGq+LPgK79zSVWl/QNiD0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792137681;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7d/HX4K4prstI1I3JourTIqpVgeSukQrb+8R8A2dTAw=;
	b=WwwLjderQXb6iBavkH39/M3ogDucvxo/5qxCXEEQ32iuAipLbMlBY1KaANXlxMctafKZcx
	DGXqTMX+dLfxdTBw==
From: "tip-bot2 for Shakeel Butt" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/psi: Remove the RCU wait from trigger destruction
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261010191500.3895736-1-shakeel.butt@linux.dev>
References: <20261010191500.3895736-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179213767937.2666988.13837414149970977922.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     6f88f6cbb0472a8481ba560578a1d7c8d802eba7
Gitweb:        https://git.kernel.org/tip/6f88f6cbb0472a8481ba560578a1d7c8d80=
2eba7
Author:        Shakeel Butt <shakeel.butt@linux.dev>
AuthorDate:    Sat, 10 Oct 2026 12:15:00 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 16 Oct 2026 09:49:03 +02:00

sched/psi: Remove the RCU wait from trigger destruction

In the Meta fleet, we found PSI trigger destruction waiting for an RCU
grace period while holding kernfs node_mutex, blocking other users [1].
File close and node drain hold this mutex while calling the release
callback. Cgroup removal and disabling cgroup.pressure also hold
cgroup_mutex during the drain.

The wait was added by commit 0e94682b73bf ("psi: introduce psi monitor")
to protect worker and trigger lookups. Commit 461daba06bdc
("psi: eliminate kthread_worker from psi trigger scheduling mechanism")
replaced the worker queue with a group timer. The scheduler now only
checks whether rtpoll_task is NULL; it uses neither the task nor the
trigger. Commit a06247c6804f ("psi: Fix uaf issue when psi trigger is
destroyed while being polled") removed trigger replacement and polling's
RCU lookup.

Trigger lists are protected by mutexes. Proc poll/select entries are
removed before their file references are dropped. eventpoll_release()
removes epoll entries before the file release callback.
Commit aff037078eca ("sched/psi: use kernfs polling functions for PSI
trigger polling") moved cgroup polling to a kernfs waitqueue whose
lifetime follows the file.

A late timer firing only wakes the group waitqueue. The system group is
static, and commit 5457025fa8ca ("sched/psi: Shut down rtpoll_timer in
psi_cgroup_free()") shuts down the cgroup timer before freeing the group.
Cgroup reclamation already waits for scheduler readers.

Remove synchronize_rcu() from psi_trigger_destroy() and use
rcu_access_pointer() for the worker NULL check. Keep kthread_stop()
outside the trigger mutex.

Tested trigger churn, notifications and cgroup removal in an 8-CPU VM
with KASAN, lockdep, and full and lazy preemption. No warnings were found.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Tejun Heo <tj@kernel.org>
Link: https://github.com/bpftrace/user-tools/tree/master/runnablelockmonitor =
[1]
Link: https://patch.msgid.link/20261010191500.3895736-1-shakeel.butt@linux.dev
---
 kernel/sched/psi.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 4e15241..7c53814 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -626,8 +626,6 @@ static void init_rtpoll_triggers(struct psi_group *group,=
 u64 now)
 static void psi_schedule_rtpoll_work(struct psi_group *group, unsigned long =
delay,
 				   bool force)
 {
-	struct task_struct *task;
-
 	/*
 	 * atomic_xchg should be called even when !force to provide a
 	 * full memory barrier (see the comment inside psi_rtpoll_work).
@@ -635,19 +633,16 @@ static void psi_schedule_rtpoll_work(struct psi_group *=
group, unsigned long dela
 	if (atomic_xchg(&group->rtpoll_scheduled, 1) && !force)
 		return;
=20
-	rcu_read_lock();
-
-	task =3D rcu_dereference(group->rtpoll_task);
 	/*
-	 * kworker might be NULL in case psi_trigger_destroy races with
-	 * psi_task_change (hotpath) which can't use locks
+	 * Only test whether a worker is installed; do not dereference the task.
+	 * A racing trigger destruction may leave the timer armed.
+	 * psi_cgroup_free() shuts it down before freeing the group.
+	 * The system PSI group is static.
 	 */
-	if (likely(task))
+	if (likely(rcu_access_pointer(group->rtpoll_task)))
 		mod_timer(&group->rtpoll_timer, jiffies + delay);
 	else
 		atomic_set(&group->rtpoll_scheduled, 0);
-
-	rcu_read_unlock();
 }
=20
 static void psi_rtpoll_work(struct psi_group *group)
@@ -1489,21 +1484,11 @@ void psi_trigger_destroy(struct psi_trigger *t)
 	}
=20
 	/*
-	 * Wait for psi_schedule_rtpoll_work RCU to complete its read-side
-	 * critical section before destroying the trigger and optionally the
-	 * rtpoll_task.
-	 */
-	synchronize_rcu();
-	/*
 	 * Stop kthread 'psimon' after releasing rtpoll_trigger_lock to prevent
 	 * a deadlock while waiting for psi_rtpoll_work to acquire
 	 * rtpoll_trigger_lock
 	 */
 	if (task_to_destroy) {
-		/*
-		 * After the RCU grace period has expired, the worker
-		 * can no longer be found through group->rtpoll_task.
-		 */
 		kthread_stop(task_to_destroy);
 		atomic_set(&group->rtpoll_scheduled, 0);
 	}

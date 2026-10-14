Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810FE4ED186;
	Wed, 14 Oct 2026 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983541; cv=none; b=bjKU2YwOuKX2xk0RH5gn/oGA93GvZ9Mm6+x/dKdG5yGRyp6hkDkxIHu1u6PRdo2Iv9JfqXcHhiF6SgPd2+wX5N6xzdQ17jvkpH7F1JsUO53ZH7cwL9Io+1hPn6HZz9BouVOYjfoFUaStCu8KTcUww6/2mGW7Ebn8BpDNl15Ra9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983541; c=relaxed/simple;
	bh=NxneYCIflsvsEZRPGoCtBUyP0yOD7vzlQ6i7w8hjWrQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=anbK+LmqaNo9iMDtnXqX4w9WDUEMf/mgrB1OJzJ2DBYWD5twPFWeSklPtYHeaBk0fQH7Yayp0I1hxdGnAXnXipc0aheQt/NDYLYAGJ39RzmsL0+REMjrQyiUDAts6qwi6eByFGygO3eVl7g368kiycyzKP2xuCDxrtunec780Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uyyNPXLT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MvTx+2rZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uyyNPXLT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MvTx+2rZ"
Date: Wed, 14 Oct 2026 13:12:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791983532;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sg8a1AWq1DZgo25v6mO/2Ou0Tya43Mawk5e/7lmJN+g=;
	b=uyyNPXLTbrg+0AYoh9+OrZDHkky/sVpv+lJG0hnhTGNLUPUriEOWneVV8VgLXSb1y6FeJH
	ZQeLlBh3dwei9hkMzD361tsXeNOKJVfvzrKRqY3ymuCjOVkP+sHcA67FowbUbxht3/Pdv4
	IRIwhQngLSaZrxKW5Dt+sqL8FzhE9GH9P6W7Zdtem3cW85kNou8e6Jg1h2KWFrTupRdwZd
	wdDi9WNqP0agBGF0mPecrC7dKdjYX+DY5DJU7zgd174TgXhEfCvJRCUu4a3Gx/DNiMCaw+
	lYCpzVT0/tUXfnTh9ONWKL1AWUli4eueFcusPYDq9c9zalJaa8BWBcBA3zihag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791983532;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sg8a1AWq1DZgo25v6mO/2Ou0Tya43Mawk5e/7lmJN+g=;
	b=MvTx+2rZeppM4BgcFCNByhqfwQWKDiGCWlk4XnsfQMPt0/QLRTr0DmNu3Wt2pAJwLgaLHz
	y0sLwW58bO7GBfBQ==
From: "tip-bot2 for K Prateek Nayak" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/core: Call wakeup_preempt() for queued
 tasks during class change
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Phil Auld <pauld@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013152455.9039-1-kprateek.nayak@amd.com>
References: <20261013152455.9039-1-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179198353096.1914040.12395770370352270768.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     118a2cf4ced60777a2408001e2b4838fed1cea55
Gitweb:        https://git.kernel.org/tip/118a2cf4ced60777a2408001e2b4838fed1=
cea55
Author:        K Prateek Nayak <kprateek.nayak@amd.com>
AuthorDate:    Tue, 13 Oct 2026 15:24:55=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 14 Oct 2026 15:08:33 +02:00

sched/core: Call wakeup_preempt() for queued tasks during class change

Paul reported recent RCU changes exposed a lost resched where CPU idles
with a rcutorture thread waiting while being completely runnable.

Dumping the rq state at the time of idling with runnable tasks showed
the following:

  rq->next_class =3D &fair_sched_class
  rq->nr_running =3D 1
  rq->cfs.h_nr_queued =3D 0
  rq->rt.rt_nr_running =3D 1

Although the waiting task was an RT task, "rq->next_class" did not point
to rt_sched_class and was stuck at the lower priority fair_sched_class.

Inspecting sched_change_end() revealed the following race with
__sched_setscheduler() for queued, but non-running tasks:

    CPU0                                   CPU1
    =3D=3D=3D=3D                                   =3D=3D=3D=3D

  __schedule()

    /*
     * rq->donor is a fair task that blocks.
     * rq->next_class =3D &fair_sched_class
     */

    rq_lock(rq0)

    pick_next_task()
      /* nr_running =3D 0 */
      pick_task_fair()
        sched_balance_newidle()
          raw_spin_rq_unlock(rq0)
                                    rq_lock(rq0)

                                    activate_task(rq0, p)
                                      /* p is a fair task */
                                      rq0->nr_running++;
                                      rq0->cfs.h_nr_queued++;
                                      wakeup_preempt(rq, p)
                                        rq->next_class =3D &fair_sched_class
                                        resched_curr()

                                    rq_unlock(rq0)

                                    __sched_setscheduler(p)
                                      /* p is moved to SCHED_RR */
                                      task_rq_lock(p)
                                      sched_change_begin()

				      rq0->cfs.h_nr_queued--;
				      rq0->rt.rt_nr_running++;

                                      sched_change_end()
                                        /*
                                         * p->on_rq =3D 1 (ctx->queued)
                                         * but p is not rq->donor
                                         * (!ctx->running) hence
                                         * resched_curr() is and
                                         * rq->next_class upgrade is
                                         * skipped.
                                         */

                                       task_rq_unlock()

          raw_spin_rq_lock(rq0)

          /*
           * rq->nr_running =3D 1
           * rq->cfs.h_nr_queued =3D 0
           * rq->rt.rt_nr_running =3D 1
           * rq->next_class =3D &fair_sched_class
           */

           if (rq->cfs.h_nr_queued && ...)
             /* Above is false */

           if (rq_modified_above(this_rq, &fair_sched_class))
             /* Also false since rq->next_class is still fair */

      /*
       * sched_balance_newidle() is considered to
       * have failed to pull any fair tasks and no
       * other wakeups were detected.
       */
       return NULL; /* pick_task_fair() */

    pick_task_idle()
      return rq->idle;

    next =3D rq->idle;

    /* Preemption indicators are lost */
    clear_tsk_need_resched(prev);
    clear_preempt_need_resched();

    rq->curr =3D rq->idle;

  !!! rq->idle switches in with rq->running =3D=3D 1 but !need_resched() !!!

In simple words, enqueue, followed by a class change of the newly queued
task goes unnoticed in rq->next_class indicator and
sched_balance_newidle() sees no fair task, nor any higher priority task
enqueued.

The above sequence will lead to CPU idling with a runnable task on the
CPU.

Call wakeup_preempt() for ctx->queued cases in sched_change_end() to
re-evaluate rq->next_class after class change (ENQUEUE_CLASS) and set
the NEED_RESCHED indicator accordingly.

Newidle balance will correctly see an enqueue of a higher priority
task if a queued task was upgraded when the rq_lock() was dropped and
will retry the pick.

Closes: https://lore.kernel.org/lkml/8fa7f795-518c-4507-b684-60b0c1cac2c5@pau=
lmck-laptop/
Fixes: 704069649b5b ("sched/core: Rework sched_class::wakeup_preempt() and rq=
_modified_*()")
Reported-by: Paul E. McKenney <paulmck@kernel.org>
Tested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Phil Auld <pauld@redhat.com>
Link: https://patch.msgid.link/20261013152455.9039-1-kprateek.nayak@amd.com
---
 kernel/sched/core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de..1754d9f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11327,18 +11327,17 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		if (p->sched_class->switched_to)
 			p->sched_class->switched_to(rq, p);
=20
+		/*
+		 * Check if the task can preempt the current in case the class
+		 * was upgraded. Note that none of the switch*_from() methods
+		 * know the new class and none of the switch*_to() methods know
+		 * the old class so we must resched here.
+		 */
+		if (ctx->queued)
+			wakeup_preempt(rq, p, 0);
+
 		if (ctx->running) {
 			/*
-			 * If this was a class promotion; let the old class
-			 * know it got preempted. Note that none of the
-			 * switch*_from() methods know the new class and none
-			 * of the switch*_to() methods know the old class.
-			 */
-			if (sched_class_above(p->sched_class, ctx->class)) {
-				rq->next_class->wakeup_preempt(rq, p, 0);
-				rq->next_class =3D p->sched_class;
-			}
-			/*
 			 * If this was a degradation in class; make sure to
 			 * reschedule.
 			 */

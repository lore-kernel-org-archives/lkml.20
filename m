Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4323D6CB0;
	Wed,  2 Sep 2026 07:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333731; cv=none; b=q5+Ef/plrCxIcG+dW9AYYaoGaz59vSZuClEZcOxyUHl5K7iwx7P68OmBnYof2dqRqOSAtmeexQ9L1bJVEKMBJI9t47QYWUb6JBh8As5h77w13VP0VfLUWdglGqV4Kxmc/mC1ZBcK15464lf5bXqbK6Jm51V7CBKS9hu4ihNLJHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333731; c=relaxed/simple;
	bh=MY/8k8XgAvr4md9y+8sRqClUUStRO/ZRS3Kyj3h602k=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hwOq095rCFPYD4rdFwpi7HUzW1xy/d2tyQyqcdcskYRaOkOymKHR0w2aRJKmufpd2Q/ipd/7i8R7V8w/tF1dYLY90566oVixwtxs/WoABxL5iE4biupv0xlij6oT+6ZhXgN8sR8SBVn0l83ioPq3Raldc3oRwY038ppVPn/Ju1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QavTzSOR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zD7yaSq8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QavTzSOR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zD7yaSq8"
Date: Wed, 02 Sep 2026 07:22:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788333726;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54wM1EGlq+fTcxjz7GsWLUWa9eM/y7ncDmhHG3ND7/4=;
	b=QavTzSOR94lKxXgfqVX+G9guDTK5JhZFrhkC6+yu1UNNzHTXJijQ1ZLtMXIuIwhGtX11km
	4ah2+KNt8vdSkh7wGANt7j4UBI73cSSSBZZR8pCJJAkYVccR528F3x96BJngjd+9ldpw8j
	Jd5BqGFehHvLPgfBFV1u2qSTCycDZrdOUmz3E/n64czt6h3S8Cyz0BhrcQ2dt9bbcrDw3m
	mkoHFaeoP8H3aoxz/6UAPfe7dOytyZm5/ust7Vc/GrF3YjrxMIokmCTGIiPb1Vm8xyt28e
	T7sBYKR2JgxKkPr9R4CNgDqgLVoljV51nebaAc6oC4qKabThMeXd15vCGzdKGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788333726;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54wM1EGlq+fTcxjz7GsWLUWa9eM/y7ncDmhHG3ND7/4=;
	b=zD7yaSq84GAKm8cxXnnH8ryCpRYGacRNFnKhCPdEcYZp1zR82ky+R83L4SFoCwvIM6Wtqy
	AIUUGQc98Viq8lBA==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/fair: Use update_curr_eevdf() for the
 remaining root cfs_rq callers
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260822105930.2352761-1-zhanxusheng1024@gmail.com>
References: <20260822105930.2352761-1-zhanxusheng1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833372528.3717435.3041801435295808244.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     1719d035a6fa90b7467b6daf45a573f5180013b2
Gitweb:        https://git.kernel.org/tip/1719d035a6fa90b7467b6daf45a573f5180=
013b2
Author:        Zhan Xusheng <zhanxusheng@xiaomi.com>
AuthorDate:    Sat, 22 Aug 2026 18:59:30 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:17:49 +02:00

sched/fair: Use update_curr_eevdf() for the remaining root cfs_rq callers

pick_task_fair() and yield_task_fair() call update_curr(&rq->cfs) to bring
curr up to date before they look at the eevdf state.  With cgroups that
does not happen: update_curr() reads ->h_curr, which on the root cfs_rq is
the top level group entity, and returns at the !entity_is_task() check
before touching vruntime.  Both then read ->curr, so the guard and the
update disagree about which entity they mean.

Counting how often ->h_curr and ->curr differ at pick_task_fair(), on one
CPU for 10s with three busy tasks and one 200us-periodic task:

  all tasks in the root cgroup        43321 calls,     0 no-ops
  busy tasks in G0, periodic in G1    45211 calls, 45193 no-ops

Whether that matters depends on what precedes the pick.  Since
commit 68e37487810a ("sched/fair: Fix flat hierarchy") the tick and
enqueue/dequeue all update curr correctly, so on the normal reschedule
path only the microseconds between those and the pick are missing, and I
could not measure a latency difference there.  Three paths have nothing
before them on that rq though:

  - pick_task() on the sibling rqs of a core under core scheduling
    (kernel/sched/core.c), which updates that rq's clock first for
    exactly this reason
  - fair_server_pick_task()
  - yield_task_fair(), where the stale value feeds the entity_eligible()
    test that guards forfeiting the remaining vruntime

There curr can be a full tick behind, as it was before that commit.

No new behaviour for the entity being updated: without cgroups ->h_curr
is already the task, so these two call sites already run the full
update_curr() including update_deadline(), dl_server_update() and the
resched_curr_lazy() at the end.  This makes the cgroup case do the same.

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://patch.msgid.link/20260822105930.2352761-1-zhanxusheng1024@gmail=
.com
---
 kernel/sched/fair.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff370..5d47de5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10057,7 +10057,7 @@ again:
=20
 	/* Might not have done put_prev_entity() */
 	if (cfs_rq->curr && cfs_rq->curr->on_rq)
-		update_curr(cfs_rq);
+		update_curr_eevdf(cfs_rq);
=20
 	se =3D pick_next_entity(rq, true);
 	if (!se)
@@ -10160,7 +10160,7 @@ static void yield_task_fair(struct rq *rq)
 	/*
 	 * Update run-time statistics of the 'current'.
 	 */
-	update_curr(cfs_rq);
+	update_curr_eevdf(cfs_rq);
 	/*
 	 * Tell update_rq_clock() that we've just updated,
 	 * so we don't do microscopic update in schedule()

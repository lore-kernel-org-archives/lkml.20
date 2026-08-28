Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4868340B0E9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913697; cv=none; b=mrJKsyhq7IIqdrIuyqAeO6xGTxKSOeQIficbG6H6b32hRM+/hx0iboMYQqOyXo9DnXUMWmbb5mI3DNzAKrAqp+uV8BNlrF8TxiWH/nQQsINS1RKF1SYl69Me/7PtrekKT/GHwaMcZ+PtDTeRmaXnS/r0j1ksYOWILJkHoGV/Tys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913697; c=relaxed/simple;
	bh=dFrvw7iTZKmBzwV15Z42JzPl17IL7wCOJV+mM/6ClzE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=msky4EsGohylGr6KqlGULtzLTLobCLTD8KUSCXS+u7UjdZqlyieRNjss/K8uUapXe0wIDa0oEsBN3aS7QN/l3x5PPKoQPOWyNidxqzHJ5H4ClIcdH1UC3c1sj3tdGZa+beOOnUgw5uO83wveaLO0FwaU52TU5gcZAG+Wo1wQGfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vlVJ5sm9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vlVJ5sm9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=gTNkLy3rzRLHf/Y7wVAVEU5GaJWvM4O0ubkGWvEOWH0=; b=vlVJ5sm9iNp72Nr+n07hW3uG3l
	GLQVkPhOkoCFkd/zjrNB9Kygwc0bxp83QEOlggthTQEp0R1G3lT6DQ2/ZHYxE50dnE/5L+kR9FHLQ
	VY9vz5lbNvpjoyHW5xTG76Yte0UAtGYmbxriCzZs2d8I6KNo7qK41loRYVng5d/l8DsbYTaYQa8h3
	oUx7su7K71eKqJrypbo53c4A0aneIGuSG5WkGyEFwKB2My5wgJbKQ9Fft59xymd6qFO+XCsHIn9M8
	cvZFtzv+a+ykODKR78VCg7eEzLDQr+srhMb0i8shBAwlEC76vpLs8tCTNw3blE8cs6lT7pAaHb2YX
	bCN6JCNg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu1S-0000000EWAf-43jM;
	Fri, 28 Aug 2026 10:41:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D31FC30116A; Fri, 28 Aug 2026 12:41:21 +0200 (CEST)
Message-ID: <20260828104018.378378994@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 12:17:00 +0200
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
 tj@kernel.org
Subject: [PATCH 1/7] sched/core: Fix pick_next_task() self recursion
References: <20260828101659.812011872@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

It is possible for another sibling to end up in pick_next_task() when:

  pick_next_task()
    pick_task()
      sched_class::pick_task()

drops the core wide rq->lock. In this case they end up trampling the core wide
task selection state, possibly leading to NULL derefs. Detect this case by
keeping a local copy of core_task_seq, a value that is incremented on
{en,de}queue and schedule.

Since RETRY_TASK is only possible when a higher priority task gets enqueued
during the lock break, this must mean core_task_seq will also be incremented
and is thus completely covered by the seq number mismatch.

XXX words on forward progress go here

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6232,14 +6232,14 @@ static struct task_struct *
 pick_next_task(struct rq *rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
+	bool core_clock_updated = (rq == rq->core);
 	struct task_struct *next, *p, *max;
 	const struct cpumask *smt_mask;
+	int i, cpu, seq, occ = 0;
 	bool fi_before = false;
-	bool core_clock_updated = (rq == rq->core);
+	bool need_sync = false;
 	unsigned long cookie;
-	int i, cpu, occ = 0;
 	struct rq *rq_i;
-	bool need_sync = false;
 
 	if (!sched_core_enabled(rq))
 		return __pick_next_task(rq, rf);
@@ -6314,7 +6314,7 @@ pick_next_task(struct rq *rq, struct rq_
 	 * However, preemptions can cause multiple picks on the same task set.
 	 * 'Fix' this by also increasing @task_seq for every pick.
 	 */
-	rq->core->core_task_seq++;
+	seq = ++rq->core->core_task_seq;
 
 	/*
 	 * Optimize for common case where this CPU has no cookies
@@ -6362,7 +6362,8 @@ pick_next_task(struct rq *rq, struct rq_
 			update_rq_clock(rq_i);
 
 		p = pick_task(rq_i, rf);
-		if (unlikely(p == RETRY_TASK)) {
+		if (unlikely(seq != rq->core->core_task_seq ||
+			     WARN_ON_ONCE(p == RETRY_TASK))) {
 			/* rq lock may have been dropped, clocks invalidated */
 			core_clock_updated = false;
 			if (!(rq->clock_update_flags & RQCF_UPDATED))
@@ -6392,7 +6393,7 @@ pick_next_task(struct rq *rq, struct rq_
 			if (cookie)
 				p = sched_core_find(rq_i, cookie);
 			if (!p)
-				p = idle_sched_class.pick_task(rq_i, rf);
+				p = idle_sched_class.pick_task(rq_i, NULL);
 		}
 
 		rq_i->core_pick = p;



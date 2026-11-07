Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052975;
	b=EYNRreTgMBJQwbfaYRRkbEu36nwoF6QeVpAArmjQIImW5GNX7VQ3MokPA23feat00lSf
	 MFSxmy4FEDbQhv27nSkNZYp5zCSmGuC/bbyRYvZ39cW/7aUnmRjutfnzO61P80BZPW+gV
	 N8N717Xwzoi30AIYbTBuOOHUNSxkHfFGJ7Nj/ab3J727OX08Mnn3E0ivAiGta0WnEJPxB
	 L6ppI82qXGzTjZP/9xTNDwh+C1RmfBtz39N4QERq8h++ulJDwwszkoNfVtHizz76ZVDYi
	 AMFZImjZ0Q195ss71CQW/j3WYJ7AryMkq6IysfQ5ObazDh54LXIpwEd3rz1u1nPsI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052975;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=f7LSXLloQkd9WHHu+aKsH8pQHoRK1w7Pu2YnZg9CtSs=;
	b=euz8DZ1RN5x/sZDD7FQdHcKkdrYiMgha9tgvhgrbHSBqmj+g85QLZXrLN4mloNq1/YfK
	 KwHLKKVdGRioRHF0T+BStUh3ckMLxgD5+dETZZTjBYMmC1b2aVuYSdYrqUF0SwOhioNGf
	 8+ES3sLT4U9LUnGSDqpLS/6b6OD1cZq4pV4GR9TJtenQl7vuSUMKQX3JNyg19iwY3zDCD
	 TMZH3AQgaUFyYU06u1MOM+OeJXeDMZewEgSe8J0jv2MtumecBg7BRJNgmxgy+WTz1d18t
	 7dAb2YuoFxAzXUlozLpmP3ugvQrhF+s3JAdKxBktkFriAoies1ZIss5PJdMXrQMgMTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b="IiN9m/P7";
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8729D606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8729D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=IiN9m/P7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=f7LSXLloQkd9WHHu+aKsH8pQHoRK1w7Pu2YnZg9CtSs=; b=IiN9m/P7bCCcSJktjqXFwuXtr4
	xUOmUEXkTl+RxtIS0ddeON2N//N/ULY5DnfZCG3lNqgJC096G9WIx9r7Pdie2ho3PsWEZuizlPRYT
	IrYIoASmzVA9pq8geYidoL+uw8letkwSdHsXOxV3+hUQ6zrxiRCNoYJUjWAoWErcFjHD0zMO10zwX
	bhZGUIldwkhLZ5ulC41f1J8QqGNv1lGdnh6+Tmhhrvq1NtqbBt4fsEjb5E8PtQG1r9rlIwckCtc0A
	Yt6PJ3IBtpUOQ+PKjCV3Re+AzLz5TJvH5LQtFIHswErjpQCLPllCCXZAoWl4MqUR6Hh6ZmGE4PGOZ
	uFkHE1sQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf89-000000008xG-2Eto;
	Sat, 07 Nov 2026 12:02:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 12D6630057E; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120206.744550421@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:14 +0100
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
Subject: [PATCH v2 01/12] sched/core: Fix pick_next_task() self recursion
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

If there are forward progress issues; those might possibly be solved by using
core_pick_in_flight.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |   22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6296,14 +6296,14 @@ static struct task_struct *
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
@@ -6377,7 +6377,7 @@ pick_next_task(struct rq *rq, struct rq_
 	 * However, preemptions can cause multiple picks on the same task set.
 	 * 'Fix' this by also increasing @task_seq for every pick.
 	 */
-	rq->core->core_task_seq++;
+	seq = ++rq->core->core_task_seq;
 
 	/*
 	 * Optimize for common case where this CPU has no cookies
@@ -6394,6 +6394,15 @@ pick_next_task(struct rq *rq, struct rq_
 		}
 
 		if (!next->core_cookie) {
+			/*
+			 * pick_task() can drop the core rq lock through
+			 * newidle balance. If a sibling established a
+			 * core-wide cookie while the lock was dropped, the
+			 * uncookied no-sync fast path is no longer valid.
+			 */
+			if (unlikely(rq->core->core_cookie))
+				goto restart;
+
 			rq->core_pick = NULL;
 			rq->core_dl_server = NULL;
 			/*
@@ -6425,7 +6434,8 @@ pick_next_task(struct rq *rq, struct rq_
 			update_rq_clock(rq_i);
 
 		p = pick_task(rq_i, rf);
-		if (unlikely(p == RETRY_TASK)) {
+		if (unlikely(seq != rq->core->core_task_seq ||
+			     WARN_ON_ONCE(p == RETRY_TASK))) {
 			/* rq lock may have been dropped, clocks invalidated */
 			core_clock_updated = false;
 			if (!(rq->clock_update_flags & RQCF_UPDATED))
@@ -6455,7 +6465,7 @@ pick_next_task(struct rq *rq, struct rq_
 			if (cookie)
 				p = sched_core_find(rq_i, cookie);
 			if (!p)
-				p = idle_sched_class.pick_task(rq_i, rf);
+				p = idle_sched_class.pick_task(rq_i, NULL);
 		}
 
 		rq_i->core_pick = p;



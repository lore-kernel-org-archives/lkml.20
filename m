Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49097412269
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913698; cv=none; b=HfwCmw8BxuDnN1Vy3cWCzAKhnjhbBH3Oc1LQ/qxA883edpUEmsNx8LRBFIR2uOhYnfq5HtKKIcvwUbGyf4xf3wmtbEKZ+NMovK73n3uiu9YZt2JmyebmF91qHk0IOctjOtusgR549/OR+MCTqZ4dyRkpnbIPFepniNwKY9gJBJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913698; c=relaxed/simple;
	bh=JMBO9qmA5Afi8bgoVEUXd5gFEHvi1M2OJqPUFjg48/4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Jm5SEX6NszvRmMJ3LlOPSAm8W/Ch26MJtYdhJhAyTU9/cb4VyvE3gxU4ZZu0sJyd4yz6MESL/xBT0fMMZOa6XV236YSwcjoyZrwoyj7eG7pREBFoGepzqJLl9aeKMi9DyJuvSGokPpFURvxxPKCFD+QeVrh/qtlrpBslFb+Q/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mWKtdMuS; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mWKtdMuS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Prd8jwZtb58rorDXxvOktZtmgJu0zmfUkoaaXtifMuc=; b=mWKtdMuSVQVBXsHipw5PIy4OTv
	fn4Uckfbedg3u3A/5iBtD5Jn1e41XGOAMpzB2OEuwkgKRb9ixHn6zU3mclFBAyImB5n/1YNijSBYS
	cNrpAXc0327SqYOc5pNGjGXrjUv6zye3Yn7V42+0ysUpqovjaAGTgUT/Pl4+Dsxd6lDQwpS3KFnrJ
	sWr2f1EfL5tl6nqMaFsw+t4F0ZqIlVqVvMTh210gheT3IlAqUe0srOvhVZwZQvUho+gabvsL0Wb7c
	kfSx7QjwjW9rY1xnfmATj6ELWEm8H7tBco4FD579mXbhTA7N4mVYwLAlUL7Ts+pc7Sn7uOD9XHkHV
	KeK6AatQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzu1T-00000008CEc-1JwK;
	Fri, 28 Aug 2026 10:41:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id DE3543030A6; Fri, 28 Aug 2026 12:41:21 +0200 (CEST)
Message-ID: <20260828104018.681741017@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 12:17:03 +0200
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
Subject: [PATCH 4/7] sched/rt: Add early exit on balance path
References: <20260828101659.812011872@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Add/make consistent an early exit on the balance_{rt,dl}() path. When there are
no pushable tasks, there is no point in taking the rq lock and all that jazz.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/deadline.c |   10 +++-------
 kernel/sched/rt.c       |    3 +++
 2 files changed, 6 insertions(+), 7 deletions(-)

--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3250,17 +3250,13 @@ static void pull_dl_task(struct rq *this
 				   src_rq->dl.earliest_dl.next))
 			continue;
 
+		if (!has_pushable_dl_tasks(src_rq))
+			continue;
+
 		/* Might drop this_rq->lock */
 		push_task = NULL;
 		double_lock_balance(this_rq, src_rq);
 
-		/*
-		 * If there are no more pullable tasks on the
-		 * rq, we're done with it.
-		 */
-		if (src_rq->dl.dl_nr_running <= 1)
-			goto skip;
-
 		p = pick_earliest_pushable_dl_task(src_rq, this_cpu);
 
 		/*
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2303,6 +2303,9 @@ static void pull_rt_task(struct rq *this
 		    this_rq->rt.highest_prio.curr)
 			continue;
 
+		if (!has_pushable_tasks(src_rq))
+			continue;
+
 		/*
 		 * We can potentially drop this_rq's lock in
 		 * double_lock_balance, and another CPU could



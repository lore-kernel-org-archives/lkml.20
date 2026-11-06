Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955212;
	b=QT0zHsbBkIfe9oz0TUXydkgCmLpQeGF5CI5Gr2V/DVACf1AcXy9vb9d/Yu/2ueQHWlRL
	 qskDnDc6iS4RX6Iyvhs3Yik9QGJdTufYkNjTL57AAtPme+iLp0FudT8S45LmCrr5u9Znp
	 sBCXACV+i2BWBN7Ijbz0MPSAv6n7Plfgaxxbg3VbDAj94gMNWuATsv43Wjz+Avo6H0lcZ
	 yK3tp6Vg0EL7TxcNtYWEybiB5iT45gYrX/U/zrCznrtI8MgHxy3/3PJdsKVywVasEaLtZ
	 VaaM56JtUBnLrwFekc7NA+5QDyHUOAYn13qbPCgZMpFHKwI9rX3wLp8HAAD5lFmq+PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955212;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=McsrHN1OLvADKIlnH9mAKDVt7MK1OnBq7IFPGjbrecM=;
	b=IWGw3FZdlvZSWuOaAYQ1xaJB5dRpSdcP5kbYNwuOvshmp75stAyH3arCzdtoqKZrxGvY
	 Q8o7GhBrvX0pL0bdHsCuWKa/JcN/Y3Vy9DkRnMJDQq5dJJdyHfl0TlSxPRembcA8+JF3A
	 oiCpi/kCu5AQPr0tsEby36C3p2+Oh0zv1rolp3eYm/92Sdk7vOdqVfyY2YzRO0tbCXoeQ
	 PcD8bnbOZg2cfNcJCHPRLoQdf0ZcUYEBOoY8fwDuwUXVmdPu6KgUOQpjgI8jVL5l+KjXH
	 dSlHYLJkDq25glqrAPiL807Kn/gnHiNLZYqh+6i3xQdNx7PMZWisc4fb6V5NI0aq5CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=h8fQ3Sgq;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9B606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F9B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=h8fQ3Sgq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=McsrHN1OLvADKIlnH9mAKDVt7MK1OnBq7IFPGjbrecM=; b=h8fQ3SgqdurAZqrSrpnn4U+7v3
	XTWWQxACJIOKJsD82+JTNVHh3oLg7ogpG8l8/70/TgefYe88R3RLRhdb2ixGpo9pZqdtwXfT1WjjN
	bIuJzv9W1941HVf3JUixXYxyuroEwgtZysLbUad61eNS3E+4+rn8pk48xxV/P2aiLbL87QxyBYt5P
	3qCiUJ1rFy4/xRrj0IAx9pWCh09FdQEPva1IhcCx4qsE2BPfA8QCWmmpgQSgnLUbj4NrZWmJdErsh
	8i8LfTztVL+JCMybRAtBIyl/WgYK64+WL/r3RNMSnh282DWGluEH34ZXe3OHG6R8oupXuvCCpBuCR
	wYG/fcSA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFhK-00000002FyW-088u;
	Fri, 06 Nov 2026 08:53:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E7313300302; Fri, 06 Nov 2026 09:53:20 +0100 (CET)
Date: Fri, 6 Nov 2026 09:53:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, joshdon@google.com,
	tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <20261106085320.GB1922751@noisy.programming.kicks-ass.net>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
 <auzB7x4lVcFmTVMs@scheduler.schedules>
 <20261106083106.GC1779021@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106083106.GC1779021@noisy.programming.kicks-ass.net>

On Fri, Nov 06, 2026 at 09:31:06AM +0100, Peter Zijlstra wrote:
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -15594,8 +15594,10 @@ static void set_next_task_fair(struct rq
> > >  		hrtick_start_fair(rq, p);
> > >  }
> > >  
> > > -void init_cfs_rq(struct cfs_rq *cfs_rq)
> > > +void init_cfs_rq(struct cfs_rq *cfs_rq, struct cfs_rq *parent)
> > >  {
> > > +	if (parent)
> > > +		cfs_rq->idle = parent->idle;
> > 
> > AFAICT this creates a race:
> 
> > Or am I missing something?
> 
> Nah, you're right, this needs rq->lock.

Something like so..

---
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8970,7 +8970,7 @@ void __init sched_init(void)
 		rq->nr_running = 0;
 		rq->calc_load_active = 0;
 		rq->calc_load_update = jiffies + LOAD_FREQ;
-		init_cfs_rq(&rq->cfs, NULL);
+		init_cfs_rq(&rq->cfs);
 		init_rt_rq(&rq->rt);
 		init_dl_rq(&rq->dl);
 #ifdef CONFIG_FAIR_GROUP_SCHED
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15594,10 +15594,8 @@ static void set_next_task_fair(struct rq
 		hrtick_start_fair(rq, p);
 }
 
-void init_cfs_rq(struct cfs_rq *cfs_rq, struct cfs_rq *parent)
+void init_cfs_rq(struct cfs_rq *cfs_rq)
 {
-	if (parent)
-		cfs_rq->idle = parent->idle;
 	cfs_rq->tasks_timeline = RB_ROOT_CACHED;
 	cfs_rq->zero_vruntime = (u64)(-(1LL << 20));
 	raw_spin_lock_init(&cfs_rq->removed.lock);
@@ -15648,7 +15646,7 @@ int alloc_fair_sched_group(struct task_g
 			goto err;
 
 		se = tg_se(tg, i);
-		init_cfs_rq(cfs_rq, tg_cfs_rq(parent, i));
+		init_cfs_rq(cfs_rq);
 		init_tg_cfs_entry(tg, cfs_rq, se, i, tg_se(parent, i));
 		init_entity_runnable_average(se);
 	}
@@ -15661,19 +15659,20 @@ int alloc_fair_sched_group(struct task_g
 
 void online_fair_sched_group(struct task_group *tg)
 {
-	struct sched_entity *se;
-	struct rq_flags rf;
-	struct rq *rq;
 	int i;
 
 	for_each_possible_cpu(i) {
-		rq = cpu_rq(i);
-		se = tg_se(tg, i);
-		rq_lock_irq(rq, &rf);
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, i);
+		struct sched_entity *se = tg_se(tg, i);
+		struct rq *rq = cpu_rq(i);
+
+		guard(rq_lock_irq)(rq);
+
 		update_rq_clock(rq);
 		attach_entity_cfs_rq(se);
 		sync_throttle(tg, i);
-		rq_unlock_irq(rq, &rf);
+
+		cfs_rq->idle = tg_cfs_rq(tg->parent, i)->idle;
 	}
 }
 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955727;
	b=Ah20UQ51jM7IemDdGPdt4UhJ8sn2knK2xGwkOGiDx3suRHjdodjN3htmX1310UlyNkJh
	 AiYhTeJOxfPMT7a3KrQZEtH7fGsvaLk6nPy3aI8lKDjtVTe0ZWOoTHFqc35TFwxJRC735
	 cf1qeSuRNzycF2psliwkxVet1Q8Jtcg09RAXRUlRin5uUKPHq7YaSpS7VjdsLe/1l1UJW
	 pnuCqUN9P+TvCoh3cBqOYAVYze0F9CVRumqsJFSGgC0t9jEtmUKqb3qH2Dha45cLTR6os
	 OzTrBSuH4ir09oXWBMaOV8YaiYbk6E4IOjLhhtE66GSn2fBltfGPLQFtG0ueQm6huOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955727;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CuWyynZvQW4q5L3nWEhe4ZZZaEyaXbxC48e5/yJQ1/w=;
	b=ZFits1kwMS9njQmfSfLF//Gq6wUETx9yQazgJQt9c0zwgxF9aqj2qAiXuq+yur7kg4oF
	 TZUwmje2/bs5Ku8n2wg9+eewj+HPiuI8JlFsuyls8tL7/R6TAQVOYUC9E32JmpuGSIpnl
	 jvXhLcL/+zvD9llk1sigmChtD2Dyd3YLWDFUz2hnngxyat8ODgxLcKSImAoh72OSzQHTC
	 BdOEI623EJQS9xw4WdSZ904zTatZJcFQzRdGHj1ygMHxvdzBd6jE48Bq+NNqnLQ1mMwt+
	 TUxQmpHNd3V7tECPbIZeRQC9BUgAApg5FdtlUI0iifA3qOYEY4aP/sOvfnEreg1mf8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b="PQ1q7N/7";
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DBE606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93DBE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PQ1q7N/7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CuWyynZvQW4q5L3nWEhe4ZZZaEyaXbxC48e5/yJQ1/w=; b=PQ1q7N/7Lj5MaJMuhGPvk1X0HB
	0jsYY56jpRASFIs8/isyXZ9+E60W1CNAQ1/35gPryQVXXYRGe4qiKi2TqrdTIu5BgyCqe7deSvysw
	LJh/T3p40LcomnZ/AzNCf7Q8cN5J+szIgSRhTdlAJM8clm9OBe0JKopyBVKBzQXdaVVom9hNt2Y/b
	2oUHOaI0bW/JH4QZDmdfDp3EESnEF5uk255gUxavU6HYxhG+gOnPyN/x5c9osj+Ly0+CgyNF2Gluh
	hAwihgWNVVemnmi4ipDESGFGHI9yfCBEYg89dMhNmdTfB+GRruVCfPIEBBSL9a8OpidNmSz9dZPy5
	97qrk0Bg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFpa-00000002K38-0MtL;
	Fri, 06 Nov 2026 09:01:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A6887300302; Fri, 06 Nov 2026 10:01:53 +0100 (CET)
Date: Fri, 6 Nov 2026 10:01:53 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, joshdon@google.com,
	tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <20261106090153.GD1779021@noisy.programming.kicks-ass.net>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
 <auzB7x4lVcFmTVMs@scheduler.schedules>
 <20261106083106.GC1779021@noisy.programming.kicks-ass.net>
 <au2VkE9005PlW8VN@scheduler.schedules>
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
In-Reply-To: <au2VkE9005PlW8VN@scheduler.schedules>

On Fri, Nov 06, 2026 at 11:57:03AM +0300, Kayra Cizmeci wrote:
> On Fri, Nov 06, 2026 at 09:31:06AM +0100, Peter Zijlstra wrote:
> > On Thu, Nov 05, 2026 at 10:20:00PM +0300, Kayra Cizmeci wrote:
> > > On Thu, Nov 05, 2026 at 05:55:27PM +0100, Peter Zijlstra wrote:
> > > > Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> > > > all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> > > > is marked idle somewhere along its ancestral path.
> > > > 
> > > > This makes se_id_idle() behave differently. Notably is will now be true
> > > > when there is a idle cgroup anywhere in the ancestor path. This
> > > > addresses an issue where preemption of cgroup::idle was overlooked when
> > > > flattening the runqueue.
> > > 
> > > How? The diff doesn't touches se_is_idle(). se_is_idle() just looks to
> > > the policy for tasks:
> > > 
> > > static int se_is_idle(struct sched_entity *se)
> > > {
> > > 	if (entity_is_task(se))
> > > 		return task_has_idle_policy(task_of(se));
> > > 	return cfs_rq_is_idle(group_cfs_rq(se));
> > > }
> > 
> > > Or am I getting something wrong?
> > 
> > cfs_rq_is_idle() := cfs_rq->idle > 0
> > 
> > and cfs_rq->idle is now getting incremented for the whole subtree. So if
> > any ancestor is idle, this is now true.
> 
> 
> Yeah, it is for group path. But we call se_is_idle for tasks in
> wakeup_preempt_fair(). Not groups, no?

Ah, that's what you meant. So we should do something like:

	if (entity_is_task(se))
		return task_has_idle_policy(task_of(se)) || cfs_rq_is_idle(cfs_rq_of(se));
	return cfs_rq_is_idle(group_cfs_rq(se));


no?


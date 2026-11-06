Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953878;
	b=EwCkvUL7OzpmKBIDUWIxQP2LnVi31hFBmfbInDzJz34sBG0gW40XMcF0nQZvfgx5uc6f
	 Q6R1o0PwdJEcqeHAfphxppUxUsTG3gjxoxpBKjBziwQZx/zESOw+FW072lMcAzkXx+u/C
	 h8MBW9tEWCe3riU9tU1X0Q2zBEkrvlEHO6N7loFM4wvWLkfLq7m1S+IlX0FwvMbVCif46
	 5kThBG/seEg2WYH7SZUAsw0gbLcNzoFn3dN8tGZaFtjCG59HW7DW5c5qa4lAPQ+88NHla
	 MbbffOkAO/HbvahASvpb213IlTwMtAli1C9h+hmf/dXIw96XBHPZ0zYnkCjJNAavEIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953878;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4jNCFbyCB/Vu8kY+F6l8sQpNAWlz5UlpBMsBVseO/Mc=;
	b=PWgQ012PTJaUcyeDSX1nCHuBqV3xSltmmpSEp1UZBYwB8mWx3F8mgSLQFY4OeTKP6Jfr
	 uuU0Y2UCMh4z3QpMcOmZBa9soRjiiwYgsVwu8IJIdmmo3xYVmCEt1dyEKbxa0KOHjvNs7
	 eMlwC94VAsf+v+BrXJjq9hTERFIF8lHQDteREovtqr2Bl87iG1k6LX5KoQTOzGVT+gi7T
	 E+gWYWjCaVHT89Rs29jRVm8wI1VNxyQif2mpu/+RoQAnwBmX13gg17COxLCDE7rko9HpH
	 Oz6NeHQkWEhRZjMGthtLv3gWlG+t4c0LSMgMFNtn4scoDGOfW3eyyZeiSAui6q0S5Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BsSU43iy;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823DB606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 823DB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BsSU43iy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4jNCFbyCB/Vu8kY+F6l8sQpNAWlz5UlpBMsBVseO/Mc=; b=BsSU43iyCBTF5NH1+04aupAp7C
	elIyQyQj7eUnieW+JDxotp7YMDlRftSPBpT5YXRLX1C402yqyEo6vRU8n5d4Zo0CbHfJGOAbtY37y
	SlXrnOIFKWXCpIWqwXfpI6aLGj+Bh5u2l8QIpvHF6B/ig7DxWzsSYeBJmfSnUqhWios5GrZH5UNOO
	5WZZTrtER5ZSjp4H0aka8CirNy1xeUnKHf80ADzS8sAzuXQK5xy66W8Q9k4PDzOYW4jNKLMVYbfPm
	YpcG7GMkvdRO86BjGL2M3DS3Kx9KKHbP931Ewu2R2uORV+wug0XimUiFlRGVQk3PaRMlum6jIyenK
	8PMd6qaw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLn-00000003zSQ-3fcx;
	Fri, 06 Nov 2026 08:31:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4E2AC300302; Fri, 06 Nov 2026 09:31:06 +0100 (CET)
Date: Fri, 6 Nov 2026 09:31:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, joshdon@google.com,
	tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <20261106083106.GC1779021@noisy.programming.kicks-ass.net>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
 <auzB7x4lVcFmTVMs@scheduler.schedules>
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
In-Reply-To: <auzB7x4lVcFmTVMs@scheduler.schedules>

On Thu, Nov 05, 2026 at 10:20:00PM +0300, Kayra Cizmeci wrote:
> On Thu, Nov 05, 2026 at 05:55:27PM +0100, Peter Zijlstra wrote:
> > Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> > all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> > is marked idle somewhere along its ancestral path.
> > 
> > This makes se_id_idle() behave differently. Notably is will now be true
> > when there is a idle cgroup anywhere in the ancestor path. This
> > addresses an issue where preemption of cgroup::idle was overlooked when
> > flattening the runqueue.
> 
> How? The diff doesn't touches se_is_idle(). se_is_idle() just looks to
> the policy for tasks:
> 
> static int se_is_idle(struct sched_entity *se)
> {
> 	if (entity_is_task(se))
> 		return task_has_idle_policy(task_of(se));
> 	return cfs_rq_is_idle(group_cfs_rq(se));
> }

> Or am I getting something wrong?

cfs_rq_is_idle() := cfs_rq->idle > 0

and cfs_rq->idle is now getting incremented for the whole subtree. So if
any ancestor is idle, this is now true.


> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -15594,8 +15594,10 @@ static void set_next_task_fair(struct rq
> >  		hrtick_start_fair(rq, p);
> >  }
> >  
> > -void init_cfs_rq(struct cfs_rq *cfs_rq)
> > +void init_cfs_rq(struct cfs_rq *cfs_rq, struct cfs_rq *parent)
> >  {
> > +	if (parent)
> > +		cfs_rq->idle = parent->idle;
> 
> AFAICT this creates a race:

> Or am I missing something?

Nah, you're right, this needs rq->lock.


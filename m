Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501C8359A8B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659431; cv=none; b=fL4ovFRRF0vXmIQlV9qQS6Llc+AfNCaboWVgdyY9kSeCWd+11EPY1KPVl44dTV3/oHWcG1BA3k+vy8uU81PFfNP90lMXpttGPSQutimOYgBc3lanK2A2J3fM/Q6wt+58dVqqC8ud8/DSWZSUYCJq0hRwiexrO5/RXIYJM05V3HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659431; c=relaxed/simple;
	bh=mzju8mDO7O/eNW0T8vonPXIo+XSQ9Rp6mZ79o1aMP1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pie08NNkNdyFkJ+cgCDw/rnzaSj9/ukXSl6CtPJ1Pt+ykQ38VTELWMCQUJOjUr/aYLYJAa7XCdVrH6DBh5RvMxPZCDdP3ZB41a5r6z0NtyOE9S3DimBBRNY+aP8bMbAE0TkUlEtg6hCM0A5z16Azoj3ftu0ax3hy47U2RoROuAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q7VGeXy8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q7VGeXy8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n8i79UW9u3rcIITO0JwYOju7pP/mgo9hTYj3kEkybdI=; b=Q7VGeXy8vqnoQJh3CfhQ+eWOlA
	p4Jqvdv5VJ6URobUmOiAb1PjPjPjbMmP0aRHEyx8Cy7RdMYb3BnUTyoYI5CYcK58Sq5vv3KIMu7eL
	yVwKCZlQye9ME5PfrgkaRCh5Ygfp87fsruzBxED+bOF0Ng5onAsTmc5JYVv+KBBsJ/FA0uTTiCf5S
	emuv0LeTmbJegByQBfSUR+jv9WEBxJK5/srI6Z98UTcLASUXKMdckPo6uq8Jrbr/KIaw8ibDU7TOo
	T/ssM1cRWDuyN1gtQmPgZlMsZgqeoJnRGQgA8yPjQR2uv70kCu3PIncZXKRRn9c9AgNtOF35NSsHl
	YwcdRrCg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EAM-0000000Any0-1CGC;
	Thu, 17 Sep 2026 15:36:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D0FBE301BD5; Thu, 17 Sep 2026 17:36:49 +0200 (CEST)
Date: Thu, 17 Sep 2026 17:36:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Jihan LIN <linjh22s@gmail.com>, suleiman@google.com,
	andrealmeid@igalia.com, bsegall@google.com, dave@stgolabs.net,
	dietmar.eggemann@arm.com, dvhart@infradead.org, jstultz@google.com,
	juri.lelli@redhat.com, linux-kernel@vger.kernel.org,
	mgorman@suse.de, mingo@redhat.com, qyousef@google.com,
	rostedt@goodmis.org, soolaugust@gmail.com, ssouhlal@freebsd.org,
	tglx@kernel.org, vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [RFC PATCH 07/12] futex: Make FUTEX_*_PING use Proxy Execution.
Message-ID: <20260917153649.GK4121339@noisy.programming.kicks-ass.net>
References: <20260917043339.2093426-8-suleiman@google.com>
 <887eff66-35f3-4703-8ff7-c0c959621b69@gmail.com>
 <8abf8b0f-38eb-4a25-a40a-57d5439e52e7@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8abf8b0f-38eb-4a25-a40a-57d5439e52e7@amd.com>

On Thu, Sep 17, 2026 at 08:09:34PM +0530, K Prateek Nayak wrote:
> On 9/17/2026 6:48 PM, Jihan LIN wrote:
> > [You don't often get email from linjh22s@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Hi Suleiman,
> > 
> > Thanks for your RFC series.
> > 
> >> diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
> >> index ebcd3c4a7793..689f149f7150 100644
> >> --- a/kernel/futex/ping.c
> >> +++ b/kernel/futex/ping.c
> >> @@ -370,6 +370,9 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
> >>
> >>               queued = false;
> >>               while (1) {
> >> +                     set_task_blocked_on(current, &q.ping_state->ping_mutex,
> >> +                                         BO_T_PING_FUTEX);
> >> +
> >>                       set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
> >>                       if (!queued) {
> >>
> > 
> > A userspace deadlock seems to turn into a kernel lockup.
> > Consider threads A and B on CPU0, unlocked PING futexes F1 and F2, with
> > the following ordering:
> > 
> >   A: CAS(F1, gettid(A))
> >   B: CAS(F2, gettid(B))
> >   A: futex(&F2, FUTEX_LOCK_PING) <-- T1
> >   B: futex(&F1, FUTEX_LOCK_PING) <-- T2
> > 
> > Since futex_lock_ping_atomic() only checks self-lock, both tasks end
> > up blocked on each other after T2. And task_is_blocked() is true for both
> > tasks, try_to_block_task() would keep them on runqueue with
> > tsk->is_blocked set.  So if pick_next_task() picks A or B,
> > find_proxy_task() will stuck walking on A -> B -> A -> ... with rq->lock.
> > 
> > Could we handle cycles in find_proxy_task(), or add a chain walk for
> > deadlock detection for FUTEX_LOCK_PING like rtmutex?
> 
> https://lore.kernel.org/lkml/20260714152220.4046736-1-soolaugust@gmail.com/

Ah yes, that thing. I would suggest to still have a hard-coded limit,
but perhaps in addition to the sequence mark.

Without a hard-coded limit, userspace is free to create chains of
arbitrary length. This should be discouraged :-)

Also, we need to be able to return -EDEADLK to userspace.

Ideally userspace gets to have an extra graph walk on block though, and
not rely on pick time sanity checks.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476003;
	b=QIkcUAbpv1Q5rmSQ28yNafW0E9U8xRLj2kjqa0XPsI9GqWkzC8hrl2EfUafcV4Y/C67g
	 EgZ5KMyFzTLNwViijFro92I3rWF2rl8b9yEStZ7SKVpY5+Y7q9rQpIZZGm37sdbw3ym3k
	 9H1pLArNe4nDfNgU05QZUv7QuUxEHbvyz+L7Fw/LCpxopVHwpX4F/np5b+ppRbRky9lmV
	 YXl1PXVWQPXtTXm+XU6byiZZTWMUNchf8jswXqE2+bpwxihKBrHj1LykBfRhxWpVN0xWn
	 CyVEg0hJFdgHKzjaD+o9B7YD0y+oFBQ5d4ODshCJsWQ2bc6L6+LWrrvl2XdDBQvuvhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476003;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=V1b1gVHuzUqRZdvDzrp67CUFRT4tS1/yyIOwSe9+NFY=;
	b=EVe5Q9K+YRPfSBp0ucgBeQo+mI4sklNd21zvczmcjcF5EYBqZExiP087fMutrt+uq4O6
	 1SjOl7VL4fMNP3VUKRz1wUkC8EBJL36CW6hCy3eRRABwovwmFlZwQmBKa2alqXiIWEfGC
	 6ChI8iYYzZrZ36j19ERoYBkxEBIFGMrNKIesIPtP9Cv9xfVnCpNDl5ehB24a8aIv0kA27
	 D3YM6aezTql/w111uw4xwsQXmVnvVTH2ey7E9ygTcapneXYTffmwTepH+uiukC0q3RE9e
	 q9NtrGaBEDBGFcGvG9pO1AL7uEez/NHtCLIkw2lzTXzMgR8RUJpYp4G7i5GnsYOkw1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ayogv+p5;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C5D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ayogv+p5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V1b1gVHuzUqRZdvDzrp67CUFRT4tS1/yyIOwSe9+NFY=; b=ayogv+p54yKqs5OlRvMNNPFbGR
	Qw9xkeTP/InOJC5daXgnevWz5qmbulKUqTUxyFemL7qTk7yfpq3VoXk1GPQ5D4wDU4DOtOB0frgqZ
	MB/jWDQwh4rhzUp7BN2qxZpKSty4aqEVJiF7caUj9N5ptDdo9vfNNSsWU9G4mwC7KAsMwQEZBeQC/
	dcaNfVi+x+QRLxHNx43vwhj0y14xqIpi4HV65i/8KVFk+JHO/qrtEuoNT18FmD6AbVzHjuk3uyHbE
	uDYYz3Hlj/u0Ijused8KXNf84RfwzKIwgWnQJssv6BaI4GJwwY51oFo1t8hd2A0x4xcYapccmX9wj
	1mh8gZfg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRB8-00000005YSf-1xr8;
	Thu, 12 Nov 2026 09:33:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 01362300400; Thu, 12 Nov 2026 10:33:09 +0100 (CET)
Date: Thu, 12 Nov 2026 10:33:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	tj@kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
Message-ID: <20261112093308.GI2668804@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <56e1d372-c938-468a-950b-4f984ad6bde1@amd.com>
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
In-Reply-To: <56e1d372-c938-468a-950b-4f984ad6bde1@amd.com>

On Thu, Nov 12, 2026 at 12:16:06PM +0530, K Prateek Nayak wrote:
> Hello Peter,
> 
> On 11/7/2026 5:29 PM, Peter Zijlstra wrote:
> > Ever since commit 50653216e4ff ("sched: Add support to pick functions to take
> > rf"), we have the unfortunate situation that both sched_class::balance() and
> > sched_class::pick_task() have overlapping functionality in that they drop
> > rq->lock and balance tasks.
> > 
> > Additionally, prev_balance() is only called for a single RQ in the core-sched
> > case, resulting in 'missed' balance opportunities in this case.
> 
> So I have a fundamental question - looking at the deadline and rt balance
> callbacks, the balance is only done if rq->donor was taken off of rq
> (blocked / throttled) and we need to pull a waiting task that might be of
> higher priority.
> 
> Now, if the balance (say for RT) failed, and later, a different class' (fair's)
> balance callback dropped the lock during which a RT task was woken up on the
> CPU, I believe the wakeup path would have already done the balance while
> considering this CPU for wakeup right?

Indeed.

> In that case, why should RETRY_TASK want to try balance again for the old
> "rq->donor" for which we have already ran balanced for? Shouldn't it simply
> pick the task then? Am I missing something?

need_pull_dl_task() has '&& dl_task(prev)', so if prev was FAIR, then it
will not be true and pick will not cause it to pull another task. And
similar for RT, it checks if the current highest prio is less than the
previous prio, and if prev is FAIR that won't be the case.

> > Just like pick_task(), prev_balance() would iterate the classes and stop when
> > there is a runnable task found. The only difference is that pick_task() starts
> > from the top class, while prev_balance() would start from prev->class.
> > 
> > This means that if prev was an RT task, we'd get an extra visit to balance_dl()
> > -- and similary, if prev is fair, we'd visit balance_{dl,rt}() both. However,
> > this is not a problem, because both need_pull_{dl,rt}_task() will DTRT.
> 
> Balance still sees old donor and it can still try a pull if the newly
> woken task is on a lower priority than the rq->donor. Is that desirable?
> 
> > Therefore, move balance_{rt,dl}() into pick_task_{rt,dl}() and remove
> > sched_class::balance().
> 
> Until commit 50653216e4f ("sched: Add support to pick functions to take rf")
> that was how pick worked and we should perhaps stick to that. commit 67692435c41
> ("sched: Rework pick_next_task() slow-path"), made it such that none of the picks
> could actually return RETRY_TASK and we are actually moving back to the same
> state as 67692435c41~1 with these changes.

I know :-(

> IMO, we should re-introduce balance_fair() for newidle_balance, and drain all
> the delayed task if !h_nr_runnable && h_nr_queued to avoid pick hitting the idle
> label altogether.
> 
> Doing newidle balance for every idle rq's core pick seems too aggressive. I
> think we should let idle balance / balance callback handle those movements after
> rq->core_cookie is stable.
> 
> This also allows for us to now do rq->next_class->pick_task() and that should
> always return a runnable task and we don't have to ever juggle rq_lock between
> picks which has already led to a bunch of issues.

So the problem is with ext :/ They need balance and pick to be one. If
we have separate loops there is the possibility of doing a balance but
then not picking it. In that case ext needs to undo the balance and we
don't have anything for that.

Humm...

Ah! we now have consistent cross-class wakeup_preempt calls. If we have
the following scenario:

  - only EXT tasks
  - balance_ext(), moves task from global DSQ to local DSQ
  - wakeup FAIR
      wakeup_preempt
        if (sched_class_above(p->sched_class, rq->next_class))
	  rq->next_class->wakeup_preempt(rq, p, flags)
	    // could move task back to global DSQ
  - pick FAIR
  
This will need some surgery, but might just work if we have
prev_balance() set the rq->next_class.

I suppose I'll go try this, the end result is much nicer.

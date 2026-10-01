Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9431B4E4C30
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865218; cv=none; b=pkLMhR4rOK6+iPyJXFzLiaWoDQOnXA/GuMmZCfqdArQr9NLt0U0gdqrErb9SnSeHwzLmSr4D6fX+5Y+vT+/LUwj3VW8ZNoWqzYoyGDqcYh6CIkZ+fxWjM6uF0rjvh3v/svxbYxC4vkYii7tIAwe+3cJK+CkHZOi0MJPpqosBMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865218; c=relaxed/simple;
	bh=LonrL9EHvB1uWkvI7vBt43f9Cw/m2q2nV8lmC9N0IKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG5Dx13ZKxfXsav4ueaznp01mrki1exdmoLCT9zcLNWRS79NnGmRRkAmoWMCt5I/fWIdyjROk01M270TYVzKZhUHB4SBYs9kluvBIDPcm70QPcAgRN2vfwt7iDXXXz8l5asSAv0R/iVcsrX1n2/Uz5hrw2ZAkeLoK//t6dS/x1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hz3Jhibb; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hz3Jhibb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M3r400i3RiYhodwFtT3hJImAZ+LcDFZg8kKGWFnvVuQ=; b=hz3JhibbIc4HsdJ23iq8HiO5Ej
	gv7EGENy3No8Gi97h47vQnT34crAszdNwzEO55ezx0hxtGErOfc19D6gAJqe4ZseGNVTUB+sMbb8d
	0oLWfiaB33J53EdAXhCLBJR0G3aPKDJPoVcwkDAxBn1Fq33Q6etwIkyqQAQZf31YQtQ/aGReqkBE1
	IYst9cy3yXIl9gn7qc/zZ9x2zpcCHSXLUsBQKYzt3ZQzcuCs/2MIvd5jJB+e1Ah5S+JcsLGb5VWyZ
	JB3o8YMFRrjDDZgigUNMzW9kLrV4H8fpDLAgjVDcgN2RpNxSNTCl3nEuTgkyAWXTXgghMzckvmVqp
	y+GkFgPA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHqU-000000083Ef-24rQ;
	Thu, 01 Oct 2026 14:33:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 17129300578; Thu, 01 Oct 2026 16:33:14 +0200 (CEST)
Date: Thu, 1 Oct 2026 16:33:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Andrea Righi <arighi@nvidia.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Haufe <dhaufe@simplextrading.com>,
	Cao Ruichuang <create0818@163.com>,
	Furkan =?utf-8?B?w4dhbMSxxZ9rYW4=?= <frn1furkan10@gmail.com>
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <20261001143314.GK4121620@noisy.programming.kicks-ass.net>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
 <20261001142735.GT2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001142735.GT2009045@noisy.programming.kicks-ass.net>

On Thu, Oct 01, 2026 at 04:27:36PM +0200, Peter Zijlstra wrote:

> >  bool sched_can_stop_tick(struct rq *rq)
> >  {
> >  	/* Deadline tasks, even if single, need the tick */
> >  	if (rq->dl.dl_nr_running)
> >  		return false;
> >  
> >  	/*
> > +	 * If there are RT tasks, we may need the tick (for >1 RR tasks),
> > +	 * but we must also service lower-priority CFS/SCX tasks via dl-servers.
> >  	 */
> > +	if (rq->rt.rt_nr_running) {
> > +		bool cfs_or_scx_queued = false;
> > +
> > +		if (rq->cfs.h_nr_queued) {
> > +			dl_server_start(&rq->fair_server);
> > +			cfs_or_scx_queued = true;
> > +		}
> > +#ifdef CONFIG_SCHED_CLASS_EXT
> > +		if (rq->scx.nr_running) {
> > +			dl_server_start(&rq->ext_server);
> > +			cfs_or_scx_queued = true;
> > +		}
> > +#endif
> > +		if (cfs_or_scx_queued)
> >  			return false;

What the purpose of this boolean, both true assignments above can simply
be return false, no?

> >  
> > +		/*
> > +		 * Only RT tasks, no CFS/SCX. Stop servers to prevent spurious

No DL either, you've filtered those out above.

> > +		 * wakeups. Tick can stop for single RR or any FIFO, but must
> > +		 * run for multiple RR (round-robin behavior).
> > +		 */
> > +		dl_servers_stop_all(rq);
> > +		if (rq->rt.rr_nr_running > 1)
> > +			return false;
> >  		return true;
> > +	}

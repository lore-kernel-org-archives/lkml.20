Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F20525A94
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868801; cv=none; b=iZJkVD+hgsH89X8lQPPgSte+QR+rofES49djCUWvA+NpKtq2tpuV15Kzypvz44Hz0wLecu/5Ovx2kXX7H2cRyQQqqe9ka2dSLKLkawxtUKcBRD4d2szu5f30KJO9BcEcM5yAjmyoPxR7u/gmtCsSVfTXxMzT1VxxEUV6pjvqYX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868801; c=relaxed/simple;
	bh=kaAO3hdfnp6HWbkTR668nDmoXHetGBxzaYE8slWR9HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHs3px7dPmX/jIyPYbwdO4J8sirIhGIe7TKFh4sEcY9Q970MwDSgMAJLK/h7cG6wb+j84s9cWefdSiuIpzpH+TevkcJ3kG8FNviM+qS4a48l/bGQYl+oAuyDWEIKTxZ3i5v40knw+6SpbDX20C79FxtEqGdbQc3let96VnN1nqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q2mTxIc9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q2mTxIc9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HzQe+LKVvAVqhKZ0TNMnqTYoehjXcSKDJnjw3gnCtIU=; b=q2mTxIc999zAG7BUfNtip9wIkT
	eLtEkVmG1yYOgPFP3vgLN2mQ8246JcqJF3JaKRaTLjZXkI0ruTfUThrGd3Pm/6ra4r7dr2N++szxb
	Y5o/HzRpYa2XtsjV5Tti4InAY2LBLz4lMum6MUFIF9G86ESgxeknh1SBAo4XFzzcZJSITSv/T0GLK
	tbBVIEWQ+xo5jJX4GOrM6tkmm5bbWC7yj5p7VQFTSl5X/vYwTfrRNXnHaF+NE06sLGaV5S7t8pTEe
	HX9XvjSEqpVFXDu0enD9IhoDx/jdrdleiV9yFlCDqqbDVgkFGqeeNgMRHi4RVIWLh1X3yc15dM+ro
	aT+m3FYA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCImM-00000008L2j-3nI1;
	Thu, 01 Oct 2026 15:33:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B1688300390; Thu, 01 Oct 2026 17:33:01 +0200 (CEST)
Date: Thu, 1 Oct 2026 17:33:01 +0200
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
	Furkan =?utf-8?B?w4dhbMSxxZ9rYW4=?= <frn1furkan10@gmail.com>,
	ionut.nechita@windriver.com
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <20261001153301.GS88198@noisy.programming.kicks-ass.net>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
 <20261001142735.GT2009045@noisy.programming.kicks-ass.net>
 <20261001143314.GK4121620@noisy.programming.kicks-ass.net>
 <ar57h-DsEVtuZnVw@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar57h-DsEVtuZnVw@jlelli-thinkpadt14gen4.remote.csb>

On Thu, Oct 01, 2026 at 05:25:59PM +0200, Juri Lelli wrote:
> On 01/10/26 16:33, Peter Zijlstra wrote:
> > On Thu, Oct 01, 2026 at 04:27:36PM +0200, Peter Zijlstra wrote:
> > 
> > > >  bool sched_can_stop_tick(struct rq *rq)
> > > >  {
> > > >  	/* Deadline tasks, even if single, need the tick */
> > > >  	if (rq->dl.dl_nr_running)
> > > >  		return false;
> > > >  
> > > >  	/*
> > > > +	 * If there are RT tasks, we may need the tick (for >1 RR tasks),
> > > > +	 * but we must also service lower-priority CFS/SCX tasks via dl-servers.
> > > >  	 */
> > > > +	if (rq->rt.rt_nr_running) {
> > > > +		bool cfs_or_scx_queued = false;
> > > > +
> > > > +		if (rq->cfs.h_nr_queued) {
> > > > +			dl_server_start(&rq->fair_server);
> > > > +			cfs_or_scx_queued = true;
> > > > +		}
> > > > +#ifdef CONFIG_SCHED_CLASS_EXT
> > > > +		if (rq->scx.nr_running) {
> > > > +			dl_server_start(&rq->ext_server);
> > > > +			cfs_or_scx_queued = true;
> > > > +		}
> > > > +#endif
> > > > +		if (cfs_or_scx_queued)
> > > >  			return false;
> > 
> > What the purpose of this boolean, both true assignments above can simply
> > be return false, no?
> 
> But we won't start the ext_server, even if EXT tasks are present, if we
> return false in case CFS tasks are present.

Ah, see, I need a break ;-)

/me stomps off to brew tea...

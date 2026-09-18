Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942CC304BB3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719944; cv=none; b=iRvKSg39S5k0LcaekBRC0+zKlMriq0zaCZUSPX5jOYvQj5v/ncMuKT/NMaGPUhGj33/6wbDKRICHL95xxtikQlo0eILzy8KCfhM1dz+m9g+ESS1hG1MV271FUR3N5hBsrwwQKiMh1UTOqseiW478yJZNUa0UHViAEe013+jdtR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719944; c=relaxed/simple;
	bh=OVSd8RME9OuZsgnJlbNMCkSZ9p1Q9mtnasNnOqICh+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiW4qfyxChWr7HbNrgr8KYqbskfk45l0Gm2R3Fo1cNGySSwjOXwhDQNuTNld0yb4LvUARN/JQ3KEqY5VLQcbzwaWfmuuumkC7Df0rD9oNd+RPw5SAXHGjwjO2IWI3pNtCJBte2ZKsmZqlW3jKkgdOxq9yvtAXc74AOUYeM3Ox2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=D1GNbUG/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D1GNbUG/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tPNb/aYvU+uuosEYZ4H97aC9kQi9HXuc+lrfHV96kgI=; b=D1GNbUG/t50gSF74u+1cjHW7uh
	iQDfDyfSe0EtUEjOmKoEVy/63nPEaGJAz/66r+PyetubhthFGsb7a8OqJD4nAH2JQcHD8625jxm3o
	E1VRjc8XFPvKmRs4Vj20UbOTgD+i0mc9iHYpu+ByuhqV67CppjWYj5vHt2uxYK3SqUpeJMVqTwK/G
	+mUJJXM2HiC784wSOu1DOFsfJxNgd8ROw8NWUiYZwwb8VyLFPt19aLHPs2x2xKnuUdNmC+f0JN2uW
	p5KvTOe6rfCFmaBI4rccm7ISB9n2Yq3Ft6Df8CiJu8M0b9zlrV7+7OxlSD9iCpyIcHBc58gvhITjR
	Wfrqi22w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TuU-0000000GXTH-0Vmc;
	Fri, 18 Sep 2026 08:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A6CAC3006DD; Fri, 18 Sep 2026 10:25:29 +0200 (CEST)
Date: Fri, 18 Sep 2026 10:25:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: Suleiman Souhlal <suleiman@google.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	zhidao su <soolaugust@gmail.com>, Qais Yousef <qyousef@google.com>,
	ssouhlal@freebsd.org
Subject: Re: [RFC PATCH 00/12] FUTEX_PING: A stealable futex using Proxy
 Execution.
Message-ID: <20260918082529.GJ1837346@noisy.programming.kicks-ass.net>
References: <20260917043339.2093426-1-suleiman@google.com>
 <20260917085805.GD2009045@noisy.programming.kicks-ass.net>
 <CANDhNCp0fufkpOSRQz15YQNDKkR=1-CC9QAsXujikz-DY05EoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANDhNCp0fufkpOSRQz15YQNDKkR=1-CC9QAsXujikz-DY05EoQ@mail.gmail.com>

On Thu, Sep 17, 2026 at 10:53:47AM -0700, John Stultz wrote:

> > Also, the goal is to eventually delete rt_mutex and have it be the
> > normal mutex, in which case the existing FUTEX_*_PI things will
> > automagically work.
> 
> Indeed, moving rt_mutexes to proxy is a goal.  Though the performance
> concerns from FUTEX_*_PI have to do with the semantics it (and
> rt_mutex) promises: strict RT prio order handoff - esentially FIFO for
> SCHED_NORMAL.  Not so much the mechanism it uses for boosting.

Yeah, mutex will probably need to grow a few feature when doing that.

> That's why it seems a new FUTEX op is needed. Since we 1) need to
> communicate the owner to the kernel 2) want different semantics for
> lock-handoff and stealing.

So I'm not convinced. One could argue the strict requirements are
dependent on the scheduling class, not the lock type. It should be
feasible to make stealing behaviour depend on the lock owner or waiter
class for instance.

> > So I'm thinking all of this is way premature.
> 
> So it is just an initial RFC, and we are looking for input.
> 
> But there is a strong appetite to solve this, as we're already seeing
> vendors doing less ideal things, like passing who the waiter thinks
> the owner is (racy) in via unused fields of FUTEX_WAIT, so that
> out-of-tree custom scheduler boosting can (temporarily - as again it
> can be wrong) try to get that owner to release the lock. The longer we
> go without a usable upstream solution, the more entrenched these less
> ideal solutions become.

So this does sound a little like blackmail. If vendors want this, then
vendors had better help out upstream. If vendors don't give a toss about
upstream, then why should I give a flying fuck about them?

It is then on Google to tell vendors to put up or shut up. Just tell em
their hacks are no longer allowed once we have something upstream. Break
their toys and tell em to kindly go cry in the corner.

So no, we don't rush this.

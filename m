Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395D03112A5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181640; cv=none; b=Ob/5VekQQhJ6EHCzqQEZGd4aYizO1uVK6C5n/zUIF317XjiFZ4JY4XR+e9l568I5CNDQ+CRV5wmA0CD68BTUiymWnZeEd7FFpeU+FSecOlkghynyUK5bNzeSJ5AUBiJ5DItXCV3iORmYX4hGd1PQw7sFJEMe7Xxm1yfoWN0BmqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181640; c=relaxed/simple;
	bh=D7PnGJfGAyrXyJiPR7/p1jiTiaom/rEeXLYCLgVeLCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozvoj8CcoIVN70otwKSI6EOd7DvxFWT/4MZtek74eQJLKidbFtiaeGSI7ubkGEdqewAW4+Ge2vj6QTmWPhVVPh4xXdg9wPpNQm5hGtFQudjB9+cSLdAquqkuSRJlQepM27zeKmbsZQFlw6pL0ZnKbtVIl4XVEF6SLlPUYJqsWzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pzV4jSTp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pzV4jSTp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ST3LaawQC2D9cX6A0eG4epMTil8kW0utXJqs2+XTack=; b=pzV4jSTphQVZimQ0U1KmM4aiVO
	QuDK6a7yywHMhcomaqOwVcPEXnaX9wWfN1ekZ0PF7oQ145QBGT+y/p5jrBBgz2RzkdYKrbKDE2Vcu
	xqgW2CC9gthx+KB5K0UkhZO+aoDg/ipeCJ3QfJCYsiKbgV+r7uDr+yFl5OWo95Dh0+Mm3a1a6rmbs
	ys5wCgnEqKJKzt6oOY4DenL8p+XePUVk4jZr6u9pFuZE1KrOw2m8e/VWZAJIYh1s7tXNzwMhdwiB2
	qDzmPa8/jyc0z0n6ikUsntyJzFNtSAcQa+ZMyDkTiQLUjb2E8qXwqnRZ1FDZIWRG8aSOkOsvaJ1rr
	EzWhXyFw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x11j9-00000009s58-1F6M;
	Mon, 31 Aug 2026 13:07:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9F911300CC0; Mon, 31 Aug 2026 15:07:05 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:07:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, tj@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
Message-ID: <20260831130705.GI4120091@noisy.programming.kicks-ass.net>
References: <20260828074059.232353141@infradead.org>
 <20260828075558.660152190@infradead.org>
 <CAKfTPtBuCgKjj_kM8zwihp7o10vBB7c9rmBtsJ5mVt3YxjXV0g@mail.gmail.com>
 <20260831103735.GW687043@noisy.programming.kicks-ass.net>
 <CAKfTPtB5mpA0yGCwhv0wwdBj9xYWB+k+QL=daAu=qNCcBQexvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtB5mpA0yGCwhv0wwdBj9xYWB+k+QL=daAu=qNCcBQexvA@mail.gmail.com>

On Mon, Aug 31, 2026 at 02:06:14PM +0200, Vincent Guittot wrote:
> On Mon, 31 Aug 2026 at 12:37, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Aug 31, 2026 at 12:10:42PM +0200, Vincent Guittot wrote:
> > > > +static inline void __update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> > > > +                                         struct sched_entity *se,
> > > > +                                         struct cfs_rq *p_cfs_rq)
> > > > +{
> > > > +       unsigned long load = cfs_rq->avg.load_avg;
> > > > +
> > > > +       if (cfs_rq != &cfs_rq->rq->cfs) {
> > >
> > > A comment explaining that the 2 belows are used for the case where
> > > for_each_sched_entity has not been called to set backlink would be
> > > helpful
> >
> > Fair enough; something like so?
> 
> yes, looks good
> 
> >
> >                 /*
> >                  * These last two arguments can be NULL then used outside of
>  s/then/when/ ?

Just so, typing hard :/

> >                  * the for_each_sched_entity() hierarchy iteration. Like in
> >                  * __update_blocked_fair() where leaf_cfs_rq_list is iterated
> >                  * instead.
> >                  */

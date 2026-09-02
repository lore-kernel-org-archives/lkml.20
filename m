Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591B29D260
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359544; cv=none; b=hfgEoVrFwxNDTeWWVjegMppe0Tg+56HhqLl2cjSI15WIJyL+0fRxQ/rIKXREXpwtqlt1MlLysvhFuXUn5aXxTszIHw7PNBgrj5DLhJOCu5Y7fow+CmSR5/uK6ntXVHvUXwxU0/H+6YgYWhfxJoNkAvy1S3KHIwEQsaNLZbebkUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359544; c=relaxed/simple;
	bh=j1ekNWFBaygHUfUDKmkSutoGWdLFXF9nhhRR2d4P2cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4rguD/t25a/LE+3of/zJzsHTiXVHiR+7D/yVRjL9i/4F6903Y19/LtMB9+4Pk2OQNcnseERzxLIYZNXcPhA5o/tCsnBLTt5C+bylartyT2L/Tiqv9c6yv2eYlFTLnJNspNnxgM4kyDUyPLA/TgMLpnDbL5XBfF3SOhdHB03G04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KxEAWLW8; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KxEAWLW8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TLQXiwKGjIpuxibWtTva/AFdbflfutScWjOwAjr4iWI=; b=KxEAWLW86ld/5iCqRFv+l2/Xq2
	LssGA1aMA8xGRj62FWzuIHt3xo4vNdsEJgf1oIuFMnKHw+YTwa9GXNlwb97Cp4FiQHhvkTgXc56Lp
	1njNl1KnXNfB64NoRZ2fPP+ZxH3V6FwQ26Uecoyw3Y8YBCzaCOcwcUn0/+nvzPJ5g1AvAa7QYfUG7
	qAXUOXheIjI//lQAmlWNK9c2gAgykgOkDBk2Nef1Rv7m6BbThzwZiGVMLC3+KpINdX18y8VY/HNl6
	bL9RHFrSJM9i6MJT+j7kMXcQC2z2Ia9f5dZedRBSNQ3HzRKXKKixHl4xo/aNpCqSIDtd3otorIqE1
	nRv4MFfg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1m0Z-0000000C5qN-0d6A;
	Wed, 02 Sep 2026 14:32:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EDC043008E2; Wed, 02 Sep 2026 16:32:09 +0200 (CEST)
Date: Wed, 2 Sep 2026 16:32:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] sched/core: Simplify/fix time updates
Message-ID: <20260902143209.GC687043@noisy.programming.kicks-ass.net>
References: <20260828101659.812011872@infradead.org>
 <20260828104018.483560652@infradead.org>
 <ape2abNdAgRCfEtg@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ape2abNdAgRCfEtg@slm.duckdns.org>

On Tue, Sep 01, 2026 at 07:38:49PM -1000, Tejun Heo wrote:
> Hello,
> 
> On Fri, Aug 28, 2026 at 12:17:01PM +0200, Peter Zijlstra wrote:
> > +static void opt_update_rq_clock(struct rq *rq)
> > +{
> > +	if (!(rq->clock_update_flags & RQCF_UPDATED))
> > +		update_rq_clock(rq);
> > +}
> 
> Yeah, I think this really needs sth like this. That said,
> 
> > @@ -6336,18 +6336,12 @@ pick_next_task(struct rq *rq, struct rq_
> >  		 * pick_next_task(). If the current cpu is not the core,
> >  		 * the core may also have been updated above.
> >  		 */
> > -		if (i != cpu && (rq_i != rq->core || !core_clock_updated))
> > -			update_rq_clock(rq_i);
> > +		opt_update_rq_clock(rq_i);
> 
> I don't think this is correct. A sibling rq wouldn't necessarily have
> RCQF_UPDATED cleared from whenever it scheduled / ticked the last time, so
> the following pick_task() can run with pretty stale rq clock.

Ah, indeed. We should clear clock_update_flags on unlock, rather than on
lock. Thanks!

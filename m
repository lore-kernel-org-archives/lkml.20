Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399936;
	b=RA1W6iY37SuJvFOaqqBXWRWmRADlO7tIGM5KmCKvrrgy6BeF5gTJA4dcKzbm0iZMSqIH
	 Gq7oFXj0Vzo64xw92Gpq3F7tZ4Bjyn6CNb3utN6ld4fYY/MOCoXPO1f2b2fK9+FPYhs1U
	 ShE72UgblJEpV5J6xoykAHJKZRceG8n07kr4RNjKbxm95QMNdtoH1A9G5UjDeUK9w9rXX
	 Z47sAUAomtokcsu8nn64377DU3fw87Af0JfM4hxqf7HVavqyOdXnY3MtDsWpXCLmT1mor
	 pzMb/lZu+g8+itC1gAGpUw3+c01zahhXwASEby+jgZGWO6ulNYOUALcgM1uIVY1Kd4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399936;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=p79kXd0X+zHSh937Czz/lUXTjQQnAOAOUb3K0wIS5yo=;
	b=du6v+CqCyZ/ERlBspYBAeTQT2iCS3YCXiOGhkLl6GF+QBbq2ntpN2yVwRgOeY/9Z0RXC
	 8s1/kNHKtlm4KDT/3iZulvdFpqN+HiPRnbUGcfc78kqTxycwP58NKiukNDAioxq5Kl1NY
	 2D8spHMFUtjgJmnU6YH1nwfJXkRm2P+KuILl9ja+76V6MUQWHkM5muZDwDFhNVgb4yZCS
	 WhhaqoI1MjfG8JSzsudEHqnrPaV8+tEFHmAMNhnh8JqdSR07nSi8ZaQ6SACkZZ6bpuX6m
	 ylRdoKl/rcb1XKbHGl78QME3AA1pmN5sgytPVRbm3d5ArvylR8pFu7Fv11P+AM4I9Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WW9Lc5OC;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0330606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0330606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WW9Lc5OC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p79kXd0X+zHSh937Czz/lUXTjQQnAOAOUb3K0wIS5yo=; b=WW9Lc5OCkxPZccFCDA31tt29gp
	SpRZdKoBmkpX/rGtcTiBDEKdIYxus8zYX/Ed52V6l1EVHiFOu6o3EM8XsRCBBy75a86PXnIyAnaob
	7ABodDj/uRQtrJrBiRUBFfwbnS+yjH3PcadzjswmgGmfX274/UQ2OXu2RUL3D6f+e2KUART0zVNDA
	Z/ouTRolX+qel75JjAbNdZr1MKpw3ilYWERVq8GNYSAH0NT8xhB+AK7bqxr+WuADFA9wrZB9K3EZp
	mbsfLIyhAV5H5lItwDJp6DffDzC6pdr95OiKFyxJ8KbcCzbHfxHL9C76yCiz7rsH/hGyeNwRx9iO1
	2SrOBMjA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7OH-00000009eyG-1Nmd;
	Wed, 11 Nov 2026 12:25:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 43636300969; Wed, 11 Nov 2026 13:25:24 +0100 (CET)
Date: Wed, 11 Nov 2026 13:25:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 04/12] sched/core: Make __update_rq_clock() skip
 updates on UPDATED
Message-ID: <20261111122524.GC2669272@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120207.126979364@infradead.org>
 <3ac37e055b66a46f72edd235f1e93f5f@kernel.org>
 <20261111102817.GN1779021@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261111102817.GN1779021@noisy.programming.kicks-ass.net>

On Wed, Nov 11, 2026 at 11:28:17AM +0100, Peter Zijlstra wrote:
> On Tue, Nov 10, 2026 at 03:11:28PM -1000, Tejun Heo wrote:
> > Hello, Peter.
> > 
> > On Sat, Nov 07, 2026 at 12:59:17PM +0100, Peter Zijlstra wrote:
> > >  static void __update_rq_clock(struct rq *rq)
> > >  {
> > > +	bool update;
> > > +
> > >  	lockdep_assert_rq_held(rq);
> > >  
> > > +	update = !(rq->clock_update_flags & RQCF_NOP_MASK);
> > >  	rq->clock_update_flags |= RQCF_UPDATED;
> > >  
> > > -	if (!(rq->clock_update_flags & RQCF_ACT_SKIP)) {
> > > +	if (update) {
> > 
> > RQCF_UPDATED is cleared only by rq_pin_lock() and
> > double_rq_clock_clear_update(), so a path which takes the rq lock with
> > raw_spin_rq_lock() inherits it from the previous holder and its
> > update_rq_clock() is now silently skipped.
> 
> Let me look at that specific case.
> 
> > Previously, you said to clear on unlock. Why not do that? That'd be less
> > confusing overall.
> 
> Yes, that's what I tried, but it doesn't work for core-sched. What
> happens is that SMT0 and SMT1 interleave and things go to hell, patch 6
> has that picture.
> 
> That is, we can still clear on unlock too, but clear on unlock alone
> isn't sufficient :/
> 
> Patch 6 even has the clear on unlock, but commented out.

Right, so the complication is that for core I want the rq-clock to be
'frozen' over the rq-lock drop.

Notably, I want dequeue and pick / set-next to have the same timestamp
such that the whole of schedule appears to happen at one instant in
time.

For ext you've explicitly chosen to not do so, per the placement of
scx_rq_clock_invalidate().

The consequence is that the raw_spin_rq_lock() functions must remain
independent of rq_clock management; otherwise we cannot drop rq-lock
while keeping time frozen.

This means the rq-clock management must live in {pin,drop,repin,unpin};
and at that point, I didn't really see an advantage in doing it at
unpin.

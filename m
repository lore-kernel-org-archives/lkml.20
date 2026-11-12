Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496220;
	b=vNGq6m7jF84pDjTCoF67QBJr30ypB+BuupdCZ0PxWXqtto6CeFDtlmc3Gz6EW7ZjqnZ+
	 ff4Q+g2teCpv3n495xdSDTPYKEJcyE7VIPoP+gPTY2EssLOXGnc2sJFiSz/ut5Ri8DeJj
	 1aawvDm9XjPhvs6ZAVTYzFdKTWo0hsFPEt68Wo3AmsCdsbKOHC7zFEE3Pomkf+0h/OPoe
	 EApixMqkaq8TKRSxA7taIGTVmKB1jeqQhOdQHyHhQmIet+fvXJChIXwggmMsMaWUXfWvs
	 eZ3TW4MfZQXKlppgiQvnbV3CEwircYRcwwx7qKMumCg7yK5Rum5lamUUifc942pYg5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496220;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=reuptjqlwF1l2qQU+pOSgmAUmz0f784Lhxxdtt7p17o=;
	b=f6LNtDOBPl9sZLVHkVBAblFOmoU63ohYkZSV9oUTLHVOcA0Fr6s9lJRw3VrawhJW6KLT
	 NrRBdLsXIIQDePhvZ4VhyyA2i4pvyIhYAuXz2srCMgH2M/CZ2GUzoTAdbJa0/eL76nd0X
	 MriMusyDlfXLZuOlo0tK+BC48z1jiAYjAqmrK6EThoVojSCPc1a9gRbkwkyESL2T86quW
	 Bj+6r0P3jXy0Ym2hpNyZi6/fgJhdq4r8u2gKI5vedJDJP/wHm8Y+6gn4hjNaFoyDQB0y3
	 yLJoYlATcSCFM008uezRYojighP2M57leGhM7mb0P2Kef7G2cVivE4OMHYT8uplbCOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=U8ZCOrxR;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672FB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=U8ZCOrxR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=reuptjqlwF1l2qQU+pOSgmAUmz0f784Lhxxdtt7p17o=; b=U8ZCOrxR2ArtBnFgGjrTECJ99W
	16d/aQh0WPOBPpOUkbCQLdHxt20l56FW+wG5/Gq4V/Ytg3vzAgKXkulctJGR2zcOEJLzoW8nW8q96
	qoXBuJHQL0QxfDW/eAMM5Prq+4mlX239JUztUGT9Q7d+kGaH2LgDqmaJY8mkMUG1yKLfZBQ0z873S
	fYyBFRvUZ4DGytXU1LCx8RWWyr4M7QHQ2I2+tX38WlBluN7+n3GYEi2CzjeOTV/q0n7wsEzjZniRr
	sC33Bf9/9zm2mxA536TxpB5etA/JEdnY0JbiTyquC7Mv7pMFltwK0hkOXHgn3Z3hjpNaebvDGfKk0
	hhwiZF/w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWRH-0000000ATro-4BsO;
	Thu, 12 Nov 2026 15:10:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C6DF30057E; Thu, 12 Nov 2026 16:10:10 +0100 (CET)
Date: Thu, 12 Nov 2026 16:10:10 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, joshdon@google.com,
	tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <20261112151010.GB1813469@noisy.programming.kicks-ass.net>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
 <avXFHBcVoMkZY6uL@scheduler.schedules>
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
In-Reply-To: <avXFHBcVoMkZY6uL@scheduler.schedules>

On Thu, Nov 12, 2026 at 05:02:27PM +0300, Kayra Cizmeci wrote:
> :-(.
> 
> Look here: https://lore.kernel.org/oe-kbuild-all/202611121431.06YgiErz-lkp@intel.com/
> 
> On Thu, Nov 05, 2026 at 05:55:27PM +0100, Peter Zijlstra wrote:
> > Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> > all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> > is marked idle somewhere along its ancestral path.
> > 
> > This makes se_id_idle() behave differently. Notably is will now be true
> > when there is a idle cgroup anywhere in the ancestor path. This
> > addresses an issue where preemption of cgroup::idle was overlooked when
> > flattening the runqueue.
> > 
> > Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  kernel/sched/core.c  |    2 -
> >  kernel/sched/debug.c |    1 
> >  kernel/sched/fair.c  |   73 ++++++++++++++++++++++++++++++++-------------------
> >  kernel/sched/sched.h |    4 +-
> >  4 files changed, 50 insertions(+), 30 deletions(-)
> > 
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -8970,7 +8970,7 @@ void __init sched_init(void)
> >  		rq->nr_running = 0;
> >  		rq->calc_load_active = 0;
> >  		rq->calc_load_update = jiffies + LOAD_FREQ;
> > -		init_cfs_rq(&rq->cfs);
> > +		init_cfs_rq(&rq->cfs, NULL);
> >  		init_rt_rq(&rq->rt);
> >  		init_dl_rq(&rq->dl);
> >  #ifdef CONFIG_FAIR_GROUP_SCHED
> > --- a/kernel/sched/debug.c
> > +++ b/kernel/sched/debug.c
> > @@ -1090,6 +1090,7 @@ void print_cfs_rq(struct seq_file *m, in
> >  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_runnable", cfs_rq->h_nr_runnable);
> >  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_queued", cfs_rq->h_nr_queued);
> >  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_idle", cfs_rq->h_nr_idle);
> > +	SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
> 
> idle is only in the CONFIG_FAIR_GROUP_SCHED :-(.
> So as the robot says, this breaks compiling in !CONFIG_FAIR_GROUP_SCHED.
> 
> AFAICT tho, moving this down below in CONFIG_FAIR_GROUP_SCHED next to
> h_load and other guys will solve the issue no?

Yeah, pushed out again, lets see if the robots find more ;-)

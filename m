Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347793CF678
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827843; cv=none; b=DThAYo/8Ke9tRZRypuWo0A6kLOgDyfvbuwA/3CPCGryRJ2eN6ziBXa/a4X6g+sPSndBni8GwdAkZfz1pcV6D/wVDog1zIV+bs5sF2FZHUT0hWTM2oFlVKqf0/jvHGZx5Fkd6Hcgn+S1M+ixISddnph2VErUD2bQtuToNeN/Fc2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827843; c=relaxed/simple;
	bh=KbCY+z13yQSLbUB6CDe3+dpStup+oBJoESQUuxLzmho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFV1MKeVue3oPoI/1HNfUnHhpYFeg44yv4LC31gVWsjcxgWcw5jGcPan8DtDH1qrz37tK5KB/h7Dp5rFS8Ios670k8OBhyD7tvVKT5/Sd/EnE9zPlRUOkkJfDrpWAoI0B6Lt+9rIalegTEPYH0oqVQ7xTeLnf5k9ptoWxcKpG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sEAbHoZk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sEAbHoZk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A8UU/Y3Ma0m+t3oo/dW2u9xuu5TLysDjfrs3NNVrzKo=; b=sEAbHoZkLPg+Oc5GBXrtM2Xef7
	d+NaNEltFSzhGXTNZ/vB9MRwCtBpavz4skyIaUw/9Opz3CV8cMSgUXJVbg0Z3kfmC7utdI/cdatWI
	9gI5Zy2NiCyFq8jUo3uj77HYp95ahsLRyi/mDmw0Gf9fbCnX8k1ING2URN8JViuw0b/7x2NH443SO
	to5VrGDdAwYClJ8GAtpqa5FWC/boNTf9l9xnRiOFhpOVJSXFfRroOloDEim8YSNNJGy4umyIQK3V5
	5OpD/uGeBB/Y/CAaiosOSPZwu+KOTNPPcH0bFuM/JcaseTgRnc51LRUakhrNaKc+aqEIibW37ntbr
	yoe5d2Bw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXgd-0000000CdtK-0BCY;
	Thu, 27 Aug 2026 10:50:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7E4EB3006FA; Thu, 27 Aug 2026 12:50:21 +0200 (CEST)
Date: Thu, 27 Aug 2026 12:50:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, zhanxusheng1024@gmail.com, neelx@suse.com,
	chjohnst@mail.com, mproche@mail.com, sean@ashe.io, steve@abita.co,
	rishil1999@outlook.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/6] sched: Annotate rq->rd with __rcu and update
 lockless readers
Message-ID: <20260827105021.GJ687043@noisy.programming.kicks-ass.net>
References: <20260826224238.936456-1-atomlin@atomlin.com>
 <20260826224238.936456-2-atomlin@atomlin.com>
 <20260827073036.GC4121339@noisy.programming.kicks-ass.net>
 <36maob3lfrzbuktn6qii76rxdyt5bphjauc7dwg4rkmmgljqq2@j46iffegq6hd>
 <20260827093935.GE4121339@noisy.programming.kicks-ass.net>
 <jqzcreyz53zu4afr4g47ej5t3fc6cedpgdvj6whprn22e5lcwp@3f4tstxzfoqj>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jqzcreyz53zu4afr4g47ej5t3fc6cedpgdvj6whprn22e5lcwp@3f4tstxzfoqj>

On Thu, Aug 27, 2026 at 05:53:58AM -0400, Aaron Tomlin wrote:
> On Thu, Aug 27, 2026 at 11:39:35AM +0200, Peter Zijlstra wrote:
> > On Thu, Aug 27, 2026 at 05:35:44AM -0400, Aaron Tomlin wrote:
> > 
> > > To solve this cleanly, I propose introducing a concise helper, for the root
> > > domain in kernel/sched/sched.h mirroring rcu_dereference_sched_domain(p):
> > > 
> > >     #define rcu_dereference_root_domain(p) \
> > >         rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
> > > 
> > > This covers both the update side (under sched_domains_mutex) and read-side
> > > contexts (under rq_lock(), preemption-disabled, or RCU read locks) via
> > > rcu_read_lock_any_held(), while keeping the call sites clean and
> > > eliminating Sparse warnings.
> > > 
> > > Would you prefer rcu_dereference_root_domain(p)?
> > 
> > Yeah, but I'm not sure I see the point of adding it, as it is exactly
> > the same as rcu_dereference_sched_domain(). The root domains are part of
> > the sched domains, so it doesn't seem wrong to me to use that existing
> > one.
> 
> Indeed. However, the motivation is purely code clarity. Defining
> rcu_dereference_root_domain() preserves the natural symmetry of rq->rd and
> rq->sd in struct rq, while keeping grep-ability straightforward.
> 
> That said, should you still prefer reusing rcu_dereference_sched_domain(),
> I am quite happy to convert them over.

*shrug*, either will do I suppose. You can create an alias if you think
it helps.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589402;
	b=2j40ZlzGmD8rkKRZeY7Rn2qbH7CfT9BQwV/FOXPPsI2fQE/GN5P5g4MYHpQJZHz6+MWa
	 atCXg2vzGv+psZRy+q8AmzAJjgnIk6GUw6A3mWO3RvGEzQxyMikPbNuxNa2gSK+O237tH
	 x7t6oWh892HjILw6vVp9LGZfDTtIO2FB9/0MiC28jIZgtHj5nf+nvzcddkSIns4bvRcw2
	 Ma5ZiAsLkYR/gQf3locTXKXDyn71m4I0Q5hW75UMJgCvptsEg0Vs0ttVOmaFfOYiD/cVK
	 L3nxCsqtb9oKxkr035QcxaQZiqaJbR7WFgbOCAnEzb5wm8bTB+B9FNhLMmB5kSqkwgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589402;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gRa+hz1Mk3QIlSnBIstGnQDU4lnk04aXlHX2TCZ/zjQ=;
	b=l2GjEUZgM4PMjlVZG4G+tOY/TDlVUEz4eaLiiqcX6IhjmGEDm4epDi1QARAJgK0/M9it
	 x/fw8g16nRISirNDZAq3VXGFaiTkJssj4XBrlM6eK43EGp8O6j7vg3wbOtr1/Yle3u8FQ
	 U6bg8E8TcUWTegmScmAYjMZWEMH42XhH7iuqn8ILhzU6H7K0IdORs1Gf1acXFd84OW+SI
	 XKSP8wkhf8bZ37h5i8OQYen6DI2ggSRUp2s1xDQ6L1ciuT1DnEoAufodpqQCw/BfOUSWK
	 1xN9B4NxRmPeHWqSdBvA+pEvJYdbXFBQQ1+EXRKQoPzx3iriEGWc9tS2v4obBSMDJGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dWD9jxBy;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7898606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7898606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dWD9jxBy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gRa+hz1Mk3QIlSnBIstGnQDU4lnk04aXlHX2TCZ/zjQ=; b=dWD9jxBy1UtOjgII1SXbMZBaMt
	04gxS4u5t6mezGlvdPVVzXY4liHhPZQjDA3ccAPQxFIDny2bJLS38IUIf+n28Svlqt4zMoA2jOhEG
	+j5pApR1ZmerhEBm0x6OeYe2CkLgBJzXbnwvaaUCiSdcYwx7hD/aDO/wfLqyGdzY+G0CbJiNm6Gow
	TmYnzyzPm6cDT72POombR3vGvWW5IUteiz3x1gTAHKutSlCxisHrFNHzvsqZrTG87JyseWMdo73H4
	gGV71bu0bTe5JWb4CsEfXYdNNyB34WADovsIcYB1/LnIdOcLTBuaNXswRnv4FOvW6fQkR31LYjauv
	q7Ncl8Pw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWOD-00000009VDe-1EFt;
	Wed, 21 Oct 2026 13:29:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D5292300720; Wed, 21 Oct 2026 15:29:56 +0200 (CEST)
Date: Wed, 21 Oct 2026 15:29:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Qais Yousef <qyousef@layalina.io>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Qais Yousef <qyousef@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>,
	Wei Wang <wvw@google.com>,
	Patrick Bellasi <patrick.bellasi@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
Message-ID: <20261021132956.GO2823843@noisy.programming.kicks-ass.net>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
 <20261020152933.16989549@gandalf.local.home>
 <20261021113806.GE2823843@noisy.programming.kicks-ass.net>
 <20261021132058.kxzyumgxzir4jzi2@airbuntu>
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
In-Reply-To: <20261021132058.kxzyumgxzir4jzi2@airbuntu>

On Wed, Oct 21, 2026 at 02:20:58PM +0100, Qais Yousef wrote:

> > Also note that a simple global boolean has the exact same problem.
> > Adding runtime conditionals isn't going to fix this.
> 
> I have something in my memory that could be complete garbage that tells me all
> cpus should see the new update after a grace period, did my brain invent this?

This is true; rcu_sync() implies a memory barrier on all CPUs, and
therefore all CPUs must observe the prior state upon completion.

The thing is that a grace period is of 'arbitrary length' and during
that you can still have some CPUs seeing your variable set while others
will not and you get into the very same problem.

> If not invented, can we do synchronize_rcu() once on any cpu seeing the code
> enabled for the first time to ensure the rest of the cpus has seen the newly
> enabled path?
> 
> eg (not even compile tested):
> 
> 	diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> 	index 7d2ec527b8a2..a6093ec88103 100644
> 	--- a/kernel/sched/sched.h
> 	+++ b/kernel/sched/sched.h
> 	@@ -3715,7 +3715,16 @@ unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
> 	  */
> 	 static inline bool uclamp_is_used(void)
> 	 {
> 	-       return static_branch_likely(&sched_uclamp_used);
> 	+       if (static_branch_likely(&sched_uclamp_used)) {
> 	+               static bool do_once = true;
> 	+               if (unlikely(do_once)) {
> 	+                       do_once = false;
> 	+                       synchronize_rcu();
> 	+               }
> 	+               return true;
> 	+       }
> 	+
> 	+       return false;
> 	 }
> 
> 	 /*

This cannot work; two immediate problems:

 - the do_once needs re-evaluating for every switch
 - you cannot do rcu_sync while holding rq->lock ;-)

> The other alternative is to just accept this race can happen and do some sanity
> check and reset/cleanup on going to idle - which should be pretty cheap and
> straightforward.

This seems the sanest option.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8DA2FE057
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138845; cv=none; b=qkhPGKEDE1qruZuDJsFOTQHY90X2nILcwmIMfpRzyvjtdx77D1wJZtLWgrY3ZQ7JP0H8aMbC/91q4eORkLGx46CjvW6JJcRsg69c/16cce6NQSkwEkAhos+cRmxDWMaBdOC2tfGYQfSMas0RPT87GPdQfrR8YqHq0YIfsdh34yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138845; c=relaxed/simple;
	bh=L75qfURRVAWRJCxB7tyA8Fzf6pr5OVsgv+s1wONMr48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qzv4LM4Igr8QyGwp0EAwAgRF4fGOzY6uqauecXYmihKx9+V29VavzYan8iyvCqxmyIp5BUfZL0goPurchwaF2yv8tUV0n7VjS1rEoLQNY0CB4HnEHVh9onGzw+zGImdenVJuHsy9qbrKcpeDV932iN02tEDaCB1DOfWuStONbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KC6t9pvC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KC6t9pvC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BB41F000FF;
	Wed, 23 Sep 2026 04:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790138844;
	bh=sBya6Q0M/Nitm91hOL/bfUIVMsmOACKOooUTLcms3Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KC6t9pvCdvd4+DlXBcT4rIvEjtD734NE40UyouJRhHdvy9KNV//hY1LpV9zh4Hwkj
	 pULXHHnLEQei647MKdAw7/r/p1RjtfQdB+tBRjT7txihCI0GBq3151FY1VKuG2r/Jd
	 TFJuezi8NkcohiRqrDpl1/xBGt9cVA5Ukibr2tmTO6Ea5lxvtEG0lUk3rFAJVvLw2m
	 OF//UTHDHlYOs4j6kwHUNeH5FeXaR/JvZHYlzR+zn9JlERvNwnJQChPmSN96dlf+Ft
	 4/LRocc0zcjZZEWx+8NgBcz7Qd+nvS4TeW3oKoGtyVMNm1u8NU1kiyHFqcqKeKs0Ks
	 W0zLk8Y+5dLVw==
Date: Tue, 22 Sep 2026 21:47:21 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] perf/core: Fix a refcount leak in
 attach_perf_ctx_data()
Message-ID: <arNZ2YeL7Uuva-YQ@google.com>
References: <20260920231639.11910-1-namhyung@kernel.org>
 <20260922133835.GZ4121339@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922133835.GZ4121339@noisy.programming.kicks-ass.net>

On Tue, Sep 22, 2026 at 03:38:35PM +0200, Peter Zijlstra wrote:
> On Sun, Sep 20, 2026 at 04:16:39PM -0700, Namhyung Kim wrote:
> > The attach_perf_ctx_data() can race on global and !global cases.  The
> > global case is protected by global_ctx_data_rwsem and shares a single
> > reference count using perf_ctx_data.global field.
> > 
> > But when it races with !global case, it may miss to set the global field
> > and result in a reference count leak.
> > 
> >  CPU1                              CPU2
> >  ----------------------------------------------------------------
> >  attach_task_ctx_data(global=1)    attach_task_ctx_data(global=0)
> >    cd1 = alloc_perf_ctx_data()       cd2 = alloc_perf_ctx_data()
> >                                        try_cmpxchg() // ok
> >                                        // task->perf_ctx_data = cd2
> > 
> >      try_cmpxchg()            // fail; old = cd2; global = 0
> >      refcount_inc_not_zero()  // cd2->refcount++;
> >      free_perf_ctx_data()     // cd1
> 
> Urgh, took a good while to remember how all that worked. Also, I think
> it might have been clearer written like so:
> 
>   CPU1					CPU2
> 
>   attach_task_ctx_data(.global=1)	attach_task_ctx_data(.global=0)
>     cd1 = alloc_perf_ctx_data();	  cd2 = alloc_perf_ctx_data();
>     					  //	{ .global = 0, .refcount = 1 };
> 
>     					  try_cmpxchg(); // success, 
> 					  // task->perf_ctx_data = cd2
>     try_cmpxhg(); // fail; old = cd2
>     refcount_inc_not_zero(&old->refcount); // success
>       // old.refcount = 2
>     free_perf_ctx_data(cd1);

I see.  I'll do better next time.  Let me know if you want me to resend.

Thanks,
Namhyung

> 
> > Then later detach_global_ctx_data() will see the data but it's not
> > marked as global, so it won't call detach_task_ctx_data().
> > 
> > Fixes: 506e64e710ff ("perf: attach/detach PMU specific data")
> > Assisted-by: Sashiko.dev:Gemini-3.1-pro
> > Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> > ---
> >  kernel/events/core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index db7b76d6b68aa55d..e180134bad5e0ae3 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -5454,6 +5454,8 @@ attach_task_ctx_data(struct task_struct *task, struct kmem_cache *ctx_cache,
> >  		}
> >  
> >  		if (refcount_inc_not_zero(&old->refcount)) {
> > +			if (global)
> > +				old->global = true;
> >  			free_perf_ctx_data(cd); /* unused */
> >  			return 0;
> >  		}
> 
> 

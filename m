Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1CD3749E3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084322; cv=none; b=KKqb2l9RRKBfb2ZXQ5+aaeCedLws9NZZhHPAw2NP7QeKTo7R/ywqUffzJGdurE5Wc6DXFqzMhkkgqgXNnVYQErSVZMzKmPQ5FCoMZba/RaGPY0EtMyEG3xGWdfapF68wadhEiO7mibV3jo1f2R4gaM46QQDkECh63cQts8PfpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084322; c=relaxed/simple;
	bh=cZ22TuatyCtfFZGohTDkIEXa/tYAXeFUvYaAypCKE+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiE7VkxD7e50YFmcGNHIDoUZek0vmdHrsbqVUo2QETlZXCuYNp2eEOw/2DoirIRPb/vwxMypbpo32SDAeaBQweSdbQZwVLRZia/P1qs7n/nf2IESZLJjebDTZnxHCYj79VFf6rXFrQZ0adOHqaAa84um817FL0S+CGylDlNRxYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=p6unyari; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p6unyari"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=85+n5/rqOHCTfdnujxnx79wfxqBnCEiKC6qiTP8BuHo=; b=p6unyarirV3vf8F1ELIso9FVk7
	HJ5Gneb6QxKTBDXS6Wv+w03XDOX0N+ljaHWfO742FXmx8TweibtjkmS8t4mD997dcAO52eWzSDfOf
	IiXw3ex4f4aTh4yYIs4sjrv1uHDB0pLAoelU+6YG5CHQBu7655LJn++j7WjpsGDIQw/fMswxvycOZ
	0vWWC9JiCazIghIldiR2OeTuLYGuvmD2I/tvhi+tML0+O/8bzHkwduoJHj7+jt61USzgoH0sQdOld
	kaUa8z4OzCQpAUpRroGfH1QbgXbYJ8bsIoJv6Q5ya31mX2/GHS0LVgUS3M4gH4Qe2bXqf5Z5mPdYT
	rL1wgeVw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90hf-00000008u2A-3p1H;
	Tue, 22 Sep 2026 13:38:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7238C300708; Tue, 22 Sep 2026 15:38:35 +0200 (CEST)
Date: Tue, 22 Sep 2026 15:38:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] perf/core: Fix a refcount leak in
 attach_perf_ctx_data()
Message-ID: <20260922133835.GZ4121339@noisy.programming.kicks-ass.net>
References: <20260920231639.11910-1-namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920231639.11910-1-namhyung@kernel.org>

On Sun, Sep 20, 2026 at 04:16:39PM -0700, Namhyung Kim wrote:
> The attach_perf_ctx_data() can race on global and !global cases.  The
> global case is protected by global_ctx_data_rwsem and shares a single
> reference count using perf_ctx_data.global field.
> 
> But when it races with !global case, it may miss to set the global field
> and result in a reference count leak.
> 
>  CPU1                              CPU2
>  ----------------------------------------------------------------
>  attach_task_ctx_data(global=1)    attach_task_ctx_data(global=0)
>    cd1 = alloc_perf_ctx_data()       cd2 = alloc_perf_ctx_data()
>                                        try_cmpxchg() // ok
>                                        // task->perf_ctx_data = cd2
> 
>      try_cmpxchg()            // fail; old = cd2; global = 0
>      refcount_inc_not_zero()  // cd2->refcount++;
>      free_perf_ctx_data()     // cd1

Urgh, took a good while to remember how all that worked. Also, I think
it might have been clearer written like so:

  CPU1					CPU2

  attach_task_ctx_data(.global=1)	attach_task_ctx_data(.global=0)
    cd1 = alloc_perf_ctx_data();	  cd2 = alloc_perf_ctx_data();
    					  //	{ .global = 0, .refcount = 1 };

    					  try_cmpxchg(); // success, 
					  // task->perf_ctx_data = cd2
    try_cmpxhg(); // fail; old = cd2
    refcount_inc_not_zero(&old->refcount); // success
      // old.refcount = 2
    free_perf_ctx_data(cd1);

> Then later detach_global_ctx_data() will see the data but it's not
> marked as global, so it won't call detach_task_ctx_data().
> 
> Fixes: 506e64e710ff ("perf: attach/detach PMU specific data")
> Assisted-by: Sashiko.dev:Gemini-3.1-pro
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>  kernel/events/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index db7b76d6b68aa55d..e180134bad5e0ae3 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -5454,6 +5454,8 @@ attach_task_ctx_data(struct task_struct *task, struct kmem_cache *ctx_cache,
>  		}
>  
>  		if (refcount_inc_not_zero(&old->refcount)) {
> +			if (global)
> +				old->global = true;
>  			free_perf_ctx_data(cd); /* unused */
>  			return 0;
>  		}



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497485;
	b=CB2If7XrrnV7U1qUdAZPW9zlH5bRaAQMNfimLSUgcb+APM7fIbPbQTh3liwUDImS6yZj
	 hAuP/3T3ztgSXbm2PtS//fq2BZJ9NMIuhnmC40arXscXqy1rFHBrDrhrLBcXhADCVF/kX
	 67EiAeORQbg3ja8sFkzUg0H9si9JJWxZcvE0OPpx+OI/d/HsriGMjEH8mhC7nqLbiIk8J
	 mVvYlxDS2V7wx2bLqzXVrfCL43vv06WkI/ARuu11oNLnWXO1T4pV42An0NvqkEEbIYPvH
	 Q0VHXbkPpjijMnr+ia6n9FZfSDB5EpdIH/m+NdR5YTwzkYIpnbEMAW7EyzyJX/PoY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497485;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PkT2GkiSqzRW8/rD8ShyGxRMNHfJzXCXPeGwn+XAS5U=;
	b=M3ZQpNOg+VSdUSTXr0D6ABL954j76xDXUXVyq+zb64gZ2+u9Xd+6i9eIGLtPk39sLtgR
	 iNLkKXE11XHNPWMX5GgxSdwAeO7aXq5k/fgbk0W3Md6INV6KCTMRFKrezG9PMve346xZR
	 eQbhIfBrtpfQHNhPUqdkC8PVKF6h0G5i+FjtppcQDa0MfznHEWUccvJU0Ukmn3gmJmzG6
	 5ToNkMcp8V4nFqeprIFktJz2py9yA59ttUYBdUm5qHlpQcZTukexOmEXvdVx1K++o1Kkx
	 Zt+srE4z3YgXSGzfkBwEZTF5XUWUIhTH4pIL8xOCHhdaYHcemyroUXp4rNKJIWF5weQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Oquy4BV5;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC1D606A337
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC1D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Oquy4BV5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PkT2GkiSqzRW8/rD8ShyGxRMNHfJzXCXPeGwn+XAS5U=; b=Oquy4BV5rYhZOW6zfJwar1X0nG
	76/9NVev9nlC1TrW3N8IQP7UDzzLoyy5qxfc1W+87RVQzKosHADO2/24tpI3/vJSya28ghVn2Fm85
	K0YbsGVe2qex68hf1/nH1Ag91sX5hCPHuQYrsq4/bhiLXDbrr0KCvr+tTDddG7QogwuTKjWW4IhRD
	+sQhDBo4zrwDFpP/TVuq8FSfFzIJ+3nDd/3AhYDjSu4rb0uH8q4HeR5Wq0Kcrxib66cgbiKnDvSiR
	ymb1Vyl6RnwsEO0E+uhuk7/Y6r7SOv57xwTChNAQF4o3VDzThrx2Qv8FSRNVfXYUTWAo6dVkpVYwE
	pZ7rttjA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWlk-00000008WKA-34r3;
	Thu, 12 Nov 2026 15:31:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4BA9830057E; Thu, 12 Nov 2026 16:31:20 +0100 (CET)
Date: Thu, 12 Nov 2026 16:31:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Seiji Nishikawa <snishika@redhat.com>,
	Mian Yousaf Kaukab <ykaukab@suse.de>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <20261112153120.GU1779021@noisy.programming.kicks-ass.net>
References: <avXKCDm7NiVejDiF@techsingularity.net>
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
In-Reply-To: <avXKCDm7NiVejDiF@techsingularity.net>

On Thu, Nov 12, 2026 at 02:17:29PM +0000, Mel Gorman wrote:

> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 1535046a23ff..bb640278d30e 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -396,6 +396,13 @@ static inline void rt_queue_pull_task(struct rq *rq)
>  
>  static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
>  {
> +	if (p->nr_cpus_allowed <= 1)
> +		return;
> +#ifdef HAVE_RT_PUSH_IPI
> +	if (sched_feat(RT_PUSH_IPI) && is_migration_disabled(p))
> +		return;
> +#endif

Is there any down-side from unconditionally having that
is_migration_disabled() test there?

>  	plist_del(&p->pushable_tasks, &rq->rt.pushable_tasks);
>  	plist_node_init(&p->pushable_tasks, p->prio);
>  	plist_add(&p->pushable_tasks, &rq->rt.pushable_tasks);
> @@ -1448,7 +1455,7 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
>  	if (task_is_blocked(p))
>  		return;
>  
> -	if (!task_current(rq, p) && p->nr_cpus_allowed > 1)
> +	if (!task_current(rq, p))
>  		enqueue_pushable_task(rq, p);
>  }
>  
> @@ -1746,7 +1753,7 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
>  	 * The previous task needs to be made eligible for pushing
>  	 * if it is still active
>  	 */
> -	if (on_rt_rq(&p->rt) && p->nr_cpus_allowed > 1)
> +	if (on_rt_rq(&p->rt))
>  		enqueue_pushable_task(rq, p);
>  }

And can I ask you to do the same to DL ? Where possible we try and keep
them in-sync.

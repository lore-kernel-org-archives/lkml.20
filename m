Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F288F3812ED
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830960; cv=none; b=EAqrxyrh3LjlNPmQv2ZUcM4SsVyeUxRMs+CCjXjV+qNnFSF7N92Ny5I6YZqb34QsXEzJ0CtvFMMWqno/YTf31qN/1+zY65AiQ9cdtHhU88O0smFD4JBELHcUdlblRqXhKV6NP+YAEQOXkholT67u5YuUVq1/9qmCawLwOFTZf6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830960; c=relaxed/simple;
	bh=KyWDAoVnh+5GRMq5lDmNgYb/JKR6TogClFSK7d7ZwCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIaRTRg/5Jy1XkpLneqW0zDELEO4vKctDHe3glQTpG89dKoJnfGpqQkqrwCMwq/gAIFFUewZ3dlBR2jSrQq+LxxoUMh/wsNYsNolhPxHZkXn2Lm1O9ysmG4WqKJyc8hrCg/OJXmnLdEJ5tgNj50ogSdyifUMmRZTdzzFdc7mdcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=l7/LsleH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l7/LsleH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ROyaeeJT4o7yVPR+aS94XFS1ZME0iUR59iCvJi6xsyA=; b=l7/LsleHPjAv1359xD0W+PFxcs
	x+1D1n4psMmcr579AZm7+GlIG3ujrXE7TvOIQLzwuGqBkOv2OXJlYily1mStrM7iPVobP87XT2efq
	8fKmCtTFEcHPAPVKsjeJqwLjA30m/It/fSxmQzppmjkmYbtkOuKuWUGSriNpQU9X16yq89xOhSaOC
	LJpL0H6RQSaJK2Oxkq5goEbHJczKzl1809c6OZXif0rb2oEScLmGJM6/UXcl60EdGMk7kBjHBkfHC
	+XuM+uyo2pZqktQFUHGWecVebqzH5AEljcvnMDJoOxEGiI3YzgwC/XdnwJWLJNJDvMBRlHu7IbD4W
	o4oh6bIQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYV4-0000000Cjmv-3sgj;
	Thu, 27 Aug 2026 11:42:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CE9BD3006FA; Thu, 27 Aug 2026 13:42:29 +0200 (CEST)
Date: Thu, 27 Aug 2026 13:42:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/core: Convert remaining BUG_ON() instances to
 WARN_ON_ONCE()
Message-ID: <20260827114229.GK687043@noisy.programming.kicks-ass.net>
References: <20260827-warn_instead_bug-v1-1-b515c0f74b89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-warn_instead_bug-v1-1-b515c0f74b89@gmail.com>

On Thu, Aug 27, 2026 at 01:40:14PM +0200, Amin Gattout wrote:
> Commit 09348d75a6ce ("sched/all: Change all BUG_ON() instances in the
> scheduler to WARN_ON_ONCE()") left a few BUG_ON() behind in core.c.
> Convert them as well.
> 
> As described in Documentation/process/deprecated.rst, BUG_ON() crashes
> the system, which makes the failure harder to report and to debug, as
> the message often never reaches the console or the syslog. With
> WARN_ON_ONCE() the user gets a chance to see and report the problem
> instead, and system owners who do not want to keep running after an
> "impossible" condition can still set panic_on_warn.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
> Follow-up to commit 09348d75a6ce which converted the scheduler BUG_ON()
> instances to WARN_ON_ONCE() but left a few behind in core.c.
> 
> Build tested on arm64 with CONFIG_NO_HZ_FULL and CONFIG_SCHED_CLASS_EXT
> enabled so that every converted site is compiled.
> ---
>  kernel/sched/core.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f78275192036..bab74b4f0dd6 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5949,7 +5949,7 @@ static void sched_tick_stop(int cpu)
>  int __init sched_tick_offload_init(void)
>  {
>  	tick_work_cpu = alloc_percpu(struct tick_work);
> -	BUG_ON(!tick_work_cpu);
> +	WARN_ON_ONCE(!tick_work_cpu);
>  	return 0;
>  }
>  

> @@ -8954,13 +8954,13 @@ void __init sched_init(void)
>  	int i;
>  
>  	/* Make sure the linker didn't screw up */
> -	BUG_ON(!sched_class_above(&stop_sched_class, &dl_sched_class));
> -	BUG_ON(!sched_class_above(&dl_sched_class, &rt_sched_class));
> -	BUG_ON(!sched_class_above(&rt_sched_class, &fair_sched_class));
> -	BUG_ON(!sched_class_above(&fair_sched_class, &idle_sched_class));
> +	WARN_ON_ONCE(!sched_class_above(&stop_sched_class, &dl_sched_class));
> +	WARN_ON_ONCE(!sched_class_above(&dl_sched_class, &rt_sched_class));
> +	WARN_ON_ONCE(!sched_class_above(&rt_sched_class, &fair_sched_class));
> +	WARN_ON_ONCE(!sched_class_above(&fair_sched_class, &idle_sched_class));
>  #ifdef CONFIG_SCHED_CLASS_EXT
> -	BUG_ON(!sched_class_above(&fair_sched_class, &ext_sched_class));
> -	BUG_ON(!sched_class_above(&ext_sched_class, &idle_sched_class));
> +	WARN_ON_ONCE(!sched_class_above(&fair_sched_class, &ext_sched_class));
> +	WARN_ON_ONCE(!sched_class_above(&ext_sched_class, &idle_sched_class));
>  #endif
>  

These all really should be BUG_ON(), there is absolutely no point in
tying to complete the boot if they fail.



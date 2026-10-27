Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113995;
	b=rhVSnjemMYR3m8sz3lqwf1W4dWMPeP+YmShAdGYrBYxI70nfnf6xtddH9PX0PyBTnrj/
	 hJ+SwB6Uk4OjZTKRvv92F45YF6hc4/PipiMkSfJ8aHmUuF+7rzL/zMjFB+qN5FSL8KlxA
	 bMIjZ8FA2g16GqdNkK8DRzVkt0XwigLkj2HUPPWbYgH7i5wCqIwhQwTjEG8htxYR2nOmV
	 829xclweYOgQAGZbavOeTNCGD22q149Jjj2uLBZCBJI461euZH36cUFMWz9W4L5avSdvV
	 97ihkJ1lPlR9u0ZKsQtfRsy1tgBqoUuVJf76Q9n1nPB4dWy05jMDDZMdC5S7SCSZ82g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113995;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=k7gtWHEOV+0mRuwXS0LTgu0AujUebPCEBDxOMt4On4s=;
	b=Y3NhH3QyU0De02OkS7hkDKYf/AnncNHo81tXBEhdjKANKgCSqFEAG4S6p/eLTECexelx
	 wUmKWefbijAEck8GCz+cavZGNCG/zQZmA4c4q16ZmLnYk7oQy0h5Y80jakQDr+Lv4pdNH
	 B7Os/o9+Xk2B7bRvzk7keAGeAbmvh+FYSV096D/3n9Nwg8CZKhJ7XHGtV7pZ5C/Dd1Fsh
	 FkEZrMSNSME+JS4yHjrW5xTjEVIM6eVRB2G08ACr5D+ia54gjbpQpaPK8CpMta9KG6JnM
	 Y7MrP21cqXsTQPg8hPc5JE8vOGd41vIFGh/Mgh9ChJkIINMC7eTAGK1o+rWviJZ5Mwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Jy5VtYgT;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42661606A31E;
	Tue, 27 Oct 2026 15:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42661606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Jy5VtYgT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k7gtWHEOV+0mRuwXS0LTgu0AujUebPCEBDxOMt4On4s=; b=Jy5VtYgTq+FjBXHRfbvISorHsx
	VEfNu/EYcItiH4+ZF+zydU0Di1MBs1MWI6NepFWJoFNbK0liLIKbhjtCG9pmvefESXSmO1e/mz9em
	Mv/lk+raeGyIqM4+xKmgzAL1wJDpO2F2yP6kOxv/ixNc79X9B51sJAEIbGt1HkB7WDWy78Je9HCxf
	QIPtFXywHhbg9+ibT0PxutYZSE3j0d5QgyNOPQYTfUDCW21ffwBjZ6oNo1LRAmZKkAfnJ41ue0ud3
	nqoI3WNq8GABcSQoW9gwKuYzl8oZEl6eud7VmnWwirfwF5pKXDpwEjiCC5JBziLzNF0X9nDCJkhgb
	w8BPbWmg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLirP-0000000F88D-3qS1;
	Tue, 27 Oct 2026 15:13:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 494E7300312; Tue, 27 Oct 2026 16:13:11 +0100 (CET)
Date: Tue, 27 Oct 2026 16:13:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: linux-kernel@vger.kernel.org, stable@kernel.org
Cc: linux-tip-commits@vger.kernel.org, Q8 <cipher.gnep@gmail.com>,
	x86@kernel.org
Subject: Re: [tip: perf/urgent] perf: Fix perf_remove_from_context() event
 scheduling
Message-ID: <20261027151311.GB1739534@noisy.programming.kicks-ass.net>
References: <179284164324.4109677.8240630031562225279.tip-bot2@tip-bot2>
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
In-Reply-To: <179284164324.4109677.8240630031562225279.tip-bot2@tip-bot2>

On Sat, Oct 24, 2026 at 11:34:03AM -0000, tip-bot2 for Peter Zijlstra wrote:
> The following commit has been merged into the perf/urgent branch of tip:
> 
> Commit-ID:     d095321349222961813333277881b3c74f10b17b
> Gitweb:        https://git.kernel.org/tip/d095321349222961813333277881b3c74f10b17b
> Author:        Peter Zijlstra <peterz@infradead.org>
> AuthorDate:    Wed, 14 Oct 2026 14:45:51 +02:00
> Committer:     Peter Zijlstra <peterz@infradead.org>
> CommitterDate: Fri, 23 Oct 2026 19:09:52 +02:00
> 
> perf: Fix perf_remove_from_context() event scheduling
> 
> Q8 noted that it is possible to get into an inconsistent state when
> using perf_remove_from_context() on a group leader event.
> 
> Specifically, when the leader gets scheduled out, we should (when not
> destroying the grouping) schedule out the complete group, similar to
> __perf_event_disable().
> 

I noticed that I forgot the Fixes line :-/ This is an ancient oversight
afaict and needs backporting to all still maintained kernels.

Fixes: b04243ef7006 ("perf: Complete software pmu grouping")

> Reported-by: Q8 <cipher.gnep@gmail.com>
> Tested-by: Q8 <cipher.gnep@gmail.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/events/core.c |  9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index e248f34..f36a3bb 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -2590,6 +2590,7 @@ __perf_remove_from_context(struct perf_event *event,
>  	enum perf_event_state state = PERF_EVENT_STATE_OFF;
>  	unsigned long flags = (unsigned long)info;
>  
> +	perf_pmu_disable(pmu_ctx->pmu);
>  	ctx_time_update(cpuctx, ctx);
>  
>  	/*
> @@ -2603,6 +2604,13 @@ __perf_remove_from_context(struct perf_event *event,
>  	if (flags & DETACH_DEAD)
>  		state = PERF_EVENT_STATE_DEAD;
>  
> +	/*
> +	 * When disabling a group leader, the whole group becomes ineligible
> +	 * to run, so schedule out the full group.
> +	 */
> +	if (!(flags & DETACH_GROUP) && event == event->group_leader)
> +		group_sched_out(event, ctx);
> +
>  	__event_disable(event, ctx, state);
>  
>  	if (flags & DETACH_GROUP)
> @@ -2632,6 +2640,7 @@ __perf_remove_from_context(struct perf_event *event,
>  			cpuctx->task_ctx = NULL;
>  		}
>  	}
> +	perf_pmu_enable(pmu_ctx->pmu);
>  }
>  
>  /*

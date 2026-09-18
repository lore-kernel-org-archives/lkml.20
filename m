Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB2A4E73AE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733294; cv=none; b=P5cMBzl7G1d/YnEFLY+oRDxhVE3J4U3j9girQAmAocT9pxNI+AtV0loBfjMZY6bAd5+4C3ySieZVd8OpPOROv+9graWSvK7oAdiN9dOpfEiep2OcE/X4AtNQLQYsYX+4+oG7a4WWVmAyE+6R7PtlLaQnJ7yijZdfXwlioq+mNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733294; c=relaxed/simple;
	bh=jGFMeo8rnH0rgaRoJN0fqLAuq9c1lBVan3MVZcoXHJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx2UbTTuJhvy5habetMOoz6SMNiMCmW6yLbHmP3fEOP8QK7wPsbNIQTKhaypB4JgM6qksrL90ZVlYyLYH5Au9Y3F7OqDaMJl8o/Wb6y4DSDq0PKmO28IPbNH6VKM7iceTwRWOssPcCRoEsJKcuALj3/UzIAvVD77C4MrOR5B2gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3OzrdxL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3OzrdxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF8E1F00893;
	Fri, 18 Sep 2026 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789733291;
	bh=52El7aWxFiopJa3NshFClg/dLUmWjy1t/tfttnRy2lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l3OzrdxLcLWZ8lUoTlvOT/korfellc7RPercYMr9NTGabFtNNeU2uizjLgu5WL7ZP
	 scHI/Ju+/asmlcggxnkASrANz2afakDvLpXqf/RyCrcvt8INMirMdy/PODulQCjAbq
	 nhTKnELBNoxR0Ft+LVwiBy0CtHPc9wndfionsh5h7YecNAWxzzE25/moUdNFJ8xRS+
	 KQEMBIShpLtQLyV3bfdd9SCMUUWK8Nq8GvVyz/Y2YN98QXQ+U4I9wVumDDnRPsPN5Y
	 CrZGII9/DAxo0pyn9pLqH53V/akLajS5nRcl6QEqsodQcl/ZN7pfFD6pEpVGt4IOsN
	 +t1eA/W0f8Khg==
Date: Fri, 18 Sep 2026 14:08:07 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: anna-maria@linutronix.de, linux-kernel@vger.kernel.org,
	mingo@kernel.org, tglx@kernel.org, hannes@cmpxchg.org,
	shakeel.butt@linux.dev, riel@surriel.com
Subject: Re: [PATCH] tick/nohz: Avoid unused timekeeping_max_deferment() calls
Message-ID: <aq0pp8VCIyc3t-k_@localhost.localdomain>
References: <20260917163929.1271332-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917163929.1271332-1-usama.arif@linux.dev>

Le Thu, Sep 17, 2026 at 09:39:29AM -0700, Usama Arif a écrit :
> tick_nohz_next_event() limits a CPU's sleep interval to the maximum
> deferment supported by the current clocksource when that CPU owns the
> do_timer() duty. If the duty is unassigned, the limit also applies when
> the CPU's TS_FLAG_DO_TIMER_LAST flag is set.
> 
> After the early timer checks, the function currently reads the maximum
> deferment unconditionally. It then replaces the result with KTIME_MAX
> unless one of the two conditions above applies.
> 
> timekeeping_max_deferment() performs a seqcount-protected read of the
> shared timekeeper and follows its clocksource pointer. Check the do_timer
> state first and avoid this work when the result would be discarded. This
> leaves the resulting expiry unchanged and reduces accesses to timekeeper
> data that is modified regularly.
> 
> On x86-64 this removes 18-20 dynamically executed instructions, including
> the call, from the common non-owner path when the seqcount does not retry.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  kernel/time/tick-sched.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index c8f2c4a503b08..e7c7c28311156 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -872,18 +872,25 @@ static ktime_t tick_nohz_next_event(struct tick_sched *ts, int cpu)
>  	 * If this CPU is the one which had the do_timer() duty last, we limit
>  	 * the sleep time to the timekeeping 'max_deferment' value.
>  	 * Otherwise we can sleep as long as we want.
> +	 *
> +	 * Only read the max deferment in the former case: it is a seqcount
> +	 * read of the globally shared timekeeper, and on a large machine
> +	 * almost every caller is not the do_timer() CPU and would throw the
> +	 * value away.

I don't think that needs a comment.

>  	 */
> -	delta = timekeeping_max_deferment();
>  	tick_cpu = READ_ONCE(tick_do_timer_cpu);
>  	if (tick_cpu != cpu &&
> -	    (tick_cpu != TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_DO_TIMER_LAST)))
> -		delta = KTIME_MAX;
> -
> -	/* Calculate the next expiry time */
> -	if (delta < (KTIME_MAX - basemono))
> -		expires = basemono + delta;
> -	else
> +	    (tick_cpu != TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_DO_TIMER_LAST))) {
>  		expires = KTIME_MAX;
> +	} else {
> +		delta = timekeeping_max_deferment();
> +
> +		/* Calculate the next expiry time */
> +		if (delta < (KTIME_MAX - basemono))
> +			expires = basemono + delta;
> +		else
> +			expires = KTIME_MAX;
> +	}

If anything, it also makes the code more readable. You can even remove the delta
variable because even in its former use in the function, it's an unecessary
middle step.

Thanks.

>  
>  	ts->timer_expires = min_t(u64, expires, next_tick);
>  
> -- 
> 2.53.0-Meta
> 

-- 
Frederic Weisbecker
SUSE Labs

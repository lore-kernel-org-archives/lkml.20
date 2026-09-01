Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D32A37F32A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252159; cv=none; b=VtIfJsj9KgljfN/01l+y9aY55UZNbveTWTYb3S6nqqx4JpkMOpAXuGQkR4QIYGXSItbhvb4Qc2DwCpGcfBEo5Wk2vBth8KEOxbrg6Ew47ENQum4AvVDiv/1K8xeBkmkjSsVR1Eq2EhcMgbh4JamU4tNMTyCNyXJiroKQ7uqpVbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252159; c=relaxed/simple;
	bh=oKwWd4+UjdIbBAQ06Exd0ul4i9q2R9lhI1UmsrJgdpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WL36JTrQ6CcTGDT/LFgB7rLUBVNUO6mHy2JTNhLtS0TQ2ylPKcJIiVb0kT/GgoubIzLQ25IGmrrmUYxAz3LUmHWuvjMRumfdwP8kxTtmzxbC6pWglpafOAdcD1uv4UyzjbpeX9tQY6MnDYN2s+r8XFZYGbJhi08daC4s2qJVzmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vbSgiAtA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1+Cq2eoI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vbSgiAtA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1+Cq2eoI"
Date: Tue, 1 Sep 2026 10:42:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788252156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhPXNiDAN6kvJ1uZCaQ8oFUxafMsRCsLHzO46BB7VF0=;
	b=vbSgiAtAArnmQF7tMCMVjfDcqsOasdpnHVLghYE+BL8Frp6tvEsdqty6T2N7Z3H+DPMJvT
	orlph6CFSTo038GaNPeWKOyssk0fq5ZrSKFCFnQLUlGsZjpj6CLAnIS7U+YkKF1y+bxivb
	/ICTLB+FJa6bkTCgGijmSWrNMyGyAYQPRTCT/HRQH5rfBGZ/FBLRJGsVnehmTd5GONHCIF
	rNSlc+zC2V/3w/TsBLDZlXfwS20/XgfcuXyBB5utAUXjP/I29eCZ91osdVONP04rg18gTb
	qDzUX8YWssSX2NkmHZMhYp3THMwe6pRqC1E66yHlmZy3f9FLMbWNr0T8I4dblQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788252156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhPXNiDAN6kvJ1uZCaQ8oFUxafMsRCsLHzO46BB7VF0=;
	b=1+Cq2eoIQeVCHXjLsEXdchL93+2kg09fuNbUuaMxmhVjqIyn0IYq7lRxql9s66f8hKv7OW
	nUcGFwjlhJw9DcBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: tglx@kernel.org, luto@kernel.org, vincenzo.frascino@arm.com, 
	david.laight.linux@gmail.com, linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v3 2/3] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Message-ID: <20260901103557-b97d8a47-5c33-4045-af32-7fbe3ab6934b@linutronix.de>
References: <20260901020636.1821993-1-zhanxusheng@xiaomi.com>
 <20260901020636.1821993-3-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901020636.1821993-3-zhanxusheng@xiaomi.com>

On Tue, Sep 01, 2026 at 10:06:35AM +0800, Zhan Xusheng wrote:
> The vDSO basetime of a clock is stored in the scaled nanoseconds of
> tkr_mono, so that the reader can floor the base and the cycle delta
> together in vdso_calc_ns().
> 
> vdso_time_update_aux() instead shifts the base down to nanoseconds, adds
> the offset, and shifts it back up, which zeroes the fractional nanoseconds
> of xtime_nsec.  The reader then floors the base and the delta separately:
> 
>   ktime_get_aux():  base + ((delta * mult + xtime_nsec) >> shift)
>   vdso:             base + (xtime_nsec >> shift)
>                          + ((delta * mult) >> shift)
> 
> Since floor(a) + floor(b) <= floor(a + b), the vDSO reports 0 or 1 ns
> below the syscall for the same clock.  clock_getres() reports 1 ns for
> auxiliary clocks, so that is the full advertised granularity.  It is not a
> monotonicity problem: across an update the step is
> floor(a + d) - floor(a) - floor(d), which is 0 or 1, never negative.

I am not so sure I understand the "so that is the full advertised granularity".
In my interpretation we are violating the expected granularity.
Not that anybody will be able to observe the issue.
I would just remove this sentence.

> Add the offset in scaled nanoseconds as the other high resolution clocks
> do, and normalise with __iter_div64_u64_rem() so that the stored base
> stays below one second and the userspace fast-path does not iterate more
> in __iter_div_u64_rem().
> 
> monotonic_to_aux.tv_nsec is a normalised timespec64 fraction, so it stays
> below NSEC_PER_SEC even for a negative offset, and the sum stays below
> 2 * (NSEC_PER_SEC << shift).  The largest shift clocks_calc_mult_shift()
> can pick is 32, which makes that 8.6e18 against a u64 limit of 1.8e19.
> 
> Fixes: 380b84e168e5 ("vdso/vsyscall: Update auxiliary clock data in the datapage")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  kernel/time/vsyscall.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
> index 993258d5f1e7..697adc44eebf 100644
> --- a/kernel/time/vsyscall.c
> +++ b/kernel/time/vsyscall.c
> @@ -157,11 +157,11 @@ void vdso_time_update_aux(struct timekeeper *tk)
>  
>  		vdso_ts->sec = tk->xtime_sec + tk->monotonic_to_aux.tv_sec;
>  
> -		nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
> -		nsec += tk->monotonic_to_aux.tv_nsec;
> -		vdso_ts->sec += __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
> -		nsec = nsec << tk->tkr_mono.shift;
> -		vdso_ts->nsec = nsec;
> +		nsec = tk->tkr_mono.xtime_nsec;
> +		nsec += (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;
> +		vdso_ts->sec += __iter_div64_u64_rem(nsec,
> +					(u64)NSEC_PER_SEC << tk->tkr_mono.shift,
> +					&vdso_ts->nsec);

The same alignment issue as the previous patch. With that fixed:

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

>  	}
>  
>  	__arch_update_vdso_clock(vc);
> -- 
> 2.43.0
> 

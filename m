Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FB7416D17
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182495; cv=none; b=jjnkCn/zPTKPWZdJgZf0cv2vso9WYnGUy72ZyKWPBRL6sMG+cUAoCKS3SX6G68jK82svMfyC78d3jbPjldBJYM4g8RgybxeOiCe7e81mYQEKbS0FxfnvkP83szQPwHuoyKwo0mUZZUt0lGaSKyJShfqymLdk2kOfmWeSNLPeD0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182495; c=relaxed/simple;
	bh=M6K6eOdzQzC72+yAcTp2Q6IrMMX/CK96uyv14cjqXQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ar7gRd7pedlSbvsxkvaFe/FffiDX4Kgr9c2nrCrVsadwXagHieCUQk41rW6fGzh+GyDph3YOtUYSHhjAEDeW1Ozn/EJ4MVbx/UUccb0I9J4gpgGUeCIASeUVGYOXMYBSsp+TplAEa3FhuiLsIwwSWfZ55NQC+Zd90p2bPPu6oTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MV62OTGj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H/rqYf4o; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MV62OTGj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H/rqYf4o"
Date: Mon, 31 Aug 2026 15:21:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788182492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oITgN6+Ud0YnpPqEbjxgxti/HBV8kvTpIdh24+/F3bs=;
	b=MV62OTGjUBOs7xLW5eq+tgJ4qdcqiDoMjox3V+/Yq/bcpSQvsrLZXZcKjEPTiKKu0FP1nm
	pJh4qKJq6j5eswbYmjoPNNeGh74aq5cB73XQAluE2u+e2ySxkyBp4Ev5IA1tqVCfBsTmYq
	I6nipkwtUWyU3wYO5uOyGyEOsVfhnDOI4Sj20pa+3me4G59/titoas1C58qx3R7Wwp3yOS
	QF7VbEey2R7s05Q2tqktVPpUUOUthmjXTZcrjGfQLwLuo3F6hBg3y1S5CHWkDYgi2MPXKb
	5FShEMCZmFuFRmmuXGQR7lVud0gbyB+sWYUK7LyMwcHPxFS/7+Lz7pv/gkK26w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788182492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oITgN6+Ud0YnpPqEbjxgxti/HBV8kvTpIdh24+/F3bs=;
	b=H/rqYf4oEthKFYbkpDnhl9Z/Rms7wnmLgUZDY9x9dg0V4qR0WNfXfB+EShr6/Q3JhjpyPZ
	kUSQIWCNVC7UxwAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: tglx@kernel.org, luto@kernel.org, vincenzo.frascino@arm.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH 2/3] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Message-ID: <20260831151926-001cca9b-42f2-4863-b902-1611675c3cce@linutronix.de>
References: <20260831125557.1490398-1-zhanxusheng@xiaomi.com>
 <20260831125557.1490398-3-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831125557.1490398-3-zhanxusheng@xiaomi.com>

On Mon, Aug 31, 2026 at 08:55:56PM +0800, Zhan Xusheng wrote:
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
> 
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
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  kernel/time/vsyscall.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
> index 165ad9d7f154..ab3ef1e7d3c8 100644
> --- a/kernel/time/vsyscall.c
> +++ b/kernel/time/vsyscall.c
> @@ -137,8 +137,8 @@ void vdso_time_update_aux(struct timekeeper *tk)
>  	struct vdso_time_data *vdata = vdso_k_time_data;
>  	struct vdso_timestamp *vdso_ts;
>  	struct vdso_clock *vc;
> +	u64 nsec_per_sec, nsec;
>  	s32 clock_mode;
> -	u64 nsec;
>  
>  	vc = &vdata->aux_clock_data[tk->id - TIMEKEEPER_AUX_FIRST];
>  	vdso_ts = &vc->basetime[VDSO_BASE_AUX];
> @@ -156,10 +156,11 @@ void vdso_time_update_aux(struct timekeeper *tk)
>  
>  		vdso_ts->sec = tk->xtime_sec + tk->monotonic_to_aux.tv_sec;
>  
> -		nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
> -		nsec += tk->monotonic_to_aux.tv_nsec;
> -		vdso_ts->sec += __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
> -		nsec = nsec << tk->tkr_mono.shift;
> +		nsec_per_sec = (u64)NSEC_PER_SEC << tk->tkr_mono.shift;

Same as for the previous patch, the additional variable hurts in my opinion.

> +
> +		nsec = tk->tkr_mono.xtime_nsec;
> +		nsec += (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;
> +		vdso_ts->sec += __iter_div64_u64_rem(nsec, nsec_per_sec, &nsec);
>  		vdso_ts->nsec = nsec;
>  	}
>  
> -- 
> 2.43.0
> 

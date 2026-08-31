Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B7D3BD62F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182367; cv=none; b=U4FLOzmX19YGMiNRjPwuLdf02Gq9evfu1s0AMf9g/Kmn+d3k+MrY46RvGNWfYtlf/Z64GrlHoaEPSYQiDjx5EIlVlJErGctVeVJboePkFt/c5w00TgGtJl4ejyDMXcYmD734NLuOPq2R0njjUoJeZDW9d3yJFluYMU5mpIikOno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182367; c=relaxed/simple;
	bh=7xGC96ujopUkU+UqcUAHjGnUmSncoT/o2O4S8hlCmVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZyaMQz0pDARCDf1K55nlHEwAsFL6OGVP0QdcIdBhsQeLwGOXxa+qlAJHiv7z4Ol4f6RKGud0fxAJEwa6cj7M41EQoO82J8JIohG5Dxg3LYj7LiN73AkmJld/IkLoheaQHeQK5//0GhvJrNPX5IWsICRgGPm+YXzksVEW+K2+Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xwKWAlNX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u0Rarnbq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xwKWAlNX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u0Rarnbq"
Date: Mon, 31 Aug 2026 15:19:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788182363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TOLp+u5MWK3qjhDVFzciDIpxXySLzbDDsNQFWcMd8Dc=;
	b=xwKWAlNXxkWRVaLIQ48fK4CYbMrV3A97fsCxO4Y4aOGVNHxwk9P8nGdOAChE34Z7u0ZHOg
	wo3oGekym1siwExQfLHgqO+sCdZkYxnepC7QxrC1LNwaityVLt1rTyETEKKQiRqhl3/cd7
	g45qN5n36+u4PtjCf8exTSVNoFyakKBAefdMz0116y4VKMprydp02Y+uRS5RhTFwYZqY74
	JYtjHAZxGo25YPnGP14yVVmGnxYgve2TGGYKkdc52qJUYtQLxGXr+kqt8kBocx+uaGT8jb
	SxTPGzm342mNu/gYI7TSCgYTf7mwyff6/pYd16ERV6cX6boQSot/8Kbl437KCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788182363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TOLp+u5MWK3qjhDVFzciDIpxXySLzbDDsNQFWcMd8Dc=;
	b=u0RarnbqVG494TrvFxJtFKgCoP2nWgiMoc2BdRikzIn+1GBTocuDC1dYHEh22cCBHGBQRH
	Lohq5P7sobDKcFCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: tglx@kernel.org, luto@kernel.org, vincenzo.frascino@arm.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH 1/3] vdso/math64: Add and use __iter_div64_u64_rem()
Message-ID: <20260831150809-69e32b39-faf8-4e22-9a1c-74c15c019d2d@linutronix.de>
References: <20260831125557.1490398-1-zhanxusheng@xiaomi.com>
 <20260831125557.1490398-2-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831125557.1490398-2-zhanxusheng@xiaomi.com>

On Mon, Aug 31, 2026 at 08:55:55PM +0800, Zhan Xusheng wrote:
> The vDSO basetimes for CLOCK_MONOTONIC and CLOCK_BOOTTIME are kept in the
> scaled nanoseconds of tkr_mono, so normalising them means dividing by
> NSEC_PER_SEC << shift, which does not fit the u32 divisor of
> __iter_div_u64_rem().
> 
> update_vdso_time_data() therefore open-codes the iterative division twice.
> Turning the loops into a plain modulo is not an option either, as the vDSO
> has no 64-bit division helpers on 32-bit.
> 
> Add __iter_div64_u64_rem(), the u64-divisor counterpart of
> __iter_div_u64_rem(), keeping the asm() barrier that stops the compiler
> turning the loop into a division, and use it for both.
> 
> No functional change.
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  include/vdso/math64.h  | 21 +++++++++++++++++++++
>  kernel/time/vsyscall.c | 17 ++++++-----------
>  2 files changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/include/vdso/math64.h b/include/vdso/math64.h
> index 22ae212f8b28..eb39d3411981 100644
> --- a/include/vdso/math64.h
> +++ b/include/vdso/math64.h
> @@ -21,6 +21,27 @@ __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
>  	return ret;
>  }
>  
> +static __always_inline u64
> +__iter_div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
> +{
> +	u64 ret = 0;
> +
> +	while (dividend >= divisor) {
> +		/*
> +		 * Prevent the compiler from optimising this loop into a
> +		 * modulo operation.
> +		 */
> +		asm("" : "+rm"(dividend));

This could probably be OPTIMIZER_HIDE_VAR(), but for consistency with 
__iter_div_u64_rem() it should probably stay like it is.

> +
> +		dividend -= divisor;
> +		ret++;
> +	}
> +
> +	*remainder = dividend;
> +
> +	return ret;
> +}
> +
>  #if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
>  
>  #ifndef mul_u64_u32_add_u64_shr
> diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
> index aa59919b8f2c..165ad9d7f154 100644
> --- a/kernel/time/vsyscall.c
> +++ b/kernel/time/vsyscall.c
> @@ -30,21 +30,21 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
>  {
>  	struct vdso_clock *vc = vdata->clock_data;
>  	struct vdso_timestamp *vdso_ts;
> -	u64 nsec, sec;
> +	u64 nsec_per_sec, nsec, sec;
>  
>  	fill_clock_configuration(&vc[CS_HRES_COARSE],	&tk->tkr_mono);
>  	fill_clock_configuration(&vc[CS_RAW],		&tk->tkr_raw);
>  
> +	/* One second in the scaled nanoseconds of tkr_mono */
> +	nsec_per_sec = (u64)NSEC_PER_SEC << tk->tkr_mono.shift;

I am not a fan of the additional variables introduced in this patch.
Both the patch itself and the final code are harder to understand with
them in my opinion.
If you want to keep them, they should be introduced in a dedicated patch.

> +
>  	/* CLOCK_MONOTONIC */
>  	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];
>  	vdso_ts->sec	= tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
>  
>  	nsec = tk->tkr_mono.xtime_nsec;
>  	nsec += ((u64)tk->wall_to_monotonic.tv_nsec << tk->tkr_mono.shift);
> -	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
> -		nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
> -		vdso_ts->sec++;
> -	}
> +	vdso_ts->sec	+= __iter_div64_u64_rem(nsec, nsec_per_sec, &nsec);

This could directly store the result in vdso_ts->nsec if it produces better code.

>  	vdso_ts->nsec	= nsec;
>  
>  	/* Copy MONOTONIC time for BOOTTIME */
> @@ -55,12 +55,7 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
>  
>  	/* CLOCK_BOOTTIME */
>  	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
> -	vdso_ts->sec	= sec;
 
I would leave this on its own line for the comment about the copy for BOOTTIME
to be easier to understand.

> -
> -	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
> -		nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
> -		vdso_ts->sec++;
> -	}
> +	vdso_ts->sec	= sec + __iter_div64_u64_rem(nsec, nsec_per_sec, &nsec);
>  	vdso_ts->nsec	= nsec;
>  
>  	/* CLOCK_MONOTONIC_RAW */
> -- 
> 2.43.0
> 

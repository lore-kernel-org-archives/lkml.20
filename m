Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B4B2E7F20
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251734; cv=none; b=DF/8lqecFVSKlSyZERqOUrJ6vGPnW4TnPJEGIQXY3d6xsrMdb5jaMxRtcHoX9nFjnt+dWBkcU8c48D0KOrT7bs5KcauaxnrXfMR4i4yynSogAuG2pYrQi6QKtslTMLBtT4IDBaoiRuXCikgutWkAo4oiKw+uz8Yb350Ltwf3Y9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251734; c=relaxed/simple;
	bh=IPTJ4LjTx1DOcLiTlRAhqeO5ActK2QvHzlojAHqv8hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeKiRUZp5ygIiqHEEaRzpMGVjk0S8XQHK274hS8JmPpvq0oiZl6fRPLJiJLldx+m96z/AOA/UjdI7gsq8J3MhAcFts8z9soDNXHt1LpD4//N5gpagXvbS2Aw7eSj5XzwQVcz4GR6p6yU4wuNMuLVIOW4jEpWGz9/XNRoxFOhJgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=git3oQU2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1anLpc9o; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="git3oQU2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1anLpc9o"
Date: Tue, 1 Sep 2026 10:35:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788251731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RhRzjVz7xF33MH72DS+XiGDNvsktrYBnU4oS7bSY8WM=;
	b=git3oQU2lhSkt5gNY91uWwWLJ/8S1bAnXY22XyaZ6/vbeTMdDxekC2d+JpFP3DXNwfoLTa
	dvZ4Ing2oaocrgFiO9MD9KUE2JJTBsf6+pdFfWOWGRcRv0tcM4YvsGLeWMjeVRNx126/fu
	2DUVV5XRZFv7aDHVN+canyKsVw9UrfK2xZwLX89d+Kip9yyVEeg0/FgT4dOHVigbGgdgTd
	uQBxzYJ+TyUKfmiIuxuLzbUn1fIhwyWpXdHU7NaK7GcB8rFxCZcUtOe6tutC+Nsx+AVZ7W
	RzN8X2SYqdx1od312EvVn9o9QvSj8ZxDsYvTxZ0dHUsKtRRnUc2DLiyVcbZb6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788251731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RhRzjVz7xF33MH72DS+XiGDNvsktrYBnU4oS7bSY8WM=;
	b=1anLpc9omvLC+Tj9Ui7LAUTgVWaUSMz7gSfi7IUxAEr46uciSelUhbCDETDrTmxjUghVGB
	Vx8z9uDabflUVXAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: tglx@kernel.org, luto@kernel.org, vincenzo.frascino@arm.com, 
	david.laight.linux@gmail.com, linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v3 1/3] vdso/math64: Add and use __iter_div64_u64_rem()
Message-ID: <20260901102036-f5a7282d-4d8f-4f4a-89b3-7a75c83582c0@linutronix.de>
References: <20260901020636.1821993-1-zhanxusheng@xiaomi.com>
 <20260901020636.1821993-2-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901020636.1821993-2-zhanxusheng@xiaomi.com>

Hi Zhan,

thanks for the new version. However please slow down a bit with sending new
revisions to give people time to respond.

On Tue, Sep 01, 2026 at 10:06:34AM +0800, Zhan Xusheng wrote:
> The vDSO basetimes for CLOCK_MONOTONIC and CLOCK_BOOTTIME are kept in the
> scaled nanoseconds of tkr_mono, so normalising them means dividing by
> NSEC_PER_SEC << shift, which does not fit the u32 divisor of
> __iter_div_u64_rem().
> 
> update_vdso_time_data() therefore open-codes the iterative division twice.
> Turning the loops into a plain modulo is not an option either, as the vDSO
> has no 64-bit division helpers on 32-bit.

This is not vDSO userspace code, but on the kernel side.
The problem is that divisions are unnecessarily slow.

Also a module alone would not be enough, as we need the division result.

> Add __iter_div64_u64_rem(), the u64-divisor counterpart of
> __iter_div_u64_rem(), and use it for both.  The remainder goes straight
> into the basetime as the coarse clocks already do, which also makes the
> copy of the CLOCK_MONOTONIC values for CLOCK_BOOTTIME take both of them
> from the same place.
> 
> The quotient is a u32 like the u32-divisor version returns.  A loop that
> subtracts only makes sense when it iterates a handful of times, and it
> keeps 32-bit from carrying the counter in a register pair: vsyscall.o
> loses 16 bytes of text on x86-64 and the loop drops from 36 to 28
> instructions on 32-bit gcc.
> 
> The barrier keeps the value in a register rather than offering a memory
> alternative like __iter_div_u64_rem() does.  Both forms stop the loop
> becoming a division, but clang takes the memory alternative and spills
> inside the loop, on 64-bit as well.  Converting __iter_div_u64_rem() the
> same way is worth 64 bytes of vdso64 text and 112 of vdso32 built with
> clang 18, since it sits on the clock_gettime() path through
> vdso_set_timespec(); that is left for a separate patch as it also has
> users outside the vDSO.
> 
> No functional change.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  include/vdso/math64.h  | 22 ++++++++++++++++++++++
>  kernel/time/vsyscall.c | 18 +++++++-----------
>  2 files changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/include/vdso/math64.h b/include/vdso/math64.h
> index 22ae212f8b28..02abdf6e82ed 100644
> --- a/include/vdso/math64.h
> +++ b/include/vdso/math64.h
> @@ -21,6 +21,28 @@ __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
>  	return ret;
>  }
>  
> +static __always_inline u32
> +__iter_div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
> +{
> +	u32 ret = 0;
> +
> +	while (dividend >= divisor) {
> +		/*
> +		 * Prevent the compiler from optimising this loop into a
> +		 * modulo operation.  Keep the value in a register, as clang
> +		 * spills it when offered a memory alternative.
> +		 */
> +		asm("" : "=r"(dividend) : "0"(dividend));

This is now the same as OPTIMIZER_HIDE_VAR(). Let's use the standard macro.
In my opinion we can then also drop the comment about the memory alternative.

If this variant is proven to be the better one, we should also use it in
__iter_div_u64_rem(), in a new first patch.
Any unnecessary divergence will confuse future readers.

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
> index aa59919b8f2c..993258d5f1e7 100644
> --- a/kernel/time/vsyscall.c
> +++ b/kernel/time/vsyscall.c
> @@ -41,14 +41,13 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
>  
>  	nsec = tk->tkr_mono.xtime_nsec;
>  	nsec += ((u64)tk->wall_to_monotonic.tv_nsec << tk->tkr_mono.shift);
> -	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
> -		nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
> -		vdso_ts->sec++;
> -	}
> -	vdso_ts->nsec	= nsec;
> +	vdso_ts->sec	+= __iter_div64_u64_rem(nsec,
> +				(u64)NSEC_PER_SEC << tk->tkr_mono.shift,
> +				&vdso_ts->nsec);

This alignment looks off. You have 100 characters width. Better:

	vdso_ts->sec	+= __iter_div64_u64_rem(nsec,
					        (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
						&vdso_ts->nsec);

>  
>  	/* Copy MONOTONIC time for BOOTTIME */
>  	sec	= vdso_ts->sec;
> +	nsec	= vdso_ts->nsec;
>  	/* Add the boot offset */
>  	sec	+= tk->monotonic_to_boot.tv_sec;
>  	nsec	+= (u64)tk->monotonic_to_boot.tv_nsec << tk->tkr_mono.shift;

(...)

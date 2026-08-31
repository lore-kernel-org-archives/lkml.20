Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C5841A929
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182536; cv=none; b=JjddU5Bi8JJlHb9Q3+R634YdbMuCo24o69ayny0y8z3I3hfoEzCJ0Pigv+JevpB2WDtJ9k2KNeh9vVnhVJ6wYncn0a4vJ9UnM6wP4he7KQCytnQg5W0URRXSIIlA1K/0+EPFHCDrNT1zegrq4/XauGpgFBDZ5DSW9iSSzQAeZ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182536; c=relaxed/simple;
	bh=nCQ6+oofQuSEDvnhPzan5mRG+9Fwk44u6N3GaZaeZWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFlzzxsrUDj1O21ZqMPn1pBIkupma8Tsn5bNncWAXQ8wx4pOOJCuTQkJmFSMspiN0d0uAfg/F18RwfihaXKfSQCVXgPpC6cqeWlq4GWwCy85YPfGMZX95Uj8WOtbexPUWCp05sRxvIUFG/H6NB069Ha02fkjdkBj6NyyW5AMVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=as9ccdcO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iQ8oNp+n; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="as9ccdcO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iQ8oNp+n"
Date: Mon, 31 Aug 2026 15:22:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788182533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sizhxj91uzugqiBy8jTsrmCR813LXoCpZ1usC34/u/o=;
	b=as9ccdcOp9+qTy/Nfa3Q3ui9t43s7jRjxwVshIiF4auUp08y4iOlFfFttoLHREvEHMk6Lm
	i8M/Zv+71wDydwCk9vXCd8nQjVVhfjOL/CDk9oGE+VcNrioG3KuTGTNV9EChbQSk5r5Wxi
	DL5sLFfAX7v1AxJObBwc4JDq1NIwqJPODhAemWMnXJcTJDP+HGCh+61xQbsPqQd45r4/F6
	YToINH+5xSMmRNrW1FrbVDfoRLDG7rskjO1oe0sFsJGd61pMuh+rtb27eb6+cos4pX4r6X
	bbgwkJibkj2Ne8kbFkEIlt3RCfvQkrbNNioPbtVy2N3ern44nLLN+MoANEZy+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788182533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sizhxj91uzugqiBy8jTsrmCR813LXoCpZ1usC34/u/o=;
	b=iQ8oNp+n+cmdG/UUryEY7UDvMiB7dRo8bKqdIbIjfjoHe/boJf6g+SS9r/U123W/FOK5Yg
	8wNJqZm07LK/AbBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: tglx@kernel.org, luto@kernel.org, vincenzo.frascino@arm.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH 3/3] vdso/gettimeofday: Assert that the clock id fits the
 dispatch mask
Message-ID: <20260831152134-d5b16bbf-e245-4e0f-8079-a4c0b2fa5b28@linutronix.de>
References: <20260831125557.1490398-1-zhanxusheng@xiaomi.com>
 <20260831125557.1490398-4-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831125557.1490398-4-zhanxusheng@xiaomi.com>

On Mon, Aug 31, 2026 at 08:55:57PM +0800, Zhan Xusheng wrote:
> The clock id dispatch turns the id into a bit in a u32:
> 
>   if (!vdso_clockid_valid(clock))
>       return false;
>   msk = 1U << clock;
> 
> vdso_clockid_valid() admits everything up to CLOCK_AUX_LAST, which is 23,
> so the shift is in range.  Nothing states the dependency though, and
> raising MAX_AUX_CLOCKS past 16 would take CLOCK_AUX_LAST to 32 or beyond
> and make the shift undefined.
> 
> Assert it at both dispatch sites.  The condition is on a parameter rather
> than a constant, so it relies on the compiler deriving the range from the
> vdso_clockid_valid() bail-out above it.  gcc 13 and clang 18 both do: x86
> vdso64 and vdso32 build clean, and raising MAX_AUX_CLOCKS to 17 fails the
> assert as intended.
> 
> Suggested-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Thanks!

> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  lib/vdso/gettimeofday.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index f7a591aba59f..ef4dcc614489 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -285,6 +285,7 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
>  	 * Convert the clockid to a bitmask and use it to check which
>  	 * clocks are handled in the VDSO directly.
>  	 */
> +	BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
>  	msk = 1U << clock;
>  	if (likely(msk & VDSO_HRES))
>  		vc = &vc[CS_HRES_COARSE];
> @@ -438,6 +439,7 @@ bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t cloc
>  	 * Convert the clockid to a bitmask and use it to check which
>  	 * clocks are handled in the VDSO directly.
>  	 */
> +	BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
>  	msk = 1U << clock;
>  	if (msk & (VDSO_HRES | VDSO_RAW)) {
>  		/*
> -- 
> 2.43.0
> 

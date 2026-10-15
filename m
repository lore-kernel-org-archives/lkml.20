Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908442561A7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072469; cv=none; b=McQea5bHDUnaRvWu2q/hCgcPH93yJeiA033JgJY6BsD3gWHi52tLjhkvcJ8bdiz0IeDsIMW6pRJlS/i2P1RYjRMQjaHgfgl29JzhF5WM2pn/np+KZ8YzCg70bLMxj5C8A0Dd36CZsSq4jc1aaFM95yW6IhY5gUflZHSLEpRFTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072469; c=relaxed/simple;
	bh=RKoNVOXCp8qsN4DcHk+1UC1jFMXL7m4Hi10xFI2EHN0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VYzPn/TDvSZoc8zstdhvW+wLV+YiqF9icNAysZ9nQ2jgkpjQPR3rxwOfip42N1SxcUJ/NdnT6EWgEEU58njyzNIP228C39IeVyT8CiUhVRuEdxgqqE75+0NchNWkkFdM3ZrVgIXvrbVswwyoWSA2+Ucs6cHvb/VBK9SJ1WRrqPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSzo+eaN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSzo+eaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FA51F000C4;
	Thu, 15 Oct 2026 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792072468;
	bh=BFPdqutyanNb6ILkvXDEkcFQ0NvuKB2CJGvrxzH7h7k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cSzo+eaNYyXzy7OgN2PteT5GAqWLpHj4Ka2swm+80ueO+rX/EAfziENw95QkE5VKY
	 K6gLAINdaYSFSfuZZk4Frntf1DBWSOYiFYkLmOH4VQC1XR7YnOnR9twZ4Gfh3S8yBK
	 Xp17u9ZW/YyHyMl9fpEfTKqS9moWiRc/Rk0VBfwZiwFbb96f5bYLoGRGFt5xOZbROP
	 mYqX/I33l/QidkJvz6HwMkO77si5SGG85kQ/xc6bEjQ0yvOT3w3C5yjQpX/TxDOmIr
	 VhJ7nA9GGZsExeV4i7BhoIxJ9tgfCrEc6GnjlecxQZPCI/jb9qvzMtYlLBPrF4kHRL
	 HTo2KWDO6exuw==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, Thomas =?utf-8?Q?Wei=C3=9Fsc?=
 =?utf-8?Q?huh?=
 <thomas.weissschuh@linutronix.de>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, David Laight
 <david.laight.linux@gmail.com>, linux-kernel@vger.kernel.org, Zhan Xusheng
 <zhanxusheng@xiaomi.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 5/5] vdso/gettimeofday: Assert that the clockid fits
 into the u32 bitmask
In-Reply-To: <20261002153104.1347978-6-zhanxusheng@xiaomi.com>
References: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
 <20261002153104.1347978-6-zhanxusheng@xiaomi.com>
Date: Thu, 15 Oct 2026 15:54:24 +0200
Message-ID: <87ik33dq7j.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 02 2026 at 23:31, Zhan Xusheng wrote:
> __cvdso_clock_gettime_common() and __cvdso_clock_getres_common() convert
> the clockid into a bitmask and match it against VDSO_HRES, VDSO_COARSE,
> VDSO_RAW and VDSO_AUX:
>
> 	msk = 1U << clock;
>
> vdso_clockid_valid() rejects anything above CLOCK_AUX_LAST beforehand,
> and CLOCK_AUX_LAST is 23, so the shift count is in range.  Nothing
> records that dependency though.  Raising MAX_AUX_CLOCKS beyond 16 moves
> CLOCK_AUX_LAST to 32 and makes the shift undefined.
>
> Add a BUILD_BUG_ON() at both conversion sites.  The condition is on a
> function parameter rather than a constant, so it relies on the compiler
> deriving the range from the vdso_clockid_valid() bail-out above it.  gcc
> 13 and clang 18 both do: the x86 vdso64 and vdso32 builds stay clean, and
> raising MAX_AUX_CLOCKS to 17 trips the assert.

But using 'clock' for the assert is fragile as it relies on the compiler
to defer the maximum 'clock' value from vdso_clockid_valid().

Checking for CLOCK_AUX_LAST >= BITS_PER_TYPE() should be sufficient, no?

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

Aside of that why do we need the same BUILD_BUG_ON() in two functions?

Thanks,

        tglx

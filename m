Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BAC3D3337
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167068; cv=none; b=mprPVXQOzIDOExIHee3M4G7KAJWyjSWwpGLvC4WinaKabhQXqKzJTjqgDmvy2k9hJteV9jq/2lXcs6bQoRlz5OuXMBAcqD2Hssu6R5CwVQ/Li4jO0YPdxU8gjAGZWt95XK0pT1Rn/6OuyLD4PCWppWcqKriiXLW1hiJg0t6q+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167068; c=relaxed/simple;
	bh=IHjsxXtergBYvj5LIwzxvkROJPBLJM+elk1Y2VUbeTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBwQjX7VXSi8d8oWWjO/ufDzQ0qzYn9iXd21gog3dSvAi6hVcRbAJdERnxeJ+Y4v/6ptaomOZY6Gqmc2mKh2AJnGUXtooMot9R87gMVBXOO7kDN6027DkN+0BmdoiaPo0iKjMRVcZZZ/UqDSOIrRm4lM5s+3C8UgjUHQEAitbTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vOCxfhBX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fSH6ZFmS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vOCxfhBX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fSH6ZFmS"
Date: Mon, 31 Aug 2026 11:04:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788167065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1sGAuUsorIPoXLcHExy6R5Npsjt3fjLx3bhvgg32Y0=;
	b=vOCxfhBXzddbCukDkVAxQ8+Lq3kul34bBNJajw3LvIc+4XXnWTpGCYQ2vfocX2mY8voBE8
	Cn5QGK3XTaTPpWzFVoq6Q6zVpgWSxxXuVk6B9ttBYGCpu7qPVDaTkiZ/jShG+oWQ3+F602
	lIY57M/hk4ofEuekrRS+KY33cPRiYVv+jKseq4SiMFNKXIwHimJOfOwZU3kWmx6eJNZ0JA
	KBX/9X7F7iMkN7as/l4XVzF5Tj+3SI6getpXyW77sJnBu42GkGv2TBtW31VOJDwd0S0KkL
	8//xJbhwEm8HU4I5irlMKGP9An/fUKUt8x25qEHmtYA+g19zo0ET+FvmoXdtBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788167065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1sGAuUsorIPoXLcHExy6R5Npsjt3fjLx3bhvgg32Y0=;
	b=fSH6ZFmSu0mvfKR2Ydfy/IfN/2dve3TqVQwiBWkMnf3AW0BRNINLkCCU6mJs7pr+JdcqEH
	quwrsHjFaMoUq6Ag==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: tglx@kernel.org, luto@kernel.org, vincenzo.frascino@arm.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: vdso: is the reduced precision of the CLOCK_AUX base intentional?
Message-ID: <20260831102924-5f7570f6-7dc4-4996-9a35-db9c9f577dd2@linutronix.de>
References: <20260831072027.1315879-1-zhanxusheng1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831072027.1315879-1-zhanxusheng1024@gmail.com>

Hi Zhan,

On Mon, Aug 31, 2026 at 03:20:26PM +0800, Zhan Xusheng wrote:
> vdso_time_update_aux() shifts the base down to nanoseconds and back up,
> while the other clocks keep it scaled:

(...)

> So the difference is floor(a+b) - floor(a) - floor(b), and the vdso reads
> 0 or 1 ns below the syscall for the same clock.  With shift 24 and a
> 2.5 GHz counter I get the 1 ns case on 60% of the (xtime_nsec, delta)
> combinations I tried.

Good catch.

> The scaled form the other clocks use looks like it would work here too,
> and would restore the exact parity that tk_update_ktime_data() documents:
> 
>   nsec = tk->tkr_mono.xtime_nsec;
>   nsec += (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;

If this sum is >= NSEC_PER_SEC then the userspace fast-path will need to loop
an additional time in __iter_div_u64_rem().
We can and should avoid this similar to the highres monotonic/boottime path,
and precompute as much as possible in the tick slow-path:

from update_vdso_time_data():

nsec = tk->tkr_mono.xtime_nsec;
nsec += ((u64)tk->wall_to_monotonic.tv_nsec << tk->tkr_mono.shift);
while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
	nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
	vdso_ts->sec++;
}

But instead of open-coding this logic (yet again), we should introduce
__iter_div64_u64_rem() in include/vdso/math64.h.
(And also use that in update_vdso_time_data()).

> update_vdso_time_data() already shifts wall_to_monotonic.tv_nsec that way,
> and monotonic_to_aux.tv_nsec has the same range, so the width is settled.

(...)

> Was the reduced precision deliberate, on the grounds that the sub-ns bits
> of the base carry no meaning for an auxiliary clock?

It was not intentional from my side.

(...)

> Unrelated, from the dispatch next to it: __cvdso_clock_gettime_common()
> does msk = 1U << clock after admitting everything up to CLOCK_AUX_LAST.
> That is 23 today, but raising MAX_AUX_CLOCKS past 16 would make the shift
> undefined with nothing to catch it.  A BUILD_BUG_ON(CLOCK_AUX_LAST >= 32)
> would pin it down.

I would prefer this, assuming all supported compilers can properly track the
actual value range:

BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk)).


Thomas

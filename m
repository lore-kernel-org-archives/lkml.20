Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FBE4766BC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254089; cv=none; b=Jt3kJRMR5YWrPplnoCzOiwxRMshs2yVEgsUIG8tkL7rF/lXwqoY8Qvmtym7uvSvqBkxlQQ0Wc/7kgHVOrMuKgJmBzLpErlaAxhQi36HfEhc+ioH+MetclzqCZJv+9xJuzi51hgryYmHZL8HO4XjhHnV5Fw8wGf31sIoin2d0690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254089; c=relaxed/simple;
	bh=Y4ENEduwtQrp/hEgKcy2T8xhY0yIVbWnr9t/KGqQJXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtFR+H6axE4Kpc2lBguKBgla6f8gx522/MEuiJAJgbl1naPPxhod9DBru+ojg97ez7wDKMD+3QsJPEcpXvbYPy1UXT3MnjycPCupjbYwMDc8uwRmf3fijgF01vYw1DOiuQKda0aUC+k/LtAnPjAj6AALwB+MvirTAVnJmX9QCY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NN/ocogX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dye571l1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NN/ocogX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dye571l1"
Date: Tue, 1 Sep 2026 11:14:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788254085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7lS5ZdVI0+ym+hDntmH2DECmLk/W4n23Z3P4FplKMI=;
	b=NN/ocogXMXoaF1K6Ek1l1RdLtCGDihloCP0cnbzTyvlPBQrtoJn8DTgEq6HDieY3t8WfEr
	Oq/qXiA7hIZ0PcOwLbJpnTBuv3G5aIX9FtPlgrbR+oNNNGTFeIJtxebZGdvqhM+WVN0N7i
	2ld9bDuSxfw4SjWBgUFTm6bum1agcXw3yPo6mfngH01W8coG/bPQRfnIt0ELT4cp/5dpWj
	t1FaeKzsPrZSCKWEaGgEWnlZaP5iZsM65X6X4vjK72RPfmLNH+3gQ2CiButJQg7NzlmQQX
	EQmdFKiu6l+/IYgrm1jpZ5eVnJVYveJS7+fYbnXYb3anHHBqq0bApurP6Z82pg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788254085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7lS5ZdVI0+ym+hDntmH2DECmLk/W4n23Z3P4FplKMI=;
	b=dye571l1LEPCQhPFKwRxcjXoqUEMreVsIKro1NOoGG1OZrIzFDK8ID9l3F0Xk8eUy7zPU4
	BSeKoyDCByRq2QAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Deepa Dinamani <deepa.kernel@gmail.com>, Cassio Neri <cassio.neri@gmail.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] time: Prevent time64_to_tm() day truncation on 32-bit
Message-ID: <20260901110349-7fc309aa-0ed4-4bd9-a4af-71cc703fa054@linutronix.de>
References: <8d421725051450cecf0a7e6d2c514b6926df43b1.1788019619.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d421725051450cecf0a7e6d2c514b6926df43b1.1788019619.git.kmehltretter@gmail.com>

On Sat, Aug 29, 2026 at 06:12:12PM +0200, Karl Mehltretter wrote:
> time64_to_tm() accepts a 64-bit seconds value, but stores the quotient in
> long. On a 32-bit kernel the day count therefore wraps when it reaches
> 2^31, even though the corresponding year remains representable in
> struct tm.
> 
> This is reachable when formatting externally supplied timestamps. For
> example, NILFS recovery copies the little-endian 64-bit ss_create field
> from an on-disk segment summary into time64_t. Its sysfs attributes then
> print that value with %ptTs, whose formatter calls time64_to_tm(). A
> corrupted image can consequently produce an architecture-dependent printed
> date.
> 
> Keep the day quotient in s64 while leaving the seconds-within-day remainder
> as long. Use div_s64_rem() for the weekday calculation so 32-bit builds do
> not require compiler runtime division helpers. Add a KUnit case at the
> first positive day count outside signed 32-bit range. The baseline i386
> kernel returns a negative year and wrong calendar fields; the fixed kernel
> returns the same result as x86_64.
> 
> Fixes: e6c2682a1da3 ("time: Add time64_to_tm()")

If this is supposed to be a fix which might get backported, the kunit
test changes should probably be in a dedicated commit.

> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
> Review notes:
> 
>   - On a test-only baseline, QEMU/i386 passed the existing case but failed
>     the wide-day case with tm_year=-5879541 and four other wrong fields.
>     Baseline x86_64 and fixed i386, x86_64 and lockdep x86_64 passed 2/2.
>   - A direct s64 modulo emitted __moddi3 on i386 and __aeabi_ldivmod on ARM
>     with Clang 21. The submitted form uses div_s64_rem(); W=1 builds of
>     both objects contain neither compiler-runtime reference.
>   - The narrow type came from time_to_tm() in the Fixes commit. The 2021
>     arithmetic rewrite kept it and tested only +/-80,000 years, below the
>     approximately 5.88-million-year 32-bit day boundary.

We still have an overflow when year exceeds LONG_MAX on 32-bit.
Not sure how relevant it is to handle years over 2 billion, however it
is likely as relevant as years over 5.88 million.

> 
>  kernel/time/time_test.c | 16 ++++++++++++++++
>  kernel/time/timeconv.c  |  6 ++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
> index 1b99180da2881..8b718767b3baf 100644
> --- a/kernel/time/time_test.c
> +++ b/kernel/time/time_test.c
> @@ -87,8 +87,24 @@ static void time64_to_tm_test_date_range(struct kunit *test)
>  	}
>  }
>  
> +static void time64_to_tm_test_wide_day_count(struct kunit *test)
> +{
> +	/* 2^31 days: the first count that does not fit in a 32-bit long. */
> +	time64_t timestamp = (1LL << 31) * 86400;
> +	struct tm result;
> +
> +	time64_to_tm(timestamp, 0, &result);
> +
> +	KUNIT_EXPECT_EQ(test, result.tm_year, 5879680);
> +	KUNIT_EXPECT_EQ(test, result.tm_mon, 6);
> +	KUNIT_EXPECT_EQ(test, result.tm_mday, 12);
> +	KUNIT_EXPECT_EQ(test, result.tm_yday, 193);
> +	KUNIT_EXPECT_EQ(test, result.tm_wday, 6);
> +}
> +
>  static struct kunit_case time_test_cases[] = {
>  	KUNIT_CASE_SLOW(time64_to_tm_test_date_range),
> +	KUNIT_CASE(time64_to_tm_test_wide_day_count),
>  	{}
>  };
>  
> diff --git a/kernel/time/timeconv.c b/kernel/time/timeconv.c
> index 59b922c826e77..292a855827b7a 100644
> --- a/kernel/time/timeconv.c
> +++ b/kernel/time/timeconv.c
> @@ -49,7 +49,8 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm *result)
>  	u32 u32tmp, day_of_century, year_of_century, day_of_year, month, day;
>  	u64 u64tmp, udays, century, year;
>  	bool is_Jan_or_Feb, is_leap_year;
> -	long days, rem;
> +	s64 days;
> +	long rem;

This now breaks reverse christmas-tree order.

Tiniest of nitpicks: The reverse christmas tree looks better with the
's64' line below the 'long' one.

>  	int remainder;
>  
>  	days = div_s64_rem(totalsecs, SECS_PER_DAY, &remainder);
> @@ -70,7 +71,8 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm *result)
>  	result->tm_sec = rem % 60;
>  
>  	/* January 1, 1970 was a Thursday. */
> -	result->tm_wday = (4 + days) % 7;
> +	div_s64_rem(days + 4, 7, &remainder);
> +	result->tm_wday = remainder;
>  	if (result->tm_wday < 0)
>  		result->tm_wday += 7;
>  
> 
> base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
> -- 
> 2.53.0

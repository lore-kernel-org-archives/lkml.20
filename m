Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289074;
	b=EsunX17SmBuS1F70pubJ7wgBlBZgpQNaIzrEI9VrD5F5as8pKyrd2XBMgw1CY4q7gw4a
	 Oj11Ydvcm6Jpz8ReJ33H9v1d48RdJxe3dTf3yDkiychHRB/a+T5N3YfUBOcAjoKOsoiij
	 6xDRbJUNQwOmjEbpLD+0rKD6/u23xRwinm9uulnM9Nizb7o9NtR6nbYe95qe3OpMUfGVu
	 NyPniwXVKIeITHnXop7FT1u3ibFqQBVPVADCgUma6ZRLQW84IWBm5dPeF/mPpokcoD145
	 Dk4P9F7f9hiH54D0qJz8TQhuMm2f+rc3DUeuAYu4W3TAFwG7Fl3PKB6bYdZ31sKP9Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mbJfvSboS29jhnmPXsF9OyXPZWVJ9ZMdQ/k6fmGAbq4=;
	b=pRzVwAxACZ0s2gdr2ZfnIzIIAokljDb5nXro6i95JtwMLqI0aFqeFortdPzat99DUa9e
	 vcWbZiUtEYNpMvSrMoz5yGWx8BCzbsBH6rmfO18yDkjnvkW8EfFxKON7qSZ3/VbQfghjJ
	 CFZFUbeB/c5Mxw8dhX2Uj8o8IphtUSrUzFqQjpv6TFtYCp1UtG4sirn1SSaa31ciZ2mJU
	 6jH5Gz8m659LOTqP1GlQvq7Ylo+yIiJVf8JDzCoBfai8exjapplE7oA6Anoo7xVF2k7sb
	 CVsxDp8Apepdr+KEyZU4lOhzydE8UB3DRrul5P0qLV7FkuQV9O0wqc2FcVCnvKHhZsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=o5EDf1eW;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F3F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F3F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=o5EDf1eW
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6768403e9bbso2283753d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793289072; x=1793893872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mbJfvSboS29jhnmPXsF9OyXPZWVJ9ZMdQ/k6fmGAbq4=;
        b=o5EDf1eWBRzY0FZ3GWlOwF8Oug/6kaoD3XsCZbDmtapc7i7H5f4+nE9HAypE/me26c
         YmBx8LFeel/4KNuY9gepmwbijqbbZFre2HW6zpo9Rz8H1zqbcxtbqNXahjebwL5nxvOW
         HYtZwhgMOgd7QfQ2z4XonbX/KzkwPMohke3Z0PeR8WHjd+AYZQKskzNSLL/HKqGNoyyx
         pF0KYMgS/qk/6rwAHu6K/GtDZBbO0vMlr0HmHqGsUBW0AaZl7ePolNK1WUOKP/tnq3Vr
         iS1SvrjwlOlPIwPXpSkbGEoQt6ocriOTgeshPvpXXa8JPZFjOjt839q29uF5IrW6elgp
         68kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289072; x=1793893872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbJfvSboS29jhnmPXsF9OyXPZWVJ9ZMdQ/k6fmGAbq4=;
        b=ZUXDYNpEV4L8yUAZn2Jo7xU9hJs9uV0Mp5f0EwXpDdD8hWJ9h060k2k7yrQgRRbSYT
         +xgZvziAPz8D2GiXCKr6+OCshgVdW+S5K5Rs1zFODVB2g6UOppsQWfmPQzxX8AZliHVi
         YEhjBWeiuZTwRcHWEebhM60iJXN/BnL+GfEj+irDNVC/8yRNphj17cd1xw03qwaGVcMO
         vWDSu3qXtaB6LdBq3iNxZbqHS2drlMhii/IzMmRZZujrOEs+8QhV3Rn8QbldLAMiWH+e
         vLfbTRZ9/aLdetTM8SiqQhIU+wEg+wODGM7tkIv+OBhCfWvScDU6CnJsY/RIMRkmKQoh
         HnWA==
X-Forwarded-Encrypted: i=1; AKwUvBw4jRk6g9rB7HCbuE9CWPEJUJMAwOGNcW/PW58k4T+ViUVZFa6uXw8/+WzLmsAydMNyrDrRVGWziIRhg1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx/7XZcUIgGwUtQs8GPPKaJUH16OyPDwy7+f9Pxwnt5O9Dbere
	0QJFZNhSXATtvaorfjvSNV2dYK69pF0YdTczLAaaW+a5vMs7p6CN0hUNcA77J2tVX04=
X-Gm-Gg: AYBFou2B16/T/oE1OXSW8hNlnSzO5h/khTZq5hmlNb2LbS+S6ag9WmK2r32nQLqke0A
	L7JWGLvJiP6Ct3MF6Rt2H1of+Fixmy3hpFCAtCKdELexra0IlTPiK98HDzLUYtOxhtutrnaB5AP
	aDjodGqQL5RcdaFRxVWSYQC88TnKX2cx6/j3Pp7tWLU3AZy2VjkROO/NBK+Ol1AXuKwQNFxzzsV
	jKXBlqerQZB/Rf4WBLIsOhBI/CldHa64ohL8aUfsxXvGp34cq4CIsNNs+SL3N4N7aHIxLb+rWoW
	uI303vt3pBOCXQW3JnZtT917NWHmYfeEo9WODjkGj5nzMRxIZZkr7AQQRSqXi9cn5S3w1udzvK0
	K1bjHzDT7Kt6ZJ8MMa1WKj/TTWVAjstmaJHwDu7O01CUw5ixCVPEkdwEesI+CVAGQQxwC1b18y6
	Uj53r79TmIQun6odxJYMryHfd6V6mzlRxT92A43ZRzkHO8PyyfdNjMXz3+UyIFNsC2Krn/OhNs+
	45XfLtgoRui+qlce+h6IOjXdt82Afxzik8/Ze7vkXcO/3JjWJgA/g6yN+gJms1Y5sMjktcbWaO8
	Q00CrlmTo2A+m9ddJ0dAMGNvdPIn
X-Received: by 2002:a05:690e:439b:b0:677:c7f2:ba0 with SMTP id 956f58d0204a3-67a7bd38327mr3431471d50.42.1793289071978;
        Thu, 29 Oct 2026 08:51:11 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba1faaf95sm58501d50.12.2026.10.29.08.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:51:09 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:51:06 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: akpm@linux-foundation.org, shakeel.butt@linux.dev,
	muchun.song@linux.dev, harry@kernel.org, qi.zheng@linux.dev,
	tz2294@columbia.edu, bingfangguo@tencent.com, kasong@tencent.com,
	linux-kernel@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] memcg: fix integer overflow in calculate_high_delay()
 bypassing memory.high throttle
Message-ID: <auNrakxaET8qkuAn@cmpxchg.org>
References: <20261029073857.974-1-zhangjiao2@cmss.chinamobile.com>
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
In-Reply-To: <20261029073857.974-1-zhangjiao2@cmss.chinamobile.com>

On Thu, Oct 29, 2026 at 03:38:56PM +0800, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> calculate_high_delay() computes the throttling penalty as:
> 
>   penalty_jiffies = max_overage * max_overage * HZ;
> 
> where max_overage is a u64 derived from the usage/high ratio shifted
> left by MEMCG_DELAY_PRECISION_SHIFT (20).  When a cgroup exceeds its
> memory.high by a large factor (>= ~4096x), max_overage reaches 2^32
> and the squared multiplication overflows u64, wrapping to a small or
> zero value.  A zero penalty passes the 'penalty_jiffies <= HZ / 100'
> early-exit in __mem_cgroup_handle_over_high(), so the cgroup is never
> throttled despite being massively over limit.
> 
> This is exploitable for denial of service: set memory.high to a small
> value (e.g. 1 MB) and allocate several gigabytes; the overflow causes
> the throttling sleep to be skipped entirely.
> 
> Additionally, on 32-bit kernels the 'unsigned long penalty_jiffies'
> intermediate truncates the u64 product before the right-shifts, which
> can also zero the result.

And then right-shifts by 34, which means the throttling was completely
inert on 32 bit. Please put this explicitly in the changelog.

> Fix both issues by:
> 
>   1. Capping max_overage at (1 << 20) before squaring.  Any overage
>      this large already produces a penalty far above
>      MEMCG_MAX_HIGH_DELAY_JIFFIES, which the caller clamps anyway, so
>      the cap is lossless.
> 
>   2. Using a u64 intermediate for penalty_jiffies so the right-shifts
>      operate on the full 64-bit value on all architectures.
> 
> The post-fix worst-case intermediate is (1<<20)^2 * HZ = 2^40 * HZ,
> which is ~2^50 for HZ=1000 and well within u64 range.
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
>  mm/memcontrol.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 84f4a8fd4d16..c0ab3940025c 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2576,7 +2576,7 @@ static u64 swap_find_max_overage(struct mem_cgroup *memcg)
>  static unsigned long calculate_high_delay(unsigned int nr_pages,
>  					  u64 max_overage)
>  {
> -	unsigned long penalty_jiffies;
> +	u64 penalty_jiffies;
>  
>  	if (!max_overage)
>  		return 0;
> @@ -2588,7 +2588,16 @@ static unsigned long calculate_high_delay(unsigned int nr_pages,
>  	 * memcg in question makes it clear that it has no intention of stopping
>  	 * its crazy behaviour, so we exponentially increase the delay based on
>  	 * overage amount.
> +	 *
> +	 * Cap max_overage before squaring to prevent integer overflow that
> +	 * could otherwise wrap the penalty to zero and bypass throttling.
> +	 * Use a u64 intermediate so the right-shifts are not truncated on
> +	 * 32-bit kernels.  Any overage large enough to hit the cap already
> +	 * produces a penalty well above MEMCG_MAX_HIGH_DELAY_JIFFIES, which
> +	 * the caller enforces regardless, so capping is lossless.
>  	 */
> +	max_overage = min_t(u64, max_overage, 1ULL << 20);

This is a bit of a magic value. The simpler fix is the u64 and then do
the multiplications with check_mul_overflow():

	if (check_mul_overflow(max_overage, max_overage, &penalty_jiffies) ||
	    check_mul_overflow(penalty_jiffies, (u64)HZ, &penalty_jiffies))
		return MEMCG_MAX_HIGH_DELAY_JIFFIES;

>  	penalty_jiffies = max_overage * max_overage * HZ;
>  	penalty_jiffies >>= MEMCG_DELAY_PRECISION_SHIFT;
>  	penalty_jiffies >>= MEMCG_DELAY_SCALING_SHIFT;

I would then also make the function return u64 and make the
penalty_jiffies in __mem_cgroup_handle_over_high() u64 as well, since
that's the place where the final clamping occurs, so this function
does not have to worry about it before the return.


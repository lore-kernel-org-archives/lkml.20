Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026628;
	b=XsF3bIoTlIaQfMJdulg+sw3j9f//pfLQfq7HpwAc4X1L6A157HsV9I57qhHzl6v8aLZT
	 V0Vzudrom8pHq3N32eTb5DbWxSQ6ZVdYRJBCzES5HZfJtYrS+BVFMz8f1zhvqKYUB4WYq
	 IyFlq3Ljw2JRF84St3jUaFZHPj3t6DZlOT06muhUSKhihziiTjIAFdy86IxuoUY7WRm/S
	 rG+zojn6LSiD3rmF05EeuH8f2qKchKbQCc5ePyEsbWZqHVOWdnv0UpM5kI3eifv8BLsI0
	 eRnuMWmpytBTI132W62FgWuut45X8lONAojmrP2qGsZ/VzMIep9q0LqRgFhvZRjt8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r4TeSRrJfvEb9bXGYtvTmzKxtpAZeorrt+MbujrYaNo=;
	b=q1B3MUMaM5JntlgXJsaUlOsHDZFnkEggP/+MGEbeJsKMI2bdUHaM5Td6JKqhsuctcgvQ
	 mtabn//tIpFdIFaZiHDuHaTfPuzVear/GGF0rXU+X/CJO7V/c8ndFImQ0ImJDHkFOSpkg
	 WX7wNhjmz3Y45i7SkOv8F6NJ5D/TJA98MaWeorWzpM0bw83tOj6x7guuOKAEdqMLVaWKz
	 3++tfWA/yAeUdhSMOI+H1Reux/Esnyg24ERhmJn6kPfUKROFXVzwYJmqCeUT1z6KWOo4K
	 V4Y12jqcd9bqOpfhr29xuBmRtgJelE3fxdAyXAYZnYEWZ51EQcQdY0ULFCjJJK1w8Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iNVvKNRO;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07EE606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F07EE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iNVvKNRO
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso23805005e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793026626; x=1793631426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r4TeSRrJfvEb9bXGYtvTmzKxtpAZeorrt+MbujrYaNo=;
        b=iNVvKNROw0TJV/07MSUPeQWkiFUyo/r8Mun0JgwcYN1aZGEO0Sv9204nzc6yLc+hls
         lVDl0aZxytSZYw6BSeTenz/KJCMjoIb3xqnZcqJByX9Q1EVWAOI4/EPnmwvYoqYnj6dd
         x3IhiPjf9SGcxTw9rFWvRlZWALlhTOvZHCIyZSp43diZHDSMZ2IxvGB66IJT+IVb/U4T
         xUqg6QFK6dKmeVQ7PYbVwsYmJYaeHZg8gB7z8rmiLz9RLTzAgFaL21Re3C9M8ShTE0WW
         XGN8R0/rpsSwV0e9tmEqkvS8gli54EjPIrO8yhunGeG3DJ2Xh3hXiCO6wU93iVLhlOu3
         bZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026626; x=1793631426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4TeSRrJfvEb9bXGYtvTmzKxtpAZeorrt+MbujrYaNo=;
        b=jDfM2O4rHhErRVMR0tR+5gtMc7UAePaCXa+FuKsWHhFD8Qb7xw6waJjEGCHYIDVnJC
         a6wAfXG1tuNeMufxOcODJbIkidISJ916fTFfD1f1UwTdVR+gA4wssWdJTOvu30WXFkea
         IdI/DA3oaYXIuiIfyF9raK1wHP7uc0wcIgL6G4neLmSK0firJhBlQQjhUTNLNJuXiPIW
         QDbEgdS4s/I9GRBXfqQV2QtLS38U00CXfetaA5DAqVqoG4f+2pJTyH0QbAM0+BRsGnoF
         OrfmkhuuGXe/p7mEnxUCrLPTKnHIcFm7JaWLc/Ru0n6WQnczRe3Fe3KRb/M1b0XIla6V
         dOIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqLcCRKHgynQdT3XYpl/DOUtnkpqVXIU6NHwn9og8JIBb212j+45tiAQpgPuyr0SbRpiu8Xq1C6JLNYtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqUI7m2liRy1vOfc8XFHtk/ydGj9xw6LISH0gkEk/4U0dak/XC
	1ZQmFdYEPlHtWfC1FBI+MryQOcRWrJ+izO/IA56NXu3D81VuvXGUYbOo
X-Gm-Gg: AYBFou0cFUww4CQQL3ncfnzHp6lPYNhOtUCvCx4k5gk8R+ijiVAo7Wu4nS+uKDf/1eu
	YHiWg8MwHTBa1KeB0sJKQdaCIbrvYhPV7agCsLCi1/gR2c3GOZj2WHtPXdgcpBvOkuJ3IDAcsXX
	B0RmAGiML13gHdUwZNIwd8MtVWfQBoWvmc5t2LoLnGMvBkHvmODuPBDD650fKrMmoLX06PTdNju
	TA4Q83Cp5QF6n+tt0ThFegZ4jMRAjjAzdggDucAxJoaxCeR+4KOQ/LGYsEH1uyTkrYjK33j2PD9
	cXhDnBXTmbelwYRRCftQFHgGsrVg5kcefkNhiI1+sNqbNQ5sUqz7ZxiJATPPjhCujlfGt463Wk0
	mxs9Q0hdeYMOUnYP4HLgGNFVG8PlEMz7oFF54WyeDT+13P+GrIF7uSRxTQQo6zoNp9LwLF3GlLS
	xCwa8/Llo6LVlu+Plr6ZFbNdN4Nov33Uii+6mJellC9VG4AwkSmKCyGQd7TsEGzy1R/f3ersESs
	v7QViE4IeEmki0SQ96USpwjZNt5Su45G9jIX4daPd139kLJ91yJZ28s4f0/RMuPJoSjv/MDMWzn
	Jmx6JLTiTmcDMym+
X-Received: by 2002:a05:600c:83c7:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4a35ac95f44mr128561225e9.17.1793026626028;
        Mon, 26 Oct 2026 07:57:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm94940725e9.3.2026.10.26.07.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:57:05 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:57:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-raid@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/3] raid6: simplify CPU feature checks
Message-ID: <20261026145704.5601466f@pumpkin>
In-Reply-To: <20261025191207.86590-4-ebiggers@kernel.org>
References: <20261025191207.86590-1-ebiggers@kernel.org>
	<20261025191207.86590-4-ebiggers@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 25 Oct 2026 12:12:07 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> Remove unnecessary checks for features that are prerequisites for other
> features, such as AVX which is a prerequisite for AVX2.
> 
> (Note: in most cases arch/x86/kernel/cpu/cpuid-deps.c warns about
> missing prerequisites rather than enforcing them.  This is intentional,
> and it does not mean the prerequisites should be checked elsewhere.)
> 
> Then, move the raid6_recov_algo_add() lines into the appropriate places
> just above so that the same CPU features aren't checked multiple times.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  lib/raid/raid6/x86/pq_arch.h | 51 ++++++++----------------------------
>  1 file changed, 11 insertions(+), 40 deletions(-)
> 
> diff --git a/lib/raid/raid6/x86/pq_arch.h b/lib/raid/raid6/x86/pq_arch.h
> index 4a863b253b909..418e4d4a2930f 100644
> --- a/lib/raid/raid6/x86/pq_arch.h
> +++ b/lib/raid/raid6/x86/pq_arch.h
> @@ -16,63 +16,34 @@ extern const struct raid6_recov_calls raid6_recov_ssse3;
>  extern const struct raid6_recov_calls raid6_recov_avx2;
>  extern const struct raid6_recov_calls raid6_recov_avx512;
>  
> ...
>  static __always_inline void __init arch_raid6_init(void)
>  {
> -	if (raid6_has_avx2()) {
> +	if (boot_cpu_has(X86_FEATURE_AVX2)) {
>  		raid6_algo_add(&raid6_avx2x1);
>  		raid6_algo_add(&raid6_avx2x2);
>  		if (IS_ENABLED(CONFIG_X86_64))
>  			raid6_algo_add(&raid6_avx2x4);
> -		if (raid6_has_avx512()) {
> +		if (boot_cpu_has(X86_FEATURE_AVX512BW) &&
> +		    boot_cpu_has(X86_FEATURE_AVX512VL) &&
> +		    boot_cpu_has(X86_FEATURE_AVX512DQ)) {
>  			raid6_algo_add(&raid6_avx512x1);
>  			raid6_algo_add(&raid6_avx512x2);
>  			if (IS_ENABLED(CONFIG_X86_64))
>  				raid6_algo_add(&raid6_avx512x4);
> +			raid6_recov_algo_add(&raid6_recov_avx512);
> +		} else {
> +			raid6_recov_algo_add(&raid6_recov_avx2);

Is that right (you haven't changed it)?
You get both the avx2 and axv512 normal algorithms, but only one
of the recov ones.

I presume these are added in addition to the generic C code and
some startup test decides which is fastest and so used?

David


>  		}
> -	} else if (IS_ENABLED(CONFIG_X86_64) || raid6_has_sse2()) {
> +	} else if (IS_ENABLED(CONFIG_X86_64) ||
> +		   boot_cpu_has(X86_FEATURE_XMM2)) {
>  		/* x86_64 can assume SSE2 as baseline */
>  		raid6_algo_add(&raid6_sse2x1);
>  		raid6_algo_add(&raid6_sse2x2);
>  		if (IS_ENABLED(CONFIG_X86_64))
>  			raid6_algo_add(&raid6_sse2x4);
> +		if (boot_cpu_has(X86_FEATURE_SSSE3))
> +			raid6_recov_algo_add(&raid6_recov_ssse3);
>  	} else {
>  		raid6_algo_add_default();
>  	}
> -
> -	if (raid6_has_avx512())
> -		raid6_recov_algo_add(&raid6_recov_avx512);
> -	else if (raid6_has_avx2())
> -		raid6_recov_algo_add(&raid6_recov_avx2);
> -	else if (raid6_has_ssse3())
> -		raid6_recov_algo_add(&raid6_recov_ssse3);
>  }


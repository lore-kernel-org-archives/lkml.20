Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575360;
	b=FFWlzMFh1WYvm8biWH7rvYtkkIqGbl/BL0nxSojeKYpX7B2Hl7U4rul6S5AsV9tuz4RH
	 +wKMYLJHi9TZe/RoxLLYIJUQypmUd7LTmTH+dYSPD/4k6j4n8ALPbwsnbixrYqWDeTeC7
	 LPMWKp542wjzCQ7CanmGsqQCwC339gjz9WXzxF396jegpTRLnpzsgIwkqjUcealZ/lSsO
	 s/25RXj5mu41AD7HvXFF/6ZcunVf0DF7xQUl1SwIgR3Uebuxr5Hxko+BwuFd2mDGf91Cy
	 0Qc48QRIOxAaYUPgQMRHgwC+H9wzaYr8m8qtdii91sqTxRiIB/gS/jEcihP5CnAjVnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vESFpxx0VNlWv9cyNazlbbd+txTe8v8vPR3h4QzwP9c=;
	b=SZxFvu3vXzv3P+uYamTK0UQE7W9oR15YW95gMxU9/IuS0cJXtOYLGzwSE4bMbZ3tllSL
	 Y7IP45KKppop8QIzIft/G6S/jM1iE6TgUUlxs9/JlOuxxKjm7u5Tysav0h0TY7KcTdaDi
	 dBC+6ceZkweGZ1hO0STkOk/i7pvWmWMx3UsnkI47pbhT6oAuzmiMJpyNLa3Mi+p2frq3c
	 uwMV4hOmKRR2n8Tni5H+2WpXIS2OPaC5Y+kLMK92CXIMBGixxXyGWYV3b3lXVoxlJcybP
	 00fwwchlCeQeXx5XHdvgbIr8HNO2UjJ0a+WGrrkV/8z8KfjJmB+ygd8nhGkDIC24HVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="K/QunA4g";
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE83606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE83606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K/QunA4g
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4949f037131so305490fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575358; x=1793180158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vESFpxx0VNlWv9cyNazlbbd+txTe8v8vPR3h4QzwP9c=;
        b=K/QunA4gLyUdCC9TYZCnXtwnhnkHnbML3h8cQpfsW+/fJ+cOYFQyOufQWY3bKogqVm
         r/IliMVAXHqNoDBA+NmtPYQjBsFdxtiav6wZLzHeoKvi9Qi7NWFFV6t2i4PK2p1A8tBv
         9ZdOTSQ5qAqpLI3GkvHLni42pRefDw7QZ+fkIhcTLN5QOXxaosLSZjergEDqy9NVNar1
         Ci7cx3MADb9T7UjRXu/BDe/xxKZ2PLiQ15rZskNbdBDWu6sKLJWLHHmZMMSGUDgUd2ET
         uCaiCYcKTlocrB5z0toX3FoiIZELwzvcmHHYSAVvCO2E2Z6YAsuMowxSXfbqM5CzMI5d
         g4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575358; x=1793180158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vESFpxx0VNlWv9cyNazlbbd+txTe8v8vPR3h4QzwP9c=;
        b=NPhR59sWL3MZdJKjju9X5Mjit17QbekkzpgsfgzOmOvoH/VDK+JQARb2nPoDbmrO6f
         1xPPt7hNRlNCk/N+1dGNkNSzzDLImLYegbt0nSDKjaxaEPKtV/bs0tihpnHfEWhudMNS
         lte5lA0JHj0t+7jY/GxOjOslL2kwjLQBn2ea5KObvORZ+Y0V2dVCnW5EAbWbBOqBs5zs
         /NZrJvOGtoSML4yP6UeA/Qwn3Rac1Cu3G9Sr37pWs6fP6VWIVN5n7uPpJb8rmSyrOpEW
         oNyayYBsoqFH1ns7kyGBiKvbbW0ZDlncHw8JwWDeQLRdj1A3/GrkUhcEDJZizKjdF1nJ
         3CWg==
X-Gm-Message-State: AFq9FYIca6EkVRnu82cJm+fBMK3RxbpxbjvXhrpaUAQafQleKEIYeAQl
	YnY3cPKYdeSIiZHjyPNlIX0tUQwevyKIjgjm3Vb/Q+cOWkzIyyUNVdHa4a4+Gbju
X-Gm-Gg: AYBFou3itooyr6sJjKTDfSZMLNiihtX3O0z4m8LvgIHay4LT1za963PPBezrUmFOB/L
	R4F4UUbFmBGMxqNHxh2yjFPzysWh0x7hJ2NGfEkP4MagArL15aDVqgsJqLoSysMmxkTgG89QkUY
	Q3vBncbwuo+9ynz5tzNRw6fNDL3AL2vEa2l+9hgqP2PygITY7XfNkaJtQz8UWBOYaGWbi1ABer6
	qOmpbGx+mJthPcGaVRkKpsRG2Wn/tAjph+XWwaAZZNCxiDkmpijcJry8LzRcHhWu6vjpfAO7AiH
	49uss0aeoGPWrlL8UwlFugsHPGwKaeW+tqN8jFFpC7/kiuTvlJOzeLDRY1oyAwPYNcqzsb2PU21
	IVDp+bo9D1HtHGAQy0n+7oYfJOn01t9vaNO814+X7WiGGXVPuLX3qrct3HyHGdQJOFA3VkkR48W
	a63/MPmmFhUxBe5pqkCC2w9TS0rv5TdVzsB0ORJmZRwrrcUd3p3cIPOd0KrBN+bicw1CCKda4lA
	E2VxS9kS93bTNqxXcuSG38xwIY4amGdxUIqUhM4ltKpBQtLTQ/WuAEcBrCeLWuU6VZoTgQP3AHd
	gloCXN15JDykUD2iK5JtKJ18DpRwuZpoKfw+ruMrxatxDBRZ8m4=
X-Received: by 2002:a05:6871:288:b0:48f:e107:8e48 with SMTP id 586e51a60fabf-4a7dc238a6cmr729894fac.41.1792575358461;
        Wed, 21 Oct 2026 02:35:58 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d617c2f2sm1491979fac.8.2026.10.21.02.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:35:57 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Wed, 21 Oct 2026 06:35:49 -0300
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH RFC v3 2/5] lib: kstrtox: round to nearest, ties to even
 in kstrto[u]dec64()
Message-ID: <e2zxpo6o34qbp3oihrenolktavoczl2dqyggp3q773i7ryrrtd@4ixkwasrh2kv>
References: <20261020-e-notation-v3-0-fd385c0fbf65@analog.com>
 <20261020-e-notation-v3-2-fd385c0fbf65@analog.com>
 <ath_3QVy5DVV4fxw@ashevche-desk.local>
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
In-Reply-To: <ath_3QVy5DVV4fxw@ashevche-desk.local>

On 21/10/26 12:03, Andy Shevchenko wrote:
> On Tue, Oct 20, 2026 at 09:27:00AM -0300, Rodrigo Alencar via B4 Relay wrote:
> 
> > kstrtoudec64() and kstrtodec64() drop the digits beyond the requested
> > scale, which truncates the result toward zero. The error is up to one
> > unit in the last place and is always in the same direction.
> > 
> > This is easy to hit with values produced by userspace floating point
> > formatting. Printing 0.3 with "%.17g" gives "0.29999999999999999",
> > which is parsed as 299999 with a scale of 6 instead of 300000. With E
> > notation a negative exponent can also drop integer digits, so "19e-1"
> > with a scale of 0 gives 1 instead of 2.
> > 
> > Round the result to nearest instead, with ties to even. This is the
> > IEEE 754 default rounding mode, as used by strtod() and printf(), and it
> > does not bias results in either direction. The first discarded digit is
> > known from where parsing stopped, so no extra pass over the string is
> > needed: the remaining digits are only checked when the first discarded
> > digit is a 5. Since round-half-even is symmetric, kstrtodec64() keeps
> > rounding the magnitude and negates it.
> > 
> > Inputs that fit within the scale are parsed exactly as before. An input
> > that rounds up past the type limit, such as "18446744073.7095516155"
> > with a scale of 9, now returns -ERANGE.
> 
> > Update the existing truncation test cases and add cases for ties and
> > for rounding at the type limits.
> 
> ...
> 
> > +static bool _round_half_even(const char *p, const char *end, u64 res)

...

> > +	/* tie: any nonzero digit after it breaks it, skipping the decimal point */
> > +	for (; p < end; p++)
> > +		if (*p != '0' && *p != '.')
> 
> This is a loop, so this also passes '.0.0.' case and some other similar to it.
> Is this a problem?

no, string validation has been done before at this point.

> 
> > +			return true;
> > +	return res & 1;
> 
> So, this res is used only once to get a parity. But this doesn't semantically
> sound like boolean to me. What if we actually return 0 or 1 from this function
> and use its output directly in the check_add_overflow()?

Yes, if it is fine to always take the path to check_add_overflow().

-- 
Kind regards,

Rodrigo Alencar

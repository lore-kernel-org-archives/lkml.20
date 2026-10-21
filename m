Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575797;
	b=YgAxHIDndj22SkSnM0IfTaocxuOuWAXCzqeo2cQzncwqZwsdhtj87e5k04b+x2ykEA2V
	 C+x9boaRXIdbOXvLjcada8wu5FmQ2WYRhIbmHX3/fZ29Sg30gmMy97ysI2fvD1sVdMv2A
	 snJCuc/VXHr0rTOczxq1MFmq4Tdi1mHPkGbB00xyONsMLbxiLg3vDxpVz7uPNM8luFptm
	 Ea/Qz1m0geXXDxgZhzzKQ31e7jplr9rnMksEhZd5C3qSjK0PygXqdgGISkQaIqsEt13oJ
	 xw8bMxR2e8g3R7ekg0SPG0qQQHkvyZxog4PPooyij9jbbpJL1rS+Y8RSNWPBZ6xb8kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dhe+OwUtPyp9lDIgAXa6HnxDE7Qgi1WH1ldmiGmED74=;
	b=J5+qxri+Feyh1BfseYUIoAFDtmN+JFRig+5fMrXEx/2yZR3qOCqfWXw6/1/8AySLhQ/r
	 SptAn3WOlGAibG7Rtv18lyiIX+zP4h6n3BQN2W4UEUla+upUdqFMJ5vkR6c36Dij5ZoQU
	 GIlnGZ3YGSxhi0oYT4JwTijjTdkNT9y9TCJdQ0D2jQ+kxLpsO1aAxcFiuM4K2dPKFfuck
	 Jy1ygeQ7zIZf7dxZHREicfDLAbWlPyDK4EWYNyLtOqiCHwqUb4vYM08Z1OcjmHg8NVr9y
	 nRxE752+IMopGPL8YZ2c/PWDNs+NRK+OCygCXBHx8GOrXM2E+gycZvPbncwdZCoiTKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=srjt+DeZ;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842E606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3842E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=srjt+DeZ
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eabf243d05so168870e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575796; x=1793180596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dhe+OwUtPyp9lDIgAXa6HnxDE7Qgi1WH1ldmiGmED74=;
        b=srjt+DeZDfQvwdyCu9ry3wmr0HKr+FZ4kA7dbDOp6ht0khn7HeCNM2OdlG1xRsQ0Kd
         lxc8MVn5Ct0LOJVBW+BsQHEtgEN1C7Ox286rsUVGq0jJHiO36gSHKXKJKny2mMLUwIzz
         5yv4UuuXW3yHSKLLIwM8fCpkRTzEOrMh5Ac1r1FWzw8+VcYjCnayVa/z5p6jz3RXXGU0
         iqWfaY939/CB+ZIVFsftv5ay9t2ZfsXbSArDLdKTT7fMjMiJkuqKYvkzjMLSlXfbWCxs
         cffdCFhd81Jp9qg8nUpkly1HyvG35jEVMRaKE9R9isJVF+yiuq0kVJEFcFYLnTYaSkIQ
         5ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575796; x=1793180596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dhe+OwUtPyp9lDIgAXa6HnxDE7Qgi1WH1ldmiGmED74=;
        b=CAxWCRkGJ7HRIt8+yvgXSgOVG7xZIl9dCTrU1wuOHCQ2Y+E7Mmw9fsoqHpbkTgDWMz
         IX9qEuDu0/l1S/NtOGN82Mml27DnPKAUkCzPNsVl2YqpH9/on8nCdBxkcvr3mPwoYyJI
         dFueoTgmnKGyToW2x6NUJ4v/RWFjq56pKpxt6EsmJZoGhZ5GheLtzPV+5nq1yfyFnWeZ
         GGomIay0YVIupbzmGUog7Fokn7/fss5w3qyMcaoevd2bDv+2PyJtjeSUnl4perPtq/em
         LyAwumBjDYsZurWUSVB48RZox8YsdzZKqd+oxd8D1S7AuZgamHbmnaJcwmJfkW2esUzK
         HjUg==
X-Gm-Message-State: AFq9FYJL3pVQcx3lr3hXVWBILh+FFhIly3+Jo2tuJdMs8KXbaG1wsKSB
	v/5xseo8Bg5hykr0wqcz1cwwIuFlFXPQTbQOpRlYjMbPU6IpnmVeO6So
X-Gm-Gg: AYBFou2kL0eVVaP4wW/jcudxiuYijQMc9nJ/VWvE/VmWIMvgUeD0VHSC91b57kqUZ9e
	kZI+FOrUDgkpVRE7Zj681KnsjDtHCbWpRETw1v+2A7KvHr51LxIMsI8qLfqufe1CriizPG04OWs
	y8ouYxxb7b3nHAHDQ1KwVfz+kGTFENmP5uaprYkv4kvrJE04EfhNk01HzTeocYKLGDKD6AiKwl9
	lr0BWVQybM/qsFkoEh0wNYKwFdqSDmflWq3HhTekG+A/lFSHQoWnsjlV7ktZHH8sxerHvLxrjNe
	t7LkyVt8MbI8/fsXki/0KbEBQg6oBzAtr7qbWUnQhMbLCk6BeTrra6js3aTfOm1iWQqDI7Ih/y8
	0INqahKqUaaEb/tdQfWrBeUxCXUAQwpukAXx/vw3C9YhPJxp5RmgfCBZstbkRX6HnlMGg17av3I
	NFrzLfh6M18E+C23VsOqRH2RMTCanV/NbF6uOAC1AmRGDpkD9Kp7x7nCWyInR5X38we3paHyJ4z
	nWVoU+VnKarVknQG4/P2xsQUCt2Va0XVzGAL1iqLtAWBRFLyta8uMye0NfLFXT017KIrwKINSEb
	s4t56kO950LZhLJ1CE6P9es8lsfDoHBQzlV1bZh2e+fsgmk7IhE=
X-Received: by 2002:a05:6102:4187:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7cc9273dca8mr453540137.22.1792575796124;
        Wed, 21 Oct 2026 02:43:16 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc92327896sm2088122137.4.2026.10.21.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:43:15 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Wed, 21 Oct 2026 06:43:12 -0300
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH RFC v3 1/5] lib: kstrtox: support E notation in
 kstrtoudec64() and kstrtodec64()
Message-ID: <6h2ryn6waf6gcb72wjabfcxwf7fxl5nd74cbew3vixpop5oxrw@xlzrifrya7ux>
References: <20261020-e-notation-v3-0-fd385c0fbf65@analog.com>
 <20261020-e-notation-v3-1-fd385c0fbf65@analog.com>
 <ath7t0hj12kXGgxs@ashevche-desk.local>
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
In-Reply-To: <ath7t0hj12kXGgxs@ashevche-desk.local>

On 21/10/26 11:45, Andy Shevchenko wrote:
> On Tue, Oct 20, 2026 at 09:26:59AM -0300, Rodrigo Alencar via B4 Relay wrote:
> > 
> > Allow decimal strings to carry an exponent suffix, such as "2.7e10" or
> > "271828e-5", in kstrtoudec64() and kstrtodec64(). The exponent is added
> > to the requested scale to work out how many integer and fractional digits
> > are consumed. A negative effective exponent drops integer digits. Digits
> > beyond the resulting precision are truncated, as before.
> > 
> > The digits are now scanned first and the string termination is checked
> > before any conversion. A missing or malformed exponent ("1e", "1e+")
> > returns -EINVAL. An exponent that overflows when added to the scale, or
> > that makes the result exceed 64 bits, returns -ERANGE.

...

> >  static int _kstrtoudec64(const char *s, unsigned int scale, u64 *res)
> >  {
> > -	unsigned int rv_int, rv_frac;
> > +	const char *s_int, *s_frac;
> > +	int len_int, len_frac;
> > +	unsigned int rv;
> >  	u64 _res = 0;
> > +	int exp = 0;
> > +	int ret;
> >  
> > -	rv_int = _parse_integer(s, 10, &_res);
> > -	if (rv_int & KSTRTOX_OVERFLOW)
> > -		return -ERANGE;
> > -	s += rv_int;
> > +	s_int = s;
> > +	len_int = _skip_digits(&s);
> >  
> >  	if (*s == '.')
> >  		s++; /* skip decimal point */
> 
> So, I know that '.NNN' is valid notation, but is 'NNN.'?

It looks weird, but that is also valid notation.

> 
> > -	rv_frac = _parse_integer(s, 10, &_res, scale, _res);
> > -	if (rv_frac & KSTRTOX_OVERFLOW)
> > +	s_frac = s;
> > +	len_frac = _skip_digits(&s);
> > +
> > +	if (!len_int && !len_frac)
> > +		return -EINVAL;
> > +
> > +	if (*s == 'e' || *s == 'E') { /* E Notation */
> 
> You may use _tolower() helper (yes, the one with a single leading underscore).

ok, so we only check for _tolower(*s) == 'e'

> > +		s++;
> > +		ret = kstrtoint(s, 10, &exp);
> > +		if (ret)
> > +			return ret;
> 
> So, with the above in mind, this may lead to 'NNN.e10' input which I find a bit
> confusing.

might be, but as mentioned, it is considered valid, e.g.:

- python:

	>>> x = 2.e10
	>>> print(x)
	20000000000.0
	>>> y = .5e-3
	>>> print(y)
	0.0005

- c++

	int main()
	{
	    float x = 2.e3;
	    std::cout<<"x = " << x << std::endl;

	    return 0;
	}

	x = 2000

-- 
Kind regards,

Rodrigo Alencar

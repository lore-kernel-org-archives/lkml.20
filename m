Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030018;
	b=OQ+4wr25ga37yrDgo9oUZCWoR9pkkP+vxjp5XZZ6FMTk2kzLW6aBmVb5ywK1ZxTRm9nT
	 BXVO0j3v7l15SYn1wAJr9Rm4v+6Ke9cOSbh4vnHWkJZT+k9i0Qkiw3n9OVdkXSOkpdHbd
	 8z5qsn51a1mnVg4oQp1cQVTZ27Gg0wnO+i6+yNW+oH+AMx42FwrZIFruHe0bCAONI1KF/
	 g8wDsc6m+bqSWM979oAS3qBfSGD0NV71JRbiyL8RdazOm9LlfXIX11E26KE/AE6lFhTCY
	 hlkSwZBh1MYMdxEbWHxzMpvfKXlFSGDr28QHYN6EaK82V/7QzUWNrXe+IhMeMGSNahA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=u6wrdDfBUAx+lhpOjfgvo/YG0J1lc0DhZKLgshqkArk=;
	b=aJVVxQR77oNO/E2P9lR2MP3o9/msQz8FvwM0ZD2+7r70S74VLRy4zc0DNJ0gCZROHKl0
	 yKymayN6TNhH7j2HjzOULKvk/0KtTHfYKqX6Dkxz7R++2WCbsKATrQPHYFznBIS0JMk50
	 UoEm3vnvEfa6NR13cy+YPKUAmJWAzwN1QRs7ydIEK/AIOh4Llcug42aEokrEtd0oRf00e
	 xaEsKvfUYjDeXedBssPmW50ma/rHCnPJh9AkP154XTe8rWMjCVm7GFzaBsaZae9ceeLum
	 JhtlfBkVvuPQxsIicc/8sD8cUTqreJgjr2YyxAboQl0lIdPd2BNcgyg2pb41lEP3rKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D2pXuL95;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6723C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6723C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D2pXuL95
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0db268bd8so20283417b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030017; x=1793634817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6wrdDfBUAx+lhpOjfgvo/YG0J1lc0DhZKLgshqkArk=;
        b=D2pXuL954F33dcEoQ0l2BBjEirm7xH1311UAnQZlNeVJn15Fno9zyTIfnqI9esHlr0
         YcAAysF111tjJXZpXdYBWTNy1MIv0MQcziI/tPDlgWYYaa+tpJWzW8e7PtjV5Sv9G/Yu
         9g/xxILQN8m8h7RCISIIfZNwdGwo0j/a5fT2/Bo75EWcvEgyOsPcDeVR8v2p2JE5P5R6
         DBb1Oa3FPgzDJQHC1lyc9H2ig2JcZi2vTbsSHqfbTa90BhT8n8NHMwqKO0HJu7wluVLb
         CMPLd2O8Yf1EAaSsFuKl2Tj8wwzXw4sBArMT2EW6uIaynFdUXi+OFDjwoGYAl3nbILCf
         yG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030017; x=1793634817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6wrdDfBUAx+lhpOjfgvo/YG0J1lc0DhZKLgshqkArk=;
        b=Xfm7GDGVxyyVFii8HHqcHJ3A6sje2ZJxSCa6KaNB/0fKPH5tqsa46k+paNqLjAjl5d
         KVB9A0c9jcbAhg3oayecVHpNADSoRuBk39gPLEN50ZuLM/Sh1gYPbTX0vudXG9F9bGHh
         HfPBBQ+td5uNuEw+enSIXidIRS3pqqLYDitzEknkDCgf1j+jnycgEHCdyHmCMXhVWLpp
         vSCNx8LFNkg/X/62lDhzaljWuKiocdDXQsOO2wI6DppkNnVHg/ybZFFhBQMM6aiXSTYu
         PkfLntWlC89fZhFXgmcHIyKUXf/gs922gP1aE4iW9JO5Y2GA/F4nNKrAAm04MBJVKeTK
         SzNg==
X-Gm-Message-State: AFq9FYKQ1Kgqt/ncK0ORoWOT+E1usGzZza0UKL5L5rOOUqP9ct7r6m3J
	aN0D7XT/CClSJ3BbMq6XP3BV/zjNNsPaeL90YSO7A4tIePyjr/tzX1vr
X-Gm-Gg: AYBFou0iuxqu4QWotyxOySYEXa9Tj3uFhrMOAuOFEbnc8b8R54C1oSYD4QT3YrBcGY+
	msGonKVoCdlXtr5nM6YY5y/mc/h3JqBnxpNXVHg1MRvjlXISG5hSM6HwciDQTSiT+KnRLHcHnPN
	ONYw6PYnM5n4QE5c1U5V3r92KQITYaEoWjHVzDWsGyWWAr/2dj69bNX1u1BtYy0lJmWWxVRWykK
	MboQiAFul8pN2eLXeIGVK07kOVBxHdSScDwFNioGLntb10C1o0o8QDD0dcEck/EVOJAJ4TG0Veh
	nHzmyJh/2QQGCSeikUgar8i7X21xACfQO1BmHImui4ckKWIjd3NP2fcgOPS4EL+/YguSXXW7+MW
	xkejCA2cW6iPjIXDgmMvi2IvJ8SKRmH1Uw6lF/dStcWh4InLeVi863MxEXGLzUPM9YWjjZQr+Do
	+SdTVaUJEhmf5L41mscuay1mXLloFnc4IsJSdi5tvN0EgOBUpeDskA7ORjWDWUViL4OXm8KZIW6
	LTMDe0iJItgfmCTg4TACa1uJJTVTU/8DpcJYlu+1sZ7cbgf0JvwQGIdAb7kzk+LJ5GoBsrdW1Ip
	EOsKR3IyeAdQu/yvSLzH6mcrVbI26aE6TwWFAshfmiqJVpUx8/M=
X-Received: by 2002:a05:690c:7445:b0:8a6:1205:12e8 with SMTP id 00721157ae682-8b166c1b1bemr49338827b3.44.1793030017363;
        Mon, 26 Oct 2026 08:53:37 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166e46a93sm33895977b3.26.2026.10.26.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:53:36 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Mon, 26 Oct 2026 12:53:28 -0300
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v4 5/6] iio: core: use kstrtodec64() to parse fixed-point
 values
Message-ID: <5ufw5zi4x5rrhs3wcm7kt7k3a2xv2edibbrzoucn3pxr2lddyw@op6eytgbgn2a>
References: <20261026-e-notation-v4-0-a366a6d14d57@analog.com>
 <20261026-e-notation-v4-5-a366a6d14d57@analog.com>
 <at9plejNuVxO2V-A@ashevche-desk.local>
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
In-Reply-To: <at9plejNuVxO2V-A@ashevche-desk.local>

On 26/10/26 16:54, Andy Shevchenko wrote:
> On Mon, Oct 26, 2026 at 08:54:09AM -0300, Rodrigo Alencar via B4 Relay wrote:
> 
> > Replace the open-coded __iio_str_to_fixpoint() parser with kstrtodec64(),
> > so sysfs writes of fixed-point values also accept E notation.
> > 
> > The fractional part only keeps the sign when the integer part is zero,
> > as before. The dB suffix for scale attributes is now handled by a separate
> > __iio_str_to_fixpoint_units() helper. It strips an optional trailing
> > newline and the "dB" or " dB" suffix before parsing.
> > 
> > When there is no fractional part (fract_mult == 0, or dec_scale == 0 for
> > 64-bit values), try base-autodetecting kstrtoll() first so hexadecimal
> > and octal input keeps its meaning ("010" is still 8). Fall back to
> > kstrtodec64() on -EINVAL to accept E notation.
> 
> > As a side effect, inputs that used to be rejected for integer-only
> > attributes are now accepted. An invalid octal number such as "08" is
> > parsed as decimal 8, and a fractional value such as "1.5" is rounded
> > to 2.
> 
> The main question here is: Do we want these side effects?
> And follow up question is: Where is it going to be documented?
> I consider this paragraph is very important for the users.

I see that those side effects turn the sysfs interface more robust to user input,
not an interface change, but indeed a behavior change on edge cases. To answer
the first question, yes, I would want those...

Userspace can do floating point math on physical values and scales and write the
result to raw integer attributes as is. Rounding to nearest acceptable values is
something that drivers often do themselves.

I am not really concerned about the invalid octal case input.

Also, no valid input being used so far is being invalidated with this.

As for the follow up question, I can add some details to iio_str_to_fixpoint() doc
header, which is the exported symbol here.

> 
> ...
> 
> > +	/*
> > +	 * Keep hex/octal support for integers. E notation and decimal values
> > +	 * result in -EINVAL from kstrtoll, due to unexpected termination on '.'
> 
> kstrtoll()
> 
> > +	 * or 'e'. It falls back to kstrtodec64 for decimal fixed-point numbers
> > +	 * with zero scale.
> > +	 */
> > +	ret = kstrtoll(str, 0, val);
> > +	if (ret == -EINVAL)
> 
> > +		ret = kstrtodec64(str, 0, val);
> 
> 		return kstrtodec64(str, 0, val);
> 
> ?
> 
> > +	return ret;
> 
> ...
> 
> >  int iio_str_to_fixpoint(const char *str, int fract_mult,
> >  			int *integer, int *fract)
> >  {
> > -	return __iio_str_to_fixpoint(str, fract_mult, integer, fract, false);
> > +	s64 dec64;
> > +	int ret;
> > +
> > +	if (fract_mult) {
> > +		/* scale = ffs(fract_mult) = ffs(10^n) = ffs(2^n * 5^n) = n + 1 */
> > +		ret = kstrtodec64(str, ffs(fract_mult), &dec64);
> > +		if (ret)
> > +			return ret;
> > +
> > +		dec64 = div_s64_rem(dec64, fract_mult * 10, fract);
> > +		/* only carry the sign in fract if the integer is zero */
> > +		if (dec64)
> > +			*fract = abs(*fract);
> 
> Should we actually switch to UB-free abs() implementation?

abs(fract) here is always less than 10^9 (largest power of 10 that fits 32-bits),
I'd say that this is not a concern. 

> 
> > +	} else {
> > +		ret = iio_str_to_s64(str, &dec64);
> > +		if (ret)
> > +			return ret;
> > +
> > +		*fract = 0;
> > +	}
> > +
> > +	if (dec64 > INT_MAX || dec64 < INT_MIN)
> > +		return -ERANGE;
> > +
> > +	*integer = dec64;
> > +
> > +	return 0;
> >  }

...

-- 
Kind regards,

Rodrigo Alencar

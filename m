Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD84F472E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974823; cv=none; b=K9ikhO1UsJtOWZbrSgVz0CqDf6KQWWhqq6eTVqC6KMZ09AJTcDJP6xLuo2gMVk4eiNh7mgPrCdnEU6N4rFsuXjFdZMrZyd6Vl7DQ2JePZh20CWuOxSqzKs4xRoW3eOqtfY2rdsHhbgRDEUyWsx8TZ8uH0/H8H4wonWipW76bUVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974823; c=relaxed/simple;
	bh=pgTPeh6fSumkYOobvp//FpqOqnq2AlV1chQ5M4tLP0o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTvNSUSO+ZF0YUaclPw/tRXbreI1bBSaAaPJobUsNTqO9ZNRIt2xoELhk02IykChysw9aIAcAaBm+zR0e32Dq9GvqHtiBBeZ+8P+tX+7fO7smnMN7npyEjZznzAER1jZ7VM6MHGgTnPtlCY5LTl7sATHL2AnjGzQ2xhhZcLcEBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtahWVPb; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtahWVPb"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f84a55e31aso2430924a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791974821; x=1792579621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ARzMtIM6nY2ZyJNoTcRxoX3tpWOVN/DbY4CV8vne4tk=;
        b=qtahWVPbDrBi7zRUUVYe9aZUU5SDl+ovqATH6LF8cRWzY9uNgi1miFsaF0bSLN0Z6m
         UNk/GgBconiuJe7jepwAsB2vWN5i5V6yZ6lwSpnNeiPzv7Qh1I0MNJDPQUn/Le/MOpZo
         zYo9QwLQQwbX9N0ztNdNL2ySGow2zw39dXx8hB4/tM/UPcIlBRd1TE4kMJ87ExZP4EdX
         bu1dXzO+4TMoKZYMvHV4qmuHtiYofpt4PQcGDbQrmmlgJQu6AmrpcHx4dTiug1Q5XQo+
         9lp73ebxOyk/raX+W+L5VxrJuPgz+zh1cUFMLZdJUof5ED4ipa6/szBwCk78y3deVe+w
         IKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974821; x=1792579621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARzMtIM6nY2ZyJNoTcRxoX3tpWOVN/DbY4CV8vne4tk=;
        b=dw9o1Oxsv6+qrEzRLxq04bDD+/Kq/2sdVggVk6Sv95e9vTnlkl8fNkzxqNeEOJgH0n
         NbOyG0QFvzIxyLtvuElyyGZv+ijxwuf6jittENN9Ce4Rk2JmUBP63b9wauuoqHE6ZDNx
         GnimpDbU43U1mFWBDjRdQkVjOB5AJrT9TZk40cLqTopUhe67EIzFcXp8nuZD6Kp3jmL9
         9zpRZ9icrUO58guWUIAYCROIMd2TpeDPcBuYaBUzeCr9R9uSPpMY1CqJcxVnkKfIFeVy
         gKFrEpNirNvimbp3mLH2SZthdd1pQHgndB8QC5F5VQqvscfJ2eBt/RrPfg6uqJgah9Ai
         gorw==
X-Gm-Message-State: AFq9FYLNWqT03bTPmzsFCuto0OE1BnaEyecqcjY+qycq2U2wkGsxzZha
	QHQ3vzF+O/XoCdlifBCuEBzSiYsbPPOfUrXY85omQz+s4XSp3Eae5ZXu
X-Gm-Gg: AYBFou2WQkN4ULjQTqaxVrZ9k7NTzNo/9zS1FHUyPIz7KI07Drg6YfWWHKLvMWPqggP
	QcFBKUQIJt6sDZvTARC2dwfeaEiWtEEwC+EPYCD5KGMVr/QNgqqkooW9u+SmN7NNvV0wNKTkWQ5
	1yvcsy+vHgYYOOQdKEgtmJqDKSheyZTxk44A4Kab2awJ8PO5Nyq79sVHvqzlS2ZwdKCTUP9suml
	kj/34F9XRqn1a41+X3Bk61d8VfqolC40WChHMp5+vTcatSzc4zm+j7EKyHlPnTX04cHzqVs3R4s
	HEiSL69HYUAwAj0z+pGf3nQpPYG5WyEModkWe38VaYcEEKE02wRZ6GiH8h2v36ZQvnh+wgJfFAr
	RoDYRHf6VwEZ+S7ctpKiPZ6PHYy1NF3o7ktoNpoMRDCziHZBQrqYbOSZdPhUJanqz0UfPEMs7Gr
	nLSxhWqEkGCTe2mJENQNfoDMuxCJQ0H8yaXoz9/1NvkDNV3TLaZQC6P1Te7sepiAI7rs6DSbp85
	jSV/i+rpaYCj5A1t4iXMcaou73hVRTPqZrTfGKINcrdo+dqf3RH9cSfaF7PVmjpEwSxXU0=
X-Received: by 2002:a05:6830:2306:b0:822:e81b:3ec4 with SMTP id 46e09a7af769-8309506c286mr16740147a34.7.1791974820930;
        Wed, 14 Oct 2026 03:47:00 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039076d72sm14370837a34.12.2026.10.14.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:47:00 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Wed, 14 Oct 2026 07:46:52 -0300
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH RFC v2 3/4] iio: core: use kstrtodec64() to parse
 fixed-point values
Message-ID: <wakcc6vv3qdpmbmamrb53m3xi3htna4rpbhltwt725hlg3j6g2@vjwsfqgkoynv>
References: <20261013-e-notation-v2-0-d4adb5e193fc@analog.com>
 <20261013-e-notation-v2-3-d4adb5e193fc@analog.com>
 <as6BmyTrFXggzg3S@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as6BmyTrFXggzg3S@ashevche-desk.local>

On 13/10/26 22:08, Andy Shevchenko wrote:
> On Tue, Oct 13, 2026 at 10:36:46AM -0300, Rodrigo Alencar via B4 Relay wrote:
> 
> > Replace the open-coded __iio_str_to_fixpoint() parser with kstrtodec64(),
> > so sysfs writes of fixed-point values also accept E notation.
> > 
> > The fractional part only keeps the sign when the integer part is zero,
> > as before. The dB suffix for scale attributes is now handled by a separate
> > iio_str_to_fixpoint_units() helper. It strips an optional trailing newline
> > and the "dB" or " dB" suffix before parsing.
> > 
> > When there is no fractional part (fract_mult == 0, or dec_scale == 0 for
> > 64-bit values), try base-autodetecting kstrtoll() first so hexadecimal
> > and octal input keeps its meaning ("010" is still 8). Fall back to
> > kstrtodec64() on -EINVAL to accept E notation.
> > 
> > As a side effect, inputs that used to be rejected for integer-only
> > attributes are now accepted. An invalid octal number such as "08" is
> > parsed as decimal 8, and a fractional value such as "1.5" is truncated
> > to 1, matching how kstrtodec64() drops digits beyond the requested
> > scale.

...

> > +static int iio_str_to_fixpoint_units(const char *str, const char *units,
> > +				     int fract_mult, int *integer, int *fract)
> > +{
> > +	size_t units_len = strlen(units);
> > +	size_t num_len = strlen(str);
> > +	const char *dec_str = str;
> > +	char buf[64];

before strncmp(), num_len is adjusted to skip '\n'

> > +	if (num_len && str[num_len - 1] == '\n')
> > +		num_len--;
> > +	if (num_len > units_len &&
> > +	    !strncmp(str + num_len - units_len, units, units_len)) {
> 
> Hmm... We have strends()... Do you expect string to have garbage at the end?
> In such a case dB and dBm won't be distinguishable.

It might end with '\n' (see above). It would have to test for both
"dB" and "dB\n" with strends(), having to prepare a separate buffer
just for "dB\n".

The current logic will not accept "dBm" in case units = "dB".
because it would compare "dB" with "Bm" from "dBm", i.e. an input of
"10 dBm\n" would fail comparison and pass "10 dBm\n" (original string)
to iio_str_to_fixpoint(), which would fail for EINVAL.

Another fail case would be "10 ddB\n", which would pass the comparison,
having "10 d" passed to iio_str_to_fixpoint(), which again, will fail
for EINVAL.
 
Will add the requested test case. 

> > +		num_len -= units_len;

before the memcpy() num_len is adjusted again to skip ' '

> > +		if (str[num_len - 1] == ' ')
> > +			num_len--;
> > +		if (num_len >= sizeof(buf))
> > +			return -EINVAL;
> > +		memcpy(buf, str, num_len);
> > +		buf[num_len] = '\0';
> > +		dec_str = buf;
> > +	}
> > +
> > +	return iio_str_to_fixpoint(dec_str, fract_mult, integer, fract);
> > +}

-- 
Kind regards,

Rodrigo Alencar

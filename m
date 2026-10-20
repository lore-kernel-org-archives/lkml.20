Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516056;
	b=gE5AkoT0QaiM/enHnkYYA5QW0jYbfcMY557c2We/qyG7ruf7lJwArUetI4BNRPyupUMN
	 aHBfli9+Mc9V+HhX+qCYdDd+Y3VpLLtno/lWtVC4o7107P7mUYgJ7oInMrxHtzN21iDnN
	 lTRXWxv0B7zbBQvQ9ti3i7jbWk8i8SWTbtYxicTspaMAVL7ASo+lvg+InJ9QCBV1MBEHF
	 GGNNBxMlmSOeanQPAzjQFNhs6k+SBcMKJm/EXUYMupnwPlHKYA7/SbzTN32ar2hkPKbFN
	 Hq4ybRJ+RfMY33tyFpDo6P9ix8m3Awop+aSqO40SYonA6zB5J1oPJPT8gFywpQtm1Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0NChw0q7iQyjFAII3unH4t5su0zEDRJMz0fmmAi/9lo=;
	b=OTk6A3VLWTxbEJ0HU9xAPVoveduhnFcmQGz9qNxCMT7S1xez4i9lQwqDm0k4VvkMXjnV
	 X0vBiIAacyaEMo/eJbRF9ejngoZzPVc68UPYmc90qToO3v1oYgeE3ZIHsdsjRbOoAfYCi
	 Lpf1jxa54R1WpruEfwcWq9kNpUj3tJtAGYNdvIowEEwu2ialWUOtXjysDMcsDgV0EJ+Fr
	 uM/zYIzXI8dKcvuhtbM9x3nSxjlGywR6Np2TXqjN4XpembGGvB3g7IqdH9jNRdlSWsBhH
	 +bAx0racAaT1eL6Mec0+MLfcVQ7jvnjtJrK90UdPUBHLsEmq6H/eJs1TtysA9XgasXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NiM8ezg3;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA499606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA499606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NiM8ezg3
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35943f55c06so1352169eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792516055; x=1793120855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NChw0q7iQyjFAII3unH4t5su0zEDRJMz0fmmAi/9lo=;
        b=NiM8ezg3/gAh640fVbXkioAOXlq5h+cvDQK76QDJ/mCqVVCoQ3ifezFIKjXT2ToXW0
         BCWQUnlbl873lYGS9OKrsrI3K3C9ZN1/0UuaLpl2TPBcGyP6fRtqAAJcApTniq0/ZtvX
         rE/etJIyrzT5qYjd+1uu2ezFZnfZQplXIubw29B8TNOXyViElhGgqWW+0snm9rtlLfAq
         g8mHMdcHGJ58ovEvNyk1bFbw3r0MC0luw5RUVCYOcNJ/3FqgqIajI1/i9JHWkU8IOylO
         E0dSASzURbz0chZnN5BMP5LtuL5CD3FEVuYtYczVB/t//gUhD/hjowt/CwqqrBKIUEAR
         j0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516055; x=1793120855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NChw0q7iQyjFAII3unH4t5su0zEDRJMz0fmmAi/9lo=;
        b=d9EeZo6zK0HoJhWKJ1uXPleoMdQ/Y+ICZH3J0dkbdh1WJvJLdr3M3K2GkhlFUzVni4
         RX3Qf03aY09DqpPPrvbQTekCQX2y0Uisl9V1uHjkLNQh8xfafH13JFiH52YegREVHUqh
         yoZ21QRuQBEkkZEmUpepXAi+OOezMaVBmAbjXPJZfuI7MhopsQfKxJ9FgGT4ydZ8U63k
         IBlNnLF99vo6/Rpoy9zi7U2X7hdpqg3F6Zkd+2fDK1SQU5gWoTxv7NHcsDktanpRtaoQ
         DZgFYsGYvC1wnbUE3Trt+BbRuqbJWIFDscQX15mqubdU5vmdNKgrT0SsPwNWUcB/OdUa
         K1ow==
X-Gm-Message-State: AFq9FYJO/OAW27l6HFZKE3Ijk4NSQIkcqEhE8hYMvmt6WCryU1UQRkaw
	n+SkbKsBULBDolco+Q7b1zi1NSWPjy5IAN3aDmxw5PoORm5fcuG4+zbu7lpx0Jbt
X-Gm-Gg: AYBFou2iR5pLar7BRpV7c2B14SZNAAno+yqJGzued2QV7IkcrL/IIOD2vW4q2YkCU/b
	V0aKLZcwxB6q6wr+SLEllrC+6UnRXEnef2vDannLR+NhULlwd3EGD+NC/i/WKVy9ibGfuclik27
	yVWQ05vAnQNgc4b9ti346LG8XR2JXRUNqd1b25WAxN9KF0LVbgScwDdM2gfQ0qlBhImyxQqTv4U
	itKNUck7z8dgD7KeA5oRVYdz2vg+LAPly1lTeZXjeV643wCj4O/ZK8fBgKdL1hx/DtJpR6z8H/P
	4zWq0SrDRPWY9Mv64OOPcPogkMYyJs2GCQIUZXStd/lZGtLEnHksbgtwMyFR+ZyHrM9A1Hmt/Qo
	ANClAKoFAiMFve0E7zFFMEP8hCGoDiYCIdZp59JR724we2PAVKMqkkxOjHfoSnFDN4oYdsq2fW4
	Duykh6SDiVqCOA6HlOLaenc3Nz5Ed8nLHcFnMWBJJExmZ7Cvy9EU4aNGxniEbiCVPaeXE1P5rrU
	M5pp2KPsjjqRRWGYUP2J7xB/ERQXhXAlmMNhro61ugDh/eSTVBrFtYtIFwIffqL18O/yg==
X-Received: by 2002:a05:7300:e7a4:b0:353:5d7a:cabe with SMTP id 5a478bee46e88-365fad8dd2dmr5231285eec.13.1792516054528;
        Tue, 20 Oct 2026 10:07:34 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm43436541eec.16.2026.10.20.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:07:33 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Tue, 20 Oct 2026 14:07:25 -0300
To: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH RFC v3 4/5] iio: core: use kstrtodec64() to parse
 fixed-point values
Message-ID: <5ixgnxi5hckja73lcujqo6c2bthknpeunwfaynpagyqnzsmqo4@fy3tvpswyza4>
References: <20261020-e-notation-v3-0-fd385c0fbf65@analog.com>
 <20261020-e-notation-v3-4-fd385c0fbf65@analog.com>
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
In-Reply-To: <20261020-e-notation-v3-4-fd385c0fbf65@analog.com>

On 20/10/26 09:27, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Replace the open-coded __iio_str_to_fixpoint() parser with kstrtodec64(),
> so sysfs writes of fixed-point values also accept E notation.
> 
> The fractional part only keeps the sign when the integer part is zero,
> as before. The dB suffix for scale attributes is now handled by a separate
> __iio_str_to_fixpoint_units() helper. It strips an optional trailing
> newline and the "dB" or " dB" suffix before parsing.
> 
> When there is no fractional part (fract_mult == 0, or dec_scale == 0 for
> 64-bit values), try base-autodetecting kstrtoll() first so hexadecimal
> and octal input keeps its meaning ("010" is still 8). Fall back to
> kstrtodec64() on -EINVAL to accept E notation.
> 
> As a side effect, inputs that used to be rejected for integer-only
> attributes are now accepted. An invalid octal number such as "08" is
> parsed as decimal 8, and a fractional value such as "1.5" is rounded
> to 2.

...

>  int iio_str_to_fixpoint(const char *str, int fract_mult,
>  			int *integer, int *fract)
>  {
> -	return __iio_str_to_fixpoint(str, fract_mult, integer, fract, false);
> +	s64 dec64;
> +	int ret;
> +
> +	if (fract_mult) {
> +		/* scale = ffs(fract_mult) = ffs(10^n) = ffs(2^n * 5^n) = n + 1 */
> +		ret = kstrtodec64(str, ffs(fract_mult), &dec64);

As sashiko pointed out, this is breaking some test cases under
drivers/iio/test/iio-test-rescale.c because of the rounding case change.
That is in fact an issue within the test itself, witch limits the parsing
on 9 fractional digits only, requiring a relative ppm of a scaled value
to be zero. I will have that test fixed in a precursor patch.

> +		if (ret)
> +			return ret;
> +

...

-- 
Kind regards,

Rodrigo Alencar

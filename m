Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783084;
	b=CUiBc4H0OPnDRMVm3G4GtsBzVsT0XImC4VVFyL8EuRVEGdeVjNXuA9BhJfpsQwhUdBqK
	 /Pt5s02amZ05pbYzpj9fJvZZ7yNGOVbPy0q84895cCR/mfMKbAHGOj/84n75Q7Q+BRubc
	 RDjUzFXtOdPyIBmNoKnHyLA8ELdXuy4XyjrXlnNgog6shhAKJAhm19nWLPyVrExxfhJ38
	 08mUwQtaF3EY0hSZZcvYGXQj3/rNddVmncH1NrgTBufJoYYcjUfMiqCz3z/H6uPR4WLj/
	 W9AM+9AqAhq8BHvy3xNahGWwDKFZFTp5/dg0/rmQARj80Kn/k3sFPSa58rumZEgU6uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=abCJPnZRJTccf2CBVLemfheLgJNapsyRZa2z8kbgwdM=;
	b=YuregrIT5rn76vy/J3A31728x8XMXlBY6oSBOC7OJC/lkYCg3s4ED2SjEheE9c5MVQdQ
	 1WRRa3u2hjOXbiXSlyl966e8lY/GN2yFiMnGec77ZSYzxcw9Pp3MrpfuBosmpx+CMBVku
	 06gQpnqXjb7m2eeFnFHfrCn20XXh3nYENACjRWemHVISGVctJGSOMcCcUwKJL5RH/MNX8
	 OrXgM14tytvft4dfJ+hkcScAIqhtlhLBi6WoMXc4t8a5O+9Cp07FocFSmAxu12vIQJkJ5
	 c+J56FX0v5xo8O9E4DVR1CgSnlsJZbzweJAplsFWTZ6+DHMNYNDQW1iWCwsIig8D26w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gs79E6th;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A34606A33F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A34606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gs79E6th
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-677af43eed4so439139d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783083; x=1794387883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=abCJPnZRJTccf2CBVLemfheLgJNapsyRZa2z8kbgwdM=;
        b=gs79E6thA3kgM6oDsprNfbjRxjwDOdimV5m5dxpy6nnkoyTnCaxm36bTVL4jKtu7QG
         8U/a3mbtqM9vauAo6IBgnl2s1UtA/flpMpKlV8xNTBvMCmI45PGN/q9RTQgpd4qtNOUn
         b+4Lck/6cMDEE1dmQq3TkbXCoJQakUKtUiL71KNUsbz3/XMlSejTPBih4EZPquQR9dpP
         plj8nJ5zBbmSugfbxbPpVLW+JLImaH6B6QK0hUYoU0heGJAiU7A8lLjvvZUGJG68UhDN
         y2eLtL96yRqWgdt/WbIh+VFLSoU9/wSy8wvWg5N1nkpmseOEyS4E3qyQiNsjqC1GDbcN
         j4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783083; x=1794387883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abCJPnZRJTccf2CBVLemfheLgJNapsyRZa2z8kbgwdM=;
        b=NpRp4husiTC18ausz6zLBUPU/fJYihTgHHWpULOrjVqNdKwTFFHzvhS1NIxTDd3red
         hhjcQbETTMsGjKm95LcYVepkKor8J9BKGbBVfUtjEc0JZKFQexn+aAx9voz9xuJvHnep
         XF2ORrLlD/AFdvHKAZrPPX2T9nx4rbIewNoZhmpUzDJh1ORByYiq0Q384B8vzGnLYBJD
         Ho0ALQO76yloZu4oy6PEyLRGUSUJRebE04CfGGWic0VEXsQFIuVqUURqWpVgb12xaLYG
         u8U4FzJS9o/p+YPnuonw+LKejVZgDPeeozsLTtSYxjHzhQNUTzOY30ibxOqinPzEtlUy
         4b1g==
X-Gm-Message-State: APuU4Z8UHxOHNLFB4934sqkT+BvANAA9osrsd7ZXkYMI8uj0cPlfTwrj
	PhhiKjWblLKaZXMjT/DNGBEdyI1hIgXlH0jb1wn8wzHd53n50I46eEj/LX6P5oav
X-Gm-Gg: AYBFou0w9JdmyI8/hOd6rZETrbX08lo0JaOuckUlg7qGwvLP8vxeiXXjY/4GGAeukLm
	w4/erQd+HQWhjS1lJ3HH2i/3xnkqoIamnIpp5+03nh6hUYnYEHMFy4r1x5Ze4lqyxxt8KrBD3tc
	dvDYAxqAE+ZaD/7xQug5HXVp2E6UqqkWySPVcVYp5kfLgv5iffy4gP8i7AqTxF97PdNjUKXw+98
	MYr9j7SCv9c0S1fTPrUN4Pqnn7CLjPaco0h9U9lfT7wsrEm2VWZ9IzOcpEWXM5T20ofrLGB8EUF
	ZE0a8jFbgRz3+Ndf7Gw+6+HpXqR6kU4Qu+db5ujEEL/2yMBwrBElAwW7VHp6IDnfccdvofgQPwZ
	KXIHhrCCY45qPFzinyDsRoCzdUeGYDqjdoRS9uulpnrfx1yo1AO09oh4SOZDUx/Pe3NofmHHLiS
	kFjIAk45uqtlCWvfVbnjeQV24Z/1nZ9BL4oL6CTCYW6u+9Y6D6JdwIhuJUPJE9t44Sj/hx8gaMB
	9sFrmvWuMe8kkMMnc35gw/8DcXwNcx6XvmycW+mWyjFtRttKhc+kqa8ZME1BqO04y7itjxZKKi9
	VcCCWK7P4qttGHeRupVTho2EkcxDI/fWGnhBF5E5wCzRRETkdtCe9OcOz4H1mnkKykxZ1vul3Q9
	2LFIiwcS9DbkzUTrxtyjR61c=
X-Received: by 2002:a05:690e:bc9:b0:675:a278:10a4 with SMTP id 956f58d0204a3-67ba5071189mr12464797d50.103.1793783083257;
        Wed, 04 Nov 2026 01:04:43 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bbb4f7sm14402517b3.41.2026.11.04.01.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:04:42 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Wed, 4 Nov 2026 06:04:38 -0300
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v5 2/7] lib: kstrtox: round to nearest, ties to even in
 kstrto[u]dec64()
Message-ID: <7qc3geup2edufde3wbx5wsyhjz6tcnekoa4c4alxudqb7buvmf@lijbrfhachls>
References: <20261102-e-notation-v5-0-d399e544a982@analog.com>
 <20261102-e-notation-v5-2-d399e544a982@analog.com>
 <auof_hMbsbFq3MYj@ashevche-desk.local>
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
In-Reply-To: <auof_hMbsbFq3MYj@ashevche-desk.local>

On 03/11/26 19:55, Andy Shevchenko wrote:
> On Mon, Nov 02, 2026 at 07:41:00AM -0300, Rodrigo Alencar via B4 Relay wrote:
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
> 
> To avoid unneeded brain work it would be nice to add an example for negative
> input, like -19e-01. And I hope (and it seems the case) we have test cases
> for that.

We do have the tests:

	/* E notation: negative exponent rounds integer digits */
	{"-27e-4",		3,	-3LL},
	{"-125e-1",		0,	-12LL},
	{"-135e-1",		0,	-14LL},

> 
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
> > 
> > Update the existing truncation test cases and add cases for ties and
> > for rounding at the type limits.

-- 
Kind regards,

Rodrigo Alencar

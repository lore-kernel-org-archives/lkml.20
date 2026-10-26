Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028563;
	b=pX9oi0nGWsQ0XTH8RmQrNMlGoPRnlXxzgsvJ5DUUpF6vB9Jq+dj3dOtBqxL1BEAEMDCc
	 +G5veJPyoW4LbQ55EosprfmTYLWA9JKPrzRm2ESeu8TAy63KoBH0ybunbS25u60VTECLt
	 MaJ2FHoP4YVRcxq2J7Qqoe1pMnVOKfAPZDIg58Dm5iMyOAN21zklHKsaIbQnSzkSwwPtq
	 AulgIptYNBAdwzeg6lbGwgarupaBTQZfcSihNTb+cKJmiQMychrQ1nk7yb6lgn6FUttBx
	 MZDMuoxzZ6/jM6kIRp9CA/HX2uNWUGD1b6RneDuPNdVC/cGQik8Dl9ZN+y5gL8vyByA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8iZubcz038EY8c4oZtKV+g//UmaZbw0VPeAJAfl9gbs=;
	b=ny70qwEmv82ldWBJnHteUa+gJeDZN69R9t/Ac0n+boxBnvAY7+80u8nOPEfO+BChQ7ZJ
	 F6ArFUM3YBZmt7rQwE7yGtcg5+HojVnu7QlJvVxeo79eOb/NcOVH4S/ZMx6SKQ1MEg/kX
	 lIF5bSP8413ABQWRBiqkc8PsdIWkISFLj4LRhRKchG6Nk+Qi+Gjv/NcgfMnVVVO8uc5Kw
	 3j5N1r/CCphRWT7SOmxSCbQ2oi9XRNUaxYf8aJgpxoL3l5DW/9D+YQpWwmN1McCDgc53F
	 oa3qcFf3iliJWronlZDBbo0AvwnjL2RCFIj/JY1hC7RqPgUY4FZYc/SL7oR3WrkXRbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="n/3EmII+";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FF7606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FF7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n/3EmII+
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so921817a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028562; x=1793633362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8iZubcz038EY8c4oZtKV+g//UmaZbw0VPeAJAfl9gbs=;
        b=n/3EmII+fJ3KhXyCQp9OEAWpnHIEVyvrQJ1AzXdeKd0KhvvrNiJNZtCH4Gj55qCChy
         q2DyGFrBEWIZ8NO+qHPrl/AFajFpUQIRdQnIMx9BBZV7oJWloxHlED+nsYrFCkmqqoIf
         PFX5J+e0NMDoVfhMUi/4b+hA3ss5n3qwKz3J/1JfpswNsbxfbBKmfYEzSa+4e5AZbgWL
         xtpMqxmQMC0Gh0ZTd7nLGGX0NzBGE+Mmur1OF2t9GnRaxPk0xPdAghfCfB31U9g54r4k
         9/pN4Da0ifQQvbcjqz2k9bcsAwyNxSh3X2GopNHSIrWhmnfcZ0KTW84YAe/ea33TbZiW
         3mBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028562; x=1793633362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8iZubcz038EY8c4oZtKV+g//UmaZbw0VPeAJAfl9gbs=;
        b=lqiLrl1xTXon0rCnKnm6SH3rEe3cbFGlUU/PoebLNBBOJXrLzQbE7E9EexYHtHlBIr
         vUlIHlZulTlhZGomK4voXxK1H/kztTw7pGXl42P3kKFZ+45Jc8byQStig/EjfD6qEW2x
         Lhe5Tekb2hirfrZT4wCvo8/yVn0UgKUpoFykcKTifKU5Cer5VmHzLiecIJHzqTKvq8iH
         uO9OqejOpL5Vn2qRCgPVyysHI0gQYKyLtXWXZvJxPcJTE6aF8wmDGhobSqLx/PScku7x
         tQRDg9oIcBb9lS+371W6Y54oktrbivnQpjhB7nhtps/3YKCq0UsOg4wZZIr+tm803rh/
         6wQg==
X-Gm-Message-State: AFq9FYI8MmIJf8irW8Exewn/sYAT77d+ONp8v/RxrT4AvxZ2MlQWyGxl
	JxUmKwXSeyAwWirxoa2hI1eliQ/zjTEbd2Dsay3Q0O5KYSkN5hWysXJB
X-Gm-Gg: AYBFou0p+qf1P4SZOCKE7c7f3Sg4IWvgLN7U4lIYtXBSCn51/zJ5O/UcQpVglLcb/J/
	ZN/U1XWjGnTIi5cwCDGcOsXrCjQAgpmOanfYHMKnONPRae9cq683FWsl6WOcJLsocqesFRYw7t7
	KgXkQ5ajSIaiW0sSjlHEBx/uTdQz13Iw6ixhFTeWA2P92TDJgKIu9OmFzlfliZmqq+KrgN8Bipp
	Ri109XFDHgoxsvCQBmT110wvhEHvJjRWYhFEVUNc7OxGfaLoJNXoMStzIsURSKqoGO11KkUusyf
	bubDlpXNdMUOrygalHyZOlRZB+8lE8HvJiYkea2+IHe/G+4kgynvflg1pQKvZTZ4+1OMmeKhDk0
	xPY/pDd+fizkUna24iuMF5IbenmO4c0x4qZEBYrJ0DyTiuIQNwR9BXHKPH5LduMNbL5Z0mcS2UH
	c/f1VSaJmsm6XwMAJpjti5q/sMLkocGcM9FVjD8GKN8P7DhSEMVN5Kg/jk6jsIDdS+yVE3Zh3/p
	aBBQ90YDKFFL8l1OP+NxOTHXcMkxDQHZILPr8hsQs3ibQPPVSuwjkr0jjzKK7mT1KEOSBb+4+70
	HR9V25hbEgBUol+eRPnaECLyv0hJhhRtk2Wi1ZiFcwcLHaI68QU=
X-Received: by 2002:a17:90b:1c8b:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3adea8966a7mr5554619a91.18.1793028562351;
        Mon, 26 Oct 2026 08:29:22 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae403d0d9dsm3332a91.15.2026.10.26.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:29:21 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Mon, 26 Oct 2026 12:29:16 -0300
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v4 4/6] iio: test: rescale: compare scales against the
 precision of the output
Message-ID: <r3mtebdkezwd4sfpnqp2e3mo3bjqzzgdyyfcw3h5x6mqp5cskz@4d72r3r2wpkm>
References: <20261026-e-notation-v4-0-a366a6d14d57@analog.com>
 <20261026-e-notation-v4-4-a366a6d14d57@analog.com>
 <at9mXdRhiM-9TVyg@ashevche-desk.local>
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
In-Reply-To: <at9mXdRhiM-9TVyg@ashevche-desk.local>

On 26/10/26 16:40, Andy Shevchenko wrote:
> On Mon, Oct 26, 2026 at 08:54:08AM -0300, Rodrigo Alencar via B4 Relay wrote:
> > 
> > The scale tests format the rescaled value with iio_format_value(), which
> > prints at most nano precision, and require the relative error to the
> > expected value to be below 1 ppm. Both strings are parsed back with
> > iio_str_to_fixpoint() at nano precision, so for the small scale cases the
> > check only passes because the expected value, like the formatted one, is
> > truncated to nano. For example, "0.000000033594" is parsed as 33 nano,
> > equal to the formatted "0.000000033", although the actual error is about
> > 1.8%. If the expected value were rounded instead, it would be parsed as
> > 34 nano and the test would fail even though the output is as accurate as
> > the format allows.
> > 
> > Parse both values with kstrtodec64() at a scale of 10, one digit more
> > than the output precision, so the expected value keeps the digits lost
> > when formatting. Scale 10 is the largest that still fits the overflow
> > cases (about 2.1e8) in an s64. Compute the relative error with
> > mul_u64_u64_div_u64(), as the product with 10^6 no longer fits in 64 bits
> > for those cases.
> > 
> > Then allow a relative error up to the relative size of one nano of the
> > expected value, the precision of the formatted output. This is 0 ppm for
> > values of 0.01 and above, so those cases are checked as before, and it
> > accepts the formatting error for the small scale cases.
> 
> ...
> 
> > +/*
> > + * iio_format_value() prints scales with up to nano precision. Parse values
> > + * with one more digit, so the expected values keep the precision lost there.
> > + * Scale 10 is the largest that fits the overflow test cases in an s64.
> >   */
> > +#define IIO_TEST_DEC_SCALE	10
> > +#define IIO_TEST_NANO		10	/* one nano at IIO_TEST_DEC_SCALE */
> 
> I would put them as (9 + 1) to show that actually show that "with one more digit".
> I also don't follow the comment near to the last definition. What does it mean?

With decimal scale of 10, a unit is 10^-10, 10 units is 10^-9 = NANO, which is
the scale used in iio_format_value().

-- 
Kind regards,

Rodrigo Alencar

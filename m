Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291941;
	b=kSNOEMprW0Lf/cZMn99dC1SoDx8eqX0rLEWb9myQEqLZKJV/LJhwD2RDN2RoC+jaMBBB
	 NiO9U/T0+Q3BXzA3NYZ/74oHmajd9VQ4+Sm51TQPnG78tnJWr/DZ8111l5hPbjRzzHEtY
	 kx4AWUdYQHGIfzcD9AgxgZYcX9YeoxEPOHzIF3BEDFIV/6PWy0uEyqdkU3MS6Nfhakw5o
	 NMswHgnoxycgG6/gphkntwkLgFEF1EJxKVUBf/8deV/I2pJf9pfz/6VIvnHTQUOprwEiy
	 NZJdXdNBSqsVQNnShNYAwt1HwMNKqv2TS5kUR0WFTkBA/Jl/zRPhk49sLIOcpB39OPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=secPgUqYwtFyT27T12CKOEsJz45eODbglv/xrQzYdao=;
	b=vNbqbGdHawIIJa+kDhNRICB9NS8ZxL/eACoJWHHxCul1yWaP7BF1M50ykCrIMStYWCg1
	 g6DWZ2dHMDvJ6F7Oybj1e2AQk8vQ4I9B5s8WbtDf0JGVi9+9CZfG2Ej83ACJVXw8s9SXm
	 IwvZidfHDZzUSL7ZlFiSIDpiSAxoiPtny2NrC2Xm0UxNbDdiTkdtg0jsyCqPzj2m71x9y
	 wJzDqmmnOB7Pn5ysBUsqkGgOQXEJpiakMNDii08/0aTF2/lP4qpLyEFuLB4wdKVOg37j2
	 Ie5cXOMA1M7wRh6OXpKkg+JQM9PhkdUXOCt4oD/imwNAC59n1RGmG3YpKqj8E8b0fmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVcVTC8T;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADDE60A260A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADDE60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVcVTC8T
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-188406bb948so2126371c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793291940; x=1793896740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=secPgUqYwtFyT27T12CKOEsJz45eODbglv/xrQzYdao=;
        b=rVcVTC8TGQMpCG7a8sOBfuFoJLWg3xKjWScLLKASsUj3rkRZlIq3nyaHi8fO9e+FB5
         enpl4lELhHTl1EhmwzICVhyizGAri3C+TY3nDGm40h/8CXYYQ+FQQcWZsayhU2ln/nH9
         ULPdUUCkU0Ppr5gi23H/YQlVwnMA94z0lhZWhLJShAvlvPZwNp5XBfbEmEScjSS1OR4Y
         FGyXq6Q7WJIh/g8p2mVqkNgwH2zpSHz5IveuVPiDF4WC8yyYE889ISVmD0pM7oykSG/X
         yp4SUH2uNM5CfrusIGmuQi3Vuo9nEpHFYTBSrBuXGHeS3h64V0UHETPQGaE/qaTMNuwB
         Yevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291940; x=1793896740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=secPgUqYwtFyT27T12CKOEsJz45eODbglv/xrQzYdao=;
        b=un+w+AIHCjOnaRlqeO92f/TZi3uyKz+FVZg1GryBDvPEOx2BTXOXq5yBL7XB76G+jL
         BuHlBb5Zu9CdwbQakkotmq7DDvt3UQMokBsJTNkPoavzmWXZRRXUEpIKnL1vals0MYGQ
         TK3GCqz7v4imrxhLFVzkpVnVZl3ZHpgEsH/NhV0EliuZhsxwcYAD780u77kyVbAIKG84
         Sa7N6sC2xONql+pxMBIE9PkOEi813rl1+ZxrgRf1IwM79cEomzRkZfeWwWBLAtSkzLed
         b3SQ7gFMPDG3zpJfq7eABm7HVmCWTBrZfOMB5pli5WJ97meH6bcGUbmBho+P3fb7KJ3V
         Lgdw==
X-Forwarded-Encrypted: i=1; AKwUvBwd/GDByAb6YDcw/5gtvI9SFUz/V4y4fypXvMZ69hlj5L/NK/yHSXReLBvq/kR764KEbkLAuC+gTgJXBtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKdstLGUIdkxSn3bBP3h4ujkNoKC2BmTf4s6q4D7dQmR9QC7CM
	0Bvm0VXuQL856fhm8urv2r/6MEBs6774nElJS+qABvpek9tQK9MhCAJV
X-Gm-Gg: AYBFou3rwEQwNM84QG1q3pu4Q/wyLa2KJJdDscffMTTC18tr2M5RiZdKdllRRZG5gOO
	b5FE81gq0mc6ylPUMNfmBiKEAqmvs8eRDWrlpHggXzgMUIBQhkB6PxT8BpHjbySeM1VW2w0GZKP
	4cp9W76t0ggF8aHJRjSNc46AuthOCUKuZqeWGZ+oQgNxkuhGajgUlp4m7kCr8uxmTW8btV698Ss
	SLDdMPptwVFYeGUBbJSbc6iN5AhDu5Jgo0x7k3LPH65rYSF9q2KewsBE9hEoJuZHo03CgcHZ0sf
	wX13Me/z4wWD9V75LsPYQf51MYO0wvn5GVUm6+ssESvosuji5ltCbE0Hej35jOg1RC9h28diwBj
	w7CtkyWa+9IzBUPgh90ZLqf1qRTwj//nH04+CxOOJNxmBFiP52QzDaTTcbceh7jPIm2wVmFmT60
	DOGBetbgGZQ+dNjAzBt3H35yjoiO6kWBELL+3OTxs6kUKWLUkT7WXrq8M/lmrYU/jOf4tCqkmAV
	bL/LqBj+/HZrYoIqNKyUDKLWimaWSonwbZ9DlX5qh627ruRYiud+6wMXzepFrMWVKMBEEY+2zGH
	FQwwqfMgZfCbrhX7fSZa1aLsVpQo
X-Received: by 2002:a05:701b:4559:20b0:151:2e62:fe6d with SMTP id a92af1059eb24-1a6ce4eaea4mr8107048c88.22.1793291939202;
        Thu, 29 Oct 2026 09:38:59 -0700 (PDT)
Received: from localhost ([149.28.89.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1abe9d7548fsm192739c88.13.2026.10.29.09.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:38:58 -0700 (PDT)
Date: Fri, 30 Oct 2026 00:38:39 +0800
From: Chang Yu <marcus.yu.56@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Shi Hao <i.shihao.999@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <auN2jwQVr-GSnZvF@zephyrus-g14.localdomain>
References: <20261029074851.216029-1-marcus.yu.56@gmail.com>
 <20261029074851.216029-3-marcus.yu.56@gmail.com>
 <533bca43-8de5-4295-b226-5ea3742871de@gmail.com>
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
In-Reply-To: <533bca43-8de5-4295-b226-5ea3742871de@gmail.com>

On Thu, Oct 29, 2026 at 12:20:24PM +0100, Jose A. Perez de Azpillaga wrote:
> On 10/29/26 8:48 AM, Chang Yu wrote:
> > Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> > 
> > The AS7343 is a 14-channel spectral sensor featuring 11 visible
> > channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> > flicker detection channel.
> > 
> > The driver exposes 12 spectral channels (11 visible light and 1
> > near-infrared) via sysfs. Runtime PM is implemented to stop
> > measurements and enter SLEEP state when the device is suspended
> > or torn down.
> > 
> > Future patches will add configurable gain and integration time,
> > interrupt support, buffered reads, VIS channel, and flicker
> > detection.
> > 
> > Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> > Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> 
> 
> [snip]
> 
> > +		/* Check for digital saturation. */
> > +		if (status & AS7343_ASTATUS_ASAT_STATUS) {
> > +			/*
> > +			 * Per the datasheet, ASTATUS is self-clearing: writing
> > +			 * the value back clears the entire register.
> > +			 */
> > +			ret = regmap_write(map, AS7343_ASTATUS_REG, status);
> 
> 
> isn't that the STATUS (0x93) text? the datasheet says ASTATUS is read
> only and ASAT_STATUS clears on access, so the write shouldn't be needed.
> it also covers analog saturation, not only digital
> 
Aw man, how did I not notice that?

> > +			return ret ? ret : -EIO;
> 
> -EIO reads like a bus error. as73211 returns -EOVERFLOW for this,
> wouldn't that fit better?

Sounds good to me. Jonathan, if v7 goes in, can you replace this if
block with:

		/* Check for saturation. */
		if (status & AS7343_ASTATUS_ASAT_STATUS)
			return -EOVERFLOW;

I've tested the change on hardware and everything works fine. Or do you
prefer me sending over a v8 instead?

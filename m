Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368014;
	b=pHZhZyxEx+6cnYVBWF9vSe6TRTdcKezexxdam1t0hPRL9StYZwldoC2OSFUDoJhAK+1H
	 BQUAiGz+cM8I/Dsgj3y3qvGXWB+2NyH5DjmEx1qxL/9yoK/P79vq6JyLPWaRhw+lO0AOa
	 Y7FEZhQDT8DBwZhSkAraJEU8liFYhKXC3kSvGNF6MWrrfWiRKdjxngZmAdwATNm0DYq/o
	 oPDpdldnliKGSy+9oaG9Zdw9GDq+GdYaockkju8baZXdJcx27aH1ZHT7qIoZ5DE+Bzhhm
	 8uR8ICgqpbVZe6Qkg2uGl1x6VAcQPBxjhKRZ9sLsWT5nzQ5TAN6jlDV1oito9jIQBLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jpSzV26D6Rjz/NJkyTxMWgMImq37uaP+9bbwc82yg1k=;
	b=ngif7LhPL+CvmRxg8eN2jFXuwLDMb4JcUyJEJg9JvSxdMKZ4JBoQ/gvcQoiWefRe15Q+
	 yWfvWr+uDRFl47RMV1kUm33bglXULHwpc5YEptCi+VssmNFeLbyDLc2L+HX0arjlkzOrg
	 uQKKDUCpVwDh6hVjWq4A+KaQ/6XNOKtdTFwT6nSwgHrFSKNaS7635YGDcxG6x+TWwpzvf
	 8+ZuEngc7xOjNGJh6Z4nktrRzswwvFcl9FvMVcjPifXI7sJgDQf1eaWfQJVP8GHXUA3P8
	 ZtnIlbPkxU5zaE5oaAdfoPfqZz67YfchQktjAFLe8aPEcknlPOoUsvQplF5X8ySwNvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEMVM9yt;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21787606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21787606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEMVM9yt
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so406633b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368013; x=1793972813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jpSzV26D6Rjz/NJkyTxMWgMImq37uaP+9bbwc82yg1k=;
        b=tEMVM9ytv4rWMJK8XQ+62+lBj1mX8zgGbbJCTo/Jk65iCKRvUVZnxa5aTEBTP6vDjW
         N2FpYrTBUV5Kg/wCqrS6mBJ1EL35JYfAToBL9Ipo/38Sve8mWYXWd8v2180GOzoRZDmf
         JVwsUF4OXmYd752CdtLReIlE4YOexd6EfptJSBQjg//ILWR7agYdbUQLskQAIslDRwcE
         RwWt3uJOG/rjlh4zAjAOFHLFk5FRVmRa5Y1rNX9CqIhXBrpyQ3+JExhEU2p62XmBg5A1
         tjpzaYDnZWZj/B6yjWrzO4uVQjPnYSWK7lSDrCFazUDUKcc2DHIP+FFvAhSU+zkUBAzf
         XHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368013; x=1793972813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpSzV26D6Rjz/NJkyTxMWgMImq37uaP+9bbwc82yg1k=;
        b=eavrlL3rWSHYGgSPeJ9df983li2mSGGGi/axyhwfc/Kq5WlJRb5lxa8dlyA0q6OIqj
         VJpxssvrB1LurBmacHRxqJwrkUkbp9kf4M0FM9x0giN4FmQ0/SGufky+Q9gT0Kv69FP0
         Q3Gz47hMzDmXYDQ0yB1z3bcIHDsoHM7lM9GCBFmG7TUuDmtUZ4dzQO+4VKd/AVqDe6j5
         J5V0691Ppyq9ibHFFDXQKrDON7J8VAlBY0SB3P9uWGpZ25NJHBKV52qJgHbKhLvkjTFs
         8BwkaXwR+SOxbhOxRE07W7I3gdZUvKXrrxd/y/T9jcXX7TKf2sK6K8h+H5yUHMyl43nh
         jLCA==
X-Forwarded-Encrypted: i=1; AKwUvByQtu0iS9zmoOuXAXGRvZsMf0KHBS0oVQguhfYUt2haK4RXn2jPNT/ahB4OfADitTPspOwAATP56pbYUA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTOgRiItCm7cdUQAVNlSqkf0pwzAfCKfW+BxLC+aswH4w0CLTd
	RwDdNDT0a7JKxq65cD8JyMzJDHWwUf5hjU2dsnwc9CH+VXjUiY36NdBz
X-Gm-Gg: AYBFou1NXUaZXglpqSAADpCFl0GU6m9vvhX2kN2xIecTnZiFBH6lqe0r//nA2NkYOeI
	xtMHcGcgW1wO/TlcDVqI3oiB3OKhwdZR+rxTq9VL1DYpYpLUlkHJMQ7WOc1lIfIybYsMar6f9xf
	9KsiY2XG9Bw1bRIMwz+kZiHomv9gU8pkxH3M91xqjg9mOFLgwdJZhoWnR2ONGUHn+UEwkqZjl24
	ZfbR4ODwBJ5/dJAfOGmAM42hTlZRfqlSmeEEsdDsk3I9LK/M6g5ljQva5D107OmIyk27sRbnN8M
	82KVBf+CxG7BENdbSLPFaAWQ+b5kyw+6AXEFIyAvqJWqBUWBQcZQguKMhUcEX6MgJMapOYzeI9p
	eW0zuC1Qc5R9GDgV6HDxu/1pGfOImzNFy8roXsl6S3u2VULqoj7sLhGa8zeyZgKuR93cYaL9UMN
	G0O8Onr0VbXhdLaPHk42r2aRTMZctzI2pQr5DkOdEWJyM9SV8cYhQYMaezTq00s7x6WovNwXlbJ
	AESjXClCghR40ZHnOhM2k3FfBhypxqqMeEfpM18Sad8pPXIs/t/FZc1P919ANyWNdsjEEcfD/9t
	6RufzNiXax+edCQhktkGL38l6M3+A3YeelGFNufeBTTb+4ScmA==
X-Received: by 2002:a05:6a20:2583:b0:3e5:904c:78d3 with SMTP id adf61e73a8af0-3e928aa2158mr2405789637.69.1793368013382;
        Fri, 30 Oct 2026 06:46:53 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef96e53sm791024b3a.20.2026.10.30.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:46:52 -0700 (PDT)
Date: Fri, 30 Oct 2026 21:46:39 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v4 6/7] gpiolib: cdev: don't report a failed line read as
 an edge
Message-ID: <20261030134639.GA94733@rigel>
References: <20261029-gpiolib-chip-removal-v4-0-aambrozewicz@nvidia.com>
 <20261029-gpiolib-chip-removal-v4-6-aambrozewicz@nvidia.com>
 <20261030111435.GA76958@rigel>
 <20261030123109.1935475-2-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261030123109.1935475-2-aambrozewicz@nvidia.com>

On Fri, Oct 30, 2026 at 02:31:10PM +0200, Adrian Ambrozewicz wrote:
> On Fri, Oct 30, 2026 at 07:14:35PM +0800, Kent Gibson wrote:
> > > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > Fixes: 73e0341992b6 ("gpiolib: cdev: support edge detection for uAPI v2")
> > > Fixes: 2068339a6c35 ("gpiolib: cdev: Add hardware timestamp clock type")
> >
> > How did you determine that?  Those commits are where the associated blocks
> > of code were first added - not where the problem first exhibited.
> 
> From the hot-plug case in the message: a driver's ->get() error has
> reached these checks since each was added. Removal is newer, as you
> say.
> 
> > The failure mode you are addressing was added by
> > commit d83cee3d ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU").
> > Prior to that gpiod_get_raw_value_commit(), and gpiod_get_value_cansleep()
> > and gpiod_get_raw_value_cansleep() that wrap it, wouldn't return the error
> > that you are handling.
> >
> > Could you bisect to confirm?
> 
> Confirmed: with gpio-sim and delayed IRQ threads, a falling edge
> during removal reads as falling on the parent of commit d83cee3d2bb1
> ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
> and as rising on it, 10 of 10 each.
> 
> A test chip whose ->get() returns -EIO gives a rising edge on that
> parent and on gpio/for-current, none with this patch. pcf857x and dln2
> already returned such errors at commit 61f922db7221
> ("gpio: userspace ABI for reading GPIO line events").
> 

Ok, so the driver ->get() itself may return an error if the physical chip
has gone away.  Hadn't considered that path.

Could you update the commit message to better describe that case?

> I would use Fixes: 61f922db7221 for ->get() errors and d83cee3d2bb1
> for removal. Is that OK?

Not sure - I'll defer to Bart on that.

Cheers,
Kent.

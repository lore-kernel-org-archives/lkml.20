Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799519;
	b=S4mB3zKpVuaHD2+2uXvNU4SZ8OMVkuurlhxyqAj0fWg2EYqW+CbeOucCitKN58EE4VQ0
	 TyonBaADSZ5PVmawqf14BFAs1SGtKrf3h1UGWWRv4IltIzAi/J510snpBn/IXQ6tqPjit
	 oJkEiukVhnvvTYJBSFd5iYyLkyWuKxdE//m/kz5L84TUfmR4TEa4n+fVxEEKgprBZNmyP
	 Iy8HA5Xn7hBHJNpaBxwar4oqha7MmT21THviRAnF92x/mOuAJ1+9o8od0/ovIOjCKVE0r
	 yayrnw4yX5FnIubHO9E82uD+J7qmzakrrY6QO6b/05vesYtlr7gEkWhzKK5BDGKnvpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/ACB8f2xH1rEkjmG+UvGKZpwz98xJh2FSOOsD44xzng=;
	b=t98jXdGdtML4V+NfNRe871z4W3GHoldtJSfvLyBhRAmqykq8WjNCuH/SOXpgmSjtpEUU
	 D8CjmY4ufL03wgLebWP8waWJOzW4T4S4rtOJd5PykQ6Tu5TwbzWB0moVrpO/zrsQ2lnAc
	 YCbzT5dDMgK2b+pO4V6DSFRPsdd1NsxhljsgweFplWwbWdI8kZEipWtZgmLp63eu/sAmT
	 wLEJl7smEEKnLyoCR3rSaCRbR4BSyPI7OJfwd0uuFmH+1Evto03h8PFrllVwY7b2Mt3MK
	 StTpAoGxSd79P/M3v5T76V6GBH6+dkRKtsKCC52SsXEOoBkZSeVhgNRhY0oasUTy/Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fhMbzwx4;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0E606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C0E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fhMbzwx4
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso578926f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793799517; x=1794404317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ACB8f2xH1rEkjmG+UvGKZpwz98xJh2FSOOsD44xzng=;
        b=fhMbzwx4Iq3YFHIOVMV2AgcTVSX5bUIm88mP+/GXafUHINhjR0DYO6dU7UajUYaLNv
         622SV3vWe2gVwtnM/S4TyrixZynQTJd990ccLsFi+iKL5m3KUuTfnetJpBvFVrgDR9//
         QZ8wE7FXI45OO2kd1I22aQgTNsNCarR3pgZmoYbY7z2ICyVXmK9V4QvTmytgxfNZLusn
         kjD34hr6y1GrE8O3mCCvKyVzFHNqiCC4FJqjYk4RvqAB/s6K/KgJoYdL7jpZW5+d95Ha
         iwx2i7fpT/3Twvz7KWPXs3ZVe5oFYcZg6xsyEcgvCz4H4S2N2JkotapGLoTOHmYFUw3x
         6NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799517; x=1794404317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ACB8f2xH1rEkjmG+UvGKZpwz98xJh2FSOOsD44xzng=;
        b=vXNOSqAEMfQ6fVyirspv9uLiAzf77m+WkpowewiVl6V8Ayuys9YpDqAHEqKqD/Ladr
         SciSGYniJj0/gU0mCsvm7UN2DZlBltqqtSZkYVQWX8Ta8JpKRV2eJd9XzzNGAvblJeX7
         YuX8HdYERWi+6bjX0bgr2PvCF3AJlqFv3GrMXmT+KqJFpDkZV1Krj1zZuVreG0/PKuL2
         N0jfC6zKepTGO6jrSJuESRAeLyQWymoctOuNkhKYU50dCFMiFIZZapQR3ppdV7rTtgqM
         JIb0hTvAddZnBNmtDobvZXn92XTPwbNvCLT0j8ds6Tw+cDnWP+rgadj/Hhp7RXq7ts3W
         IKiA==
X-Forwarded-Encrypted: i=1; AKwUvByOhilBK0HB16rQ/CZmlgwjV7GB4TreNzlzMkcf+WcN8z6At1NmC9xEaj5m0X19tXa6cYz4TsyWl7H0n10=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DRkSI/6k5Sw9hUJjHq4YyrULlOxqGbvaLRsUgUKAX5vbwtcjS
	6CFQ6evTkf24MPbkZTK0vqJS44RcACC6dcx9ST0EXzzQAcGsWnXB3sQwHBXPWsTiL0o=
X-Gm-Gg: AYBFou3BmePiG0PqWqu/IOJH9LAwtjgUACDyeqzg+39SviY4gbdeqYsV/2U0HNYNkXp
	BSIzv3ZZHkRKbgrb6ID+tpZUCEG26NjxZzK1SYBdhNdSdSB/ZfIPTEx+gJevlSWAC7m4kPCCXPK
	MK/MRGfU7pAMtfrlEXag4jftml6AF56EQMD99G/fX4TGNhtNUzoml/hYspXWXb/V2vYbRU2mu7c
	ocyXsOhAWXNOsZ9JrnCqGrIQ3a1UknvgV6TYW+ZXePuX9xvHJ4a6YLzaYMEIi3jcUDpa6R9HxPT
	PZHW4wweqKyKBUwrkNjRO3aUFjdd1TpKJqXLE/uVhI1EMBsIpdxUc/F4R8d2GjJyZ110AdzbRSK
	u1lipb0+d/0it0AsZ6WgsXevtXOoku6LKJwgf9ivhkHmzGLvYBvAtyeeV1HuXOj2IBt85MHXd1C
	qINfdq+X9sZGx9nc/KL6W7KpRTAB3RdoteRX8l2d+Uyz5OVbHKVZnIpMfEgqC/zareI91jU5vNm
	hN49yMezdS6fnUNqvjpOPUKD4GSoZ2MKt5//VQVD/ZFQf67d8PeNDHO1xGHivjaqJR8y9z50Psv
	EbxxfdgRoWKrGUy/U5p01SdZ/BtxWKBN4rDbAX7loqpGa9RQ
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-48e6e501911mr37072969f8f.43.1793799516428;
        Wed, 04 Nov 2026 05:38:36 -0800 (PST)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm3985293f8f.41.2026.11.04.05.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:38:35 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 4 Nov 2026 14:42:29 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Gary Guo <gary@garyguo.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 0/4] hwmon: Add fan tachometer support for Raspberry
 Pi RP1
Message-ID: <aus2Ra_sLySMZU1i@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
 <auBzvB8TsvIK8Hik@apocalypse>
 <53a4b4bb-271c-4d2d-a9e4-cec4e0ce214b@roeck-us.net>
 <DMFPE71J8205.3FZKD5BKW3U7C@garyguo.net>
 <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>
 <auIotAwnOWKNApjp@apocalypse>
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
In-Reply-To: <auIotAwnOWKNApjp@apocalypse>

Hi,

On 17:54 Wed 28 Oct     , Andrea della Porta wrote:
> On 09:13 Tue 27 Oct     , Guenter Roeck wrote:
> > On Tue, Oct 27, 2026 at 10:51:15PM +0800, Gary Guo wrote:
> > > On Tue Oct 27, 2026 at 9:48 PM CST, Guenter Roeck wrote:
> > > > On Tue, Oct 27, 2026 at 10:49:48AM +0100, Andrea della Porta wrote:
> > > >> Hi Guenter,
> > > >> 
> > > >> Yes, I also proposed that in the cover letter because auxbus seems also a viable
> > > >> solution.
> > > >> 
> > > >> The current implementation is a consequence to the discussion about the companion
> > > >> PWM driver, from here (and the revisions that followed):
> > > >> 
> > > >> https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/
> > > >> 
> > > >> To give a short and hopefully coherent view of the decisions, here's a breakdown:
> > > >> 
> > > >> - first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver
> > > >> 
> > > >> - V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
> > > >>   dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
> > > >>   I moved from readl/writel to regmap + syscon.
> > > >> 
> > > >> - V8: Gary proposed to export a function to read the fan RPM as a viable
> > > >>   solution. As a result, the regmap/syscon was dropped as it was no longer needed
> > > >>   and the function has been exported from the PWM driver
> > > >> 
> > > >> - new patchset for fan driver: the now independent hwmon moodle just call the
> > > >>   exported function from thw PWM driver.
> > > >> 
> > > >> If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
> > > >> all aligned, as this would also require refactoring the PWM driver.
> > > >> 
> > > >
> > > > Let's say it that way: If you don't want to implement the auxiliary driver,
> > > > and you insist using the exported function, I would prefer for you to go back
> > > > to the first solution. The one thing I really dislike is conceptually broken
> > > > code, and I consider the current approach broken. Your call, but the one thing
> > > > I won't accept is the code with the exported function.
> > > 
> > > I agree on the auxiliary driver part. However, I don't think EXPORT_SYMBOL_NS is
> > > an issue, and regmap is not the right fit here:
> > > 
> > > - Previous version of the PWM1 patch series publish regmap using
> > >   of_syscon_register_regmap, but this cannot be undone -- which needs to happen
> > >   on PWM device unbind (the RP1 PWM device is itself platform device, but RP1
> > >   chip itself is PCIe device which must be removable).
> > > 
> > > - The tachometer register is not its own separate register, but rather (re)using
> > >   the phase control register. The phase control is not implemented in the RP1
> > >   PWM driver on the list yet, so this is currently a simple register read -- I
> > >   can see that RP1 PWM driver need to take special care to about the tachometer
> > >   reading if the phase control is implemented.
> > > 
> > >   For the two reasons above, I think the way that tachometer is read should
> > >   really be an implementation detail of the PWM driver and not for the hwmon
> > >   driver to worry about, so I suggested using EXPORT_SYMBOL_NS.
> > > 
> > > - EXPORT_SYMBOL_NS is the documented way for exposing functionality from parent
> > >   device to auxiliary drivers: https://docs.kernel.org/driver-api/auxiliary_bus.html
> > > 
> > 
> > Let's agree to disagree, and keep the code in the pwm subsystem.
> 
> And auxiliary bus it will be. I propose the following:
> 
> - drivers/pwm/pwm-rp1.c: create an auxiliary device for the fan. The function to read
>   the RPM will not be exported, but a function pointer will be passed through the
>   private data to the fan driver. No need for regmap. To be taken by Uwe.
> 
> - drivers/hwmon/rp1-hwmon.c: The auxiliary driver is probed against the device registered
>   by the pwm driver. No imported function. To be taken by Guenter.
> 
> In this way, we decouple the two drivers and we leverage the auxiliary bus paradigm.
> Also, no DT node needed for the fan.
> 
> Do we all agree on this approach?

A gentle reminder about this inquiry. Before refactoring both the PWM and the fan
driver I'd like to be sure that the proposed approach is at least acceptable.

Many thanks,
Andrea


> 
> Thanks,
> Andrea
> 
> > 
> > Thanks,
> > Guenter

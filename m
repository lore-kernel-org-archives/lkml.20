Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206232;
	b=1b8G5incD6ROC9YhKkEivc5LNgd4JT0cLN+qKtoXGE5Cgw/rSP/Q5QZRTDFgqzQk9qGN
	 CTvIN/NZJlZrhHt8AQ6o3JDJYxecnsUmLt71Gx+RCWAlbIp4PiKLfnEF+B8zrmddNZKjN
	 pRKUCsLNvqPgvNTITaia6AtCTRi2dE6h+x5mjOamDPffQgxgw6uCNPeLURyoyS/J6WYau
	 SUctV6eBLBIU4u2qVrcSEJlxqeX/DerdTvBrDftZ4OcC3WldfBKlf5IJ8bvAytYrIXC4C
	 jUqXT9p//bXnYUKhtkCXuRpLPhmOZws75jaBTXmwkQz5F1e9v8npicaftp2ZpSm0wGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rmtUDKQ0yoNlGhv53ScFwXXOWxSmXa4pTOke6+QnPrc=;
	b=v8chktth6Oiwlg314ap2kPb74CXJpuhdZp7mR1a+QmCrH7HzTqcV5CFH3RiDFlYoGeAB
	 lqFgjynIjQu0VII6kr0017rqkMQH9hibgClArpudqWbL+q6+BoJlVqVRGPgBB/Of2X8Rm
	 Uob4Nd8w9cE9EA7cs9XfMFJBPqY08ZvybyUrew64DjSLfpf9uGcN6SkWPMmhHTFOXIOwc
	 T2ijj9oPeIQpICai3/6zLhC6A815yJDk6d3YLld9dcB4jsP8nF14RGSIdsQxM9qZSMLh1
	 9RxRb+O6OHjK1TZqGDMvwP06BQAK0y0aiTlMznpJ7ExEE7cT+6q9tOvdnvnTtm96TfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D371606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D371606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so11903435e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793206220; x=1793811020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmtUDKQ0yoNlGhv53ScFwXXOWxSmXa4pTOke6+QnPrc=;
        b=gXgEqKbhWXg0LLz9FvWn6V2M5RTpYqWlHjLH0NP+RzhxzISPz7BuGBUwie7l/s0pC0
         dOwOBNbVtUx+iHm3MIQFrm0Q6B8YArSlQrgE2RjwCmAeHjH/rbC2Ago7GMPFouoQ6/Ki
         l5VpdHIlZEAmEJd/hd6iBVSFe7YFraVN9uwKzuPIZY0xxhlmn5iKPXeboEDishSTZ1NR
         kxAs+/bXVi8UcA9VkCQboWB3250MXxYFPGAybyrY1stsxVzdDhdKlq4ix1NqVrhMkKw1
         +0/Ip1FdOvXwVyjfEdFth/TNwiS57iprsQbLE7kk7Ljjlnd8LVfmm4UX1+3z/GKZWwxU
         GfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206220; x=1793811020;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmtUDKQ0yoNlGhv53ScFwXXOWxSmXa4pTOke6+QnPrc=;
        b=ge4BtHAmIJ7ZyT8y9so+lcz4/75gsgXjE1JVha3coJsSG7jUmvWLl/Zavcv5Shvtpv
         0H77JuzW9UAnFb9UOkj5et1SKvLWif0CPSsc6m1m6Rn5gR2WY2LvRGYoy0BTXow8YNfm
         hxmEZaXrSOiLqhW7ITpsmbyCgXWhip7IEVBr/uSXjLvkX6Kvecgg76H3m/iRgTnIfqDi
         Z4u7FSPXrBqBupErLYMDI3alFUlOPZQJkQkOTyFZ5RhRY1HpY+SeJKMvtCfsu8i3wk1k
         uSIO6gcIXLYibkXcR08GMSD47SilaO70WtzhPiJdY/71BjffSCklVrKIZ4hijlO6gXYR
         G1sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUb7Qwq6NJ+4WxhO4OUXKl/zeI95XrwPuTI09jnNDQ/qmIlHqaHf5o67Tx8MbhS5wcIHgtAbVmxkNwohg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpEqYXq4itlcLUpO+8eh0Bk93DMX7G3FhcFMzoG5qwIbzWo6Wx
	MlUWEFdhrPqaMvGujS6P/yHeJ5ArH69Kc2SEJaHgyXq3oaJlV3lTWo+4+sJLWUYjtVg=
X-Gm-Gg: AYBFou2i7rrIn7ReXOIuyCzs/BSSesWX6Vsr3xFoXzwXRWK1tJb3EFiLYffXBPm5F+y
	j6qplU/Z1EVmkH+/ePnpLgTDgv1mRO//5jY0tHhm23mKfPnGrfIHSlElmpkt7RIXdKUdQy3Q/wS
	LYnb0dqNixFZsVFCP7mz1AePIgCVDy1CeIasmmW5vWR0z5s5RdhzQaGujulQlUkS+CdN10wzzIF
	Ev3XUOqLbh9bMRxHtevFNkfnOXIEa48n/HmdDpdP0NoCo7VqCudsNwkN/Ng0aiHLLe8y/16vjQs
	r5k5SQGy65HtvHcF5ezVCCdLn/UBRxc3/KWeVc4I5uTOKrohzed7hCQ0yjYrGa7GCqvSFeEYRWF
	w6hYpxn8P4x5JVrSvl8/bhva8uk3002rbVRssYouM77Z40ELodFncGCAf83yGlYpaVnD5+bsaDZ
	PRNGip7/lPuem6zA7d49R8CHgVKFe9yhbY2TMVMuoAbU74IYSpv+0C//5SDYo5RMcscuyB7r8xp
	5R67iMfEre/hzqNc6D0XZ8sfAyA1CqGA4sDn9mOFOkRS25KhK27avGwSYvZ11g0kIe0FPIWQyVq
	YxtJl4QsQDu1b9mYyEAG9Md76Pf9
X-Received: by 2002:a05:600c:1986:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4a9643d5154mr61518125e9.4.1793206219964;
        Wed, 28 Oct 2026 09:50:19 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e4be4b2sm38091265e9.2.2026.10.28.09.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:19 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 28 Oct 2026 17:54:12 +0100
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gary Guo <gary@garyguo.net>, Andrea della Porta <andrea.porta@suse.com>,
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
Message-ID: <auIotAwnOWKNApjp@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
 <auBzvB8TsvIK8Hik@apocalypse>
 <53a4b4bb-271c-4d2d-a9e4-cec4e0ce214b@roeck-us.net>
 <DMFPE71J8205.3FZKD5BKW3U7C@garyguo.net>
 <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>
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
In-Reply-To: <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>

On 09:13 Tue 27 Oct     , Guenter Roeck wrote:
> On Tue, Oct 27, 2026 at 10:51:15PM +0800, Gary Guo wrote:
> > On Tue Oct 27, 2026 at 9:48 PM CST, Guenter Roeck wrote:
> > > On Tue, Oct 27, 2026 at 10:49:48AM +0100, Andrea della Porta wrote:
> > >> Hi Guenter,
> > >> 
> > >> Yes, I also proposed that in the cover letter because auxbus seems also a viable
> > >> solution.
> > >> 
> > >> The current implementation is a consequence to the discussion about the companion
> > >> PWM driver, from here (and the revisions that followed):
> > >> 
> > >> https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/
> > >> 
> > >> To give a short and hopefully coherent view of the decisions, here's a breakdown:
> > >> 
> > >> - first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver
> > >> 
> > >> - V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
> > >>   dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
> > >>   I moved from readl/writel to regmap + syscon.
> > >> 
> > >> - V8: Gary proposed to export a function to read the fan RPM as a viable
> > >>   solution. As a result, the regmap/syscon was dropped as it was no longer needed
> > >>   and the function has been exported from the PWM driver
> > >> 
> > >> - new patchset for fan driver: the now independent hwmon moodle just call the
> > >>   exported function from thw PWM driver.
> > >> 
> > >> If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
> > >> all aligned, as this would also require refactoring the PWM driver.
> > >> 
> > >
> > > Let's say it that way: If you don't want to implement the auxiliary driver,
> > > and you insist using the exported function, I would prefer for you to go back
> > > to the first solution. The one thing I really dislike is conceptually broken
> > > code, and I consider the current approach broken. Your call, but the one thing
> > > I won't accept is the code with the exported function.
> > 
> > I agree on the auxiliary driver part. However, I don't think EXPORT_SYMBOL_NS is
> > an issue, and regmap is not the right fit here:
> > 
> > - Previous version of the PWM1 patch series publish regmap using
> >   of_syscon_register_regmap, but this cannot be undone -- which needs to happen
> >   on PWM device unbind (the RP1 PWM device is itself platform device, but RP1
> >   chip itself is PCIe device which must be removable).
> > 
> > - The tachometer register is not its own separate register, but rather (re)using
> >   the phase control register. The phase control is not implemented in the RP1
> >   PWM driver on the list yet, so this is currently a simple register read -- I
> >   can see that RP1 PWM driver need to take special care to about the tachometer
> >   reading if the phase control is implemented.
> > 
> >   For the two reasons above, I think the way that tachometer is read should
> >   really be an implementation detail of the PWM driver and not for the hwmon
> >   driver to worry about, so I suggested using EXPORT_SYMBOL_NS.
> > 
> > - EXPORT_SYMBOL_NS is the documented way for exposing functionality from parent
> >   device to auxiliary drivers: https://docs.kernel.org/driver-api/auxiliary_bus.html
> > 
> 
> Let's agree to disagree, and keep the code in the pwm subsystem.

And auxiliary bus it will be. I propose the following:

- drivers/pwm/pwm-rp1.c: create an auxiliary device for the fan. The function to read
  the RPM will not be exported, but a function pointer will be passed through the
  private data to the fan driver. No need for regmap. To be taken by Uwe.

- drivers/hwmon/rp1-hwmon.c: The auxiliary driver is probed against the device registered
  by the pwm driver. No imported function. To be taken by Guenter.

In this way, we decouple the two drivers and we leverage the auxiliary bus paradigm.
Also, no DT node needed for the fan.

Do we all agree on this approach?

Thanks,
Andrea

> 
> Thanks,
> Guenter

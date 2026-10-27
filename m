Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094358;
	b=fbMheuoWm/26dNp7zZ5hAazkC0pqmGc7K5ZkyFoxWzXD4vcFJC+HerHo9DquYqEY4OOQ
	 de77TA/vmVqJJHkdkxwU2wahbHdh47BkaMXJ0E72zQWmlUC9QmW78FY4sXphmelEv5cuJ
	 4/6dL5hKlVRBR/v7uelj7YCZJxnZON59Z7V9chPT0OhHRE9/IHaynP0gr+bQjC/w7PjAA
	 7lp56GPjTb/BvXxSEKev4tv8tP8rZ3vK8aifcsvKy047sjKPRCaFFsxkhniy3gbT8yNtI
	 6YVm9X9a+yGax5rUkqFyyrTKBhvi81L609Yb/bZzIpbDx7A5hBck9yT3KNxbDgJ1Zbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=kxDEiSmJOiwfSYua1Zz9+AGsc9tKlOqwY2WHmMR/V1I=;
	b=hiNeYYcwEwqThJ4PLpN08Wvfc21KVFNxwy0r8sMY8qtifkzK3DzikY9ul9x3m6Y35k41
	 Jtkm2j2sOA6PMIxQ1UWliyTD18FmJx3neGTozjnbLHLDSq3EiQCC4qoRF3hlFJdsaPu1n
	 qjOu+iSdAO4ApNRKms2D/1vFUb4nUJ2lvqohI6TF9IRXKRB8JCAJpepSK4XFM8UOTFJTP
	 c0yINA0TeiWi98WDMxBve8Yf88TYQSntpxY8cfbCRyVIoJt9pD2IvT1J4RB6xGXrGH8o1
	 sRGd9YPxrmb8RhMZZI+RJq0Rucxd2ew2iU6KZc7P12UODQz7xPCr/YjbqiQDjHeNzXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=foXTMIMq;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56F8606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56F8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=foXTMIMq
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a215e64962so30758295e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793094356; x=1793699156; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxDEiSmJOiwfSYua1Zz9+AGsc9tKlOqwY2WHmMR/V1I=;
        b=foXTMIMqZgAtLBq9U6Ye5Y5BEyzAFblKZjMqyPIiGxW0GYSUWzFinU/uKs9vprN6Ye
         Hz/ClFy9OizHTRH5VyRnVcxo5LRCHq7k+nDdzYf3BcrgdxoIMjpDLN7sR8P1dfxW8GlM
         Prw4tjEQSlDYcv+4KVQ/R+2qfvyN5r93DDysB+0pt8EoK+BXRwBx5nWWIx4bq3Q7lXB/
         5U0pymYRzO/nQFKCWbevF/E3kqjzK6yxzrphZXdk0iTzLuEZiWNuQhxk3QDJC9HMyEEa
         YBRbtfB4dfeU5rHkUnSMNO4xtvfkAh7JjrjmBtJxPlgn7QIzfkhgXHrwW1f9OrBppYAR
         toyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094356; x=1793699156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kxDEiSmJOiwfSYua1Zz9+AGsc9tKlOqwY2WHmMR/V1I=;
        b=FpnBWash4PdK5edX3iMcuf2t2fZfa6jsightdFLbo36QNf/ro9JLSypYFgUOxIB4HX
         I2do2B4ihIF5HQQ14hApRRoyE3wWM51pM/7CnS6FMkeEsbOEEuI7fQ0Sx20bAXd1svqg
         BGGAE2nap+HW4f2eaWV+AZcLBJljaGenr1dBadHlPhKZ9JybwYecDJ5y6k1UhFa7jB+J
         0R1cEkhifk3SM9xF+s6wWGkw/YjVm+ZhvuEZgVEyI/0v8HO/QsVUtDnPOz0LBs9UBEIa
         Scc2TAOGzzu3RSPx+vhmKUvXjSz2Mz0nwDZMf70z9W9xni1PosJzUjJfsqHBja3Qsdc5
         X/xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgq40OptNDg5waBuB9PeSuK6Sc3Fdn3twGEgRCLcEMRAHW/7gMPLWbTbtLZzVrZa3bV0skNgcnnxc5Rqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8Zj186rv8kcX04ID7+C+nPZKczWPrqtxFwVeu97nI7ya1XDmO
	6P7NJx5vlV4cSdH5Itq9ES9FiixYKVE35CTCYdSrF7oifNjgdUM4yfcnxy5ZWDTf16E=
X-Gm-Gg: AYBFou24BZu3c5aN3/+OiogxDqHD4DXuzbj8r2b6alofBvAdA2lxn5fbLegIMvqBPoI
	c2rwTUSYWB9pxBP6h/hxttVhTKPYOm3IYnLnrLjGyRpaleTM+ic4PauXSz1QZVcK6NiKV7599kg
	DTtLwBTI+HeQRUf3bDp9bcGNGJTnTCrr2tRSpqkp8qrIA8SHScvTBrMZBUUw6u4ObOpmZ/2pjue
	9ionXC2nPm8+d2ZbWIr/HbnamPwU6BgSU27EATrfGLs+fGgBSJyc95zkrcixw+ajKYU+V21rhwK
	GHVN/ErhAbVK1dzTaRuvlJADe7qY6UM2QtFJcYFlr38ybj3Q0obYerVvFDPBAldGXOfDSBviR9o
	xWIS4vyQ7a3wHRHZhRJ+9FlxMPHVHlBbrjl/Z2Z7GiscEF59QE5cAKwt4+tT5plBfEsNcH3ERj5
	ZrBFhIQ8wbm1XFMF/uZCE0fYtfy8YVTgDTdXdOTFjCTezm640/Vn0GBKFjwhqfKZGzZkECK6BHv
	9fTOMm3iLkJy8OGi6uGQL+ZrRR9MxOgeN/pwRTp6+SSYMrPpke2FJg=
X-Received: by 2002:a05:600c:4f0f:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a35acba87fmr202982885e9.30.1793094356233;
        Tue, 27 Oct 2026 02:45:56 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d9280sm251609365e9.13.2026.10.27.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:45:55 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 27 Oct 2026 10:49:48 +0100
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
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
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 0/4] hwmon: Add fan tachometer support for Raspberry
 Pi RP1
Message-ID: <auBzvB8TsvIK8Hik@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>

Hi Guenter,

On 09:24 Mon 26 Oct     , Guenter Roeck wrote:
> On 10/23/26 03:15, Andrea della Porta wrote:
> > Hi,
> > 
> > This patch series adds fan tachometer / RPM monitoring support for the
> > Raspberry Pi RP1 southbridge found on the Raspberry Pi 5.
> > Please note that the patchset in [1] is a prerequisite for this one.
> > 
> > On the Raspberry Pi RP1, the active cooling fan speed is controlled via
> > the RP1 PWM controller. In addition to generating PWM signals, the RP1
> > monitors fan tachometer pulses. The pulse measurement and RPM calculation
> > are performed autonomously by the RP1's onboard Cortex-M microcontroller
> > core, which periodically writes the computed RPM value directly into
> > dedicated MMIO registers located within the RP1 PWM hardware block.
> > 
> > During earlier discussions, Uwe Kleine-König explicitly indicated a
> > preference to keep the core PWM controller driver (drivers/pwm/pwm-rp1.c)
> > focused strictly on PWM duties, rather than bloating it by registering an
> > hwmon device directly from within the PWM driver (see [2]).
> > 
> > Because the Linux PWM subsystem currently lacks a generic framework or
> > consumer API for reporting hardware-calculated tachometer readings, this
> > series implements a standalone hwmon driver (rp1-fan) using the following
> > structure:
> > 
> > -  The PWM driver exposes and exports rp1_pwm_read_tachometer() within a
> >     dedicated symbol namespace ('RP1_PWM') to read the RPM value from
> >     the MMIO block.
> > -  A companion DT binding (raspberrypi,rp1-fan.yaml) introduces a vendor
> >     property, 'raspberrypi,pwm-tachometer', to link the fan node to the
> >     PWM controller node without overloading or abusing the standard 'pwms'
> >     property.
> > -  The rp1-fan hwmon driver parses this phandle, establishes a device link
> >     for proper runtime and unbind dependency management, and registers the
> >     standard hwmon 'fan1_input' sysfs attribute.
> > 
> > An alternative architectural approach to the DT phandle + exported helper
> > method would be to model the tachometer as a child device using the
> > auxiliary bus framework (drivers/base/auxiliary.c). In that model, the RP1
> > PWM driver would instantiate an auxiliary device for the tachometer, and
> > the hwmon driver would bind to that auxiliary bus device without requiring
> > a separate DT node.
> > 
> > However, adopting the auxiliary bus would require a more significant
> > rework and refactoring of the existing RP1 PWM driver.
> > 
> > I'd appreciate any feedback on whether the current companion driver with
> > a dedicated DT property is acceptable, or if an auxiliary bus-based
> > refactoring of the PWM driver is the preferred upstream path.
> > 
> > Patch Breakdown
> > ---------------
> > Patch 1: pwm: rp1: Export helper to read fan tachometer RPM
> > Patch 2: dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
> > Patch 3: hwmon: Add driver for Raspberry Pi RP1 fan tachometer
> 
> This seems conceptually wrong.
> 
> Have you considered implementing the hwmon driver as auxiliary driver
> and accessing the register in question through regmap ?

Yes, I also proposed that in the cover letter because auxbus seems also a viable
solution.

The current implementation is a consequence to the discussion about the companion
PWM driver, from here (and the revisions that followed):

https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/

To give a short and hopefully coherent view of the decisions, here's a breakdown:

- first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver

- V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
  dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
  I moved from readl/writel to regmap + syscon.

- V8: Gary proposed to export a function to read the fan RPM as a viable
  solution. As a result, the regmap/syscon was dropped as it was no longer needed
  and the function has been exported from the PWM driver

- new patchset for fan driver: the now independent hwmon moodle just call the
  exported function from thw PWM driver.

If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
all aligned, as this would also require refactoring the PWM driver.

> 
>  > Patch 4: arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node
> > 
> > Thanks,
> > Andrea
> > 
> > 
> > LINKS:
> > [1] - https://lore.kernel.org/all/cover.1790686331.git.andrea.porta@suse.com/
> > [2] - https://lore.kernel.org/all/adLTwOTbkJ0VQXy6@monoceros/
> > 
> > Andrea della Porta (4):
> >    pwm: rp1: Export helper to read fan tachometer RPM
> >    dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
> >    hwmon: Add driver for Raspberry Pi RP1 fan tachometer
> >    arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node
> > 
> >   .../bindings/hwmon/raspberrypi,rp1-fan.yaml   |  39 +++++
> >   Documentation/hwmon/index.rst                 |   1 +
> >   Documentation/hwmon/rp1-fan.rst               |  41 ++++++
> >   MAINTAINERS                                   |   1 +
> >   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |   5 +
> >   drivers/hwmon/Kconfig                         |  11 ++
> >   drivers/hwmon/Makefile                        |   1 +
> >   drivers/hwmon/rp1-hwmon.c                     | 136 ++++++++++++++++++
> >   drivers/pwm/pwm-rp1.c                         |  27 ++++
> 
> Either case, there is no such driver in mainline or linux-next.

As stated in the cover letter, the pwm driver comes from the prerequisite in [1].

Many thanks,
Andrea

> 
> Guenter
> 
> >   include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  10 ++
> >   10 files changed, 272 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml
> >   create mode 100644 Documentation/hwmon/rp1-fan.rst
> >   create mode 100644 drivers/hwmon/rp1-hwmon.c
> >   create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h
> > 
> 

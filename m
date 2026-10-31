Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456158;
	b=gKrqimv/Uapcua5S/4ffPsn5nM2DWM3CbhiNRnkGsdb6XRfQ0RzcBEih2xVRYD8Z4Qa9
	 w9pf8ZHOa17cfXc+2Lp6JugXj2paQ9AqdmNYBnFLpmsJowjrvskgLiYz0MMf6DsZTk1Bb
	 NtiCIKGUt+S8qPZv0k/iD3zexPrVsfMWpx14DvqU9nqSC+SS4JFNFcl0cHhiwxiWdmtqj
	 +aCab1pxysiefP7vflhxZEbio8VM70F09nSnQJt6GWVSaugWrkT8HxA5T2OP7X+ZH6O5R
	 qkiXdtimQAzvXtqCKdYAbij08JjBiDXW5BWdb8xVJsiSM1NQlg8O3Av2EEM/J1WU1sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wnbq5enmeXXMtrxXOCknlMCahlJdLBMQr0NRDI8YZbI=;
	b=NJBlhU1C0V3ZI843arPHI+T9dH89CMWPch4jGMdsZXJPY2I1AkGb5idYtMJ9nUi5sB7E
	 xtW0zsgRiDBB1n7LC3ugkulD8uhl9PEB1uFHBga0FRmvkE+z++8LoSmdrhA7cLTCmSYef
	 hWCu1om6uqi6MPi4nKNdPkbzVstgsXCqtk1L7QJ8ocQShUo2SpoOcjBfh5PuMqmXyBSZP
	 h0NskavFhStRj7Kwc2+bGMGhqRYbQ5S8VAaydEP7lkoGBKe/AbEzWavgEkRlqbPsyKsIy
	 lOVpAmJXJA3y6PQtSibgN4ykcNbJJakXq5k8wlSiy3KO/oasDpi2arl81c1xZ8zMP0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IK25MfUb;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D77606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D77606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IK25MfUb
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9e53d011eso13433715ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793456157; x=1794060957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wnbq5enmeXXMtrxXOCknlMCahlJdLBMQr0NRDI8YZbI=;
        b=IK25MfUbibJHZUCnSy2S2WtN6BBRl4Wc0Ck8mJ2goevSyMxcRwogr+b0tBucuBqDir
         viXNGP5/fkKG65t/UebwN5ESDx3o9MkaCjiN+I8661dR4ti74jf66KO69msGBzQzfVNh
         Lc+oueTWrXa+fTRTWK7tpTHHo4R+TOQfoIYojkroNPSBvrwchRzlwAGgEJoWrfWm9lkP
         9wna8rK3tDwdZDhgd1beGnrlMF7A4DTG3DubG4jSwjKtJ7DZ3ArGCKIngcvwgJhb2+kO
         AVZcVTl958lPkczzXxQCZpZzfY/+fYk/fwqcjTLKHtzwm/5o/BYPmOAV/slCIuEjvEoF
         sTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456157; x=1794060957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wnbq5enmeXXMtrxXOCknlMCahlJdLBMQr0NRDI8YZbI=;
        b=2vXEXnJnQA68G5EHdlKn0gwVfeSSTJbPV79FBtX8OBoyF/ZFKvb1l4159xkl4TXFm6
         DurImxJRpuGPuAP1fs42wzFcM54/n78jj4xLa/LgO9qQOkm2Mq+CgMLzSR+Wtaa3QNHe
         Z9UAI4ibvYU++mFFJGURwATL7mfgDW5kWyinEIXf8/TeBGAwcHB1shxd3HwpVWV1OdSg
         M1nCwI0bi4Bs4RJcQ8KEuqzVWYGQHhnJLgQSB2iP4L40D1vBUcR5IobynFBNarWNCpvW
         jShc+DK0ZZp0Rqo689hS5uVINpZ1ND1q+Bjfl1G1AepYGWH8euIJ3HIHQ1jyL+KF0KSL
         KlZw==
X-Forwarded-Encrypted: i=1; AKwUvBxdhoPBqdud3Gcp5Eqx3qXhUkvN7BS+wBYuCjdDUQEvqi5h9Ck5MG4a82VzKkL7/YXBIqQSgjirBli/Ma4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJcp3UYf5FbmalOs8CTaUG5+C3fkJOQM7FiqULo5t4KxLKhTM7
	4CUq3CQzhgung3AfKhOeBk7yYPqmCxHsywKjOYQJtdeMhESqxaotBWQi
X-Gm-Gg: AYBFou0TFXJT4uVMW6Wvk4EDMZNd9qWQcET/fMLnOT2IIlKwMsbd7M6fYWVirwP62lu
	vCDvhieb39EVM9jgH1amp4dv4v3tzEGlr4jgbh7Zq9dKMjK6NhQPWhOurPiqyaXMur5qs7aadxT
	DQJZuSJOSJN9Zx81y6VlQDe9MdJQbJziSXaZVnyQSRyPO1ZXqiuYsxWp5b8aOO3+7WyVrssqzoa
	/ZvOu6QrkbjH7Rv47Re7zj+oSz/e6nPYq+WFJVGBHp6pI269csLEUh18T0XJWVzFWVJDnQbXxUQ
	ZA2xbq2pvEeUnP8sMzRBKFZwfEioRuncXoIbYD94A9pICd3o8JKKE8qKi9P2XJwRpqra3cXiSzC
	zoju+XzsKUrQeAqPXIdTtIAEGbAQJaalD40bKSTwJ6j0dw5GFslgRcta/WPz5b/8fAGrrPYd8Kg
	oeFbkO3/AUT1IlcRLQyFKGeTRJWHCsUMCb9phk81C7ipObiMvIQ7J0cMncxyufmHPbvdx0wuFqs
	OSI/4EBoAWBdTRG5CpWhz/9gXwmkai4DCf2wO3SJX3hxm40+OEFdFT3jvMN3ws6VtnXQm1Y4nOt
	HayiZXq25VkQzN1Xf94bs2jUQfDz5qLOh6uj9TCT
X-Received: by 2002:a17:902:f548:b0:2e9:572a:7da7 with SMTP id d9443c01a7336-2eb364f1979mr52661215ad.49.1793456156941;
        Sat, 31 Oct 2026 07:15:56 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb38e9633fsm15743805ad.0.2026.10.31.07.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:15:56 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: broonie@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add support for Everest ES7202 PDM ADC
Date: Sat, 31 Oct 2026 22:15:46 +0800
Message-ID: <20261031141546.153385-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179330018771.62540.301527067818961107.b4-review@b4>
References: <179330018771.62540.301527067818961107.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for your review.

> > Add support for the Everest ES7202, a 2-channel PDM analog-to-digital
> > converter controlled over I2C. The device outputs PDM data to the SoC
> > PDM controller and is configured through registers for supply voltage,
> > analog front-end and per-channel PGA gain.
> 
> This looks pretty good, a few relatively minor issues below but nothing
> major.
> 
> > --- a/sound/soc/codecs/Kconfig
> > +++ b/sound/soc/codecs/Kconfig
> > @@ -1274,6 +1274,16 @@ config SND_SOC_HDMI_CODEC
> >  config SND_SOC_ES7134
> >  	tristate "Everest Semi ES7134 CODEC"
> >  
> > +config SND_SOC_ES7202
> > +	tristate "Everest Semi ES7202 CODEC"
> > +	depends on I2C
> > +	select REGMAP_I2C
> 
> You should also add this to SND_SOC_ALL_CODECS.

Added.

> 
> > --- /dev/null
> > +++ b/sound/soc/codecs/es7202.c
> > @@ -0,0 +1,367 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2020 Everest Semiconductor Co Ltd.,
> > + * Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
> > + */
> 
> Please make the whole comment block C++ so things look more intentional.

Done.

> 
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <sound/pcm.h>
> > +#include <sound/pcm_params.h>
> 
> linux/of.h and sound/pcm_params.h aren't needed I think.
> 
Right, both removed.

> > +static bool es7202_volatile_reg(struct device *dev, unsigned int reg)
> > +{
> > +	/* status and device-id registers are read-only, never cached */
> > +	return reg == ES7202_CHIP_STA ||
> > +	       reg == ES7202_DEV_ID1 ||
> > +	       reg == ES7202_DEV_ID0;
> > +}
> 
> A switch statement would be neater and would probably generate
> equivalent code.  Are you sure that the ID registers are actually
> volatile, that's quite unusual?  If they've volatile the hardware is
> accessed on each read, if you just omit the default then they will be
> cached after the first read.
> 

Thanks for catching this. The ID registers are static and don't need
volatile marking. I'll drop them from es7202_volatile_reg() and use
.writeable_reg to make them read-only, so they are still cached after
the first read but skipped by regcache_sync().

> Also should the rest register be uncached so we don't try to write it
> back out as part of a cache sync by mistake?
> 

Agreed, I missed this. I'll mark ES7202_RESET volatile so it can't be
written back during a cache sync.

> > +static const struct regmap_config es7202_regmap = {
> > +	.reg_bits	= 8,
> > +	.val_bits	= 8,
> > +	.max_register	= ES7202_DEV_ID0,
> > +	.reg_defaults	= es7202_reg_defaults,
> > +	.num_reg_defaults = ARRAY_SIZE(es7202_reg_defaults),
> > +	.volatile_reg	= es7202_volatile_reg,
> > +	.cache_type	= REGCACHE_MAPLE,
> 
> I notice that other Everest devices set use_single_read and
> use_single_write - especially for write we can easily trigger
> multi-register write as part of a regcache sync so if the device lacks
> support it'll create bugs.
> 

Thanks. The other Everest codecs are the only precedent here - the
ES7202 datasheet does not document multi-register (auto-increment)
writes, so I cannot rely on them. I'll set use_single_read and
use_single_write so a regcache sync can never turn into a burst write.

> > +	es7202->supply = devm_regulator_get_optional(dev, "vdd");
> > +	if (IS_ERR(es7202->supply)) {
> 
> Unless the device can operate without power this should be a normal
> regulator_get(), the core will substitude a dummy regulator if it's not
> configurd by the firmware.
> 

Right, VDD supply is required. I'll use devm_regulator_get() instead.

I'll send a v3 with these changes.

> -- 
> Mark Brown <broonie@kernel.org>


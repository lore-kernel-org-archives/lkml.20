Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED2382F0F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725759; cv=none; b=sFvk0pAL5EZlqYkXWFbZ0R2QrKFefRVeG/Y4x6KDMPqLbnJukIHRAfLY8rbhRBDIMN75fR+wWMGqh+GtLmk3wvEO9me4o20D9fDZJOsxJJGXecOY7VA7X06dFWiVfOXZe5BVdVVHERiGdsP5jGjzA5/5xbD3SCWTMnJ21/Ef30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725759; c=relaxed/simple;
	bh=lVWirDgq9jhdWkcO+jSEW4AhtGfzyoSiUVzr4lC+M50=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:Mime-Version:
	 References:In-Reply-To; b=NcAMk7YuoygydLfz88dbAJp5Q50DAiSFEXh8FRshbSZVYXCvct2GxETaVa2hDijf/F7Opu0ZvmK19+hbSLrTLMxaWBZlcYYhoEQZ5g4qpwDFmY7vreE4XXQN2pc/rT4qHGd+8G/FwlxymZx4l/EAsC63pgeOSHdYYaye0bosrAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0zrl+Sl; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0zrl+Sl"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8623b1e7cb2so9506527b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725756; x=1789330556; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukMsWPPljTo6wl4qbug5zblOIdA8wRRZhHKCz6k6Od4=;
        b=M0zrl+Sluksgj4nocGa7aEaH1qOilQHH9T6LgLtTFck+MqnHAk6WR/m4VAq/feO86s
         xbv8F4Aop/0wK6ICM4hfXefm9j0mZve05S+476thzeH/DnmL5868DKkpvAmwf3nbKnP3
         WzNpW2p6Bx3vltIdj3hUUPy4HWsEjLcHeoSeiLpRd+M/F2IDOwpjkZBThfdiSJr0JX/D
         l33AUXM/xSN6AjM/lvVQiw9xnBCEykR54UzhbIjwW1Iuo7hHbHgnF13DElG2sKB1h4ld
         RqQJ+q5yByyYhHKYBr9SuGkD63YJscsLc6MV3yjg9S7Dv9fV16LrUDDaSKkkzVffMoXw
         dvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725756; x=1789330556;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukMsWPPljTo6wl4qbug5zblOIdA8wRRZhHKCz6k6Od4=;
        b=NuysJDdq5i5i2i17tvlgVqkRzBG1DbYlE8EKbGDIBgeNUHPAUOF1fvWY5yJKB4PEwh
         cXB6V/dxy4qDtmKP755mm0//RhSFy2APO7PwZX/oZjDPwHc3vt3hwVVefwsHAbQS9Hon
         TkWozhfjzrBA8GrINGiXa1DHOP0A+7tXGObYWaXDo8seKCRKCvCMgsob+0L7sek02CAG
         WdyULglSiunhmTFV/+/CZIXp4RKqHhFgCe12OAXkDcnsHDiP6MX+OvYvhpeYGjy526ar
         aGCDKiO3du1IIds3UDP2rAIU5s9QXT6H/xtUBd/6WMSzbk9bNPnDZTgWCZMkQAeEjjIa
         JBuw==
X-Forwarded-Encrypted: i=1; AKwUvBzWBuci1FVMRW5RBQK/DhK/VZWiuB+h99Iynhaw6sRM1YGuwTEwJu4/s6VC9b7lgaQVMDpKIXAPkVLaaJA=@vger.kernel.org
X-Gm-Message-State: AFuF++nuCilHQmSHd6aP3zuluXhWcFMiGzqJ19IYJlhzU5M0RmLv/rQ0
	KKzSFo0oOpWO7IXOOX98BYV62DAwtf6c69YPs07B9ezAmYaXwRl+/78a
X-Gm-Gg: AYBFou3ABFKf5iE4QtDNCTYMFEmpBs5EfC1k4nhDvBqI70buzsqQb62b5x1aZ7SS79v
	bLJC6RqUI0F7G/bboLgPJHMtlBVtHgYzBOFsVB4LD0YCFaPkTeHI63IvftFEpoxRgjPmjujYMZ+
	0Pc9gz7KA9CkxBSXUsRLpGSwoqnUIdcuw0EqoHXkgXaK700btpJYR1MJh63wMIQ+GLF1QcEm81t
	o5pT/n9yQ9uVckymw8E12apRiHxmSJD6uJVLiGs6IdmBqcVhGVKNq2HfoRJ4XpRrvU6t4Z2MJGJ
	OmEyrt74v6ppWd4qQEXeULWRKAlL1XyOn+yAO2aoriwhu4nAJ0sMMxLW4Z8ICP4uT+ybYUzsi9r
	kN4odAykoP9MZ8OP0nWkUHfN49JQLGmoqMduZs+ykcM7Uj9K5xqoDiUWGsNIG8BVRFT3XoP0HXK
	8ujL2HecRos7+GaR7gPgGZl3LpGv7Je1sfa09HHDjCoJOa+NgO4Z01Td4yRhzOvrgtfAVgNC/bg
	Npet4sWz2sYBM1EUcJy1Q==
X-Received: by 2002:a05:690c:4b84:b0:866:4769:d5d5 with SMTP id 00721157ae682-871221a80bemr70860997b3.4.1788725755822;
        Sun, 06 Sep 2026 13:15:55 -0700 (PDT)
Received: from localhost (host-190-210-193-251.iplanisp.com.ar. [190.210.193.251])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871439c4566sm60627987b3.4.2026.09.06.13.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:15:55 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:15:50 -0300
Message-Id: <DL8ICXL9YZ52.2N7SL1NG0LV5B@gmail.com>
Subject: Re: [PATCH v4 03/10] iio: adc: add the ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Kurt Borja"
 <kuurtb@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-3-1dc27e9c0260@gmail.com>
 <apFCNNzhPfq0T6rn@ashevche-desk.local>
In-Reply-To: <apFCNNzhPfq0T6rn@ashevche-desk.local>

On Fri Aug 28, 2026 at 5:09 AM -03, Andy Shevchenko wrote:
> On Fri, Aug 28, 2026 at 01:38:18AM -0500, Kurt Borja wrote:
>> Add the ti-ads1262 driver with initial support for the primary ADC
>> (ADC1). The ADS1263 auxiliary ADC (ADC2) is handled by a separate driver
>> and interoperability considerations were taken into account.
>>=20
>> Various features such as accurate timeout delays, per-channel reference
>> sources, scale, offset, settling latency, excitation currents and
>> diagnostics are intentionally left out for future support.
>
> ...
>

...

>> +static int ads1262_dev_send_cmd(struct ads1262 *st, u8 opcode)
>> +{
>> +	guard(mutex)(&st->xfer_lock);
>> +
>> +	return spi_write_then_read(st->spi, &opcode, sizeof(opcode), NULL, 0);
>> +}
>> +
>> +static int ads1262_dev_read_by_cmd(struct ads1262 *st, u8 cmd, __be32 *=
val)
>> +{
>> +	guard(mutex)(&st->xfer_lock);
>> +
>> +	return spi_write_then_read(st->spi, &cmd, sizeof(cmd), val, sizeof(*va=
l));
>> +}
>
> How do these do not conflict or race with regmap SPI communication?

No because the regmap interface only covers registers accesible by the
WREG (write) and RREG (read) commands. The data holding register is
accessed by a different command (OPCODE) RDATA1/RDATA2.

>
> ...
>
>> +static int ads1262_dev_reset(struct ads1262 *st)
>> +{
>> +	struct device *dev =3D &st->spi->dev;
>> +	struct gpio_desc *reset_gpiod;
>> +	int ret;
>> +
>> +	reset_gpiod =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(reset_gpiod))
>> +		return dev_err_probe(dev, PTR_ERR(reset_gpiod),
>> +				     "failed to get reset GPIO\n");
>
>> +
>
> Unneeded blank line. But can you use reset-gpio driver instead?

I'll look into reset-gpio. But I think it may not be worth to use it
because it may not change much here. We'd still need to manage these
timing constraints and we also only use this GPIO in the probe anyway.

...

>> +static int ads1262_parse_channel_node(struct ads1262 *st,
>> +				      struct iio_chan_spec *spec,
>> +				      struct fwnode_handle *node)
>> +{
>> +	struct device *dev =3D &st->spi->dev;
>> +	u32 pins[2];
>> +	int ret;
>
> Can this use the property names for 'single-channel' and 'diff-channels'?
> This will deduplicate the same in a few places and reduce potential typos=
.

You mean storing the property name in a variable? Sure.

...

>> +	st->clk_rate =3D rate ? rate : ADS1262_NOMINAL_CLK_RATE;
>
> Can use Elvis.

I'm not really sure what you meant here.

...

Thanks Andy! I'll address the rest of the comments too.

--=20
Thanks,
 ~ Kurt

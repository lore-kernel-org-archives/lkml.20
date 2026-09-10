Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E378647D952
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045621; cv=none; b=V4xO8J8C4y805dRgdZiDcQNJ4sqZjBrhV5qHBnXGf3JywkL3/X0yXDHJ4SOMb2st/GeOqSe15cqx9rWaEcz65zkY6OhmfXYQGYAeSwY2IFY3uANHz5RNGZgJJX4ozw3beY2cl4T9zoGMESldXeds84Ukxg1HM40OGD0kDh9cCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045621; c=relaxed/simple;
	bh=j++54T3sUZ+8HaFYRaDy0ZlOlzbDf1s23ZOYnPY0yUI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fs0qaNw1GJF8TPzwv8J3ZL1vK2+xohD/ANRycJ7l0SJT9ij+9MI5Z+0RqTNJtNgwA5kWCQAgZLBQQggWCzoSGr9PW1UvsNcoAEu/ClUKKFwivbEgX2R8XmvITQLWP0bE0PDC6gIaht9hWK26yY7Uo9taHRxpPzrBuIM8dtla3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fgAJpA13; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fgAJpA13"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so1334650f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789045613; x=1789650413; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s417j/ysygJZ4xE0jMBISIxl2zgVW4JEiLwZ40hycxA=;
        b=fgAJpA13geelJvMo236lMup0m+UVq79aH2cHRkifKGekwSlg2wdMqhwx8yEcs3jubI
         aQiLDugU7Ybtc1d+a3nPPlP7Ki2LO2ZJ1DKlWPRrEMv/FAlatVpC6jcnloRTz6vUrP+D
         3ERhtVyC2o/FMu/xpKpuJVOQEqspvxCJqJqOiU1K89CJrcllk65/4xHuYq4SZRSgvUwD
         LDvKt8NwjMkLhS5J+JRBZyPrmGuCOxo5EnMlQhFn0oFg5Q6LAkz9ZE5etDNqkM2Qfwvg
         n2BV/u4h9ry1oVUXq/xsc217Cm+9j++B9s8Ln20p5/Xh+8dlEt1IoOQhuIuJGJPUrxGl
         SEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045613; x=1789650413;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s417j/ysygJZ4xE0jMBISIxl2zgVW4JEiLwZ40hycxA=;
        b=V4x/WrRTGhEociOXQLVBTns3zRmU4ii13G+oJRVlwcS340NaY8Y74L8W3v9y+8YYax
         ppDhvcXz755Am8BQzDv2a98sJtlPHGnVo+vu64xRszwnU4e6redms5rOYNXZOjETuYni
         JC3WHUmWla2C9taetQNfBQNLns4G0SAa6gYIhw+g3d0HZxPPQhyWNBOZ/5ohCTgho+F3
         VokhdWjYrBusO6lD5mqOgvoKaDA5oQ42g0rbu+FuGSGshfAmoPRzkqalZfuFmNeVahTU
         KPbx7rkINDuAnXRfX//Yx4N42kcYB6c4l131aMwmAd8XYM1E1K3I9qkafQ9g2AmpCeSj
         wQow==
X-Forwarded-Encrypted: i=1; AKwUvBzmcrFYxZlemBboQ3/P7wUbBzax4Y+5ZuspyI4iq1N3qoHfj2m33ovHizkAznDNmJvgM5LMt3esA7VfhbI=@vger.kernel.org
X-Gm-Message-State: AFuF++lAMDVYQqutdJPQO7Q2BUgFdSIJzQ4u/hMmV0hwA6pNwaBLy6yQ
	oAl7HnU3vrj5dGBu4wOWJhsdib+oxkbFkaDSMQ2dJ8llmfP/EnOiNvj7GZfmr4AosXM=
X-Gm-Gg: AYBFou2DCfuik8P8Q03G11H7TG9tgAUVDVpAPdVh1kd2ng7MOyyrdkNihpJKAWFH2kI
	GBNNHiuHVlV/28VWzLwFhlTUd5u+aRIA4bRJRnejt3SgsNJoftAOin+rt5m52VDHlA5jBzHKNBT
	0nD7pZ2C4soL+MdAhKshb+4UemH33AYY+OQATnmMzmJlQ0JbyzymcJkg3ThwxnLSejDZ/SkYhvY
	v26EOoK90Nj4AUqU+5+6zeUNT6v0A+nWba4unY+NmtR3VsJmBgsY5NFoBdvNY/lT/fbuk9nTW3g
	PmxSZy47+ZTws4Vm8DNHrbOpAYwdCeIVpMRKl7lkOPUPZrmfMzqxXfmDrcUKGOBTGCpsjxuWQQA
	xjQncYeApE/jPsPjJyh6rpC6nkEDMqMDthkhIL24pXJfwVe+LiYqBG4NyTBKb8kD0u1QNyuw4U1
	SP5kqUvNDOZe6KU8S6T2n/tYrI5xGtdqdw7qcvBY15/KW+ZFiqsOCG4FaFUj9cSvzAGAMnk2uDG
	98YNrA0dDSkhzNmmPV3cP9ixfbC
X-Received: by 2002:a05:6000:22c8:b0:484:3310:710d with SMTP id ffacd0b85a97d-485aae0e29amr22786196f8f.25.1789045613146;
        Thu, 10 Sep 2026 06:06:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm44969402f8f.2.2026.09.10.06.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:06:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Richard Cochran
 <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
 <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
 <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
Date: Thu, 10 Sep 2026 15:06:51 +0200
Message-ID: <1jqzj16ys4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 10 sept. 2026 at 12:59, Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hi Jerome,
>
> On 9/10/26 12:25, Jerome Brunet wrote:
>> The A733 GMAC210 is a DesignWare MAC 5.20 using an Allwinner glue close to
>> the A523 GMAC200 already supported by this driver, with the following
>> differences to handle:
>> 
>> * The glue configuration registers are a dedicated MMIO region of the
>>   controller instead of a syscon register. This new register region
>>   appears to be in the reset domain of stmmac's main reset. This requires
>>   the glue driver to handle the reset rather than letting stmmac deal with
>>   it.
>> * The TX clock delay value is 5 bits wide, split over 2 register fields,
>>   allowing delays up to 3100ps.
>> * The DMA channels have their own interrupt lines, so the per-DMA-channel
>>   interrupt mode is enabled, as the vendor SDK does.
>> * TX LPI clock gating is supported, as the vendor SDK indicates. Follow
>>   the PHY capability with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP rather than
>>   forcing it on with the deprecated 'snps,en-tx-lpi-clockgating' DT
>>   property.
>> 
>> Unlike the A523, both GMAC instances are supported by the same driver.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> [...]
>
>> +
>> +static struct regmap *sun60i_gmac210_get_regmap(struct platform_device *pdev,
>> +						struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 1);
>> +	if (IS_ERR(base)) {
>> +		dev_err_probe(dev, PTR_ERR(base), "unable to get glue memory region\n");
>> +		return ERR_CAST(base);
>> +	}
>> +
>> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {
>
> Why check stmmac_ahb_rst, but not do anything with it ?

Not strictly required, it was cheap to do and catch mis-configuration
since the stmmac treat them as optional. I'll drop it

>
>> +		dev_err(dev, "missing required reset controls\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	/*
>> +	 * The configuration registers are inside the controller
>> +	 * reset domain, so the reset must happen before any write to them
>> +	 * and should not be done again by stmmac or the configuration will
>> +	 * be lost.
>> +	 */
>> +	ret = reset_control_assert(plat->stmmac_rst);
>> +	if (!ret)
>> +		ret = reset_control_deassert(plat->stmmac_rst);
>> +
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "device reset failed\n");
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, sun60i_gmac210_reset_assert,
>> +				       plat->stmmac_rst);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	plat->stmmac_rst = NULL;
>> +
>> +	return devm_regmap_init_mmio(&pdev->dev, base, &sun60i_a733_regmap_cfg);
>
> I wonder if this is the first glue to face this...
>
> If you need further setup to be done after reset has been deasserted, I suggest
> adding a dedicated callback in plat_stmmacenet_data, instead of doing this behind
> the generic code's back.
>
> maybe something like "post_reset_init()", something like that ?
>

I'll check in this direction.

The idea was to do things behind anything's back, more to handle the
specifities of this SoC without polluting the rest. The timing seemed a
bit sensitve. For example touching the other reset in here broke the
link for some reason (recognize as GMII instead of RGMII)

> the ->mac_setup already runs after reset, but isn't really for this type of usecase.
>
> For readability of the patch, maybe you should split this patch to first do the
> a523 rework, then add a733 support.

ok

>
> Thanks !
>
> Maxime

-- 
Jerome

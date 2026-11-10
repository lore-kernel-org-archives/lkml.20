Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298711;
	b=39g+/WnpuEGOmCeZV4wbRfV+bObVgyx8uXHY41vaAw55BKiKcrScMbo0ZKIgfxxjo+DR
	 OYrpdwf6HeIXGmhf43hAAV8jimj2we9h0/OD6pBSzGdYYSTee00LTGm0S2qrn3Ljvy82r
	 o/ENN+6P7ub2kwt+hUIA8IcCALtqbDEDn0Nprrl6ZTFKzXffwdAUokinJQp+uHCT6RxGA
	 NcsIu0N6uL8KZqZ2U7nVbPKoTIC2dCBw7EVnD1OAFJo6b7sehYaIEa4QMnDpBB0usXADL
	 +cnpUihFiOJvIuyJp1/ferxAECiebzR9NXFqZEbzlWAfw6YPb51b/SQZNhB4OhUNpDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298711;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ooIF9l2ke67KDVhc/kJP05DrltCEvdLdF23YLb4ic/0=;
	b=eecqsr34J+YUPRqXnJz6hx7TTFG/J00uibVNCU8wozWTUaA0VJkxhYcuydF0wDGF9q9F
	 0pMOyu0UfmujkrYgYhxb+bOBA9f0ctlDwgd9Xl1ZtjASi4g+wsE+Ezf7mE+Ry3gFsC+L0
	 AfkzgZA6Kly9pA2iqnwzLejVFn/NcXV6233ZfVcUT7JSBZs2Tji1Mwl8VkaeZpNgDDS4j
	 6RsGLPa05iFXSlu//M8Gmdi5dbPnZRLyWsMS44ueRZ3LBa2fDNkY23V/M70tTdf0jMMHC
	 /06M5lpiM3wx+tV4XG7z7dVZVbBCwKEA6JkcnVut5dvTdMIvFwdufvmzpsXLNO2ZH7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nj2D9liz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DC5606A31C;
	Tue, 10 Nov 2026 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nj2D9liz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46AC1F008AB;
	Tue, 10 Nov 2026 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298710;
	bh=ooIF9l2ke67KDVhc/kJP05DrltCEvdLdF23YLb4ic/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nj2D9lizDyZkQsO64U/IpvjHu4ZrduS99dklw/+CHSJtp5hTFL1w+DVbjVCgMlRQu
	 1vCIANvWg6bxnFWGFmYvLOVa/PK9k1AKVVZOZoiUgV+Z46JvqXHL7LSavPNo89UWKN
	 66O7xgZsMd4LAvbv4gh/c0iEIVt767AEQvL35m6zcmOoMTrjng2oBw5EBao63yu9n1
	 DaH1LWq7ptIHmMJ3PXZERcamoxOc5urwzDhfeAEqGpdC+DwI8TTvXWpOZ5AQlD5hzE
	 /7lunmpcogmCZNKPI2Gmv6vSOMLxo6VUOV/BkbLn/xv9HfexzGghxa8DFohAVp8z8x
	 Et3EcLOS2SQTA==
Date: Tue, 10 Nov 2026 09:18:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Suman <gauravsuman007@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] media: i2c: Add Samsung S5K3M3 image sensor driver
Message-ID: <20261110-honest-tall-tortoise-e4ac47@quoll>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>

On Mon, Nov 09, 2026 at 10:38:22PM +0000, Gaurav Suman wrote:
> +	s->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(s->regmap))
> +		return PTR_ERR(s->regmap);
> +	s->mclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(s->mclk))
> +		return dev_err_probe(dev, PTR_ERR(s->mclk), "no clock\n");
> +	ret = clk_set_rate(s->mclk, S5K3M3_MCLK);
> +	if (ret)
> +		return ret;
> +	s->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(s->reset))
> +		return dev_err_probe(dev, PTR_ERR(s->reset), "no reset gpio\n");
> +	for (i = 0; i < ARRAY_SIZE(s5k3m3_supplies); i++)
> +		s->supplies[i].supply = s5k3m3_supplies[i];
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(s->supplies), s->supplies);
> +	if (ret)
> +		return ret;
> +
> +	ret = s5k3m3_check_hw(s);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			s5k3m3_power_off(dev);
> +		return ret;
> +	}
> +
> +	ret = s5k3m3_init_ctrls(s);
> +	if (ret)
> +		goto err_power;
> +	s->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	s->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	s->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&s->sd.entity, 1, &s->pad);
> +	if (ret)
> +		goto err_ctrls;
> +	s->sd.state_lock = s->ctrls.lock;
> +	ret = v4l2_subdev_init_finalize(&s->sd);
> +	if (ret)
> +		goto err_entity;
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	ret = v4l2_async_register_subdev_sensor(&s->sd);
> +	if (ret)
> +		goto err_pm;
> +	pm_runtime_idle(dev);
> +	return 0;

This is hardly readable code. I don't get how Claude could even generate
that... but if did, then you use poor tools thus your work can be
ignored.

Just open any existing recent driver and compare. Sending code which is
completely different than our coding style - visible with naked eye -
proves that you just sent us slop.

Best regards,
Krzysztof


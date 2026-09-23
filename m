Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3D842AFB7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141131; cv=none; b=Xxh6Nj1SM++9ivjb8SiVEWljoLOPE+VtPawj8Uij6X6SoO3pC3y6Zq9Q7dG8LOF2FRNveDa0OLQab6FZl6ebb9hfzypUZDX1BEmcqyKXShIlHsE+0+7l3b2KytbaoTfxoTUCByiLFTOtrGJCkl30RPJ0dEj9JIsagVjQGkH2yNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141131; c=relaxed/simple;
	bh=I/wqOkw3aQ/Ls4RKsrHTDGcOzyOKHNIBEpq23pj3EmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeNmTZZqSnHyv3XznlJaKymwRHdn/7rEdW+d0L/9mz0deI/uULPrURp2QLITpCcZavo9RKV3EWT22rewGQhXDvk9WENB5MWTa68qHYdXH7Q1yB05vZrjMDAMP1fkKhw/LfROyLaMPHpCidqvQN7EJ0WI5OAB1eYXgYK/Hsy8z5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRoWlt+c; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRoWlt+c"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so294796eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141127; x=1790745927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kzJR8k++x/AUghqCXqQ6tGrTm69KLHS6yLDY8MNUo4=;
        b=sRoWlt+cDUUve+36v6/RYliqoPrQ7Ms2zVTtyd2DBwKh1WXhSSXhQJxFb1WdvF/dgC
         faGTTHWniyFSzaSol5Y6JeDGz3z+Wxi38VCuBPJdqIF6mO/KaDRVOHHc9O1n5SjaADvM
         dR35fP8qpkyU3eBc0C8Fhc2IYKcLmeh5HKmtrTcTdN/V75qlJ80wmmp8U7pIYbnDTb1w
         0IH1uAZQU7jxJflijVZ8BgK9NNKsxp0nlFlUjSRbyamSA9R7kLIQGudTOpyxEWwCng/P
         RhQzv9ParDUhVuQdBARODYQxTaBtmxR3fTiDJ59fcxPnLCdB/wXRMUSTQ+PKORwhIOfv
         QSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141127; x=1790745927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kzJR8k++x/AUghqCXqQ6tGrTm69KLHS6yLDY8MNUo4=;
        b=PwzSdeeAZpaeqgufbEbVvWX/yi2HpdPBAcbOCCkLAsDievKLwlwOtY+HqwoTqKSHE8
         PGI4NcBSbKutUbwkvQRJ6gQBaObt+uPvE0U+tsNrseQezH3Fvj0lhRMjpWDnqwcruTS/
         PItjloiR7l8GoD2cI+3bNmXKWLWoV/d+hpgg5CLn4R2B5jOX7JP0/5AxypAdVUalvDde
         bozLezdzqpC+/EczXGsWtXh+uCGeIdsLci7bZnkL76WIlnm7VtekZkbvyGjerko1ASoG
         yp3T3Y/eYf/A6t/VSNPcwZJ6OZiZz8SpHTBHHO7rb4f4Xgvu5/FlN5JBnB3Pka9Bi3l6
         odPg==
X-Forwarded-Encrypted: i=1; AKwUvBx17frWkBTVcY9budH/KDEdwV1QSJYBZQDmzifiJKN3FpIU8MeWOmc4KWADmxW5aKspkl98OkQct95vNUw=@vger.kernel.org
X-Gm-Message-State: AFuF++lV+3+N2Ur8apgNFLeR5YWF5ebdrDkHb0nOWmmUPeLLN9O5P9MS
	kPDXH7KtZyS3BVmxFSn7NbIXWh4G2YguLaopLdIIzAq6Rshs1KFOwZWZ
X-Gm-Gg: AYBFou09DlXUzZUXYSkwuwMgE1CxS4HnsS7ubq9zv0nnucvV5+KcE3JL5yIUZxsp7Lx
	R3ux5svwe14z2ucHGnh+0IYDwdg4kUiEEnAv1SRa/PY2vVzhEt2WmFzA1UVQEQotgYcrkCvoCXI
	30688Tc11LMgA+mH71Bmen/EluG6T/hirvEY+1gOcsNOGs7RnyayR+dbwH+0WP/g66xl9DeQanD
	PZmPp175ejS5rObZyZY6vMEvxfrl6SJVByj2ZKXVbgIMoW37vSHjp1s7IEcGr/YZz57BZBfDtLv
	niRy1i/XKhAyL7isSwh5/JfQQLvnukzSeh9Dx6g/RVenqQbE1jsh/QcBYRoIa6r2teFjLY3p9yO
	cBX1Ng8kuU8Qw4aE1L7rnZhoOzrOlBhw2y8B8EQooTehB/BOOP9AAboiXY+0NHzq6q4d+tRX/ST
	kO5GTHbD5qDCcZEatc6FqnllFj1suq9sT9e1wD1N2/9Sa5SZWQyFDJQl3RjaKaW9OWyxeXQPS8d
	wka9Wo6QOmkdfOtC2I=
X-Received: by 2002:a05:7300:1c1e:b0:33b:c29a:7c3b with SMTP id 5a478bee46e88-33e8901a281mr1702352eec.0.1790141126681;
        Tue, 22 Sep 2026 22:25:26 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3414262eec.26.2026.09.22.22.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:25:25 -0700 (PDT)
Message-ID: <6b1637d5-ce36-4702-a404-89ed6c65155f@gmail.com>
Date: Wed, 23 Sep 2026 13:25:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-5-joakim.zhang@cixtech.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922112134.4167305-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> +static int cdns_i2s_mc_clks_enable(struct cdns_i2s_mc_priv *i2s_mc_priv)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(i2s_mc_priv->clk_hst);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(i2s_mc_priv->clk_i2s);
> +	if (ret)
> +		clk_disable_unprepare(i2s_mc_priv->clk_hst);
> +
> +	return ret;
> +}
> +
> +static void cdns_i2s_mc_clks_disable(struct cdns_i2s_mc_priv *i2s_mc_priv)
> +{
> +	clk_disable_unprepare(i2s_mc_priv->clk_hst);
> +	clk_disable_unprepare(i2s_mc_priv->clk_i2s);
> +}
> +

It's better disable the clocks in reverse order of enablement。

> +static void cdns_i2s_mc_adjust_pin_config(u8 *pin_mask, u32 slots)
> +{
> +	u8 mask = 0, num = 0;
> +	int i;
> +
> +	/*
> +	 * Wired-out pins may sit at any index among the 8 data pins, so
> +	 * scan the whole mask and keep the lowest pins until enough slots
> +	 * are covered.
> +	 */
> +	for (i = 0; i < BITS_PER_BYTE; i++) {
> +		if (*pin_mask & (0x1 << i)) {
> +			mask |= (0x1 << i);
> +			if (++num == slots / 2) {
> +				*pin_mask = mask;
> +				break;
> +			}
> +		}
> +	}
> +}
> +
> +static void cdns_i2s_mc_tx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK,
> +			       i2s_mc_priv->pin_tx_mask_adjust);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE,
> +			       i2s_mc_priv->pin_tx_mask_adjust) |
> +		    I2S_CID_CTRL_STROBE_TS;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, i2s_mc_priv->pin_tx_mask_adjust);
> +
> +	if (on) {
> +		/* Transmitter data underrun interrupt unmask */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, irq_mask);
> +
> +		/* Transmitter clock enable */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, 0);
> +
> +		/*
> +		 * Transmitter enable
> +		 * Transmitter synchronizing unit out of reset
> +		 */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_TSYNC_RST,
> +				   i2s_mask | I2S_CTRL_TSYNC_RST);
> +	} else {
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_TSYNC_RST, 0);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, clk_mask);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, 0);
> +	}
> +}
> +
> +static void cdns_i2s_mc_rx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK,
> +			       i2s_mc_priv->pin_rx_mask_adjust);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE,
> +			       i2s_mc_priv->pin_rx_mask_adjust) |
> +		    I2S_CID_CTRL_STROBE_RS;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, i2s_mc_priv->pin_rx_mask_adjust);
> +
> +	if (on) {
> +		/* Receiver data overrun interrupt unmask */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, irq_mask);
> +
> +		/* Receiver clock enable */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, 0);
> +
> +		/*
> +		 * Receiver enable
> +		 * Receiver synchronizing unit out of reset
> +		 */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_RSYNC_RST,
> +				   i2s_mask | I2S_CTRL_RSYNC_RST);
> +	} else {
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_RSYNC_RST, 0);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, clk_mask);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, 0);
> +	}
> +}
> +

The TX and RX configuration look similar. Perhaps they be factored out
into a helper to reduce duplication?

> +static int cdns_i2s_mc_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv = snd_soc_dai_get_drvdata(cpu_dai);
> +	struct device *dev = i2s_mc_priv->dev;
> +	u32 rate, sample_rate = 0;
> +	u32 slots, slot_width, resolution, ctrl;
> +	unsigned long i2s_clk_rate;
> +	u8 pin_tx_num, pin_rx_num;
> +	struct clk *clk_parent;
> +	bool is_master_mode;
> +	int ret;
> +
> +	rate = params_rate(params);
> +	slot_width = i2s_mc_priv->devtype_data->data_width;

Is the slot width fixed by the hardware? If it is configurable, it might
be better to obtain it through .set_tdm_slot().

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		is_master_mode = ctrl & I2S_CTRL_T_MS;
> +	else
> +		is_master_mode = ctrl & I2S_CTRL_R_MS;
> +

The master mode is already known in .set_fmt(). It might be cleaner to
store the master state in the private data and use it here. This would
avoid an unnecessary register read.
> +static const struct snd_soc_dai_ops cdns_i2s_mc_dai_ops = {
> +	.probe = cdns_i2s_mc_dai_probe,
> +	.set_fmt = cdns_i2s_mc_set_fmt,
> +
> +	.hw_params = cdns_i2s_mc_hw_params,
Nit: Remove blank line here.

Regards,
Chancel Liu


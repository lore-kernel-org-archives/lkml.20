Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062787;
	b=SBMtRyu42RJsVaf2JfG8jVtycZpbbRh2gPCXQ/DNGtQey3NcyBKCl32DuI7lpebPvgbM
	 lSQNV4l+xrPCdgABvCyV4sN2SXsTjlnvk4kMwxhHwvcfAayEkfTPTozFPZAGrUbDk1L3H
	 mjRxIKc5U3+q7U++S8CdDbeCljog5nbiy+4gDa7dOKL0GIYykxR4UWpMJTwdyoI3fRYUm
	 UdRrUse2iY3eoStu9w5vf+njMr6RqLwv57lV1DYIKELjO3IkMv4Xlo19dSrL4v/SyvJpA
	 RHY6wYcqDwYvgX/xw1AO0XqypbjxrsRQApgqTKNEH3E35WkKKSJxDpm14xsYb+yv6kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062787;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Y/U4/Y+c7YCJH2gj37MU9+SaDQx2kcmCGuUGv7p5siI=;
	b=a3+nMZ1dwz8ITstpfND6CWqMIpWZRsaOvjyclNFN9Q9xAISCWTpAJQ5GidN2Olmzg9rO
	 shqv9uIdcA29SrFE3lHSziPI7xuqo5+gNNwGt1E6e3ViYYHTAi96kcsrEC36FKgjdZd/Q
	 1TZq0baxOdUBeZfiXJCuBr58lG1U6zSNVgPjxLfSsqDEGsm9mnz5VpzG7Sl6xFX62JXhg
	 xrFG4VPXv1nGIAGHhQPOCg1w3n+FWdB39fnvp8RDaJz7+YDOnh3l9uwn6dQyp5NIYODlI
	 9P69kf10L+KM9OBTy3pMfgM/kjeiibJHo7nBa37PqxXxzww5r0Fj9zPLQPoyqcNkzKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfFErCpX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47082606A326;
	Sat,  7 Nov 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfFErCpX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4851F008A1;
	Sat,  7 Nov 2026 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794062787;
	bh=Y/U4/Y+c7YCJH2gj37MU9+SaDQx2kcmCGuUGv7p5siI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WfFErCpX1VeGCOCpYaYsSl0Cr5jlTysRBNrmJvQLMvInGZeEq9NfWCUbnGqRAQJNI
	 +jUHamn7SAOO5GBFtEIjLGZnN1ZZqmCNZKMEgTv3yXDtFbRAAn4OBksp598rw6lnQw
	 a9UXMTWfRdjj7/MLv65ljDg6jvH0OythlBq1ToNmFT6MQlEW4p+/U5RfrTyTeUQr+2
	 eTltb1CL1wsWjcYT1dPBqhG6SQ4qJRnCP7AZRTqde7Q2W3yOcHVUOAXKRfEiUR0PHQ
	 Y6kLBqcDX4ozHCUfEV2npck49pSiPIhpTXKjBpyAcEXVkVI5Jjk5nnYStnc0+ORlhT
	 xyqFYnX1Qurww==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9E02E2A4C628;
	Sat, 07 Nov 2026 14:46:24 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/4] ASoC: cdns: Add Cadence I2S-SC controller
 driver
From: Mark Brown <broonie@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
 p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106105208.1246554-3-joakim.zhang@cixtech.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
 <20261106105208.1246554-3-joakim.zhang@cixtech.com>
Date: Sat, 07 Nov 2026 14:46:13 +0000
Message-Id: <179406277372.3424803.17958802824910186591.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v4HdLYm98sCKNpNKmPbLCJ65MizgcuLnPoOUw1rjLew=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeWx7YyDDRdY2E6mKrrLtcFw2ynjdnK27f2h7QdLBGW
 Pbfud/WHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIYTgjw139u1V1O0VLn9Td
 e6sz/3mC/B73YD5+OdNr1xpWenPtCGX47+Ej1dof41KR/Du4nfHNQgWGJV/ffLFtNTld8myDcu4
 uVgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add support for the Cadence I2S-SC controller found in the CIX SKY1
> audio subsystem.

> +static int cdns_i2s_sc_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{

> +	} else {
> +		/*
> +		 * I2S mode: mono maps onto the left audio channel, while
> +		 * the frame still carries two slots.
> +		 */
> +		if (slots == 1) {
> +			i2s_sc_priv->is_mono_in_i2s_mode = true;
> +			slots = 2;
> +		} else if (slots == 2) {
> +			i2s_sc_priv->is_mono_in_i2s_mode = false;
> +		} else {
> +			dev_warn(i2s_sc_priv->dev,
> +				 "I2S mode supports up to two channels\n");
> +			return -EOPNOTSUPP;

You should really set constraints in startup() which limits to two
channels if the DAI is configured in I2S mode, that way userspace won't
get upset when it tries to do 4 channels..

> +static struct snd_soc_dai_driver cdns_i2s_sc_dai = {
> +	.name = "i2s-sc-aif",
> +	.playback = {
> +		.stream_name = "I2S-SC-Playback",
> +		.channels_min = 1,
> +		.channels_max = 16,
> +		.rates = SNDRV_PCM_RATE_8000_192000,
> +		.formats = (SNDRV_PCM_FMTBIT_S16_LE |
> +			    SNDRV_PCM_FMTBIT_S24_LE |
> +			    SNDRV_PCM_FMTBIT_S32_LE),
> +	},
> +	.capture = {

The DT binding allows either TX or RX DMA to be omitted, the driver
should only register the directions it's got DMA for.

-- 
Mark Brown <broonie@kernel.org>

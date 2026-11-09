Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259898;
	b=sZkBFTP5+jAjEapqGpk+OcBlR14uqpwW6wqYh/EGD1nT2zX9SpwACxVE4BsABQOqJhbe
	 DdXubipCq54ZfsxweABprcHU0A2mJDGT6qFPNNyOGM2NDT/hTxroQ6uHW80jW+1A8kYuU
	 V+F3InkuBHsvXR0W1eJVY8TN62tyxHin3o0DZarUPqrB1ACR7QNQJ9jKwM62HPllXlld+
	 7N7e7di2gBMXQnoKXJKEc2AHHud1RzfGfwkor/jaf06KSZyOd/7NpwQh1jgNe9JEJNbHM
	 HcPxXEQkzYkS13bZr73bBMrmF/fCjJH+Y4cpWIembgcIZ3SmDxJ1Yp9aVa1gbMQUwlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259898;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wfCyDF8grJ9MDlm8Y+vOvvrtCOk9HZamlK1MOtq71NY=;
	b=kodxMWtmdIc8psOMRxOt45q8vZiPyR1Eh3VAbxIMiJj264iaWG+ZcA5FtES9+jVMoqsu
	 lFq8ginvXM7oNNX/dmgS82d6+ChFToldrHzhTd5OgN3qCv0A+QWX72AwohrnY8SvFT/Va
	 8hQ3ujI+V16WqtGgSpO32LVyUVnERiCXPT03JWWDS1SEdNMOCzuXejKKnVAovJZAe3OxN
	 j0xhVhvtIDWNvZzQs5duf7r3fIQGRPe/jNW/RX5hCz1u6HOI8Yr5rBnAn4r52FIV3JbD6
	 TQPeTmSRl/e71aaYZIYHgGWguenP/CXnrRxeeGUIpcEwfelWVXbObPswt2E5zmXXA/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCzhRyZ+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58297606A31C;
	Mon,  9 Nov 2026 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCzhRyZ+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507381F0089F;
	Mon,  9 Nov 2026 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794259898;
	bh=wfCyDF8grJ9MDlm8Y+vOvvrtCOk9HZamlK1MOtq71NY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mCzhRyZ+wwhJJGibEXRKXuBZtQz4qUFVXIk74vVhWIPQA32tx8NBVYHdT3qb3a5kw
	 z48+hw4FvLI1fapT7DbV6sWvt2t+9Qe+F1qsa+Mdn3g40jQ0rPBnWsh7aQqtBHsys6
	 g1ebrARLWRxH/jQWYFGF0GZa5+nG9qWWgSzTqhJTWsAmk8A+StNDuDaAQyMIF7eV8B
	 5abeOBvCj/VrkMHnLkridb1GLGM5eX0cKEXMgPMdVmBr+/Y0brbwYLgp0h3s3+3/bX
	 d1U0yMMqUGb4gTmSbe/SMUPiABVuZ2ZBFx1YnDS5YpPHS7HMtfk+vmGkd2ShIqy0dP
	 eMltTBWWZlacw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 2842C3021B8F;
	Mon, 09 Nov 2026 21:31:19 +0000 (GMT)
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
Subject: Re: [PATCH v5 2/2] ASoC: airoha: Add support for AN7581 PCM driver
From: Mark Brown <broonie@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261019232412.516028-3-ansuelsmth@gmail.com>
References: <20261019232412.516028-1-ansuelsmth@gmail.com>
 <20261019232412.516028-3-ansuelsmth@gmail.com>
Date: Mon, 09 Nov 2026 21:31:18 +0000
Message-Id: <179425987829.3711751.2911706702501919873.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4541; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TxbeNRoApeZMXmEGvJ/B2ZT/ZxuqSXWwNg+NhfOldYg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+WS9X2GcV/NPVyccmmtNmu7PxCv2MNqFJ1n6CsXHfb
 22ovmfeUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgImoGzMyvHob0KX0TJa/KWM5
 71b7ur3cczaw7lN8mRD1QEtY9TuLO8M/Xcew9MiywG1sVeKNqdKMRjN3fEiovPuxqPnKCeXoPZp
 8AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
> supporting playback and capture at sample rates of 8 kHz and 16 kHz.
> The driver configures the PCM bit clock to 2.048 MHz and supports
> 8-bit and 16-bit samples, with up to 32 channels.

> +config SND_SOC_AN7581_PCM
> +	tristate "PCM support for Airoha AN7581 chip"
> +	depends on ARCH_AIROHA || COMPILE_TEST

This needs to select CONFIG_REGMAP_MMIO.

> +#include <linux/mfd/syscon.h>
> +#include <linux/pinctrl/consumer.h>

These aren't used.

> +#define     AN7581_PCM_BIT_CLK_1024KHZ		FIELD_PREP_CONST(AN7581_PCM_BIT_CLK, 0x2)
> +#define     AN7581_PCM_BIT_CLK_2048HZ		FIELD_PREP_CONST(AN7581_PCM_BIT_CLK, 0x3)

Is this really 2048Hz, not kHz?  

> +static const struct snd_pcm_hardware an7581_pcm_hardware = {
> +	.info			= SNDRV_PCM_INFO_MMAP |
> +				  SNDRV_PCM_INFO_MMAP_VALID |
> +				  SNDRV_PCM_INFO_INTERLEAVED,

The pointer callback works in chunks of descriptors so you want
SNDRV_PCM_INFO_BATCH as well.

> +	.period_bytes_min = AN7581_PCM_FRAMES_PER_DESC,

This is using a frame count to specify bytes.

> +static int an7581_pcm_setup_time_slot(struct an7581_pcm_priv *priv,
> +				      int direction, int bit_width)

We don't have anything constraining things so that the slots fit in the
BCLK.

> +static int an7581_pcm_fe_startup(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
> +{

> +	/* On open mask interrupt and disable DMA */
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_TDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_TXDMA_ENABLE);
> +	} else {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_RDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_RXDMA_ENABLE);
> +	}
> +
> +	usleep_range(10000, 20000);

That's a fairly long delay for a digital part?

> +static int an7581_pcm_fe_prepare(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
> +{

Note that we redo prepare as part of over/underrun recovery - we should
reset the hardware position as well as the driver one.

> +static int an7581_pcm_fe_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params,
> +				   struct snd_soc_dai *dai)
> +{

> +
> +	if (priv->users <= 1) {
> +		/* Setup Descriptor size and number */
> +		regmap_update_bits(priv->map, AN7581_PCM_TRDRSR,
> +				   AN7581_DESC_OFFSET | AN7581_DESC_SIZE,
> +				   FIELD_PREP(AN7581_DESC_OFFSET, sizeof(*desc) / sizeof(u32)) |
> +				   FIELD_PREP(AN7581_DESC_SIZE, num_desc));
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_CHBFOSR,
> +				   AN7581_PCM_DESC_CHBF_OFFSET,
> +				   FIELD_PREP(AN7581_PCM_DESC_CHBF_OFFSET,
> +					      AN7581_PCM_FRAMES_PER_DESC * bit_width / 8));

This is a little confusing, the driver says it does interleaved format
but the offset programming looks odd for that?

> +
> +static struct snd_soc_dai_link an7581_pcm_dai_links[] = {
> +	/* FE */
> +	{
> +		.name = "an7581-playback",
> +		.stream_name = "an7581-playback",
> +		.trigger = {SND_SOC_DPCM_TRIGGER_POST,

> +			    SND_SOC_DPCM_TRIGGER_POST},
> +		.playback_only = 1,
> +		SND_SOC_DAILINK_REG(playback),
> +	},
> +	{
> +		.name = "an7581-capture",
> +		.stream_name = "an7581-capture",
> +		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
> +			    SND_SOC_DPCM_TRIGGER_POST},
> +		.capture_only = 1,
> +		SND_SOC_DAILINK_REG(capture),
> +	},
> +};

This isn't actually a DPCM driver?

> +static struct snd_soc_card an7581_pcm_card = {
> +	.name = "an7581-pcm",
> +	.owner = THIS_MODULE,
> +	.dai_link = an7581_pcm_dai_links,
> +	.num_links = ARRAY_SIZE(an7581_pcm_dai_links),
> +};

This should be const.

> +static irqreturn_t an7581_pcm_irq_handler(int irq, void *data)
> +{
> +	struct snd_pcm_substream *substream;
> +	struct an7581_pcm_priv *priv = data;
> +	unsigned long flags;
> +	u32 status, isr = 0;
> +
> +	regmap_read(priv->map, AN7581_PCM_ISR, &isr);

> +	if (isr & AN7581_PCM_IMR_RDESC_UPDATE_INT) {

> +	if (isr & AN7581_PCM_IMR_TDESC_UPDATE_INT) {

> +	return IRQ_HANDLED;
> +}

This unconditionally returns IRQ_HANDLED regardless of if we actually
found anything, this breaks any potential sharing as well as the debug
and robustness features of genirq.

-- 
Mark Brown <broonie@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258021;
	b=XLzfZjldPqAxVUGqXgh4Bg9WcTxtLYGXvEoh0vmC9Hvu3guENugzCbhcVoHCYOY61uHr
	 fhz9kzUH99GpYft4XZ6A5cTJI870JCnKtJiy658zBEsqpm/1iQDv6FWgB3nf9qL4EW0Pw
	 q+eglijslHuGJMoVVfY4lCL3ZMxvZU7oiNClEXE+MhQXwPUA1Wc+tJOpiUUNCCDnzunUZ
	 X1wdUg8LJN0Eg+lIkRBcf+eh9/xAAKo7gI8gmPly5idGNXMxNvnOvohJ4HSeJY8xfOLvZ
	 7HQiuZrwtxmFkbnpZ29fbO76vRyfFQKX5+MapBcLkQ3SBEfai9QVEJzIevMxNYeJZ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258021;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eQU4KWpZu4AHbLVPbyS0nA/90up/X89Iryoj5KvLp9s=;
	b=tk/clhrTdKV+haYwCfZNgSQXi+176nhNs+6QnvetH0pefq93BbXxZaDvscDhyX039arW
	 if29TZyMGyLLKFcC/FK3f52f71FWMo1GVf9Eczui/r3NCN43/wS5dZO3DuBSieMPh/Dsd
	 US4NpVeDEXrRKZqMf6UcyaJA1NpQXDSDHnVTFwxb4+E64UEiaqWMYbj7ehsRgnT/spaIT
	 rb2Nroc28I9FI7dNS+dgRabQCdue3Jpz/me3dGSf1+C3AdFshlDB2tzMMeokKvVnZh8IQ
	 S5TRSV47bnGrK3EfNYGA2ac9Skw9DB4VI8iDODRnUvAvXlKkkZI5kzX9zmzzsW8w8Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sderx++f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B653606A31C;
	Mon,  9 Nov 2026 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sderx++f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436A71F0089F;
	Mon,  9 Nov 2026 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258020;
	bh=eQU4KWpZu4AHbLVPbyS0nA/90up/X89Iryoj5KvLp9s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Sderx++fo/HfdI6QP6KQ65+xMyjra3lMttoQs9e+WUX5dC2lA+uuLEqHNhdlv30CJ
	 Xha81pxdujOCDp7s3LiHOJjswvZbKPwzqh36Elszp4zKRvajSIMIGjqlak/RUewNzo
	 /ywr2LVe44T1stvh0RSflW0xpbayAsKbrhR022URmv3kBmSunPqvh8XPZenUvAXrM0
	 vY5eU9HK5EcIxkvAoQtilZkTEyYP0U+PJmfxZGixLOnTAJjsKLGNZBPOdiFR6fApqA
	 dpu0Pc5b3AvmqWw2wPN3sYEIuFO7ELudH+lbis4me/RdcF5/71wxSmSpQJudjS/Soz
	 Hz/W6GxAjgv8g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E68EA30217EC;
	Mon, 09 Nov 2026 20:59:39 +0000 (GMT)
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
Subject: Re: [PATCH v4 09/22] ASoC: apple: Add macaudio machine driver
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>, Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261103-macaudio-v4-9-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-9-637484efe46d@gmail.com>
Date: Mon, 09 Nov 2026 20:59:38 +0000
Message-Id: <179425797819.3711751.16786276718513108020.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3005; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Dx6ZAvak6FM1JVv55O6fY7vNpn2fIMYkCHcl6jCDEqM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+mVgbdL7eNKOkoN/SosV+ibDynn1ONYcsNC5KXGrO5
 5NVXnyjo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABO5v4qRoeeA0mvTY5cez/xu
 rLb94zGj7LK9vJH3RZSdazMWW1/gt2T4p8M8Q1nHYEWUwmbbBIms39Ypz7S45W4e63bb+M3o2KU
 ofgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Apple Silicon Macs have a complex audio subsystem consisting
> of an I2S peripheral (MCA) and multiple codecs of various
> models and capabilities. Some machines have a basic mono
> speaker with hardware downmix, while others have a very
> intricate stereo system consisting of multiple codecs and
> drivers per L/R channel. Some machines report voice coil
> voltage and current information back to the SoC, and others
> do not. All machines have a headset jack.

> +#include <sound/simple_card_utils.h>

This is unused.

> +static void macaudio_vlimit_update(struct macaudio_snd_data *ma, bool take_rwsem)
> +{
> +	bool unlock = true;
> +	const char *reason;

> +	/*
> +	 * If this has been called from either of the safety interlock
> +	 * workqueues, the core API has not taken controls_rwsem for us.
> +	 * Take the write semaphore since macaudio_vlimit_unlock writes
> +	 * to the kcontrols.
> +	 */
> +	if (take_rwsem)
> +		down_write(&ma->card.snd_card->controls_rwsem);

The callers with take_rwsem all have volume_lock_mutex.
macaudio_slk_put() is called from snd_ctl_elem_write() which has
controls_rwsem already so we end up with an ABBA deadlock.

> +static int macaudio_parse_of_component(struct device_node *node, int index,
> +				struct snd_soc_dai_link_component *comp)
> +{
> +	struct of_phandle_args args;
> +	int ret;
> +
> +	ret = of_parse_phandle_with_args(node, "sound-dai", "#sound-dai-cells",
> +						index, &args);
> +	if (ret)
> +		return ret;
> +	comp->of_node = args.np;

This gets cleaned up on failure but not on success.

> +	if (rtd->dai_link->num_codecs == 1) {
> +		dai = snd_soc_rtd_to_codec(rtd, 0);
> +		ret = snd_soc_dai_set_tdm_slot(dai, mask, 0, nslots, MACAUDIO_SLOTWIDTH);

> +		/*
> +		 * Headphones get a pass on -ENOTSUPP (see the comment
> +		 * around bclk_ratio value for primary FE).
> +		 */
> +		if (ret == -ENOTSUPP && props->is_headphones)
> +			return 0;
> +

We don't otherwise check the return value before we start overwriting
it.

> +	/* Fallback, jack only */
> +	{ .compatible = "apple,macaudio"},

The cover letter said this was dropped and the binding did so.

> +static void macaudio_devm_release(void *data)
> +{
> +	struct macaudio_snd_data *ma = data;
> +
> +	cancel_work_sync(&ma->lock_update_work);
> +	cancel_delayed_work_sync(&ma->lock_timeout_work);
> +}

This is registered before we register the card with devm but these work
items use the card, they need to be stopped first.

> +	ret = devm_add_action(dev, macaudio_devm_release, data);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_snd_soc_register_card(dev, &data->card);
> +	if (ret) {
> +		for_each_card_prelinks(&data->card, i, link) {
> +			snd_soc_of_put_dai_link_codecs(link);
> +			snd_soc_of_put_dai_link_cpus(link);
> +		}
> +
> +		return ret;
> +	}

The action registration doesn't do the unwind that the card registration
does.

-- 
Mark Brown <broonie@kernel.org>

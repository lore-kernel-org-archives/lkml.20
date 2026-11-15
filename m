Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764205;
	b=BdW87SVONeUjAzZJu2Gsx8G7Bf5t3U7h7msj9M2x7IxdBRlIC1w0HKBcJynk3y0WSRkR
	 4ao6Ncf+6OQF4FxCXj3d1wlEdlj+KXDf66uDQYJo1orNCi+5Orj0HMJZlQliCE+Va/fSP
	 YMiiYNs6ic93KG31dq79JGtCMA/WS4Yw9ftTIWixO5YvGtcEO8rk5IiDo3GqN5UQNokUQ
	 oW20uIy0Rosq6tDZCkP6xTTKxpkFbyAaiGJ4TJo8bWF1+tNUhM4Ocj13Dfa7MSyBv8TaS
	 SwKXAOxE46unaS7l+988t+xiMwqgtJ519yM9EzebOKjXLe0LFhM22VVp6uYL9vbTxEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764205;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bEwEZ9dVUhd/OuLg/B3M1oMzCE1ik6XNDQvyNSWBWJw=;
	b=zDIl0KL/nHmk8dvitfPQgegG8N+QVh6yvwKYii3yM2v6ZIFgN5HK+a/eSONE8RqiOgNg
	 qEB/5sBJ5vkPYWn+jySdk8b9C9JqX2wStaa4rgWhraaEMz8L/RJB/bG41QpUI9J3qkmXo
	 6UjhiOeLAcEG87cFHixrXQqqS1wMf2WcbpVG8wA1GWqr2O8ZfKb1TkBSl7tmnG/sPH6uY
	 QrQ8qRN41bvvuoeidFf/7nvqj8DzbDQt/HPTm+6Faufn9q7vZM/54eIa9FxRDUNE1WAcA
	 Ywvrbe27UyP110dSkIOtjVZlGYl+IJCixhq/f094LXBvCtXiHSaafN46sufhP8a/tGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+Lt7XkY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8C0606A31A;
	Sun, 15 Nov 2026 17:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+Lt7XkY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33121F00927;
	Sun, 15 Nov 2026 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764205;
	bh=bEwEZ9dVUhd/OuLg/B3M1oMzCE1ik6XNDQvyNSWBWJw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=I+Lt7XkY1zPz9aeCyeXLCe0SOQSsMMuWUdtuchNBHByvjiTH+g5YN8rycZNdlpdtY
	 vmvfZbJTfVqi08CapQgkyhazEkedlKrHCcCkA3TiSKM5j7lWO1qKmrIoBLUoy9nax8
	 fr9cT61OXmOupTj3cEprikzHFXt63yAj3uCnO5YT4N9itL+U0E3hzRA0VuzeiafnvF
	 IxX8b1rC+tqhukcGXBwmMNmvhbbwkXJ30peA9mouL2F3ImO7p81BtPLTBWIfMOgBXb
	 Bx0yN7Mt3Bn+jmqF0Li3sh65bmIoQCbXzR64JISrZ6raaXrIl4fkr1jh4sOZZu63+e
	 sKf2HYFeNKY0g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7AC4E3386D13;
	Sun, 15 Nov 2026 17:36:16 +0000 (GMT)
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
Subject: Re: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream
 runtimes for multi_direction links
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 17:36:09 +0000
Message-Id: <179476416982.140154.5480409059266128218.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=broonie@kernel.org;
 h=from:subject:message-id; bh=M2c5onV3XhSQ8hlJUvEO3Yh71Gb+lxu4Q3iPvrqeZ6I=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+vu3/+U80surV2p2zNTdnzL+6Nptl+pnqFxN/qqjLz
 dZQvFoZ0lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJPDNl+O+dLs8bILJkw46Q
 mZMt/7cnm7+3N5Eu/vTpleHKdy2Jbw0YGY4sfXzhsKq/9bxzeXsPbOc9FlQlNuva+v37dph6yfs
 ll3MBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> A SoundWire BE link with multi_direction_codecs carries codec DAIs of
> both directions, and each direction needs its own sdw_stream_runtime.
> 
> Split startup, prepare, hw_free and shutdown into per-direction helpers
> and run them for both directions on such links.

> +/*
> + * Inline direction check that doesn't require snd_soc_dai_stream_valid
> + * to be exported for module use.
> + */
> +static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)

This looks a lot like snd_soc_stream_valid().

> +static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
> +				  int dir, const char *cpu_name)
>  {

> -	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
> +	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);

Both directions will end up with the same name which won't help
debugging.

> +int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>  {

> +
> +			for_each_rtd_codec_dais(rtd, i, cd) {
> +				if (!sdw_dai_has_dir(cd, substream->stream))
> +					continue;
> +				sr = snd_soc_dai_get_stream(cd, substream->stream);
> +				if (!IS_ERR_OR_NULL(sr)) {
> +					sdw_release_stream(sr);

sdw_find_dir_stream() (there's other copies).

-- 
Mark Brown <broonie@kernel.org>

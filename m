Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764189;
	b=uu4ji08gIxTnRnOelHJlv/ItPxrJZmqcPRneuHJaqZ9I/N9o9AHWgTuTrlIk7jRnj+Ji
	 eCc/AbqyahLUd5ZwMcQNVzUwOXr7mxdQVWljCvBRGP88CpkHkmJVUOL0/k16glNcPf32/
	 dtxDsL5zA/HONDofMm6d2U4SjjZAkBt0XoAMsjwj0E+NKGjdRd1yYrK/H/lsuahM6OdAo
	 46HM5ZDEO7YhoDCZw/jE9D5ZbcWQr3PUGx6eDQc9jK5H8pmY9lsMxtNjuLFGi68eE8Q89
	 0Jq7M6AVHVVo8U7l0Uj+TfnTwu/5LDtfe6hQINnxpbuT4SJjD3AXvV7MpuBtqi5+aFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764189;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZNxBLwL1MTdrlSOZCD9Lz65uR+T2S5Ys3KIjD8/xcQE=;
	b=n25k2BJgKW/hCjk5uKVbTnUeAUlmidSlLcb2bnyGlDmhRq34J6LM0rSk/u3baiKIeB6+
	 kao3ItppEbFFenY2hVJr71GSJxQO2bs7Dqb8zDUfz5nhhvC2ofqUjyjFT1PSJoFWJiG5c
	 7ZuDOyJg1gGGuIWxJhtxE/Lkk3eyXJNaJNWyq+gIgvyq5kPwMZa/3gRmkj56gc33FisSJ
	 YieJLNGCZtKL2bARqo/Iu4/vf8TKJ6DDj9uREUg46PHei1rd9cc9E0rZ7FAtFSajgedwt
	 N0JTalxRwgrr3IBZb3SamVFGcjRcIqZEYPH4ku7o8NhnmcQkICooElgMrDlsn49ENgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YSvGmKed;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC28606A32C;
	Sun, 15 Nov 2026 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YSvGmKed
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1541F000C5;
	Sun, 15 Nov 2026 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764188;
	bh=ZNxBLwL1MTdrlSOZCD9Lz65uR+T2S5Ys3KIjD8/xcQE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YSvGmKedafXo+3bw0HKmZQOY5NCQ2dgb80DnAhHJID9R8d6/H8xhXMz0/1O8R0A3O
	 rrsULScmfDP1YsdJxh4HR0mLDlOGv/Gejl0hBTexrieA1cszZIDZs7gjrdcXNGqo3H
	 Ez/nE7Whrynb62VSZMwd3ZXdowf5r7eapCMqaJt1Ey13oBUkQawveaG9d/I7brDiX4
	 RaSVqHvJbj3bdeD3uG8akp0q9+tad7LXXYs567PQMJqD5D37tx3eG7ffPUKvXFEnLM
	 tvxBTYC7yyvDYTHJsgTbD37ADfo5cLyKHDJk/+B7+KNtXe71TBa66QK4Ie/J/ITN7h
	 Hg/7XjrLoRRKA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 78E373386D12;
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
Subject: Re: [RFC PATCH 02/23] ASoC: soc-pcm: add multi_direction_codecs
 link flag
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
In-Reply-To: <20261023171433.820092-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-3-srinivas.kandagatla@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 17:36:09 +0000
Message-Id: <179476416982.140154.13934302514044276070.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ssM48ABLW3PnYt4pn6N3J/DP47/v9YtfUwCY0ptG2rQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+vu1fdoiZhZH7Zs6FR8xvrt3cxfD7F6vJdDV9yd2NN
 TeFkww9O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRrEBGhkuPUv+/7T244rLJ
 nwMF7+IW7ZrHbzT/upBERUyEhe29x6KMDNu2zbHSfy4uaCNgyrKhJ0Ao7I90idiUlMVPM+wuLLy
 0mB0A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Speaker protection needs the amplifiers' V/I sense capture running
> whenever the speakers play. Putting the capture codec DAIs on the
> playback BE link ties the two together, but the core skips codec DAIs
> whose direction does not match the substream.

> Add a multi_direction_codecs link flag. When set, the core also calls
> .hw_params and .hw_free on codec DAIs of the other direction, with the
> substream direction switched to theirs for the call under pcm_mutex,
> and sends the matching stream events so their widgets power up and
> down. An optional multi_direction_params_fixup callback lets the
> machine driver set the parameters for those DAIs. Links without the
> flag are unchanged.

> +3. Optionally calls ``.multi_direction_params_fixup`` so the machine
> +   driver can rewrite rate/format/channels on a per-codec copy of the

Probably worth mentioning the ordering with regard to other fixups.

> @@ -986,6 +986,9 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
>  
>  	snd_soc_dapm_stream_event(rtd, substream->stream,
>  			SND_SOC_DAPM_STREAM_START);
> +	if (rtd->dai_link->multi_direction_codecs)
> +		snd_soc_dapm_stream_event(rtd, substream->stream ^ 1,
> +				SND_SOC_DAPM_STREAM_START);

This will update every DAI, including CPU DAIs.  That will mean that a
CPU DAI could be flagged as actively capturing due to playback or vice
versa.

> +static int soc_pcm_dai_hw_params_at_stream(struct snd_soc_dai *dai,
> +					   struct snd_pcm_substream *substream,
> +					   struct snd_pcm_hw_params *params,
> +					   int stream)
> +{
> +	int saved_stream = substream->stream;
> +	int ret;
> +
> +	if (stream == saved_stream)
> +		return snd_soc_dai_hw_params(dai, substream, params);
> +
> +	substream->stream = stream;
> +	ret = snd_soc_dai_hw_params(dai, substream, params);

We flipped stream but nothing else, if hw_params checks things in the
substream->runtime things will get confused.  Usually everything is just
checking params though.

> @@ -1061,9 +1117,20 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
>  	snd_soc_pcm_component_hw_free(substream, rollback);
>  
>  	/* now free hw params for the DAIs  */
> -	for_each_rtd_dais(rtd, i, dai)
> -		if (snd_soc_dai_stream_valid(dai, substream->stream))
> -			snd_soc_dai_hw_free(dai, substream, rollback);
> +	for_each_rtd_dais(rtd, i, dai) {

This has flipping that __soc_pcm_hw_params() doesn't unless I'm
something?

-- 
Mark Brown <broonie@kernel.org>

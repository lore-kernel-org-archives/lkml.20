Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764198;
	b=YVIqwa7xh7g4/eG2bBV8JanTIWJUomcBRhpfZ4mYptTPjI9ywczX31HuSjYOcSIYOQCR
	 oFZRPZXpEuvW21C0zMOrh5mUbnwgPUgPrisjQl1K+IdEvrj7ihvsMlg9uZ/h68vX3VdZ4
	 jSwCETb/CtnHoKL9sfg8nvpFnb2naLb5qhU70anfl2NAhDcGPcykVAxvSHxctX5+/X7SG
	 mLYObGj5PqnhputykMSjkTQ70ggADuD9XcZYRgz8GgNsyxsBWtR957TvhghAkQLgUsmpQ
	 ovlSbRmjMnx0yILkVQYTUZ7pT70Ah4BdsuQ/0dCpFgQRWF+Mi0t2+TNZm2MfTuHrSgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764198;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yh6++frshBE1QaumwBxB0PcS1DRm4uywpNoD+jV9kuc=;
	b=gQy3gWMxRqFPu4i60CszlkRlBuBza6djiwixiaz5E2Nm+TCbH4xvDJbT06+55zgdeZ6D
	 7KpF9OeE9+WtaHkWvR1mOjxB/TOSf82Iy3B023NA4NAuCb1qgH60cj6W9RCTiobEx+c/O
	 oxh2jD9H84IH7MV19j/T6KpkdrmIaaxmK4rDPg5Qjam20hLPSRzXOy/qbEc7MXKZZMWQ0
	 ZYlpsiQ6JGxzt6OeswF1R7HzJJilQDyRgnnUtIpnOCfhN9XuPxUTGE2ADdxxP9kjYdHB0
	 y2F5NVauAfczffC0yn6cnGLwibK+h9+g88O/i4sEesBrzLbWa3B5Wqo7eVDT7AzkcDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYQDmM7t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E4C606A323;
	Sun, 15 Nov 2026 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYQDmM7t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FA91F000D4;
	Sun, 15 Nov 2026 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764197;
	bh=yh6++frshBE1QaumwBxB0PcS1DRm4uywpNoD+jV9kuc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PYQDmM7tJkMuuZm2PHbvWpU0AQc42MSl3Fs6tdMBI9OBU6yETAkTDx9WhZUQn4VOZ
	 MoaVRNbhXDXFA+ehcWfcP0aGT8bbd1mpO0tDr5R8aVP9gnahZdVeQtm0cJb4me4tIq
	 fwjKFB3LY7f6zYURSsf7+yYgg7mQZuK7ZVItuQPhDAHo5Te66s1/MLNmrM/Z9dXlzv
	 09H/u3VupJ5cXEUJZ8Y0Eqa8KcN9mJz+0ebAlwyHYvrAMVyOMVWQhDK7eenOhpfMMI
	 UchDzyUqsgX7Lop7W4AtDGPLPIQxnD2i5CMdXvJi+N99K2/saVDfQpn5C04K0jnibs
	 dPlj0oAOvomPg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7FE233386D16;
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
Subject: Re: [RFC PATCH 20/23] ASoC: qcom: x1e80100: carry WSA VI feedback
 on the WSA Playback BE link
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
In-Reply-To: <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 17:36:09 +0000
Message-Id: <179476416983.140154.148298781294201106.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=r6yv/JFGbDzg7kdtJx20n1PHKTVLOpEiKFiD1JfXDKA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+vp2w/uv8VwYSko1Tzu4xlZys0NbDceaCyKbO/qnt6
 vxcntdMOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRM1GMDHPjyjJuHiuI8cjU
 cA058H/1W9uot0rr0vgfi186ucg54Qcjw/65LwVvWhycduqx2xVPluJTPmJJKydERLe8T3rz23I
 /Ey8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Speaker protection needs the WSA V/I sense capture running whenever the
> speakers play.
> 
> Set multi_direction_codecs on the WSA Playback link so it can carry the
> VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
> core's capture stream events for such links power the VI widgets.
> Nothing changes until the DT adds the VI DAIs to the link.

> +/* VI codec DAIs on the WSA playback link run at 8 kHz, S32_LE */
> +static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
> +					struct snd_pcm_hw_params *params,
> +					int stream)
> +{
> +	struct snd_interval *rate =
> +		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
> +	struct snd_mask *fmt =
> +		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> +
> +	if (stream != SNDRV_PCM_STREAM_CAPTURE)
> +		return 0;
> +
> +	rate->min = rate->max = 8000;
> +	snd_mask_none(fmt);
> +	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
> +	return 0;
> +}

Shouldn't this also limit channels so we don't get something wider from
playback?

-- 
Mark Brown <broonie@kernel.org>

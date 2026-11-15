Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764191;
	b=xCICQW+k+YO9wAD5Ou3l6Jbii9tt2lMjSdA39H1veIruBPcU+Udd8rNcM8dsAhaLUe0y
	 0+6Sx+gGydSsOAjcj+2FlnToKAITaKSFzHS1By9DvrFPIbC93/Ud9UVVjCmIgDXfSmHiv
	 XJ4uTQotnQ48WdlErui6Za1L7uvzdufOk7B6CNPShz7MbIlroOBpQdnLWBe0qoJkaYwoa
	 tXcAezdqNj9vReqwoudJDhInHKiHEvvBDaTMOKvOrJaFcjFdKHKyq+RISoX4HGm2jqmIc
	 E1C3ULDNTRt2h8blvVyY1B6GekaUfuubtVVL/87aDW/81hmU5R619RGMIL/8fKeZzOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764191;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6h+Ha7KN9XM6xvLvpRCSysZazxM/mCu+d7EvNfI1Y0E=;
	b=vshHj0Rn7dNzAaW9OonLgsYVoLjZ7NImQSumYYaQCWaF+yYHuAmQZ6RopJMwmkSq73Tw
	 9RT3nLvts/JagPhXjJ50CURqXHXCvnQPqfqwT5kOD+xdxf9+tv93wDdsS6YUJ5s+27MhF
	 HIEQdBdjIIGGdIRGpu+BA276KVM91K5OE3O11LLPktdJQiQZzXZUU9uauQSeLK6B87S8U
	 ilUows8s6I1UC9omevsG0UlntgzIu2St9F3uGR423h/ogSlD/c5ETscDDO6PV3E8m74oT
	 tFVwdEhFTt0pYe4kwyC9FeQyP2mP3MBrdCoIPTF2508VkiopDnZaDI5lYwrgNUDCk1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+zPLpQ7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA31606A33E;
	Sun, 15 Nov 2026 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+zPLpQ7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8271F000CE;
	Sun, 15 Nov 2026 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764191;
	bh=6h+Ha7KN9XM6xvLvpRCSysZazxM/mCu+d7EvNfI1Y0E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=T+zPLpQ7278r032+a88JLxD8auqDE/jPGitgDHhC+FX8tyTlxBDfm3IstwpT1XgMc
	 LMihRwijaoHftFZF7SVZ64hsmr2QaeOgDWaAlJzPP4E87vjsz4dRm5pfke5EN9e80q
	 9FEJIR2uyDKpEm3ZFO1wqy5y1jnj+t+1aKJhJbxliXH+Z7k/HgW8uwjpRGSBK1m78a
	 fJ40mGGsLSVQJhDigYI41SXCfJNRyelneVzLiYIxdpYsJro6d07r4QocE/KbKrh6/f
	 /+ZqbTgbpqtlbys2eErnqzK+ZVUpKx/rNmLiVM61Rm+WoPB9ARJ66j1947HRxK9+4j
	 PX6/i9exTmVfQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7BC5F3386D14;
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
Subject: Re: [RFC PATCH 05/23] ASoC: codecs: wsa884x: add VI sense capture
 DAI
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
In-Reply-To: <20261023171433.820092-6-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-6-srinivas.kandagatla@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 17:36:09 +0000
Message-Id: <179476416982.140154.10822957842494469444.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q3/1p6grUh3xccQDiW+Hn5ZbDJ7BX+yEQqit7SJ49CY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+vp3wXu689JVXHZE3gyOWatsJrGL5+S3XafkpQbvEw
 Oo5k/O2dpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiDqwMf8V6pps8dT1qaWuQ
 7XkqSyhqgbzGDHvxPs4bj7aUeh5elcTwvyqAve8VQ1z7nPt59XsmyLto7vw/ZfWpfzzyU/58t7d
 K5wMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The VI sense port carries the voltage and current sense data that DSP
> speaker protection needs, but it is described as a sink port next to
> the playback ports and has no DAI, so nothing can capture from it.

> Make it a source port with its own capture DAI, ops and stream runtime,
> and leave it out of the playback port list. sdw_get_slave_dpn_prop()
> searches the sink port properties by count, so pack that array densely
> now that VI sense is no longer in it.

> @@ -1795,7 +1826,10 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
>  {
>  	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
>  
> -	sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)

The VI DAI has it's own ops so it could just have it's own hw_free()
which would be a bit less fragile/surprising.

-- 
Mark Brown <broonie@kernel.org>

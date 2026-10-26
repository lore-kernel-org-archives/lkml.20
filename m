Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041759;
	b=4pKQzU9zMi7KZd81Il/kTu0t90mJahAKh9v9INYvHnhQKUtK8U0N+rvemHczIXui05cj
	 ffPn4ZTGAgU+Erv3AzTymcc0WutjylzQ89TkTX7NigV9LaGiOCr84e5/C7DgeAMUi88JY
	 NZrP5YvQZ15uHFIyuhHc2uzKRrvSOgLCHTeSLbvmv/jrvNXEovXeyejv9wRE67jVcdWni
	 FKaATLA9vZJU42tljB3jwtRqK8o0YgbJYtED9cqzidurKvCxddd0TY03LezaYot2hI9J9
	 tvqbswG5x301hAGnLyhznAJatSBT3T2YaFvNl1AOD7rEqak4SWuJC3MTiLRG98MitJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041759;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ufKolKQVcCZRQfdZvXHcSVroSzOtiquB8umFqcqSlhc=;
	b=d0hZQ609VZqNWlDdiSlYfcvjM0uO6ScGivEdnpDA/UWxcAIIEJHYfnlFVyvIrvia5sFm
	 SGCFsI81xFAumCuxS7ZgspXiOAMP1SQquodOiOmlovIacx9HYGzfTMJT/yPbHvI8/GyO+
	 mz7mHPRlzNVKlhIR/sL1gWthpa7YodFE1QobPNRMaBOtQ0L7R8awQuqcNz2M64iZgRb5Y
	 OLbluSxbpCmOMCJnnGjjCbgZlaRyE9oe1YbBNiniyvM26hLHnzJ0zZ0ViOTbmuTvzFnzf
	 FK1AeiZpYKs3sSFqlbBBTSiqR2tQwS0un5OSx2WZETbQE3YHp+GNGULHeypMTNpEh6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b4+b/nF8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB762606A31A;
	Mon, 26 Oct 2026 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4+b/nF8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657DB1F01825;
	Mon, 26 Oct 2026 19:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793041758;
	bh=ufKolKQVcCZRQfdZvXHcSVroSzOtiquB8umFqcqSlhc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=b4+b/nF8DL5zXieShpsfNydbnpoXtVWEDRqfxm3Lzz5qbHUkP9IB84aZf6U3sLLA6
	 k2uxhnBKasDaAxLv0KMXlQCCMtQcX2ad0k4QFF0cufSQpm6Yms8WkzFP9ooCE6kyV6
	 4boah/Q99/uudP+ATa7TydwAhO0ePegUwhAYOczC3T9eMCDEFC0JUwruhJMCr6mFQP
	 lJPgvEFbIW89xWw+wMCPsUtXeh259MnIyieIvRnbKWIaRkct91+9OcOlCE62deqZhb
	 rY16X4CLbU3wNebzBMt2HqKKKL6n5NTJuL3zoELlycu+HFTrpSizkz1+Fab3anFqCG
	 h2+8k66sziPew==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 983441E90E59;
	Mon, 26 Oct 2026 19:09:04 +0000 (GMT)
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
Subject: Re: [PATCH v2 5/5] ASoC: pcm179x: Add support for pcm1975
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Cc: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-5-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
 <20261016-work-v2-5-9340b9555fbb@amarulasolutions.com>
Date: Mon, 26 Oct 2026 19:09:03 +0000
Message-Id: <179304174310.199157.17471232393944903445.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cgwC2O16k4wsYmJoGgi9KUgJEgg1loweLeTIZ1V/qVI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLuLw04+tL9SfrK50JhV/uexbyXPWozqXzBkvleDW+mb
 ElLPeFv31HKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJ1HQzMky/9ql0ieDMQ+Jf
 LI5nXLJpOOsjpKI8nzWbK6HM7rnDCjVGhtU/rs8pWdbxtpjh68K7P25M3ZFgeaBgBXvqebv5O13
 ClnIDAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The PCM1795 is register compatible with the PCM1792A, but it encodes two
> of the register 18 FMT[2:0] values differently: code 001 selects 32-bit
> standard data instead of 20-bit, and code 100 selects 32-bit I2S instead
> of 16-bit I2S. It has no 20-bit format at all. The PCM1796 shares the
> PCM1792A encoding.

> +	{ .compatible = "ti,pcm1795", .data = (void *)PCM1795, },
> +	{ .compatible = "ti,pcm1796", .data = (void *)PCM1796, },
>  	{ }
>  };

>  static const struct spi_device_id pcm179x_spi_ids[] = {
>  	{ "pcm1792a", 0 },
> +	{ "pcm1795", 0 },

Don't we need to set the driver data to PCM1795 like we do for the other
DT based entries?

> +static const struct pcm179x_fmt_table pcm1795_fmt[] = {
> +	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
> +	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
> +	{ SND_SOC_DAIFMT_RIGHT_J, 32, 1 },
> +	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
> +	{ SND_SOC_DAIFMT_I2S,     24, 5 },
> +	{ SND_SOC_DAIFMT_I2S,     32, 4 },

Does this line up with the constraints advertised by the driver?  LEFT_J
and S32 isn't here, but S16 is?  We're also not handling big endian.

> @@ -191,7 +241,7 @@ static struct snd_soc_dai_driver pcm179x_dai = {
>  		.rates = SNDRV_PCM_RATE_CONTINUOUS,
>  		.rate_min = 10000,
>  		.rate_max = 200000,
> -		.formats = PCM1792A_FORMATS, },
> +		.formats = PCM179X_FORMATS, },

It'd probably be easier to just register different constraints depending
on the device rather than having constraints in startup, you'd get much
better reuse of the core code that way.  Dynamic updates are usually
done for things that can vary at runtime like clock rates.

-- 
Mark Brown <broonie@kernel.org>

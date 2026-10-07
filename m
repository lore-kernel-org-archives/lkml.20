Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C2B1A6836
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362932; cv=none; b=Bb5SKidpRlL2tb1OJURUNkT0Dm+SKwCOGEKMqK6C0e/j/nlXEuv25+zn8R9Rf+mOOJjaVB9024jQx3RRZQry6liPFWSVruCQhkwOO+x15mXVt2sWFf+GGP34PmeAPCjaeorVvce9CzqTnYit/VaLpO2xTD68y5XdL/AjggxN5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362932; c=relaxed/simple;
	bh=tvHMtWvu0zmrav+lw/jlCu2bboPKX/L6uOXISQ/b0RA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pWbMyiqxXhaNEVMojgJnomGeyu3XJSJLRLF0B7nNqtO49mnEHvLrpfhUfmnNTtK08mb+On2GuWEEq7tN0h4NifdUkQfXfHoA1fcZETSdnSv48P92yvdULhlcy6v5bH4vNWGVayT7myUdakqCMoCHC89UsepkEATHvIfI3s9yW1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AfrAUEb+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AfrAUEb+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so36346695e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362929; x=1791967729; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3WmTcY7Cx2LB7n34xA1mszrSAOkEucT8groA+9/JLE=;
        b=AfrAUEb+0bmnxLbMxPSFLDRXtKdHdCVIpPxSMZwdPbo7L6KPc5mdCQKAFHskqAEf/N
         9OZbT4VNG60HmQxW7owGfjDNpyV2xGg2UocGj6y4SwMrIS6KAanCKiP/K/pnqcDRGpBx
         WnVGA+jC30NyfJNPbeED/nmj6YdUPGZNoq3JhrOWlHooYmBu7TGxynCpIFT7NW09AyRB
         WGokmM8L1cgt6eTspDEb/itFAYMBO1JCuQYd5ZY9eF6/WRRPXGnmCUcGcCosMHsya1Jt
         MxwOgiOfZq+3WZm0ElOMRzZ3tyOcxta5BacU6qUJX8tcnTIOTUy2qrgxnS+6oql5p4QK
         l9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362929; x=1791967729;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3WmTcY7Cx2LB7n34xA1mszrSAOkEucT8groA+9/JLE=;
        b=qW/6Rx5izgYU3ODCPUiz0B2sttf6PDWklGjGdq3l2wnYjEYvnH9qRenTFjIRdObAy7
         7rrK7tVmeQieG2H6+CHPSihKVAO3QE19pkEavKErRhy8hJvAJYKbpxswW47VJoQJcgIL
         ymxId9E6YEWn0GNCAY4rOb94XkAx8q8QeA0U5n8NqmRJHK7bTJ9dCoVg+j7WCDXV+Vxb
         BR2F7ypRaY/yO7o3MRqjs562GpAINF0MS6y/qkaiHB3NxiutSfsIGuzOIC7mUdrhkCqv
         jYjDkwcYZ71sCkAxn/E5SDKUOmChaAUylt8KLi+5XFrjMtiDo0gqAiKzyV/PyN/jiGmv
         Umcw==
X-Forwarded-Encrypted: i=1; AKwUvBzd+eS82KWBUZqkFnR9MBCzjMH2GaxsbtbIAxxg1omc9XvG0Kz02p4iwPyX3x1kfcKT+ocvLRBz/XGsw7c=@vger.kernel.org
X-Gm-Message-State: AFuF++kLFewvIO3cFJXAZUPJ0Yvj19Rzkjid3vjnk8rwySehAbAA62Fj
	DvH9OcQKW6h09zy/XhAy+Ef5gTcJc2xTZ+fg2NVD2VKvHFBz1+PndG+2BQGKxGCsSIU=
X-Gm-Gg: AYBFou27BRJ8hCegTxlofZq6VlWlDgElOUXSZRWzpthhCr9ZUyEbOrVFl2kc0nfzx9h
	WY9NH3FfExup9zNFasp+Hmu5QmuWGrLPIs4rsPpCFKUgAOANg/GITH0DdrnCPSnqHdldNQMij7q
	Bdh8QrAF+/1VI3Oi7JnXe5QHTGCrhZ0M4gqZcADnq5OhCWYPFKXejQBYHTcEFLPposfptfkoAc5
	Z+Hg64cDGt7UITeyhR+Gv/X9Ui5c2pwt/suENeGGg6gbeqzEhVko1J+tlV1o4Jas5kQXJqmGG1c
	uodxrBrk7ErVRvceMpiBnaM1sNGTXqb/Tnuw3TAlGBNRSblkmHRphMu0R5d3O59bUZ5JZnJBOjK
	y/9uGkm0d/yjbRiZwhmnaSs/Y7UXRhf8wCEiyhRS6MipRjnC9DSqJGQm99mGW3gzYo2yquXuT+L
	/qUDfrtqBDP3scVp4hT0zildXramt1jS8oACIoLuFAWcG55s1jkL5GsLvlTIWJniD3MPU86Zosm
	vac5ZF8YGCp6oQ=
X-Received: by 2002:a05:600c:4687:b0:4a1:7811:6cc4 with SMTP id 5b1f17b1804b1-4a180650943mr24592905e9.34.1791362929425;
        Wed, 07 Oct 2026 01:48:49 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f558028sm58745425e9.10.2026.10.07.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:48:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 5/7] ASoC: meson: aiu: add I2S Capture DAI
In-Reply-To: <20261001-audin-v4-5-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-5-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:48:46 +0200
Message-ID: <1j33uhzyj5.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Add capture stream to CPU_I2S_ENCODER making it able to handle both
> playback and capture streams. Captured data is formatted from
> "audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
> FIFO and then bulk transmitted into RAM when the FIFO is full.
>
> As for the naming of the stream "I2S Encoder" is kept as base following
> the same pattern used for the playback stream and with the goal to minimize
> changes.
>
> Supported format for capture is currently limited to S16_LE because it's
> the only one that has been tested. According to the manual also S24_LE
> should be supported, but this is kept as follow-up.

---

>
> This capture support also takes advantage of the following commits that
> has recently been merged:
>
> commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
> commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")
>
> They ensure bs_quirk and rate symmetry across playback and capture streams.
>

I don't think this part of the description is necessary.

Apart from that

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>


> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  sound/soc/meson/aiu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 535fbf7c1639..14d0e20a4bd6 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
>  			.rates = SNDRV_PCM_RATE_8000_192000,
>  			.formats = AIU_FORMATS,
>  		},
> +		.capture = {
> +			.stream_name = "I2S Encoder Capture",
> +			.channels_min = 2,
> +			.channels_max = 2,
> +			.rates = SNDRV_PCM_RATE_8000_192000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		},
>  		.ops = &aiu_encoder_i2s_dai_ops,
>  		.symmetric_rate = 1,
>  	},
>
> -- 
> 2.47.3
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

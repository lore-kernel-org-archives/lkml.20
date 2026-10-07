Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450CF392821
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362664; cv=none; b=eIRLY3T2xBLswajG3ScdvjDbPQ5TMjviBMZvee6/yLi5CAU+emgrqVI2qnthJ0h/B8W378jNHzsDj30MKq7nYlEjXDZ+3IJ1HVC22CtiPMmi9fBM79dAZgItfyFSBydWbb0XZgus5mjTE9G+PjiPQgiQE6EEcHBY9utEKU4yck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362664; c=relaxed/simple;
	bh=f8ppXImX9GLqJ3LzAd8aDPZLN/xG7aYwJiHdu4ZY9Wk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MWJeVWoeJRPYaT/H0QhJS4Ir0t1ex5HIr5uNA+UI9y3onXKox7Bdq5mChWzg/+kcqxPgghI4BXjdeiAQwhmLbF4IAx4L/ziBsVmCDwD+UV19p18tewmkMwk3O9s8pDxW3S4dEiErNloKOD/W/4a5I3Ypa2WMRgYH0JWBnWdVPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JN3mBNSV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JN3mBNSV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso11619615e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362659; x=1791967459; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLN68owvefwcvtwIzXYYcylLx8/qFYkuAE3rLVHaimo=;
        b=JN3mBNSVSwenIz/qJPuDq0Iqebo+wWdCZ2I3D2O9SbzYA13+eHsUoS25iQIiE67qXb
         gmY6gal0iZY9ElfZuupbNiMrJ1ru4SX5xAwHUFWRvt7g4rKyrXjuD9TzQlukgowYpd48
         lU46x0HNz2rg5f9DuV0lz4cM692+d67OMKuA8+uDZwQ6OhkXHF929/ud37JNzNbhx8BB
         g9p21hvKN82RAyGJXNPJJmyOo87dUQ3z1Qz3YXv8MW85kqHs8xJs7SZlAHIyzQjYZPvt
         3O6ML226fmuNve4t1C3vnGoBrI5LU/mkSb+6iollPVopyrWNIOq/BL3xd0J4MO8cFsNI
         T/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362659; x=1791967459;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xLN68owvefwcvtwIzXYYcylLx8/qFYkuAE3rLVHaimo=;
        b=Hpzxal2YwIFwdXysAloOpjw16a0PZ7m3FcRM0S9VFaFUADqGzS0zfDRoiNQYGZO8rm
         kYkmuBsNx2pPcy66SZoOmUzs0QtQnzkffwWckHlokvHoLydyuxzhqrPgzTHfESx4d1wa
         MyT6mwFjel3AmwBuPYqFAZ3s4xbjG/5RmMlOqKHcy6t2joAOYa9Vg85/HWZHvSGBCaJU
         DwpOK7d80XnCOfjv17P/5joWq0P2bVrLk5VyXwqzMqIgm7kPwX9ZkU3uyM8DC4EQPLZz
         75YVduTi7r+Iy8k8N+2CYG3jhAUfrEgGGJuopq+M1T1pB26HsrbS+g1oqCBRBdFlyWur
         5NtA==
X-Forwarded-Encrypted: i=1; AKwUvBxt2tBRLiXFs2JaERxaBD/2OqVjoFpZoSVkHgty6Ov15rBBgsEPY8P5kXq5SPJEnN7CwrBIbg2Ky/wWkms=@vger.kernel.org
X-Gm-Message-State: AFuF++lpCfwqM1QxYerxwiivwjApxFwwV4hlvuDrIL6FOrMXWvuZdxRi
	fTFmbPKbalp+q7e1yHJzUrz+r4yOWnEd8MFad6CRqWdqDo8M0cLrJ+xI5kMWGuM8o6Y=
X-Gm-Gg: AYBFou3vOy+CHldQDMnFcGnHRFifkmWKkMe74wKzwwESJdru/ox+CKtIzWxiTJcffwV
	KdisgOVZOCl9P4P/Dm3KO/xw5lkSYpdAif4XnEbvddaLftvvwUZyCoIqIFvCWt66PugRo01IZt4
	fM9oKt0hSS7wxFaTsJ0AfaVTxVGUCFuzWqCuyEa/eIG0prtAuCLR0zU5uyEglIg86drWrfQBIWn
	2PJnDyDhtbx3F1MtYzpC0XPcKcNBvAdSqMr1O6yQB6dqfRxQY0xMW3nP8PtnRGSpaqty5tIUGKu
	2AFIZAR19LOXlAzXeSuCp26ra/CpKjYNAA85paMvx0b1+kxVo8+I7E4VEUFu6P2IT+Z8fpnKFyX
	SJn4cfNPXckoLSq7Ba+fUT0y8I8HYkI9MM72o8iztIJtVMxogoB4kGNmNE1rkBJYZOnByUflyyX
	k/qS4evL7AiGQnPYCwShNTHnr67K7T/TdLawmmA2eemalFoq987GDeJOOGBb1CLuqToDuTM9t6C
	Z3y3Jf02y3XnYQ=
X-Received: by 2002:a05:600c:5397:b0:4a0:258a:b25c with SMTP id 5b1f17b1804b1-4a1806648admr20104225e9.29.1791362659071;
        Wed, 07 Oct 2026 01:44:19 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1803040cbsm25745595e9.4.2026.10.07.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:44:18 -0700 (PDT)
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
Subject: Re: [PATCH v4 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
In-Reply-To: <20261001-audin-v4-3-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-3-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:44:17 +0200
Message-ID: <1j5wzdzyqm.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> A recent Sashiko review [1] on this code revealed the following problem:
>
>   If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
>   and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
>   snd_soc_dai_active(dai) remains 2. This skips disabling the clock
>   divider.
>   When the streams are subsequently closed, the ALSA core skips invoking
>   hw_free again because the state was already changed to
>   SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
>   enabled, potentially draining battery or blocking system suspend.
>
> This commit resolves this problem by using the 'clk_enabled' field of
> 'struct gx_stream'. In particular when 'hw_free()' is called on a stream
> the code check what is the status of the other stream and then only if
> both are off the clock divider is disabled.
>
> [1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.org/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index 58dce9f08c9d..70ea39c77b32 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>  				   struct snd_soc_dai *dai)
>  {
>  	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);

Not sure about peeking on the other path like this :/

>  	struct snd_soc_component *component = dai->component;
>  
> -	/*
> -	 * If this is the last substream being closed then disable the i2s
> -	 * clock divider.
> -	 */
> -	if (snd_soc_dai_active(dai) <= 1)
> -		aiu_encoder_i2s_divider_enable(component, 0);
> -
>  	if (ts->clk_enabled) {
> +		/* Disable the clk divider only if also the other stream is not using it */
> +		if (!other || !other->clk_enabled)
> +			aiu_encoder_i2s_divider_enable(component, false);
> +

Looks like a race condition is possible here if one stream closes while
the other one starts.

I think you need a common structure between the 2 paths (with a counter
possibly) and it needs to be protected by a lock. 

>  		clk_disable_unprepare(ts->iface->mclk);
>  		ts->clk_enabled = false;
>  	}
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

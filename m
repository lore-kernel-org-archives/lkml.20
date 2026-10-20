Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515179;
	b=Umf+NsvVxDMNr9E4W6P3i6IqpPS0lSmz3Th5HAigNQTvRFD/99bdYr6z89JDvc83kdE8
	 8b2NwNeFDiegBLOcaA42K9hPJDco5Vvy+LPTUjSUgBJvR/cmxfKjapIGPlYQMiHuLEcAi
	 7Abg5mPtVsU8+leSYpOxG5FmJaL7Me5Hq50u8f5P1EZSF6bQEvefFNgqibDozoaPLM5xy
	 1hk8BWNNEShu01SAzXaa6nWuO9KH6iESxcj+xLdl3bDgRbal/btrpwUE1nr8pKZUanTTx
	 4IkPLZaDHhipKbK0BaEsjWYvKfzphGM/LyUoU3r8/ItDIwGILJMhCTZjMBmbgVf+D2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515179;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=GLdXsNmeIbjCOijJh4ieF8NftgaQHDTYB8E1f/WmycQ=;
	b=OHoHdx4lEI464yRSx+2ou5gAs+3cyRSu8CHHk+N79ouVkwcqm7MypnIX8BjuzJI34qiX
	 MtTVqCUpIgyYAgP9QMavuJFETQmtSNMEGLx7qfvhmFIcy1NDD2fEByomY47+hniOddc16
	 /Y0NDMvuRVO6a4zmVyue48GLUJwHdJLgO5wrfrwcO5/hdRfl9u7g1QVOlltlgBWV4+u+9
	 PgJD9aPVdLbVn27aktoRdzNw/f54znLAXBRdKgFHCFFMkZjarWHS5PDC59qmITKcHINDn
	 U25kqEzNOP7krcBi6quJ5U3Lf0ir2hhMXBA4j/bFuGJOkMZwCO0akm5AMMm3POUoldg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dYVwCpdy;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683C60A2615
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7683C60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dYVwCpdy
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2517D4E41292;
	Tue, 20 Oct 2026 16:52:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7CE960393;
	Tue, 20 Oct 2026 16:52:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6FCF103289A8;
	Tue, 20 Oct 2026 18:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GLdXsNmeIbjCOijJh4ieF8NftgaQHDTYB8E1f/WmycQ=;
	b=dYVwCpdyD92wQz+JCeRfjuWXiDzWAHklB7DPGH8oFtwSYyloIH2w2wCvYj+YC2KtWJhezG
	mRYa6hyJ3gvlC5ZAlc8FZBU3meamkg06H4WIzPEFbMhFaBSGqKZy2SqjuhXcVqC2UkCP1D
	vo0vR1Z1Z15OLOntYCooWWpaXnPLVXI6zav//wE3J1OckY00w2ioPDFernM6nveeNSQWnT
	07LoPl4YrxXleLL4QVudzZae3uYVHUfOzitFpeRtQ3gNOA4tyJk0s/LRGPeh+9PIciU9U7
	Cn077/qne5F3Afqm0uLrtuOB6JhtAfbntUSHQ9Fcb0jNVvrRTpIS4qlII+4yEQ==
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
Subject: Re: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>, 
 Pin-yen Lin <treapking@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509978.78870.2485132679226608837.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> REG_AUDIO_INPUT_FREQ reads back 0 when no audio clock has been
> latched, and it6505_read() returns a negative errno on i2c failure.
> The debug print divides by the readback, and its arguments are
> evaluated even with debug output disabled. Only print when the value
> is usable as a divisor.
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index cf2cd59625d5..0d2101432416 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1623,8 +1623,11 @@ static void it6505_enable_audio(struct it6505 *it6505)
>  	it6505_set_bits(it6505, REG_AUDIO_SRC_CTRL, AUDIO_FIFO_RESET, 0x00);
>  	it6505_set_bits(it6505, REG_RESET_CTRL, AUDIO_RESET, 0x00);
>  	regbe = it6505_read(it6505, REG_AUDIO_INPUT_FREQ);
> -	DRM_DEV_DEBUG_DRIVER(dev, "regbe:0x%02x audio input fs: %d.%d kHz",
> -			     regbe, 6750 / regbe, (6750 % regbe) * 10 / regbe);
> +	if (regbe > 0)
> +		DRM_DEV_DEBUG_DRIVER(dev,
> +				     "regbe:0x%02x audio input fs: %d.%d kHz",
> +				     regbe, 6750 / regbe,
> +				     (6750 % regbe) * 10 / regbe);
>  	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, 0x00);
>  }
>

By just looking at your patch and the current driver code I'm failing to
understand what's going on with the REG_AUDIO_INPUT_FREQ register:

 * it is read, but never written
 * its value is used by:
   - it6505_enable_audio() only for logging: is that logging really useful?
   - it6505_audio_input(), just checking whether it is 0xFF or not; what's
     that 0xFF? Is it documented? A macro hinting at what 0xFF means would
     be better than just '0xFF'

If you could share what that register is for, it would probably answer some
of those questions.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


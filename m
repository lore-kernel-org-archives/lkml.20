Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515168;
	b=rnQKYnjDBXFQry/pbsQhHSVNgA6pOHXVzkFF83pqHGY0J5JlHCCI5xR8UuxrWR+w8ehg
	 XzduwYAyJL6NdcUpDICVR5epA0+j6NNSqYlcdZafli2w/I/GNNOI153ctinj1+KB6HY1s
	 caWaxY7zaEP4eE8DFUbKDL7tMHygnE99PI43PIsADr+MFTmGFba1iQKDEbtkw/bEWj8w+
	 03xcXnPOxVF+qZbKrlaTR9WLFocfRXddTwx1c0Qad642xIgn38gtd3LYO+ssYomNyXf8f
	 monrQs3C9yiMQSPfWpZyJHMyWaYjICEWvLMeydjaTNfFR98OdEnPX5YyZhfW/J+SYBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515168;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=JdOLrX7Vbro6mz+D+OPkX1mbllMUobn9e9VhBO0BxN4=;
	b=fBLCONRJ2poRSAqMM02b708xlXHOcyj/NnlAC4Z4uYzX017pg4x2MlCR+tCSDhbAHWFe
	 0E5tNR7MZsyss5jQ2U2ho9XLGgpvvQ+EKB1AlbrGN4+zc0VLn82hEGX+ZfbKYkQZTLbUO
	 2KkNUToOdVni8z7uOZEanCFUzWzSVXsLVy1HvVmRvuAXtIy8fRXz8FUeZ5YiGXNCl+Y8P
	 8IwydxsHP1Dd3UFXnD5HPSMj7nYFbsynvnt2XJvFUIIKatDkprFmG+D9q0paE7pBV1IN5
	 z7udQjVpnp2WOuqRCIxHvyvZJVVvug1cLSzasXamy7Fxa15sSrBwJzaYpfl++qiGexw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="kMz/KM02";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3CD606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB3CD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kMz/KM02
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8703D1A1298;
	Tue, 20 Oct 2026 16:52:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5874560393;
	Tue, 20 Oct 2026 16:52:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC61B10328E3D;
	Tue, 20 Oct 2026 18:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515160; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JdOLrX7Vbro6mz+D+OPkX1mbllMUobn9e9VhBO0BxN4=;
	b=kMz/KM02Vd6xGxFEu3+ivkFmGDhDhyr4J8jcMsEUOV4wnhKcAxqqVk/Lho8oTU1EDAdJWg
	eszwLV7OlmzXKBZzrnMZJtGzSeCn8gmzh/+/0detapC6r8I65jU4ueEdTRKOf+x2rICJfn
	Oe0kLjtROzseab7yR8o1Kc5PcmHIm7SjY8v8lKRMwTl0atRAaED35WEjR4xz8FeGj0/RVK
	5muG3mNeT7qgMqCuaBPbmWuRUm3EmHtxOmTSWK6ovNMbYTQYAUZMJE/PB20Rwyzh3eDyf9
	OsfB6sGh8fK2dy0YKFMc2uSy58liq/TlMyiiYKmU90YPnaNPzxN4GYg8EM13Hg==
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
Subject: Re: [PATCH v8 06/14] drm/bridge: it6505: bail out of the IRQ
 handler when status reads fail
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
In-Reply-To: <2e003c2e6fdb56d03c3a6effdf090079afb2ffaf.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <2e003c2e6fdb56d03c3a6effdf090079afb2ffaf.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509977.78870.3399297204284524303.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello Daniel,

> When reading the interrupt status registers fails, the negative error
> codes end up in int_status[], where it6505_test_bit() sees almost all
> bits set: every interrupt sub-handler runs on garbage and the error
> values are even written back to the status registers. Return IRQ_NONE
> instead.
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 6fd8f5ba9acc..f249520ebd41 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2714,6 +2714,11 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>  	int_status[1] = it6505_read(it6505, INT_STATUS_02);
>  	int_status[2] = it6505_read(it6505, INT_STATUS_03);
>
> +	if (int_status[0] < 0 || int_status[1] < 0 || int_status[2] < 0) {
> +		pm_runtime_put_sync(dev);
> +		return IRQ_NONE;
> +	}

One first question it whether a read failure is realistic or not, and
whether you have experienced it on real hardware.

Theoretical or real, the issue is in the code, but I think a cleaner
solution exists.

Considering that:

 * it6505_read() does 2 things:
   1. check whether it6505->powered is true, else return error
   2. regmap_read()
 * it6505_int_threaded_handler() already checks for it6505->powered
   earlier, so it6505_read() is basically a regmap_read() wrapper
   cramming an error or a register value in the same return value

I would consider replacing all the 3 it6505_read() calls with a single
regmap_bulk_read(), making error management cleaner.

What do you think about this option?

Perhaps the three it6505_write() below could also become a bulk write.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


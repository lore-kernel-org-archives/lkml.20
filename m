Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941872;
	b=4zM/Dz9rnQ32DZsZMNhFaoQ/D/oPAZFX00diukTV2/s95PYpXq6Vl6TlbkrQJ+yLkSUO
	 TRK9adihh5f81W+HzW/zXunqhPwNZjjsHcWBwcKu2veEsc6NkhgqCzcSGpxz05TlZ/DB1
	 HP0S4QoK5RtMry/K2p3SCUNxZLO0Vqj9iLL5BSuy8+nngrT6pDXgYmVEPRGPhRkTmDTls
	 X4i0cOAHC2WE61iUDXg0Jr7i1mneDquIzbAzrEXheo3uzQi/0HTx9a41I2fDKJW3xtSB7
	 xhownCLN2XIZSTduK0oYnbNf7+VbvI/TMmPsgDu2Zu+kX63MI+1U2gV5dsN7VWnESUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=gr7m8Jgx5qFfXx97jCHm/dv2wdINd/6dtVxf1769JNg=;
	b=fZz3SZYfuEDJEs+7h3964DNMVwzfBEra96aG22X+6/u7E6/vhXJKYb/QF4WWgtyI3X1R
	 SL4jlXV7vJ7Q0irJNwhbpOiC58ygB2/HIXL+CXuYLK4uzRaqfb9W3bCKvfch0dZfIzGtp
	 2CLzYJ8gosfd/6FhDW6UQwIT0adkY+ElnZ2q0E3ArfXOPvNldP47lOZudb3NkyunAIXtR
	 xTBmqeGuGYHtRr3EB2ocJOOSUe6wmoVObIEYdnYREnxwTrNHZnz/naXBmKwYxqFM3BeN2
	 B+BwCTt6C1dNgDGoMfQ/vrhxgikz4jEmOX6EYBWmHoP3bossedGAYVx58Up+AVWmvlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jxj50wNW;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F8B606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F8B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jxj50wNW
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so17595955e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792941870; x=1793546670; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gr7m8Jgx5qFfXx97jCHm/dv2wdINd/6dtVxf1769JNg=;
        b=jxj50wNWDxFPMjbOATJJXdbZVWc7iBzBfYoA2Pwd7DOyllRETfZmqftcOeXuA2PYyV
         Xxy5gkOZySQr072FGWayPpr1FMYUia9mSVK3vhEJG92IMwuz88e2W2bBjxph8Q7rfrOI
         BoYdz+wi4pPi+f+RfhYcFBMldCbtn6OwYASejA+gKCcfSTsASy6xYo+Ru8J8bsSX7C4i
         EKJCXaXAZowji7Ni9HqvClIKJFdC34hFozv1rGJByjQu+whOgCdKG16ys74OWjbaFOT3
         xy6ZGYLyV8qqC8hiTDQKbRxb6pxmECaVc5xEnunTwFuGxIHT6RuSn99V482shM7CAzDm
         lTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941870; x=1793546670;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gr7m8Jgx5qFfXx97jCHm/dv2wdINd/6dtVxf1769JNg=;
        b=jp4R9X95pacjo2oH4Eboxl26bGKBKGgaHoOWR/GVvxs+UKW24SXKk0XYx/nOEk+J/I
         NgPBPozEr3JxXTNHC8Nx/C1BHOQXGa5I4dg1d4+RYdgpJ2VWS1cK/KnqhDoxaraxZxNa
         FcUT5D7exVEWGEf3VXP3Jj9gyXlkmII+j/uDvNQgUUSo3kA+WFwhmc5homsORexjaVxo
         IL43K7KbmkCoyU8kY4lh3t4IV3gnXd44sU25PEC+SXD6lklkdV1zKBD8io2hdRVfz64F
         DsNmCzru9ZUpcxAYnGUrEnR2pmPQNNt5WWdrvknCaxpLUVYSFWPc72QrC3i1MPOpuLbW
         fxvw==
X-Forwarded-Encrypted: i=1; AKwUvBzfc/jqb601+5K9Lh3p5dXIK/BB0ZBlaloaI8h1qvJg1zrgIvX717XTZPtAHXo6PXLqWj479G1gUfoFgDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa95B275zj/oGzU2VF5dQsexoLK4cerw0PjrSbTbr51TguYWLH
	FohfKrrJ1nKrCmgKaFH6MO8nmZ85D/HXKD5o8kvSQuWfqWpil2IzLvpy
X-Gm-Gg: AYBFou3rbNU4lejePwBbW/T94WtmxsL78pfohrp2sweHLOfw1AN1sKj83lFzcj6qGZx
	uuwDgJE0FZfCosuLz9NOnZKsKl3vTq/7nbWKDUD3RC09rWCK2sg4llJgpXvq2DdHbQWTwJQG9XQ
	9Q4cglrhvBwlwPdDAUJp4N5LYEAzIYEYdTQcLVyktp1bi2XZmM9pgv04ihnyu1cwtohLZ/SwNb9
	EDoze9wtfBLHKjmEfChj5/RrWNl9A8ODlanoe91yPECr90D86bhTkcSodK0/vlyOZolLk/sRnZf
	mvSs1jeg0AwPFP4n3b+97/z7fnWqf/LxZ/S+gHmAL29gDAToAelO4rdwwLb6Un4CgECmrHq0vbR
	R8o15FHxlOSYD87l1TF9JB2z5p1NRGEduA+s7zNV0eQmvPYGU/LKHeB6lgSBjvl15Obsgxx7JNF
	2SbmdqWbGGdb94yEt4/vZ4Imv2UKeNYs5u24lM2iOHp8b0UEIcjRYlhBYZSqienaTM0cWcjYawJ
	ClxM3XbXh1OIk0MQ0i5qHn2bA3lDZeXztnvK+SlKpWQCWgvPWEUOLXtlcaKit0sQb+QrV58NaS6
	gDfXciHK93F6E+M7m7yj0nusaHxsbex2qRRjaEoNgqE=
X-Received: by 2002:a05:600c:c0c9:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4a587b3e000mr20792825e9.13.1792941870382;
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm132982575e9.2.2026.10.25.08.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: use the lane rate for lbcc when
 lanes run faster
Date: Sun, 25 Oct 2026 16:24:29 +0100
Message-ID: <179294186960.4141843.10824416552753869438@gmail.com>
In-Reply-To: <sashiko-outbox-184251@kernel.org>
References: <20261025142639.3454322-1-romain.tisserand@gmail.com>
 <sashiko-outbox-184251@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 25 Oct 2026 14:38:50 +0000, sashiko-bot@kernel.org wrote:
> For a 4-lane non-burst panel using MIPI_DSI_FMT_RGB666_PACKED (bpp = 18),
> (bpp / lanes) truncates from 4.5 to 4, giving a lane rate of 5 * mpclk Mbps.
> That is only 11.1% (1/9) above the 4.5 * mode->clock pixel bandwidth, rather
> than 25%.
[...]
> If the slack is only meant to ignore lane_mbps being rounded up to the next
> MHz, should the check compare dsi->lane_mbps against
> DIV_ROUND_UP_ULL(pixel_kbps, MSEC_PER_SEC) instead of adding pixel_kbps / 8?

Right, the 1/8 slack misses that case. v2 will use the lane rate when
lane_mbps is above the pixel bandwidth rounded up to the next MHz, which
keeps i.MX93, Meson and STM in non-burst mode on the pixel clock formula.

> Should pixel_kbps and the pixel-clock lbcc calculation divide by
> dw_mipi_dsi_get_lanes(dsi) instead of dsi->lanes to handle dual-DSI panels?

With dsi->lanes the patch doesn't change the timing of the dual-DSI Gru
Scarlet panel: its lane rate stays below the per-link pixel bandwidth, so
it keeps the current computation. Switching to the total lane count would
change that timing, and I can't test it, so I'll keep dsi->lanes in this
patch and leave the dual-DSI accounting to a separate one.

I'll send v2 in about a week.

Romain

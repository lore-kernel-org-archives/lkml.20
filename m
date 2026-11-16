Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817551;
	b=f28ZjaDhwb24HIwOC8IdTXmJM7SzrIb+xT7kEXtr9PqZjhNV+AyMriCFH/7wPoilJpKH
	 N0r11O5Py2FzjodgMMMwad1VlrIN0oSinTRPhC6K9e6i7gVLdlmbcpQjf2fhJsiksN4rt
	 X4VfVUJU5f5Uf4CD+LzUb2G9hroulVby2Ec1Loa7u3ghYML+UJ+/ITokCfWN9cKfTyZrL
	 S9jbqHjIaLpvpUve0KBVJpk8OawxKS0KxGpiQexEFo3wPrmyqTnsyNb8N/VnhcFXiNTsw
	 pYBHuFvYfZR7f0vPZC5uWEK9QDCV900pgC7mi1OITVJoTXQq7rWtSi80Er3uwtxwUhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817551;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=utf42bCbfFS3IslODaudy61GSAzeDB4Px1KK0UTxdHc=;
	b=oLUUZRLD1sJKFUoG/sSNUjcJSUU10PxHMcPgoWazSuiMaUj9AWMxQYa2rMzWVxiO+Xgh
	 a+bMUYQ0IRa713L9PeecgZOTrktUBkiZeToeFrCLHI08hV/LBWDJ55W7u0yP/q+OD5iB/
	 NghKJsByK8xH6iv9IxVbe6c5B5xt2UqM5yCHVcc3CiE2NRv/M61LPdmL8DIRniPf+Zq5i
	 jHFoPF2Yp8CeZsd8rPAkrt9UOj17I0/mWuQDwRQtcG9RaoZFK8al8aKcrXKXr4pIHEhxC
	 bnGv2DAhMC994HWFiULywIU4RY2setOpJhlMXy76x9h/8T8AigtSS6P5n7v/RCI5PaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=FbkIcFZq;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124D1606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124D1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=FbkIcFZq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=utf42bCbfFS3IslODaudy61GSAzeDB4Px1KK0UTxdHc=; t=1794817550; x=1796027150; 
	b=FbkIcFZqKHOkH+aRKee888JAqbcHIPX8ZKcQWzBgUo7NvcRv8dBbDDDYSY9AjS9cjlqncf3I6ft
	t3e+p40IDWFJa6Y6zqmT4rI14B4P0D3b7EQoIc1Kp5VLxEIc2YXiHrhylFmk+w5WKCVcFgvac6wKI
	DqNoQLT49+5dh1MMnOHEPzlvUrgXpY9M2WEvLNRKAe++aEioQOHMy3PW0oVG05E4eCkF9ilT6CIrO
	4LBaEAXp6FtCN3mseiM/Who/KGWnM366kCzgWzDTDCO5Aog786Ew7DAX69u+OZWitAtOTMmHCXlaI
	VNjEu6qow982mY9rjJ1ncQfRHf2XQoWckr1g==;
Date: Mon, 16 Nov 2026 09:25:41 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 07/13] drm/bridge: tc358762: Update comment about the
 number of lanes
Message-ID: <20261116092541.5e5186e7@kemnade.info>
In-Reply-To: <20261015-tc358762-fixes-v5-7-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
	<20261015-tc358762-fixes-v5-7-7cd721a6451b@ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 14:15:58 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Update comment about the number of lanes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Explanation sounds sane.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  drivers/gpu/drm/bridge/tc358762.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 19f328b6e798..fd82274643db 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -305,7 +305,14 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
>  	ctx->dev = dev;
>  	ctx->pre_enabled = false;
>  
> -	/* TODO: Find out how to get dual-lane mode working */
> +	/*
> +	 * When using DSI clk for pixel clock (only mode supported in the driver),
> +	 * the pclk is derived directly from the DSI byteclk via simple divider,
> +	 * which is either 2 or 3.
> +	 * The required divider can be calculated with bitspp / 8 / nlanes. Thus,
> +	 * for RGB888, only nlanes = 1 works as nlanes = 2 would require divider
> +	 * of 1.5.
> +	 */
>  	dsi->lanes = 1;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> 


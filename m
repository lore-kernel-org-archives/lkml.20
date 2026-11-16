Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817025;
	b=WxZRWa2t0Dgtw1F49H34YtjKvNJ7+64qYNaAlG9FgZd28gV1bRv1+VLZ0JN/w4VirWs3
	 BIpbLRzhnQtekcsQmnbQs1v7xI+m6IrgMfPMqcIcEBjFMZXhmpbbaH0ln8fCds4CE6an1
	 kgYkF7N1kQIZL8mXS0AiYgUki8FXLB1tcNfGaUZzu/KwmQYNPz+5EFB2EM9OTzFqr7WJY
	 TNKZCd7haTqAfbumxFRA/8zJMHyJ0VUqQWaXmyXoqsX7hlKzs5HLIwBrkjlBmvaaW6N3m
	 s5sP8JHVfOu2BwF6HO4adLqUJa2Erg/vmg9TBm3Dn1Q9kqisAinECUKC/kJyvR5EHfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817025;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cw42d6ZCptc5PSIS/Cy7d405imHq7uVLiZ3GFGb5rYA=;
	b=2j7oZ5ymYEwEr6iqA9QXSK1bF4xVMX9bpVskazo5izI3n08txZCCFrfzda83XbIOA9ks
	 FC51rm31Pq6XyUIOtXEMyOnsTRS4YS4dp8cKjxZIqTeoDSuAX33l837moWdJU/KdBe+p5
	 1PP5TAHPCcfoEpTJ381/4nLuQZXVxE37iNst0Tjqq5XbvuwFCf8uPSqKm4LCMJSw2YO1F
	 VP53kks8syCNKjZ/m2bL18ivI/xU4ACRHexW4I0OCIb9fJ+I4n7REINr6K5Qg3MdxWBZt
	 zcXCtoziOlG2oig5WTsblDQKnSFzG5nq6WykOfjJKfIpkkTrMoq9XVfHMst1VznLpKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=UYGE+3up;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2925E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2925E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=UYGE+3up
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=cw42d6ZCptc5PSIS/Cy7d405imHq7uVLiZ3GFGb5rYA=; t=1794817024; x=1796026624; 
	b=UYGE+3upzdi7tkJWV4eEc/CSyfeviaKXQf7ctltYXRWAvblpd1TycFr3K1lhiBDnbJT9jiPIvsI
	KrjVJsz+S9Csu65qK3vWRYhEi3h/i4ccQKU5fX3KzJuexuD/udollkyFbYsI5D6r0NpTSA2+ENjJ6
	lYP4cCWREReQfK4DUovi2ZdKdE7BlGZyq7+v8+nwW65VcBFoqiFnFSIBf7ULUok+/iPOIbXA3C4Ja
	vxitgCu6W5xH7hsfzzIvIVHUdaDrE5iyEJThX4LGFVxFDYwAEU1Ax/MiEhpXhHfn0uZWmyreLQBAK
	rY76oAsWpOUpyf0ApRLjfMfvHpMCXRZR1HQg==;
Date: Mon, 16 Nov 2026 09:16:54 +0100
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
Subject: Re: [PATCH v5 04/13] drm/bridge: tc358762: Configure SYSCTRL first
Message-ID: <20261116091654.26a56120@kemnade.info>
In-Reply-To: <20261015-tc358762-fixes-v5-4-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
	<20261015-tc358762-fixes-v5-4-7cd721a6451b@ideasonboard.com>
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

On Thu, 15 Oct 2026 14:15:55 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> SYSCTRL affects the DPI output and the clock tree, but we configure it
> late, when the DPI output is already enabled and clocks are running.
> 
> Move the SYSCTRL configuration to the beginning, before anything is
> enabled.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

sounds sane so

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  drivers/gpu/drm/bridge/tc358762.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 26671dc66874..f5ee781275fc 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -134,6 +134,13 @@ static int tc358762_init(struct tc358762 *ctx)
>  {
>  	u32 lcdctrl;
>  
> +	tc358762_write(ctx, SYSCTRL,
> +		       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
> +		       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
> +		       FIELD_PREP(SYSCTRL_PCLKDIV_MASK, SYSCTRL_PCLKDIV_DIV_3));
> +
> +	msleep(100);
> +
>  	tc358762_write(ctx, DSI_LANEENABLE,
>  		       DSI_LANEENABLE_L0EN | DSI_LANEENABLE_CLEN);
>  	tc358762_write(ctx, PPI_D0S_CLRSIPOCOUNT, 5);
> @@ -157,13 +164,6 @@ static int tc358762_init(struct tc358762 *ctx)
>  
>  	tc358762_write(ctx, LCDCTRL, lcdctrl);
>  
> -	tc358762_write(ctx, SYSCTRL,
> -		       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
> -		       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
> -		       FIELD_PREP(SYSCTRL_PCLKDIV_MASK, SYSCTRL_PCLKDIV_DIV_3));
> -
> -	msleep(100);
> -
>  	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
>  	tc358762_write(ctx, DSI_STARTDSI, DSI_STARTDSI_STARTDSI);
>  
> 


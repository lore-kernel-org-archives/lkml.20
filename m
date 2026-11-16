Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816140;
	b=vZV7KgEUegCjfFHHGpmCKczl8Qkp+K0IvXHixLfHe5vfegb53TOHPuD3ltO+ZljFi1Pu
	 eV+vKAbhlLLyHcNxMmYvx2zyQG8Y4wGzsXSycQ8mhUi1F1lOeHAlGrsuSmOo57Ilm4bHS
	 5Oh1kuzrS/6EItWTf7w3tPWMn7eyTbV4uehQr5e/TAldc1ZB8s+6Zev/lvlaJGQ1MXeTb
	 NcfUxhXRVCo38F7uA1GCw8qdujac3cMsMLrAnFKab/Sz/veTPXBHXw3q0SdN42/+gvmT9
	 qIwPOEtpDWSpK8tmEArGvpo+gqxCXj2i2+p3Ivp1Fm8J5lG0vEhC1ub+ZlSVItpCGng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816140;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kImUUDUMbJNjcB2Ehox7k7NTkFpga3rhi0U9FNipmLY=;
	b=qqStKpfJCnzMHcn2JuQO9aI3uotBUA3+T7jkMP4eJngu485E9xkFmfpkUZdm6uLiK/86
	 X3LQ6SI4Q4YKVq92qjPu3kkT0Wj78vxCb43brlKcmkLQRvKXfG2OAsiq86eXXseYeoJ2L
	 3ZBm+t43uJDEtTeA3OXfEwNvEG3m/8N+qh4qIn12e0yLGMF4OBCEJHePC1dBk+r63imJv
	 37GcDHIPo8SKbYNJ2YYn7tV3yO74cPX60066argkuzFRnDau7pXfYEYiH2IHlP7yT4y9T
	 5VO6zrYxrjUBdgloC7HBHArML4eQLrPJeqDjfAR4gMVlWtmesE+IbWh3beskb4ZPywQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=CY3EVaHf;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B77606A895
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B77606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=CY3EVaHf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=kImUUDUMbJNjcB2Ehox7k7NTkFpga3rhi0U9FNipmLY=; t=1794816139; x=1796025739; 
	b=CY3EVaHf05B4oiohet9vOthUsJoybjBJvI/f714nMQG0y6sNNczGDJ0MPGnHTnFC1aScKtmAObq
	SEjVjVWbfwQ6dp3f03jXwTPKNWTEcoPQWxM4AWqODImmVf4eUeKX42njEzB8JhVglM+Osg8VVzAWp
	9gA1Tdgu+343/+tsjh00tqkVDTBZhohMf5jmAEJw/plzoTUNYcwdujGDpj/TbUVc6RbMy/2/zX9Un
	IDTPxTaFkzZ9uU+UbiWW1ITC4pu3QZhv2VkA6AGSPZ4rYAKCuRuDVmsvaVlYMbu0770Aoy885MGJG
	zUVFfvIV+tOIPMGgfyYFm4wHVNI2tj7UgeUg==;
Date: Mon, 16 Nov 2026 09:02:06 +0100
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
Subject: Re: [PATCH v5 03/13] drm/bridge: tc358762: Improve LCDCTRL defines
Message-ID: <20261116090206.4085771b@kemnade.info>
In-Reply-To: <20261015-tc358762-fixes-v5-3-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
	<20261015-tc358762-fixes-v5-3-7cd721a6451b@ideasonboard.com>
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

On Thu, 15 Oct 2026 14:15:54 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> LCDCTRL fields are quite wrong in the driver. Fix the field defines.
> 
> A few notes about the wrong fields:
> 
> LCDCTRL_VSDELAY(1) actually sets LCDCTRL_DCLK_POL
> LCDCTRL_UNK6 | LCDCTRL_VTGEN actually set LCDCTRL_PXLFORM_RGB888
> LCDCTRL_RGB888 actually sets LCDCTRL_DPI_EN
> 
> The total still resulted in a working display even if the defines were
> quite wrong.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 59c68432f8e1..26671dc66874 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -46,17 +46,22 @@
>  #define DSI_LANEENABLE_L0EN	BIT(1)
>  #define DSI_LANEENABLE_L1EN	BIT(2)
>  
> -/* LCDC/DPI Host Registers, based on guesswork that this matches TC358764 */
> +/* LCDC/DPI Registers */
>  #define LCDCTRL			0x0420 /* Video Path Control */
>  #define LCDCTRL_MSF		BIT(0) /* Magic square in RGB666 */
> -#define LCDCTRL_VTGEN		BIT(4)/* Use chip clock for timing */
> -#define LCDCTRL_UNK6		BIT(6) /* Unknown */
> -#define LCDCTRL_EVTMODE		BIT(5) /* Event mode */
> -#define LCDCTRL_RGB888		BIT(8) /* RGB888 mode */
> -#define LCDCTRL_HSPOL		BIT(17) /* Polarity of HSYNC signal */
> -#define LCDCTRL_DEPOL		BIT(18) /* Polarity of DE signal */
> -#define LCDCTRL_VSPOL		BIT(19) /* Polarity of VSYNC signal */
> -#define LCDCTRL_VSDELAY(v)	(((v) & 0xfff) << 20) /* VSYNC delay */
> +#define LCDCTRL_VTGEN		BIT(1) /* Use chip clock for timing */
> +#define LCDCTRL_PXLFORM		GENMASK_U32(6, 4)
> +#define LCDCTRL_PXLFORM_RGB666		0	/* x:R:G:B 6:8:8:8 */
> +#define LCDCTRL_PXLFORM_RGB666_24	1	/* x:R:x:G:x:B 2:6:2:6:2:6 */
> +#define LCDCTRL_PXLFORM_RGB565		2	/* x:R:G:B 8:5:6:5 */
> +#define LCDCTRL_PXLFORM_RGB565_1	3	/* x:R:x:G:x:B 3:5:2:6:3:5 */
> +#define LCDCTRL_PXLFORM_RGB565_2	4	/* x:R:x:G:x:B:x 2:5:3:6:2:5:1 */
> +#define LCDCTRL_PXLFORM_RGB888		5	/* R:G:B 8:8:8 */
> +#define LCDCTRL_DPI_EN		BIT(8)
> +#define LCDCTRL_HSYNC_POL	BIT(17) /* Polarity of HSYNC signal */
> +#define LCDCTRL_DE_POL		BIT(18) /* Polarity of DE signal */
> +#define LCDCTRL_VSYNC_POL	BIT(19) /* Polarity of VSYNC signal */
> +#define LCDCTRL_DCLK_POL	BIT(20) /* Polarity of pixel clock */
>  
>  /* SPI Master Registers */
>  #define SPICMR			0x0450
> @@ -139,14 +144,16 @@ static int tc358762_init(struct tc358762 *ctx)
>  
>  	tc358762_write(ctx, SPICMR, 0x00);
>  
> -	lcdctrl = LCDCTRL_VSDELAY(1) | LCDCTRL_RGB888 |
> -		  LCDCTRL_UNK6 | LCDCTRL_VTGEN;
> +	lcdctrl = FIELD_PREP(LCDCTRL_PXLFORM, LCDCTRL_PXLFORM_RGB888) |
> +		  LCDCTRL_DPI_EN;
> +
> +	lcdctrl |= LCDCTRL_DCLK_POL;
>  
>  	if (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC)
> -		lcdctrl |= LCDCTRL_HSPOL;
> +		lcdctrl |= LCDCTRL_HSYNC_POL;
>  
>  	if (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC)
> -		lcdctrl |= LCDCTRL_VSPOL;
> +		lcdctrl |= LCDCTRL_VSYNC_POL;
>  
>  	tc358762_write(ctx, LCDCTRL, lcdctrl);
>  
> 


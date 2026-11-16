Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820683;
	b=As5NUl2SSOLHVRT83Zf32fJSbksFT/LsR/W6Gatwu0DV3icsOHGuMP3359iNqeAOeej3
	 8BrC9eI9gDlrb0+J8HD7AcTwZOz6r75bzan7FyDE56JVdo8uByNRVefELa4SOPw5ZQSUI
	 9dVQdpz5/b1gOfHWJNlQiYae8B6WL3CAeyAFPbheSmrw2yGQEFVm0S2syqMCOwZd9fqe9
	 BemeBNg337SaoDNAuV9Qmn/5YKIFU3pwvAVH5i4B1+F7Ygj/Yz5K4/da03eNei/k5UTSV
	 aHl9syKE+nLTp0YipGlnAL3t7gkNhAlK26F7PWjZs6vEj/Tf33uNl4TOKtXx4u4okDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820683;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z8vIOmbIt256h0sN5KP+ZCa71ev+Q0ASUR7JzYgKmR4=;
	b=YsMoNUDGYDkLHqRzbMUWhLkaTKnxzaCBG/eYBcjn5CWQBv8XhRSc9rT6q83In1w/dC+o
	 2m58pxUYVJYBPm4dyjpn+3j7edVuZXL4Lq82LL8Jo5anE2d+ZFU3RwM33zB2fyeadFbTF
	 CQgb5jCUX8w85EIJpMeHJg8wgXxeXVPvZ1MoIabCylPlZP3JSLrgUweqZT4hixby3wsXx
	 ksPF/JiN0Zyw142q/SJySIH22y7YhN+JX/sndhYfaMDsJ6/2FYL4ydeC16hRX3bD/dtgM
	 nOJI7ho+UXU7eVX1a4UhOKxqokn281PG+OjQmKNGUOtHMjtC24lmVm4QhEMxacG7MuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Q2QJKiq1;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746CC606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746CC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Q2QJKiq1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=Z8vIOmbIt256h0sN5KP+ZCa71ev+Q0ASUR7JzYgKmR4=; t=1794820680; x=1796030280; 
	b=Q2QJKiq1FQ93goteVqR+jRmBKMzkfiMa8fikRDY6mXkoVL2lHaLDIQPSdtuIaIRlHFxkH8tyvqZ
	VWRqI8rYt/D/pepqixocy6iMLnKiS4YKSJ6O+QQv/wuxg7obF3mXrNxkvrrl16e5Ac/JEQG4K7bOY
	slkcBXDvKqhLL8KipxyGtsUq7QxNExZ+XarI0TeMSlSKBPgUgF0E0ALuxWFy4HGtafyRSA10APLV+
	GYpv0PAzOOJOF7tdhtpiTKP32119Gdxq7fK3f4csKt49CA5btxlPxJN71nE8bYtAnhgGj2CfEtJhC
	iaMUqJkQuU6QA+5LaG8/6+nKV5Atb4CBk0Pg==;
Date: Mon, 16 Nov 2026 10:17:37 +0100
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
Subject: Re: [PATCH v5 12/13] drm/bridge: tc358762: Set DE_POL and DCLK_POL
 properly
Message-ID: <20261116101737.38caec27@kemnade.info>
In-Reply-To: <20261015-tc358762-fixes-v5-12-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
	<20261015-tc358762-fixes-v5-12-7cd721a6451b@ideasonboard.com>
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

On Thu, 15 Oct 2026 14:16:03 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> The driver hardcodes LCDCTRL_DCLK_POL and ~DE_POL, ignoring what the
> panel actuall wants. Fix this by looking at the
> bridge_state->output_bus_cfg.flags, and set the polarities correctly.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 33312300e606..e73be376e33c 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -186,12 +186,15 @@ static void tc358762_enable(struct drm_bridge *bridge,
>  {
>  	struct tc358762 *ctx = bridge_to_tc358762(bridge);
>  	struct drm_connector_state *conn_state;
> +	struct drm_bridge_state *bridge_state;
>  	struct drm_crtc_state *crtc_state;
>  	struct drm_connector *connector;
>  	struct drm_display_mode *mode;
>  	u32 lcdctrl;
>  	int ret;
>  
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +
>  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>  	conn_state = drm_atomic_get_new_connector_state(state, connector);
>  	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> @@ -243,7 +246,9 @@ static void tc358762_enable(struct drm_bridge *bridge,
>  	if (ctx->use_vtg)
>  		lcdctrl |= LCDCTRL_VTGEN;
>  
> -	lcdctrl |= LCDCTRL_DCLK_POL;
> +	/* Note: DCLK_POL affects pixdata, de and syncs */
> +	if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> +		lcdctrl |= LCDCTRL_DCLK_POL;
>  
>  	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
>  		lcdctrl |= LCDCTRL_HSYNC_POL;
> @@ -251,6 +256,9 @@ static void tc358762_enable(struct drm_bridge *bridge,
>  	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
>  		lcdctrl |= LCDCTRL_VSYNC_POL;
>  
> +	if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
> +		lcdctrl |= LCDCTRL_DE_POL;
> +
>  	tc358762_write(ctx, LCDCTRL, lcdctrl);
>  
>  	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
> 


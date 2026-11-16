Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820011;
	b=TRluMwL9p3KYRArmInxhNga0guoHhNwSJ/puSEN/tNR5YDRN6X32ZwvC7s3GdE0T6MD+
	 CtGyA7Bxfm7PuiR8Uq1H7f4aouEYfh2zqPvMicrtbY+KjKPQ3/t/q9TOH9Ka/i0ZHthtY
	 5ndL+GkivB0jVU4/hWnVtDgAE5T+yuC7OjvMtQfJuiXebXf5yDfzdYujzyKUZrjLM6zAt
	 aIw2S4ZzWnl3VzYGjXpb77QV/Z3ClnfdRJIFL07HNBNLhuIHQ4rhsoc5+yxsDVyfmZHnS
	 S5XAj4P2GKa+IGJXo1RubVbhhjrC45eHYF4VRwVOX9NpSS6Ij28mZtX8ToLZ4hk8bpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820011;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ydUjmXlLo3pPex5I6P/1tBqOJR5Q2KNo2lGVDYqsy2s=;
	b=ceh/7Ko9ISjeYEHEwiJ+BVs5GKoiO1T7Lai40kTODh2f6U7rQBEM88N1qC4/6tML8/3X
	 k3F4rQKnsFz5uIQ7c/q4tQA4HIp4e4undpIthyBKJQRse16QSXLmeWDyTK9OxAdGpsARd
	 KF1v0HZpajd/T6U+ZvFZ5FA0NZ+3+ZmrX16F3pHzYdRkUChVqM/05CR5UZOS3AyYzk6bn
	 rKOZaZP++J0DVJZOaVXmlh0dsphhSEM7AC7QRmoqtz/qaTTiKIscb6InvD1a4wCbFxlAu
	 /4NbQcCW2h3MwE3BTBd9lIbXAW7uufUL8++R2uhA7N39z9kFVFbQTyrR2YRC7zbZX5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=xKruyXMo;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D33606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D33606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=xKruyXMo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=ydUjmXlLo3pPex5I6P/1tBqOJR5Q2KNo2lGVDYqsy2s=; t=1794820011; x=1796029611; 
	b=xKruyXMoc6pIpGww8MDdb780x18M3bPKoNGG8d7VJVbe2DRK92kHBDE+n8efHButuZ14g1S3IS2
	l2PL3GLdznjewLDZZbe9kUm6jY/uvhvXnGShnUvkoC15emzglo8xVz3SMjfRwFC7VBdbBjusaswns
	vyjPIIBzLk3o9ya+Y72wTe5frtA90XKdv8wcmt8qPRUPAhR70B2qG1E5l2Leg86uxx73LS8sDavGR
	Sov5EXPhj8nvdRrlkxzFcyciqA/iY3gXO/DVcc/simjeYitT0aA65o9CSt+kzBghdmeia6ZAqzE3D
	67LQoL6It2g4EoIX9NM4pW6IkaQnuv0ftBtg==;
Date: Mon, 16 Nov 2026 10:06:42 +0100
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
Subject: Re: [PATCH v5 11/13] drm/bridge: tc358762: Drop
 drm_bridge_funcs.mode_set
Message-ID: <20261116100642.5d61e34b@kemnade.info>
In-Reply-To: <20261015-tc358762-fixes-v5-11-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
	<20261015-tc358762-fixes-v5-11-7cd721a6451b@ideasonboard.com>
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

On Thu, 15 Oct 2026 14:16:02 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> drm_bridge_funcs.mode_set is deprecated. Drop it and get the
> drm_display_mode from the atomic state.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index a91cf159ba27..33312300e606 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -98,7 +98,6 @@ struct tc358762 {
>  	struct regulator *regulator;
>  	struct drm_bridge *panel_bridge;
>  	struct gpio_desc *reset_gpio;
> -	struct drm_display_mode mode;
>  	bool pre_enabled;
>  	int error;
>  	bool use_vtg;
> @@ -186,9 +185,18 @@ static void tc358762_enable(struct drm_bridge *bridge,
>  			    struct drm_atomic_commit *state)
>  {
>  	struct tc358762 *ctx = bridge_to_tc358762(bridge);
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector *connector;
> +	struct drm_display_mode *mode;
>  	u32 lcdctrl;
>  	int ret;
>  
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	mode = &crtc_state->mode;
> +
>  	/*
>  	 * DPIENABLE has reset default of 1. Make sure we don't output on
>  	 * DPI until we have finished the coniguration.
> @@ -213,7 +221,7 @@ static void tc358762_enable(struct drm_bridge *bridge,
>  	if (ctx->use_vtg) {
>  		struct videomode vm = { 0 };
>  
> -		drm_display_mode_to_videomode(&ctx->mode, &vm);
> +		drm_display_mode_to_videomode(mode, &vm);
>  
>  		tc358762_write(ctx, LCDC_HSR_HBPR,
>  			       vm.hsync_len | (vm.hback_porch << 16));
> @@ -237,10 +245,10 @@ static void tc358762_enable(struct drm_bridge *bridge,
>  
>  	lcdctrl |= LCDCTRL_DCLK_POL;
>  
> -	if (ctx->mode.flags & DRM_MODE_FLAG_PHSYNC)
> +	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
>  		lcdctrl |= LCDCTRL_HSYNC_POL;
>  
> -	if (ctx->mode.flags & DRM_MODE_FLAG_PVSYNC)
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
>  		lcdctrl |= LCDCTRL_VSYNC_POL;
>  
>  	tc358762_write(ctx, LCDCTRL, lcdctrl);
> @@ -265,15 +273,6 @@ static int tc358762_attach(struct drm_bridge *bridge,
>  				 bridge, flags);
>  }
>  
> -static void tc358762_bridge_mode_set(struct drm_bridge *bridge,
> -				     const struct drm_display_mode *mode,
> -				     const struct drm_display_mode *adj)
> -{
> -	struct tc358762 *ctx = bridge_to_tc358762(bridge);
> -
> -	drm_mode_copy(&ctx->mode, mode);
> -}
> -
>  static const struct drm_bridge_funcs tc358762_bridge_funcs = {
>  	.atomic_post_disable = tc358762_post_disable,
>  	.atomic_pre_enable = tc358762_pre_enable,
> @@ -282,7 +281,6 @@ static const struct drm_bridge_funcs tc358762_bridge_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_create_state = drm_atomic_helper_bridge_create_state,
>  	.attach = tc358762_attach,
> -	.mode_set = tc358762_bridge_mode_set,
>  };
>  
>  static int tc358762_parse_dt(struct tc358762 *ctx)
> 


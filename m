Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819949;
	b=jRCWszjTv/gBEVXpEXcmmIn1VPu60xJMWiqUXTjhuYcbshFwYuSxPpeSd0WlnGJwrHXv
	 lG5k5LL5uBEEjjJFEpgicjUnCR/PTZfl5flCez15h8qZePs2yTRZrEHUoJmcmIY2qAeNl
	 Fb3Tn0nMrntZsIu4N8dSDXOSVXeNfePXBWqsaKaXHXazU9Vozt/uA9Adj0d9iOiVZtZ5b
	 4eEK3dQuYbze35gb3touKHvoPHWaIFQx7qDN4g8Ca3WiGAKDsAUUnRuMmv0xDDPj9Uh4R
	 Tb3YK9WtvXai6g2j4CwS2u7VWJiU8PPZnsjxHhMFYpix0VdplL1lrkL2pAILjibEHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819949;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/0oXdxbpu71mKxzQVXDmWWE0LshjAYMSIYDSuXABBY4=;
	b=ckMQT4d9VNMDs4rOMg7H55trlP7X+2aepaoor+WKUq2BIfqbONWtltkEr08liAbwbb/5
	 ftI6XQvSzjldzlvzfMIlkcv6fuEiCzDH2etM+IlgZ8h36c9FLABxdhwNYM5XP2Nk3INoj
	 h4H3FlE4ghic/i3G9r7ujDTaWaojG5XIK0pxuVdUW6MFEOWYjSEl2OTxLUJOj+CR8Hkpw
	 xpMhBm5olAwd/kVolkhdgCVbWcrvNafqptAyd2fYpVjILzRfoUM4oRDncBo5fCdvqgxIn
	 7ibGdHkRKWJhsoNT7wuTJPmEMMu+1JYdnjR2Lkm5Kpxm3wyhhx88HhADnh9kbXj/e3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=jDneAKx1;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A501606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A501606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=jDneAKx1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=/0oXdxbpu71mKxzQVXDmWWE0LshjAYMSIYDSuXABBY4=; t=1794819948; x=1796029548; 
	b=jDneAKx1jl1OLxVVYUWLUkIRxde3zO39JXF3rvceEIX/QTP3smwIFmw0hMepo4HsrLTalSNMsVC
	6pQgtvCzv6gVvagRVK17kOKfQsLCEpbFArseMb24Nzvn1fN1r7QxiQ/iNESUwbM6FGWBbSUWcEvOE
	gUD46vtRpSg1vzNbDscfvxfXWMG2+uju8pwdfRtsz4DMOyJ9TjYySBbKzDf+k2EQFW76a0lVvv4b9
	LziAEa+GIekBPR3R3TVGRAC3PDZC8Yqxa8GejLYJB7F00cJzOmTwiBXXdv/rKppDGu7Ut2fmmrUUQ
	8bE8V0E+Fq4Dy9Li9zdQu1V29LybEGpGvm0w==;
Date: Mon, 16 Nov 2026 10:05:26 +0100
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
Subject: Re: [PATCH v5 10/13] drm/bridge: tc358762: Move tc358762_init()
 into tc358762_enable()
Message-ID: <20261116100526.3e699f94@kemnade.info>
In-Reply-To: <20261015-tc358762-fixes-v5-10-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
	<20261015-tc358762-fixes-v5-10-7cd721a6451b@ideasonboard.com>
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

On Thu, 15 Oct 2026 14:16:01 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> The only thing tc358762_enable() does is call tc358762_init(). Inline
> the tc358762_init() into tc358762_enable(), for simplicity and to make
> it easier to improve the tc358762_enable() in the following commits. No
> functional change.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 104 ++++++++++++++++++--------------------
>  1 file changed, 49 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 2baacef685a5..a91cf159ba27 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -138,9 +138,56 @@ static inline struct tc358762 *bridge_to_tc358762(struct drm_bridge *bridge)
>  	return container_of(bridge, struct tc358762, bridge);
>  }
>  
> -static int tc358762_init(struct tc358762 *ctx)
> +static void tc358762_post_disable(struct drm_bridge *bridge,
> +				  struct drm_atomic_commit *state)
> +{
> +	struct tc358762 *ctx = bridge_to_tc358762(bridge);
> +	int ret;
> +
> +	/*
> +	 * The post_disable hook might be called multiple times.
> +	 * We want to avoid regulator imbalance below.
> +	 */
> +	if (!ctx->pre_enabled)
> +		return;
> +
> +	ctx->pre_enabled = false;
> +
> +	/* Turn off the DPI output */
> +	tc358762_write(ctx, LCDCTRL, 0);
> +
> +	if (ctx->reset_gpio)
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +
> +	ret = regulator_disable(ctx->regulator);
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
> +}
> +
> +static void tc358762_pre_enable(struct drm_bridge *bridge,
> +				struct drm_atomic_commit *state)
>  {
> +	struct tc358762 *ctx = bridge_to_tc358762(bridge);
> +	int ret;
> +
> +	ret = regulator_enable(ctx->regulator);
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
> +
> +	if (ctx->reset_gpio) {
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		usleep_range(5000, 10000);
> +	}
> +
> +	ctx->pre_enabled = true;
> +}
> +
> +static void tc358762_enable(struct drm_bridge *bridge,
> +			    struct drm_atomic_commit *state)
> +{
> +	struct tc358762 *ctx = bridge_to_tc358762(bridge);
>  	u32 lcdctrl;
> +	int ret;
>  
>  	/*
>  	 * DPIENABLE has reset default of 1. Make sure we don't output on
> @@ -203,60 +250,7 @@ static int tc358762_init(struct tc358762 *ctx)
>  
>  	msleep(100);
>  
> -	return tc358762_clear_error(ctx);
> -}
> -
> -static void tc358762_post_disable(struct drm_bridge *bridge,
> -				  struct drm_atomic_commit *state)
> -{
> -	struct tc358762 *ctx = bridge_to_tc358762(bridge);
> -	int ret;
> -
> -	/*
> -	 * The post_disable hook might be called multiple times.
> -	 * We want to avoid regulator imbalance below.
> -	 */
> -	if (!ctx->pre_enabled)
> -		return;
> -
> -	ctx->pre_enabled = false;
> -
> -	/* Turn off the DPI output */
> -	tc358762_write(ctx, LCDCTRL, 0);
> -
> -	if (ctx->reset_gpio)
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> -
> -	ret = regulator_disable(ctx->regulator);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
> -}
> -
> -static void tc358762_pre_enable(struct drm_bridge *bridge,
> -				struct drm_atomic_commit *state)
> -{
> -	struct tc358762 *ctx = bridge_to_tc358762(bridge);
> -	int ret;
> -
> -	ret = regulator_enable(ctx->regulator);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
> -
> -	if (ctx->reset_gpio) {
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -		usleep_range(5000, 10000);
> -	}
> -
> -	ctx->pre_enabled = true;
> -}
> -
> -static void tc358762_enable(struct drm_bridge *bridge,
> -			    struct drm_atomic_commit *state)
> -{
> -	struct tc358762 *ctx = bridge_to_tc358762(bridge);
> -	int ret;
> -
> -	ret = tc358762_init(ctx);
> +	ret = tc358762_clear_error(ctx);
>  	if (ret < 0)
>  		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
>  }
> 


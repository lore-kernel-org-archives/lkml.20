Received: from mail-m12786.qiye.163.com (mail-m12786.qiye.163.com [115.236.127.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468323BB674
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025552; cv=none; b=k+/xmeKVUL8asN/axyttrN9UDbU0mHB9tJ/jWzr811NflHDKek6gj7h+Rlpz5hp60MyniwQbH+kFBxvKaJPJ5h/Ca454JeK6JjztQZkruvhZiG4//TpXleosfnZmk9qVvSgj0fC9mXajknGLQ7E3IfSroLkOY5D49jy5ayJ+tww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025552; c=relaxed/simple;
	bh=f1o46kqHtGv3rgIFmvGJ7PSV0EIbjmAv4QUePmBaBW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rweo6hvYzM2So4FOJXQI2NiUgdj7nL+Z4iKRl55PMYLOJq2+s2n84MLRHhJ16o6XiFXPSt+Co0Nzrsec4Uzg5nDr48b4WKnp06/QB7dPj8I1PCduPotaFA9kRf2nr3AN0cqzy4deeLQeK45MbgizXAfcEzYyIL+UCDr9kK7+ccc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=X4ubh83p; arc=none smtp.client-ip=115.236.127.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="X4ubh83p"
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d3f9f7ab;
	Thu, 10 Sep 2026 15:16:57 +0800 (GMT+08:00)
Message-ID: <9e77b5c5-f1d9-484b-ae02-846fae1b3642@rock-chips.com>
Date: Thu, 10 Sep 2026 15:16:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector
 property
To: Igor Paunovic <royalnet026@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, dri-devel@lists.freedesktop.org
References: <20260909163206.36409-1-royalnet026@gmail.com>
 <20260909173542.14030-4-royalnet026@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260909173542.14030-4-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa08a2d43d903a7kunm43c471656ab21a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUNJSFYfTE9PQx1PGE
	oeQ05WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=X4ubh83p0G7uLB3w+lrLYEOhoz65fWCAkqGrIJipe55SMi1B8b7sBWrETpX6u7mqZV2UtmXqL8GouAC77jFox9pATG10cszdwRxdBt7NlC4wL5cyIGKkBVncmcAe0Uhp8XJ7/wLWdFFNhrisczrU8ivzIKTni3OR0XOOoI2tWRk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Tpyr9lMkObRQjaiycSSz5ViShzTcyMZHhq0kg2XVVgw=;
	h=date:mime-version:subject:message-id:from;

Hello Igor,

On 9/10/2026 1:35 AM, Igor Paunovic wrote:
> The dw-dp bridge already filters candidate output formats on
> conn_state->max_bpc in dw_dp_bridge_atomic_get_output_bus_fmts() and
> validates the result against the link bandwidth, but the connector
> never exposes the "max bpc" property, so userspace cannot limit the
> bit depth. Attach the property with a range of 6 to 10, matching
> dw_dp_output_formats[]: the smallest entry is 6 bpc RGB and the
> deepest entries are 10 bpc.
> 
> drm_connector_attach_max_bpc_property() initializes
> connector->state->max_requested_bpc and therefore requires the
> connector to have a state. Rockchip binds its components before
> drm_mode_config_reset() runs, so the freshly created bridge connector
> does not have one yet - create the connector state before attaching
> the property, exactly like drmm_connector_hdmi_init() does for HDMI
> bridge connectors. The later drm_mode_config_reset() then re-creates
> the connector state, and the preceding patch makes
> drm_bridge_connector_create_state() restore max_requested_bpc from
> connector->max_bpc, so clients that never set the property (fbcon in
> particular) keep the full range instead of ending up with 0.
> 
> With the property attached, compositors such as KWin write "max bpc"
> on every atomic modeset; any in-range value is handled by the existing
> format filter and bandwidth checks.
> 
> Assisted-by: LLM checkpatch
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> index b23efb153c9e6..8ff27353b1417 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> @@ -112,6 +112,32 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
>  				     "Failed to init bridge connector\n");
>  	}
>  
> +	/*
> +	 * The components are bound before drm_mode_config_reset() runs, so
> +	 * the connector has no state yet, but
> +	 * drm_connector_attach_max_bpc_property() requires one. Create the
> +	 * connector state first, like drmm_connector_hdmi_init() does.
> +	 */
> +	if (connector->funcs->atomic_create_state) {
> +		struct drm_connector_state *state;
> +
> +		state = connector->funcs->atomic_create_state(connector);
> +		if (IS_ERR(state)) {
> +			dw_dp_unbind(dp->base);
> +			return PTR_ERR(state);
> +		}
> +
> +		connector->state = state;
> +	} else if (connector->funcs->reset) {
> +		connector->funcs->reset(connector);
> +	}
> +
> +	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
> +	if (ret) {
> +		dw_dp_unbind(dp->base);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
> 

I don't think this is the correct way to go.

I believe max_bpc should be handled in drm_bridge_connector_init(). 
Take a look at its implementation. HDMI already does max_bpc there, 
so DP should probably do something similar.

-- 
Best, 
Chaoyi

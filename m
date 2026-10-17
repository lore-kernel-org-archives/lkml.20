Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8983B83E1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256715; cv=none; b=A8bGx90ygn1DVJCXePt5xbFz/5KsrhZGJt2YYgYEKZ4RQoopx3v9hR/WQXZ2uXOhpVAVigVp5YRfrujp/FGR4AuNAgB/6yvssnJqVxUzE8viDpSt+XbebJFBsdZV5ijnedym5cL7wKoEiRf4KnS4J1LLHeIUN8h6atYxPEAjuwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256715; c=relaxed/simple;
	bh=CLl3dWfq9lc3v0RyeuLx1Kqa3s5RVDQXl2BLfa9bUzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sbyqnrx/kuofG31P0Sg4gjYoIl8tiU1yw6+B0nrF0SUHrUAZheYH2uCT90dEbvRwnPbe2zRndCUmuyan8FlAooyzI4tOGfe72DoN/tU60uFWIcgft+Eh0VhMRamWTqn+LrRiaepLxukxXkpP0pneeJbDu1f8IpeQ5BIcNjM/5Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M1ttK4m0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M1ttK4m0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792256706;
	bh=CLl3dWfq9lc3v0RyeuLx1Kqa3s5RVDQXl2BLfa9bUzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M1ttK4m0KfOs0YLiXadTgP8ddzDAb/YWswl8W3DVMtLPIuAqeN4too3wswxwjMLAk
	 NsbkhlD6Qyvj+IKwjseYipVYbP+OXpEshT6rvwEJZX9uXHHDDpBeizaqxCdI4wm4Hb
	 GhsuSVAsGwxyvCw5/fHIQ4niAzqjoSA8lsS1Ms3aeYmjmSNdE4LosTI4BIRxxHLuP0
	 mfsOePcx8akwImU0WJXSNWkV3BB48i9gOkW2j3jDgjxMxOv2nLsujqY5B9bK3Bugw6
	 OCwGTF+N69B8nJc0d0oJU4Fx5Jb70bAaodTa2x1b8ZNBAgQbkZCu+lWnSNMDeWHnGt
	 fGzR9Q8vesrSQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C05617E053E;
	Sat, 17 Oct 2026 19:05:05 +0200 (CEST)
Message-ID: <15e86037-7de9-4f6f-a5d8-9571e1983941@collabora.com>
Date: Sat, 17 Oct 2026 20:05:04 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: dw-hdmi-qp: Return -EOPNOTSUPP in HDMI audio
 functions
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-rockchip@lists.infradead.org
References: <20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/19/26 9:00 PM, Detlev Casanova wrote:
> -EOPNOTSUPP is not logged as an error by the ASoC subsystem, but -ENODEV
> is.
> It also better represents the situation: The operation is currently not
> supported (because clocks are not enabled and tmds_char_rate is
> unavailable), but the hardware is present.
> 
> Using -EOPNOTSUPP in the audio_prepare callback removes possible repeated
> warning log lines when HDMI is not connected.
> 
> Returning -EOPNOTSUPP in the audio_enable callback is also needed as it
> avoids logging 0-valued ELD errors.
> 
> When tmds_char_rate is available, the clocks are enabled and the
> functions will keep returning 0 as before.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index d649a1cf07f5..270c8c47d853 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -469,8 +469,10 @@ static int dw_hdmi_qp_audio_enable(struct drm_bridge *bridge,
>  {
>  	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
>  
> -	if (hdmi->tmds_char_rate)
> -		dw_hdmi_qp_mod(hdmi, 0, AVP_DATAPATH_PACKET_AUDIO_SWDISABLE, GLOBAL_SWDISABLE);
> +	if (!hdmi->tmds_char_rate)
> +		return -EOPNOTSUPP;
> +
> +	dw_hdmi_qp_mod(hdmi, 0, AVP_DATAPATH_PACKET_AUDIO_SWDISABLE, GLOBAL_SWDISABLE);
>  
>  	return 0;
>  }
> @@ -484,7 +486,7 @@ static int dw_hdmi_qp_audio_prepare(struct drm_bridge *bridge,
>  	bool ref2stream = false;
>  
>  	if (!hdmi->tmds_char_rate)
> -		return -ENODEV;
> +		return -EOPNOTSUPP;
>  
>  	if (fmt->bit_clk_provider | fmt->frame_clk_provider) {
>  		dev_err(hdmi->dev, "unsupported clock settings\n");
> 
This LGTM, hence:

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Sadly, the patch was submitted before MAINTAINERS was updated to track
dw-hdmi-qp under Rockchip DRM, so it missed some email recipients..

+ Heiko Stübner <heiko@sntech.de>
+ linux-rockchip@lists.infradead.org

Thanks to Sebastian for noticing this fell through the cracks.
It still applies cleanly on top of latest drm-misc-next.

Heiko, can we get it merged, please?

Regards,
Cristian

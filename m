Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337533;
	b=jehdeaRR3aYwRIidZuU6AYIbV/3rUW5dERIjKKVystCmfh8f4nSgVkEX0RuEtp7NEJGN
	 QU1or8/TVtrnoyhsJzCDVj0RU3sq82KtUYGGuValsmV2fJf7Cj0GiT1wCjeSPMWa9Hqj7
	 L9uBeQHk05mRaHu9yxWfbBpmnVs4emjzkuAKuHKoaFwaJ58mCj6OAyix77+a0GnjRieyA
	 gN8WX4lixh+ZQ8Xnui9BhXfP0ZgzXGF1/kO6Ty67+Vtx6rqkSWt71PHOqGIhEhl4zA6zP
	 JwoawD7kzy91bybzaaK4tAPAZh+xvu53XnlobyDgdo1FH8bsvl34klvFQ8zi1bfY8rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337533;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=M6suHIpsl6GARsXl0aeCf2GhxVBiwsz4QMRfqHBX3QE=;
	b=ntO+cDb+hE4xzykoTORlBf7m3SFWenxQrI8gOk0ojn44fYcEXTDSPJ/W9IxD/k798ELl
	 akZrQmtCOehOOgwl89JIiIEvec+upSxNytJ3l6x3JEAOQ1ecBeiY9gSxfyTpdsFJRFYRo
	 de3foei7unJ2hu5xIYwcrkcvfJtX3gJq1AFlXC+FsKn9J+TvPEDxbYecke/x6bYmeBVO5
	 dCVfiHjRUkYLwekuowKnLedJb80c0QeQv9pCdAXR3DW8b7hbs6pdapi9XqXYiQzjnqOV4
	 o9rLuljlAoXbByPru2GKo9S8jFQzdM5aq2S4ukkIpanzUPQ3sGym0gqBHXrV5x1DQ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LtFOMXuJ;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B75606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LtFOMXuJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794337531;
	bh=Uz3BhBVImxItOoQKtHHtypAOcZNmLlMDT+UDThYXTEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LtFOMXuJ9oY36UZepQyWbJGdaDUbedR9kzEldgu4NqYzeJltQNqahDZUmBHzomn9n
	 n5hT+LMgDCW2Tv5fXbR/Fe535XqydT4G5iywkeZemeqRmSmEFEqOxK+b7lp1HOoOdq
	 uGtUk2HMib6ufK+DtXvJAsdlFMOKxnsGtBKbTx327CXgufpLnhht0PQNtlCnMO5+cd
	 0OoTTVhtM7NarFALOwW2rcn6XT0rpJt8PH6ZYzEajQy8j3CEKt4mOFHFfHz329hgcK
	 v+/8QOD81fb/+iL3IFH75gxRxOTG+LJQMkXV6K3clMEd/J+zNQFUNSq+Roa31tbrC8
	 UpISE9nB+D/LA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 890EB17E0820;
	Tue, 10 Nov 2026 20:05:30 +0100 (CET)
Message-ID: <cd6ff4c0-cd5d-4c42-8f52-5f3893aec015@collabora.com>
Date: Tue, 10 Nov 2026 21:05:30 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/rockchip: dw_hdmi_qp: Set the VOP2 color space
 from the connector
To: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018143135.5745-1-jan.claussen10@web.de>
 <20261018143135.5745-7-jan.claussen10@web.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20261018143135.5745-7-jan.claussen10@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jan,

On 10/18/26 5:31 PM, Jan Claußen wrote:
> VOP2 converts RGB to YCbCr using the matrix selected by the CRTC
> state's color_space, but the HDMI encoder never sets it, so VOP2
> always converts with BT.709. Once the colorspace property can
> signal BT.2020 colorimetry to the sink, a YCbCr output would be
> encoded with BT.709 and decoded with BT.2020.
> 
> Derive color_space from the connector colorspace before the early
> return, so that a colorspace change alone is applied.
> 
> Signed-off-by: Jan Claußen <jan.claussen10@web.de>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9c4cf68d79d5..10c5b6d6406e 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -17,6 +17,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/phy/phy-hdmi.h>
>  #include <linux/regmap.h>
> +#include <linux/videodev2.h>
>  #include <linux/workqueue.h>
>  
>  #include <drm/bridge/dw_hdmi_qp.h>
> @@ -187,6 +188,19 @@ static int dw_hdmi_qp_rockchip_get_vop_format(struct drm_encoder *encoder,
>  	return bstate->output_bus_cfg.format;
>  }
>  
> +static u32
> +dw_hdmi_qp_rockchip_color_space(const struct drm_connector_state *conn_state)
> +{
> +	switch (conn_state->colorspace) {
> +	case DRM_MODE_COLORIMETRY_BT2020_RGB:
> +	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> +	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> +		return V4L2_COLORSPACE_BT2020;
> +	default:
> +		return V4L2_COLORSPACE_DEFAULT;
> +	}
> +}

My main concern is introducing V4L2_COLORSPACE_* logic into a DRM bridge driver,
which should rather rely on enum drm_colorspace / DRM_MODE_COLORIMETRY_*.
Translating the DRM colorimetry into V4L2 values only for VOP2 to map them back
to a CSC matrix doesn't seem fully justified.

The root problem is rather on the VOP2 side: the color_space field in struct
rockchip_crtc_state and its V4L2-based handling in the CSC selection look like
leftovers inherited from the vendor kernel, and I think this is a good time to
clean that up instead of building on it.

Cristian

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.88.81.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533282;
	b=gJNDzTkmZJED+PvfftJrc2Uzy5cqpRHg7uBjVgqk+KWxCpZQ55KQwAltvCQryAygTGXX
	 mBlgYy2AbZfN+aYOENBfIPLcFxwVM2r9ua/sUtuct6ZNrPuK4kRjA8Ppbmf5T9f7C2nl2
	 P0/QE1ZUeWVFXI55veX9PvoHv/9yivxzUU21XME1WEvpOhBlXnhcZZLnpSGk6F4Z/hz5I
	 hEEbjzYCnmiNp1184b0OBy0/9wBk1RgDo42bkALJBd2lmbShsSR5fdpjNxYoThtZNpy7b
	 1quGjCz3wErpjUQ7x44+0QYXC8Pu2IVd0ko6v9BfAq7HNO7EZGhb3cD5jr+8VzUI1FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533282;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=m6W2wocIbscGTTWaMyKjxx5UOMRU4kUE2NYWM7aaS7U=;
	b=by04bUetlNDiHc51Bp94hcbV9rgF0s1pGw82O+22Hyc6ubOGz5DkMg098IQd9rnXAirL
	 nbgr6ZIloybzYEz8qQ9446mwF3r8gQRrsG2tuYRCGD6dh0fOe9axH7ECuhx0xiWATWvAf
	 Eglmh/QLCcOmc2MjIsh+lREaKRHQo4WQHm9qrb+3vQx6ciHAxuJbp3ZLrwOom6km1FoY/
	 ySUyKLkJUtn/wLdbCNbG6Xo5tCcHxECCuKKGFyfStcYLwPkT8fQuIHrYkwshhDIwpzIOA
	 +B/q5fMDXqGzEl1AaXdMXsZVWVGnpa32HTd7LF2RipJ23YrwSH8pPGpr69Vvf4hrSjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="ZbKwCsz/";
	arc=none smtp.remote-ip=47.88.81.219
Received: from mail-m81219.netease.com (mail-m81219.netease.com [47.88.81.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FF1606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FF1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ZbKwCsz/
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5483a91d6;
	Fri, 13 Nov 2026 09:27:49 +0800 (GMT+08:00)
Message-ID: <380996af-b987-4854-8b52-a3a214b19e79@rock-chips.com>
Date: Fri, 13 Nov 2026 09:27:46 +0800
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
Subject: Re: [PATCH v2 4/9] drm/rockchip: vop2: Don't accept AFBC YTR for
 RGB565 on RK3588
To: aiyengar1990@gmail.com
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Piotr Zalewski <pZ010001011111@proton.me>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-4-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-4-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d284a02303a7kunmdaa9fb1ca15ba
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHR9NVkgfHUkYTB1LQxpLT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZbKwCsz/MFEdDyk8i8rLr6GhWB8rJpbpf0hG8dk//GrS4FwmlcjItkra2Tush2BzJQdOQwRFj0DYCG9CJdSBJzntnGr5vfNpTTC4qMxyIfA7qIfx/GLYwRl3Qu2CqAjQKF2BHVvJC4EItHyeCpW5oNTOvW700I60/HI92V8OWo0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=m6W2wocIbscGTTWaMyKjxx5UOMRU4kUE2NYWM7aaS7U=;
	h=date:mime-version:subject:message-id:from;

Hi Arun,

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The Cluster windows of the RK3588 VOP2 advertise every AFBC modifier
> of format_modifiers_afbc for RGB565 and BGR565, including the ones
> with the lossless colour transform (YTR). Scanning out an RGB565
> buffer rendered by the Mali-G610 (panfrost) with
> AFBC(16x16 | SPARSE | YTR) gives a black picture and POST_BUF_EMPTY
> on the video port, on every Cluster window, while the same buffer
> rendered with AFBC(16x16 | SPARSE) displays correctly, as do 32 bpp
> formats with YTR.

That' true. The TRM says RK3588 only support XRGB888/RGB888 AFBC YTR format.

> 
> YTR on RGB565 is also a questionable pairing to start with:
> Documentation/gpu/afbc.rst requires the R, G, B component order when
> YTR is used, with component 0 in the least significant bits, which
> DRM_FORMAT_RGB565 (B in the low bits) doesn't have, and the Arm
> Mali-D71 (komeda) only accepts AFBC for BGR565.
> 
> Stop advertising and accepting YTR for the two 16 bpp RGB formats on
> RK3588, so that userspace picks a modifier the decoder handles. The
> BGR565 case could not be tested (Mesa can't import BGR565 dma-bufs),
> it's rejected as well because the decoder is configured identically
> for both formats, apart from the R/B swap after decoding.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index ea8d837d661f..7c157f5c1734 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -404,6 +404,18 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
>  	if (vop2_convert_afbc_format(format) == VOP2_AFBC_FMT_INVALID)
>  		return false;
>  
> +	/*
> +	 * The AFBC decoder of the RK3588 Cluster windows can't decode 16 bpp
> +	 * RGB that uses the lossless colour transform: the picture stays
> +	 * black and the video port reports POST_BUF_EMPTY, while the same
> +	 * buffers without YTR display fine.
> +	 */

Drop this comment.

> +	if (vop2->version == VOP_VERSION_RK3588 && (modifier & AFBC_FORMAT_MOD_YTR) &&
> +	    (format == DRM_FORMAT_RGB565 || format == DRM_FORMAT_BGR565)) {
> +		drm_dbg_kms(vop2->drm, "No AFBC YTR support for 16 bpp RGB\n");
> +		return false;
> +	}
> +
>  	/* Different windows have different format/modifier support */
>  	for (i = 0; i < plane->modifier_count; i++) {
>  		if (plane->modifiers[i] == modifier)
> 

-- 
Best, 
Chaoyi


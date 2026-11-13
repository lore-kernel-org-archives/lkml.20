Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542136;
	b=YIlGZj+x1saaCNdZUItGS0TOzp4B4ETMcDhnY6PT1MTsATlTAd8ed2oWmryX8nY8NN/f
	 eIx0LFE8Vg3o2QSznmxwCYt4OLaHKpXQ1nN1xs/o6clt+CmTxOX95TweFsUPfGT4VSh7t
	 eG4O62dde2JiQDSy/Tv/iRYAm+1fw9idd1btAb/r0n0bGBMsJdHp1oeTqdCGxaBFuRD2l
	 IrCWtRofV5JRrqiLs0p9Y28nvAP2cERKQJrZsIC13WwBKaz3AWBQQ5vnYjo+d9ZnR7Nrp
	 /PHWdOpj0fzu1SjD5uZ8lFCtTXMxlN3V0hjkIYoVonBLNEKhzFwhUJ6rvQD8YxBEQOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542136;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=hsA+0+anSnhiXg4sK9xBWSI9juDNDjs8+QiRi3lljks=;
	b=T+4gfOk6mD8Fz4HUAxkoLVOElGt4I0/7o4CtB/RuAM4/ZIhf3K+t/6GuplNuK8URrgZB
	 qdgB5xsADwA7X6aYhw5kKkC/U00w6iNomm7VtsXmpX7miDkHmcIbkRfb+bja6L7mwMfCC
	 0stcXU6Hb9n+yI1dQW7WaRKe8UO3b4uTE2L7NpiBtICm7gW+S+p5h/dYIjoCyd/PbCUt3
	 c6AStFQ3jffbBwlPXPmP8fhD8Lh2uACNDRJpjC4Lp9VxaCBmI4cPiI5CLSnMwd0VPplkL
	 /wY6xpWAq36DWQMDECN/bLue9XwR4V/aOtMR8W5hSj6onEXHUgxPnD5VzUptSUmyJ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=FmQsKe3T;
	arc=none smtp.remote-ip=210.79.60.73
Received: from mail-m6073.netease.com (mail-m6073.netease.com [210.79.60.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D9606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=FmQsKe3T
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 548920358;
	Fri, 13 Nov 2026 11:55:25 +0800 (GMT+08:00)
Message-ID: <956a66b3-095b-45a7-826c-a0090bfe3cbb@rock-chips.com>
Date: Fri, 13 Nov 2026 11:55:24 +0800
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
Subject: Re: [PATCH v2 8/9] drm/rockchip: vop2: Keep the other LUT_PORT_SEL
 fields on gamma LUT updates
To: aiyengar1990@gmail.com, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-8-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-8-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d30bc19e03a8kunmbad58f1d5ceec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkNPVktMThlJS0gfSklIGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FmQsKe3TLHHJ/eXUlwz2NqtJQMY2ZUa/knMnFvh4LnMw7d1Z7PiWMKUXXtVJj1A3dV4xhvsWYzAGkwIhHgLddIWrw6saWgW7mUOvmJg3JzevpZ25aHz0yLoVcO/gZVaRrH2wRqEz24j87YY34O4Q7HD0/P9m4eiSX0FhzJRz0JI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hsA+0+anSnhiXg4sK9xBWSI9juDNDjs8+QiRi3lljks=;
	h=date:mime-version:subject:message-id:from;

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> On RK3588 the gamma LUT of a video port is written through a window that
> GAMMA_AHB_WRITE_SEL in SYS_CTRL_LUT_PORT_SEL selects. The register also
> holds the dclk source selection of video ports 0 and 2 and the enable of
> the video port 0/1 merge for modes wider than 4096 pixels, which writing
> the whole register clears.
> 
> Only update the write select field.
> 
> Fixes: 4f537776340d ("rockchip/drm: vop2: add support for gamma LUT")
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index c59e270739b6..259e30ebb9cb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2015,8 +2015,9 @@ static void vop2_crtc_atomic_set_gamma_seamless(struct vop2 *vop2,
>   						struct vop2_video_port *vp,
>   						struct drm_crtc *crtc)
>   {
> -	vop2_writel(vop2, RK3568_LUT_PORT_SEL,
> -		    FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
> +	regmap_update_bits(vop2->map, RK3568_LUT_PORT_SEL,
> +			   RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
> +			   FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
>   	vop2_vp_dsp_lut_enable(vp);
>   	vop2_crtc_write_gamma_lut(vop2, crtc);
>   	vop2_vp_dsp_lut_update_enable(vp);
> 

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


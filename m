Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304790;
	b=kdZ/5V4825IoLbRSrAKWufFxvyl0mLu+BLI4ZX//MaYbbEKVqcsq5t53JxkzAC1WZYH9
	 KhBEcb7zbRg/2XntpALXT/7JrNIpG/z4sG8Pu/IAsjfM8skjIKJyivlph74sK5FMP07m4
	 htnSMar+PJBLEFFhIPTvPVIdDEQZ+EEk8C+css3/XO09UR1z33803XaHWELYB1RTqJOOu
	 B0aogHmFTWxGHw4Ks42D10FZYqj7sTTJBHavE3gAASm8qvd1wDrDJg3LkOnGF3UFmyD5g
	 A/x/nIoHHs5x8Af+08uoXP47NZJ7XZCqrLnGVCuhuJoOKShxcHVJ+ZPlW7B5sc+qfEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304790;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=B5FetUpkGwGLsikqm7LuzqYKP4h6EEv4RA9Kg5VS7Q4=;
	b=dQgxxrBp/OwP300b7OGtBHBY03PJ7EVgM2186ExRfEKefMH81f6xANTgaTfF79BJsV+Z
	 j7Xkt/MnHb+XdkyB6fseNzkEHQk5mMFoRNbFgPfvLrBED9z59oB9ZoILtppnc3hKaNUoU
	 KAN6hEpdiDOI/lmhRMNNTVKf24HY6LNgD3orTD694taFVBwgWbE2DSP0ymoVAvuCUlnfD
	 yQmA/L9hSGi5x+olFC08DaytAyFdJunOf9cToWTXWSPy+dVDI/BCvh4toY1Rdp8ZUDFo5
	 cuHUzMzkZ6ylLXFAhPDPtC8QoDn3oq64bkNNdwHFYwQ0vriKODvK5GbiIacHqw6cTBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NeQg5WF0;
	arc=none smtp.remote-ip=154.81.10.85
Received: from mail-m1085.netease.com (mail-m1085.netease.com [154.81.10.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B45606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B45606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NeQg5WF0
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54272b12f;
	Tue, 10 Nov 2026 17:59:39 +0800 (GMT+08:00)
Message-ID: <4fe3809c-1243-4290-abb7-c2025cfffe55@rock-chips.com>
Date: Tue, 10 Nov 2026 17:59:34 +0800
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
Subject: Re: [PATCH 7/8] drm/rockchip: vop2: Keep the other LUT_PORT_SEL
 fields on gamma LUT updates
To: aiyengar1990@gmail.com
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
 <20261110-vop2-fixes-v1-7-d336e9dd90d3@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261110-vop2-fixes-v1-7-d336e9dd90d3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1c4e6230803a7kunm170f4cac71683e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDT0lCVkhJGkIdGhlJTxgeH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NeQg5WF05QqwqNMEh/5PIv4tY08ihs/bAA0gQ9ZQ9b1HtYcrxvSNNVB3aFRXVWkgFWLUlRSbzJk7ESzhua4juivde+DQaRtroOjXb/jvRpla2nlxTgnra5jAFeTcGXusnSQgmxtQzSlyHpsjWe71Ev9+NUEjy1OWL/wPm1sNVco=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=B5FetUpkGwGLsikqm7LuzqYKP4h6EEv4RA9Kg5VS7Q4=;
	h=date:mime-version:subject:message-id:from;

On 11/10/2026 3:18 PM, Arun Iyengar via B4 Relay wrote:
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
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 3323e50224c5..9ad138457204 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1774,8 +1774,9 @@ static void vop2_crtc_atomic_set_gamma_seamless(struct vop2 *vop2,
>  						struct vop2_video_port *vp,
>  						struct drm_crtc *crtc)
>  {
> -	vop2_writel(vop2, RK3568_LUT_PORT_SEL,
> -		    FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
> +	regmap_update_bits(vop2->map, RK3568_LUT_PORT_SEL,
> +			   RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
> +			   FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
>  	vop2_vp_dsp_lut_enable(vp);
>  	vop2_crtc_write_gamma_lut(vop2, crtc);
>  	vop2_vp_dsp_lut_update_enable(vp);
> 

-- 
Best, 
Chaoyi


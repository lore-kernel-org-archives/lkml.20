Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533792;
	b=ayPYFQ7DoDvxDN11UVDlpDixER/VVLdbtD6ctXVHb6Uiaz0v9UOhj4HLHk6Md3safHxp
	 kb3YWQHsFbF4pz+PaRYbX5Fl4lnItE7aCmiuCaoNQGsxBEQbia56mjPOVCLLUk7NEvAga
	 wSSqnpu9DGfMxn6ypIViXdeC0v7PO8I1BWyjClhuPdP6ou2U3nd+ljF5A0fpXYVFguY0p
	 kYOxvr3C3EDhUcgKnKVHnBZBwvx6G1mpNj5L0ildcuMRuJvZTSSD5jWIdrVacEyhpu7Df
	 RzFp4ngZFuPljiMsQ17VkLgwHLQ4Sma4yXrF0uxb+qC7fSPFf8RNutWEmHNxhTBQS7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533792;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=yUomd9KXnjseidZCb+3NrIiSfYZB9y809aXsxz/VNIE=;
	b=5J/Va29f+IQZsruv7nwPz4UPWWnD8rNhNovcaiPBtKWB0rgMu4qqrCgaN14JXwVM7rcT
	 7MNfnP4kxUdN7twpZTVOkgMgIlG8Sn0r1MvNIbdyZIJt6V7o2YzBmOylzuxQvRgsDA6QX
	 AB06yGbTRKlW9IG1VEpEX5gDjGMFd/FbEpm3YIsOePpYrF/X5OMYT82Hk3s3ex2LIfRDW
	 UN1urqR3uBz8NBwclAmjgwzwd8B0enVPc/XSZVmqwivvvIs8wiSGIb9fPM2GS26jpg1ef
	 cuy5qhxapgxJVdHUEJMH9AspCE0SSZ6K9F9+kqc7xIpagMBDtPq9IRJXP6gvpUJq2kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NRK1Ogzd;
	arc=none smtp.remote-ip=160.236.53.19
Received: from mail-m1602365319.xmail.ntesmail.com (mail-m1602365319.xmail.ntesmail.com [160.236.53.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45317606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45317606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NRK1Ogzd
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5483f8bd3;
	Fri, 13 Nov 2026 09:36:19 +0800 (GMT+08:00)
Message-ID: <781db207-ca0e-4e41-8706-c0769b58385f@rock-chips.com>
Date: Fri, 13 Nov 2026 09:36:16 +0800
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
Subject: Re: [PATCH v2 3/9] drm/rockchip: vop2: Fix the HDMI sync polarity on
 RK3588
To: aiyengar1990@gmail.com
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Piotr Zalewski <pZ010001011111@proton.me>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-3-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-3-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d28c68f003a7kunm3ed8a3c2a36d2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUJIVhlOH0ofTR1CH00aGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NRK1OgzdCmB0whylUbps83DuQoBR+n4HlZoHbh9r3cb/rRAS1LmfPW6CJBFracLEP2OjBWzSwHIRlCOx5ZgWV4+srjQntk06TeTXvD8Xvua0J5PX+oSN0N2tCeZvWAtxonYwNljqL5muGYLMjOh2y6mgMc0Cg8AlBD5CZYQ3ncY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=yUomd9KXnjseidZCb+3NrIiSfYZB9y809aXsxz/VNIE=;
	h=date:mime-version:subject:message-id:from;

Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Oh wow, nobody even noticed this.

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> rk3588_set_intf_mux() passes the POLFLAG bits of the mode to
> rk3588_get_hdmi_pol(), which decodes them as DRM mode flags: the
> VSYNC_POSITIVE bit is taken for DRM_MODE_FLAG_NHSYNC and POLFLAG_DCLK_INV
> for DRM_MODE_FLAG_NVSYNC. As a result GRF_VO1_CON0 marks the HSYNC of
> every +HSync/+VSync mode (e.g. all 1080p, 2160p CTA modes) as negative
> and both syncs of -HSync/-VSync modes (e.g. 720x480, 640x480) as
> positive.
> 
> The bits in GRF_VO1_CON0 are set for a negative sync; that is how the
> vendor kernel programs them (vop2_get_hdmi_pol(), called with the mode
> flags, sets them for DRM_MODE_FLAG_NHSYNC/NVSYNC on RK3588). Decode the
> POLFLAG bits accordingly.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

> ---
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 659fd0a3ab63..7c48b440cb29 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1687,12 +1687,16 @@ static u32 rk3588_get_mipi_port_mux(int vp_id)
>  		return 0;
>  }
>  
> -static u32 rk3588_get_hdmi_pol(u32 flags)
> +/*
> + * The HDMI sync polarity bits in GRF_VO1_CON0 are set for an active low
> + * (negative) sync.
> + */
> +static u32 rk3588_get_hdmi_pol(u32 polflags)
>  {
>  	u32 val;
>  
> -	val = (flags & DRM_MODE_FLAG_NHSYNC) ? BIT(HSYNC_POSITIVE) : 0;
> -	val |= (flags & DRM_MODE_FLAG_NVSYNC) ? BIT(VSYNC_POSITIVE) : 0;
> +	val = (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(HSYNC_POSITIVE);
> +	val |= (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(VSYNC_POSITIVE);
>  
>  	return val;
>  }
> 

-- 
Best, 
Chaoyi


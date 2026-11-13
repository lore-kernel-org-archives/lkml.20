Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794535396;
	b=4LrowbdPHFwDcBt2AGimdAWRuxgFoVCusUEe03USTM8WYZAxvRcomLMiBl7GOoMjvGpY
	 3XaL97W46dpqWmVu2ItAcRT1urzbq2PwykX1l6HhH1NroRttLAuBYD/mkpx/QkVdNybcX
	 GgHcT6pr3aZcqofEnyCGnYb24hY6FVHJSJ+biYG3SUPiFRgrA5kFJO3oFzVFCxe31CZUV
	 hPVvdkRfNCaQniYTwpsyCBWZMDlG/i1sAvPmrqgrkn3dvR3aDz1yjQdV1TEJ7EI4+LART
	 gI6SKVM0tTMVlBf0y3ADDT1kIdHdd2frlcgqDJzyeQXFcl8Se7p0PFGqn/Ed1o3uyxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535396;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=2yRMouvHM4a05izOhD8UAJhMpR/Nv3hy0kmuRjqTsS0=;
	b=ihto/17WaFGTXlCUPINrB1Yj2HY7jhM21QavIz73TKP3q660oGNbQ+YltlbfuYa32q3Z
	 qNfm9I/ghAbSTN1mrW5WHV2BL/uhpKsATs0T24YgAe4AdR9Aniyk0hUmZYOyZ+bWR4d1o
	 AqWmH7ZR6XuyXT8io0qQV5LSaOySljZ84/k1Cr7oAttwPzsUqQHaSGVERx4YeIT1K1WHC
	 Bt36CAzQADKh9wggiwiHXmzwt1bBwu8iUbXOXtuTiO23Vu7xjsmeguMj/xFL6+6Dj8Sdi
	 RtvLcdGnZljLvan7iXBbJI9wnzmzumd7MRuT1bFZXXFj/yXkcjijb/MW7BABkz5N2ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="cux/RLhd";
	arc=none smtp.remote-ip=103.209.128.100
Received: from mail-m128100.netease.com (mail-m128100.netease.com [103.209.128.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB803606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB803606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cux/RLhd
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5484f6ba6;
	Fri, 13 Nov 2026 10:03:03 +0800 (GMT+08:00)
Message-ID: <a5b52d95-7fa2-4148-aa02-cfee6f195e1a@rock-chips.com>
Date: Fri, 13 Nov 2026 10:03:01 +0800
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
 <20261112-vop2-fixes-v2-3-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-3-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d2a4e0a503a8kunm80fbc02f473c1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEgZVktPSUtOHktJHUkeHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cux/RLhdEL9vzjCYZTxGA7XZvFMhySw1imRGjuTXATiePVhVQlIg6iqCsMd2ya3Ce40+JGvTvb6GcwHJprfLAmmcqepp/gpQu3glqJRd9eOvuUXOFZKrNE0NuHSnPUYPB//LAmjkdaURy8uevm+sR9XEbyAYolryMwDneUGHmjY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2yRMouvHM4a05izOhD8UAJhMpR/Nv3hy0kmuRjqTsS0=;
	h=date:mime-version:subject:message-id:from;

Hi Arun,

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

The commit msg confuses me. POLFLAG_DCLK_INV has no relation to 
DRM_MODE_FLAG_NVSYNC.

For the RK3588, the polarity relationship is:

DRM_MODE_FLAG_NHSYNC -> Set HDMI hsync polarity bit
DRM_MODE_FLAG_NVSYNC -> Set HDMI vsync polarity bit
DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE -> No valid HDMI dclk polarity bit

> 
> The bits in GRF_VO1_CON0 are set for a negative sync; that is how the
> vendor kernel programs them (vop2_get_hdmi_pol(), called with the mode
> flags, sets them for DRM_MODE_FLAG_NHSYNC/NVSYNC on RK3588). Decode the
> POLFLAG bits accordingly.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 659fd0a3ab63..7c48b440cb29 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1687,12 +1687,16 @@ static u32 rk3588_get_mipi_port_mux(int vp_id)
>   		return 0;
>   }
>   
> -static u32 rk3588_get_hdmi_pol(u32 flags)
> +/*
> + * The HDMI sync polarity bits in GRF_VO1_CON0 are set for an active low
> + * (negative) sync.
> + */
> +static u32 rk3588_get_hdmi_pol(u32 polflags)
>   {
>   	u32 val;
>   
> -	val = (flags & DRM_MODE_FLAG_NHSYNC) ? BIT(HSYNC_POSITIVE) : 0;
> -	val |= (flags & DRM_MODE_FLAG_NVSYNC) ? BIT(VSYNC_POSITIVE) : 0;
> +	val = (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(HSYNC_POSITIVE);
> +	val |= (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(VSYNC_POSITIVE);
>   
>   	return val;
>   }
> 

With the commit msg modification:

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


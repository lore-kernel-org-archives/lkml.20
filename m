Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538771;
	b=lAFA6iYk/XbYACh26EMQU7GZsiCiVDut8yTynb+1tEqBbiyey/t1K/HEM4yItRb+CItn
	 eZmVxrdpYFcmwDqTPLyBqMUaD3MGztsPHawdBA+S5dFqSZw0epK0aa9L4yn+mofs0Vpvr
	 FZtPO49OHbNAXtY24QVNY0MeOPhQmPUj7XQyYEf/kb3rMItzYfT8JuMUYXHraPDn+IrXJ
	 zh5Y1i0DtOLw3ikGVWqHEeWlKQ+yHiVhtXhcfJxWY5hQGdtUC82pfX1HOhftgRE1d8v76
	 eRfSsAp8ocD41YCusOpqqAw4k8XgltL3OtJbdqqZSkliz2AIa9iwQbVOC76c62Pni7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538771;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=7f0VgzKYfj5CawodwOdHpH247rLlZpKsDV1GNlXMq38=;
	b=pateghbGXSeFjUkuQ4S7POs2jBo0yReNdnuVFUa9g8Ls5lJaByiv7ZG/ablZICUS6qMS
	 r3B1llb5a/GMyL/b1SJF7hV8+4XRHsxEplmWpaOb61ymaFhtmHJp2mNG3aHYKYhPb/Tt7
	 Nkqt97ipprIJdRgB6QiEjQKCceilQh0LGhzUcZDKgM7ftpSnw9gUrx865HlkqrMjrutxJ
	 pB9nWTQPi9BAwDmBTyqsPq1eyGKe7RCeZ5vBIlZz+W8kermSg5vSMQln+VTEYUAXus3cZ
	 JALuGM0q7MqMMDu2OJaXlTkBkVkSrrSTxY1FLs2PdoiwIsphLJJc0p2/wDcX1CSJj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Qdg4MUZ5;
	arc=none smtp.remote-ip=210.79.60.64
Received: from mail-m6064.netease.com (mail-m6064.netease.com [210.79.60.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E9F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E9F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Qdg4MUZ5
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 548728669;
	Fri, 13 Nov 2026 10:59:19 +0800 (GMT+08:00)
Message-ID: <72fb3540-e08e-40be-8f3d-63727063be6a@rock-chips.com>
Date: Fri, 13 Nov 2026 10:59:18 +0800
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
Subject: Re: [PATCH v2 2/9] drm/rockchip: vop2: Don't use uninitialised
 dividers on RK3588
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
 <20261112-vop2-fixes-v2-2-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-2-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d2d8660c03a8kunm99272d8254646
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZS04dVkMfH0hJGk5CGUtOQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Qdg4MUZ5Y5J5AttCyLUfn9lIM32IW8XAcaVforshf1MHKrWmIjs5KPzF7sr5ykNqk4XWdPqxd/kZqOSYOCZRct3O6ZciBOTaddFdowkjYuaDeHkiVOJ+Pputz/rl2wt+RHFdr6fNS8xAE5b+cJEXtrfgF7Tdnc0btK8nXnye/dY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=7f0VgzKYfj5CawodwOdHpH247rLlZpKsDV1GNlXMq38=;
	h=date:mime-version:subject:message-id:from;

Hi Arun,

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> rk3588_calc_cru_cfg() converts all four dividers to their register
> encoding with ilog2(), but only sets the ones the interface uses:
> dclk_out_div is left uninitialised for HDMI, eDP and DPI, and
> if_pixclk_div/if_dclk_div for DP and DPI. The garbage is then written to
> RK3588_VP_CLK_CTRL; on an Orange Pi 5 the dclk_out divider of the HDMI
> video port reads back as 3 (/8) in every mode.
> 

The comments are not entirely accurate. The divider relationship is:

dclk_out_div: HDMI(dsc mode), DP and MIPI
if_pixclk_div: All interfaces
if_dclk_div: HDMI and eDP

> Start all dividers at 1. dclk_out only feeds DP and MIPI (and HDMI with
> DSC, which is not supported), so for the other interfaces keep it at the
> dclk_core rate, as the vendor kernel does for HDMI with DSC, instead of
> letting it run at the full DCLK rate.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index c44648e1bc0d..659fd0a3ab63 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1579,6 +1579,15 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>   	unsigned long if_pixclk_rate;
>   	int K = 1;
>   
> +	/*
> +	 * Not every interface uses every divider: dclk_out only feeds DP and
> +	 * MIPI, the interface dividers are unused for DP. Start from 1 so that
> +	 * no divider is left uninitialised when its value is converted below.
> +	 */
> +	*dclk_out_div = 1;
> +	*if_pixclk_div = 1;
> +	*if_dclk_div = 1;
> +
>   	if (vop2_output_if_is_hdmi(id)) {
>   		/*
>   		 * K = 2: dclk_core = if_pixclk_rate > if_dclk_rate
> @@ -1648,6 +1657,9 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>   	}
>   
>   	*dclk_core_div = dclk_rate / dclk_core_rate;
> +	/* An unused dclk_out must not run faster than dclk_core */
> +	if (!vop2_output_if_is_dp(id) && !vop2_output_if_is_mipi(id))
> +		*dclk_out_div = *dclk_core_div;
>   	*if_pixclk_div = ilog2(*if_pixclk_div);
>   	*if_dclk_div = ilog2(*if_dclk_div);
>   	*dclk_core_div = ilog2(*dclk_core_div);
> 

I think we can drop the previous divider initialization, and configure 
the correct dividers for specific interfaces.

- dclk_core_div and if_pixclk_div just remain unchanged.
- if_dclk_div is set for HDMI and eDP interfaces; all others are set to 0.
- dclk_out_div is set for DP and MIPI interfaces; the rest are set to 0.

Best regards,
Damon


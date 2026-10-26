Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792981113;
	b=ydsUBwNlyl39VDRXD4Qza5t7Tg8rh1AruymAF1iYfA/ffR8LhI/ITC3sFThJbyyHRE57
	 u2+NsMNQG1M1OevBSOIne0c1m27RRoDRwJTnSxUzCpjGCzCHlK/cUuMXbZDBfqj7yO8Aw
	 UW0hylSpzB6QRMlNGv6IN5Xq7GUBb16AFfNzd15V9d72LxGXqZbwbFdEj2vJyUr9tLnbO
	 s/+y0phHUapfW50yYvGd3y090bhSidz9pjio6ooTWwL1wiU9FafOVw8eU5dQtd1Sn6UNd
	 RRCQjQMxsQkz+N2j7EJjC6jPMfvav/11YpnhjIS7JjBc8GOFa3y4ewr9EeJzCtmbwhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792981113;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=85O98ibYQIY4tqJnX7KyBnA6NvI/h3LWUxQTLuidEQg=;
	b=Z6DmGE4lExfcmXaTcXfI6g+2OZorKq5Vr3BnYTixprHHUegd8cTVhMoBrUrLYwL06t2r
	 f5KGrqAnJmeABWKIDQ6vMoWJ7pru4bPNtvGCjndpKPpmejx/ziH+fD5NCbB56V+ZG4bj5
	 GszgRNFX0HBnvp0e6PY74kOCsVKtrVJYzWOBbQbL71dXXGwp/a7eRxLF5ZIw+VzKxgl0D
	 oD36fVOq56Apgm15Y4tZgK9WKlIYL7txkJXhgKABonUeZcMF7a/JbJqfbTXAwvhsTnGYa
	 SjWAuJ1+kf0FsF53Ab4F2LnZnbvqN9uiVXf+0LtXfcTmFF47JqkLm/58T4e8XDvrr1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=kVKDnGi7;
	arc=none smtp.remote-ip=154.81.10.187
Received: from mail-m10187.netease.com (mail-m10187.netease.com [154.81.10.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BDB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BDB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=kVKDnGi7
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 524c264ae;
	Mon, 26 Oct 2026 10:18:21 +0800 (GMT+08:00)
Message-ID: <9e3dc854-b2f5-459c-8267-55e88e87f5b5@rock-chips.com>
Date: Mon, 26 Oct 2026 10:17:58 +0800
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
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: use the lane rate for lbcc when
 lanes run faster
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261025142639.3454322-1-romain.tisserand@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261025142639.3454322-1-romain.tisserand@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa176006a1b03a7kunm3cd7cb0e672527
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTx9LVktJTRlOShlISUNJSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kVKDnGi7Vz6BTvdW8UtqvNNMudpYj9sKVhglzVFIrz/tElI5jE2PuHYdAiS+Em2/OikLiA5pArO5uVmdWbDcI+mM3aj9/vteKEmHJRrZIbQxdLJ1BBaBT/QeTSyTI3NC3vRa5R3bNlfuqSS6/sEpaAqq18JMAIiUnDrFscxw/Vg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=85O98ibYQIY4tqJnX7KyBnA6NvI/h3LWUxQTLuidEQg=;
	h=date:mime-version:subject:message-id:from;

Hi Romain,

On 10/25/2026 10:26 PM, Romain TISSERAND wrote:
> Commit ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
> rate to calculate lbcc") counts HSA, HBP and HLINE from the pixel clock,
> which is only right when the lanes run at the pixel bandwidth (pixel
> clock * bpp / lanes). Commit 93e82bb4de01 ("drm/bridge: synopsys:
> dw-mipi-dsi: Fix hcomponent lbcc for burst mode") went back to the lane
> rate for burst mode, where the lanes are faster on purpose.
> 
> The Rockchip glue runs the lanes faster in every mode: it adds 25% to
> the pixel bandwidth, or uses the rate the panel asks for. In non-burst
> video mode the line programmed in lane byte clocks is then shorter than
> the DPI line. On the GPD XD (RK3288, ILI9881C panel, 4 lanes at
> 752 Mbps, 59.5 MHz pixel clock, htotal 747) HLINE was 561 lane byte
> clocks (6.0 us) for a 12.55 us line: the DPI payload FIFO overflows
> (dpi_pld_wr_err in DSI_INT_ST1) and the panel shows garbage as soon as
> a client page-flips.
> 
> Use the lane rate when it is clearly above the pixel bandwidth (more
> than 1/8), and keep the pixel clock formula when both match, as on
> i.MX93, Meson and STM in non-burst mode, where lane_mbps is the pixel
> bandwidth rounded up to the next MHz. On the GPD XD this gives HLINE
> 1181, HSA 21 and HBP 7, and the picture is stable.
> 
> Fixes: ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate lbcc")
> Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
> ---
> Notes for reviewers (not for the changelog):
> - The 1/8 threshold separates glues that report the pixel bandwidth
>   rounded up to the next MHz (i.MX93, Meson; STM in non-burst mode) from
>   Rockchip, which adds 25% in every mode. If a per-glue flag is
>   preferred instead of a threshold, I can rework it that way.

Adding different glue code for each implementation seems like a good
idea.

Maybe you should try to add a new callback in dw_mipi_dsi_plat_data ?

> - Testing: built with W=1 for arm (multi_v7) and arm64 (defconfig),
>   DRM_DW_MIPI_DSI=y and =m, no warnings. Tested live on the GPD XD
>   (RK3288, ILI9881C, non-burst with sync pulses), 6.18.54 with this
>   exact change applied: HLINE 1181, HSA 21, HBP 7 read back from the
>   DSI host, no dpi_pld_wr_err in DSI_INT_ST1 while the UI page-flips,
>   and a clean picture in the UI and in games (before the change: garbage
>   as soon as a client page-flips).
>   Not tested on i.MX93, Meson or STM hardware; for them the computation
>   is unchanged unless the lane rate is more than 1/8 above the pixel
>   bandwidth.
> - Tool disclosure: this patch was prepared with Claude Opus 5.5
>   (Anthropic) as a coding assistant, in an interactive session where I
>   asked it to bring up the GPD XD display and then to prepare the fix
>   for upstream. It located the cause from the DSI host registers, went
>   through the history of the lbcc computation (ac87d23694f4,
>   93e82bb4de01) and the lane rates of the other dw-mipi-dsi glues, and
>   drafted the code change and the changelog. I reviewed and understand
>   both, and tested the patch on the GPD XD as described above.
> 
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 22d1b8cbe1..b026b602ab 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -781,19 +781,28 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
>  					   u32 hcomponent)
>  {
>  	u32 frac, lbcc, minimum_lbcc;
> +	u64 pixel_kbps;
>  	int bpp;
>  
> -	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> +	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	if (bpp < 0) {
> +		dev_err(dsi->dev, "failed to get bpp\n");
> +		return 0;
> +	}
> +
> +	/*
> +	 * Use the lane rate when it is above the pixel bandwidth (burst, or
> +	 * glues adding margin in all modes); the 1/8 slack ignores lane_mbps
> +	 * being rounded up to the next MHz. Otherwise the pixel clock is more
> +	 * precise.
> +	 */
> +	pixel_kbps = div_u64((u64)mode->clock * bpp, dsi->lanes);
> +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ||
> +	    (u64)dsi->lane_mbps * MSEC_PER_SEC > pixel_kbps + pixel_kbps / 8) {
>  		/* lbcc based on lane_mbps */
>  		lbcc = hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
>  	} else {
>  		/* lbcc based on pixel clock rate */
> -		bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -		if (bpp < 0) {
> -			dev_err(dsi->dev, "failed to get bpp\n");
> -			return 0;
> -		}
> -
>  		lbcc = div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);
>  	}
>  
> 
> base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a

-- 
Best, 
Chaoyi

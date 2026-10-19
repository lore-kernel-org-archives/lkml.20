Received: from mail-m1973190.qiye.163.com (mail-m1973190.qiye.163.com [220.197.31.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883103EF0AA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380896; cv=none; b=VNbxak8E01z+2uDEFkPvTbDGxDeqtUFwYOCKfDDyKR76xudZic1fCUrR6V3CrgP4ogcqvCU7byxbcdQyr+unk3nnBa1VIxaer/Zi/pTvALXO61V4OsjEZ30NJL8/7s9wk0aHKq9x9haRIh7k6eChn9aZrsIjetp/k3nUPVYYXik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380896; c=relaxed/simple;
	bh=ChgzJFotOHk4FwoFNuMy7w9LtUF4Yyb/meEaeTRD69g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUnAkZyTVqZE2uw/ALOQ0CtEgmnielGiyv22ZKvCvjjthVkv/2LopmPNN1Bpv52N4MqKLGw5nSKUM1pqeGv4Ahj7GiBbNhUKcighVaJ+I2ahBDK0d7g9D8tEi2q09OOQP9TuFrY9Tdwa9I38PiRjasr6t82hEOMmyTmK6sKVsFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=X8qrc33b; arc=none smtp.client-ip=220.197.31.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="X8qrc33b"
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 517ccec8a;
	Mon, 19 Oct 2026 11:19:24 +0800 (GMT+08:00)
Message-ID: <039f91a1-7944-4092-9f9c-29b60e8fb17a@rock-chips.com>
Date: Mon, 19 Oct 2026 11:19:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/rockchip: dw_hdmi_qp: Advertise BT.709 and
 BT.2020 colorimetries
To: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018123037.19560-1-jan.claussen10@web.de>
 <20261018123037.19560-7-jan.claussen10@web.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261018123037.19560-7-jan.claussen10@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1522bcbba03a7kunm2ba821ca621edd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTR9KVhkaGExPSRkdSxhJT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=X8qrc33bAdqlCUhSSbAnZ7Rg0xsGeQmWcCbJS176oyZkg2wZzy/HQVrpMmR7d7krcZ8mgQDMHVWnffVtLTJOO/maaoxdKbG7QGGk9gvw5pkv9W6qA8geJFC97doHHcDT4cxXOMCS8Cwt/F6Ozb2vYl+RaJa1xkjdhBwCavmCljM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=bQMCpVw1uFP1boBJUVC1GNNS3Uq4o6Be3+8+DlETUU0=;
	h=date:mime-version:subject:message-id:from;

Hi Jan,

On 10/18/2026 8:30 PM, Jan Claußen wrote:
> Expose BT.2020 RGB and YCC colorimetry so userspace can enable HDR
> output. Also explicitly expose BT.709 YCC as it is listed in the
> Rockchip RK3588 TRM V1.0-Part2 20220309 data sheet.
> 
> Tested on a Radxa Rock 5B (RK3588) with an LG OLED55B87LC in KDE
> Plasma 6.7.5: enabling HDR switches the colorspace to BT.2020, and
> disabling it restores the default.
> 
> Signed-off-by: Jan Claußen <jan.claussen10@web.de>
> ---
> 
> Not sure if BT.709 needs to be explicitly exposed here, but it is mentioned in the data sheet.
> Might be covered by DRM_MODE_COLORIMETRY_DEFAULT though.

Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Hi Cristian, may be you would be interested in this series?

"DEFAULT" may refer to either BT.601 or BT.709. It should support the
following color spaces:

#define HDMI_COLORSPACE_CAPS_V1		(DRM_MODE_COLORIMETRY_DEFAULT | \
					DRM_MODE_COLORIMETRY_SMPTE_170M_YCC | \
					DRM_MODE_COLORIMETRY_BT709_YCC | \
					DRM_MODE_COLORIMETRY_BT2020_RGB)

#define HDMI_COLORSPACE_CAPS_V2		(HDMI_COLORSPACE_CAPS_V1 | \
					DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65)

> 
> BT.709/BT.2020 YCC are untested.
> 
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9c4cf68d79d5..dbb87dfd000c 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -605,6 +605,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
>  				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
>  
> +	plat_data.supported_colorspaces = BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +				      BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
> +				      BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
> +
>  	encoder = &hdmi->encoder.encoder;
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
>  

-- 
Best, 
Chaoyi

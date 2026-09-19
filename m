Received: from mail-m15591.qiye.163.com (mail-m15591.qiye.163.com [101.71.155.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24618175A62;
	Sat, 19 Sep 2026 07:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789801712; cv=none; b=P1nhPotAaewOCf6fRiEnVLyQaSc3Aukcl24QmqLttHv+vMVtD5jWY2HKwMdlRxoSshxqqFNlrZlVBe0kZ+Oy9vaUX7HIdPk/mc1sdO2ke13SDYvssWXoOqui7VnSo7bPYcCoJB0We0dM2TtTlOqcXaeCUyKK3KnIbhcz3mlfJyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789801712; c=relaxed/simple;
	bh=O5C1bWfMukVLIwdOce9J6ID7mZsJFQ0VIfBx5Co8uDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EosIhTXgEHgPOw//w6T+vtii6yusGCYCCT+Q+X63sN1d8r0VWBa+FbQQKKx6xdZyRqg3LvAdkLE2Jral8Q5VUrURhW1CHRChqDSo/uict48K4dMuoDS1MdpM+2+eZIlhESxCKYjA2zMOXPs19nnLPyn+3GpbV0SKFVzkx0ps2vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IYvLOT+Z; arc=none smtp.client-ip=101.71.155.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IYvLOT+Z"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e5c81ff9;
	Sat, 19 Sep 2026 14:52:38 +0800 (GMT+08:00)
Message-ID: <94451cc1-5dcc-4017-9b17-19fc20245ca8@rock-chips.com>
Date: Sat, 19 Sep 2026 14:52:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/13] drm/mediatek: Implement Display Stream
 Compression support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 justin.yeh@mediatek.com, jason-jh.lin@mediatek.com
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
 <20260916110825.102631-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260916110825.102631-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa0b8703e5003a7kunmb39cf7f3fb4f3e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTx4fVk5JGk5CSk9JGBoeSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IYvLOT+ZLuL17rn47b2fIRKpsfV3Djch3gDimo9Pbn3EhzAdXn+34mKd9GylNsvfzySPs0QIMnHV0WM952ngEQInR2LgNciceaA4c5mn+0TqE6KLXQw4EIIuKoOnuPzINBtI4+nXvALj8t/uyy6tuGhRnHz+zjY0RhIfWYT0Eqc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=yCvKOOZJlmWGLHZyrsJtjvW3q4jXCw/cfJrFwwwwJvQ=;
	h=date:mime-version:subject:message-id:from;

Hi,

On 9/16/2026 7:08 PM, AngeloGioacchino Del Regno wrote:
> Add a real driver for the Display Stream Compression (DSC) Display
> Controller IP, implementing support for DSC v1.1 to v1.2.
> 
> In order to do this, it was necessary to remove the basic DSC IP
> bypass setup from mtk_ddp_comp: this functionality is retained in
> the new mtk_disp_dsc driver, which checks if DSC was actually
> requested by other components (with the only one that currently
> supports this being DSI) and, if not, it will set BYPASS mode in
> the DSC IP.
> 
> Like before, the BYPASS mode is set before starting the DSC IP,
> but unlike before, this is being done in the component start
> callback instead of the config one.
> Notably, the config callback is called by mtk_crtc always
> immediately before the calling start callback, so the order of
> register writes is retained.
> The only real difference is that now this is being done through
> CPU writes instead of CMDQ, but since that's called only once
> and since it's just three registers, the performance impact will
> not be minimal and not even measurable.
> 
> As anticipated, DSC handling was also introduced in the mtk_dsi
> driver: when performing dsi_host_attach, the driver now checks
> if the DSI panel adds the DSC configuration structure to the
> mipi_dsi_device structure and, if it does, it will store a
> pointer in the driver-local mtk_dsi structure's `dsc` member.
> 
> The DSI driver will then check whether the DSC configuration
> that comes from the panel is valid (in regard to MediaTek DSI)
> and will call the DRM API's DSC helpers to calculate and set
> all of the const and RC parameters for the actual DSC setup.
> 
> For the time being, even though the latest MediaTek SoCs do
> support DSC v1.2, only DSC v1.1 pre-scr support is implemented
> as an initial contribution (which is rather big, and 1.2 would
> make it even bigger - but that can anyway be implemented later).
> 
> As a last step for validation of DSC parameters in DSI, a check
> for the hdisplay against DSC slice sidth and one for vdisplay
> against DSC slice height was added to the mode_valid callback,
> making sure that H/V are, as expected, multiples of slice W/H.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile       |   1 +
>  drivers/gpu/drm/mediatek/mtk_crtc.c     |  21 ++
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  43 +--
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   9 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_dsc.c | 449 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c      | 151 +++++++-
>  9 files changed, 635 insertions(+), 50 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
> 

[...]

> +
> +	dsc->simple_422 = false;
> +	dsc->convert_rgb = true;
> +	dsc->vbr_enable = false;
> +
> +	drm_dsc_set_const_params(dsc);
> +	drm_dsc_set_rc_buf_thresh(dsc);
> +
> +	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);
> +	if (ret) {
> +		dev_err(dev, "Cannot find DSC RC params\n");
> +		return ret;
> +	}
> +

Just out of curiosity, is there a reason the DSC v1.1 rc parameters 
aren't used here?

-- 
Best, 
Chaoyi

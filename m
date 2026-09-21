Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B275457E69;
	Mon, 21 Sep 2026 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985164; cv=none; b=rpON6ZtoA9kmOqcN1AVYry9zk5Y0UTsrJR4tpJ0PwQwvjQuff0X1jydPU8H/9RUTRqWQQZb5MXIlJbE/ojoUbDIam/lE4YnNDdbIJjuqo3CClqbcbgZ/i8uxI1CovcLjjP3Jl06HVHp+aEjEdFTgrd6H5Lt1+yuFtT4VVsx+aPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985164; c=relaxed/simple;
	bh=cDVOUqRmDAiIlq1x0W5Pvyz6PeI3fBgskd+Ma0ilQKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RoGWXylAi+wmadQw+I5IxOthFmTTRazDuFiuWB+/+NsbwxNU3IV/Kkb78KO7wSpI8H3RtxbHn4eDKcAiBstXF8kvLmd7B63wvUi85Yvm/fAgdPgcYzefbuQx0JDCEPAs0NmemhXnntq6trfa3MGh4gZhqRn+xxTsRYpn1z+VC4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A3pfzR/d; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A3pfzR/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789985161;
	bh=cDVOUqRmDAiIlq1x0W5Pvyz6PeI3fBgskd+Ma0ilQKo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A3pfzR/dCqrz8smbfXkXbFTaPcptGDfypqJU0/vWlqaFXv6he4RZgFT2s1gI4WHJD
	 wnsm/w/bm4cf/OeQ5iGHeKsxop9OmaKwEk4DZSFWhR41obr1W9Q07t/Fhla4sa2KEo
	 rZnlnUNakg4PvHKtYLdwwHYiVAZ/FWjTBaVVkzdqqSjzjwtTpMPmSMn+ULiGk4PJFA
	 3Yg/py1RSSE+qxIaNb4EJFtx9TGzAGtSqqfSHFORXNQi1k7h7bLkp5b5veC22bHsoW
	 fQZFTnrMgQa9NJODZqU7bEF1cFC4Ay1PfltiJIBmiwucz+NCWMz6oTIgZxOF9fLomF
	 FESu3L+VMYGPw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49EA117E020C;
	Mon, 21 Sep 2026 12:06:00 +0200 (CEST)
Message-ID: <a657522a-30b3-491c-8f1c-9d09e3bbe176@collabora.com>
Date: Mon, 21 Sep 2026 12:05:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/13] drm/mediatek: Implement Display Stream
 Compression support
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 justin.yeh@mediatek.com, jason-jh.lin@mediatek.com,
 Nikolai Burov <nikolai.burov@jolla.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
 <20260916110825.102631-3-angelogioacchino.delregno@collabora.com>
 <94451cc1-5dcc-4017-9b17-19fc20245ca8@rock-chips.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <94451cc1-5dcc-4017-9b17-19fc20245ca8@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/26 08:52, Chaoyi Chen wrote:
> Hi,
> 
> On 9/16/2026 7:08 PM, AngeloGioacchino Del Regno wrote:
>> Add a real driver for the Display Stream Compression (DSC) Display
>> Controller IP, implementing support for DSC v1.1 to v1.2.
>>
>> In order to do this, it was necessary to remove the basic DSC IP
>> bypass setup from mtk_ddp_comp: this functionality is retained in
>> the new mtk_disp_dsc driver, which checks if DSC was actually
>> requested by other components (with the only one that currently
>> supports this being DSI) and, if not, it will set BYPASS mode in
>> the DSC IP.
>>
>> Like before, the BYPASS mode is set before starting the DSC IP,
>> but unlike before, this is being done in the component start
>> callback instead of the config one.
>> Notably, the config callback is called by mtk_crtc always
>> immediately before the calling start callback, so the order of
>> register writes is retained.
>> The only real difference is that now this is being done through
>> CPU writes instead of CMDQ, but since that's called only once
>> and since it's just three registers, the performance impact will
>> not be minimal and not even measurable.
>>
>> As anticipated, DSC handling was also introduced in the mtk_dsi
>> driver: when performing dsi_host_attach, the driver now checks
>> if the DSI panel adds the DSC configuration structure to the
>> mipi_dsi_device structure and, if it does, it will store a
>> pointer in the driver-local mtk_dsi structure's `dsc` member.
>>
>> The DSI driver will then check whether the DSC configuration
>> that comes from the panel is valid (in regard to MediaTek DSI)
>> and will call the DRM API's DSC helpers to calculate and set
>> all of the const and RC parameters for the actual DSC setup.
>>
>> For the time being, even though the latest MediaTek SoCs do
>> support DSC v1.2, only DSC v1.1 pre-scr support is implemented
>> as an initial contribution (which is rather big, and 1.2 would
>> make it even bigger - but that can anyway be implemented later).
>>
>> As a last step for validation of DSC parameters in DSI, a check
>> for the hdisplay against DSC slice sidth and one for vdisplay
>> against DSC slice height was added to the mode_valid callback,
>> making sure that H/V are, as expected, multiples of slice W/H.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/Makefile       |   1 +
>>   drivers/gpu/drm/mediatek/mtk_crtc.c     |  21 ++
>>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  43 +--
>>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   9 +
>>   drivers/gpu/drm/mediatek/mtk_disp_drv.h |   8 +
>>   drivers/gpu/drm/mediatek/mtk_disp_dsc.c | 449 ++++++++++++++++++++++++
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   2 +
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
>>   drivers/gpu/drm/mediatek/mtk_dsi.c      | 151 +++++++-
>>   9 files changed, 635 insertions(+), 50 deletions(-)
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
>>
> 
> [...]
> 
>> +
>> +	dsc->simple_422 = false;
>> +	dsc->convert_rgb = true;
>> +	dsc->vbr_enable = false;
>> +
>> +	drm_dsc_set_const_params(dsc);
>> +	drm_dsc_set_rc_buf_thresh(dsc);
>> +
>> +	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);
>> +	if (ret) {
>> +		dev_err(dev, "Cannot find DSC RC params\n");
>> +		return ret;
>> +	}
>> +
> 
> Just out of curiosity, is there a reason the DSC v1.1 rc parameters
> aren't used here?
> 

I was using the v1.1 RC parameters before, but Nikolai found out that some panels
actually require that, even when v1.2 support is not declared.

Besides, he also validated that v1.2 works for him, and works for me as well, so
I opted to use those ones instead, as the v1.1 pre_scr params were working for me
but not for him.

This will be improved in the future, as choosing any of the two will leave us with
something working and something broken... but I plan to make those improvements
only after at least this basic support finds his way upstream.

Cheers,
Angelo

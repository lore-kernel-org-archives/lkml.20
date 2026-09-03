Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9E23F9A16;
	Thu,  3 Sep 2026 06:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418352; cv=pass; b=HcPUnpHBS5wWjGSbYUiwhGYf6aIIDk2ElhLxzzlu9vkExsCM6LvwMbuJVdjPDHBrvSdvOrOiq2eZAUrFmcxOrMt4n9IrPZL5bAyz4fT7dTCzDIID5wuTh15TX4oYEgrXrj8dWOP8sG0lSqbikMroahpPmgW4BTuCtmTsyI73tZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418352; c=relaxed/simple;
	bh=CGogoL5nivygwZh5vnbyVHI3JKR9Ug26PAW4eEYLyB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+ILZTpzymQzcH/0IQUbCiqV4MCYXn5lHmqcCtnwNytKKftJ+ZCskxRJWTOXoRiII8KYKYbbK/fwDBjzFezS1y/aXN+DeJSKv92gKwIU698xkdYwdvlN/f4YLvP8r/OeWT57/G1h8mptGSAndywU25TyGnEKjc+t6f3P+zaDV1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=fD5LuFll; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="fD5LuFll"
ARC-Seal: i=1; a=rsa-sha256; t=1788418335; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jsJ+Pyd3DOlCYfziQiXASa0bVgkf3eHlIFTKBl8Sn8vob00+saKgglEDEfsBacT0kfbJn8/byZdUfs1uWMpi4UaAHCV8G/w5VlcyWeCY30LQIji8bnLn34dLFwdQOZiccFbAuDmCq/1VGFCHEUlq8OrHmuMz1QQBZifbUQLAiw4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788418335; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dKftuYppPOmGQX9OKW8UIKFo5kG4eD0AIf8jGCWgFcw=; 
	b=XLew3CUkwHm42PhjE1qIbZJOYQLMCoXL0LD3lUo2Jf8jkRNADr2oIZqnc7MAHr42txbM+AjsFVTRHIYm+e7jI0rZA29kXSTQZWYmWYhYeLmiBooLWpi/Xi8fp6blROhtJpmnsgJ582PwRQCBoBALcTAqQ2QUVmBChzjL8BkbKgo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788418335;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dKftuYppPOmGQX9OKW8UIKFo5kG4eD0AIf8jGCWgFcw=;
	b=fD5LuFllDF3xJC3IiT+LFE+gm1oV63JomWNcoV9EaHDSJ+l3gLhHA8p9XGaIO60G
	OyNUVtakkKyP3KGqXUEOkbRvNhs/lI3fVdGdlKra8LhRK7vYxU3xWg7PdyWWh7t3BtD
	Xh+0Lp6lDHMMvM2CMXSzEIdZAptK7TA/9tjLbkII=
Received: by mx.zohomail.com with SMTPS id 1788418334779674.9966100435952;
	Wed, 2 Sep 2026 23:52:14 -0700 (PDT)
Message-ID: <805fa7a9-bd32-4364-a228-5ff17f22ae56@collabora.com>
Date: Thu, 3 Sep 2026 08:52:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] media: verisilicon: rockchip: guard VPU981 AV1
 divisor and tile buffer
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
 <20260617021906.2746743-7-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260617021906.2746743-7-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 17/06/2026 à 04:19, Michael Bommarito a écrit :
> rockchip_vpu981_av1_dec_set_tile_info() divides context_update_tile_id by
> tile_info->tile_cols and writes one descriptor per tile into the tile_info
> DMA buffer, which holds AV1_MAX_TILES entries; tile_cols and tile_rows
> come from the bitstream. Guard the division against a zero tile_cols by
> initialising the context-update values to zero and computing them only
> when tile_cols is non-zero, and stop the descriptor writes once the
> tile_info buffer is full. The tile geometry written to the hardware
> registers is left unmodified; the per-dimension and total tile bounds are
> enforced by the control validation.
>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 32 +++++++++++++++----
>   1 file changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4e21ad373233..fd00dbd79fe46 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -578,16 +578,30 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
>   	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
>   	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
>   	    ctrls->tile_group_entry;
> -	int context_update_y =
> -	    tile_info->context_update_tile_id / tile_info->tile_cols;
> -	int context_update_x =
> -	    tile_info->context_update_tile_id % tile_info->tile_cols;
> -	int context_update_tile_id =
> -	    context_update_x * tile_info->tile_rows + context_update_y;
> +	int context_update_y = 0;
> +	int context_update_x = 0;
> +	int context_update_tile_id = 0;
>   	u8 *dst = av1_dec->tile_info.cpu;
> +	u8 *dst_end = dst + av1_dec->tile_info.size;
>   	struct hantro_dev *vpu = ctx->dev;
>   	int tile0, tile1;
>   
> +	/*
> +	 * tile_cols and tile_rows are bounded by the V4L2 control validation
> +	 * (V4L2_AV1_MAX_TILE_{COLS,ROWS} and V4L2_AV1_MAX_TILE_COUNT). Guard
> +	 * the divisor here, and keep the descriptor writes within the
> +	 * AV1_MAX_TILES tile_info buffer below; the register values use the
> +	 * unmodified tile geometry.
> +	 */
> +	if (tile_info->tile_cols) {
> +		context_update_y =
> +		    tile_info->context_update_tile_id / tile_info->tile_cols;
> +		context_update_x =
> +		    tile_info->context_update_tile_id % tile_info->tile_cols;
> +		context_update_tile_id =
> +		    context_update_x * tile_info->tile_rows + context_update_y;
> +	}
> +
>   	memset(dst, 0, av1_dec->tile_info.size);
>   
>   	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
> @@ -598,6 +612,10 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
>   			    tile_info->height_in_sbs_minus_1[tile1] + 1;
>   			u32 x0 = tile_info->width_in_sbs_minus_1[tile0] + 1;
>   
> +			/* Stop once the tile_info descriptor buffer is full. */
> +			if (dst + 16 > dst_end)
> +				break;
> +
>   			/* tile size in SB units (width,height) */
>   			*dst++ = x0;
>   			*dst++ = 0;
> @@ -622,6 +640,8 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
>   			*dst++ = (end >> 16) & 255;
>   			*dst++ = (end >> 24) & 255;
>   		}
> +		if (dst + 16 > dst_end)
> +			break;
>   	}
>   
>   	hantro_reg_write(vpu, &av1_multicore_expect_context_update, !!(context_update_x == 0));

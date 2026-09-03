Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C83F6C5F;
	Thu,  3 Sep 2026 06:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418422; cv=pass; b=MdsN2ozvJDljC0V4KufwbwU4IkptaoKmPPA2uUZDepTjF7ICKTNH363p8EQfLRwScquuYGiR+YhkzWe8J18ryGtw72E/C1iWuU7nGkwYwl/WwDXLVd9t2QjI7uq0EJW8DZnt0jfnKISTaNcd5qcryd4J52u4pMMwf48JVS49AuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418422; c=relaxed/simple;
	bh=KPtRf8PHqTyYZRAK7EIrfxqfgqWurVPGePgQBxpSYwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IF8h4/Dc8PQUKZC5nuPJ6RSnCjNM1z+ePmsCqyEX+XyJgkFLpWSwxCNfNq6yyW3c2TLkWaZzkKCoKF6XkTPdgUeC9Jrh08q1Y/BvckQLdrZWB00BT/Uc5DDWoqg1zrhipoutiDiRpnIhUzAkbp3YCIlzajfS1Gq7IP1T+vQB+yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=GiiQIUm+; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="GiiQIUm+"
ARC-Seal: i=1; a=rsa-sha256; t=1788418401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SwgiiL7JypWIcPRqpcIVFPijZn6LNlJb5JT651HfJXHRVp0sfftjdzP6qJnUkT2ZtKgf7lLltTrGx5NzfMQCPoI4U0RfufFl4Dn7O5iBpMC3SaRmwt7HRi9JT4Gm8c4GvFfmAbD+wjXI28vbpexbMXJnZvPVsdRq5C4xkA1QjsQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788418401; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BcAgh7yeDVgqAgxkootRruKaN/q5Ils7BQ1JU/M50TM=; 
	b=CW2uhRYNkjJBqMi7CSiTP0LI2Y+5nWDCLMzzQmxoAf5xX9SJ6SsiKPmGK5hXolf2EW86uueYO8+wJRS1tR2kwo7c7AAd4d/rhFXj743LZoZtdBDEopgKbkoAa1RARJUnJg+xW/xO7KGaXSB5Ql3gvMnfI26JW6QYeZDshbd0jO4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788418401;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BcAgh7yeDVgqAgxkootRruKaN/q5Ils7BQ1JU/M50TM=;
	b=GiiQIUm+kTc1zufpfzm3a783q/nodFXeyKBnykl2in6effSR2lI3Ebs/7X3qt5DE
	cETFVm/zRy/JQIoPtMsyqcXHtKTKkUySfF1KqggFvkorYmaAPLkWOnrgN3Yenq75a6j
	xi56h2wekD/k0KhEPYGf+89YJ698PHg1QhBPrTzI=
Received: by mx.zohomail.com with SMTPS id 1788418400533958.155498276706;
	Wed, 2 Sep 2026 23:53:20 -0700 (PDT)
Message-ID: <922a07e5-cd6c-432b-947a-21a2d026720c@collabora.com>
Date: Thu, 3 Sep 2026 08:53:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] media: verisilicon: rockchip: reject AV1 frames
 exceeding the tile capacity
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
 <20260617021906.2746743-8-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260617021906.2746743-8-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 17/06/2026 à 04:19, Michael Bommarito a écrit :
> rockchip_vpu981_av1_dec_set_tile_info() indexes the tile group entry
> array by tile1 * tile_cols + tile0, reading up to tile_cols * tile_rows
> entries, lays out one descriptor per tile in the AV1_MAX_TILES tile_info
> buffer, and programs the real tile_cols / tile_rows into the hardware.
>
> The tile group entry control is a dynamic array sized to the number of
> entries userspace submitted, independent of tile_cols / tile_rows, so a
> frame that claims more tiles than entries reads past the array. A frame
> that claims more than AV1_MAX_TILES tiles also leaves the hardware
> programmed for more tiles than the descriptor buffer holds.
>
> Reject both in prepare_run(): tile_cols * tile_rows must not exceed the
> submitted entry count or AV1_MAX_TILES. The entry count is read via
> v4l2_ctrl_find() (ctrl->elems). This mirrors the bound the mediatek AV1
> decoder already enforces.
>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 25 ++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index fd00dbd79fe46..00aa566a4ccdb 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -431,20 +431,39 @@ static int rockchip_vpu981_av1_dec_prepare_run(struct hantro_ctx *ctx)
>   {
>   	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
>   	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_av1_tile_info *tile_info;
> +	struct v4l2_ctrl *tge;
> +	u32 num_tiles;
>   
>   	ctrls->sequence = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
>   	if (WARN_ON(!ctrls->sequence))
>   		return -EINVAL;
>   
> -	ctrls->tile_group_entry =
> -	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
> -	if (WARN_ON(!ctrls->tile_group_entry))
> +	tge = v4l2_ctrl_find(&ctx->ctrl_handler,
> +			     V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
> +	if (WARN_ON(!tge))
>   		return -EINVAL;
> +	ctrls->tile_group_entry = tge->p_cur.p;
>   
>   	ctrls->frame = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FRAME);
>   	if (WARN_ON(!ctrls->frame))
>   		return -EINVAL;
>   
> +	/*
> +	 * rockchip_vpu981_av1_dec_set_tile_info() indexes the tile group
> +	 * entry array by tile1 * tile_cols + tile0, so it reads up to
> +	 * tile_cols * tile_rows entries, and lays out one descriptor per tile
> +	 * in the AV1_MAX_TILES tile_info buffer while programming the real
> +	 * tile geometry into the hardware. Reject a frame that claims more
> +	 * tiles than userspace submitted, or more than the hardware tile
> +	 * buffer holds, so the read stays in bounds and the programmed
> +	 * geometry matches the descriptors written.
> +	 */
> +	tile_info = &ctrls->frame->tile_info;
> +	num_tiles = (u32)tile_info->tile_cols * tile_info->tile_rows;
> +	if (num_tiles > tge->elems || num_tiles > AV1_MAX_TILES)
> +		return -EINVAL;
> +
>   	ctrls->film_grain =
>   	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FILM_GRAIN);
>   

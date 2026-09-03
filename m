Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214FA332EC1;
	Thu,  3 Sep 2026 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418326; cv=pass; b=GVTY9IyvdqIR6aH/GqhQ8g+LxOx1LtLJaYP0tRnL4NFnNfcaylR59LcwDNOzPYbr28QM+1zv/I7V8KijTb8gbe5bw0D2axck+cDxoJEwJXrJSidGJhfhoRBA5/CfTWLxmtpLjLhwDIbEPnYECn293KK/Oc4lD3lrD1McDAxWrlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418326; c=relaxed/simple;
	bh=dfJEPCvPPYvKEJFGyQYyM6d9i75FMyFkpqtYZ76PAAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFKA8cNOHevp8Rb3GEZ6IRuJ8BjTpYtGhdBvIHlKzEwlcfccV7JmES1oTVOHFCWGAOF5nxRuJaa6jvPe36qiMhVba++0QeH/hW16+niM9WoktMO/iF66/yL/czX88M8xoNci5iOuQXKZKBSRQiZQhi0TyPIvVf/bPvK9BXkNtuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=dapLq44p; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="dapLq44p"
ARC-Seal: i=1; a=rsa-sha256; t=1788418303; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JvuMvDYG5fsGmgflGdZp5v1ute+FDtWL4w9qMGnapMlVsA00nTQLSTbeOK1aqnyQ/MDZWWBU9CGkIuAaR9oATPqQINNwj79Qpl7bmSk/6EKNEyy8uEAnBchY4TrwbrEueq8snpV+bSX6UeFJDTTK/CvRrQfNtWT3JO0d9mf5TtI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788418303; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tbhQo1C6TdPsTdJu3IOx+JBLZvNXuGNrIgAZrg4gMGY=; 
	b=Qc529jvy4LldeoDbP/FJVVSJjUtb5cNwz+5oDsp9Q5IdnHMpE0GQ+O1dZ0wyFSOgmYFUM3hF+zp398wj1GU/XrFbeqiEtlSwrZ7F9lDgJhqlDDsgb9QtikhU3diJyxOAJpygdOYqMVnhPjBZdmMfX1vjBlO0B2U0cTL3KkHYfSU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788418303;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tbhQo1C6TdPsTdJu3IOx+JBLZvNXuGNrIgAZrg4gMGY=;
	b=dapLq44p8p+4sua8rTiEvL/qFd/9LGNHjFheeBya0U4U5qLotQc3SPAlnNYWajMU
	iM48g52T8RKF2I5Yrck3gwsEG/ZpY6G/xEpLvGoy3nf3DsdGiNkOOHmx3W3MylLQTNl
	hxGHD3k8opa56voc1U6aqc1r8cF5PggRT+Uo2gpw=
Received: by mx.zohomail.com with SMTPS id 1788418301780612.0505181546034;
	Wed, 2 Sep 2026 23:51:41 -0700 (PDT)
Message-ID: <628a89f0-0fa7-4304-9bd6-c7e3ad967ca6@collabora.com>
Date: Thu, 3 Sep 2026 08:51:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] media: verisilicon: hantro: bound G2 HEVC tile
 loop to the buffer capacity
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
 <20260617021906.2746743-6-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260617021906.2746743-6-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 17/06/2026 à 04:19, Michael Bommarito a écrit :
> prepare_tile_info_buffer() writes one entry per tile into the tile_sizes
> DMA buffer, sized for a grid equal to the PPS uAPI array capacity. Use the
> bounded v4l2_hevc_pps_num_tile_columns() / v4l2_hevc_pps_num_tile_rows()
> helpers so the loops stay inside the buffer.
>
> Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> index e8c2e83379def..e7a7c7a42467a 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> @@ -5,6 +5,8 @@
>    * Copyright (C) 2020 Safran Passenger Innovations LLC
>    */
>   
> +#include <media/v4l2-hevc.h>
> +
>   #include "hantro_hw.h"
>   #include "hantro_g2_regs.h"
>   
> @@ -15,8 +17,8 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
>   	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
>   	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
>   	u16 *p = (u16 *)((u8 *)ctx->hevc_dec.tile_sizes.cpu);
> -	unsigned int num_tile_rows = pps->num_tile_rows_minus1 + 1;
> -	unsigned int num_tile_cols = pps->num_tile_columns_minus1 + 1;
> +	unsigned int num_tile_rows = v4l2_hevc_pps_num_tile_rows(pps);
> +	unsigned int num_tile_cols = v4l2_hevc_pps_num_tile_columns(pps);
>   	unsigned int pic_width_in_ctbs, pic_height_in_ctbs;
>   	unsigned int max_log2_ctb_size, ctb_size;
>   	bool tiles_enabled, uniform_spacing;

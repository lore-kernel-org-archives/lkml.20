Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B753F7A9A;
	Thu,  3 Sep 2026 06:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418275; cv=pass; b=B+JSbQ2Bwkf2wDygphj1GcyFS0QAozqUONRT5WRJBbuAZ7KnzL4r9jwZlENQnDtsyArhDSqLfIsz4RKO62PIHwr8vci6f9xWoGc7h40mm8qNXe9EKl0QeCSK5BY6hTyMmJxcX/aDQ8YK/xQ+AC+fpXJrrXpGOIW8WzzlTvr11MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418275; c=relaxed/simple;
	bh=46fAkYuwsegDqfw23bwxvyGaX/MwP5e3qFyM9umBfLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnJVpNYKVWQrf0qnGws3Xl+kr59IFXbPe2JIImzUqcXwW9ZR2Gig7+4+P4UJY6yNUDAwJxbJ6rUlcuVHZniXhsrpXK1dNOTevSIYj1iDw50xSC9NRVvqV648k30wbZ5EThA+bg4d2r6UmT+Hokd9P29h6Q9Hn4Vcqm/dO4MYNWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=KQ2EefwC; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="KQ2EefwC"
ARC-Seal: i=1; a=rsa-sha256; t=1788418255; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Htifw8w1XJuFEgwMH8ihnz9TYB407OpNKpdYG8+wGBuE5+mC6i4TY9pywfys7BI0adxvWvtkWjvfUm3p648M+3fHNc3Q9mlWj0vVOa3fTPlR+okkUjoIKXy6NHMzcxJ3ZJwmXJBfzII1Wy6rvby56RBcc4xNPu1GLq5SsiMO8ZI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788418255; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IIzAYUjQg4plBJWnWFqp05IAzeGSDN5fbh7/cxBTBC8=; 
	b=dkcKfwYuDry7K+1HTTxv7NsZOaD5jNXBsL1h/RtMUR8X7D1hlL8efx2zD07F14AqxXBxwdZ2uqN/OCIiKiPRfvH3AIAVLLjrn+j1lmtKkjE24hvUIGFj7k5jjoLJE7gObbzx8gLklFvWg3zZX9PuJ37c82tthpFHGSOmd0A/j7c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788418255;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IIzAYUjQg4plBJWnWFqp05IAzeGSDN5fbh7/cxBTBC8=;
	b=KQ2EefwCyA8qP65yiHebStBXg3nqVYNjlbfTITh7DCnJSeRZF7wKRlESZ6oB2+yW
	nou8wAE5KbJBVWCrrAOOGXp5ErpTWijKrbmI3wink3HgNkexday3lyMv9culRLdPozh
	ozE39pxIyJPwc3Z6GAdHIbgRs+ES7+5qe2XwkoaI=
Received: by mx.zohomail.com with SMTPS id 1788418254221442.9203953622582;
	Wed, 2 Sep 2026 23:50:54 -0700 (PDT)
Message-ID: <e56455f5-2213-49d5-9cd0-ab62f3b6edcc@collabora.com>
Date: Thu, 3 Sep 2026 08:50:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] media: v4l2-ctrls: validate AV1 tile counts
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
 <20260617021906.2746743-3-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260617021906.2746743-3-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 17/06/2026 à 04:18, Michael Bommarito a écrit :
> The stateless AV1 decoders use tile_info.tile_cols and tile_rows as loop
> bounds and as indices into the mi_*_starts[] and *_in_sbs_minus_1[]
> arrays, as the divisor for context_update_tile_id, and their product
> bounds the per-tile descriptor buffers, but std_validate_compound() does
> not bound these u8 fields. Reject a V4L2_CTRL_TYPE_AV1_FRAME whose
> tile_cols or tile_rows exceeds V4L2_AV1_MAX_TILE_COLS / _ROWS, or whose
> product exceeds V4L2_AV1_MAX_TILE_COUNT. A zero tile count is left to the
> consuming driver so the zero-initialised control that existing userspace
> submits is still accepted.
>
> Fixes: 9de30f579980 ("media: Add AV1 uAPI")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 6d478e1a5ef22..fb20ad13dfec7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -790,10 +790,30 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
>   	return 0;
>   }
>   
> +static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
> +{
> +	/*
> +	 * tile_cols and tile_rows index the per-tile descriptor arrays and
> +	 * bound the tile loops in the stateless AV1 drivers; the product
> +	 * bounds the total tile descriptor count.
> +	 */
> +	if (t->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
> +	    t->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
> +		return -EINVAL;
> +
> +	if ((u32)t->tile_cols * t->tile_rows > V4L2_AV1_MAX_TILE_COUNT)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>   static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
>   {
>   	int ret = 0;
>   
> +	ret = validate_av1_tile_info(&f->tile_info);
> +	if (ret)
> +		return ret;
>   	ret = validate_av1_quantization(&f->quantization);
>   	if (ret)
>   		return ret;

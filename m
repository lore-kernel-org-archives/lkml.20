Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7FB361DA8;
	Thu,  3 Sep 2026 06:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418302; cv=pass; b=YvAdGhWjZ6UvmxwxaF6y+Pa44UalIPDA8CkMOMHKRCOnd3PyHS2QZEVO6cdPvozHtkiekMFOrMQycX9mcOCfS17BOjc+TRjRqTYaPgHM2IUJMKzD2Z+CF37mZ/1gYIAR5DbMZxLBRQMcyMii1R2/7hE0eMTctbQ7M/CkEdepCzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418302; c=relaxed/simple;
	bh=SoKUBia8oqOdvV82VYCZewoFTlUbH3Q7v4L81VhwTv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKNtxeUfvstoRY0rOtR/L/L+YW1enXCSp2/M6fuUANSaz/iP1gbtvH1ZEdCfzrY82J6GJnAcN37uRuSkHRiiytEi+8ALe3ItEccpibBU3980kQyur84dgnF9WMnDB3hGtUuLAmX+Qdw2HRWpr0u2YFOJUck+uVckNH6FkQZQtCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=cIX6bqhC; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="cIX6bqhC"
ARC-Seal: i=1; a=rsa-sha256; t=1788418279; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mI5TxV9T26KLVPzQLeqcFHoC/lN6cuL/O/xDyuorrq9EqGlnIZcIt2cPuBy+XF9eDOwL9a/EkL5qR+DzwMwNMnGUQOTSAn9JXJKncxfC4ZrI8M+MTuIY6vh/JUK8u7suFAl4remvr/R0k8/dVMeStdbOFiTEZB5vJInr82EPJu0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788418279; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Er0+jf5qJ7+MA51OSpnVT+FMczAyphggtDBLkpQXO4c=; 
	b=lkaUMpL0cElA3/wMMziec7VPPkdPTAK2scVBRXvPvLIR8f5WUPXYNjYSNafh7Uq9orHIMwvo2tPJ1xRKdbGhujIig25r5ju72CelsK7qoEgcdkzDrGSC3pbUfLmBW/440KYPKRn8ocz0iWlkWyvZkH1BbzBTjaO7YWVkuYQLQqQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788418279;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Er0+jf5qJ7+MA51OSpnVT+FMczAyphggtDBLkpQXO4c=;
	b=cIX6bqhC/3XCAkCL6Tc6nvhZtYeuTxGDr1kaobPawvv7CvvYybPZSJn3ZTsT31C+
	/37n9RTnycYHAneXf+msH150uvy1Wv2ccEkigPVUzeyq0wTSRyMQqYAKVn1XcB8IaSY
	iFfqs5XvYWUkV2skmAZE8QPuilEnt4eNCzmIp6rU=
Received: by mx.zohomail.com with SMTPS id 178841827811934.23632285902954;
	Wed, 2 Sep 2026 23:51:18 -0700 (PDT)
Message-ID: <92f2fa35-aff2-4c14-b617-0884f90af44f@collabora.com>
Date: Thu, 3 Sep 2026 08:51:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] media: hevc: add bounded tile-count helpers
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
 <20260617021906.2746743-4-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260617021906.2746743-4-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 17/06/2026 à 04:19, Michael Bommarito a écrit :
> The stateless HEVC decoders compute the number of tile columns and rows
> from num_tile_columns_minus1 / num_tile_rows_minus1 and clamp it to the
> column_width_minus1[] / row_height_minus1[] capacity before using it as a
> loop bound. Add shared helpers in a new <media/v4l2-hevc.h> so the rkvdec
> and hantro drivers do not each open-code the min_t() clamp.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   include/media/v4l2-hevc.h | 41 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 include/media/v4l2-hevc.h
>
> diff --git a/include/media/v4l2-hevc.h b/include/media/v4l2-hevc.h
> new file mode 100644
> index 0000000000000..973c96be16be4
> --- /dev/null
> +++ b/include/media/v4l2-hevc.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Helper functions for HEVC stateless codecs.
> + */
> +
> +#ifndef _MEDIA_V4L2_HEVC_H
> +#define _MEDIA_V4L2_HEVC_H
> +
> +#include <linux/minmax.h>
> +#include <media/v4l2-ctrls.h>
> +
> +/**
> + * v4l2_hevc_pps_num_tile_columns - number of HEVC tile columns, bounded
> + * @pps: the V4L2 HEVC PPS control
> + *
> + * Return the number of tile columns (num_tile_columns_minus1 + 1) clamped to
> + * the capacity of column_width_minus1[]. The control validation already
> + * rejects out-of-range counts; this keeps the consuming drivers bounded too.
> + */
> +static inline unsigned int
> +v4l2_hevc_pps_num_tile_columns(const struct v4l2_ctrl_hevc_pps *pps)
> +{
> +	return min_t(unsigned int, pps->num_tile_columns_minus1 + 1,
> +		     ARRAY_SIZE(pps->column_width_minus1));
> +}
> +
> +/**
> + * v4l2_hevc_pps_num_tile_rows - number of HEVC tile rows, bounded
> + * @pps: the V4L2 HEVC PPS control
> + *
> + * Return the number of tile rows (num_tile_rows_minus1 + 1) clamped to the
> + * capacity of row_height_minus1[].
> + */
> +static inline unsigned int
> +v4l2_hevc_pps_num_tile_rows(const struct v4l2_ctrl_hevc_pps *pps)
> +{
> +	return min_t(unsigned int, pps->num_tile_rows_minus1 + 1,
> +		     ARRAY_SIZE(pps->row_height_minus1));
> +}
> +
> +#endif /* _MEDIA_V4L2_HEVC_H */

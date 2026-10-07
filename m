Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A1139182E;
	Wed,  7 Oct 2026 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361372; cv=none; b=t0ZEr6xBXx7hnTQHk/lJ+j22FDp29eQbkJzW94ep5ZobYCDdZj/J/eqiFyh8FAp4mXG2X34ok9MmCch7AB1fvmqtbeS6Tft/d4ymdiU84D0TQUS9r7KG5JO8lCxNdnhYx/vOIdHqoF4NbznAnGY5Rgd+jVfVhecZ3cWe73/mRsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361372; c=relaxed/simple;
	bh=fnfSyxyof8ldx1LKwlAm16hEicCGx2XP+A/qlkJrQbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRcRK+8ATpSQD97zY9v5r0iW+iKSriZK0nrjYbB/FxjvW1EH607q9thdmJiWFGxFlBeSPZSVdt8MUidUUGMDhafhp80/mEeNTWn2V98C7x/PsLuDUVggY92NI64brsvAiAtqMd5oe1joUmEw9keW3XF+CeU8GYQ8JpfRWar7c0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuaojcMF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuaojcMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0425F1F0089B;
	Wed,  7 Oct 2026 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791361371;
	bh=2F1HQQAc/fMJbnGCSZdEptu0N+9Pd3sBhH3laxTncQ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OuaojcMF5Q2O2v24+mHmpZN1tbhH15Q0+GZwNBgF4QdXcz5Nb8zUSqTQzV0Z/ql2N
	 V2XsUl/qCzeV4eHTHhX/NFBY7iZx9F0raYXgHFMCQ8caZAYdm6M3CycXPc1OASOESp
	 OGGP/Wk6uyHPxn+riOyq1UcDyFPgGM/+eqSQ8wzaJeviz+27fol7BZA4p5a/UX5DVC
	 ESlDUEQ/Pu8m5n87irM2dHeA/IDrxrco3S5V9mxRPEFW90CKRmeDfnj+477KAVQro0
	 YAfrHSilY+SpoD+NTuZrcCFuXHf8C6mXQPgugWBfqhZgIlUqKKfA5vUXcfep7kb7XV
	 +VosUS6KN70iQ==
Message-ID: <a9024516-a266-4d99-a28c-f356ed98af09@kernel.org>
Date: Wed, 7 Oct 2026 10:22:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/74] media: qcom: camss: Define PIX formats for x1e PIX
 interface
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <Z8PAFUj3ZBxq4yvNpaYcxqBXjhqYCJ8VfhD_gwcAj7AGdCHMEE-tv5tk9aIDv2wEUoz0Dh9qA-E8iph3COwMQg==@protonmail.internalid>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-17-ed985aefd611@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-17-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2026 19:13, Bryan O'Donoghue wrote:
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 93 ++++++++++++++++++++++++++-
>   drivers/media/platform/qcom/camss/camss.c     |  4 +-
>   2 files changed, 92 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 319d191589884..5b5201b55a485 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -174,6 +174,94 @@ static const struct camss_format_info formats_rdi_845[] = {
>   	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
>   };
> 
> +static const struct camss_format_info formats_pix_845[] = {
> +	/* Passthrought formats */
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, V4L2_PIX_FMT_SBGGR8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, V4L2_PIX_FMT_SGBRG8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, V4L2_PIX_FMT_SGRBG8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, V4L2_PIX_FMT_SRGGB8, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, V4L2_PIX_FMT_SBGGR10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, V4L2_PIX_FMT_SGBRG10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, V4L2_PIX_FMT_SGRBG10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, V4L2_PIX_FMT_SRGGB10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_SBGGR10, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, V4L2_PIX_FMT_SBGGR12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, V4L2_PIX_FMT_SGBRG12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, V4L2_PIX_FMT_SGRBG12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, V4L2_PIX_FMT_SRGGB12P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
> +	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14, V4L2_PIX_FMT_SBGGR14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14, V4L2_PIX_FMT_SGBRG14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14, V4L2_PIX_FMT_SGRBG14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14, V4L2_PIX_FMT_SRGGB14P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
> +	{ MEDIA_BUS_FMT_Y8_1X8, 8, V4L2_PIX_FMT_GREY, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
> +	{ MEDIA_BUS_FMT_Y10_1X10, 10, V4L2_PIX_FMT_Y10P, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
> +	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_Y10, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
> +
> +	/* 4:2:0 Bayer to YUV */
> +	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> +
> +	/* 4:2:2 Bayer to YUV */
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
> +	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
> +};
> +

The formats are fine but..

>   static const struct camss_format_info formats_pix_8x16[] = {
>   	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
>   	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
> @@ -277,10 +365,9 @@ const struct camss_formats vfe_formats_rdi_845 = {
>   	.formats = formats_rdi_845
>   };
> 
> -/* TODO: Replace with pix formats */
>   const struct camss_formats vfe_formats_pix_845 = {
> -	.nformats = ARRAY_SIZE(formats_rdi_845),
> -	.formats = formats_rdi_845
> +	.nformats = ARRAY_SIZE(formats_pix_845),
> +	.formats = formats_pix_845
>   };
> 
>   static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ff09873706c0d..6f3de2c185bc9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4434,7 +4434,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
>   			.pd_name = "ife0",
>   			.hw_ops = &vfe_ops_680,
>   			.formats_rdi = &vfe_formats_rdi_845,
> -			.formats_pix = &vfe_formats_rdi_845
> +			.formats_pix = &vfe_formats_pix_845
>   		},
>   	},
>   	/* IFE1 */
> @@ -4458,7 +4458,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
>   			.pd_name = "ife1",
>   			.hw_ops = &vfe_ops_680,
>   			.formats_rdi = &vfe_formats_rdi_845,
> -			.formats_pix = &vfe_formats_rdi_845
> +			.formats_pix = &vfe_formats_pix_845
>   		},
>   	},
>   	/* IFE_LITE_0 */
> 
> --
> 2.55.0
> 
The SoC is not relevant to the patch, excise.

---
bod

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C815B486BAB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792047756; cv=none; b=c/YOJE7JyUlYl65TobF6NXDlVSBMXXolWEPUIobcOVEIXhQIx5AmwdAHagbHI5bnn4+2X/lsx/s/N8Bp8oYPO0wDde7SegzUzVDkaph0c0dxa/T2mNCezKBbLZLY5HGbNuQFjbQiX9JLHLWuLABsVPLSGHa0mb8e4etBgCO3ntM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792047756; c=relaxed/simple;
	bh=8quYOJ7rYM8WnWXOBhu+ARpFdhTQyLVvGIcnvsyeoJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlrUfAcV9s1uEdBHEO08oJx2hQ3Ad5V1UzTq5ypV0Yl9s+4DE2bslfzeIflNYa+83pnOLbgIFr9BsbKPoYWlxXOJcKCt6vJX7seQ01M9UVYnBJ3ouraYey7ontUPEdRHwLqCtRsKf0NcmU/nlTP2n3eXoh30+HBYA8rUOt3lXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+zH+MID; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZqXOVD/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+zH+MID";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZqXOVD/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6Eh3O644607
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ezm4rbaxeQKOsTJu67V40w0zJIpgPDFueQEgWe25WXM=; b=B+zH+MIDp5urntJi
	FGG+n8g7B3j4ZV5bTzFcwGifexLHreUClCjo0QrzkLdXeL/6JkIzgLYiOV1Cg8S2
	GCa3yCv9gP7zW1BpSMBxX+fKc7iByd8jZ/1Kk+TQuMJxthafsRRhzwSyXoS9kBZE
	4ZFStqqOrVrc4ZYrb6HvfTW5fwKmDiM42fqM6eNEcaJEScAN46uiAS8oSmIBlsOo
	t08dHMqrKniBdUZGX1Ho4BYbzks4HKcOiDoKdRw0Z2eZakNhEbChY0zpV+chTipQ
	DArV0/Ru9lmkl6Y37d9ln3BUm5zwkRTyCaI7Jj9Qwby+RG0SCtYUL6QGFW5GLGbl
	Rhpl8A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9mbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:02:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89eb8443c26so103722b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792047748; x=1792652548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ezm4rbaxeQKOsTJu67V40w0zJIpgPDFueQEgWe25WXM=;
        b=LZqXOVD/dOaJdM9uwJwPGqJ2WB3xekDUj/FfmVobnEc6zyD8Hzcc5ptIxrIVUquEMB
         S3TsGE2L+jGaCmh9/B0OI9EMBM4eKUsSZQHbjto8XPprRzMWaE5Wp315aZkF9L8ZljF9
         /9tCFDYh3oF8rmQCQ5nbb6rtHb5HvZQxQ+nawhMnTzc8bVYnB8pFNORg+nWAn8fm+Npk
         CO2K3YhboBLVbu2bmfK/B8hOWFFCKFfcuPZIjY1cuPX0jp53DF9Wrh67Q8wLou7pnopF
         0blYLGu945oMtJENmymNck26ypHZjTnenh96/qKwgiDsGz3XaZfCVY7wV9HR2srRAtYD
         n2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792047748; x=1792652548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ezm4rbaxeQKOsTJu67V40w0zJIpgPDFueQEgWe25WXM=;
        b=noKGustYwomByuf3mZkinSAyPD9cK5CENhFvKNDPGDz8JgQP7UY7f3cWpHBVUCFHZP
         6XnIW7mQwJXkypCi3Gf7fOnf+iE6EZuskhZ3fXYZnF0rNw9mDGSgNeibu2bTyrH+aP6f
         4+o1USK7eeh9ytMZF0JFIS3lIEpHAeEKF+ORjCy+HMBC2HDl34ZCcxm5dm+cRBhp7kTm
         rFEgkOSWw+M2ik9K8RQ+tK3oIbLmTPi5HNxCot4vy+lASmVTzvls5wfoI9Y+hWxDMS4l
         9PmrUIzSbSj7haY8kl3P1T21qR9RJjMXcrVioJqJO/kF4ZDZ5RlcR3y/r0AnF/jheOWx
         uk2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuT5VK3/KjgrfyW71tCu4HnBDcmsVA1l8w2pLEv2lqQBjJE4nIXCoS+Ei5nh8sdTmZ+a9y3bLIuU25jP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA14CqHZgiMfHQb0B7jmzDYhC5cerhaA8o5YDAq6Spq66AfbLp
	fGeg9ZcBWX6vfGfEp+6tqN4312jnYn5sYu9hu976T6DJmq5Z+VR0S7/Q4OAQdIyc5Ygq2PRaEN1
	I3qb1ZJo5l6Fbgb5bst/C67iIBOHsKpctnPyK67ekIjZE92QST8naDHF+1JxCHNDdjXc=
X-Gm-Gg: AYBFou3RVLBKD9QgOnZyz1RNYRHs4YjQWaBP1PlkQoJ4JhsLv8+IjShLwNq9aM3jDTT
	Wna6ts1tMjlAv1tOgpR54kb2cvLh4JygMvTznFxvHxz2PgXC4GePQYNADFUZIS1wfJgvLqXlSZN
	ni/Rb8+61vaYaGOMHPoE04KxjXfZ8c7cFomJX90ovs0tlPwas465s9VLegIyWPyPseIHHZts/rN
	vFnv7XKAcWoeNJUuIGZ1xO0YMrTz0OelkEcg8K7QSmsMoBm/Yf+03ycmGfeAVuc+P+NVvZ3b8yI
	eiCC2PNoDIc3Tc6KK8odPWdTyLKAgSSmd2ZPTeL5A1QDQp7w8ziqtjEXox10CdKcra5JPnhVY16
	doD7ZeIVoX5zVTT3cbbUZyF93
X-Received: by 2002:a05:6a00:6c88:b0:89e:b291:89c1 with SMTP id d2e1a72fcca58-89eb2918b1fmr185465b3a.53.1792047748008;
        Thu, 15 Oct 2026 00:02:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c88:b0:89e:b291:89c1 with SMTP id d2e1a72fcca58-89eb2918b1fmr185433b3a.53.1792047747479;
        Thu, 15 Oct 2026 00:02:27 -0700 (PDT)
Received: from [192.168.1.2] ([223.230.7.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f5204dcsm1955088b3a.6.2026.10.15.00.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:02:26 -0700 (PDT)
Message-ID: <b0a3b094-80a8-4269-8f3b-ed1e676a6fa2@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:32:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/10] ASoC: qcom: Add Shikra QAIF support
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        ajay.nandam@oss.qualcomm.com
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-9-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-9-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lR5Kmvc4HUjA1OXQ-VOIZVAZkMC8n8RK
X-Proofpoint-ORIG-GUID: lR5Kmvc4HUjA1OXQ-VOIZVAZkMC8n8RK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyNyBTYWx0ZWRfX5iSuCgFWHlXc
 UMc64aUkKDQhXKpQ9Rcy+iJ20F8mDmuqcFJ4UOxNuDyjLVr05ea2D0OctGtABzcgLnqa/U7CC5N
 937XbBH6tG5dqEi3wOiy+h7Ljwkb0jA=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad07a84 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=yZS14lHB/DhrxgecvCV8gA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vKNxIj-ojL_G2T7x0BwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyNyBTYWx0ZWRfXwxwTYJj4xrQD
 0npFQPv4RPhNZsxvXU1XW8F/Qyu/+cBgam/WMknYvGJUcK3fYlWa8ZcanupSSWYXdSoVLOibHdY
 W+DVrkVkPCFRV1VsUnEXJSagRNGhT/Uopt/J0OJgJhmXFG7Sc95/qMncOk/b52ezN95m5Ar8/7t
 PNHOK2cM6fJfQT+gfoVNWN87zKE6qjJv4IIa2P+W4zAv89+NBZOwv+Cs/JAABr44CmnOf7rgUNG
 XucwMNDVuEx4iysLWZAqk2ZpgOEetlrWfOtQGYjEzGEEwRyc7Dy0cVHw2dj/+evdvKylJug67Lo
 lX7ZcW/Pe6kuc26wP5esbIt0gb1qMpMc9PKGEa7NYXzzOnAPidm0m52KmDZO3zW8ccw/dg+L28T
 f85IC5fCSF10RdIcy2BoTWpxActlhr/tO01mBWujcJFFNhlQKfYDCOvcqoYt6wcoIQKIL85MHJs
 buBSjaVjktPhz0CQl0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150027



On 10/13/2026 11:21 AM, Harendra Gautam wrote:
> Add the Shikra variant data for the Qualcomm Audio Interface driver so
> the common QAIF code can bind to the Shikra QAIF device and expose the
> SoC-specific DAIs.
> 
> Provide the Shikra DMA-to-DAI mappings, DMA and SHRAM layout, clock
> names, DAI driver data and power-management hooks required by the QAIF
> driver. Add the Kconfig symbol and Makefile entries needed to build the
> new variant.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/qcom/Kconfig       |  10 +
>   sound/soc/qcom/Makefile      |   3 +
>   sound/soc/qcom/qaif-shikra.c | 445 +++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 458 insertions(+)
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index e6e24f3b9922..b7088b1e5cad 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -71,6 +71,16 @@ config SND_SOC_QCOM_COMMON
>   config SND_SOC_QCOM_SDW
>   	tristate
>   
> +config SND_SOC_QCOM_QAIF
> +	tristate "Qualcomm QAIF audio interface support"
> +	depends on COMMON_CLK
> +	select REGMAP_MMIO
> +	help
> +	  Say Y or M to enable the Qualcomm Audio Interface (QAIF) driver
> +	  for the Shikra audio platform. QAIF is a DMA-based audio
> +	  subsystem that moves PCM data between memory and external serial
> +	  audio interfaces (AIF) and internal codec interfaces (CIF).
> +
>   config SND_SOC_QDSP6_COMMON
>   	tristate
>   
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 985ce2ae286b..cf50b7a24bcf 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -47,3 +47,6 @@ obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) += snd-soc-qcom-offload-utils.o
>   
>   #DSP lib
>   obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
> +
> +snd-soc-qcom-qaif-y := qaif-cpu.o qaif-platform.o qaif-shikra.o
> +obj-$(CONFIG_SND_SOC_QCOM_QAIF) += snd-soc-qcom-qaif.o
> diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
> new file mode 100644
> index 000000000000..2db3995a2de0
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-shikra.c
> @@ -0,0 +1,445 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-shikra.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
> + */
> +
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include "qaif.h"
> +
> +static const struct qaif_dmaidx_dai_map shikra_mi2s_dma_dai_map[] = {
> +	{ AIF_MI2S_RX_0, QAIF_DMA_IDX0 },
> +	{ AIF_MI2S_RX_1, QAIF_DMA_IDX1 },
> +	{ AIF_MI2S_RX_2, QAIF_DMA_IDX2 },
> +	{ AIF_MI2S_RX_3, QAIF_DMA_IDX3 },
> +	{ AIF_MI2S_TX_0, QAIF_DMA_IDX0 },
> +	{ AIF_MI2S_TX_1, QAIF_DMA_IDX1 },
> +	{ AIF_MI2S_TX_2, QAIF_DMA_IDX2 },
> +	{ AIF_MI2S_TX_3, QAIF_DMA_IDX3 },
> +};
> +
> +static const struct qaif_dmaidx_dai_map shikra_tdm_dma_dai_map[] = {
> +	{ AIF_TDM_RX_0, QAIF_DMA_IDX0 },
> +	{ AIF_TDM_RX_1, QAIF_DMA_IDX1 },
> +	{ AIF_TDM_RX_2, QAIF_DMA_IDX2 },
> +	{ AIF_TDM_RX_3, QAIF_DMA_IDX3 },
> +	{ AIF_TDM_TX_0, QAIF_DMA_IDX0 },
> +	{ AIF_TDM_TX_1, QAIF_DMA_IDX1 },
> +	{ AIF_TDM_TX_2, QAIF_DMA_IDX2 },
> +	{ AIF_TDM_TX_3, QAIF_DMA_IDX3 },
> +};
> +
> +static const struct qaif_dmaidx_dai_map shikra_cif_dma_dai_map[] = {
> +	{ RX_CODEC_DMA_RX_0, QAIF_DMA_IDX0 },
> +	{ RX_CODEC_DMA_RX_1, QAIF_DMA_IDX1 },
> +	{ VA_CODEC_DMA_TX_0, QAIF_DMA_IDX0 },
> +	{ VA_CODEC_DMA_TX_1, QAIF_DMA_IDX1 },
> +};
> +
> +static struct snd_soc_dai_driver shikra_qaif_cpu_dai_driver[] = {
> +	{
> +		.id = AIF_MI2S_RX_0,
> +		.name = "MI2S AIF RX Zero",
> +		.playback = {
> +			.stream_name = "MI2S AIF RX Zero Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_MI2S_TX_0,
> +		.name = "MI2S AIF TX Zero",
> +		.capture = {
> +			.stream_name = "MI2S AIF TX Zero Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_TDM_RX_0,
> +		.name = "TDM AIF RX Zero",
> +		.playback = {
> +			.stream_name = "TDM AIF RX Zero Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_TDM_TX_0,
> +		.name = "TDM AIF TX Zero",
> +		.capture = {
> +			.stream_name = "TDM AIF TX Zero Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_MI2S_RX_1,
> +		.name = "MI2S AIF RX One",
> +		.playback = {
> +			.stream_name = "MI2S AIF RX One Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_MI2S_TX_1,
> +		.name = "MI2S AIF TX One",
> +		.capture = {
> +			.stream_name = "MI2S AIF TX One Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_TDM_RX_1,
> +		.name = "TDM AIF RX One",
> +		.playback = {
> +			.stream_name = "TDM AIF RX One Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_TDM_TX_1,
> +		.name = "TDM AIF TX One",
> +		.capture = {
> +			.stream_name = "TDM AIF TX One Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_MI2S_RX_2,
> +		.name = "MI2S AIF RX Two",
> +		.playback = {
> +			.stream_name = "MI2S AIF RX Two Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_MI2S_TX_2,
> +		.name = "MI2S AIF TX Two",
> +		.capture = {
> +			.stream_name = "MI2S AIF TX Two Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_TDM_RX_2,
> +		.name = "TDM AIF RX Two",
> +		.playback = {
> +			.stream_name = "TDM AIF RX Two Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_TDM_TX_2,
> +		.name = "TDM AIF TX Two",
> +		.capture = {
> +			.stream_name = "TDM AIF TX Two Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_MI2S_RX_3,
> +		.name = "MI2S AIF RX Three",
> +		.playback = {
> +			.stream_name = "MI2S AIF RX Three Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_MI2S_TX_3,
> +		.name = "MI2S AIF TX Three",
> +		.capture = {
> +			.stream_name = "MI2S AIF TX Three Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_TDM_RX_3,
> +		.name = "TDM AIF RX Three",
> +		.playback = {
> +			.stream_name = "TDM AIF RX Three Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = AIF_TDM_TX_3,
> +		.name = "TDM AIF TX Three",
> +		.capture = {
> +			.stream_name = "TDM AIF TX Three Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = RX_CODEC_DMA_RX_0,
> +		.name = "RX CDC DMA RX0",
> +		.playback = {
> +			.stream_name = "RX CDC DMA RX0 Playback",
> +			.formats = SNDRV_PCM_FMTBIT_S16,
> +			.rates = SNDRV_PCM_RATE_48000,
> +			.rate_min	= 48000,
> +			.rate_max	= 48000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops	= &asoc_qcom_qaif_cif_dai_ops,
> +	}, {
> +		.id = RX_CODEC_DMA_RX_1,
> +		.name = "RX CDC DMA RX1",
> +		.playback = {
> +			.stream_name = "RX CDC DMA RX1 Playback",
> +			.formats = SNDRV_PCM_FMTBIT_S16,
> +			.rates = SNDRV_PCM_RATE_48000,
> +			.rate_min	= 48000,
> +			.rate_max	= 48000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops	= &asoc_qcom_qaif_cif_dai_ops,
> +	}, {
> +		.id = VA_CODEC_DMA_TX_0,
> +		.name = "VA CDC DMA TX0",
> +		.capture = {
> +			.stream_name = "VA CDC DMA TX0 Capture",
> +			.formats = SNDRV_PCM_FMTBIT_S16,
> +			.rates = SNDRV_PCM_RATE_48000,
> +			.rate_min	= 48000,
> +			.rate_max	= 48000,
> +			.channels_min	= 1,
> +			.channels_max	= 4,
> +		},
> +		.ops	= &asoc_qcom_qaif_cif_dai_ops,
> +	}, {
> +		.id = VA_CODEC_DMA_TX_1,
> +		.name = "VA CDC DMA TX1",
> +		.capture = {
> +			.stream_name = "VA CDC DMA TX1 Capture",
> +			.formats = SNDRV_PCM_FMTBIT_S16,
> +			.rates = SNDRV_PCM_RATE_48000,
> +			.rate_min	= 48000,
> +			.rate_max	= 48000,
> +			.channels_min	= 1,
> +			.channels_max	= 4,
> +		},
> +		.ops	= &asoc_qcom_qaif_cif_dai_ops,
> +	},
> +};
> +
> +static int shikra_qaif_get_dma_idx(unsigned int dai_id)
> +{
> +	const struct qaif_dmaidx_dai_map *map;
> +	int i, size;
> +
> +	if (dai_id >= AIF_MI2S_RX_0 && dai_id <= AIF_MI2S_TX_12) {
> +		map = shikra_mi2s_dma_dai_map;
> +		size = ARRAY_SIZE(shikra_mi2s_dma_dai_map);
> +	} else if (dai_id >= AIF_TDM_RX_0 && dai_id <= AIF_TDM_TX_12) {
> +		map = shikra_tdm_dma_dai_map;
> +		size = ARRAY_SIZE(shikra_tdm_dma_dai_map);
> +	} else {
> +		map = shikra_cif_dma_dai_map;
> +		size = ARRAY_SIZE(shikra_cif_dma_dai_map);
> +	}
> +
> +	for (i = 0; i < size; i++) {
> +		if (map[i].dai_id == dai_id)
> +			return map[i].dma_idx;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int shikra_qaif_alloc_stream_dma_idx(struct qaif_drv_data *drvdata,
> +					    int direction,
> +					    unsigned int dai_id)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	int dma_idx, index;
> +
> +	dma_idx = shikra_qaif_get_dma_idx(dai_id);
> +	if (dma_idx < 0)
> +		return dma_idx;
> +
> +	if (qaif_is_aif_port(dai_id)) {
> +		index = (direction == SNDRV_PCM_STREAM_PLAYBACK) ?
> +			dma_idx : v->wrdma_start + dma_idx;
> +		if (index >= QAIF_MAX_AIF_DMA_IDX)
> +			return -EINVAL;
> +		if (test_and_set_bit(index, &drvdata->aif_dma_idx_bit_map))
> +			return -EBUSY;
> +	} else if (qaif_is_cif_port(dai_id)) {
> +		index = (direction == SNDRV_PCM_STREAM_PLAYBACK) ?
> +			dma_idx : v->codec_wrdma_start + dma_idx;
> +		if (index >= QAIF_MAX_CIF_DMA_IDX)
> +			return -EINVAL;
> +		if (test_and_set_bit(index, &drvdata->cif_dma_idx_bit_map))
> +			return -EBUSY;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return index;
> +}
> +
> +static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvdata,
> +					   int index,
> +					   unsigned int dai_id)
> +{
> +	if (qaif_is_aif_port(dai_id))
> +		clear_bit(index, &drvdata->aif_dma_idx_bit_map);
> +	else
> +		clear_bit(index, &drvdata->cif_dma_idx_bit_map);
> +	return 0;
> +}
> +
> +static const struct qaif_variant shikra_qaif_data = {
> +	.ee = 0,
> +
> +	.num_rddma = 4,
> +	.num_wrdma = 4,
> +	.wrdma_start = 4,
> +
> +	.num_codec_rddma = 4,
> +	.num_codec_wrdma = 4,
> +	.codec_wrdma_start = 4,
> +	.num_intf = 4,
> +
> +	.rddma_reg_base = 0x8000,
> +	.rddma_stride = 0x1000,
> +	.codec_rddma_reg_base = 0xc000,
> +	.codec_rddma_stride = 0x1000,
> +
> +	.wrdma_reg_base = 0x11000,
> +	.wrdma_stride = 0x1000,
> +	.codec_wrdma_reg_base = 0x15000,
> +	.codec_wrdma_stride = 0x1000,
> +
> +	.rddma_irq_reg_base = 0x19000,
> +	.rddma_irq_stride = 0x1000,
> +	.codec_rddma_irq_reg_base = 0x191A0,
> +	.codec_rddma_irq_stride = 0x1000,
> +
> +	.wrdma_irq_reg_base = 0x19078,
> +	.wrdma_irq_stride = 0x1000,
> +	.codec_wrdma_irq_reg_base = 0x19290,
> +	.codec_wrdma_irq_stride = 0x1000,
> +
> +	.qxm_type = QAIF_QXM0,
> +	.rddma_shram_len = 64,
> +	.rddma_shram_start_addr = {0, 256},
> +	.wrdma_shram_len = 64,
> +	.wrdma_shram_start_addr = {0, 256},
> +
> +	.clk_name		= (const char * const []) {
> +					"lpass_config",
> +					"lpass_core_axim",
> +					"bus",
> +				},
> +	.num_clks		= 3,
> +
> +	.dai_driver		= shikra_qaif_cpu_dai_driver,
> +	.num_dai		= ARRAY_SIZE(shikra_qaif_cpu_dai_driver),
> +
> +	.dai_bit_clk_names	= (const char * const []) {
> +					"aif_if0_ibit",
> +					"aif_if1_ibit",
> +					"aif_if2_ibit",
> +					"aif_if3_ibit",
> +				},
> +	.aif_full_cycle_en	= (const bool []) { false, false, false, false },
> +	.aif_ctrl_data_oe	= (const bool []) { false, false, false, false },
> +	.aif_loopback_en	= (const bool []) { false, false, false, false },
> +	.alloc_stream_dma_idx	= shikra_qaif_alloc_stream_dma_idx,
> +	.free_stream_dma_idx	= shikra_qaif_free_stream_dma_idx,
> +	.get_dma_idx		= shikra_qaif_get_dma_idx,
> +};
> +
> +static const struct of_device_id shikra_qaif_cpu_device_id[] = {
> +	{ .compatible = "qcom,shikra-qaif-cpu", .data = &shikra_qaif_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, shikra_qaif_cpu_device_id);
> +
> +static struct platform_driver shikra_qaif_cpu_platform_driver = {
> +	.driver = {
> +		.name = "shikra-qaif-cpu",
> +		.of_match_table = shikra_qaif_cpu_device_id,
> +		.pm = pm_ptr(&asoc_qcom_qaif_pm_ops),
> +	},
> +	.probe = asoc_qcom_qaif_cpu_platform_probe,
> +};
> +module_platform_driver(shikra_qaif_cpu_platform_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) Shikra variant driver");
> +MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");
> 


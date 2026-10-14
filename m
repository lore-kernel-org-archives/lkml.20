Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FFB348C4B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964454; cv=none; b=Di87mdYRrCSM1OoeXBVXzkeyl5hvDjPXTLJfv52HVzYyIle57Vcv9Uzf5PnugGL7SZVXgImeyaWx41TN2H7p/h6u9pywRBXuvaKBvNLa33W6yG/Wsrj9CBt65n+PXdRb+AnzW4k5/qVxBCb59+8929ghohCRJwJ3YHLQMsihM8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964454; c=relaxed/simple;
	bh=3RoSAjYwe+6jdhS2yhdX4Spa9+g1wei6GP2OndmuUd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfSOpBlvhhE0ZDk08dld+d/o/1o+PMBpoWsN/jaXtzGgK6zp3pfJpTYVKXiVuofJ/F3mMamFdrcKQZowwx+1dN5g5DTmVZc2KXNn64IJYxNGbITI0wbroSAMpr4F67TB7k5W1Er1GULP3GIMbrmXPujxbinzC9ItnaKv5yBX94U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QK0P1OlN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNOUFfvC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QK0P1OlN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNOUFfvC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67hSa2685285
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2y+dNTGT9gofcUDXYGZM7DWhPFB5jVNS4T7gS84E4A=; b=QK0P1OlNnddjAdLW
	g1Oke88fu+36XUXd0PRmJr7idn3Fz8Z/q1qc0fPu7Rv1BUcxZBPVlKZ+VO3gcbe1
	ymBvmej8DcOwIR6azFwo7SlGiDrGwFItuYjLXi69YWA6iUXaSW9VMlQT4w4xo2yG
	r9QDGFXbAOPrTL3Il53J5er7RHszaAAn3yaIJ0XvYh5KbH0Q8WbyA7yg1gybaRbf
	hvKxmWoijN+w3nFPTMEQyLRQYz5ARixzSEg6mOYiEv3Aq6ZICM72UBa54fHqdHwz
	nIvFM/F0veBQLuRq3hNg5Pm92RvsiT6iOzTmB/2Tptgt4t90u2m7RIEBQY+sKvPY
	/1g9FA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0djf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:54:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7e92f36f9so3373401a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791964450; x=1792569250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2y+dNTGT9gofcUDXYGZM7DWhPFB5jVNS4T7gS84E4A=;
        b=RNOUFfvCnUDXxSIdgiIJcZdoMezEJiAG+od9OgF6Qlv0N47MatkoQXu+VGnZD5rTXd
         2AoabnhdALF27Se+gTa1rp36lc33qsYxxnpgRwQZB+N4TxA7azmIjSzDlR8q/BUvWbux
         1lm6prqHzrkhMvpUEPtbwo7wJyA1t5vihNB9uMHD7APZjGBMpMPHrNkeA6sjaQm31Ovs
         S3AqEsjAW+BHFmr4BBjyVUJUBafRDq7MU/x9aoDz5xt9CoroAHIp5eg0xZG8JSrjujQu
         0YXS7uEYGFM4Z/MUcOI6K+QN7OObnpHZYohgmDpAAMJv+PbtaFtL/pokcZcwycJCdlKX
         7zVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964450; x=1792569250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2y+dNTGT9gofcUDXYGZM7DWhPFB5jVNS4T7gS84E4A=;
        b=PEPuQc9gtMWa0NJVT9pzJTAD8aLrt8Mwp6jsdQakhjBxDra11+D1PH2q7Zz2JPZXfH
         xD0qMxgDV7udPh4fMWGcwLUqR2wnt0F3d8avOlYV0h3DwHlyapNz9/b6KUcKzzWq7qg6
         GiX/UbANJqg7IbWfib7eC9woo+IHf8uib+mILJIsgC2yAffCF3GxfSLCWAts+o+LXL8a
         oYN87fYmKVY6Y2TeYrnUaTjEeUwwYBDUIEjTWxY43Sti+EaD7ZAIRu3o15N/evgzeEwq
         DorYxyRn2sxGr3XnBGMR6eDSt3KSbfwfIJxNBjhaHB8/UdXe6EEPogIXDMu7VEd8BpVr
         1VdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPaBXciyd5+ZFjqrLA9KWuSBkLjcqrrpjTjzhy9Q7gpuqcHwHBWEe0Y/sdCRe7PbY4I9YmjdmvbXCumxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV5lpYGHyu6RQl0vDRxXJCOUkcBIdnKr7nn0UQCQIP67ABS4/2
	5xvIiLqT0aVMwnmbp3DZPhbpHVV+iGeQl4zZ4uHpje/ud0tr00WWJ9uRgPx80K5ECL1trWt4QUF
	Rv7fcoEBPkOERIAP1mxKqoT2GBk9N5F0/TWqkWN4X0DacvGiQIBYjGipv5UhQJ6TtZsc=
X-Gm-Gg: AYBFou2hbf92x0heZY3HkyqTVJxW1gHn9OLWiBG9UW79d7pDgTrW8sX3X62beDKrVuG
	/EzrQzCwHqCBN7lThnniHbNpQGpiuKSWtPWIqht7j9TfyiXs3S3PE6IeJPmG1KgZYLghQYe0pu2
	aegVjdQItEo+HlxgccUyeCF9AB0TS8QEIy4wno06MDmQXOTB8nu8boTB34PsmLjn7O4MAf8RBVb
	YsNy1J4v9VAGs3/FHtC5mkcUznBLL45vR9PFf7wzeBLeXmzHucDlNRZdOwk66qVjDlls91fqpSK
	Q9Avy9GqRns1w5p5g/E/NGpRp/bIt/kFiMyJbsiHPHtJhIvqER66JRFAQn8+yHL131rhK8PJdug
	OCsT84q4WNKDqGB9MScO+jxapnXQ=
X-Received: by 2002:a05:6a20:e210:b0:3dd:8d74:3a63 with SMTP id adf61e73a8af0-3e16bd84730mr14325955637.13.1791964450141;
        Wed, 14 Oct 2026 00:54:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:e210:b0:3dd:8d74:3a63 with SMTP id adf61e73a8af0-3e16bd84730mr14325917637.13.1791964449360;
        Wed, 14 Oct 2026 00:54:09 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f5204dcsm795275b3a.6.2026.10.14.00.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:54:08 -0700 (PDT)
Message-ID: <faa02c22-c692-4a1d-8428-45e1b6c7bc1a@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 13:24:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
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
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-4-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-4-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfX3rDhBSNtAkM9
 8KYOtHcdI60NAlUFWP2Nj21wNfgKZ/utpEbt11Yff0T7gcGEl7o6q5ld0l14FnIpPMkgLO7//Ao
 vVWsdbCMN0UUE4zBWOMMbwxeHeeI0BI=
X-Proofpoint-GUID: W11_y_ofhxKSF0Z7PB3VeI_srJ-kNY8g
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf3523 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zRYulWRnKbKPCRwcEAUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfX570fpkmhe2G/
 L/NsKq61Fd3ZosQZ0R4xKyNmcQfGeml3OhpPIPf7LVbQe6IFIRWNMZ352vBEJ8GKzS9tPfzY7V6
 0EMiIO6IUDxG0JVd7en5xO1Fp1ZXlJp0hr01h2dDJtGAnggCko6p6S2jjd9HIyCye6F3pwAPy0l
 GuZCQbGRkCVwU8t3l4b1AklEvGPU/2BDEHRqltP3Aiz3TW4aTdQ29m6hj1nsRYIytdB3mif330T
 SU/7imZynPc/NrnvcC7wxjoquA4bLuEaXrChlkwNqAunyGtcIJ2Wk+tm+AM5VDQ0T3czNpVRYi0
 BMZkspEPJrwyXjgThXTF/HTzzRMFwNxSEa+0kLMo6VN/Hboiwe6iRQ+qm5+W1IIgtlpTUg9Tzkh
 rJdgiKVTPMrJ1qWP4uTjDQ653lwVY0Ouf07+0k9kAbZxwobztNuuOvyc/DtLePAb5SSjAPnaD68
 eJEh48sWb6x+mox2vUg==
X-Proofpoint-ORIG-GUID: W11_y_ofhxKSF0Z7PB3VeI_srJ-kNY8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140031



On 10/13/2026 11:21 AM, Harendra Gautam wrote:
> Add the QAIF CPU DAI driver to support Qualcomm audio interface paths
> used for CDC DMA and serial AIF audio links.
> 
> Implement CIF DAI operations for CDC DMA paths, including channel mask
> programming and dynamic clock control. Implement AIF DAI operations for
> MI2S, TDM and PCM paths, including format setup, slot and lane
> configuration, bit clock management and stream enable handling.
> 
> Also add the QAIF MMIO regmap setup, parse per-interface configuration
> from devicetree, manage required clocks and register the CPU DAI
> component.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/qcom/qaif-cpu.c | 886 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 886 insertions(+)
> 
> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> new file mode 100644
> index 000000000000..ad7268e2ace0
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-cpu.c
> @@ -0,0 +1,886 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-cpu.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include "qaif-reg.h"
> +#include "qaif.h"
> +
> +/* CIF INTF CFG register bit positions */
> +#define QAIF_CIF_INTF_16BIT_UNPACK_BIT	BIT(0)
> +#define QAIF_CIF_INTF_DYNCLK_BIT	BIT(2)
> +#define QAIF_CIF_INTF_FS_SEL_MASK	GENMASK(7, 4)
> +#define QAIF_CIF_INTF_ACTIVE_CH_MASK	GENMASK(27, 12)
> +#define QAIF_CIF_INTF_ACTIVE_CH_SHIFT	12
> +
> +/* AIF CTL register (QAIF_AUD_INTF_CTL_REG) bit positions */
> +#define QAIF_AIF_CTL_ENABLE_BIT		BIT(0)
> +#define QAIF_AIF_CTL_ENABLE_TX_BIT	BIT(4)
> +#define QAIF_AIF_CTL_ENABLE_RX_BIT	BIT(8)
> +
> +/* AIF SYNC CFG register (QAIF_AUD_INTF_SYNC_CFG_REG) bit positions */
> +#define QAIF_AIF_SYNC_SRC_BIT		BIT(0)
> +#define QAIF_AIF_SYNC_MODE_MASK		GENMASK(5, 4)
> +#define QAIF_AIF_SYNC_MODE_SHIFT	4
> +#define QAIF_AIF_SYNC_DELAY_MASK	GENMASK(9, 8)
> +#define QAIF_AIF_SYNC_DELAY_SHIFT	8
> +#define QAIF_AIF_SYNC_INV_BIT		BIT(12)
> +
> +/* SYNC_MODE field values */
> +#define QAIF_AIF_SYNC_MODE_SHORT	0
> +#define QAIF_AIF_SYNC_MODE_ONE_SLOT	1
> +#define QAIF_AIF_SYNC_MODE_LONG		2
> +
> +/* SYNC_DELAY field values */
> +#define QAIF_AIF_SYNC_DELAY_SAME	0
> +#define QAIF_AIF_SYNC_DELAY_ONE		1
> +
> +/* AIF BIT WIDTH CFG register (QAIF_AUD_INTF_BIT_WIDTH_CFG_REG) bit positions */
> +#define QAIF_AIF_SLOT_WIDTH_TX_MASK	GENMASK(4, 0)
> +#define QAIF_AIF_SLOT_WIDTH_RX_MASK	GENMASK(12, 8)
> +#define QAIF_AIF_SLOT_WIDTH_RX_SHIFT	8
> +#define QAIF_AIF_SAMPLE_WIDTH_TX_MASK	GENMASK(20, 16)
> +#define QAIF_AIF_SAMPLE_WIDTH_TX_SHIFT	16
> +#define QAIF_AIF_SAMPLE_WIDTH_RX_MASK	GENMASK(28, 24)
> +#define QAIF_AIF_SAMPLE_WIDTH_RX_SHIFT	24
> +
> +/*
> + * slot_width is programmed 0-based into the 5-bit SLOT_WIDTH field and the
> + * frame length (slots * slot_width) 0-based into the 10-bit BITS_PER_LANE
> + * field, so these are the largest values the registers can represent.
> + */
> +#define QAIF_AIF_SLOT_WIDTH_MAX		32
> +#define QAIF_AIF_FRAME_BITS_MAX		1024
> +
> +/* AIF FRAME CFG register (QAIF_AUD_INTF_FRAME_CFG_REG) bit positions */
> +#define QAIF_AIF_BITS_PER_LANE_MASK	GENMASK(9, 0)
> +
> +/* AIF LANE CFG register (QAIF_AUD_INTF_LANE_CFG_REG) bit positions */
> +#define QAIF_AIF_LANE_DIR_MASK		GENMASK(7, 0)
> +#define QAIF_AIF_LANE_EN_MASK		GENMASK(15, 8)
> +#define QAIF_AIF_LANE_EN_SHIFT		8
> +#define QAIF_AIF_CTRL_DATA_OE_BIT	BIT(16)
> +#define QAIF_AIF_LOOPBACK_EN_BIT	BIT(31)
> +
> +/* AIF MI2S CFG register (QAIF_AUD_INTF_MI2S_CFG_REG) bit positions */
> +#define QAIF_AIF_MONO_MODE_TX_BIT	BIT(0)
> +#define QAIF_AIF_MONO_MODE_RX_BIT	BIT(1)
> +
> +/* AIF CFG register (QAIF_AUD_INTF_CFG_REG) bit positions */
> +#define QAIF_AIF_FULL_CYCLE_EN_BIT	BIT(0)
> +
> +static int qaif_cif_daiops_hw_params(struct snd_pcm_substream *substream,
> +				     struct snd_pcm_hw_params *params,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v = drvdata->variant;
> +	unsigned int dai_id = dai->driver->id;
> +	unsigned int regval;
> +	u32 reg;
> +	int idx;
> +
> +	switch (params_channels(params)) {
> +	case 1:
> +		regval = QAIF_CIF_DMA_INTF_ONE_CHANNEL;
> +		break;
> +	case 2:
> +		regval = QAIF_CIF_DMA_INTF_TWO_CHANNEL;
> +		break;
> +	case 4:
> +		regval = QAIF_CIF_DMA_INTF_FOUR_CHANNEL;
> +		break;
> +	case 6:
> +		regval = QAIF_CIF_DMA_INTF_SIX_CHANNEL;
> +		break;
> +	case 8:
> +		regval = QAIF_CIF_DMA_INTF_EIGHT_CHANNEL;
> +		break;
> +	default:
> +		dev_dbg(rtd->dev, "unsupported channel count %u\n",
> +			params_channels(params));
> +		return -EINVAL;
> +	}
> +
> +	idx = v->get_dma_idx(dai_id);
> +	if (idx < 0) {
> +		dev_err(rtd->dev, "Invalid DMA index: %d\n", idx);
> +		return -EINVAL;
> +	}
> +
> +	reg = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_CDC_RDDMA_INTF_CFG_REG(v, idx) :
> +		QAIF_CDC_WRDMA_INTF_CFG_REG(v, idx);
> +
> +	return regmap_update_bits(drvdata->audio_qaif_map, reg,
> +				  QAIF_CIF_INTF_ACTIVE_CH_MASK,
> +				  regval << QAIF_CIF_INTF_ACTIVE_CH_SHIFT);
> +}
> +
> +static int qaif_cif_daiops_trigger(struct snd_pcm_substream *substream,
> +				   int cmd, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v = drvdata->variant;
> +	unsigned int dai_id = dai->driver->id;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	u32 reg;
> +	int idx, ret;
> +
> +	idx = v->get_dma_idx(dai_id);
> +	if (idx < 0) {
> +		dev_err(rtd->dev, "Invalid DMA index: %d\n", idx);
> +		return -EINVAL;
> +	}
> +
> +	reg = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_CDC_RDDMA_INTF_CFG_REG(v, idx) :
> +		QAIF_CDC_WRDMA_INTF_CFG_REG(v, idx);
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret = regmap_update_bits(map, reg,
> +					 QAIF_CIF_INTF_DYNCLK_BIT,
> +					 QAIF_CIF_INTF_DYNCLK_BIT);
> +		if (ret)
> +			return ret;
> +		ret = regmap_update_bits(map, reg, QAIF_CIF_INTF_FS_SEL_MASK, 0);
> +		if (ret)
> +			return ret;
> +		return regmap_update_bits(map, reg,
> +					  QAIF_CIF_INTF_16BIT_UNPACK_BIT,
> +					  QAIF_CIF_INTF_16BIT_UNPACK_BIT);
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret = regmap_update_bits(map, reg, QAIF_CIF_INTF_DYNCLK_BIT, 0);
> +		if (ret)
> +			return ret;
> +		return regmap_update_bits(map, reg,
> +					  QAIF_CIF_INTF_16BIT_UNPACK_BIT, 0);
> +	default:
> +		dev_err(rtd->dev, "invalid trigger cmd %d\n", cmd);
> +		return -EINVAL;
> +	}
> +}
> +
> +static int qaif_cif_daiops_startup(struct snd_pcm_substream *substream,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	int ret;
> +
> +	ret = clk_prepare_enable(drvdata->aud_dma_clk);
> +	if (ret) {
> +		dev_err(dai->dev, "error enabling aud_dma clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(drvdata->aud_dma_mem_clk);
> +	if (ret) {
> +		dev_err(dai->dev, "error enabling aud_dma_mem clk: %d\n", ret);
> +		clk_disable_unprepare(drvdata->aud_dma_clk);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static void qaif_cif_daiops_shutdown(struct snd_pcm_substream *substream,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +
> +	clk_disable_unprepare(drvdata->aud_dma_mem_clk);
> +	clk_disable_unprepare(drvdata->aud_dma_clk);
> +}
> +
> +/*
> + * asoc_qcom_qaif_cif_dai_ops - DAI ops for QAIF CIF (CDC DMA) paths
> + *
> + * Provides startup, shutdown, hw_params and trigger callbacks for the
> + * Codec Interface DMA (CIF) DAI. startup/shutdown enable and disable the
> + * audio DMA clocks. Used by Shikra machine drivers for Bolero CDC DMA
> + * RX, TX and VA TX paths.
> + */
> +const struct snd_soc_dai_ops asoc_qcom_qaif_cif_dai_ops = {
> +	.startup	= qaif_cif_daiops_startup,
> +	.shutdown	= qaif_cif_daiops_shutdown,
> +	.hw_params	= qaif_cif_daiops_hw_params,
> +	.trigger	= qaif_cif_daiops_trigger,
> +};
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cif_dai_ops);
> +
> +static int qaif_aif_cpu_daiops_startup(struct snd_pcm_substream *substream,
> +				       struct snd_soc_dai *dai)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v = drvdata->variant;
> +	int idx, ret;
> +
> +	idx = v->get_dma_idx(dai->driver->id);
> +	if (idx < 0) {
> +		dev_err(dai->dev, "Invalid DMA index: %d\n", idx);
> +		return -EINVAL;
> +	}
> +
> +	ret = clk_prepare_enable(drvdata->aud_dma_clk);
> +	if (ret) {
> +		dev_err(dai->dev, "error enabling aud_dma clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(drvdata->aud_dma_mem_clk);
> +	if (ret) {
> +		dev_err(dai->dev, "error enabling aud_dma_mem clk: %d\n", ret);
> +		clk_disable_unprepare(drvdata->aud_dma_clk);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(drvdata->mi2s_bit_clk[idx]);
> +	if (ret) {
> +		dev_err(dai->dev, "error enabling mi2s bit clk: %d\n", ret);
> +		clk_disable_unprepare(drvdata->aud_dma_mem_clk);
> +		clk_disable_unprepare(drvdata->aud_dma_clk);
> +	}
> +	return ret;
> +}
> +
> +static void qaif_aif_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
> +					 struct snd_soc_dai *dai)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct qaif_aif_config *cfg;
> +	unsigned int enable_bit;
> +	int idx = v->get_dma_idx(dai->driver->id);
> +	int ret;
> +
> +	if (idx < 0) {
> +		dev_err(dai->dev, "Invalid DMA index: %d\n", idx);
> +		return;
> +	}
> +
> +	cfg = &drvdata->aif_intf_cfg[idx];
> +	if (cfg->loopback_en)
> +		enable_bit = QAIF_AIF_CTL_ENABLE_BIT;
> +	else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		enable_bit = QAIF_AIF_CTL_ENABLE_TX_BIT;
> +	else
> +		enable_bit = QAIF_AIF_CTL_ENABLE_RX_BIT;
> +
> +	ret = regmap_update_bits(drvdata->audio_qaif_map,
> +				 QAIF_AUD_INTF_CTL_REG(idx), enable_bit, 0);
> +	if (ret)
> +		dev_err(dai->dev, "error clearing AIF enable bit: %d\n", ret);
> +
> +	clk_disable_unprepare(drvdata->mi2s_bit_clk[idx]);
> +	clk_disable_unprepare(drvdata->aud_dma_mem_clk);
> +	clk_disable_unprepare(drvdata->aud_dma_clk);
> +}
> +
> +static int qaif_aif_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
> +					 struct snd_pcm_hw_params *params,
> +					 struct snd_soc_dai *dai)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v = drvdata->variant;
> +	const struct qaif_aif_config *cfg;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	snd_pcm_format_t format = params_format(params);
> +	unsigned int channels = params_channels(params);
> +	unsigned int slot_width;
> +	int bitwidth, idx, ret;
> +
> +	idx = v->get_dma_idx(dai->driver->id);
> +	if (idx < 0) {
> +		dev_err(dai->dev, "Invalid DMA index: %d\n", idx);
> +		return -EINVAL;
> +	}
> +
> +	cfg = &drvdata->aif_intf_cfg[idx];
> +
> +	bitwidth = snd_pcm_format_width(format);
> +	if (bitwidth < 0) {
> +		dev_err(dai->dev, "invalid bit width given: %d\n", bitwidth);
> +		return bitwidth;
> +	}
> +
> +	/*
> +	 * The sync, lane and frame configuration are shared by both directions
> +	 * of an AIF and are taken from aif_intf_cfg[idx], which is fixed at
> +	 * probe and via set_fmt()/set_tdm_slot(). Both directions program
> +	 * identical values here, so concurrent playback and capture hw_params()
> +	 * calls are idempotent.
> +	 */
> +	ret = regmap_update_bits(map, QAIF_AUD_INTF_SYNC_CFG_REG(idx),
> +				 QAIF_AIF_SYNC_SRC_BIT |
> +				 QAIF_AIF_SYNC_MODE_MASK |
> +				 QAIF_AIF_SYNC_DELAY_MASK |
> +				 QAIF_AIF_SYNC_INV_BIT,
> +				 (cfg->sync_src ? QAIF_AIF_SYNC_SRC_BIT : 0) |
> +				 (cfg->sync_mode << QAIF_AIF_SYNC_MODE_SHIFT) |
> +				 (cfg->sync_delay << QAIF_AIF_SYNC_DELAY_SHIFT) |
> +				 (cfg->invert_sync ? QAIF_AIF_SYNC_INV_BIT : 0));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(map, QAIF_AUD_INTF_LANE_CFG_REG(idx),
> +				 QAIF_AIF_LANE_DIR_MASK |
> +				 QAIF_AIF_LANE_EN_MASK |
> +				 QAIF_AIF_CTRL_DATA_OE_BIT |
> +				 QAIF_AIF_LOOPBACK_EN_BIT,
> +				 cfg->lane_dir_mask |
> +				 (cfg->lane_en_mask << QAIF_AIF_LANE_EN_SHIFT) |
> +				 (cfg->ctrl_data_oe ? QAIF_AIF_CTRL_DATA_OE_BIT : 0) |
> +				 (cfg->loopback_en ? QAIF_AIF_LOOPBACK_EN_BIT : 0));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(map, QAIF_AUD_INTF_CFG_REG(idx),
> +				 QAIF_AIF_FULL_CYCLE_EN_BIT,
> +				 cfg->full_cycle_en ? QAIF_AIF_FULL_CYCLE_EN_BIT : 0);
> +	if (ret)
> +		return ret;
> +
> +	if (qaif_is_aif_mi2s_port(dai->driver->id) && !cfg->slot_width) {
> +		slot_width = bitwidth;
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +			drvdata->aif_intf_cfg[idx].slot_en_tx_mask =
> +						GENMASK(channels - 1, 0);
> +		else
> +			drvdata->aif_intf_cfg[idx].slot_en_rx_mask =
> +						GENMASK(channels - 1, 0);
> +		drvdata->aif_intf_cfg[idx].slot_num = QAIF_MI2S_SLOTS;
> +	} else {
> +		slot_width = cfg->slot_width;
> +		if (!slot_width || !cfg->slot_num) {
> +			dev_err(dai->dev, "invalid TDM slot config: width=%u num=%u\n",
> +				slot_width, cfg->slot_num);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret = regmap_update_bits(map, QAIF_AUD_INTF_BIT_WIDTH_CFG_REG(idx),
> +					 QAIF_AIF_SLOT_WIDTH_TX_MASK |
> +					 QAIF_AIF_SAMPLE_WIDTH_TX_MASK,
> +					 QAIF_AIF_SLOT_WIDTH(slot_width) |
> +					 (QAIF_AIF_SAMPLE_WIDTH(bitwidth) <<
> +					  QAIF_AIF_SAMPLE_WIDTH_TX_SHIFT));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_AUD_INTF_ACTV_SLOT_EN_TX_REG(idx),
> +				   cfg->slot_en_tx_mask);
> +		if (ret)
> +			return ret;
> +		ret = regmap_update_bits(map, QAIF_AUD_INTF_MI2S_CFG_REG(idx),
> +					 QAIF_AIF_MONO_MODE_TX_BIT,
> +					 (channels < 2) ? QAIF_AIF_MONO_MODE_TX_BIT : 0);
> +	} else {
> +		ret = regmap_update_bits(map, QAIF_AUD_INTF_BIT_WIDTH_CFG_REG(idx),
> +					 QAIF_AIF_SLOT_WIDTH_RX_MASK |
> +					 QAIF_AIF_SAMPLE_WIDTH_RX_MASK,
> +					 (QAIF_AIF_SLOT_WIDTH(slot_width) <<
> +					  QAIF_AIF_SLOT_WIDTH_RX_SHIFT) |
> +					 (QAIF_AIF_SAMPLE_WIDTH(bitwidth) <<
> +					  QAIF_AIF_SAMPLE_WIDTH_RX_SHIFT));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_AUD_INTF_ACTV_SLOT_EN_RX_REG(idx),
> +				   cfg->slot_en_rx_mask);
> +		if (ret)
> +			return ret;
> +		ret = regmap_update_bits(map, QAIF_AUD_INTF_MI2S_CFG_REG(idx),
> +					 QAIF_AIF_MONO_MODE_RX_BIT,
> +					 (channels < 2) ? QAIF_AIF_MONO_MODE_RX_BIT : 0);
> +	}
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(map, QAIF_AUD_INTF_FRAME_CFG_REG(idx),
> +				 QAIF_AIF_BITS_PER_LANE_MASK,
> +				 (slot_width * cfg->slot_num) - 1);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int qaif_aif_cpu_daiops_trigger(struct snd_pcm_substream *substream,
> +				       int cmd, struct snd_soc_dai *dai)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v = drvdata->variant;
> +	const struct qaif_aif_config *cfg;
> +	unsigned int enable_bit;
> +	int idx, ret;
> +
> +	idx = v->get_dma_idx(dai->driver->id);
> +	if (idx < 0) {
> +		dev_err(dai->dev, "Invalid DMA index: %d\n", idx);
> +		return -EINVAL;
> +	}
> +
> +	cfg = &drvdata->aif_intf_cfg[idx];
> +	if (cfg->loopback_en)
> +		enable_bit = QAIF_AIF_CTL_ENABLE_BIT;
> +	else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		enable_bit = QAIF_AIF_CTL_ENABLE_TX_BIT;
> +	else
> +		enable_bit = QAIF_AIF_CTL_ENABLE_RX_BIT;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret = regmap_update_bits(drvdata->audio_qaif_map,
> +					 QAIF_AUD_INTF_CTL_REG(idx), enable_bit, enable_bit);
> +		if (ret)
> +			dev_err(dai->dev, "error setting AIF enable bit: %d\n", ret);
> +		return ret;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret = regmap_update_bits(drvdata->audio_qaif_map,
> +					 QAIF_AUD_INTF_CTL_REG(idx), enable_bit, 0);
> +		if (ret)
> +			dev_err(dai->dev, "error clearing AIF enable bit: %d\n", ret);
> +		return ret;
> +	default:
> +		dev_err(dai->dev, "invalid trigger cmd %d\n", cmd);
> +		return -EINVAL;
> +	}
> +}
> +
> +static int qaif_aif_cpu_daiops_set_tdm_slot(struct snd_soc_dai *dai,
> +					    unsigned int tx_mask,
> +					    unsigned int rx_mask, int slots,
> +					    int slot_width)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v = drvdata->variant;
> +	int idx = v->get_dma_idx(dai->driver->id);
> +	struct qaif_aif_config *cfg;
> +
> +	if (idx < 0)
> +		return -EINVAL;
> +
> +	if (slots <= 0 || slot_width <= 0)
> +		return -EINVAL;
> +
> +	if (slot_width > QAIF_AIF_SLOT_WIDTH_MAX ||
> +	    slots * slot_width > QAIF_AIF_FRAME_BITS_MAX)
> +		return -EINVAL;
> +
> +	cfg = &drvdata->aif_intf_cfg[idx];
> +	cfg->slot_num = slots;
> +	cfg->slot_width = slot_width;
> +	cfg->slot_en_tx_mask = tx_mask;
> +	cfg->slot_en_rx_mask = rx_mask;
> +
> +	return 0;
> +}
> +
> +static int qaif_aif_cpu_daiops_set_sysclk(struct snd_soc_dai *dai,
> +					  int clk_id, unsigned int freq,
> +					  int dir)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v = drvdata->variant;
> +	int idx = v->get_dma_idx(dai->driver->id);
> +
> +	if (idx < 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * The bit clock is prepared and enabled for the lifetime of the
> +	 * stream by startup()/shutdown(); only the rate is set here.
> +	 */
> +	return clk_set_rate(drvdata->mi2s_bit_clk[idx], freq);
> +}
> +
> +static int qaif_aif_cpu_daiops_set_fmt(struct snd_soc_dai *dai,
> +				       unsigned int fmt)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v = drvdata->variant;
> +	int idx = v->get_dma_idx(dai->driver->id);
> +	struct qaif_aif_config *cfg;
> +
> +	if (idx < 0)
> +		return -EINVAL;
> +
> +	cfg = &drvdata->aif_intf_cfg[idx];
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		cfg->sync_mode = QAIF_AIF_SYNC_MODE_LONG;
> +		cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> +		cfg->invert_sync = true;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_A:
> +		cfg->sync_mode = QAIF_AIF_SYNC_MODE_ONE_SLOT;
> +		cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_B:
> +		cfg->sync_mode = QAIF_AIF_SYNC_MODE_SHORT;
> +		cfg->sync_delay = QAIF_AIF_SYNC_DELAY_SAME;
> +		break;
> +	default:
> +		dev_err(dai->dev, "unsupported format 0x%x\n",
> +			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_CBP_CFP:
> +		cfg->sync_src = 1;
> +		break;
> +	case SND_SOC_DAIFMT_CBC_CFC:
> +		cfg->sync_src = 0;
> +		break;
> +	default:
> +		dev_err(dai->dev, "unsupported clock provider mode\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * For DSP_A/DSP_B (TDM/PCM) modes, sync inversion is board-configurable
> +	 * via the NB_IF flag.  For I2S, invert_sync is fixed above and must
> +	 * not be overridden here.
> +	 */
> +	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_I2S) {
> +		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +		case SND_SOC_DAIFMT_NB_NF:
> +		case SND_SOC_DAIFMT_NB_IF:
> +			cfg->invert_sync = (fmt & SND_SOC_DAIFMT_INV_MASK) ==
> +					   SND_SOC_DAIFMT_NB_IF;
> +			break;
> +		default:
> +			dev_err(dai->dev, "bit clock inversion is not supported\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * asoc_qcom_qaif_aif_cpu_dai_ops - DAI ops for QAIF AIF (MI2S/TDM/PCM) paths
> + *
> + * Provides startup, shutdown, hw_params and trigger callbacks
> + * for the Unified Audio Interface (AIF) DAI. Used by Shikra machine
> + * drivers for MI2S, TDM and PCM serial audio paths.
> + */
> +const struct snd_soc_dai_ops asoc_qcom_qaif_aif_cpu_dai_ops = {
> +	.set_fmt	= qaif_aif_cpu_daiops_set_fmt,
> +	.set_tdm_slot	= qaif_aif_cpu_daiops_set_tdm_slot,
> +	.set_sysclk	= qaif_aif_cpu_daiops_set_sysclk,
> +	.startup	= qaif_aif_cpu_daiops_startup,
> +	.shutdown	= qaif_aif_cpu_daiops_shutdown,
> +	.hw_params	= qaif_aif_cpu_daiops_hw_params,
> +	.trigger	= qaif_aif_cpu_daiops_trigger,
> +};
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_aif_cpu_dai_ops);
> +
> +static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
> +	.name = "qaif-cpu",
> +};
> +
> +static const struct regmap_config audio_qaif_regmap_config = {
> +	.name		= "audio_qaif_cpu",
> +	.reg_bits	= 32,
> +	.reg_stride	= 4,
> +	.val_bits	= 32,
> +	.cache_type	= REGCACHE_NONE,
> +};
> +
> +static int of_qaif_parse_aif_intf_cfg(struct device *dev,
> +				      struct qaif_drv_data *data)
> +{
> +	const struct qaif_variant *v = data->variant;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *intf_np;
> +	struct qaif_aif_config *cfg;
> +	int ret;
> +	u32 dai_id;
> +	int intf_idx;
> +	int num_interfaces = 0;
> +	u32 val_buf[QAIF_MAX_LANES];
> +	int j, n;
> +	unsigned long configured_intf_mask = 0;
> +
> +	for_each_child_of_node(np, intf_np) {
> +		if (!of_property_present(intf_np, "reg"))
> +			continue;
> +
> +		if (num_interfaces >= QAIF_MAX_AIF_CFG_CNT) {
> +			dev_warn(dev, "Too many AIF interfaces, limiting to %d\n",
> +				 QAIF_MAX_AIF_CFG_CNT);
> +			of_node_put(intf_np);
> +			break;
> +		}
> +
> +		ret = of_property_read_u32(intf_np, "reg", &dai_id);
> +		if (ret) {
> +			dev_err(dev, "Missing reg for interface %pOFn\n", intf_np);
> +			of_node_put(intf_np);
> +			return ret;
> +		}
> +
> +		intf_idx = v->get_dma_idx(dai_id);
> +		if (intf_idx < 0) {
> +			dev_err(dev, "Invalid DAI ID %d for interface %pOFn\n",
> +				dai_id, intf_np);
> +			of_node_put(intf_np);
> +			return -EINVAL;
> +		}
> +		if (intf_idx >= ARRAY_SIZE(data->aif_intf_cfg)) {
> +			dev_err(dev, "DAI ID %d maps to out-of-range intf_idx %d\n",
> +				dai_id, intf_idx);
> +			of_node_put(intf_np);
> +			return -EINVAL;
> +		}
> +
> +		if (configured_intf_mask & BIT(intf_idx)) {
> +			dev_err(dev, "Duplicate reg %d for interface %pOFn\n",
> +				dai_id, intf_np);
> +			of_node_put(intf_np);
> +			return -EINVAL;
> +		}
> +		configured_intf_mask |= BIT(intf_idx);
> +
> +		cfg = &data->aif_intf_cfg[intf_idx];
> +		if (v->aif_full_cycle_en)
> +			cfg->full_cycle_en = v->aif_full_cycle_en[intf_idx];
> +		if (v->aif_ctrl_data_oe)
> +			cfg->ctrl_data_oe = v->aif_ctrl_data_oe[intf_idx];
> +		if (v->aif_loopback_en)
> +			cfg->loopback_en = v->aif_loopback_en[intf_idx];
> +
> +		switch (snd_soc_daifmt_parse_format(intf_np, NULL) &
> +			SND_SOC_DAIFMT_FORMAT_MASK) {
> +		case SND_SOC_DAIFMT_I2S:
> +			cfg->sync_mode = QAIF_AIF_SYNC_MODE_LONG;
> +			cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> +			cfg->invert_sync = true;
> +			break;
> +		case SND_SOC_DAIFMT_DSP_A:
> +			cfg->sync_mode = QAIF_AIF_SYNC_MODE_ONE_SLOT;
> +			cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> +			break;
> +		case SND_SOC_DAIFMT_DSP_B:
> +			cfg->sync_mode = QAIF_AIF_SYNC_MODE_SHORT;
> +			cfg->sync_delay = QAIF_AIF_SYNC_DELAY_SAME;
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		if (!qaif_is_aif_mi2s_port(dai_id)) {
> +			ret = of_property_read_u32(intf_np, "dai-tdm-slot-width",
> +						   &cfg->slot_width);
> +			if (ret || !cfg->slot_width) {
> +				dev_err(dev, "Missing/invalid dai-tdm-slot-width for %pOFn\n",
> +					intf_np);
> +				of_node_put(intf_np);
> +				return ret ? ret : -EINVAL;
> +			}
> +			ret = of_property_read_u32(intf_np, "dai-tdm-slot-num",
> +						   &cfg->slot_num);
> +			if (ret || !cfg->slot_num) {
> +				dev_err(dev, "Missing/invalid dai-tdm-slot-num for %pOFn\n",
> +					intf_np);
> +				of_node_put(intf_np);
> +				return ret ? ret : -EINVAL;
> +			}
> +			snd_soc_of_get_slot_mask(intf_np, "dai-tdm-slot-rx-mask",
> +						 &cfg->slot_en_rx_mask);
> +			snd_soc_of_get_slot_mask(intf_np, "dai-tdm-slot-tx-mask",
> +						 &cfg->slot_en_tx_mask);
> +			if (!cfg->slot_en_rx_mask && !cfg->slot_en_tx_mask) {
> +				dev_err(dev, "No active TDM slots for %pOFn\n",
> +					intf_np);
> +				of_node_put(intf_np);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		n = of_property_read_variable_u32_array(intf_np,
> +							"qcom,qaif-aif-lane-map",
> +							val_buf, 1, QAIF_MAX_LANES);
> +		if (n < 0) {
> +			dev_err(dev, "Missing qcom,qaif-aif-lane-map for %pOFn\n",
> +				intf_np);
> +			of_node_put(intf_np);
> +			return n;
> +		}
> +		for (j = 0; j < n; j++) {
> +			if (val_buf[j] > 1) {
> +				dev_err(dev, "Invalid lane-map value %u for %pOFn\n",
> +					val_buf[j], intf_np);
> +				of_node_put(intf_np);
> +				return -EINVAL;
> +			}
> +			cfg->lane_en_mask |= BIT(j);
> +			if (val_buf[j])
> +				cfg->lane_dir_mask |= BIT(j);
> +		}
> +
> +		num_interfaces++;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * asoc_qcom_qaif_cpu_platform_probe - Probe the QAIF CPU and platform driver
> + * @pdev: Platform device
> + *
> + * Initialises the QAIF regmap, parses DT, sets up clocks and registers
> + * the CPU DAI component and PCM platform.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev)
> +{
> +	struct regmap_config regmap_cfg = audio_qaif_regmap_config;
> +	struct qaif_drv_data *drvdata;
> +	struct resource *res;
> +	const struct qaif_variant *variant;
> +	struct device *dev = &pdev->dev;
> +	const struct of_device_id *match;
> +	int ret, i, dai_id, idx;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate driver data\n");
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!match || !match->data)
> +		return dev_err_probe(dev, -EINVAL, "No matching device data\n");
> +
> +	drvdata->variant = match->data;
> +	variant = drvdata->variant;
> +
> +	if (!variant->get_dma_idx)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "variant is missing get_dma_idx callback\n");
> +
> +	ret = of_qaif_parse_aif_intf_cfg(dev, drvdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to parse aif interfaces\n");
> +
> +	drvdata->audio_qaif = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drvdata->audio_qaif))
> +		return dev_err_probe(dev, PTR_ERR(drvdata->audio_qaif),
> +				     "Failed to ioremap QAIF registers\n");
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get MMIO resource\n");
> +
> +	regmap_cfg.max_register = resource_size(res) - regmap_cfg.reg_stride;
> +	drvdata->audio_qaif_map = devm_regmap_init_mmio(dev, drvdata->audio_qaif,
> +							&regmap_cfg);
> +	if (IS_ERR(drvdata->audio_qaif_map))
> +		return dev_err_probe(dev, PTR_ERR(drvdata->audio_qaif_map),
> +				     "Failed to init regmap\n");
> +
> +	drvdata->aud_dma_clk = devm_clk_get(dev, "aud_dma");
> +	if (IS_ERR(drvdata->aud_dma_clk))
> +		return dev_err_probe(dev, PTR_ERR(drvdata->aud_dma_clk),
> +				     "Failed to get aud_dma clock\n");
> +
> +	drvdata->aud_dma_mem_clk = devm_clk_get(dev, "aud_dma_mem");
> +	if (IS_ERR(drvdata->aud_dma_mem_clk))
> +		return dev_err_probe(dev, PTR_ERR(drvdata->aud_dma_mem_clk),
> +				     "Failed to get aud_dma_mem clock\n");
> +
> +	for (i = 0; i < variant->num_dai; i++) {
> +		dai_id = variant->dai_driver[i].id;
> +		if (qaif_is_cif_port(dai_id))
> +			continue;
> +		idx = variant->get_dma_idx(dai_id);
> +		if (idx < 0)
> +			continue;
> +
> +		if (drvdata->mi2s_bit_clk[idx])
> +			continue;
> +
> +		drvdata->mi2s_bit_clk[idx] =
> +			devm_clk_get(dev, variant->dai_bit_clk_names[idx]);
> +		if (IS_ERR(drvdata->mi2s_bit_clk[idx]))
> +			return dev_err_probe(dev, PTR_ERR(drvdata->mi2s_bit_clk[idx]),
> +					     "Failed to get bit clock %d\n", idx);
> +	}
> +
> +	drvdata->num_clks = variant->num_clks;
> +	drvdata->clks = devm_kcalloc(dev, drvdata->num_clks,
> +				     sizeof(*drvdata->clks), GFP_KERNEL);
> +	if (!drvdata->clks)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate clocks\n");
> +
> +	for (i = 0; i < drvdata->num_clks; i++)
> +		drvdata->clks[i].id = variant->clk_name[i];
> +
> +	ret = devm_clk_bulk_get(dev, drvdata->num_clks, drvdata->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret = devm_snd_soc_register_component(dev, &qaif_cpu_comp_driver,
> +					      variant->dai_driver, variant->num_dai);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "error registering cpu driver\n");
> +
> +	return asoc_qcom_qaif_platform_register(pdev);
> +}
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_probe);
> +
> +static int asoc_qcom_qaif_runtime_suspend(struct device *dev)
> +{
> +	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> +	return 0;
> +}
> +
> +static int asoc_qcom_qaif_runtime_resume(struct device *dev)
> +{
> +	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +}
> +
> +EXPORT_GPL_DEV_PM_OPS(asoc_qcom_qaif_pm_ops) = {
> +	RUNTIME_PM_OPS(asoc_qcom_qaif_runtime_suspend,
> +		       asoc_qcom_qaif_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) CPU DAI driver");
> +MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");
> 


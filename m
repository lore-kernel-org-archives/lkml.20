Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE635AC24
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961754; cv=none; b=spG79/w5Vy0Lx007/EBMQxEmY+1uHxQduCgUGtGlaWPJvhxIT9r85OI+gXjaFZGXy+bmpUS/C5Hj5lI4lkZ9LCUXWbcyCOcS0r2ALE1z1yL/h8Jv4SkCv+6oNrA52AftaXB7N4tHiZTKUFy98OOGoO5/Yx74nd8ss1oaym2BFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961754; c=relaxed/simple;
	bh=XyX16nCNlN8dMExABT2FPEn3eIAqI6hefYauYl8cCt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSBCZvmiHROgK9JvzsYvVuFiyxHhLehq2Lz97xcfkk0fJ0VM/earV2xUb0Id4jLtmkOz/aSDlNiJvQYd45y+rB7Xexc/cjx9WuLjyrfyRAsxVT4amypq6N17EKhR0eQ32o46dlGHsV/jF9VGmQALX32ZIjEhKG5yDEBczR03VXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/JwUKwr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8IG4Awv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/JwUKwr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8IG4Awv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2RYpO3000901
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvQWKtFTQiIZeWIxJktStb0GH0UPoX3dylBsunoQwdE=; b=L/JwUKwr9gDPOd6p
	BCc4xNLgb6VbWvO/PayXMPXrjIkpEoYuRyd5AKtwQKMkvHqFZoiv9EN+joRZz/5u
	P+KudAn44dIQ3rDBqiOADurWfCMKJB742cUeask5ZFOs9j4fweiJ5DYQRB2HoVGF
	piqtUkObInOB+oVkDA/CBk4x9vKOyyEAn2EOhUo8PHZeF2zS/yECPFrK1NFYlbrR
	9S1JXjrDz9epLD6Y2QQpndT6A59RTBGl9SrXhqdu6t9JMHspAAME51W1dnCXdPDg
	eu2Tkn3mlKEdT86T+ceoGNM6rkj4CI/1TFHmMnNVqcvHei0mOSKbqcm3nlRGNhw4
	yMqH3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbetpdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:09:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso1186135a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961748; x=1792566548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvQWKtFTQiIZeWIxJktStb0GH0UPoX3dylBsunoQwdE=;
        b=V8IG4AwvLaPSBJUFuksy/P3FGtwWNRoGPoFnydeAscFHJ6t1DjD5Sg/ldDEI5AaND/
         WSfbNyZ+JAb4/t86AxlchE4nk7pW1GugINZgXnsnT8KOErQ0snByHrepAIp9EQdXYfQO
         TLwO6RQ8e0lbsvb7JreFd/ro4pcdiAfZasVezkJe0nMuPHbM0aS4XWH75M1Z0iO8UDPR
         ZDC8FBVpK9bgE0nA4PGzcUaPWJ91PYkQyTJ8g6wWHNSpwVyEc+1Ro5Uwha+VbEtFxY8u
         erIXAeBq+FH5bWtc1DLDUOnJgmSTlel05nD+7chVXLpCRmKSAp5RljhRSWnoOZw+L2v5
         wdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961748; x=1792566548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvQWKtFTQiIZeWIxJktStb0GH0UPoX3dylBsunoQwdE=;
        b=uEvPta5E4/gQsSPv/Ec//Br67jIxg0+N2jgtfsAleF4FQPf9ZowIkzAmA4bGAbQtsp
         wx01Va1zwDyTLSXCuxXMf7c0Sowj9jqFJxUqpyT9VxQHrZpqs/yptRQcfinhbIZEIbj3
         tfgUCnTTFP3EtxxOh+8qCdd7GeP8CSFJDLzhf5Zy8TfG0HnldYTiGFZaMjO/1L3TFWLZ
         QtvAV65QTh7MbvzAL1dPYelr7+eVZ4yZiB0PnmRg7fvEwLXWWUy5zbgW8Ll8rtgYAwd3
         3yKBuj3iVOmG3AXhorQ15/FCWMDfPvAWHa281bQGT2YNXgU7S65IZhg3q2MLs90lOSk8
         BiHg==
X-Forwarded-Encrypted: i=1; AKwUvBy1z6kWbpDH1FEs5H/uMjVX3/GNwa88/JurKdVzr6ruxexasYDjjeinY/m4AqqcpYPh/X53DIfWkrC7hds=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdNZAVACn1C89UzrdksPOU6uPnYw18iqPeER4BgoivzjRMNtub
	Ci6Gju4YAtKJijMKRXLlQ4Gle4s0TJbhfoJexpLIksRItGVd8gmKEa0tS8ltzxo1gsBVQDe+abV
	TgleGL4uKifd8U64HNxYaY/F4Uu4ZkgI2L6dLqOC1hRQQKeyeKWAvsPjJbBxqwPr9VOA=
X-Gm-Gg: AYBFou0aaa9QTrorDeRYDAF9KYsQlWGhpoweauueQxpOmZ+VshXaTUJPIX3ERCb1E1C
	OduZJ9Dk+lkeuvVkALGHQdnKiw80rgg1+3CmSLFukY2wD96boxWfVUbn4xap3R4Ok10YBzsBjaq
	oKdBld5doU+TeEqYUGIiGDM4ce/6XYNkwC81e5pP6St7LqJtvJc5/IglB1LhVvtg0DM6IL9J3Hu
	e2Wt34O2sUmu5IQTNFoO5NlkLvKj6LXxoyaNdVAhZqonUmiXOs+5GgTGTIqhxLS4AyB/Ri8Tx4f
	XBSUI1HIVIIo33nq/pUMimBXpKVIz2I+zwG031sU7wTM8wVuwZCPxA+uhkauO53JYQyUN/qAj7O
	HdbLTIK8ifcLYmIGYDN2FvC4I4zk=
X-Received: by 2002:a17:90b:2d86:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3ab3a778678mr12705449a91.29.1791961747780;
        Wed, 14 Oct 2026 00:09:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2d86:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3ab3a778678mr12705420a91.29.1791961747125;
        Wed, 14 Oct 2026 00:09:07 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac77441306sm460390a91.2.2026.10.14.00.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:09:06 -0700 (PDT)
Message-ID: <ff09ce3c-2062-4fa6-bc10-1951f8849913@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:38:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/10] ASoC: qcom: Add QAIF hardware register map
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
 <20261013-b4-qaif-shikra-audio-v9-3-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-3-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GH_7nNX_K7sDa7mIUOqInPd3S4O1U_P2
X-Proofpoint-GUID: GH_7nNX_K7sDa7mIUOqInPd3S4O1U_P2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX3KECZqp4xOR5
 CfFEtnkyVNwW/BwaSu/h/v47NSNg10qWESJY6DQUOylspko76XpCyPC4YUwVhgPLbyVQ06x62yq
 aIwymYNGuc/tyj9Pgl/WgcwwPrmMNqgV+bRIBBgy1e2+r8kIKccYH6VfIbMaRimIZ/2NhECsvZ8
 8dYDvMwh/Xz0dY4Aca+LxBdOj6t2beUQTlK95jrUrB5Q6tdWIAHRnu9FnKcoAVXi5JTgTQao/dJ
 FaTakEaU2T81+QO6STfBnd2zJs3T1bYEgaIl92Y8JGTVahQa+YjufpqHAmqIRZyhJCFih8wtAO6
 P1NQwyAQv1xoOeRUsCJeMKUfpnO9BG0tt4Heff6fDF10bHy8m0ej0SZ/+URt1p5AYQ6LhZkEESa
 K+pwZYVyU4L4ff69mGnq8S/vvhekjMSdVv4lwk5EBowXa0wAycs0C209d7CFScpNIV5CKdujpXY
 2mujvL3oazesrlqHX6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX/7ZjGAvcnOk2
 RgEzkA2G8V0kmrQQaZFUi6OHfq9K3Tm/7/nsRLkos3pgGU5ClrYLPORPAKVkAWLlbjjQ0TCA0Hx
 7UTxL4x9o5tFSsqV3k0XuydiFsHdfUE=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf2a94 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vlhGFdm_2d5XL7VaKv0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140028



On 10/13/2026 11:21 AM, Harendra Gautam wrote:
> Add qaif-reg.h to define the MMIO register offsets for the Qualcomm Audio
> Interface (QAIF) hardware block.
> 
> The QAIF driver needs a common register map to program the core registers,
> audio interfaces, AIF/CIF DMA channels, interrupt registers, SHRAM/QXM
> routing, and SID maps. Add accessor helpers so the driver can select the
> proper AIF or CIF DMA register set based on the DAI ID.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/qcom/qaif-reg.h | 470 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 470 insertions(+)
> 
> diff --git a/sound/soc/qcom/qaif-reg.h b/sound/soc/qcom/qaif-reg.h
> new file mode 100644
> index 000000000000..2ae26cf24c59
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-reg.h
> @@ -0,0 +1,470 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-reg.h -- QAIF ALSA SoC CPU-Platform DAI driver register header
> + */
> +#ifndef SND_SOC_QCOM_QAIF_REG_H
> +#define SND_SOC_QCOM_QAIF_REG_H
> +
> +#include "qaif.h"
> +
> +#define QAIF_SUMMARY_IRQSTAT_REG(v)			(0x19188 + (0x1000 * ((v)->ee)))
> +
> +/* Core HW info */
> +#define QAIF_HW_VERSION_REG				(0x0000)
> +#define QAIF_HW_INFO_REG				(0x0004)
> +#define QAIF_HW_INFO2_REG				(0x0008)
> +
> +/* Interface lane and channel info */
> +#define QAIF_AUD_INTF_LANE_INFO_REG			(0x0020)
> +#define QAIF_AUD_INTF_LANE_INFO2_REG			(0x0024)
> +#define QAIF_CDC_TX_INTF_CH_INFO_REG(n)			(0x0028 + (0x4 * (n)))
> +#define QAIF_CDC_RX_INTF_CH_INFO_REG(n)			(0x0068 + (0x4 * (n)))
> +#define QAIF_QXM1_SHRAM_LENGTH_INFO_REG			(0x0088)
> +#define QAIF_QXM0_SHRAM_LENGTH_INFO_REG			(0x008C)
> +#define QAIF_NUM_AUD_INTF_TO_RAIL_INFO_REG		(0x0090)
> +
> +/* Debug/control and status */
> +#define QAIF_DEBUG_CTL_REG				(0x0200)
> +#define QAIF_WRDMA_LOOPBACK_EN_REG			(0x0204)
> +#define QAIF_WRDMA_LOOPBACK_SEL_REG			(0x0208)
> +#define QAIF_SHRAM_DYNAMIC_CLK_GATING_EN_REG		(0x0300)
> +#define QAIF_AXI_STATUS_REG				(0x0304)
> +#define QAIF_QSB_DYNAMIC_CLK_GATING_EN_REG		(0x0308)
> +#define QAIF_START_STOP_CTRL_BYPASS_EN_REG		(0x030C)
> +#define QAIF_QXM0_AXI_ATTR_CFG_REG			(0x040C)
> +
> +/* QXM request/grant debug */
> +#define QAIF_QXM0_AUD_WR_REQ_GNT_DBG_STAT_REG		(0x0500)
> +#define QAIF_QXM1_AUD_WR_REQ_GNT_DBG_STAT_REG		(0x0504)
> +#define QAIF_QXM0_CODEC_RX_WR_REQ_DBG_STAT_REG		(0x0508)
> +#define QAIF_QXM0_CODEC_RX_WR_GNT_DBG_STAT_REG		(0x050C)
> +#define QAIF_QXM1_CODEC_RX_WR_REQ_DBG_STAT_REG		(0x0510)
> +#define QAIF_QXM1_CODEC_RX_WR_GNT_DBG_STAT_REG		(0x0514)
> +#define QAIF_QXM0_AUD_RD_REQ_GNT_DBG_STAT_REG		(0x0518)
> +#define QAIF_QXM1_AUD_RD_REQ_GNT_DBG_STAT_REG		(0x051C)
> +#define QAIF_QXM0_CODEC_TX_RD_REQ_DBG_STAT_REG		(0x0520)
> +#define QAIF_QXM0_CODEC_TX_RD_GNT_DBG_STAT_REG		(0x0524)
> +#define QAIF_QXM1_CODEC_TX_RD_REQ_DBG_STAT_REG		(0x0528)
> +#define QAIF_QXM1_CODEC_TX_RD_GNT_DBG_STAT_REG		(0x052C)
> +#define QAIF_QXM0_EXT_RDDMA_RD_REQ_GNT_DBG_STAT_REG	(0x0530)
> +#define QAIF_QXM1_EXT_RDDMA_RD_REQ_GNT_DBG_STAT_REG	(0x0534)
> +
> +/* QSB transaction debug */
> +#define QAIF_QSB_AUD_WR_TXN_DBG_STAT_REG		(0x0538)
> +#define QAIF_QSB_CODEC_RX_WR_TXN_ERR_DBG_STAT_REG	(0x053C)
> +#define QAIF_QSB_CODEC_RX_WR_TXN_OKAY_DBG_STAT_REG	(0x0540)
> +#define QAIF_QSB_AUD_ADDR_SENT_DBG_STAT_REG		(0x0544)
> +#define QAIF_QSB_CODEC_TX_RD_ADDR_SENT_DBG_STAT_REG	(0x0548)
> +#define QAIF_QSB_EXT_RDDMA_RD_ADDR_SENT_DBG_STAT_REG	(0x054C)
> +#define QAIF_QSB_CODEC_RX_WR_ADDR_SENT_DBG_STAT_REG	(0x0550)
> +#define QAIF_QSB_AUD_RD_TXN_DBG_STAT_REG		(0x0554)
> +#define QAIF_QSB_CODEC_TX_RD_TXN_ERR_DBG_STAT_REG	(0x0558)
> +#define QAIF_QSB_CODEC_TX_RD_TXN_RCVD_DBG_STAT_REG	(0x055C)
> +#define QAIF_QSB_EXT_RDDMA_RD_TXN_DBG_STAT_REG		(0x0560)
> +#define QAIF_QSB_MISC_DBG_STATUS_REG			(0x0564)
> +
> +/* Global spare and HWE */
> +#define QAIF_GLOBAL_SPARE_IN_REG			(0x0B00)
> +#define QAIF_GLOBAL_SPARE_OUT_REG			(0x0B04)
> +#define QAIF_HWE_CFG_REG				(0x0B08)
> +
> +/* SID maps */
> +#define QAIF_WRDMA_SID_MAP_REG				(0x1B00)
> +#define QAIF_CDC_WRDMA_SID_MAP_REG			(0x1B40)
> +#define QAIF_RDDMA_SID_MAP_REG				(0x1C00)
> +#define QAIF_CDC_RDDMA_SID_MAP_REG			(0x1C40)
> +
> +/* EE overlap interrupts */
> +#define QAIF_EE_OVERLAP_IRQ_EN_REG			(0x1D00)
> +#define QAIF_EE_OVERLAP_IRQ_RAW_STATUS_REG		(0x1D04)
> +#define QAIF_EE_OVERLAP_IRQ_CLEAR_REG			(0x1D08)
> +#define QAIF_EE_OVERLAP_IRQ_FORCE_REG			(0x1D0C)
> +
> +/*
> + * EE (Execution Engine) assignment and map registers.
> + *
> + * The EE offset (v->ee) is an address/index offset relative to the
> + * platform-defined QAIF/EE base and lets the hardware route the AIF
> + * operation to the correct EE context. It is hardware/platform-specific and
> + * must match the mapping defined for the selected QAIF AIF/lane in the
> + * hardware programming guide. It is not a runtime data offset and must not
> + * be changed based on the stream configuration.
> + */
> +#define QAIF_EE_RDDMA_ASSIGNMENT_REG(v)			(0x19148 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_WRDMA_ASSIGNMENT_REG(v)			(0x19150 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_INTF_ASSIGNMENT_REG(v)			(0x19158 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_RDDMA_ASSIGN_REG(v)		(0x19308 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_WRDMA_ASSIGN_REG(v)		(0x19318 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_RDDMA_MAP_REG(v)			(0x1920 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_WRDMA_MAP_REG(v)			(0x1940 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_INTF_MAP_REG(v)				(0x1960 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_RDDMA_MAP_REG(v)			(0x1980 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_CODEC_WRDMA_MAP_REG(v)			(0x1A00 + (0x1000 * ((v)->ee)))
> +
> +/* EE rate-detection and VFR interrupts */
> +#define QAIF_EE_RATE_DET_IRQ_EN_REG(v)			(0x190F0 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_RATE_DET_IRQ_STAT_REG(v)		(0x190F4 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_RATE_DET_IRQ_RAW_STAT_REG(v)		(0x190F8 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_RATE_DET_IRQ_CLEAR_REG(v)		(0x190FC + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_RATE_DET_IRQ_FORCE_REG(v)		(0x19100 + (0x1000 * ((v)->ee)))
> +
> +#define QAIF_EE_VFR_IRQ_EN_REG(v)			(0x19104 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_VFR_IRQ_STATUS_REG(v)			(0x19108 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_VFR_IRQ_RAW_STATUS_REG(v)		(0x1910C + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_VFR_IRQ_CLEAR_REG(v)			(0x19110 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_VFR_IRQ_FORCE_REG(v)			(0x19114 + (0x1000 * ((v)->ee)))
> +
> +/* EE AUD_INTF underflow/overflow interrupts */
> +#define QAIF_EE_AUD_INTF_UF_IRQ_EN_REG(v)		(0x19160 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_AUD_INTF_UF_IRQ_STAT_REG(v)		(0x19164 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_AUD_INTF_UF_IRQ_RAW_STAT_REG(v)		(0x19168 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_AUD_INTF_UF_IRQ_CLEAR_REG(v)		(0x1916C + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_AUD_INTF_UF_IRQ_FORCE_REG(v)		(0x19170 + (0x1000 * ((v)->ee)))
> +
> +#define QAIF_EE_AUD_INTF_OF_IRQ_EN_REG(v)		(0x19174 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_AUD_INTF_OF_IRQ_STAT_REG(v)		(0x19178 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_AUD_INTF_OF_IRQ_RAW_STAT_REG(v)		(0x1917C + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_AUD_INTF_OF_IRQ_CLEAR_REG(v)		(0x19180 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_AUD_INTF_OF_IRQ_FORCE_REG(v)		(0x19184 + (0x1000 * ((v)->ee)))
> +
> +/* EE L2 Period IRQ mux selection */
> +#define QAIF_EE_L2_PERIOD_IRQ_0_3_MUX_SEL_REG(v)	(0x19F00 + (0x1000 * ((v)->ee)))
> +#define QAIF_EE_L2_PERIOD_IRQ_4_7_MUX_SEL_REG(v)	(0x19F04 + (0x1000 * ((v)->ee)))
> +
> +/* AUD_INTF block (per interface, stride 0x1000 starting at 0x4000) */
> +#define QAIF_AUD_INTF_REG_ADDR(offset, i)		(0x4000 + (offset) + (0x1000 * (i)))
> +
> +#define QAIF_AUD_INTF_CTL_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0000, (i))
> +#define QAIF_AUD_INTF_SYNC_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0004, (i))
> +#define QAIF_AUD_INTF_BIT_WIDTH_CFG_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0008, (i))
> +#define QAIF_AUD_INTF_FRAME_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x000C, (i))
> +#define QAIF_AUD_INTF_ACTV_SLOT_EN_TX_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0010, (i))
> +#define QAIF_AUD_INTF_ACTV_SLOT_EN_RX_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0030, (i))
> +#define QAIF_AUD_INTF_LANE_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0050, (i))
> +#define QAIF_AUD_INTF_MI2S_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0054, (i))
> +#define QAIF_AUD_INTF_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0058, (i))
> +#define QAIF_AUD_INTF_CHAR_CTL_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x005C, (i))
> +#define QAIF_AUD_INTF_CHAR_CFG_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0060, (i))
> +#define QAIF_AUD_INTF_CHAR_DATA_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x0064, (i))
> +#define QAIF_AUD_INTF_CHAR_DATA_EXT_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0068, (i))
> +#define QAIF_AUD_INTF_CHAR_SYNC_REG(i)			QAIF_AUD_INTF_REG_ADDR(0x006C, (i))
> +#define QAIF_AUD_INTF_INIT_DBG_STATUS_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0FF0, (i))
> +#define QAIF_AUD_INTF_TX_DBG_STATUS_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0FF4, (i))
> +#define QAIF_AUD_INTF_RX_DBG_STATUS_REG(i)		QAIF_AUD_INTF_REG_ADDR(0x0FF8, (i))
> +
> +/* RATE_DET block (per detector, stride 0x1000 starting at 0x1E000) */
> +#define QAIF_RATE_DET_REG_ADDR(offset, det)		(0x1E000 + (offset) + (0x1000 * (det)))
> +
> +#define QAIF_RATE_DET_CONFIG_REG(det)			QAIF_RATE_DET_REG_ADDR(0x0000, (det))
> +#define QAIF_RATE_DET_TARGET1_CONF_REG(det)		QAIF_RATE_DET_REG_ADDR(0x0004, (det))
> +#define QAIF_RATE_DET_TARGET2_CONF_REG(det)		QAIF_RATE_DET_REG_ADDR(0x0008, (det))
> +#define QAIF_RATE_DET_BIN_REG(det)			QAIF_RATE_DET_REG_ADDR(0x000C, (det))
> +#define QAIF_RATE_DET_STC_DIFF_REG(det)			QAIF_RATE_DET_REG_ADDR(0x0010, (det))
> +#define QAIF_RATE_DET_SEL_REG(det)			QAIF_RATE_DET_REG_ADDR(0x0014, (det))
> +#define QAIF_RATE_DET_TIMEOUT_CFG_REG(det)		QAIF_RATE_DET_REG_ADDR(0x0018, (det))
> +
> +#define QAIF_WRDMA_MAP_QXM				(0x1000)
> +#define QAIF_CDC_WRDMA_MAP_QXM				(0x1004)
> +#define QAIF_RDDMA_MAP_QXM				(0x1010)
> +#define QAIF_CDC_RDDMA_MAP_QXM				(0x1014)
> +#define QAIF_RDDMA_QXM1_SHRAM_ST_ADDR(i)		(0x1100 + (0x4 * (i)))
> +#define QAIF_CDC_RDDMA_QXM1_SHRAM_ST_ADDR(i)		(0x1140 + (0x4 * (i)))
> +#define QAIF_RDDMA_QXM0_SHRAM_ST_ADDR(i)		(0x1200 + (0x4 * (i)))
> +#define QAIF_CDC_RDDMA_QXM0_SHRAM_ST_ADDR(i)		(0x1240 + (0x4 * (i)))
> +#define QAIF_RDDMA_QXM1_SHRAM_LEN(i)			(0x1300 + (0x4 * (i)))
> +#define QAIF_CDC_RDDMA_QXM1_SHRAM_LEN(i)		(0x1340 + (0x4 * (i)))
> +#define QAIF_RDDMA_QXM0_SHRAM_LEN(i)			(0x1400 + (0x4 * (i)))
> +#define QAIF_CDC_RDDMA_QXM0_SHRAM_LEN(i)		(0x1440 + (0x4 * (i)))
> +#define QAIF_WRDMA_QXM1_SHRAM_ST_ADDR(i)		(0x1500 + (0x4 * (i)))
> +#define QAIF_CDC_WRDMA_QXM1_SHRAM_ST_ADDR(i)		(0x1540 + (0x4 * (i)))
> +#define QAIF_WRDMA_QXM0_SHRAM_ST_ADDR(i)		(0x1600 + (0x4 * (i)))
> +#define QAIF_CDC_WRDMA_QXM0_SHRAM_ST_ADDR(i)		(0x1640 + (0x4 * (i)))
> +#define QAIF_WRDMA_QXM1_SHRAM_LEN(i)			(0x1700 + (0x4 * (i)))
> +#define QAIF_CDC_WRDMA_QXM1_SHRAM_LEN(i)		(0x1740 + (0x4 * (i)))
> +#define QAIF_WRDMA_QXM0_SHRAM_LEN(i)			(0x1800 + (0x4 * (i)))
> +#define QAIF_CDC_WRDMA_QXM0_SHRAM_LEN(i)		(0x1840 + (0x4 * (i)))
> +
> +/* RDDMA */
> +static inline u32 qaif_rddma_reg_addr(const struct qaif_variant *v,
> +				      u32 offset, u32 i)
> +{
> +	return v->rddma_reg_base + offset + v->rddma_stride * i;
> +}
> +
> +#define QAIF_RDDMA_CTL_REG(v, i)			qaif_rddma_reg_addr(v, 0x00, (i))
> +#define QAIF_RDDMA_CFG_REG(v, i)			qaif_rddma_reg_addr(v, 0x04, (i))
> +#define QAIF_RDDMA_BASE_ADDR_REG(v, i)			qaif_rddma_reg_addr(v, 0x08, (i))
> +#define QAIF_RDDMA_BUFF_LEN_REG(v, i)			qaif_rddma_reg_addr(v, 0x10, (i))
> +#define QAIF_RDDMA_CURR_ADDR_REG(v, i)			qaif_rddma_reg_addr(v, 0x14, (i))
> +#define QAIF_RDDMA_PERIOD_LEN_REG(v, i)			qaif_rddma_reg_addr(v, 0x1C, (i))
> +#define QAIF_RDDMA_PERIOD_CNT_REG(v, i)			qaif_rddma_reg_addr(v, 0x20, (i))
> +#define QAIF_RDDMA_SHRAM_WORDCNT_REG(v, i)		qaif_rddma_reg_addr(v, 0x24, (i))
> +#define QAIF_RDDMA_FRAME_STATUS_REG(v, i)		qaif_rddma_reg_addr(v, 0x28, (i))
> +#define QAIF_RDDMA_FRAME_STATUS_EXTN_REG(v, i)		qaif_rddma_reg_addr(v, 0x2C, (i))
> +#define QAIF_RDDMA_FRAME_STATUS_CLR_REG(v, i)		qaif_rddma_reg_addr(v, 0x30, (i))
> +#define QAIF_RDDMA_SET_BUFF_CNT_REG(v, i)		qaif_rddma_reg_addr(v, 0x34, (i))
> +#define QAIF_RDDMA_SET_PERIOD_CNT_REG(v, i)		qaif_rddma_reg_addr(v, 0x38, (i))
> +#define QAIF_RDDMA_STC_LSB_REG(v, i)			qaif_rddma_reg_addr(v, 0x3C, (i))
> +#define QAIF_RDDMA_STC_MSB_REG(v, i)			qaif_rddma_reg_addr(v, 0x40, (i))
> +#define QAIF_RDDMA_PERIOD_DET_STAT_REG(v, i)		qaif_rddma_reg_addr(v, 0x44, (i))
> +#define QAIF_RDDMA_PERIOD_DET_CLR_REG(v, i)		qaif_rddma_reg_addr(v, 0x48, (i))
> +#define QAIF_RDDMA_FORMAT_ERR_REG(v, i)			qaif_rddma_reg_addr(v, 0x4C, (i))
> +#define QAIF_RDDMA_AHB_BYPASS_REG(v, i)			qaif_rddma_reg_addr(v, 0x50, (i))
> +#define QAIF_RDDMA_SHUTDOWN_STAT_REG(v, i)		qaif_rddma_reg_addr(v, 0x54, (i))
> +#define QAIF_RDDMA_PADDING_CFG_REG(v, i)		qaif_rddma_reg_addr(v, 0x58, (i))
> +#define QAIF_RDDMA_STATUS_REG(v, i)			qaif_rddma_reg_addr(v, 0x60, (i))
> +#define QAIF_RDDMA_DBG_STATUS_REG(v, i)			qaif_rddma_reg_addr(v, 0xFF0, (i))
> +
> +static inline u32 qaif_codec_rddma_reg_addr(const struct qaif_variant *v,
> +					    u32 offset, u32 i)
> +{
> +	return v->codec_rddma_reg_base + offset + v->codec_rddma_stride * i;
> +}
> +
> +#define QAIF_CDC_RDDMA_CTL_REG(v, i)			qaif_codec_rddma_reg_addr(v, 0x00, (i))
> +#define QAIF_CDC_RDDMA_CFG_REG(v, i)			qaif_codec_rddma_reg_addr(v, 0x04, (i))
> +#define QAIF_CDC_RDDMA_BASE_ADDR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x08, (i))
> +#define QAIF_CDC_RDDMA_BUFF_LEN_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x10, (i))
> +#define QAIF_CDC_RDDMA_CURR_ADDR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x14, (i))
> +#define QAIF_CDC_RDDMA_PERIOD_LEN_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x1C, (i))
> +#define QAIF_CDC_RDDMA_PERIOD_CNT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x20, (i))
> +#define QAIF_CDC_RDDMA_SHRAM_WORDCNT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x24, (i))
> +#define QAIF_CDC_RDDMA_FRAME_STAT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x28, (i))
> +#define QAIF_CDC_RDDMA_FRAME_STAT_EXTN_REG(v, i)	qaif_codec_rddma_reg_addr(v, 0x2C, (i))
> +#define QAIF_CDC_RDDMA_FRAME_STAT_CLR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x30, (i))
> +#define QAIF_CDC_RDDMA_SET_BUFF_CNT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x34, (i))
> +#define QAIF_CDC_RDDMA_SET_PERIOD_CNT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x38, (i))
> +#define QAIF_CDC_RDDMA_STC_LSB_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x3C, (i))
> +#define QAIF_CDC_RDDMA_STC_MSB_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x40, (i))
> +#define QAIF_CDC_RDDMA_PERIOD_DET_STAT_REG(v, i)	qaif_codec_rddma_reg_addr(v, 0x44, (i))
> +#define QAIF_CDC_RDDMA_PERIOD_DET_CLR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x48, (i))
> +#define QAIF_CDC_RDDMA_FORMAT_ERR_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x4C, (i))
> +#define QAIF_CDC_RDDMA_AHB_BYPASS_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x50, (i))
> +#define QAIF_CDC_RDDMA_SHUTDOWN_STAT_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x54, (i))
> +#define QAIF_CDC_RDDMA_PADDING_CFG_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x58, (i))
> +#define QAIF_CDC_RDDMA_INTF_CFG_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0x5C, (i))
> +#define QAIF_CDC_RDDMA_STATUS_REG(v, i)			qaif_codec_rddma_reg_addr(v, 0x60, (i))
> +#define QAIF_CDC_RDDMA_DBG_STATUS_REG(v, i)		qaif_codec_rddma_reg_addr(v, 0xFF0, (i))
> +#define QAIF_CDC_RDDMA_INTF_DBG_STATUS_REG(v, i)	qaif_codec_rddma_reg_addr(v, 0xFF4, (i))
> +
> +/* WRDMA */
> +static inline u32 qaif_wrdma_reg_addr(const struct qaif_variant *v,
> +				      u32 offset, u32 i)
> +{
> +	return v->wrdma_reg_base + offset + v->wrdma_stride * i;
> +}
> +
> +#define QAIF_WRDMA_CTL_REG(v, i)			qaif_wrdma_reg_addr(v, 0x00, (i))
> +#define QAIF_WRDMA_CFG_REG(v, i)			qaif_wrdma_reg_addr(v, 0x04, (i))
> +#define QAIF_WRDMA_BASE_ADDR_REG(v, i)			qaif_wrdma_reg_addr(v, 0x08, (i))
> +#define QAIF_WRDMA_BUFF_LEN_REG(v, i)			qaif_wrdma_reg_addr(v, 0x10, (i))
> +#define QAIF_WRDMA_CURR_ADDR_REG(v, i)			qaif_wrdma_reg_addr(v, 0x14, (i))
> +#define QAIF_WRDMA_PERIOD_LEN_REG(v, i)			qaif_wrdma_reg_addr(v, 0x1C, (i))
> +#define QAIF_WRDMA_PERIOD_CNT_REG(v, i)			qaif_wrdma_reg_addr(v, 0x20, (i))
> +#define QAIF_WRDMA_SHRAM_WORDCNT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x24, (i))
> +#define QAIF_WRDMA_FRAME_STATUS_REG(v, i)		qaif_wrdma_reg_addr(v, 0x28, (i))
> +#define QAIF_WRDMA_FRAME_STATUS_EXTN_REG(v, i)		qaif_wrdma_reg_addr(v, 0x2C, (i))
> +#define QAIF_WRDMA_FRAME_STATUS_CLR_REG(v, i)		qaif_wrdma_reg_addr(v, 0x30, (i))
> +#define QAIF_WRDMA_SET_BUFF_CNT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x34, (i))
> +#define QAIF_WRDMA_SET_PERIOD_CNT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x38, (i))
> +#define QAIF_WRDMA_STC_LSB_REG(v, i)			qaif_wrdma_reg_addr(v, 0x3C, (i))
> +#define QAIF_WRDMA_STC_MSB_REG(v, i)			qaif_wrdma_reg_addr(v, 0x40, (i))
> +#define QAIF_WRDMA_PERIOD_DET_STAT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x44, (i))
> +#define QAIF_WRDMA_PERIOD_DET_CLR_REG(v, i)		qaif_wrdma_reg_addr(v, 0x48, (i))
> +#define QAIF_WRDMA_FORMAT_ERR_REG(v, i)			qaif_wrdma_reg_addr(v, 0x4C, (i))
> +#define QAIF_WRDMA_AHB_BYPASS_REG(v, i)			qaif_wrdma_reg_addr(v, 0x50, (i))
> +#define QAIF_WRDMA_SHUTDOWN_STAT_REG(v, i)		qaif_wrdma_reg_addr(v, 0x54, (i))
> +#define QAIF_WRDMA_DBG_STATUS_REG(v, i)			qaif_wrdma_reg_addr(v, 0xFF0, (i))
> +
> +static inline u32 qaif_codec_wrdma_reg_addr(const struct qaif_variant *v,
> +					    u32 offset, u32 i)
> +{
> +	return v->codec_wrdma_reg_base + offset + v->codec_wrdma_stride * i;
> +}
> +
> +#define QAIF_CDC_WRDMA_CTL_REG(v, i)			qaif_codec_wrdma_reg_addr(v, 0x00, (i))
> +#define QAIF_CDC_WRDMA_CFG_REG(v, i)			qaif_codec_wrdma_reg_addr(v, 0x04, (i))
> +#define QAIF_CDC_WRDMA_BASE_ADDR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x08, (i))
> +#define QAIF_CDC_WRDMA_BUFF_LEN_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x10, (i))
> +#define QAIF_CDC_WRDMA_CURR_ADDR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x14, (i))
> +#define QAIF_CDC_WRDMA_PERIOD_LEN_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x1C, (i))
> +#define QAIF_CDC_WRDMA_PERIOD_CNT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x20, (i))
> +#define QAIF_CDC_WRDMA_SHRAM_WORDCNT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x24, (i))
> +#define QAIF_CDC_WRDMA_FRAME_STAT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x28, (i))
> +#define QAIF_CDC_WRDMA_FRAME_STAT_EXTN_REG(v, i)	qaif_codec_wrdma_reg_addr(v, 0x2C, (i))
> +#define QAIF_CDC_WRDMA_FRAME_STAT_CLR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x30, (i))
> +#define QAIF_CDC_WRDMA_SET_BUFF_CNT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x34, (i))
> +#define QAIF_CDC_WRDMA_SET_PERIOD_CNT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x38, (i))
> +#define QAIF_CDC_WRDMA_STC_LSB_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x3C, (i))
> +#define QAIF_CDC_WRDMA_STC_MSB_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x40, (i))
> +#define QAIF_CDC_WRDMA_PERIOD_DET_STAT_REG(v, i)	qaif_codec_wrdma_reg_addr(v, 0x44, (i))
> +#define QAIF_CDC_WRDMA_PERIOD_DET_CLR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x48, (i))
> +#define QAIF_CDC_WRDMA_FORMAT_ERR_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x4C, (i))
> +#define QAIF_CDC_WRDMA_AHB_BYPASS_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x50, (i))
> +#define QAIF_CDC_WRDMA_SHUTDOWN_STAT_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x54, (i))
> +#define QAIF_CDC_WRDMA_INTF_CFG_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0x58, (i))
> +#define QAIF_CDC_WRDMA_DBG_STATUS_REG(v, i)		qaif_codec_wrdma_reg_addr(v, 0xFF0, (i))
> +#define QAIF_CDC_WRDMA_INTF_DBG_STATUS_REG(v, i)	qaif_codec_wrdma_reg_addr(v, 0xFF4, (i))
> +
> +static inline u32 qaif_rddma_irq_reg_addr(const struct qaif_variant *v,
> +					  enum qaif_irq_type dma_type,
> +					  u32 offset)
> +{
> +	if (dma_type == QAIF_AIF_IRQ)
> +		return v->rddma_irq_reg_base + offset +
> +		       v->rddma_irq_stride * v->ee;
> +	return v->codec_rddma_irq_reg_base + offset +
> +	       v->codec_rddma_irq_stride * v->ee;
> +}
> +
> +/* RDDMA Period Interrupts */
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x00)
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x08)
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_RAW_STAT_REG(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x10)
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x18)
> +#define QAIF_EE_RDDMA_PERIOD_IRQ_FORCE_REG(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x20)
> +/* RDDMA Underflow Interrupts */
> +#define QAIF_EE_RDDMA_UF_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x28)
> +#define QAIF_EE_RDDMA_UF_IRQ_STAT_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x30)
> +#define QAIF_EE_RDDMA_UF_IRQ_RAW_STAT_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x38)
> +#define QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x40)
> +#define QAIF_EE_RDDMA_UF_IRQ_FORCE_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x48)
> +/* RDDMA Error Response Interrupts */
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x50)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x58)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x60)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, i)		qaif_rddma_irq_reg_addr(v, i, 0x68)
> +#define QAIF_EE_RDDMA_ERR_RSP_IRQ_FORCE_REG(v, i)	qaif_rddma_irq_reg_addr(v, i, 0x70)
> +
> +static inline u32 qaif_wrdma_irq_reg_addr(const struct qaif_variant *v,
> +					  enum qaif_irq_type dma_type,
> +					  u32 offset)
> +{
> +	if (dma_type == QAIF_AIF_IRQ)
> +		return v->wrdma_irq_reg_base + offset +
> +		       v->wrdma_irq_stride * v->ee;
> +	return v->codec_wrdma_irq_reg_base + offset +
> +	       v->codec_wrdma_irq_stride * v->ee;
> +}
> +
> +/* WRDMA Period Interrupts */
> +#define QAIF_EE_WRDMA_PERIOD_IRQ_EN_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x00)
> +#define QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x08)
> +#define QAIF_EE_WRDMA_PERIOD_IRQ_RAW_STAT_REG(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x10)
> +#define QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x18)
> +#define QAIF_EE_WRDMA_PERIOD_IRQ_FORCE_REG(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x20)
> +/* WRDMA Overflow Interrupts */
> +#define QAIF_EE_WRDMA_OF_IRQ_EN_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x28)
> +#define QAIF_EE_WRDMA_OF_IRQ_STAT_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x30)
> +#define QAIF_EE_WRDMA_OF_IRQ_RAW_STAT_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x38)
> +#define QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x40)
> +#define QAIF_EE_WRDMA_OF_IRQ_FORCE_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x48)
> +/* WRDMA Error Response Interrupts */
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x50)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x58)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_RAW_STAT(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x60)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, i)		qaif_wrdma_irq_reg_addr(v, i, 0x68)
> +#define QAIF_EE_WRDMA_ERR_RSP_IRQ_FORCE_REG(v, i)	qaif_wrdma_irq_reg_addr(v, i, 0x70)
> +
> +static inline u32 qaif_dmacfg_reg(const struct qaif_variant *v,
> +				  u32 i, int dir, unsigned int dai_id)
> +{
> +	if (qaif_is_cif_port(dai_id))
> +		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +			QAIF_CDC_RDDMA_CFG_REG(v, i) :
> +			QAIF_CDC_WRDMA_CFG_REG(v, i);
> +	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_RDDMA_CFG_REG(v, i) : QAIF_WRDMA_CFG_REG(v, i);
> +}
> +
> +static inline u32 qaif_dmactl_reg(const struct qaif_variant *v,
> +				  u32 i, int dir, unsigned int dai_id)
> +{
> +	if (qaif_is_cif_port(dai_id))
> +		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +			QAIF_CDC_RDDMA_CTL_REG(v, i) :
> +			QAIF_CDC_WRDMA_CTL_REG(v, i);
> +	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_RDDMA_CTL_REG(v, i) : QAIF_WRDMA_CTL_REG(v, i);
> +}
> +
> +static inline u32 qaif_dma_shutdown_stat_reg(const struct qaif_variant *v,
> +					     u32 i, int dir, unsigned int dai_id)
> +{
> +	if (qaif_is_cif_port(dai_id))
> +		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +			QAIF_CDC_RDDMA_SHUTDOWN_STAT_REG(v, i) :
> +			QAIF_CDC_WRDMA_SHUTDOWN_STAT_REG(v, i);
> +	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_RDDMA_SHUTDOWN_STAT_REG(v, i) :
> +		QAIF_WRDMA_SHUTDOWN_STAT_REG(v, i);
> +}
> +
> +static inline u32 qaif_dmabuff_reg(const struct qaif_variant *v,
> +				   u32 i, int dir, unsigned int dai_id)
> +{
> +	if (qaif_is_cif_port(dai_id))
> +		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +			QAIF_CDC_RDDMA_BUFF_LEN_REG(v, i) :
> +			QAIF_CDC_WRDMA_BUFF_LEN_REG(v, i);
> +	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_RDDMA_BUFF_LEN_REG(v, i) : QAIF_WRDMA_BUFF_LEN_REG(v, i);
> +}
> +
> +static inline u32 qaif_dmacurr_reg(const struct qaif_variant *v,
> +				   u32 i, int dir, unsigned int dai_id)
> +{
> +	if (qaif_is_cif_port(dai_id))
> +		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +			QAIF_CDC_RDDMA_CURR_ADDR_REG(v, i) :
> +			QAIF_CDC_WRDMA_CURR_ADDR_REG(v, i);
> +	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_RDDMA_CURR_ADDR_REG(v, i) : QAIF_WRDMA_CURR_ADDR_REG(v, i);
> +}
> +
> +static inline u32 qaif_dmaper_cnt_reg(const struct qaif_variant *v,
> +				      u32 i, int dir, unsigned int dai_id)
> +{
> +	if (qaif_is_cif_port(dai_id))
> +		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +			QAIF_CDC_RDDMA_PERIOD_CNT_REG(v, i) :
> +			QAIF_CDC_WRDMA_PERIOD_CNT_REG(v, i);
> +	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_RDDMA_PERIOD_CNT_REG(v, i) : QAIF_WRDMA_PERIOD_CNT_REG(v, i);
> +}
> +
> +static inline u32 qaif_dmaper_len_reg(const struct qaif_variant *v,
> +				      u32 i, int dir, unsigned int dai_id)
> +{
> +	if (qaif_is_cif_port(dai_id))
> +		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +			QAIF_CDC_RDDMA_PERIOD_LEN_REG(v, i) :
> +			QAIF_CDC_WRDMA_PERIOD_LEN_REG(v, i);
> +	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_RDDMA_PERIOD_LEN_REG(v, i) : QAIF_WRDMA_PERIOD_LEN_REG(v, i);
> +}
> +
> +static inline u32 qaif_dmabase_reg(const struct qaif_variant *v,
> +				   u32 i, int dir, unsigned int dai_id)
> +{
> +	if (qaif_is_cif_port(dai_id))
> +		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +			QAIF_CDC_RDDMA_BASE_ADDR_REG(v, i) :
> +			QAIF_CDC_WRDMA_BASE_ADDR_REG(v, i);
> +	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_RDDMA_BASE_ADDR_REG(v, i) : QAIF_WRDMA_BASE_ADDR_REG(v, i);
> +}
> +
> +static inline u32 qaif_sid_map_reg(int dir, unsigned int dai_id)
> +{
> +	if (qaif_is_cif_port(dai_id))
> +		return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +			QAIF_CDC_RDDMA_SID_MAP_REG :
> +			QAIF_CDC_WRDMA_SID_MAP_REG;
> +	return dir == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_RDDMA_SID_MAP_REG : QAIF_WRDMA_SID_MAP_REG;
> +}
> +
> +#endif /* SND_SOC_QCOM_QAIF_REG_H */
> 


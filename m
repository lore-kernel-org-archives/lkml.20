Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4009411672
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961430; cv=none; b=Uls/NI/3xVvuV92SZt+2EcL6yO9t8548xfA3YsDRk4P2B7iinVVmx5gkin2aLTCbjP5KXdUw/A0B0iLwTlvEISJBnlecDYxL8YAudUwdAsXagc0yVEkNdKSdZYMRA/gMXLFvZjF8VshUneAmrquAsIDBtCbMI5552lv2op5Na/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961430; c=relaxed/simple;
	bh=/NuZDkGd86y+d103gonsMseKFcZa1SavA5FjYygRlfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aoqSN92bFYBcI+HA3xHM161EbtWeKyKyom1HpmHsZjjbQGZX22WZxu2zoOkHe9YOkLRv6sM0aHaiE1ziOvOeWCeQRPPyuIjHNad5qgD3aA4t2mxncUMB7ZasD6IBHpaSE1+JIcS9CSjFArfu45xz0d8pp/mm8H//43qKoh2f4p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUTqlyNS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCT7A2Gv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUTqlyNS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCT7A2Gv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6d84s2087981
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7k9ZPWW8NeBINyklM9ZEKMlvNYIGHoEIitVI5aQpk5M=; b=NUTqlyNScC8gfof5
	xeGEf6EDYCYUQwg7f1kojyg8OsjPchtqanw7uKTzYpUPvRChBKuqPk7toWwjktGi
	LzC0uf5HjSIT9lsYKPV+oPCdtCYlAspnkGcBDuPZfKPKEy6ctmKTpujkDID64qge
	TfUsbB6MVRpM2p+xvYN75ZPOYjW10HfRn3bFj8fRGEUcqMfi/cLMb84/TVtHU7jV
	MNg9NUVwnKHkO8+ZqTndtYIgqy6G4nUcStSt7GRb5e1JrRvu6BefYRS5vMDvyF7a
	an62cssCuQAt0D5zKgdDurabbDYgUTxWxYt3Et59D0TbzEhtVNmoR2Vf27H2e/Z7
	1FlMpQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49hgen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:03:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70fa4so3479707a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961423; x=1792566223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7k9ZPWW8NeBINyklM9ZEKMlvNYIGHoEIitVI5aQpk5M=;
        b=YCT7A2GvSs0Trc3LNtzHQOE7HO+44fb8MvXHRfuu+N6PCslQXHxXbgTmL7TTacKygp
         LUIPFTgunlbsRc+UIXr4/G2gvmY10Hxyam0i1R/63TuzAYGGMtwJ0+zlyUJ/mQrOGp0i
         +njsBRKDPtb/g2kIIq5eo50yejWhZlZ0OYbsGsCmZTobayC/+GNeNr+LxPiVRHlnxhY6
         /juKHVONqfs8Xo92b9HfhaIUKk8ytD2Ki/KnWRx33RQc7Fd+oDhiXK5XD21To1MZ8AbQ
         8dE3O+XQmKi+746fZkL8trF5g0lu/Fjr5LCLbi6GlTsoODq8pb4krYmdAvRWI6f4CipL
         s5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961423; x=1792566223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7k9ZPWW8NeBINyklM9ZEKMlvNYIGHoEIitVI5aQpk5M=;
        b=bjru0+kX3chy/mX6afsmM7DUhJdxAOpmz7CxTDAuVCUuSQDbj5cxBdSrSuDs4zNApX
         Hp7UL4OUIj0xlEtUeGXUOgA6a9xHDWoG8o3ZBFBVrQ+lumHNCLm0X/KbZF9hyGI2rrGR
         ful4KP6elGd7gzcoMO/fFEudiBMfVq+l6QSwngH3b+8xia4MLD+l6PhkTgbpf8sRD2L3
         ALGTSFkFKU5v1thOq6C2amN0HAmE3O6ZR1+bJxURq/jL4Bo76AISP47YjpJ0heRrWc27
         ADj3/Za0w4QWk2Q3xpvhj0f8LPmoDG92Wjvb77JmMfpt8I8Jkns5uhzPbLerGVlqcc1J
         9fIQ==
X-Forwarded-Encrypted: i=1; AKwUvBygAtjqpoWNlDBUTfnTsx61B6fIjteuFBcKPYrwNHEkuk8E+63chHEqdFYvgETmvEoG/wxYn6gIJyTy7yo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaRDRyhiZ2a6B3TAdQ0beKRxzDdepxuccQUTyexKnqY3sSr8Ev
	RZBh6swhoziUHQ2o8ILVGRcCb+xDBN2jQsIGJE9gNIzfXb5WTXSEJrVdpxSPzlFO7Y2tJZEVeom
	oUTayqDkpqu+27Ok3lRXVEbegt9Z/jRKCQ+uhfm8k8tia0S/I8L8dNqiV4D4A/SUpdUw=
X-Gm-Gg: AYBFou3jM0p5ilVvHXlIXrt3tWz1Ny71fJWOh+fDDnNqbbO9SuiXaO6iCIBBclgOeXC
	P7VVVTi54IDx78Q3dgrvrDgFF7E3V3/oiSzj7cm+Fqf7oDxe0KMVQsthvygECzmJMXeYzHJ8Go6
	Ue1b68+HyR34MZccyIexyOuyp3Vk8sRqLNd52T2YSSqwVaxCadVDa0NdAEPZ9Y2weAbpQSYcdaT
	vC+HZJiUb+2oU6l6RPi3Ij9tJw6Y4OwRYrdFn02jfU+QR11oYTJlm3rxfOjjxIGYmLrQpjWDP/z
	mxfO6RsLZXyTq/sLmRTPLAxgJ+4kX0He4eeHbaIzTc65G856dl6ousyP2fHxUZ04O1E/27KeOf6
	JaaVCbxozdaBQm9+3ZF+OaogUoFw=
X-Received: by 2002:a05:6a21:6813:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3e1bb354babmr4848919637.72.1791961422750;
        Wed, 14 Oct 2026 00:03:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6813:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3e1bb354babmr4848898637.72.1791961422142;
        Wed, 14 Oct 2026 00:03:42 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511db9sm703437b3a.56.2026.10.14.00.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:03:41 -0700 (PDT)
Message-ID: <16cb87f9-dc2b-4074-bc0e-f689cdc1920a@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:33:34 +0530
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
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf294f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vlhGFdm_2d5XL7VaKv0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX7FZqeAkpLpbL
 DUl8kgtvbK01smDtESI+8cBPeTmePHOYY3Iyhq8FA+oIgtU682ZH7rSCx4xAmqTtN/pf4g3dXgw
 JLwMak8c2kRVJph3fnVDIz80Xxod0JQVY8Izw1MtsjWlESGCm00kvWZLLjSzDNKs82mS56pJGLM
 B6FxLIJ0dTOSj5Wh4G+SMVzVIca3Xfj0tXVGwZjvl7ukbu/umOX9Y5U8CjNT8PIpImKxtMeDT5B
 QE29ERE/nFjC3/KzR6eymDmz4hwSpsLNdCoY0XoGsZ6s7uPkgRb7+HRYzEyzJN6VNDsIDlqmI1t
 VcpwkeniUbuYz1wR4gnoexb+6PKKTOhXbxaQ1FlW8H3V7BWaq7vImPlsigWXuPc/6uMYFFgT6yk
 dB7evLsqMY0TugUfp63ewDVHLUbvB3cFFNKMa36S//yZoYV0neFs2Xpbrz8FQFV8q0s0gUydlzg
 Jn5G049gP9xZ3/Sesgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX7Zh6omif0aHY
 wi0fhLVGaX1mUQNJ0m4MGQ2EzxBtArjQPWduCfskq486JvSVnH6frxJkCEVDLfHswOGukX5pQjw
 8ChrDDmJrBTK6sQA/vKYE1U6/WcHRUc=
X-Proofpoint-GUID: DFJBEzEZZ2MBle-PcX4BTFmK7cVr-DC9
X-Proofpoint-ORIG-GUID: DFJBEzEZZ2MBle-PcX4BTFmK7cVr-DC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140027



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


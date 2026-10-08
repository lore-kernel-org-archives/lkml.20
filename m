Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB944A3E7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458715; cv=none; b=hdD8f9ot6qPejJzSyTdvvg837j/NMf2fHH28XklL/QbfD9w5uKu53EDljlQhmHDsuAaLS4QT4XG6DeF5MY10zjc74D/Im7RAeOtrsNoEnBsM7SkK12ifR8Dbxq5S7+96sCjXnR2KnJsihxtB+4YlPJeRYXAvPYoMKVlS0209HOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458715; c=relaxed/simple;
	bh=Zr5BTcRExanOPN3GVz/jGdowr9uQSut9/R3g4sDr2rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWFkez2D/x78GZknh4zfRd3DXB2wIo9BuUZar9rV2wuz5kLjYc/EP+XsOnfmDW61yktei3f7t2VAgr9cfOho6oKhI9C4kJnjMRn0BlaTsVGsQ6r073XFNnMKTYdPFSahp3h5tGovf2UKcvIqpnHtUR8svV63olw6QWyeGUhw/xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ho0W5dCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccgU3+Ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ho0W5dCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccgU3+Ef"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8oY1882247
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=; b=ho0W5dCDqEepLeXb
	c3X6IpEzpIJuV7O9b4xR+BXQqk3t8784QEqC9pdFly9oxMZECu3kXEi5pLPm3TRH
	EvPmktk/Z6S+yoAxVcPLjsDySWgmvMB5H8ZmGNNc3h3sk1CkWxzCQ2i1pGU0CpV0
	aQ0r19woq/eVoWZW0arhYWDFK+cTaJa+l8wmP4BxqRIXLa7Qkmyw3xt2yIVHq5d+
	usqh2NhRlCCMbLucL8WaTjC33qXNtuxqzrUPtYxDkhmlwwlt71GC5EiAi0c4sqmv
	3sCAE/9yocRYyY0afMZ9e3hFLwZnACvtF1cTFAwXBQWE1uOv6MS71kMUEEXBNFNr
	yDbs0A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tngf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:25:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e564adf782so47696335ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458713; x=1792063513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=;
        b=ccgU3+EfeHzqP+Gj/WTzgxLZkJnk2IofYD+HI2jumw1pp8ZiHGrVvGH0SnTSuVq6sL
         j3kHenORuqteKtw7VLOUIkqLSopW6uXOvca7gbVe05FUTHcPIMJCs7MW8V6YzcIyXXYm
         gl1p7jMySdK0Jk2t5z+GJhNf+MlBVDhpAVyY3Jq0ysperp2KRAvqehqN7KivH8g/kSxW
         DDgqj/elRnTpP9HSd/2m7G177sXNZSp4Rl3sbJzFMPli38xbIXmhVkF7FrDovGo/tAr/
         BY8BusG2kzQQLcxgpcKk4dON7FACH5Nqp9F6/Yapie0L84v8HkkL3hG8i9+XvzeB5Zhc
         dNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458713; x=1792063513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=;
        b=BVT7XFRn+zXsu188R6TgxPfiTtnXfYLyqdpvLLHlcsDhaOPEdEsZ2j4w4DSfbOhCbh
         G9LX7sxHj4HXzhzHsBDfTKmxl+2U8iWuRSGE0s4po2+taONM8GAl8Pn+wUDFke3zmwrG
         EU/eYNuWE9NRFGdX6TAehPteUp9e49MGGclaYg+2LYTCzGUL4kJZSAdYA8lMfUJu1px1
         ODt0hwF0ZszoPjbxlc3XHevO/PLmKuLKhbZ+G6HC2+p3OyIAAxNDsm+W1P5y5iVZlSxR
         SYOLpilxExFaGqAjyrP2BqizKH+GMue9XGIFkUYmvbSRq77XsmieXTbjUQq0YV9v8QGD
         h0mg==
X-Forwarded-Encrypted: i=1; AKwUvBxtbjstBZAWBwpb8FvZ1BwUkHNo6J4uZBqM3PDE51bHqcI4WNsQu52FRjWPOZvzHuEgj2blT5zAK1/rqFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu2X5X+K1QxtdPUnHMvEpTeyn9vaXyM64QJqkU/aUB27NXJJko
	Z+VdaYqo4jgFmWDVAP/FGijSoDA1oJzz01WjL/DdT2e6d8/NFuHSZXdcBvUFaEe/3jPBFkP9anV
	KwHPfDih7n3Wue+n+AczZkRELMv8ect5PNbhVYiw5YkamS1iTxUjuTjn6jiJZ8wWAqnY=
X-Gm-Gg: AYBFou1nquInA9dmRmqFHNqUdXEjh3L1a+qeQIJg4ajaoz1//MFhBfbkktP+2rb6PYR
	esOy2Joll4y1Fe/WgJH7fECXMMir89gXa7pRI3lsXaZuvogUfe6FKcRr08S7elaJQ/bsnDfzmG6
	wKyM2jUvpE2EsDjn+tS6zyvYBLPEUoVYVPcsxDp6G/fphRQ2VL3ppexL6o8+Efz8Nk9VfX82pfQ
	hgHoDOdsXXqMHle30aAviFOh3gYuNuNaEtMHTPgAy6Oy0b43/xC15Y+yvojvEPyTqvOVLfgcKWt
	cmqmDLutUeAZro6VxNLVuTz/Ji/IrZTZwDfMifeM8VRBXguqmczKc6iUl0xZdhgeacsmrLEPEmg
	meZpJFyqpupsRZho/XNDaMFvFwCw=
X-Received: by 2002:a17:903:2acb:b0:2e5:36a9:400e with SMTP id d9443c01a7336-2e600500cd9mr40858575ad.39.1791458712938;
        Thu, 08 Oct 2026 04:25:12 -0700 (PDT)
X-Received: by 2002:a17:903:2acb:b0:2e5:36a9:400e with SMTP id d9443c01a7336-2e600500cd9mr40857685ad.39.1791458711093;
        Thu, 08 Oct 2026 04:25:11 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6047201e6sm22775505ad.37.2026.10.08.04.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:25:10 -0700 (PDT)
Message-ID: <10fe8480-21ec-4e44-ab21-d88bf2ef03e0@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:55:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] ASoC: mediatek: mt8195: Fix register access
 clock error handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX0b6MAyDV652W
 oIEO50w40rcJnlDiE4UbfaT6MRUAh/xZhpzPIQiNH3Zeklk2uSLjNTILBdWPncNTa9sRGasaDDk
 C7An7SdV7Px3O+nzmyBBqS80zCaQL3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX0qetLtmy+ITJ
 wUGrvUuFJ7rFFsdC9FpEIcV+NaIvQsN2nDA4NE+xutHd3Cnco6OKi0deIdlR/YSGAz2T3M0iEzm
 hESEwNzr3MCyXJm2kOrWHz/tvhY4Q611VVyvKp9aUQOcPrntIb91EBG4h7zvbAa4TmJab6pTBL6
 iUOUiXBm9Ov3L88e/3TOpbcYnzkrWLPtMdIvPKjyWnblLNI2fwnlM+bCQY8Q2OrlyrJa/snLwRU
 mM863dYVS/aihXDlIucxIg5vArmsKeB7yKPhBTWpSxx6wCoH9P07xfEnntqd3CR/Vk8IieYKzTA
 ZWHeb/wJaqPwKCm1pDOEVTVt3EkanCk7SCOpp+XuJgo3otwOZ+3RfV7z5Hz8m9+a5pYomH1kY/M
 Ebl6aghJkJHxfahTxmVTaH9Xr8Wz4Stz0v1iuFdcJqf+vFRYDrxQNduB3MWuDgPcb8v+Uq6q79u
 TBKO08uBKu6PMa37Vgg==
X-Proofpoint-ORIG-GUID: BLlBPQVDXigyRRTgTpQVKSKC3lfse3Hb
X-Proofpoint-GUID: BLlBPQVDXigyRRTgTpQVKSKC3lfse3Hb
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac77d99 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rZdDH30vr1OGgawLJCYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Check the return value of mt8195_afe_enable_clk() when enabling the
> register access clocks.
> 
> If enabling a clock fails, disable the clocks that were already
> enabled and propagate the error to the caller
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index 12d8159338be..34c828fdea29 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
>   int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
>   {
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> -	int i;
> +	int i, ret;
>   	static const unsigned int clk_array[] = {
>   		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
>   		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
> @@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
>   		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
>   	};
>   
> -	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
> +	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
> +		if (ret)
> +			goto err_disable_clk;
> +	}
>   
>   	return 0;
> +
> +err_disable_clk:
> +	while (--i >= 0)
> +		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
> +
> +	return ret;
>   }
>   
>   int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)


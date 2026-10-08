Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3364349BE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458605; cv=none; b=bk0B8tdpJAUXrIFj8rMOmItpV01JRNO2PxDMybbd5Kd6tmGZ0WLDnP3ciekq+QSdUvOY4siUegORdiWOD+wst5eQj/AaV0yp0J+ap21aIAmiu633dMcVBehPyyGK7ImHGdxm4tvFN6p1lzMkUYdSEYPp/2SVXiB/FQtPrUvkGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458605; c=relaxed/simple;
	bh=1MXFfWSFch0oZCCDVrQKuSZj39a0kkAvGe/j7kt4CJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asPQm+4Rk6xxylYtHaB1owwzdXsymtV65rqB/TCJOosMxL4zhVNJxgkyuhrNrnWGk58fblUzp39vjdSjQqyReKj6TiTU3us9lbCXgDhknh9EuR4PxqFogqzZlsXGNn2xDvHtuNM8n2xFa1ZVqOe0qjlKqdkKt9AvPaOHZ8IHesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjHjNCFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+J8whKb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjHjNCFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+J8whKb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8LX2384044
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=; b=VjHjNCFEpz2ijCdu
	HWpKMMEfNmoXuKfLgB4mFb2PXcZ/QkvsW4sWU9+AGlaa+DTwOOyDpkh0fXiqgMTx
	MVdLeT+VzcqhvZTrOzAaAOeEmyefHZ/B4TM2bQybvFKYsl/FBIg58Pq6dwmxAbaY
	kg5VJfzLTwmANbbiHSSAVccKp3mrC/JdKyIVcEDgVWxs9oT/ABj98+96atHb/mM4
	valAhFMJvqcXcyeEQR1CYipzUyWtESOQ/skMNnXV158o6BTJj0oMb2DotzLi2+es
	DJCNIc/6Bzz7is4ckqFaqDJKYr+brUJyAYzA4mjXdImRrNjtMArkmtXFvRbUA4zo
	xdprLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jr7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:23:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so8386a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458602; x=1792063402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=;
        b=C+J8whKbgamBz37cD1jX6RZGOwfA2BepJnSc4QoQLlL/S95ig3hMoybfOPoyvHsLId
         0Q8R8zUKjrO9rNBlYS/glWR6p7DQxV7naxhmHDO5CpneugENyoLv6xBEgEg/Yub3jARq
         KaJUZY4F3ucbNwXasIlEIkExR6OhMsYEFBswLWEShmuj4ZQrJNgfXbQHMYeUcoRnm7++
         qd41aWfTBaVFGjecFBYROaGIyHsOXxiFpx+rTGLUVBqcSJObiJEb5GhqA0YnGw7o/Mxi
         dUIMEiqyUxluB33TppGTYMbCtRjx3Nyef9BRSgy6fblm5yv4r1e2TGPkpJYKE/lZM1OK
         KI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458602; x=1792063402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFp4V6SKAU1XN9gI7+cVTXpRsxuFNLjU7XndKESAotU=;
        b=A0XlU1O9e0TORrjxvKydp0Voqo/qYiSXZNz3oSrleD4CiKmmBXwyrnulyqaKqnVC+E
         z8zBLZjKkHXau6xBEC4UEOm3HVQKmyZR4oHz+88CwFntb8XdSb231GX2zsGDJYRRkJ/C
         /98MA5SMUwf1jGFYR/fASxA9Jpouao+Bg5wA1hL52keuIM5oRTd7vtcsDkWEopLwSI+P
         XQsvQe5Fmux9hlTHFLOLNqovHPAsAW47jl4BkxAjCh91t7BCFXPghHId07flr7RXJMcN
         auMVDsfmhmOWl76KcC0DsjlLvxluLJbEBYpBnyHNe8TUYor9A/ya+dV/7fnSsBPhF0cT
         bbig==
X-Forwarded-Encrypted: i=1; AKwUvBwsoOkqTbqAfy4LXy+2jWbbyPitH0bycXkMFwxHv78dzC7KhboNi3RSMFvk626oEpIDZywb3tLE8Imqt+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMiA2Rs2/zn1hMWjLB9FO81kkEfp9wvlDHzTUannBrChGeDBdo
	DlklyCQLX1X9Pjya8P0bbLdm66ULp8m0hy3e1f938dRvE9hQTglPSIoyPFNIxrwcRWSJxyMGWBc
	HFiY5i8fhYvlZQK3EXK+8vUgU9+O1ttaIEfyUith0aUm1TTjOy4fzzzPUuyB6ILJ5kcw=
X-Gm-Gg: AYBFou14WDt+mtAh6Bu91nhqXxK2OToUso5FUnGHUWKZjSPw0IQA9zCxStGHcUwSsa+
	aZ/BXY6P5obIPCeB7OyWLD9Pgv4igyi6gRWZdYYYvIhUzwmXyhju7OIYKuH540SBxVnwCoi9xcS
	P57N/TRZ2nohCJbDCOvNO0dwjmVzJpqUAp/OKrzkK+eZahEoJX1ejkBTszLLx5qH9Bnqu9JqGsO
	T5TdiL1iLPg4XepT4Qc1j2lDLnECT+vSGdwl82L06S+C05yrCZAGdO3nlM5qEE9ONtvffYb1nJL
	dYkJsL6iJTOJU0Cu1c5+tvA6vkNEycwqop8kIbz3QCSmAE1WBIWOAHbC3TTu7kkghpm97XoOFwf
	3djdmKaIac1WFXoHEcv39IoXZ4eY=
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1191037a91.19.1791458601606;
        Thu, 08 Oct 2026 04:23:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1191015a91.19.1791458600997;
        Thu, 08 Oct 2026 04:23:20 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbc4f08sm4001995a91.13.2026.10.08.04.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:23:20 -0700 (PDT)
Message-ID: <07d6b3ba-3d1a-4300-b8f1-66253885311c@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:53:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in
 mt8195_afe_init_clock()
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
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX75ta0PhmciYw
 QQIbWcqrjyoD+pjM6aUEhp4qRd3XCqpvbIH6gshvBrUxidfdeUHpDDEXD7A7FYsSOQODMA8J0Mi
 8kd47GSg8wVFWa+vssjTny88dcQheIc=
X-Proofpoint-ORIG-GUID: wmO4Fjfv39cr2wfXk11Q6b_V8rBHwXcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX4JvRo4DYVK31
 uUOy6DJPQeeuAnbVyWEah2eYSHT97kGdb5D3D8bMvn+zNFNdVjhO5GvUan3MZE1m9M9JKyw3u9P
 ym+rpYVHUxcgN5aFb9btWgR7QJmwI48dmYkWFr97CDDypcrEhEXMdhO7JFhJ5/R9aBqODgt03L/
 h7SkFjlGBLu/zUk09oiiAIN+9gfIskfDo/5olk7lx0t/jzkvffZFEwRxdoHOCl4TsaNWOd6e44+
 w2Rztvd+2t0qBgtAyLrRftgPWJXxQS7buWaQOdJhlmBybHJeBCE+G1P1n0FIhcANG8Oti4Ob+4R
 vgOFQZtpL4+ULEUY8W/0onYhVYrOo0OWfwx8Dq69olgxJba0S56tzMBPgmYUslvqUzER1Y+C0s0
 b24q7ESYtQjwaVYGRkZXNh2ctBk7FiwgLF3OlR4XwyoDRKbuGPQqUekCV/61gMJQI7W7+HVQILY
 hsF2X8d6NClRLP3st5w==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac77d2a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=U5QAfnhbshI7i7es_x4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: wmO4Fjfv39cr2wfXk11Q6b_V8rBHwXcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Use dev_err_probe() when obtaining clocks to avoid redundant error
> messages, particularly for probe deferral.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index ec1ea5b988ff..12d8159338be 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
>   
>   	for (i = 0; i < MT8195_CLK_NUM; i++) {
>   		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
> -		if (IS_ERR(afe_priv->clk[i])) {
> -			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
> -				__func__, aud_clks[i],
> -				PTR_ERR(afe_priv->clk[i]));
> -			return PTR_ERR(afe_priv->clk[i]);
> -		}
> +		if (IS_ERR(afe_priv->clk[i]))
> +			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
> +					     "failed to get clock %s\n", aud_clks[i]);
>   	}
>   
>   	/* initial tuner */


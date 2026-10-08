Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E318492E2D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460464; cv=none; b=gqDUE7SwMzFdJSlZGeeHL4Aw0+FtYed1izLYgn5jPewKxwNb2FAo1IjLz7q4etk4qlxC+LZNalatUlxkg8Y6M/knafeTCKnoCndCbEz7IZj3F3kUgOsXDMwMXWEhbpNBD5AcpHwtsF4Ej9OUof8aDlWKdIxqoJhM0Mkew9PSSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460464; c=relaxed/simple;
	bh=XAVpPo1CH4bbOF9tj0xvsAmXNBJRPmyTDB5b7QayVSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fq2q0NCCu3LCBSoAd2+2/sWRg+fu5MmHv0HhYeQTRtAqMjW9GgQTwvtIOGMEYH80dOjoe29pRix2R39gf3v2vTYzFvM4Sb5l9SH/kmc8qgwElm/LUgWhKgcpp+fAJHn5GxjeMDdRtRTY7fxLGtxg0Zb/QMw/kqLwwBY7yrmmpOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8e8+fBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INx3Euvh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8e8+fBh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INx3Euvh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK4n33099305
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=; b=N8e8+fBh6SfK0Lv6
	KsPvsmj8Xl7TCdUDRDqXu2u2MTAXKhOxa2LPWdFyHxBzwaX4yMhfyvR8ksxw8Duz
	nIBo67XHK+sVvNOWx+UlxwBvKAyrcCvAZpFxypcXJTAIs52M7xlbIrjKuGtZbKVe
	qLWroJ6R0qnMMD7KZzzs/7gkuubtD0rmavcnO0sBgxTbLTvJQpewigkxHYjJ8sLD
	eHddYT028+wK0/4gn7gu0iOTDGLwyECTUk5JQ4r8/zU61igmtNaEceQhTYqNT6dI
	WGXsw8Cvf+bGFrgrStJrq1EGYNrYyr7GYwl7uZyTfjSZMz0n2TlyOw9EQk+qGxbn
	soHCmA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82pet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:54:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so1289844a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460460; x=1792065260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=;
        b=INx3EuvhSWjHVkhDVLpOKjR73ORj7WxEQRchS8pXfXRQ/Q3ZSETRjH0WktB6DjLykZ
         kmg+jq3Ul0uM2GpM/k7yVFUdqUCHz7qCul7WtmEsrbVDFCHY7pO8fZo9e5WId1glhegT
         kxWAj90NbswNMqyMlYKhEI1DWdG+YUJp5W0BWYP/WZ90oIRupInrQVY2D1pf+7y5uZr0
         FyKBvaPX8A9gmNLd9V5hwQDeUbRA7Z2PbFGeR0WRf0lSToeyq5NuKdub4D/FX3qICa6J
         qQUKgCzBfVb+rcwHuqssJ2ywf1L/HlK6BJoiM0FHXaqqkD9RH7cUQu20spA+TrXO5m30
         409w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460460; x=1792065260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=;
        b=QXZMFZ8bBAH165WeI8tc8EapNUfTRNwr5wWqutqNYShyqAHX0gsrBPB3JJE5eScshk
         1OCfUW2qyHBb5L+7CQaKoXzU01Xm8xM/2CTEdv9m86yD/nW2AI0FN1oZih2sElVR0bhC
         CyLDvnFeEPh5JLeXQHan3t8kujXi6FLArK5I7cLM6fr8Gqtg04NXHJcCf8gMW/pHkUxo
         EmyUsIGSsA8u/ISvD3zhioWfU3dq7Xna4ZPrKpWPB/j1vJQ6LJbrK3HC1RrBkWUBIRPJ
         tj3v51lGIC8S+mqJShQkyWjmUUvJb2OciAFs7XNZWfLQYG3mWnynx0GNL8QV95qJ4EH9
         Hydw==
X-Forwarded-Encrypted: i=1; AKwUvByflEzTnG254Lb8ZIodoqH7KbO7kTuxjvJO7ywgKIqSXXk/O+V9RjQhL7odr06o0MM8gUxTSbLMC/p7b7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYII7eFW5Xrcq4hUhoYfbkDFG1dF33YJbXh986tPJM/oDylhfhXA
	rCxUq+tRJns8ISLeuuTfX8X3/ALwsweTfZeXTCLCY6cQCorbQYgGgdyTubKfN17ahqKTMQ7HuAl
	L7Ds6GA8VhaHZokGj2gY2KdIv24C8WZ7o9TbaCfM/jhvxahuv+mznXBHttP8qCLHyxtc=
X-Gm-Gg: AYBFou0bqroxF5qkwgaQs/Zpi/rK7xNaBVp5LpfwpDgntFA2GUm//ksZfPAJsOA2wuh
	JkBF7X/N478L854K+uNUTjxm+/gLP+ctunRKNl3y1LSPbqLMUwOQYqLPSEYbA5H2qviR4uHYRcw
	XWswXaYNos8dL3y6/MdREtpBEHXhNDTZ1sBMDhcNLIGiNCiYrhH97mXvbANRGozHbWdBmSHzKgK
	OuhEPT3mHZzSHE/zEDKwQz4KHVVJHSc8GejSLvydYY5sXLrx7ppgU+7x+JOxdEZVvBLnEJFyKjn
	NUC9fNBLPVVBP/JJZttFRq2B6HgJrFF/h3Zc0Yz6Bzzc81ao8ocusHOJZqmNltD9IlTMlQxLhpo
	1mntccDg73/+GuZoARrqdJNL6MjA=
X-Received: by 2002:a17:90b:4b83:b0:3a8:272a:a328 with SMTP id 98e67ed59e1d1-3a89f649778mr4613687a91.9.1791460460083;
        Thu, 08 Oct 2026 04:54:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:3a8:272a:a328 with SMTP id 98e67ed59e1d1-3a89f649778mr4613671a91.9.1791460459686;
        Thu, 08 Oct 2026 04:54:19 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff5aeef0sm4180880a91.14.2026.10.08.04.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:54:19 -0700 (PDT)
Message-ID: <3ff784e0-142b-4234-8597-4b12b91dde82@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:24:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error
 handling
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
 <20261005110257.50145-11-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX5SBz016UobwQ
 XyYB6uUQmf8JSKMDeX2iVN8jSjekDPFXHg96lMoHs+0q1bksL4FoWgCa5rVzFBuoa7Q2fyOI8QK
 z44PyH+y6SmXOxtKlGQQ6wYxjZiSFSgI2jBc9w+z++ArJeFK3I7OA3AocE5Poxlp/49rukFqpKH
 m2j+6fNiFv4CJF9Da8Q1sVxj2cKCRy+2yvxZYnkAKM4hdfa756VWHpJeBUxHvgbf8HFbpkZcH+K
 34+hBu0NNBElbgSGSlGgjesAKGK2N2/a6naBUZC7YOsOo0J1QPM/NFp52AcVy5bsPYJhyL3cTsk
 p8ApUWGak9HXb9R7ElALmX7pSLsJIPdT1WRnkaFKVsJkDpdcxCCp+x7lrR+pxFv4S0Xc2ZSGBgv
 jk1ed815y7ugxCetIcb85/sbRxwRrBwEONRrsPxAjGrXDJ2PAiNoo1jIxFTbSmXR96fs8qlbo/w
 P3+YlDh3PHNEh3aVG+Q==
X-Proofpoint-GUID: 05kQlWfQPhV8x09UK58pNStcs0uKbnu3
X-Proofpoint-ORIG-GUID: 05kQlWfQPhV8x09UK58pNStcs0uKbnu3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfXz5aX5yLTPM7/
 LepU7+VZ7WLdMWZt3W3QgCCNI2C12EG3AnDFYIRjGKeq5NaSRgNS77GovYHR/D5+slNU2bwgarW
 ByhAQyGPFd1pP+u9tMsVWmxHT2idDww=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7846d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fkDIAU-C-wBUwbiI5OYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Propagate errors from mt8195_afe_enable_clk() when enabling the
> ETDM MCLK instead of always returning success.
> 
> This allows callers to properly handle failures when enabling the
> MCLK.
> 
> Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> index 1a20adb2cbf5..fba51c552eec 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> @@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
>   	if (clkdiv_id < 0)
>   		return -EINVAL;
>   
> -	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
> -
> -	return 0;
> +	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
>   }
>   
>   static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)


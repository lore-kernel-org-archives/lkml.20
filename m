Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8346C842
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460561; cv=none; b=ku/RmC7/mQMEw7ptfXQTZ8Lo/pMq1HZjZlub5bz3aCRbYqGqHoUTAY9bpsB1u4xAC+Hhb+dWoVsW9E03BLG/I9mA9RLGf2nW2s6P535KJnkXMlZuv1FvXuo6yHdplxvTPxm7uEluyzGOiBJPyyBC7PD7hr/9s1l8lVWXLMo9Okc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460561; c=relaxed/simple;
	bh=q9TfCN+IXqW4zgB/T08Oc6m0Lk44S9bVPXzKk4qZCp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1TQMs3+IiH/cofq6LpBMZ2DfG+5dKk/umaQv8wgC3jqZGKjPtuOZJ8M+P728qeRUib0YI4xM44kNLcXQo3tXsdUZX1tSqikVQvYWlHtD5N/mx9IsCiz2GxQc1N5NXrXc1kBU0ixAyQLaCxOlX1Y8XPMPWJOTTZgpCewWlQS/ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/eOWCrP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtooGcJQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/eOWCrP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtooGcJQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BJwmA3846907
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=; b=H/eOWCrPhPA2EjlM
	sTpcc099xLSGzL26cEaA8v7aYEBtZwWIBBUSm3KJNeJK5sDIMS95E54FV76NB9+S
	Jkj8ZiQnjShOhOBAJEQU9eJcCzRL/bevrK2RJgRfX4utVkjD36VCr1tv5HIuZgmA
	4wGvGfAImO2jXXtHU3mA8h0rHZaoRAo64uTCC2UovW/6fY02fiJtmS05iHz5i/w7
	qjkC5tVZJN51WCsdWpwWy5ReaEnOj7xeQarRyK/npxeO7U+13H5x+U3CsRz/UToy
	fKjvntqJQvgCfNh7OnF+S1tKYRwBBxu/vTf6rqa7QeCItQ4SAi6CJtp2nfPk6vNU
	bYhohw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sgaaw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:55:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9057fab9eso63440225ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460559; x=1792065359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=;
        b=KtooGcJQufDaVSnVnM5e2GZGC7r/Vz/t7qAxLA+c5CpVvJqJnpC5EIvvy9tH0tNjYf
         YnGw0h92ElrCFw4wNYiS6+Od+liGU5ErFJ8Ht82anmAClytGbNrysN9j4yFECfKYDk+a
         PbzqIrNrqJCIm+xSVC6B+Z9rnJ0zjgD6vwaoBdL1LtpfSQtmh3N7WBKEHJiLPG6wJALY
         fcWomMCsO75ncoLFlt6k2tr3JSsfIy8eKdWTkj0oJRk1kh6AlN8xBmXHCvgLKwABtgoF
         AzfJJ0AachPfxAfrOBOW9GSViVGllaaYrbJfmou8PE9k5qWeoPajCLEI6Eub0A3sJVWp
         btqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460559; x=1792065359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=;
        b=L9cD+szSXcu5WQaHJ5iulPlyrADRA/5QgU6Pmg2xRtbB5J+trX2cPRl2ILEyYhL14N
         WSVSpJ6kMHPaFrca5p4815m3XnTr2wECQLFukEEtKTxYukJ+tDCpIXoyyVzaqv6U184G
         w4KmEoEeBxR9wCTNWLQ9erzrA3rtYPQBvro4kuzocnxaU1wyw6/2o/IydLe4q7iYr+0h
         iE1eygVjyUI/xhKiADl9cqzCv+uJgA3alH8u3wJGVYMskXoz9Q6o8OvW4quMQeyZ5Iee
         hTP4Iqze+uZX6KMq2j7BQOAY2a/YCImybgdPZX8x190RcknJPVlcTyekT74kg5lRRQfc
         OfBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAff2HqzIx998s+zXKS8wwFO4/3aqVeXTFJSPIz5kOWISx/Kk/qqbpvbbTqSaNFz0pIW+opT1UnM3EcjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKibJz6gNyldpunULpfRVlM6P18x1s4uuGz0LqwPJUDqgnlEnZ
	Pv+oxcx9v2R/ztlBjHynTpUW2iFxGCqS58XDHenIF0ykOIYHOLWzEVdMWO2RJ1eamSLKNZdnXxF
	ufaRU5s3MfC5oBsEnTBfzQV3CddbdILmpX9KWhz+DPb+LZo7RBBdQvrvDT4tkiUY2wh4=
X-Gm-Gg: AYBFou3D0ZgCh3V+dy8KwnCwDh3Mls2tn6DrpuyRnOR3j4Lw90LZNgRMbKpsfd6Hcya
	FLjr6kUjutZPSJkwCY8Of5aAg7UbpoN1fgyNXclHdkGQUkhdxXoZ5IiCos6izmEidVkVvjD7W8k
	yJOtit3CuVTAEqmoeH60iFvm1pkkTYtum70/RQQvuUo0zBCOnu4bpot06ACVgIlRf7I4dPHexgd
	tGeXmcoxdRYZn6G9p1DwxeIQGMV0SX/Ww4knK/2gTZisYhrjYlBgVqCy5uoU5mSyinuniZVfz2x
	HD0HaeoYzArjTWFrtkiXdpWQdhfUVzyOGzz/gUnKnHh/DoC17TwW3SlWo6JDOkCcj4NthPx1uNH
	67PyyclgfAvHIFmyl00PWFDYtrbU=
X-Received: by 2002:a17:903:acc:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e5ffa16178mr43802655ad.3.1791460558564;
        Thu, 08 Oct 2026 04:55:58 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e5ffa16178mr43802505ad.3.1791460558080;
        Thu, 08 Oct 2026 04:55:58 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm22731375ad.58.2026.10.08.04.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:55:57 -0700 (PDT)
Message-ID: <87bc700a-0b67-4791-9065-b4fa4ba9b53b@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:25:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error
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
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-12-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-12-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vOK3MsEj_ozSOHX58bC9dReMho-76AWM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfXw9yPf8pwDd66
 FJXWjh32MT2p0SFeA1VaRIgcSqFYXQVZJlpdBGkPAu9pYg4jCxf9ah1IspJHj2mP5h6grqP1mDR
 RNszh+XqVR5Nw6nucGnl6R1/feKoOQE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX54/MNsR3gd5u
 P1yxQ6t2qS37P73ryIdVVWARXLt1UOH69FHKdS+eNHom9y3mOLb+9OnhPjzB5V3YXbDWp9oesxh
 ZhEdzDGpRJ221jL5CTtmUTqyKaSiXCnvAPclXZtnS+Vg7Cf7fHTb1vp2E0+tSc5fsKC4GL+zVRN
 ekPuUEz7rFkqfeJThXOhYzQHl9Iv99p7TETyO/LWO/vQr3XYjs7fWglQJMTEw595Ij6d2E7fwM5
 6FJbddh6QTCXXwmou3uKSSKPcAfIefdVVLVUBEDdVxSBpsD3rvG78Ipo+iuruO41NsJR/Bz+zJj
 0JB8IgJ7POwNlWSWOnrnGL8qm8hiVWpMNFWEXMI+p4tKVqmtTcCstptSSOlvIljG5yIBmhaPh21
 yuJEAXIqcjS07KjN6H1tf/+6hKUmf9+YKB9T9RF5f6CmNee9MTOqYgjr0UvYjfqFNJ5z5qW5YKe
 05Tvdpw/4zKp0Q4K36w==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac784cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KMfNbJP5VoSB66bTmycA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: vOK3MsEj_ozSOHX58bC9dReMho-76AWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Check and propagate errors when enabling the ETDM MCLK and clock
> gates during startup.
> 
> If enabling a clock fails, disable the clocks that were already
> enabled to keep the clock state balanced.
> 
> Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
>   1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> index fba51c552eec..1270fcac6b3f 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> @@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
>   	int cg_id;
>   	int mst_dai_id;
>   	int slv_dai_id;
> -	int i;
> +	int i, ret;
>   
>   	if (is_cowork_mode(dai)) {
>   		mst_dai_id = get_etdm_cowork_master_id(dai);
>   		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
>   			return -EINVAL;
>   
> -		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
> +		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
> +		if (ret)
> +			return ret;
>   		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
> -		if (cg_id >= 0)
> -			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +		if (cg_id >= 0) {
> +			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +			if (ret)
> +				goto err_disable_mclk;
> +		}
>   
>   		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
>   
>   		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
>   			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
>   			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
> -			if (cg_id >= 0)
> -				mt8195_afe_enable_clk(afe,
> -						      afe_priv->clk[cg_id]);
> +			if (cg_id >= 0) {
> +				ret = mt8195_afe_enable_clk(afe,
> +							    afe_priv->clk[cg_id]);
> +				if (ret)
> +					goto err_disable_slv_clk;
> +			}
>   		}
>   	} else {
> -		mtk_dai_etdm_enable_mclk(afe, dai->id);
> +		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
> +		if (ret)
> +			return ret;
>   
>   		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
> -		if (cg_id >= 0)
> -			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +		if (cg_id >= 0) {
> +			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +			if (ret)
> +				goto err_disable_mclk;
> +		}
>   	}
>   
>   	return 0;
> +
> +err_disable_slv_clk:
> +	while (--i >= 0) {
> +		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
> +		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
> +		if (cg_id >= 0)
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
> +	}
> +
> +	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
> +	if (cg_id >= 0)
> +		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
> +
> +err_disable_mclk:
> +	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
> +
> +	return ret;
>   }
>   
>   static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,


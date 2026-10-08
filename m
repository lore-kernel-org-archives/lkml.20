Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B14481648
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460140; cv=none; b=h66ouxdobF4DRKlc9Q0vPaipLbtVEEgT0p8e7lXP61Y9/Oc91vjZIPx47o1D5R7AMKfEc7ohRTi0uLOFcag+q+AonXUVP6TImPCcpo62ykejPhUx2DWQuNTEBdgfMOAbu9UzQDMUnGGkgUyEm+MlnJbcl/YHpvf8oXzlG4PvFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460140; c=relaxed/simple;
	bh=v1Nl6qXSqcHgc7Bta/CWsW8XLXGOsM2+4wSug67CaRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlJjVQe6Tdr4Yr8mmgFfpDr+nUV4un7TH7EydQC4I5Uji5AZhVb/eqYTWuYUCqzSTlCGoDws0BmUMdeRW/4V1WNE1vjneimf0gy7GpNkO/X1eVwOh8IahRJ3uCCJV6+yeqdlpbIaStPOX7vZNANHTIN51LSp3MfOBEw40SnZ8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akue/Wrx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pv/bafqF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akue/Wrx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pv/bafqF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK7Dx2116370
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=; b=akue/Wrx4LlADWhe
	kc1Qhr/HbliJoEWUnAfatjZVPBrg4PEcWq3UuVdOhvPgBMXkST3yW6J98j3TXfMH
	UarS26K1NApJT87nwcT9pt2V2yb6YKqfBJIVRRM8ZXRbTVu6NnpjZPNziUe5Rckv
	AvWknQoyiMtViplbVMMcEl1X+FU+bvNXuCQhsi20ZVNZ+pgxXeRnu1F0hFK37tcl
	kPRu0KWpBDzGhzkebWwI8ZvinfHHjwOlzy4p/sjiztyxwJv2gXZzH8C7TwL2Rgkt
	mO6a8imA71fYTcrNPTXx+2/gJkkp39+p8thw79kLk56gqyC2PIByW8cd0QZ4EMAc
	ojqhww==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe52r5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:48:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso922817a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460138; x=1792064938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=;
        b=Pv/bafqFRzA+gZt1BHk060vUvuR/+fkeWPHrICfeNnpX+blQF9GGvXboga90lT+ta9
         kKn15HRfiHRIKCZ6dAq6nEdh0wiWNTJsiXSvXq8NSLsbyHFo7wIdXNbNZ0BAjgPtuCf2
         8E3qBgcFIJWGcrUUoAvyeHXBP+BNL5OGArYCD1GZEcQae6jX2EtjZLS272fqf0Jdmhx5
         cwmL/7sP/o8jkHi2nASK874Gujfcq9IsvtjXp81ybzslKrKe3hpaf61l7dU2xm2uAoWJ
         GSajxw6tRcXz7yYb7mjwp40OgV6bC1v0oUbpGASIubBhViAISi+7p+UbsFYHlm3FtlG7
         UgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460138; x=1792064938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=;
        b=xFwhduBho58/wTQM62WUzFqtD2ACQOI1wTF1fH37AqDQ3n3RwPAcUoVQNqlu1NrBJ2
         /C4Xh7syMeF74qDjGk32ysJboWDtNTc0HSeluUmF3HxgNJ0dakVSfOetyOGpBtkR1S9B
         7v4cGGx7S0K+LiUfk7B55h8uqwfAbie1id0KjmOuFK1dEBgm9gCQSRBbaWKStZIk5iyM
         C/aAgME1bEkGKCf185ocQzkJzREsCLjBoOZFf9BrHLHGz/hNma73sslCq50FiTWR57Pv
         bpCew76mKwtBR7go07qKwrgiuOOdWX9RhpSowt6vwclBRgKK4XkZUrbiPPcjo1hNPTfJ
         PNAw==
X-Forwarded-Encrypted: i=1; AKwUvBzCgwNxap20auX1TkF5yb508zcgWjPUUEXNoGlSWaSt3XjV+uFdNnGL86VuAO55jKqj/Rj2qW6RUPI7OVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu8JCP6PeKslzSAS7PjumFJOgFR51m71iuGt7FoV02Sihn/hAX
	ndJAG5LDUZvSw1cJZbCXDq4dRzoUwiKh4FxzGPtDtvFWgFtXlV+abO8qNtBkZ3xQknTB/Xu19cf
	dfZHtsYY5J8+5Ew0XGRbTlrm1GYTC7/6vS1p/jAX2uLlmUw9iFPeShV1yGvxU/KHgPDs=
X-Gm-Gg: AYBFou1/x+MlBpezryn71YBTlT2U8nC6B+4/FrswvU9PtSrHmA/NMdPqbL/8Ef64tPA
	ftrzjSzkcTsS9dJTU86N23v/4GxxAi6lSrTWotla+ARpTGrkw6YozPnGlOEvTgL67dx3dK4ek/X
	/Ns/HIM/Jh847h2HLv2RseALMtLcEsOtsFb3UBCtGjwiwpC8dnihjq/PtAlNRcNeVLqUJupePGo
	BtrcAPyXtF70N4yoNsjRXLKfvNwNQJAOD3HQXQtF/cB8yv7bHCjt5i+G404KOnmifJGx5Xh73FQ
	TpfZIE549Th3jZ50RCkfHqZZ1crhsQYTcDYievJXEuGZRJjSynLR+A22zF/uVVB7XLFRdkKG2T4
	F63M4v8GG9Uh93SPQTqhiuqHMZTQ=
X-Received: by 2002:a17:90b:3d89:b0:3ab:c80:936d with SMTP id 98e67ed59e1d1-3ab0c809900mr758611a91.19.1791460137625;
        Thu, 08 Oct 2026 04:48:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3d89:b0:3ab:c80:936d with SMTP id 98e67ed59e1d1-3ab0c809900mr758586a91.19.1791460137159;
        Thu, 08 Oct 2026 04:48:57 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff5cd5c3sm4315881a91.17.2026.10.08.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:48:56 -0700 (PDT)
Message-ID: <0fdc0f3a-48b1-481b-8ef0-8d415d99e6ce@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:18:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] ASoC: mediatek: mt8195: Remove redundant error
 message
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
 <20261005110257.50145-9-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bMdROrKGO4DveRh4cz8nJCZ8bmY--a0E
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac7832a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SQuuAJ8L7pDmPWVkXYcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX/T9FASrQ5Dhf
 Q9h55usYJ9v0kwrMGHXN0/YTb3FcG3FIE+CqwYtQrmIsxgqHxo1I9iUAatMh7sRNiAciWSVBN2j
 1wCpCylQ0OQQ0JPeozBycEkF7tGJemI=
X-Proofpoint-GUID: bMdROrKGO4DveRh4cz8nJCZ8bmY--a0E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfXwLMELb0pFetJ
 GwTMGubV4z4VdC9O+F4f60rtnCAwcqeWUIZoeHf8qPSiZrviJouIxQahBjXdfJUMyO0/vBuE+ix
 Kp0N9OD+EQbDqvjnm5sZ5m0mMMKbdevWV2r2LgjDCAaVRUu3uRql55RPOkTC7RckRDTi9mrC+6o
 baDargKGpRlwozNJISbZ/foIa7vgaHfiyE9ucBcSGTVVO9wxZchhCPCGdT0eBurrP1WVAM8lHdl
 7ehzWcI2mXlHQ8BReo53PIhz7DEDkW1VnGRBui6oku8VgA9/+PRSYt8L+VaLgMe1JfErlLwANu2
 ESoQ798ysf0gjMgZtsgoiBuFNofArjATnRTv2kosS6WihgErEjZIGTKjSRglO3oPqudvJfsdPeQ
 C+xpgUvb6aLxFFxZVyv+tS6OIn7mLnMh2IM9ubNQV7T4uKWZpepx5kRuUp5utG4dzsT2qcMO7Vn
 iypvDYIW2/0JXYbOzDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The errors handled here are already reported by the called functions,
> either directly or deeper in the call chain. Therefore, the additional
> dev_warn() and dev_err_probe() call is redundant and can be removed.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index bb357cc674cb..1bca2f62e76e 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -3083,7 +3083,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* initial audio related clock */
>   	ret = mt8195_afe_init_clock(afe);
>   	if (ret)
> -		return dev_err_probe(dev, ret, "init clock error\n");
> +		return ret;
>   
>   	/* reset controller to reset audio regs before regmap cache */
>   	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
> @@ -3130,7 +3130,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
>   			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
>   	if (ret)
> -		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
> +		return ret;
>   
>   	/* init sub_dais */
>   	INIT_LIST_HEAD(&afe->sub_dais);
> @@ -3188,10 +3188,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* register component */
>   	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
>   					      afe->dai_drivers, afe->num_dai_drivers);
> -	if (ret) {
> -		dev_warn(dev, "err_platform\n");
> +	if (ret)
>   		goto err_pm_put;
> -	}
> +
>   
>   	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
>   				     ARRAY_SIZE(mt8195_afe_reg_defaults));


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5397A469828
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460262; cv=none; b=BmWTob3mAiDfer1NcZV0tqCeWLLfKdc+BfpTdDhCGh0GDSdfso8L1OeBp+cUkRdAsFFtn5b7oe4LiXKGgRFpbyeCcEjFWFqZaUo/uW2nAOZupEM/5uGp4a2BBGr25jv9/w9xdhBMfXe7sgrwNNDveoLWJ9MQcEnk8c58rZgjGmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460262; c=relaxed/simple;
	bh=zEBx508/RQcpNMZV46M+QMsQvaYOL2nukMD6OutAkt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPMVbSjkflPTPVvjMe0sxD4McPDOtBLbjQVsJpdKjAqBaOBbc3tG8LroN8Ig1zeT/iLgrG2vGikoPVZnv/pRZyrQjOVgnuIkDeAPnn+igRkH9vARnQlN1HULD8nYko4g0oZNni9LqngpcRU2qMs1qDKbSyAZ+F1JbfhdMsJ1/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUcqI1O/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxPYgFtv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUcqI1O/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxPYgFtv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BJwlj3846907
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=; b=fUcqI1O/4rl7SyIx
	NhvkJS+F42bLnU8/JqymQMwotM2ZGA3Bv3GJEabhst0ap0I9ZyiPdqo9RwxmsHAf
	RG1uyKqBvm9IJ31XbftFhTJFYMKMkn+KUSIzZkoI5sO8LEA4z9hoEJ0haBXRMI65
	bWQSqIBFcPYKU7+6ZwX6R4mThDR5kBs9FzWRo+uVyj9gKJ+tdnR91G9OfVXCEeOp
	ULj264Da5qCYqdSWVE2iHUc/9Rs2p2SraB2dlfw/pV0O48FI2hiV/nkBF5A2rQnF
	ddYbUzLNV+A5+uKm3P0EAs8NEG6Bp4voHyTEjunTlkbHW5apV7keHZzMwt46ZBSn
	tvN34g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sgaaeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:51:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so5997800a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460260; x=1792065060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=;
        b=YxPYgFtvDbyCOAwPj2J9LACOqxcvbiUE7L7xOb1P/HN0Y9OYIu8j0g3IQ2SQ1O9suD
         TjfCiWRnLh/VFOfD+g6op5lwDmGS1S/bIB+X4JvwrC8f2feRi/nNSrp4xP1fFltCYxZo
         n4JESmRxEcysx7cX9lSHmj43omLtxlyNuX3zB1MZkNIOQcxiGAfFGrtUyj2HQfuxXzVa
         MUtMdeGRsa7oHiLLWOPhaV6hFFPC9LMuQbHqADfqY/qyqPzFl5PfatBEwk64hav/oaXM
         c4Org2n7eXOvg98VFzQgt0Rsv6YyRhSJwQnmps7YmD1YH1d5zVxuo5DWQODUEhOQd76l
         5diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460260; x=1792065060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=;
        b=Qv+iqPk7Ll+NHPvnNjCLfpzwUr/bCh6k6g7kPe8quAZNkWbuESEzbVNtQs4iQZVSIF
         ZFbVKY8uUUaV/rAu7kE9EpEdRE0DW7iGwesIaFxYWJz6G2D9S1A6P7OUgOm0L0KevtVR
         Hfk9hn2670w0aRuVbQQKklYbd78INJmBi5EjQ6PUb6bVJIzjgE5Dx0Gay0spMVBEtn/G
         Iz8IyRTHYe+gQz5+nLzlPD3LIJlBNmQ7HOm8x5bF3I8klfUI0BHN++iDAItTMoBuvAEL
         Zmql4Js8YMiOfocXA/oTzRK/n+k8q5TJdKZ3Dx6Y5lXo/2JPL3ZKlp8pDXLgd+N96fdE
         9kEg==
X-Forwarded-Encrypted: i=1; AKwUvByAxCtj6tCIW9Otn2Fkl7XO8w5CopWL0HuQAOLXyq3IBwU6wsEbrEtVYkBhpRO/ZTRXU7laFWqr5lcJtqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd0G1Ne0KaWB9limJMgl0zzR/yu7tGicg1UNRYmJdDTKjcf8IY
	TmslGv8DJd/jsSpYSSHzuYDsRRBygfO54U4jzo33Fkn7o0xoYcN2ghZtz444zPwa4u3LEog6nre
	47FV6TQKK6K0SkjHW4wHS51GfALnqgZQIFcHYQZgL7ND0gFzwx7J7V3VaPQrR0XetsPo=
X-Gm-Gg: AYBFou18aQnw1CgL/1Whg/KIg9vl/1RWGFoG3c0ffyJQY8GvaquCQpSMHxLJE2vNQ4f
	1FPSZj+J+j2ZIOGF2pgwikdHH6v66BZXTRQzJXvOpIcrSGrGVeuqqQAOsB2hpksewayUtu6H8IS
	ud6fg1NeU9IU0ZWmkbu3khXoejmr4jfPX0b3T4q3/P38X27FE9Krg8qkF85yNz7xIeajGm+y/CM
	TgQuqYxR7Xv/NHmmhWIvpe5KGdsx7SCNrtZR0b/Hjjl+4HpnYoVW5UjK1ImLNsMd7J30ckvFq8p
	CTRYsZUqMjfg5zesmlwbOyNIciE8Zy9JK3dBvNJHPyVCQiTcqIgK2b7mI3O7MZ+kRmzleaXVzcj
	1bPIgaBH+qetcuqTZgi+rEltNxMY=
X-Received: by 2002:a17:90b:3946:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ab1b1979d8mr232236a91.6.1791460259594;
        Thu, 08 Oct 2026 04:50:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ab1b1979d8mr232209a91.6.1791460259138;
        Thu, 08 Oct 2026 04:50:59 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff817537sm3864991a91.8.2026.10.08.04.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:50:58 -0700 (PDT)
Message-ID: <eb3bb86d-3d73-4dad-8041-8d8e26c2cd21@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:20:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup
 errors
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
 <20261005110257.50145-10-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8qQ2NMrg6cTqMBuFALDbVC_hA5Ksn_ng
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX14wV+K7ObbTy
 Ql7YbxqOHKpsyEwE5rkkSwxSp8cpQM3bpYzaQIoMiMatieFCujuFnPLDuZfNZ5Hog/jxA7rJwyk
 uURPiOXvaIpkZRBHcy2yj941zE6hZKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX/ZZuks/0+i0D
 9dc/e3qyOg1LRE+7prozGnlhNqm1sIo8xp/9ysnctUHRG5+mJ9c4hlNwoTdoLSi5BeUcBHEC/o5
 hQKUFNwf5vbAmUEhOADbrbhmBGHe6tlX5CO2n2FBql3P8oktok0xHuncIHcel54ajse+z5nKR1A
 1kB/1tmSxPQAAQ7luDNtpu6mRy5plNMIJ6fU194V75iNcpZwLCxDVCePJMt1m6RQ9ylCrTc6XZk
 bu5Ef/7E6J1UVkz4vQADkBv0XIh3f+q9+y9s9VpH9rKJCyEGQePT1a/xcYqHbG3pjnvQbgPKDQK
 KcxfRNo4K3g3ft6qZryiMXvSRZ97k/x8OKcrikZu/FS9Igp6U+lBYL/OAGpvTy/26R7yYCjlHuk
 Ac31fGkj44eR/yKXtRZ/ZrayXHXFqJYXTe1ZcIzYjCIrcM4FAlDj3xptu21u0S8V/xr7FwASCBJ
 caHkZManX2PQcpS0cEw==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac783a4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fkDIAU-C-wBUwbiI5OYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 8qQ2NMrg6cTqMBuFALDbVC_hA5Ksn_ng
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
> Propagate the error returned by platform_get_irq() instead of
> replacing it with -ENXIO.
> 
> This preserves errors such as -EPROBE_DEFER for proper handling
> by the caller.
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index 1bca2f62e76e..4ddf2114a1ab 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* request irq */
>   	irq_id = platform_get_irq(pdev, 0);
>   	if (irq_id < 0)
> -		return -ENXIO;
> +		return irq_id;
>   
>   	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
>   			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089768;
	b=BWovO3SJfXOP0JHncjZumc5z1ENNz2vjI38ha/4t7JwiXC/dRc6bBnTrPMI2ZHKDe+v8
	 z7CrilVsRNmdd+YfOKZtSbUXh06Nj0KwkipMAX9d3zg7DCeWVzaLq9Rco/7zAmjekVd5o
	 yJMvxu7anme/L755JBLV0wHrwC+xff2bvdlgelA+ISQWhVKcjt9efVVl/jCJDfaqWvWmh
	 Bd5ho2Ayottr/N+l5B8vbRcsCWP4Ox5hGQDNf2R+ERRQA+mwg8opTb4lb/Wx/ntZj3EOB
	 KuUX6eTm8m+1DBQWSxPc3oPW3JvVlHO/TS8hDwpVMsyvnKRCL9v5bIkrnLWjaYSs6rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
	b=z5DBpdW92d8oLacCYzqzrUsFkenH4BSHyI6Sna1JBvhWp15hza1j9zELhTC1B+vPrBXE
	 jBuCYwZW2jTTI68f2VfT1c3lapPJVduBUDU52USI8jlC1MT2xoF+Fvp1pA8lE1LiDli/P
	 h8qba//rwZBkng5dCWOAlyLu2v3U2Fj7iY+MvFC/M3HOV9EDQTU8mFnWfx0Z7XTtIMUi+
	 vibnVf307n4V6tRuAkbyyuQzxzFk2WlIWtX9QOljEElBG1W/oWwqH0tlROFS+lW4F12yh
	 9ct9u687JzBO8XJOV6KpU48P0hBz+6m0kaFn3s5snhXrTEiEaMs7Fj8yS9xqqcGEcxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mzIx/jwo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQuRP1oh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF771606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF771606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mzIx/jwo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQuRP1oh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZA201259205
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=; b=mzIx/jwoIISBSLsI
	brqUo+tvPFgIKfdROBM/ENqEm8Z6RQGuegvcH8/yyh4Kj8KbO09SLKqwvg1g588Y
	sIaVjiEpqcgUQYKPpi3wxALFrHiC0RZUd6QX6U0omfZCETP1MHHGu99XQ7nUMGyl
	cAJtYa8hUVzBzfJUG9T1F+zJ//LMULGJMlvlm6mi6g4luv7wdU39B98weXlDiUDS
	OJ1PAwjlyeKW4kxuYneleHuY4dL6lLmjw86d9PIrfWtVBjpwihZuht9mWbyB9Y11
	IDszBB2uoFXW33KLC5xwVu6TbKzs1iU1J6qsKaVXBCIqrWmtU8EUdBySxYpRw+9e
	VIVgUQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavsvs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:29:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so10967701eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089766; x=1793694566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
        b=WQuRP1ohzhwF77ii3RygEZWFGOEttq3fEl4axG5m98zyeK4sr9ITkpyPom8orbAU0/
         g2P4qm/7ItWVU1e/+8L61StzjMmgKk8kW+i3IHmrn73UaPU/aY1jfF+kwSJAwMGLoWiV
         tXndKTC7E1Xp7ONRRxDnKY5NeCJRQu7lc87vdBhJ+aqQfatY4Rs6pD8MFGn+7GmnwUJE
         Hb8uKB+IL6iIQ8Ga4P5wtv/Ucdxfms9HQk/dz+Bu3ndvx64YmoDFBBSgyqf2RuSDyLsT
         jOShWn4fvZ89ORG4kBzWivQCLkmOQqYjoQonp8T+ATFFrEenM12ULWhy8luouYDWHUgN
         YXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089766; x=1793694566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
        b=PYCHlk/3+BucjFawxxTyudPKGVlBeij31bhvjfuj5/CYLx9CTXXVEln1RUV0hQYiBq
         rWCHz/nHK+xGeTDMQ0cldAjGXZixUrywTGD1x3OcWK9Y23/SD71qJLznzTHIvhig4QK5
         EgxC/JsTmJPnV1VqtvZpx7wccvGGCx6fBpXewBtmWHrslGfaY4uAQETV6X+lx4LmJVDX
         MkABDgqB2eL9x2uklTiujyjDC6rBRuxXjXWaqdXkWpTIckDJps5Z/F+1FZhjDoks9yL/
         FQHJNwPnZVZ8ACB/3hTZtqDv0tbctemQfVMYsuMF92xrwfEyj7/LuTyRd8JboyzoNnSP
         tgkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcEyVn+AHIvaxQ1ylNfbETA60PxTMLSGQxaCgUejY97TIyUBBm0z1NgbbBQXv5Cjl1rJGdki7zajL34Fc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBSU4a2/SfnuoBCf97ciqa4zK2q0/Vs26OkHxflt07sH2IT5W6
	fV3MfCIhwydSBtK6JQ7fsDGh2ATzNu5I9H2PpvhV2heaTWwepi1QcQ2IHxDqtrVcYMY5hyx7OnG
	va2yQwQ3pNjbiX+NuMtI7td97UmnUyzcooNQJCBAK8JaDkEGtUI3G/DFwTZ8wvGeatWk=
X-Gm-Gg: AYBFou1litbhjN7OmsGNVZCyIZBFMSdCFdZPoh5jLMBY/Ie2tNk8wNH+9LljFsQFUHO
	ZzJSns3/uJf3BJq1GYLb6kBiXYx8EfoS6L1yegtkAld1LcDGoTJvoBU6GMpJnNnDAwfR31p1AwF
	BY6aeVgVEP54DeSAjp165Ldxrs72UfSSrVgGOb+Xj/Jsg3uXnZ8wdK53rhqcXBEgq7VehMeEgHe
	lIOHROW8trecNlvmA0xlcdIlXMQeb28He/aUhLZ2KtRBsn9WOZS2PucYzT9FA80Xpmik2Isn2S+
	ToI70RwfwXwXRmwGsvksi9SP1dKv8WBFtoRhMZFnK7nRjZNDUWii1X8SGmSmlg9d4zJ5CHVY/Ka
	pKB1beexzmT7ow1tiihsyT2Da/PHh0e+I
X-Received: by 2002:a05:701b:208a:b0:13b:3132:6e99 with SMTP id a92af1059eb24-19934a96a8bmr12502723c88.20.1793089765786;
        Tue, 27 Oct 2026 01:29:25 -0700 (PDT)
X-Received: by 2002:a05:701b:208a:b0:13b:3132:6e99 with SMTP id a92af1059eb24-19934a96a8bmr12502640c88.20.1793089764414;
        Tue, 27 Oct 2026 01:29:24 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm31709403c88.12.2026.10.27.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:29:23 -0700 (PDT)
Message-ID: <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:59:17 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE
 format in hw_params fixup
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OfzzgQVMndTPjHASgdbsg-UCGrMNVUk7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX+bbdoRZjxjjr
 80pAXSz9eJiKGH6PQ5NevWndf7oT4eC/lshKt9d1C0Z3n5sRx6HzIIJ4LDPhV+0WLxje+7XrdfP
 IZU1CwxjlLvmQfermR8nmNlTi36EMPo=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae060e6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=G9vM1blcj23d2gLDv7UA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OfzzgQVMndTPjHASgdbsg-UCGrMNVUk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXxd3DR1gzqAsw
 TgYmeWSQNskAp2AZb1gHCln/pSzAdYf1/p2SA9iFEdZ1Vq7mP799Sdz/wVC3B5HFGjlyCmNeEzi
 SarXtU1zVQcbOlCHcVNEK709tto+eY2BrNTZTjRuMFiG3lzGkAu1Yu17SeXa3u4wExyHGSpJ07k
 3Ri4Lzg0B+vda0Xl2Zxj39bgZc/aH0PQ3/wrx5lFQFt4T32wx1+TRxuj6T4fQmmWdmsH+9L5hwR
 tJRwVbyZ5CDCRmf2/HOzTL4GUzWjRrFh3hYNuWcHEN7iJ7UxNrAseRKrfnSxLMsnYxgmP68gMCE
 CKtcTxZNq2wDyVKHN8o87wr1dGdC0BB3ALa8HujY2IxRQCVkZKlDNKgqtR3zN7AdVtsbhDk1zoP
 lCggO+2CfhgJFDj+zopbje/wOSzC/HLa2kEGDXA7GnVTkoWKUMyoTXearCrCGbE5isVReuK8FpP
 TLMgDKtXl7ACBeFuZ0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033

>   	rate->min = rate->max = 48000;
> -	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> +	case DISPLAY_PORT_RX_0:
> +	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
> +		break;
> +	default:
> +		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);


S16_LE was originally added here for compressed playback ( 
https://lore.kernel.org/r/20250911154340.2798304-1-alexey.klimov@linaro.org 
).
Could you confirm that compressed playback is unaffected by skipping 
this constraint for the MI2S and DisplayPort backends ?

Thanks,
Prasad

> +		break;
> +	}
>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {

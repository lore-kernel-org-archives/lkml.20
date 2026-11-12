Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478858;
	b=QUR0gv7JsSjsZ4ANmWxuSR7RKqGqQZtmcvFYt4c9Q4gMb0eKm6Dara3LK1wK+3rx8W0Z
	 Jasqn8j4YetYdhyrOo+5fowEVrvw1fcIApIL6e+OM14i6dxSJwHAWqLwUOUh1qilRH3qW
	 3ykP5h46w3cwpjJIwHBnQrhcUpAZ+FfY5higVUyPZucCJwlCbnRRhJWta2KTJHYXiyz+L
	 LrOdKBeltyJMRBKCsJqPlY5tsvCeW/dGyTgXbOESFlO1Ed5++Gtzh9e+aldL8Jk9XpCXA
	 LAN/GXX5N2PTd7WdWqzbjzBYoGNQcWyiRnIDPo3wnCw+hYv7aT+2xT3D0gNjtZMACMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=;
	b=l3lu+ooXbQKXgCXta7BZmM3Lp6//Q2M1E50Yb4aWXh6AYCN7EZilPdyEXzvDk3tyIT0o
	 gKzvD+Ck0swWXooz5icHlunXQgGjMdBTmn4xoia+qupaGFj9BvUziO6+D4/X/loeMpF5w
	 qjS1Qsks+5eZAdbl2yvyxZ273j9R0tXsGh6zE7WLkI9yBog83h5ryukjDe9HtuzKntk8Z
	 1vBoFONLyJRmQVH1jW5GzuvS+j09N3osF5IS4UGXd3XYLwUJDMYdlZoReXUmeDUsZ21P7
	 E4XBFWLLMDCPHiOe1tjC9JoBfwdhz9gZn6VbA3Vauejf/DJJvCZyUxETErj7bpSDvOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DY6c4zsy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJuiZnWf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1A606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C1A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DY6c4zsy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJuiZnWf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC93xmi2514179
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=; b=DY6c4zsyIIwudJ1m
	GOmaVOyhORdZCQ9jgXWygIpWrNEYD3F8l0sontN2nfn8SQfB1L8Fq2AbVkUb+pnY
	pVorlf+IPVY6jwl4DNnPhU7KZeZgerFbuUnaNBDXuvK/TeCvzhuJ4kLEZQoXZ3l/
	Q0nMePy8ykK2JiHc903UXiB1L6XV+/kE0+6V06s/+cBQxkjH0weq+LAwmnbaee68
	zaVwXwKWMti3Scg4InGG2DW94VOQ0KojE3t+1SSiwgtPH9dzEHJElIt6LZ8qB56D
	WEFXWvxenAmnJ221Hq8rQjPikHecWi1CEtSWy+nFds+dZvuSSOLvz6dLh9fi/lBL
	pvrQ2g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1u496-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:20:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so3718924a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478856; x=1795083656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=;
        b=OJuiZnWfvsNGQoGPCxDdggYBIUHIfAJT45kdjoCrUgO+DC8+TszyEm8UJh4oK7t9fq
         1P2w2XPJSIJxFnYCRb2c7W0aCwTT3vtEEFSEoDI55dF/E1dsbeskfMWHrl30eFNVPbLv
         AXflwhEQHParZdWTszPyMcYxs73jQzz2ESaQJceafGdG7yx1X54puoiHwEt+ah7e9oko
         9pwu4E9PV82fniFYxiFH0ETYGoSP6roQQewasvl+5nPZbvag/uL1H2zV7nf/TYen3rsf
         DihNyY1U2/xcsvOaSfUS3wkefZ9hn5cGlZS2TDtkr4l8tb+jMrYjoN1t+M6wKEk1Yhzj
         lqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478856; x=1795083656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=;
        b=SGzxBWBmgNh1d+PAX14/c1gUtoalftqIj4FSuPV6TFJwlJ92CKyvbPQ0uTqZy/7/fC
         cMqnqcHidJpm4AhOweVCTcmLcVUbZvHw3JxH+FuPbn9e1yOQO+s00fxzGUf3cD9u3RQv
         1zwGZrgmQRCuUsOOabbL2ao7VfIpOiw62TF3mkulINjydJXRr6geGIuHq9/Sk+hyT0lY
         odP1oQ4RWH/rp1kMOlXRicJNjXmlMjeROMIS51wv478gD8AqxCHsB/Ph0uoY4SsJtU8b
         IVZN+RQNYquB590pGlhGyyYHXlw3eIxyCrT9wLsxGm9qSar5s3O++FeqUcNWLIFmvhJ+
         4XFw==
X-Forwarded-Encrypted: i=1; AL+hErEvzzVyJBbZP0+z2axHnL/2Z7zMT48sJuZ0nWCl962qF4ItJZttFc7Sqc6oAV81wQjq5yE4RbMsTKLpNNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NNKnqjKViF7Uzi059oq5JPVWiheK2fdUU4bExhZETPZ22gZU5
	LssYQs8I4F3t5/IN3rNWEcJtFGe80txWJ+dGcmrgw9zk1WnNlndweTs+FhOK+d6ugRwdnZLvaLn
	U5/XhKMIjvk3xWoPwogSfxsCMEMImsp1SF4tB5oAAdVnw7vtAL/gY3MGAmwki5yzoRSU=
X-Gm-Gg: AYBFou1otgtUn5gjBLHgeqWhWyyExGdr9tHeq5gJh+d3S8gk2xxV7D8MMNJdO+PrbV3
	MCPkRRhN0fAAATSTIIrtEnarjHjd6WUkjt4SvJ05rFwmHBOTKthcREJiGw6R8NjnbaI+o7IlIyy
	0FOqmguAq2RZ3yx5GUtjcmfU4exigZ29Ts6LW9/EfC8tM6biHmEIZUlkYlndg3yL4fVlQvvT/Q2
	+388oeZ418bv3l8XyoTgK5EOgVu138V5k8Wf3x+L5byixAlkmqOkMB2TOqaOGvjjtpoCSCkG9SQ
	Uw1smpJw7iEfOQ6ylUmoc5T0nBCdef9bWQYwyrIDdz7rtGiUE831MQZgVgbPbr6myWL595V4+SS
	8FEXyJls9fM+I3Bn5c61w5bLSqfQawQh5WpPXLs2qR7O2VHK6W8DGhI6Zj8vddbXzuPhlEVTaKP
	GqI9/KIXBUYc0=
X-Received: by 2002:a17:90b:35c2:b0:3b0:a3eb:75a0 with SMTP id 98e67ed59e1d1-3b182efb666mr4818034a91.23.1794478856334;
        Thu, 12 Nov 2026 02:20:56 -0800 (PST)
X-Received: by 2002:a17:90b:35c2:b0:3b0:a3eb:75a0 with SMTP id 98e67ed59e1d1-3b182efb666mr4818004a91.23.1794478855724;
        Thu, 12 Nov 2026 02:20:55 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm4011387a91.3.2026.11.12.02.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:20:55 -0800 (PST)
Message-ID: <50254309-4714-45c6-8989-7963637df690@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:50:49 +0530
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
Subject: Re: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
 <179436005594.790675.8837636459182556844.b4-review@b4>
 <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af59309 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=hEKXFTEi-1vmzGoa-5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 0b8nSrI7Od9ojWI-1PspNcY0TKF_WtmO
X-Proofpoint-ORIG-GUID: 0b8nSrI7Od9ojWI-1PspNcY0TKF_WtmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MSBTYWx0ZWRfX6eY39FeV4QPQ
 7gNnjzLglj7nBuX8u+HzBqCpvAEpZIrE97vhIWW/mzYeHWJRkHdvhaIOCx+X5mq3s7pcimhnpYC
 GAq1XSEU4y06FIEPjj9f/Ebh5lEMOXBkHTTioFXblpjAg46dfVKa8IwD0NyoERoBkTQGZ21f6Fj
 +Vic9pd/cRh15pKTtSfry+Y701z/sA6rODu/tHnVjZA9DiZXxfSEObdOocRFfSkT+A9gZMAWzut
 mMKqOIUdn8WmeT9zQzfzt7d2EepWhblP15HutzBpR/3+n09XMnrZieQkK7pyFef8f1oQ/G8pbX9
 NW1KQSiEPnlPTqC8tLLjfbEG1abQqZR5n4x2OV+BrFFNjk4vlIeBUfLMH0x9AnERSbQXUUNiG6F
 eT9pL1SrZKO+N7mJ2JFt2lk2unXqrCMlg6C9PTJ6OfwBAHqbSV1m9te4oSQKg1hD1O6HMUQhKoN
 GqEtUx5Ohs3YIJ5XtuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MSBTYWx0ZWRfX9rXYuV1StZbE
 ZYpAYDqYv05eaTXVrLULMqms78hgCpTtq3PIxbqBmLKpUWV4ZS8WyhTYSjeaoROCjhyoUTy8THF
 BrgiffXeAG/FTRa5gavIPzkSNzhzifA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120041



On 11/12/2026 3:47 PM, Mohammad Rafi Shaik wrote:
> 
> 
> On 11/11/2026 6:50 AM, Mark Brown wrote:
>>> Add shikra specific VA macro data and register programming needed by
>>> the LPASS codec v4.1 implementation.
>>
>>> +/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
>>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL        0x0800
>>> +#define CDC_VA_ADPT_CTRL_EN_MASK        GENMASK(7, 0)
>>
>> Is the enable mask really 8 bits wide?
>>
> 
> Good catch, Mark. It's actually 6 bits. I'll correct this in the next revision.
> 

Fixed the typo in my previous reply.

Thanks,
Rafi.


> 
>>> +static const struct reg_default va_4_1_defaults[] = {
>>> +    /* VA macro */
>>> +    { CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>>> +    { CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>>> +    { CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>>> +    { CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
>>> +    { CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
>>> +    { CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
>>> +    { CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
>>> +    { CDC_VA_TOP_CSR_I2S_CLK, 0x00},
>>> +    { CDC_VA_TOP_CSR_I2S_RESET, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
>>> +    { CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
>>> +    { CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
>>> +    { CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
>>> +    { CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
>>> +    /* VA core */
>>> +    { CDC_VA_TX0_TX_PATH_CTL, 0x04},
>>
>> Are we missing defaults for the mux registers?
> 
> I missed in this version. will fix in next revision
> 
> Best Regards,
> Rafi.
> 
>>
> 


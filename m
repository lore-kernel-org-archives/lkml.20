Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478633;
	b=3aFUIXubF/mz5rXZNTTa34/U6uThvEhJDw+GG7CsGL5aaUslzG681TbEsByj08nqTJx2
	 syJ0c98GLn1k86oH8IemteGdtkt3Lp6qfr3uO3sbkUx7XMZ2Zr+Flmr8i7TfXNuMUzzl4
	 MrbuxWjiCZjsyLKuc2k+hw0PfOYmsaAHbIWr4+tRs+ngih1Fa+8NQcTMzTHplry9nuXEM
	 UW5FzUX72+VCijBUBPsDWt1kUZTDQKPsV5+HVk1Fdbb6d54ItdJEbHeAjHzXMfRTOmORX
	 uNfj1Ya2BUoN3Ld+GMjhJ34tMJYZnc/KiRdgrpOZPeGkCm9IVp3I+c6m3wdFbeA5SNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
	b=LQZBWoLCQP+AO5zVHKn+4r8JTepNBwvcjkM6NuUnYdK90GOviUjoEZSXM99v//scUR3F
	 wgAlq5LPIDOWoyaXqsUoba5gsDUWvlRQ1UIgONi8R6Ax+PjN+9LPTPjrG2n/ORzatcjT3
	 qOEvJMgBKPg16HqCnVkr/MBW+7RDkd/X8QLPvMegpn5InZwyNh8FZ6RFZ78VZYjcJlrJl
	 EWoeI54GA8UFNWX74AlmJXX2lt9MzoIGrctN/+AlQrjPuglst+caCCxKOnPG2eI2LZsro
	 2BYuBLdCDSlWoqvuBVf3IcOxanoGAIT0flXogkLuFY4yoDxUH9ZSAFa6S64QyaKNsWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuoMsK2Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIrkshPR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31101606A339
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31101606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuoMsK2Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIrkshPR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9JthQ2514118
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=; b=cuoMsK2QqykoR7R8
	6L6tovW/5kKcFiHKGoeF/zGkyc8yiHjBN4zxhG4lpfwmKTADmeBJvLjlqn1wFgby
	ZW16DLzStFBzK2hKfmp2wSNLRqP7NaJsBqfAyuvGrHAUxETa40i9k14uqW5CjYI9
	olfKmp2PI/uFMst+d60L3WFsLg1jd6TEDRDp5/mRLVEHLUjsN699RDodqIdL5t2x
	ZFIQG2mpSfxZBWgy3ztyKZx59frt8xLY33sxbYoQpWHMCmukv6774EI5UcDW15Qi
	teAz9b67TsiEG/x3SFzN4IsvGQwf6ihLdMdPhN584sV+A77TUr0x9DOsyM4Ja8D0
	IjrM6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1u3ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eaf8ea208bso37371805ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478631; x=1795083431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
        b=EIrkshPRJ0LvFGP09mc0HHQhVrKtCz7tk5/lmiOVPLNmAiQbX253VFKcqPQ8NxAB2W
         viMnfF7O15QmTrU10z7cPhfXLJ1+ao23R/o3mLYFaCc5Qwy7jCOFoyOYndFjUcKPbcjE
         2SeueLm1OAbiytwuDHgwKCKN4z748CF4mjR3PSzeOQoDDZv27GG4Lzzpr2c4IpqoWpZ5
         9aLriK1IWkk45S9tlm9uZ9f15mUCcLN5Rc7025KGNb16A1QDYjB7mbGAaVHbNqWcmsvQ
         F65R5Q85+aFUW+9AsTCV0u+heMyO48BRWQ+z2RIDxGXUOid5RWPKAT6Gf4XILiUljqpn
         Gdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478631; x=1795083431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
        b=TRkUKOBSVMLaZl6TxQzfZ1fyS57UVHovk6r6PYdE79nXz540Mrr6VRc6ZQAIo6Egps
         RRlcCgHyaqFUul1UTXuibp0Fcb8XAauPS9stRjfvA9fQ5ZJA9d52Jqnrw1/FW6DFhqb7
         QO+m2yJ/sq2iJkndUn9gzYehAjMVcjOrOKmOt3rDrE2s27xJzna0to6Oo5nIJa1PZdsd
         v6whQLP7mQWaGuSO7fOroEST/ygaWaIVHoB4hBrJS0oukNTt1f2tqHqQFtU55tyr8muP
         FgstBodFIx/aSFFBArkLvh6UK/5yh3BOe47GSt/Be49r0pRVE0m/HjEDgfHZmWyyEoSb
         2lcQ==
X-Forwarded-Encrypted: i=1; AL+hErEWmKwrPrgawjWTnZqFh1O5tZ7D4Yks8/mv34gKUx/s9lGxDBloD/sd0sZTnY7tpsQOTpQRpvjrnzr6F7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9vbL2pYOx9XGfBgPVqcxPNC4ZFXazc+2Ax/9t/xy/bePciFM0
	2UDkPYSjksJUAJLrmLT/aliyg3hHd8wlKECqY53GOPQHV9cNIZGtM5xehHsVuXTGUIHS+c9OUub
	2mtaYvLfwqnWV7FjYmfzGuYPZGGSSffhJ3P5s/HpvZ3w6Yn6OXoh5X77xBycnBPwLg+s=
X-Gm-Gg: AYBFou1RxOmD8TgV0zCHGy9cDbh+TnO6DNhwsJuqMKsvI6apo/G4p5Ae+W68nEsqZXA
	0s8tXGt/7NOBq7mf+THyvInkJBlACsBGHTqSul96sfq0mmUpP75yqXflr8L5PyyzFxFliDZW9ur
	JWSJLoeQWkYFXMFrdyaHqOtfpQ4cDLSIYZMuV1dT145nIzsCL4xM93LlIGlDb48+Xb+S0Voohhr
	dR770xs/up96Qn2MRj8rtsO8zSTsqul+YRME8i6KLAdQUBwuh+rgRSKUqhFyh5pkOJRv/YioNKo
	asN1LBf4tmFrvU/e4Jmgn+TKqY59BZDk2EaSGaZWG/55GY1m9dnBsXMYkrtftEi/56iydaD1q6l
	HpPDzZA6tQ1tt4m/4AyNFu70N714DTootwfNCqfSFp7aSnpAQqVscXWdt0tZEg+pRk9hxw3Lohh
	gycMBDLsUVCII=
X-Received: by 2002:a17:90b:4d05:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b182e0f24bmr4440802a91.6.1794478631456;
        Thu, 12 Nov 2026 02:17:11 -0800 (PST)
X-Received: by 2002:a17:90b:4d05:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b182e0f24bmr4440782a91.6.1794478630919;
        Thu, 12 Nov 2026 02:17:10 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm4026476a91.7.2026.11.12.02.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:17:10 -0800 (PST)
Message-ID: <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:47:05 +0530
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
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <179436005594.790675.8837636459182556844.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af59228 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ea197RGUULTvqYrq9asA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: TYXC1P9t1mpSbNfwgJmKIBkWFoPaCRHa
X-Proofpoint-ORIG-GUID: TYXC1P9t1mpSbNfwgJmKIBkWFoPaCRHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX0aFUMsifD3UJ
 Pi+8SxSbsDjgL9FliE3Ubju3Ipyg/bcGJp4BH077NSP8qtyeMhq1Jm8BW/xp/e8OzsO9xqKpzZJ
 vIsk/ucZ6GOCn5cHyQDeNckdfMjkl1V3wL0R20iXPjcCLwnYNvqnUgmpWC8LPRE9xWR/IiMu5zy
 aFalZ72tJMhPlyPRJsSVmQlkRAT1LiSRfIgfRhRArgE/4hDKUbNGL8JHkFKRSy2v7fO5fuuyzs3
 m7SDKuaTXhTYLGyeSpeB8uZTvo+rK/L8Nx0i1U91Qhx2ksXWYQhUVwJRfEEU5AW03LTdwaJx/m+
 sKhwTT/N55soxPWBxm7tv1CXoGF7tSM9nolJV/wtn/cpQL+GGiNoPl/Ld5HoPcAELvaiSoallkb
 UUzBF5QaYM0VUWWOAR9bCg8Dv8I/PbqiH+xdZYWrrEROES6MGVnTLewnVulhumWE0BceEwxv6gY
 m9PnUdrOUaYm3vZ36sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX5NQV0gVCPFCM
 9TXWl1SasfMoMxNftdmgaH78eheE5y9rRLPje4wEch13BU51esBvxexCtLvW74MPKywk/xffshE
 o2hLi0QK/sDcVNRSrS/+9kLjcTJqZUs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040



On 11/11/2026 6:50 AM, Mark Brown wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.1 implementation.
> 
>> +/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
>> +#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(7, 0)
> 
> Is the enable mask really 8 bits wide?
> 

Good catch Mark, it's actually 6 bits. will current in next version.


>> +static const struct reg_default va_4_1_defaults[] = {
>> +	/* VA macro */
>> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>> +	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
>> +	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
>> +	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
>> +	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
>> +	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
>> +	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
>> +	/* VA core */
>> +	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},
> 
> Are we missing defaults for the mux registers?

I missed in this version. will fix in next revision

Best Regards,
Rafi.

> 


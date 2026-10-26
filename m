Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019261;
	b=szpe1UtpYbCfVWuQe+zSPrNLudTUmrPCZtevpKobsv0UjA8rOdHJlTh1loxlb0dzYnsg
	 uU1EnMCdaAvX6g7+WlGmBjERXdYNR/fnhsSIz34ncqFvsTF6ku7MZwU9ejAhlWdWBN8kq
	 qWogcoKUn0w45nVWjHQpgl/QUd5MtpWVIaC30SMQPtVTENvVK9omUfjbe410ZXIX7A8gN
	 1X1FsYKbDhQCD8sHkwuAIXJZKzenQeMHT4fKZZEeb8rk7/KiO3Iw2wKLrFVj7tyJPMuok
	 hFx/SAyx/r0+4EwpVdsPZoJeoJtSwz12ZLO7/Cx7nh3pxp/kfStKgC34cbaVWRRmsmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=;
	b=DYAofzlQS7E5rTVzXs1rXHMq7ls02r+HpUS73+jH+4bblthj7ZUcP3WRrL0eYXDCrqg2
	 8R6910G0Lg5bG/aTOjb+4DAmHPHcaZKPJi1LkvdXQB1jejHW64EZLvp0SIYxKGehcRS9i
	 djbckTVoERruu5DNVWRWgx7wKcMOUhLO1ziZRffsvNcSAgR24bE+x+xKphJFyJbEqOaO0
	 ImZLRzXVhxBopqeJkZGNXVnfkHfmXxAlthyUFk0nPp2lP++XHAsd/yTS3LgwlQo4W9YM0
	 42F9xis3NSP+6qYtZpMEGJAf+BSl+CLaQ7rfLTcWnEmfRnMquW8KzXRlTFeuHGSNzGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTHsn4Nj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIvzaBwk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C47E606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C47E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTHsn4Nj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIvzaBwk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtAWk3633297
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=; b=OTHsn4NjfPTM5Vt9
	xehKmezvMndttd7xwGa/LJNoh2qvOi+61l36Zrc/8PA0N6YDc1mLzaSxIzZscCOG
	DxzKla8lawAlZzpOE1D//DgzLpTdfavmybYvVmN7rGzK50lQGCklIdCUq0XKFhkY
	w+EBoHK3SdbR3sQwwOMQ/p/LPJETxVow4ar+lgdF3iIuunmwKcDq73N17BnEUHXF
	ZwlUCoVZzI7AaA7S+S2VfSBNgzTi/LyguESnZTp5NC1T0HpYgipPF5GY1GHYq70x
	PaXM/U2LH7/g/Rt8LQ8yHe/4XVp9EWAAMk7sDlr8XnR1OQhEdNi9lHmu8qzJP7Ug
	FRADVw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0knm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:54:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99062cbb331so37660241.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019259; x=1793624059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=;
        b=HIvzaBwkjxCp9ldTvNgCNrnEgkYlWPxr9KiG6QbBTo8QcYdFln+QG4hCd4KjzsDBUo
         JqSIyenuF9mv1keMt+9gLf1OPSYq76zvur17jo7tZ18ODNhlQxtzotT26LKielwFa9jx
         IewYv6Zf+A2KxU59m/tocbwyZJYKio4UTPdZrVmirHt9MNeNVMRX7bjSwJzF0IxAvQzi
         7RxirAoBrsibLU+Yij5pUyt1mtNkGacD8QJBupTeRCiCU787CyubSGIApgN8Cg9MFGWe
         AnPLOrZVymDEOAmzgsHPqzaWh81omNu89jtUorpXBdPTFnCgaRayUCMwuPHyT1gSZlRy
         mPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019259; x=1793624059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=;
        b=N7IGVqVeASIfEJ01374xdWKkORF0n5ClrrovLk8sM3DM7CWTsGFu/abW8DXuFXNYRu
         A+i8us8Q9hs/aGHTIV3jlpfPZfQSeYPqSy/STeWbLRe+CEVhZ9IYdxSxnRFOiKjxZnZ/
         PAiQkcgFhvLe4+AzkgJKMhHPlhhVrbe7U5pMbVbo1KVCOt98IhtFTwSoPAAIOE2sh5GJ
         icpoO3OJcOp1KJdRIKqnS2UL08R5F4HrWMf+QKOpZrnKzSpCoR0Rs0YnP9wJjmyL8BGP
         7zOkEVbqJQrmUR+hhye97OlDa0X+952EIKKesz2VEVpB3agYNh2zesDjbnFAdY+xgAAw
         bmFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqA9Y4jTn3fXIi5lUZsz2tvUBVwTNiKko1Xat5FGcMEh1v4S3IeBHMkS9jhUQNaB/6kDcxGGHQH1gio40=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjf5Xfbu71JH2UvzeG1YyL7snl28/t835AJpALPibHc2GdMjQy
	BSIm4pbT7lwIAgS1ug++wT5HfUcK3M8/XXRNZQ1/cmNX6YS2KzdyQbQbSlhrQ38U4au7dcx/6WV
	dCs4O7rwE3JcCeCWOYOHPJBABNWX1oHvuYsI0DNMD2uil29XlmoeTktJvTSq8Gz+svlI=
X-Gm-Gg: AYBFou0hClgfKKpGlr2gX+jYxNfXHIkk7nQ+7FxumY3NaUcasYQQSzLW0HI37k4nWES
	J56sUOKYT3fYSyVX7pQcY6SIfy2bvBfhSXQsXxhQxE/2UnlFC8hlANP3yvMlRjoG5UyUkQogKrI
	Z3KV+vSvVcBzCOlouWVi/R9aw20TBOCc26kpKn6Cof63mIPumcboelJ9uA1RAs+W/DaaTt3r39a
	l55WS5UboY2LoT60+6Xc5W/xWaXWHRqXJHceXGIiOpgb00AjTspqN00RAdaH7yt2EDcGgizkFp/
	QE5K5yCv3FJjFhHqTvRGpYXf5zaeQnHG/LRQNHMvCsj0ZkHBk/tf7mD1zOAiSKVVvWh4wb5Wv/z
	j2bDu0meY8tDxHGQ/iU49EA==
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1732299e0c.0.1793019259324;
        Mon, 26 Oct 2026 05:54:19 -0700 (PDT)
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1732281e0c.0.1793019258872;
        Mon, 26 Oct 2026 05:54:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm313722366b.81.2026.10.26.05.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:54:17 -0700 (PDT)
Message-ID: <d26e1458-f506-4ce4-8734-ba1da012c91c@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:54:16 +0100
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
Subject: Re: [PATCH v5] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>
References: <20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX77okUDjgy66a
 b+KQiQESA8GZfhcc5LrBLEB+mG4V2OvyTQwNs1cKkzB7ZZpXP4hixAlQkn7P1t+lel/10lR/YRZ
 eRVuqoF3qDiJ7eRIgmjp1Uar8Zh+MPI=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf4d7c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3IpUgaB4rvrcq5R6IkAA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: qgnwQT2cHIRipB69RYSN4-cSnEkZR6Cb
X-Proofpoint-ORIG-GUID: qgnwQT2cHIRipB69RYSN4-cSnEkZR6Cb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfXzc6m+VumGSIe
 7vZE4RuSCcqqsybcCGYEathUN8mbAE1KvDLNeGFfNBwFRHIDLaHvzdn+iXnZDsRtdt6jtU4xTFY
 4SjzViZYUrAYgHGSOgQU+bkfYgVY1umyvDk1mCbxzqt7CjOL3aroGCzHb4jAobkOEUPuqoS9cEN
 cHOCl3EU+Ofsw8MZtImtNQQmYpvDH2X6EXaVenydIfugwHdu5rZSNK6evKKRm9tAXjkl2lc1qsr
 55LzUzVAg+SFycDirGjxeP0ARHraqaQcCC2uZwPwkzPK4SKNoperMtTkoYnfOhCjoWe3hCZTSao
 BbPTCGEonpACS9MrF2ozPYg5mhDs4soXOf00PnonQC6AWiMpXBrPRx3eqSFPjQHV3cJzdH8DN4T
 KjW6J2hDfUtaXCKHZ6y/2jrwC9f0XjwXF2vs1H0KWYaT5/0L9E1dcOoNy48DMor588M2gwP1Uex
 vflOZWLzjBkgR+HMqdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260051

On 10/24/26 11:21 AM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with
> support for:

[...]

> +		vdd_cx_wlan:
> +		vreg_l9a_0p8: ldo9 {

The first label here is unused

[...]

> +		};
> +
> +
> +		vreg_l4c_1p8: ldo4 {

Stray double \n above

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

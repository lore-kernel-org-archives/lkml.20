Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234820;
	b=K07PcU27lv563Il0s0nxrxCQN0ZKe1x74SxrhpLbCnvbdYXfH5cAs9jQvL+iQiFTjNf4
	 kxoSJI88fY0fOyVY4TVTlS/UhFsKf6PknqxUqR2QbzbrJAubtPWFHuWWwJOA4NuAR1aPe
	 BoYv5Y+ExHyCtYsPD4ZH0/90OH/2XMkGQy6ckuXeDF8C3IRA22zWD9rnMLQCdY9usTVGs
	 Ud/qIroO39ov4DbV94FcoS8x9hTTjs2R9mZqAGWPR/sJcfQLLpqzHiI5jDKQrJQ+30zx0
	 MEmYehhV+Vp2e/Q+kxVY3nNlGa43NbgfP1oqwu2rfx4nE6IwaUz5dbvFiCge98M1ryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
	b=jHSN73aM1PbwbgIOlGYWsMDViTv6aXk3ann4zcTbRNYyojJY6dnCqK4YMJztQ2KKEXXl
	 XydY2nnlXtby0tAXEeLEZ7LIXfyJwVJaFKgetV7p6afE8Isl4i9lOSgZYLE15YU9cFwQ6
	 3aDIxsllo6U8v5ZSwOLaQGjzAxSWysPkXL5S9/dO4Cv93MmJWHmj83PlYpF/IfDRRmEci
	 3bd9JnjTYuVTsb9E6j/eGrvX1GTnYUr1ScGZar/vk4kRc4JMUa6DvG66zrRkvN+fgXvSx
	 mV5U/gsuC5no50mM8paWJnaoQ8IFAO2RZVUVb/ndEpISeZiBAmelSEtiTblguVhRx9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA+1xtTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz6eHkuD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA20606D803
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA20606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA+1xtTA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz6eHkuD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF2SU022633
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=; b=LA+1xtTAJJxIVMht
	l/U6UzdQc712+X62A61o2OXNbrxt9nseabB8UoVTwbxmp2DMA+narMHLKqgv21S3
	H+GcaS+du0uQSGd8cprO9d+g/ncMNIl00x6a/XuBgWAZUKFNBB+HOeMuHJ7l0vQm
	FIr5Ow9i+7mPHkze15zhbAlB8QX9ayArzdnIvv74RZXkGSuPi1cVA2vI6woR8Et2
	jC7ZcbY4VR5TfD0Kx6obAkKlNWa15YSvRHVOHS8HSNLcTMctoNhtiL4jK38usNQo
	VRJIkytT3TCG5ndGKreTXgrY7CzyBubG/EUeRN9lH9RpYfhYaOYRiI0XiVdWHKf6
	j6oppQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgqxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:33:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb990c283aso613629a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234818; x=1794839618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
        b=Bz6eHkuDq8tGabsrhSqRKUJIkC1XDtE7VUpdoBYKg4bt2LPTn2/WAl2pKXYa5GGYsZ
         GHEZg8ue4J+Zd1m3kmvi1b4Sb1jzz6x08U/ayifSZ/5z0KdfHF/Mkzb6q7DmMsZkP0mr
         zrQ1JWMNRWQVWprnkiZ/4UgXlbOUrNzMH6p+RlQ4qBfgS1gGc/YVZup9HNB+NvYL2XHE
         9oCNrTBsCwilrN1l6jXMQIxkb3D0mkp5OwBDfKKuqKjO51O9+uIzGIscX0fy2ct4RbVc
         l78b2NfYZjStk+QUJ/Ai0bZxF6fhO/ISEqi/MDhKDVSBhKcOdZ0p0U19rKwSHYxkIWPn
         1nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234818; x=1794839618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
        b=bQ/NI8m/59Rea/cvbqEQtmnU98szM/AYs+jzxnBfvtv4QasZyIHoyEC9kglJtqnH4S
         ylrpUOfr2rQeZDLXp/qlWViao6i5n51dP3we+8Ou8ZKr1AtwI31LZAaIlpysfGnw6E/7
         43esHX/MItWuL2z1Zt3gIJKKUbeirfNgJwsYsXORI6d1x8Bt811OdiNI1vJpb2kt3qJO
         qIokrmIfthxkjGKNRWIOV2udxaXYCCUeFeLWyUhwNscRlFkoFM8RVtTHbWH+2heiBc0P
         bU0quk+6uEnCpd7rk7A1l7Q6dpSkBcA1drFAGs5LVFz9YO2AIU1s+tJPcH4Tplw0vmVM
         JmWQ==
X-Forwarded-Encrypted: i=1; AL+hErH0tLC72+z8Yl7L58vwqqJ/Fxl6dFQrIqPH17cb/Bjek1oVz9FWwBBiBfHzI2KGwyQFdomjq+MgbHmTX0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wW7dILvEU4tHSlpVBg/LyNM/jKKGqOZfOnDxdQNeJ6izCVIJZ
	GcNy8qXkipqvMjo54VA4OVXlcdvHrbjOitNCahQ34MfWBg/ZvuazXLCifm00OhhXMvPKmwRtGnb
	Ex9bK4b7BatdzNm5ae9kGSOSretKEI0MoVMda/LpKYAF2QgZP+6OnfIw6puf2lIko+wIcT51Mrm
	Y=
X-Gm-Gg: AYBFou0jw+L06TMImkxNqPP48flPOVOT3nIXFeRrKXOvYUR5Y7aaQsXKCfm7YY3YFze
	fwQodSLZ6oCfYK1SEhwmJiHocVTP7EWLRxE14dmjdkngyxtN/W+kWAW1wDDxGYOGtUApBN+VUKa
	MowVvZBQurVYzqrrmglnLugAz3zVj9qfZquumKNZevpFl+s7X+BwiIirJtJcr4su6C8gd0+FG0f
	mIUcxDJDWJarcn1Ufqm5lKRQt2aOHSDf61kI89gTltpAN4Cg7dbVZ6gnvTwiZRBN6kHpkxLzdlf
	nzRDUEUFyLvhoqjyvsx6G94UGSszyrgrywiN7wVWT2e2Dz/Ian53NdY5Zf+yAdCoj5U2gKAeE4Q
	RHHxbjfTLzVdsK1vLWKp2Z4oLwv+Qw58PP7ApLO+vmeYAlKThuA7PrpnXh0xtosF11fRRELuBeG
	Q+dg==
X-Received: by 2002:a05:6a21:71cb:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-3eed2024dbemr2536985637.16.1794234817558;
        Mon, 09 Nov 2026 06:33:37 -0800 (PST)
X-Received: by 2002:a05:6a21:71cb:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-3eed2024dbemr2536968637.16.1794234817107;
        Mon, 09 Nov 2026 06:33:37 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b648e54de9sm1408883b3a.14.2026.11.09.06.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:33:36 -0800 (PST)
Message-ID: <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 20:03:29 +0530
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
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261109-wandering-miraculous-mamba-0cf21a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX+MEj3voaxNrU
 zsx7ErhFwDKq9Qg5DUgMjR1tyoXbgpaPXREhk5bDEM9+mizTgSkpxez9f7XzQOa0OnWqIQKpcjQ
 edH5ngiKU2NcXCU25R5Z1hQH3V4vLZA=
X-Proofpoint-GUID: xZ8Qynde1czRRXDEIZGBp3Mc27MP_57r
X-Proofpoint-ORIG-GUID: xZ8Qynde1czRRXDEIZGBp3Mc27MP_57r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX83lZv6RNeiZI
 1M9S2CtuxuhZ3DsRT82cztf5VewQkNWNAUG2/NXkRLikpuPtE6hhdbQdshbFw2oC5KRzd0PxYYM
 mQrIurNPiOC9kgWFKNuE+pavNhsvZeBjx3b4N0jCYxmOAe1qnTpkCXpk8zbsTGn4oXiI8RQ3nI9
 Av5vwfhtqstzQNTxnhV/+YacSxzogTpIMXpgsjIdP+HKQizTDtEOzTarHW+HXVap0td+TYtO60h
 hBesWnONfu+bMXhad2CBpd3iK4J9V93cMemKlxVH2wKUtBFCfTigNDXoRkAl658R7WLi3a550iP
 cVeb2nf4ocwkc7+8GLWpqb74kukW1iBr4bpsietSpbbbndlUmWmkDb2DVPtRuQf4mOxlFhsEkvA
 VvKW+hxlcjgQqmauMzT6N/f5psy+tgFmGhB9lWoH0fuTvOYo+VkJbdkrK2O3QD5+E2oWdYcHISk
 2f3UJLAQIWgQIVmwguA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d9c2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=lXLgDm0nUj_2s8HzTMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057



On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>> specifiers. Its value, 9, matches the GENI serial engine firmware
>> protocol ID for QSPI.
> 
> What is GENI serial engine firmware? How does the Linux rely on it that
> we add bindings for it?

Hi Krzysztof,
GENI firmware runs on the serial engine’s programmable sequencers and 
implements protocols such as SPI and QSPI. Linux configures the engine 
and submits transfers to it.
The existing GPI DMA specifier includes a client protocol ID. Linux 
programs this ID into the DMA channel and selects the corresponding 
descriptor format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to 
that interface.
I will clarify this in the commit description in V2.

Thanks,
JyothiKumar>
> Best regards,
> Krzysztof


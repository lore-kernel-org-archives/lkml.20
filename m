Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADF54DBD98
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449516; cv=none; b=n+CN1RzVs+37ApV1LaH2838m849MQt8oiyjOv2iYLDBuRBiCPz9lngip4JHyeSpNEn2Bem9MOtLWKsHMRsTk3sH5pDMt2fIbtxLshiz/5SKt5bZRN5BNOYK6CkUL5COJCfZUCWCradWZfNki9RJIjR6zrVCwVWzqRoR9PJ+8Fpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449516; c=relaxed/simple;
	bh=5uzNDy7TqOIsnMifKUBCd6yHdFj8TpZZ1Usplw3pKow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mI7qsJBu3Jo6V/dp0qxQh3rC9imdgtT5rayW+y+jUel17urV/Lx3TBjNo3B49LehvC0oI8WoO5+v41mLWRaRvjwAT1qlEKqgZtVV6cNn/HPvgEa31CpQmNuBpY2o/latlUoWhkh1ZqnnytVBY36DoWpdep/xJlVX2FTWcKVhQ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNDK1sS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KW6pejZI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNDK1sS8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KW6pejZI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DB7Aq3580114
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndIsPBfnQyXwgYz9iaRnRCca0ilHBDDADJqxAyoUAvE=; b=NNDK1sS8EU7+fuHi
	Z47VrSMumg08C0vbtN2CdVFrp1d5hbQcCjYgAT3KzH4X89uHJYCuJwOfurfObbC6
	UZHTPnqIQbItDcYvVQP8Kd1mLu3Jjzsc6IfdY76HiWM1UHSVnoWF5wsYGH6j/s0w
	kxlb+xCdRd5RBX5COlqB7uROKlQ6U1APCVFvQb9EEIJJcT6jsmbahD258WmuGrkg
	2qro2av21vsT4AVmhMluz2LLKp6zqL3g11cALp7xqUVLLuW5tJckKspauTG1UDQo
	B7b5UW9CbdbyXSvMvIAmLoVZAJP9eu2R4yIX5Nr/SHORTrBtr3CLKmXT6jI4YIFB
	kmDxow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d11p4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:31:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so68261645ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449513; x=1789054313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndIsPBfnQyXwgYz9iaRnRCca0ilHBDDADJqxAyoUAvE=;
        b=KW6pejZIG9L2AqYOMBNOWo2+CEKKlXLie7X1ZZMVzvvt4v8IR6FtT/b37Cp/SEsyNT
         0DEa72jMUaaH4mLsbSVy1McZomgIPQwCck/GM/DfyPcpMy/xv5YvryWxDNuikrYyVYW9
         dRgfnIUoxkIXNxP9Z/nFXGSC/gNbnUAybtFKAbIzfhNP8/kOqEe9gh9rBPkDUh25HBDZ
         dTsT2gUT5tH1B8HWvUNMbelSJHjwkd629FiPch+uriyiwiQgTdbez+6ZuRmDKYLaYd2h
         YYIZ83zoTiuq8sFpEYd1HcF8RsjHaQarVe6yRZpyapJsWzSczBNrEKCYcfjpaVqjVe4X
         eAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449513; x=1789054313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndIsPBfnQyXwgYz9iaRnRCca0ilHBDDADJqxAyoUAvE=;
        b=WYrrIMsHhVsRMGmVFiy0xc7fU9jRwrH5992cXIxNznEidiACfVC+Zdk17kqU/hI1gR
         gC34yI8FJO5QUhvjXMf/2YmW+2HBuZ4vJwlYMjcgs/Z1/nE/HL0m7D8v4imKjcm1tW17
         ycVqucaX5PVmgKaNlHfzitjYKe/TZDMlWMFoCKtzBvr4GfeYvNzCKF3HQZ/1JlQXZDFh
         JkolzYJEf2uPwFQzKAw3wYyBpFi++xG3+Dnwt0iwuzRsU8Efki4SXbl172CZb24zH++r
         cOsMxkIdUtOSE0APJtuy52lJw//yaaVQtbAjPh7gfZ7w+asJpvpkGodfO9LSubl/p13f
         PFoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVOqkU20ot4JzPzG/ZvGySz+W9XZ+kzS95Q862081MkDIhWsAXgbx/X5RjTgiyPEfdQxuqwdd6NPVmCmY=@vger.kernel.org
X-Gm-Message-State: AFuF++m1E2GFhPNG3QJ5YPZz/EpF358uffSHh3o7XcvCpjU8dt31Epav
	+zD+x2ccKdGIc80JQJ8WuwvB8+y6c2BL/TLGYXrdXLYMJCvTlVlGZreyi6WOMo/2XxoDMoxSJhu
	DSDyAxr0uGl6V2TTiFnQURrPzdVYUYQ+M4NyMc/we+EnKpYqpTRHCjKK3KVPQPs6Qonc=
X-Gm-Gg: AYBFou2HorZJ4ruj4g5JYIdqOxiofHurXcrJFnMANqkPmS1oRALTY6MQv4RHIxmlfhR
	2gA4PPk2ykZ3Zk0Sdb3lGqCC52aM6iBHXeU4xsaXOWQCzIpg4iI8PzG1MUgwvH9Jd17QIgPvHiC
	3DAF+nc39FaRBTnspuhQuclkIRDCLUrn+veU3teYVzv0XEOl77oSwCckTxyqAylnChpWbyBhWOn
	EKQ1cPAu71puIEBvTbfRmRfzsQcUq18tPBqKqJjes2rJlWi63I2RtaqN89pkOcF1Ra4YfGhYJhl
	GQpq58RMDjQHSw3G6LEjfRCRbb3+yIWOdiB0dDgaSGJhF04Kxf6LPEh14zZbkzwVDTXvozBmJb9
	cilumV2TClcCdUTSsgUhMtVnkDumPi+pOrTjOcaMLx+DKfrkd1zgQM1g3hjROqV0G
X-Received: by 2002:a17:903:1aad:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2db106d909emr7514195ad.12.1788449512683;
        Thu, 03 Sep 2026 08:31:52 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2db106d909emr7513075ad.12.1788449512195;
        Thu, 03 Sep 2026 08:31:52 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d7c2sm11955965ad.29.2026.09.03.08.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:31:51 -0700 (PDT)
Message-ID: <d3d418e6-ab18-4a2a-9018-4eb961f9731c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:31:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
 <mdfw522n23py36txjtsesi3pkfhqljlkrabturbjumsdkeg5eg@h62ob3bxsa3b>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <mdfw522n23py36txjtsesi3pkfhqljlkrabturbjumsdkeg5eg@h62ob3bxsa3b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfX5PUHaJkSMeah
 qEngA4/qSnuOd9eRpg42aQrALk37keKQbV+qW8tlC1j5qUd8pyiHb0MImEY9CSpBUx+yc1OQ+qn
 Jx8+QIcXR7eJhANGBOo5kE+qAU60MO2gx1ezkf0pNM6igTXoZIsrHx0X0gBirl26h5nJYU2jskn
 Zo9qTxHTjZ/pN/he9B68yt620SDTphT2G/fnbOV4Ae9J3gRMvHODGPifI1KdKk6cPrtA/7UBDzJ
 uLlL7TgNvf3UOvd5Tyvlhcpxo16F0Wg0sJh2e82x9RFWKbHEQp22erPCBePMVA57xS/6AhUQ8xZ
 VzrdZTDj2VYcwOpMd/oepEBiHOdug0Lo9M5y3d68sfR2CbX088DGidSjU78tKjvg8BNsw+AsFay
 u+HgDFS6Oc8dh4OMdXARAGW3sSA8sIvUBdRHkitE9yR4KtWxnQTK6bn+A0eqyIi19rRQ8RjQ/Lc
 5MyCA1ldOVyyBGvZPtw==
X-Proofpoint-ORIG-GUID: KHMDi9HNt4jiJyZztnQ5t1pnHMnYVIHO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfXxC0CbCSWeFYU
 2GFLccA0Tj5/4mwGJmPX6s6z1/xRMpfkmmtsWlfDT16yw71l1FK3fWR+BRhZP5T/LZ+UXFaOAEw
 Be5qVo3C8GKCJgZsWb3X4i5MVTuaoTE=
X-Proofpoint-GUID: KHMDi9HNt4jiJyZztnQ5t1pnHMnYVIHO
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a9992e9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bLGlZ6Hhwxh5CS4LpkgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030135



On 9/3/2026 9:08 PM, Abel Vesa wrote:
> On 26-08-14 05:48:18, Luo Jie wrote:
>> The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
>> provides the raw reference clock to the SoC-integrated Ethernet PHY
>> (EPHY), which supports up to 2.5G link speed. The output frequency is
>> selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
>> CMN_PLL_PON_CONFIG register:
>>
>> - 0: 125 MHz   - for 1G/100M/10M link speed
>> - 1: 312.5 MHz - for 2.5G link speed
>>
>> Parent it on cmn_pll_div2, like the rest of IPQ5210's output clocks,
>> for clock-tree consistency. This is functionally identical: the
>> output rate is purely register-bit-selected and never depends on the
>> parent rate.
> 
> So it is not a slice of the cmn_pll_div2 then. What is the actual source
> of it then, in HW?

Thanks for pointing this out. The wording is confusing. The EPHY-RAW
clock is sourced from the CMN PLL /2 path in hardware, but its output
rate is selected by the PLL/MUX logic controlled by
CMN_PLL_GEPHY_312P5M_125M_SEL.

I will drop the “never depends on the parent rate” wording to avoid
implying that it is not sourced from cmn_pll_div2.

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592C13F1072
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771470; cv=none; b=kjmDxF7FQl4c6Z+tzw0bS/FCKXcqcEfwjihAAF3gq2SWEcWBbRCTZVhwG6ylgSe8xG+/Jt2OXaStoUwW71IHdax1gmu4PTKpH1gTObxXoC8qTcg+pQ0GLDFNvUP/C+Be2fygiYEATD/rKpgFpZ/tpr/rLVQwlRYuXDv1AezB7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771470; c=relaxed/simple;
	bh=4aJo18FHRehxOaJ9Xrz/eMPUjHWI1EAd5TrqCQro/uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLb5q258t0MS93hdgtJRm7zYUZBuARefzB++c58fMkEXJap3+v9151RAg1etBmAmt7yOXtBaL+0P21mhDvwxdnoRulT2hPmo59k5WDYtNnR2mHxLktCEeglS5jeFr0Gqtdj2gyvFkfmFRefQXo+nLb/fKjj1RMJKI46PkwTDeqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VodQwFKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ss15mC57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VodQwFKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ss15mC57"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6878ZOo82877844
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep9eaOqym9ehNhI9a6w20x6DXgxHjQXBK+pWd1Nl2xk=; b=VodQwFKP0QTeSldL
	/q0gfonYuwP0mM5BVL0owLZY48r90M3/qnfaT/q4RQUm/a13DtEYF0PdSjPcT7It
	zz37vtV+WQ6HMYcECE1eIks/8Lje9LG+01UUFr87TPWg/HbwqesGR/u6P1puuWH0
	sMn11nWQoHBrhfZNSDJdV/tvl+taG60Ao3eWx5xodyCME73m0gdw+Qp82iE6WV8H
	0/szOMJTTgP9E3QNUWspU1OhmuQtJsdPoPcWOoxdt4EG/MUmrJ/amcNMokNuXT2H
	4soZcBsfXZ+K11BMSeRhl3bFLO/SYKTu+Qzj7dLvSJjyUIdZrFNgTpRbLlHEW7Pr
	XUYmEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw2030m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:57:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cc288296fso7161056d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771466; x=1789376266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ep9eaOqym9ehNhI9a6w20x6DXgxHjQXBK+pWd1Nl2xk=;
        b=Ss15mC57QqhGUF0wLGi88JFttcx9TpFfMkaiveoi6IrVtnuNTROp6IT6Xsv/uOdIaW
         pF8PO+ikKb2qSYtImJJj8BMWqVdV7m55e2+zvAiDpLYJ9qGM30/dlqZUOW2oOQQFY3EE
         dkFXCtErlznlPwEC5gumhocKjeuABvh37KJIO1Aun7JzRJOD4yGSdyI7aLC9TcRFTCRg
         4j2VbUTp978922kHV3sqc9gDQQY5NjJoUPX0VyiKck7rAxRXGMM5vl0C4heppKsofT+d
         zEVMK8gbMrXEq+K6VkARup8tZgjbSNHgYM0kucoe5YXy7rOo4WLdNzuumpkPfxuUBsb9
         ba9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771466; x=1789376266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ep9eaOqym9ehNhI9a6w20x6DXgxHjQXBK+pWd1Nl2xk=;
        b=lajzoxWtxXrd7C2qp42K8Ixe1EDAMSyw8GtmQfQmoMPh6c+K6T0A5wqhLfxEPbqGH5
         D2UCeX2B0v5xc9fwRPz/kqrDSfYn4u3i38qKXw1lvOqhpq4bqTNhXswI9/j+XkLVdmwj
         WRJGMjCtIgBD22rLSEzntEIm1ExliigfgNkdDmvmKTvfZyqIZNn5IruBqyTaXNZQZA6R
         sjl4dHMATERCkkS7V10n/cKvgE6Xfw+KMc/DGkXjLj2x+S7uOY4tRe+/bi/YWKOryflz
         SAtgQ+Qc8AozULzRGp/YnmvdCzo9A5Wk+FPYTuZmAVaS1quastV3pCeefnhhot/PydaU
         DA9g==
X-Forwarded-Encrypted: i=1; AKwUvBxd67lSV+adFqj3O2qmdk3Sh4AF9u57lAzu0VDWHeSEUmWhFMhcHTBzDpyRoeBK1FNNNK8JpD3Td29QIMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mJdYrRRyl1Hhmr59UEjs4kC0RhC7rzLV9Ecj/ZH9XCl40O6PIn
	WYyE02oznli5CtsNRJKVYQEHbTS7V5+/Rcv5SagPYfvphI0eiiz0K6gN7PFJ3OZyjuMqDglkagt
	9gVjBGi7DIqlKn32U+boARg8OTaP2IEZoTbz2aBtKVwKNDRZjUvQBx3QRmeJsNw/Q7Ug=
X-Gm-Gg: AYBFou1ydg37QSRs0PPA0f5eEZbrCXU1bgD4cKmdowH/NxzldnvrCvGZUbO+bBJj6Sz
	HMPI5RucchhbNXnKBcjLSWTN1JC3ik8Da4FNhZs5AkEo/Tp6f6RiFp/97cexWnxqibZ7tsUyU3X
	9H1TS2iBr5gyEkjAubyi4or1we6wRfGZ3a4f890Ch3ps8px7aPEf2runx9HPtdVQoa+5ss1JoXT
	j8cZRqjbn57R69Esthy+2uhzAPNQ6Wn9BeiwSx4IYJJS4jzoT/VIK9BIZ1ek5WS44HA4+aZcf1U
	i8uE8c/1aw0/08kjtCAujkjof9oZNNI53WKG6l7XkqMboauSEDuOKS4t1ES+IY6pd8ym9uz1lx5
	X9A8hJts4NE1P0nFOM/4wbw==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160798985a.2.1788771465883;
        Mon, 07 Sep 2026 01:57:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160797085a.2.1788771465425;
        Mon, 07 Sep 2026 01:57:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8ba1sm428317366b.22.2026.09.07.01.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:57:44 -0700 (PDT)
Message-ID: <a8149216-536a-44c1-a981-54ec169f07c6@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:57:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dN7g_kZrNTpCSLO3NyB0hCJgHHXC48eQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfXyzIZj+Lkyy8+
 9+zlHspTBy78821m/CvA62q7noB0FzRY5yxYIbNi79QGcPxHGOSrX9YZSizOls51+XCiCxXqWvI
 UXDlbEsFNqylEbEbv/yYMeRaXjz8cBM=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9e7c8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=-LXEPugmIqj59De_QcgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfX2ukZ69qncZqf
 Ojob+yM3QQiGEwtnKuIkosJPBAI8Z2e+vSZcUx76HrRkAoc2jdxHgWWiHtfsvNDk7LqRO2N2jTW
 LPWoKxHj6/XJzfhA+MdmwtSrESM7qGtefJEen5OHwKz8GuTxKej8KisR5za9FpDTykIWhlWH8EQ
 hiNcnxcGbc+c3i1A4Y2iEFfdxTFnZxnMJy9+81p6dS2kwEezJ05iqkpt5RQ9Aup2dcLbbrt6522
 Tcq+UMQOLO4HQMyr9mb+u5szcBvzDQ4uKCbTTYAw0OrfBI0ccWUw0WMeO4IOhNkBzBmH551QsOA
 2i7o10SgBCyBiJW2K0Ypx9+dz+53PYqPt9d7Vbr2+rVW9vvFqo3wCzzx/EdVWxtpT49WqnRvNPx
 lwz5WJ2u3D9Jzub6MHjV6JVvB12mMXwc7Cr8sju9aWj22HOaYn15OWW8Gs9y7IE8tU6AKGvg56o
 WwvgXZSgE6B6ftsBpJw==
X-Proofpoint-GUID: dN7g_kZrNTpCSLO3NyB0hCJgHHXC48eQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070097

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
> chassis, different silicon. Stubble and the DTB loader need distinct
> compatibles.
> 
> This series splits the board description into
> x1-lenovo-ideacentre-mini-01q8x10.dtsi and adds thin leaves. Each SKU
> keeps lenovo,ideacentre-mini-01q8x10 as fallback:
> 
>   lenovo,hamoa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
>   qcom,x1e80100
> 
>   lenovo,purwa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
>   qcom,x1p42100
> 
> No qcom_scm change; the fallback is already on the allowlist.
> 
> The remaining patches fix the common DTSI for both boxes:
> 
> - Build the Hamoa EL2 DTB like the other Hamoa boards.
> - Second M.2 3V3 is PMC8380_3 GPIO5, not TLMM18. A 2 s startup delay
>   is required or pcie3 fails to probe. always-on is a hack until there
>   is a real M.2 power sequencer.
> - sound-name-prefix on the three DP ports. Enable lpass_vamacro: no
>   onboard mics, but it provides fsgen for tx_macro and rx_macro.
> - usb_mp port 1 is not populated (no PTN3222 @ 0x4f). USB-C is
>   usb_1_ss0; rear Type-A is usb_mp port 0 behind a Genesys hub.
> 
> The Genesys hub is left undescribed.
> 
> UCM [1] and AudioReach [2] topology for these devices are online, too.
> 
> Tested on:
> - IdeaCentre Mini 01Q8X10, Purwa (X1-26-100), 91B6

+Mostafa - is that the board you previously poked at?

Konrad

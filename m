Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1294A64D9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362641; cv=none; b=NPM6fhnlaBbMztnApSdV6UiNjgmt1fCralgbuC/VbWPTIXDa/KU63haHcc4C/8BzRG3VUCm/5K3vS0KXz9lHSEJfIrEuw4wzMg0VEOPydxYTE9la9zcidhJNZuDa2aOvL8T35hoqGX+GAbZCTnoFipLwSQaWv7qNOKWQ1HkZbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362641; c=relaxed/simple;
	bh=8rWbjt+EQPsKzbgQAVbw9WUeXQ1yiJbxGJ9Z6dMVE6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aI3DTqFYvcFi70ByEzAIWXiaIy05RYbjH8sIu19AGniZzgBn8ANVR/uNEx2OVHM5YBelP2tqiZgqudKf2jTR4YSUnx/YXoRQAB2DrnyKciZ70/qvJuBmNgbCH+HWHJvl1Je1bi4ext8pD/x+9wGOmUviL8hEXNDblLzA5zYVfNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUgOTikM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJkTx4Pc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUgOTikM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJkTx4Pc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRHsM2001810
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pn82GJB5qONT2GX4BsYpoqZwIsSErz5P5FOPwWDCQPk=; b=RUgOTikM0CAKzdok
	/97wMjukIO92knilu+DTO1uuPk5rd8gxIJ4ejQ5wlTYhThJ40FLK+UpRKjmQQBh5
	APK14MUobNCnNFl+/B+EzyAvt9ht2v6TWJNdBPYfwwvadwthdHRYA3dGLPTojxgq
	lsVnQvelFlhblSWH7VAuf49petbyOzAlSgvtQRfqMC15wwVkU4jQCsNYKvcUh9yP
	/MOHnawk17Mnd6DWF4RIPD0oS73EGro2K/2UdosmntrQty/8WH3oVpod6aaTr5lc
	6rajkjgBUG7ky2HkBExZ5clbYg4m7Kjts2jjzWXBd22Feus5ROjG15Cqo0xwrQFg
	FnOenA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy1fry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:23:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso44975137.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788362636; x=1788967436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pn82GJB5qONT2GX4BsYpoqZwIsSErz5P5FOPwWDCQPk=;
        b=YJkTx4PcjTK+E5m9xPmjxspKlppRTuG/y00tZktyiNLW/caBYF1+oCbqVu98MQGZEY
         Wp9JaCBVctMRtAeBtDuoo7AWEx+wvWdmGDi3V48C0xWwHEIqDnYsUuSCOF+zhgQKAwsk
         q0vjd6+iVIRTYaJy9wOyEYZTzol0ZadRZY1HMTGU+qCP8kOwoZcyuBVzerdpBh6Bk3dv
         fMKaSim3YkH7tMas2uDFMHNvNP7Et0u+2u4ecz8fngofXHt7+mhn9PA5zNHqoMWRLRAQ
         hoIzO3f71zbOAX6cCeJptbQcw22TC8SSj4cBmQUpkNFSGYpa5HOtsA0ravZOcBb5r6Gp
         cvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362636; x=1788967436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pn82GJB5qONT2GX4BsYpoqZwIsSErz5P5FOPwWDCQPk=;
        b=C1UMdf+aaWwhAzrj8XaXqNOgnjI1uojWzplIqamOaAg53+c5EY5hCpOFBb9FiTbj35
         KmbzuXg9HB0+6XRTbyEkw/tqMy/99FyFggvoSMgUqoPL71GBmQZguQwWzwmAV4PjrT+W
         jKUa0y61XC3tGokyfYvU4aFgpe1cwjKiKc9J0mpQftgPwuxEDYTsL5XXDkKm9t4scn16
         Fgle6yBLFrSunIov+CQISDUJIWUiCD0HVsjcPMwsfE0f9scZGJpZ3CzCWlavZ9ZNkFaF
         Q4qvIVgzbcU4KUmEIXVYmCxQY++VIRH2edRnWojWqkSqc7LppEdXVOX3lgF3H+p+sjEH
         M9QA==
X-Forwarded-Encrypted: i=1; AKwUvBy55BP5IXFadXUW1lM3KI2REvOXowfU8yu29yjP/w2EPl/xBXZaqWYpGfSZuCEv4m2vaJSHub658ZOmDTU=@vger.kernel.org
X-Gm-Message-State: AFuF++kle5hJ2lJxJHzLG6gzoycewixQtrsHV0p/x21HGQY8vj2aMlKC
	srnlBgfxBSSNustsNwvQH8QFMXRdpdnBQ5l8g1bYnwpcrtLCnxWF3DHzggU1ItGtZjpb7RUiynV
	roevz+98N/ydbD6MvAxlYb21NLX+f36NyuE5kctVi9I83yYojvEAP6zAMsrDNnqzfOknPuada9Z
	g=
X-Gm-Gg: AYBFou2p0z53S8EWaiVYka9Z1GcHCr00LSci9nOONJBnL2BlPtEzrKNU0b7tUusKE3A
	NIEXqn2PAyODCIQMHYAothAVrYA0wHY85FVGfmti7L7VNoL6YKZ5cs+OSP1jwywmYQp79ol4yXY
	KE5H2sIAU/TjP+Gp1BjbMovMB2xq3eOzkdrdhOHSK9dpqTZIncUYnbXIEuhH07TBf1brkEJTFTV
	MOpZgjbTfmfUgXDX3BbFeBAQXqV1qM9vnbvS4Isgnv2gSPG0AFAUJnMIbIZHhf+WXcRGI00GKeB
	zDf5L7G/cnlyJlVeX5ZVcM2xT5qvs889uugrNsgmkb29WwQ18q/lgtX5gsYjJ512hFW5eYyFWDH
	9PAKvn4HOXhf07f6UWuMqYA==
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr820074137.1.1788362635884;
        Wed, 02 Sep 2026 08:23:55 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr820054137.1.1788362635258;
        Wed, 02 Sep 2026 08:23:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d043e6bcsm162354566b.61.2026.09.02.08.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:23:54 -0700 (PDT)
Message-ID: <e49e4a3a-dc21-4e5e-9045-5091fc543c27@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:23:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: ipq4019: migrate USB to the
 qcom,snps-dwc3 glue
To: linux@divinehawk.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260829-ipq4019-dwc3-migration-v1-0-cc66b54ce21c@divinehawk.com>
 <20260829-ipq4019-dwc3-migration-v1-2-cc66b54ce21c@divinehawk.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-ipq4019-dwc3-migration-v1-2-cc66b54ce21c@divinehawk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a983f8c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Chss0xDGAAAA:8 a=wKNooAWPMPxZSHiCGK8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=VZ1z_dUGxXw8Qzmhq9nZ:22
X-Proofpoint-GUID: 7suUxixrvo14m1S8ybDfj-VsNS_PKM6K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfXxMeoet6XkKhh
 rqGz1NpmJqGYOEjZvurby2WKFz78UKLuDt21+HTFp4j8EiSJC/7z0dwlzvjR4piV2Mi9WfRi1r+
 aIHItkOf0DnEX2u6h2mFfe1SbVJUrO8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX78xbGHdLD+oC
 QOO0xGy2HXmggwi1gnGWxOamxVpIa5ylVciquINGm8LKQdpEgpidOi+jzGD9srK2sEsm6Fo10tX
 XgkAQKBbwETvyW77wpiX3Y46MMswZ3WL4W0D8CISapRc6+8cUcz0xmdARI/vgUYC4sXAGbw21hV
 1hGMamz8rF5ECwtpYN2YIuZRoXr/cA5CsKLdZToh5y+Tnua/VBL1z3La6iFxZ6mPGiSLLq3lY03
 lJS+conta61Ewi1nUdKOtnIuwhYZwyG4XuoRnjiYYBotDv/XUrZcf3u6MWrI0tHfttIiCLtEHDP
 Vp/8Qz9o08WuM5mi58WheeYHuuzzUBGBLqQpa5dBxpfKzFD5r7zSrz1/qRyA00rxPkq7eA9tY0W
 W6wk45Ckkj2NMrN9wg3KDP5l+5IZL+aai/WDwsMYmORZ8jeZ32IMHnNb48tLU7U418LusqTlD0U
 SkBptv5QIcYj0Infaeg==
X-Proofpoint-ORIG-GUID: 7suUxixrvo14m1S8ybDfj-VsNS_PKM6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020136

On 8/29/26 9:31 PM, Matt Eaton via B4 Relay wrote:
> From: Matt Eaton <linux@divinehawk.com>
> 
> The legacy qcom,dwc3 glue describes the DWC3 core as a child node and
> populates it with of_platform_populate(). qcom,snps-dwc3 embeds the core
> in the glue device instead, so the two nodes collapse into one and the
> unit address moves to the core base.
> 
> The QSCRATCH register block sits at a fixed 0xf8800 from the core base on
> this SoC, which is what dwc3-qcom.c already assumes, so no driver change
> is needed:
> 
>   usb3: 0x8a00000 + 0xf8800 = 0x8af8800
>   usb2: 0x6000000 + 0xf8800 = 0x60f8800
> 
> Both match the addresses the wrapper nodes used before.
> 
> The usb3_dwc label goes away with the child node, so the ap120c-ac
> override of the SS phy moves up to the parent.
> 
> Signed-off-by: Matt Eaton <linux@divinehawk.com>
> ---

I can also see:

	     usb2 | usb3
pwr_event  | 135  | 131

Konrad

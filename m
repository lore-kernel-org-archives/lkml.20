Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807D651CF76
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167256; cv=none; b=ZRZeboVmLjpSc3crIv7lH1V7J5h3enj/+rh4rZkOGERiX3M4ftcJJTQreiC0wzszT8Rc481JDpZxrSjHUjeLqDAEM8m5QUFT5wWqFJXMbVLgaupB14++tQBs6EpXhf2+xwS0emxnhQfXsFnfoaP/Gv200aVmYijnz4dkjGg1SfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167256; c=relaxed/simple;
	bh=ra3LHdA+5xvPhAgvEIGCp8+5b17NgjKWDPJ9xc6kah4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u69wBKRJeGLxj5eEeg4CyKg5dYvL8rnwQxksP+7LEviyjDOR6KzfalZYcGWHKOb9eoSftQbtgpyKLuRUwbomrUzxKcmZVIREN43g272U/iGr+o/lDGkvvHwJ3V7ppX87007AYpw5/24iMCxkpnM9K2vadXAeppucjIUtId0iV+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxz0zWpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5YKWIPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxz0zWpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5YKWIPM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbgp74145182
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XP5ekwUxYsFJiFFQNRBI2Jm5dW+Kv/6VqPxiUZsZRlY=; b=hxz0zWpN5UW8C3hG
	rYM5CjlV8Acc76LEgiPfLtQ5eYBQ+b8WHpv4IIA5+OyJlYTzCFD75ZT9go9tUQcx
	pd/TSWmGr3hSpFMVTj4cz+nQlZx9VY9oDbY40XvjjzRgnky9waw9FdWAFr7BhrIq
	tauIHX+ALbTdW7bEEuiyn1ag81n+ZjLsgjQaAjms4G6X9yWah3HG9skgFJKoDkSe
	Ojw/S6Rb7RXvEboQfwX0aAnMrDPHmOfL1jHUJfnOUdNomAZFXqrWAcu8b5w1cYC9
	rhi0WB1iUzj1PPGGtCa5E9iGpqaN/hyK9gdS/Lyec3N2ab7hI3twvZs+m/f9QtIE
	v3d6cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428ts9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:40:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d522a20dso2588841cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167252; x=1790772052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP5ekwUxYsFJiFFQNRBI2Jm5dW+Kv/6VqPxiUZsZRlY=;
        b=N5YKWIPMmU0Ha2rPiMsnLIs2G3p//iPEVBJh3Dlo5EKgiyLLiZjcVh77B77ZUHCvfi
         Fhy5jbxkMJ4I3xKI02jl+JhhrdgFQtaeKjrLFSOIQOTOrKV0UIlNHgN9d92msIyE7/g9
         wo0nmA67ruq9OULgY63KKdJflx4GQMkTzZNmiLtS7phi5soS65Upn60z0FASbUSayFGS
         nRYrZPyAIUcj1z2pMA+ReubMGnStE5laGEnWmcCRzhDoDX72G7KIbLbimnsJObXLX3y5
         Pf9t3za0Kk044XPeotyv3psOwWFtUeRmwWiWyO/PL7uy4byeix6BP2MIV561RYmhxhl5
         Ah8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167252; x=1790772052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP5ekwUxYsFJiFFQNRBI2Jm5dW+Kv/6VqPxiUZsZRlY=;
        b=P2Fo3cywyCTQHR7zeyzy9iRUDvTS8SdG1c07i9ZoeI1ucRITqMAL/ayNV7PUZXw4Up
         BZrpOgE7HN9kIoV52/iufYT+LZcINFk7KNZb9+yNmmCI8DdEZTqd0SoI6l82LmaM+2rb
         sqirqMBFbnJAOP0i5sWsbVHC8w/Lsw0lAGocqhA3yNlFLSvSFAn8Ck9wL/q5DJaHqvl3
         gmeYtt4iq3im/79mZp6mtaHfmHKyoylmfNPtRW5NaSuju410GeHIVLB9dXvh8wVJk+WK
         JcoeANGcfLAWWEgNYJQdNn6otF5JqP3CaS9XCMl8TDUgns79WtCjmQp+cuoHLBpZaHzO
         Ufzg==
X-Forwarded-Encrypted: i=1; AKwUvBxF3TbAZLQOPRw+1kwJSxm/dY+03+0yWYBiSaCAGj/UGTTvfwqx18ry8BFlTe13bYU6/nNFa4LuF+1m8eA=@vger.kernel.org
X-Gm-Message-State: AFuF++nzVdbZ9WedGotS2eu7XvwP/AOWNWSh+TwaQ9u0S7sk99WnQG4r
	N/c3us5+ufCWE/DpzgxFcUxD7NPCpv/y7NC1IRm040omQuHyLMAlqeadqpVsvMWx5qsyg6Dx2QX
	EaOjim8MWYAECFJ1z6fy86XOE1m0rLH+zmfHXqjJ+J8cWaSUeUULnBpls3eXZzgEBEXI=
X-Gm-Gg: AYBFou32CAx2kj7j+Hgky37LCf6nG+uBx857jfFxDUVGpoH/1kyGQaCEEb5t57m2Q0Z
	pgAhc39a1aXUgufkgajxSeq6FGcfUi4Gw8GTss2eFP/CrWiYuzLZS/xmueDBAsvxphCpqQ6FokL
	6i4Vxp+/r8uPatp5U98r9EJ7sFBWwvV4C100mRWWz0bwa938cr31SjOEJbOD7yFPwcEGEcpTdAR
	SkqcbahB2lifrlyvMqklgglZpc+gtbn70UmGcWB1zAfPJZWmGcWeCHa/6+JaA3Neu5xT9r/p/mM
	gMeAzTa1VOh8OVkkarpR/I8wirXSuxlwpVxxDP5zEyD8l1xE6GSinNK5dFqWIyUf2G3sQib/+uR
	IrQ5laSYRbZoEl7JfWwRf+w==
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr32719876d6.3.1790167252040;
        Wed, 23 Sep 2026 05:40:52 -0700 (PDT)
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr32719466d6.3.1790167251395;
        Wed, 23 Sep 2026 05:40:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38bc04esm1615096a12.29.2026.09.23.05.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:40:50 -0700 (PDT)
Message-ID: <79fc7d1b-98b2-455f-9a3d-d93602bb2bf8@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:40:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
 <16f1b504-c414-4072-98d3-49f60d552028@oss.qualcomm.com>
 <CAMRc=MfBGgJXhn_c6RY9qhe-JAYjcy8vZOeKgK=cSpOW1ap0zA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfBGgJXhn_c6RY9qhe-JAYjcy8vZOeKgK=cSpOW1ap0zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3c8d5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uF-LihhT4cVmO8x6xb0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WBMvLFOBvhD2SSVLvy8Dw81kozT3UOP1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX7PZ5Os+rMPJT
 ssRrqyowwZxgR2FT1UwegnizbnBqmkDi05+3IlYngK0sPqgHuvJrBdmnDghqK9YVUgd/PRAPBOU
 qttKxmjLeEBE6Lpykvtw2y4hQFLJFERJgL83WFisJ3VYunR7g1TPuYuyp+Agqmu3vTiB+3cL5av
 sMewKG3gJuZMn0puEfzG/aZzalHhX+NYM+/88zHpz7MSS+cU55OtnMmKq/lI/Qycq9kSoWT1k8W
 Oohm46bpBtEo6Us51UbKGVPfswstaWDTpXifukW11wwM7nE5zrGA9BC+RnV+a0A8zVvUwpkA7+c
 3ubbtGjP2rEEsJ1Bc1znXauE2/3vniK8MqX1YC8P2n4ezDNeBlaLNU2rvHvSknOgn97DciuKaNz
 Kbz2nevjjs5Fx9JBgu+dLuoQu7Isrg25IVhp/AZ2zjj/nL+9Zn7mD654oBJIWCUYk5Iy/SN4JC7
 NobSkgNamCyxeZUL9CA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX9KFU5fgsuFDA
 IycWF3ycrhZA6ulevXPsB2h/FvyPk8ef38LY5WgB7+FBXZSf2iFWAVGh35SY8SykAXNqyexdTSJ
 zzyBbsH8i5moPgukcCYi5j2a4oOm8IU=
X-Proofpoint-GUID: WBMvLFOBvhD2SSVLvy8Dw81kozT3UOP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230050

On 9/22/26 10:24 AM, Bartosz Golaszewski wrote:
> On Tue, 22 Sep 2026 07:34:25 +0200, Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> said:
>>
>>
>> On 9/21/2026 8:16 PM, Bartosz Golaszewski wrote:
>> [...]
>>
>>> +#include <dt-bindings/dma/qcom-gpi.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>
>>>   / {
>>> @@ -909,6 +910,28 @@ soc: soc@0 {
>>>   		dma-ranges = <0 0 0 0 0x10 0>;
>>>   		ranges = <0 0 0 0 0x10 0>;
>>>
>>> +		gpi_dma2: dma-controller@800000 {
>>> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
>>> +			reg = <0x0 0x00800000 0x0 0x60000>;
>>> +			#dma-cells = <3>;
>>> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
>>> +			dma-channels = <12>;
>>> +			dma-channel-mask = <0xfff>;
>>> +			iommus = <&apps_smmu_0 0x15b6 0x0>;
>>> +			status = "disabled";
>>
>> we should be keeping GPI node default enabled similar to common QUPv3
>> wrapper node.
>> status = "ok" for all the nodes.
>>
> 
> The pattern across Qualcomm platforms seems to disable the GPI DMA nodes at
> SoC-level and only enable them at board-level.

For no reason - the DMA engines may be reserved through TZ config,
but for the past (high) N years that hasn't been the case

Konrad

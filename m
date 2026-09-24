Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE543BDC8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239845; cv=none; b=Zy446+THwkjJndXz80x/yWcPLlvktZ8JZ/BrxmXyxVHqice3idTCNE5U2llccPRxVhVQ/Kz/9nfH7OMXDNBhm68Z/n094Zo7z+Hi2zUBVFCoUrjhP/BO8KXAWZq4J5WPzXCj1dT1fUYlvHYgWnpEz8Jmqt2/7d3SYxC4yWNZeGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239845; c=relaxed/simple;
	bh=R0+18gj6AnYazMfsiaMDRPWrwMWcw8U6uKMcltuMf8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yq8CXN14e3n6ecdtfj4KdUc4M1JVuyAbPLPuxL6MYggPk1OQ6IOWm8eEjUhD3OCiEfZFq4k2ZzeunDQ1JG4NqKWk0MVJnUpOQy5Y1+lQ2jL3vUi81t40qc0xlnBbDzSB4VAsx63WkgDvFmcgS2yNq3iNb44PMpB60u5TUfmSpIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7ni2vCJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLdroHoM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7ni2vCJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLdroHoM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eLuV1898774
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLrrPrkJ4fjcOP/Rnsi7DYLaNzI7GpqYcTDrq2fiqkQ=; b=l7ni2vCJN9YvMB07
	qLu2e3Uq9aTLmiwhr8hiDZV5fzvT1rkomp4zWKe/7HzQIYNa//uUt0Ej/iYuNRzY
	PJLmXJ1AUk+hBUEeDnlmo3QwxFSRf629dLfMyVSAHxVGHXk+pt+5TC99bQMuCUOl
	2TtX8dkMlBvevxlJAHK6SbYkchpOM6ppyhsYjP0G177PLk3d/EMn/je9Jog0UrT8
	M7t2IIWoZmLp1rySAngE1ZXxsSIO1DbYqhnAHPHXgmZiOW6Hzoo7VEPjpf2e6gv5
	PiU6Bf9ewJq5xjC0YRR/zSpObhkUmvwQFr9nr7SxY04VF1oEhMrZlnvTyFv6DSF3
	Y4QN+A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb64r9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:50:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438719cc1eso2726108c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790239838; x=1790844638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLrrPrkJ4fjcOP/Rnsi7DYLaNzI7GpqYcTDrq2fiqkQ=;
        b=YLdroHoMxM3GZPpCGelPi9/PNmojUAHW5TZzr8ukBOmMYluBEtBZQxuKe4p0E5GGT3
         ops7Fr3Pj3XepQs4bzLR23J3bANJ+Mrdxhr+fQYMC4b8hLxscbKMkPBvIWx820gNN9LX
         b7ZcsVFBtUtVykqoFbly5/PM2dee51D2VN5q6zph0hl+jfFYcOfIujqKd6VNOn9vwPPC
         3ZQgSqvTh23geSIJrQ2Cua6xFTEYcsI4N9XWh9DgtFqs8mgarKgfnJIFQjaWscZ0nbQr
         44t0ltWuB9O0DTR6XFQeLVTg1az/XVXWoiDeUPoOxjJef/03z1bmqt7vnWIx5d9NhlJL
         1UDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239838; x=1790844638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLrrPrkJ4fjcOP/Rnsi7DYLaNzI7GpqYcTDrq2fiqkQ=;
        b=0Igyjx5eLf+b6UOIBWnbz/qD4ebhSqrmyJ43gkMDGGzq3MTEJjGtwGT+VqVyhfgERP
         2bla2p5icmPSz3rSWdEChLz6HLzDEi0RUpfcZJAWptghDM/0xcwGEiYGRiBeUM9SmiAb
         ubDUtv/4UOoN9oLxIAb3HHsH76tgBb32cH1TBWmscm/+Y90A6Z/e5dx25Zj8g0lduGKm
         CuAucH2AYs1XHAaFuM6TmiTl03ARq0zLMdf4PhMx3H3TQqHLbt6TlX5/SVT1HsBjnW24
         H4EI4baexg7eMOpsCmSPrVoicNTh+vL3Jjlv+93nxUyVRpeeBga3QTUmDXbUtABwrp0b
         5H5g==
X-Forwarded-Encrypted: i=1; AKwUvBxPM0G9bOjkZm63zPUfhneJN4RtRug0o903t/s1uiSVG5a5hH8eELhhJXbbaIKV4AMc+pwlAysxcftKcZc=@vger.kernel.org
X-Gm-Message-State: AFuF++nPhgy8WHWUjGZVOeJg4CYo7QX4t7T7UrrgaHnr3JatYsu9xwPP
	VfSrwhT2LBs8udiLeSOPpQI3OKbHlHAkEsYwJXw8QzwPLIktzkA9LOe/D01HgXkbPNPxDwzCgDM
	Ayi9+4jl7ccomWdTQ67zLRcErarmvDjFCYl/e2hkzdhBdrBOkCYWkpYXUHqGwR7/Efp4=
X-Gm-Gg: AYBFou3c+kCtA3JJHKRtGfd9OTgFkaE3haFBAkypA6Xu7wJU6UldFX2LtBDiDOwO91C
	w0Upo39tIiCOexifPGzJ1WTw5msP+QBOmCsbET4kmfBNUDal7X/95GBRWWEf36bBUQ1DeoVwEwf
	WQCFoIJ9LbeCDe0/yRb1aElDno0e7PR20nEs48BCvJk7N6GkmwIn+oACCVhN3GQGFfxkVtjh1/Z
	mvvuPkZR8MwJiin53W4wd+51Ago54TlJ11fbD5fxeICrYpPEyrfvoWEVF2f+8MecPWmrMZgj9tx
	Yx58tstIIQ4voQso6zgGgUi+XB+kRnbVGH5v4aQ2LA3V16j0UDEFsBanLuE0MLslaDU5hWwIvK6
	rJqENUlbMNdzH1V9UYbaHMoqNaIlfmvJh
X-Received: by 2002:a05:701b:451a:20b0:143:2970:bc5d with SMTP id a92af1059eb24-14503fd9bd7mr1416361c88.29.1790239838289;
        Thu, 24 Sep 2026 01:50:38 -0700 (PDT)
X-Received: by 2002:a05:701b:451a:20b0:143:2970:bc5d with SMTP id a92af1059eb24-14503fd9bd7mr1416336c88.29.1790239837691;
        Thu, 24 Sep 2026 01:50:37 -0700 (PDT)
Received: from [10.217.219.38] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm11372800c88.4.2026.09.24.01.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 01:50:37 -0700 (PDT)
Message-ID: <09715ff3-df00-4ba7-8d9d-52b15e8b86df@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:20:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
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
 <79fc7d1b-98b2-455f-9a3d-d93602bb2bf8@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <79fc7d1b-98b2-455f-9a3d-d93602bb2bf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sqBh-t4jy2r22CECxkG-0UoCATXvzqIr
X-Proofpoint-ORIG-GUID: sqBh-t4jy2r22CECxkG-0UoCATXvzqIr
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab4e45f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7w9Oa5uRL5oMzCgKYUYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfXxGUtDvjOxE6P
 VQXHDAa2e3FUMc82Ym1jQePcnBXRwsW+xBbRIVx98ofebFBJkye61ZstBeosjvEodwGGeqF4WdM
 UHhzcR6EShkTUNrnLbCCVNNIW3n3I78=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX0EB14aAZqRy/
 Ubo5dGLJQzDCWLB8N+MeNnNUS9PSCaNhwsEexn4RDLfD+GMtn1Lp/7Dsg7P2P/IDEBAwZ9+KUXO
 gme5DeqJ15lh4qtDLg0NVo/4KOZArcUXpWXwPhSEL0g3yhrmbfwLUgQGeOUCjLueHyTDQwpIVAl
 55nwF26Ki7uAxFWbkVOaSKFMbvCx/8HvlmpHQCcPCWCCNFkpTFaLiXmCVL6l9byoSVeD5jx4PA3
 C31gh5wng0Q6bconwWEKmEq6Ja4mtCo4tTxisaA3tfAMj87WwurEkgpUnkBYzZGT036zKNORpEi
 NpDwmj+Fen8VrtsaKr+7T+bVb6s8RlnpIBi98Mq9EctARzRMKANyZeHXyiKHGGsADm7tXCDzx9m
 T50Iw/1g34CTQQ5Dy2Fe40tzTh1LXePhywwk1tT+6hDHCNQPzYMxQbWmC2mzpVG1YNfYA4bQpWf
 a8VBkE6OP8bZSKxPFKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240037

Thanks Konrad, Bartosz !

On 9/23/2026 6:10 PM, Konrad Dybcio wrote:
> On 9/22/26 10:24 AM, Bartosz Golaszewski wrote:
>> On Tue, 22 Sep 2026 07:34:25 +0200, Mukesh Savaliya
>> <mukesh.savaliya@oss.qualcomm.com> said:
>>>
>>>
>>> On 9/21/2026 8:16 PM, Bartosz Golaszewski wrote:
>>> [...]
>>>
>>>> +#include <dt-bindings/dma/qcom-gpi.h>
>>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>
>>>>    / {
>>>> @@ -909,6 +910,28 @@ soc: soc@0 {
>>>>    		dma-ranges = <0 0 0 0 0x10 0>;
>>>>    		ranges = <0 0 0 0 0x10 0>;
>>>>
>>>> +		gpi_dma2: dma-controller@800000 {
>>>> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
>>>> +			reg = <0x0 0x00800000 0x0 0x60000>;
>>>> +			#dma-cells = <3>;
>>>> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			dma-channels = <12>;
>>>> +			dma-channel-mask = <0xfff>;
>>>> +			iommus = <&apps_smmu_0 0x15b6 0x0>;
>>>> +			status = "disabled";
>>>
>>> we should be keeping GPI node default enabled similar to common QUPv3
>>> wrapper node.
>>> status = "ok" for all the nodes.
>>>
>>
>> The pattern across Qualcomm platforms seems to disable the GPI DMA nodes at
>> SoC-level and only enable them at board-level.
> 
> For no reason - the DMA engines may be reserved through TZ config,
> but for the past (high) N years that hasn't been the case
> 

There is a reason to reserve this from TZ. Some use cases require GPI to 
be available during early boot, before Linux is up and running, which 
necessitates keeping the GPI instance enabled.

Also, GPII is allocated per SE, while the GPI instance itself is shared 
across all SEs within a QUP. Given that a QUP typically contains eight 
SEs, it is likely that at least one SE will require GPI operation.

For that reason, my preference is to keep the GPI node enabled by 
default. However, if there is a strong preference to make this 
board-specific and enable it only where required, I can work with that 
approach as well.

I think it would be better to align on the expected default behavior 
now, rather than revisiting it later once additional users start 
depending on it.

> Konrad


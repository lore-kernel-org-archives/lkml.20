Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517CE233926
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514792; cv=none; b=tLc9VbI+uQUCxFNBHmxJQWYcQDy2/M1RZxmiy24N8TULbtAOBUp/0TUtKMg1JDR31s94NwQaGlfCHyFsRU157vu1IixVLEobqpDf3iVVB7UV0OHFmjpzkCbhtsg2VjxdO10WxQcsYsNnoNtFIeInF+u3vEte2LUzUsGjUc/RLyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514792; c=relaxed/simple;
	bh=Pj1D424HdPi1o96MPV2dHpKL6ipxjN7SrENqKwqWdAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOybsO3RDTbR5Bu/WRyZKlI6zr9JVeMn0SyWdMmK1BIuEgUmqe+9R0Za6fm2g/KSvETl/RllGpR5bRyM1uORvtN0SMIlGX74rTluwjxmJe8Pbptjit/Fd7LSBro8WE6jZtyPSvHHISAe45e6uQ43KrRMuF/DOvhp6hepZyuIZ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAT3oF7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTRmfbNK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAT3oF7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTRmfbNK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990QSYI231398
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 02:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yt7/BWKDmiLx79NY+lUATumh3FrLQFNgexHb5QKZXno=; b=DAT3oF7YYBIXZGVH
	6O9QUWXjSYsD3vfOsBIzSrQO2zUh9rLNnWAPJEoB/ZPCWIpE82Tjt5jxyf/U4Jzg
	yAUg1RNyrdgY05/XGi7IjRvAGaEct1yh0uYw343e1ew/iN7erdKkRjwxwGsERlu1
	siyLivEol7jaIIMkrEfPbIIE70is0UoNgpr+QloTJKTY/4y5fb+yv3/vOj6JdDJj
	YFE+VVS0qq87w+PEpFCnMjmv5hn0ej+DeLbv1gA5JQBPneQgB1NiuGLs2ds6EMpH
	+L5ANTlnK5tXBlfFZno8D8dZ6aZOIl7KLCimjUJaP16Vsx38NFIwlgPfExJCFv4b
	L+vaZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj2stu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:59:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso7434678a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791514788; x=1792119588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yt7/BWKDmiLx79NY+lUATumh3FrLQFNgexHb5QKZXno=;
        b=eTRmfbNKITQoIRbGTZG76W65vwt/gEqL5SSm9O49ZqqG69qYkSsBy30+KvOcGJCi4+
         B6+bPL29Rf4XL53h5dwPPESiwxeY2wEIwUFdMoLuw6z0v0YR20fMkgZkheqEZ1+XpNmI
         22t83muMr0Lo0zmObvYHA/pK6Ka0WpefUoh2fDThrAGwrrv9WAVihZHgIyBal+SQwfPW
         MMA+rXhhQ6r/xpekxgHWZA3EA1LZU0HUFCEWKC62Is6/duGJekocg2AmJTQsEaNHjGBz
         qFaT2nH6IRnYH4hnkp97D7DbXBKuRhPMniKuixR0DvVQmNtnYpsK7bNTVG+vMaRjGZPK
         psIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791514788; x=1792119588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yt7/BWKDmiLx79NY+lUATumh3FrLQFNgexHb5QKZXno=;
        b=YY9wwnsvJRmPjE9/1VNTSVlzmP6ot0Xywpwx+tgz3rXm0c+B9OygUfpxcDi3iXtvl2
         B5aggP3heXeVqI8+pPemx06cIdF0OTDtegivEAsFCQFe+mT71K0+E9LW1tmsIB0eFDBs
         I9f08OWp+5euQv/UyohLGjTXAyJKbuxqThXeMWCm2ksZOGCqKKRCgi9tvb/I9hFOtrwz
         C5RxISvPmWH9LjFKRhw/EYsBb4tUm9b1tnXFDR1jpi9M1EnOMZe+nivQEnMFoMvbIoDj
         zClpG8Q3j5hvDy+cT6PQMMEc7P8Rd2pS3CBmoQ6H6p4Xs5QY4QrC2gOLVzOOxiQ9xLZt
         raWw==
X-Forwarded-Encrypted: i=1; AKwUvBwYh5TGfnqvTeTd5gHv0GKr3rhF98v5qWwwwk4jRNBmJeuttOIo1AJsXayDD7uXPUkhHPrKg0FggnT+nIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBMNIOhQHlh668TS+/gzTzAnSMvSfLwUMoUS8ZIt7UfXYgMnT+
	hr+pQe2ezOPKlH/xFlyngaOmNOKzfmRkJWb+vpVrDcfk8CSvDUb3a1D1OYCkoiiw4q1mV0/YqwH
	Uu8MM4ohE7mzYPgnOwqBMPBmUvNVUGkuiOX0R7EE+D0eq+i4LvT8FB6nl5I6SatfQcXc=
X-Gm-Gg: AYBFou1oWM1AcaHjanNzk1/2O3EhuWbKk2CYHBgma62TzCUAgWF9SBpR3Q7XA1Rxb2E
	GqHoNWinlzqtxixn5bXb5zvXQloCghThXD4GvApVHkMVAnQRTWMEhia4DEgc1s7QHYNlrsYN2t0
	cj7ogJ4ZyhLVME+5JAgDJV5k1fMyfonZyPiTIFYPfZa76RrSVu0jicArjgk61muMLNYfwTK02ne
	hJ0e206jzaN5uvfuf9NH68x1PXj4TPrj5JTn1qXhEqdiLedGAM1UwDDpgkKoamZ9PIQOhUXF5mV
	VjnH/PUjuB50bemm4xNN5YQNBEmdEeuUnp8YTsx/5A5GfMZehxvLDHzKHY3gvJNofx/TD8ezFMJ
	jtTkfO2q42ZJKIPGjmAOA5FPRneFaxNlyY9RC23YEfHCzLcroh6wMwhZPdrAL+/8=
X-Received: by 2002:a17:902:cec2:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2e842e02a57mr4446815ad.61.1791514787576;
        Thu, 08 Oct 2026 19:59:47 -0700 (PDT)
X-Received: by 2002:a17:902:cec2:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2e842e02a57mr4446595ad.61.1791514786997;
        Thu, 08 Oct 2026 19:59:46 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e82asm2257855ad.14.2026.10.08.19.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 19:59:46 -0700 (PDT)
Message-ID: <7452d85d-83a8-493c-8d74-5020ab72982d@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 10:59:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 08/12] media: qcom: camss: vfe: Add support for VFE
 1080
To: bod@kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-8-b2c583ef50e0@oss.qualcomm.com>
 <179149982796.2596899.756044515233442982.b4-reply@b4>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <179149982796.2596899.756044515233442982.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxMSBTYWx0ZWRfXzSQCvjvTJL0F
 KWKvOlQi92OQdCesmo3sUOLPDpR7beEEdLqQ+Knt3i+HHLy6yvZ0310f64qNM8ZMNnt0yOAQSk6
 Wy2aeWStCHEc+ce4VJWEm45Y0CVm7X4VkSpEDzGnfK5CkqeeB2Ad/DcXkv53f7E/j1Aqe0LmE5d
 VeBGnzW41ILF5sUJzXZmCAQVRm/bfDTafNzufSWo1p7LcHFGpgqe3tsuiD/Zq31x6gpe6UXC6ug
 6G7HNDRzpslcSfzE3puCbXulL8n/ArUKDzYGNCrjGj23lIRECov6KbTKHaIuv+Xq4ws9AI1bGwI
 YQwLJS9jY7t22dKrYXCpLVTXb7YW8FN/R/P4eUxm1DgoC1oTGuEA+rUTIRMbO9Jal8ZDccKQbWQ
 c4gvQ7SKM+hGoUBPvQDedPCoEnR4zm12E5O1fxMaCg75gVTPYnmidF1EsOcoaJaxCMfO+eu8nag
 kbxn1JHR4uUgvl/mHAA==
X-Proofpoint-GUID: lyrj41UR14fmECytDa4zoZZvPzBcIvBp
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac858a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m0hzp7Y7Gn0FhK7fvfQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: lyrj41UR14fmECytDa4zoZZvPzBcIvBp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxMSBTYWx0ZWRfX7+ZD5Omj10Ej
 jR05mUkN7cOWTfQo8zI31OVEHCywWols+ooH1kV3kdHLb7bFxUbmwjFsWtqBTLxisttC2ZIMYJt
 8Heq6O4BAykAE1inLpUdmfQLoG7D+3Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090011

On 10/9/2026 6:50 AM, bod@kernel.org wrote:
> On 2026-10-08 00:14 -0700, Hangxiang Ma wrote:
>> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
>>
>> In the Kaanapali camera subsystem, the front-end blocks are referred to
>> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
>> in some places to preserve consistency with the existing code and avoid
>> unnecessary renaming. Support is currently limited to three output lines,
>> matching the constraints of the CAMSS framework.
>>
>> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
>> CSID configuration has completed. In addition, the number of AUP_UPDATE
>> requests must match the number of buffers queued to the write master
>> while it is being enabled.
>>
>> Although real-time TFE traffic is routed through RT_CAMNOC, both
>> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
>> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
>> reset in a fully idle state.
>>
>> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 +++++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
>>   drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
>>   drivers/media/platform/qcom/camss/camss.c          | 153 ++++++++++++++++
>>   5 files changed, 360 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
>> index 218ba3a95939..42a14e8fe1b7 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -26,6 +26,7 @@ qcom-camss-objs += \
>>   		camss-vfe-340.o \
>>   		camss-vfe-480.o \
>>   		camss-vfe-680.o \
>> +		camss-vfe-1080.o \
> 
> Can't say I'm 1000000% clear on when reg_update() is supposed to happen in
> the flow of the logic you have here.
> 
> I'm a bit suspicious of adding a new flag which skips the update but
> assumes some other bit of code executes later and does that update.
> 
> Can you explain this some more please.
> 

Thanks for the review. These points were discussed in an earlier 
revision, but I should have explained them directly in this version.

Vijay once clarified that the configuration principle became more strict 
since Kaanapali. We can back to 
<https://lore.kernel.org/all/662a21a3-de8b-406f-a15d-b8a572aa79ab@oss.qualcomm.com/> 
for more details.

In short, the hardware guidance asks to issue the REG_UPDATE after all 
of the CSID configuration registers are written. Kaanapali seems to have 
very strict dependency in the hardware about this sequence and with the 
original sequence, no RUP DONE or BUF DONE events are received at all. 
While other chipsets can work normally.

>>   		camss-vfe-gen1.o \
>>   		camss-vfe-gen3.o \
>>   		camss-vfe-vbif.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
>> new file mode 100644
>> index 000000000000..016857cd1025
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
>> @@ -0,0 +1,197 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-vfe-1080.c
>> + *
>> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 1080
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +
>> +#include "camss.h"
>> +#include "camss-vfe.h"
>> +
>> +/* VFE-1080 Bus Register Base Addresses */
>> +#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
>> +
>> +#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
>> +#define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
>> +
>> +#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
>> +
>> +#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
>> +#define		WM_CFG_EN				BIT(0)
>> +#define		WM_VIR_FRM_EN				BIT(1)
>> +#define		WM_CFG_MODE				BIT(16)
>> +#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + 0x504 + (n) * 0x100)
>> +#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + 0x508 + (n) * 0x100)
>> +#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50C + (n) * 0x100)
>> +#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
>> +#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + 0x514 + (n) * 0x100)
>> +#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
>> +#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + 0x518 + (n) * 0x100)
>> +
>> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x530 + (n) * 0x100)
>> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x534 + (n) * 0x100)
>> +
>> +/* VFE lite has no such registers */
>> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x538 + (n) * 0x100)
>> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53C + (n) * 0x100)
>> +
>> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x560 + (n) * 0x100)
>> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x564 + (n) * 0x100)
>> +
>> +/*
>> + * IFE write master client IDs
>> + *
>> + * VIDEO_FULL			0
>> + * VIDEO_DC4_Y			1
>> + * VIDEO_DC4_C			2
>> + * VIDEO_DC16_Y			3
>> + * VIDEO_DC16_C			4
>> + * DISPLAY_DS2_Y		5
>> + * DISPLAY_DS2_C		6
>> + * FD_Y				7
>> + * FD_C				8
>> + * PIXEL_RAW			9
>> + * STATS_AEC_BG			10
>> + * STATS_AEC_BHIST		11
>> + * STATS_TINTLESS_BG		12
>> + * STATS_AWB_BG			13
>> + * STATS_AWB_BFW		14
>> + * STATS_AF_BHIST		15
>> + * STATS_ALSC_BG		16
>> + * STATS_FLICKER_BAYERRS	17
>> + * STATS_TMC_BHIST		18
>> + * PDAF_0			19
>> + * PDAF_1			20
>> + * PDAF_2			21
>> + * PDAF_3			22
>> + * RDI0				23
>> + * RDI1				24
>> + * RDI2				25
>> + * RDI3				26
>> + * RDI4				27
>> + *
>> + * IFE Lite write master client IDs
>> + *
>> + * RDI0			0
>> + * RDI1			1
>> + * RDI2			2
>> + * RDI3			3
>> + * GAMMA		4
>> + * STATES_BE		5
>> + */
>> +#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
>> +
>> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>> +{
>> +	struct v4l2_pix_format_mplane *pix =
>> +		&line->video_out.active_fmt.fmt.pix_mp;
>> +
>> +	wm = RDI_WM(wm);
>> +
>> +	/* no clock gating at bus input */
>> +	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
>> +
>> +	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
>> +
>> +	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
>> +	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
>> +	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
>> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
>> +	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
>> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
>> +	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
>> +
>> +	/* no dropped frames, one irq per frame */
>> +	if (!vfe_is_lite(vfe)) {
>> +		writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
>> +		writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
>> +	}
>> +
>> +	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
>> +	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
>> +
>> +	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
>> +	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
>> +
>> +	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
>> +}
>> +
>> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
>> +{
>> +	wm = RDI_WM(wm);
>> +	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
>> +}
>> +
>> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>> +			  struct vfe_line *line)
>> +{
>> +	wm = RDI_WM(wm);
>> +	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
>> +
>> +	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
>> +}
>> +
>> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>> +{
>> +	int port_id = line_id;
>> +
>> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
>> +}
>> +
>> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>> +					enum vfe_line_id line_id)
>> +{
>> +	int port_id = line_id;
>> +
>> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
>> +}
>> +
>> +static const struct camss_video_ops vfe_video_ops_1080 = {
>> +	.queue_buffer = vfe_queue_buffer_v2,
>> +	.flush_buffers = vfe_flush_buffers,
>> +};
>> +
>> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>> +{
>> +	vfe->video_ops = vfe_video_ops_1080;
>> +}
>> +
>> +static void vfe_global_reset(struct vfe_device *vfe)
>> +{
>> +	vfe_isr_reset_ack(vfe);
>> +}
>> +
>> +static irqreturn_t vfe_isr(int irq, void *dev)
>> +{
>> +	/* nop */
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int vfe_halt(struct vfe_device *vfe)
>> +{
>> +	/* rely on vfe_disable_output() to stop the VFE */
>> +	return 0;
>> +}
>> +
>> +const struct vfe_hw_ops vfe_ops_1080 = {
>> +	.global_reset = vfe_global_reset,
>> +	.hw_version = vfe_hw_version,
>> +	.isr = vfe_isr,
>> +	.pm_domain_off = vfe_pm_domain_off,
>> +	.pm_domain_on = vfe_pm_domain_on,
>> +	.reg_update = vfe_reg_update,
>> +	.reg_update_clear = vfe_reg_update_clear,
>> +	.subdev_init = vfe_subdev_init,
>> +	.vfe_disable = vfe_disable,
>> +	.vfe_enable = vfe_enable_v2,
>> +	.vfe_halt = vfe_halt,
>> +	.vfe_wm_start = vfe_wm_start,
>> +	.vfe_wm_stop = vfe_wm_stop,
>> +	.vfe_buf_done = vfe_buf_done,
>> +	.vfe_wm_update = vfe_wm_update,
>> +};
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 2680a9914765..3acef6ba97dc 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>>   	case CAMSS_8550:
>>   	case CAMSS_8650:
>>   	case CAMSS_8775P:
>> +	case CAMSS_KAANAPALI:
>>   	case CAMSS_X1E80100:
>>   		switch (sink_code) {
>>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>> @@ -525,7 +526,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>   
>>   	spin_lock_irqsave(&vfe->output_lock, flags);
>>   
>> -	ops->reg_update_clear(vfe, line->id);
>> +	if (ops->reg_update_clear)
>> +		ops->reg_update_clear(vfe, line->id);
> 
> What's this ? Modification to the VFE core for a callback you guys have - enumerated.
> 
> If this is to be treated as optional then, submit a patch justifying that
> change as a standalone thing.
>   

Thanks for pointing out this.

I think this is oneline redundant code left over since v2, where you 
asked for consistence clear operation for both CSID and VFE. It's safe 
to remove this as all platforms use _clear_ operation.

>>   	if (output->state > VFE_OUTPUT_RESERVED) {
>>   		dev_err(vfe->camss->dev,
>> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>   		output->gen2.active_num++;
>>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>   				   output->buf[i]->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>> +
>> +		if (!vfe->res->reg_update_after_csid_config)
>> +			ops->reg_update(vfe, line->id);
>>   	}
>>   
>>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> @@ -2013,6 +2017,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>>   	case CAMSS_8550:
>>   	case CAMSS_8650:
>>   	case CAMSS_8775P:
>> +	case CAMSS_KAANAPALI:
>>   	case CAMSS_X1E80100:
>>   		ret = 16;
>>   		break;
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index ae9dad353a37..118cac5daf37 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -133,6 +133,7 @@ struct vfe_isr_ops {
>>   
>>   struct vfe_subdev_resources {
>>   	bool is_lite;
>> +	bool reg_update_after_csid_config;
>>   	u8 line_num;
>>   	bool has_pd;
>>   	char *pd_name;
>> @@ -248,6 +249,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
>>   extern const struct vfe_hw_ops vfe_ops_340;
>>   extern const struct vfe_hw_ops vfe_ops_480;
>>   extern const struct vfe_hw_ops vfe_ops_680;
>> +extern const struct vfe_hw_ops vfe_ops_1080;
>>   extern const struct vfe_hw_ops vfe_ops_gen3;
>>   
>>   int vfe_get(struct vfe_device *vfe);
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 261e6c837dd4..5cd9641fea94 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -156,6 +156,157 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
>>   	}
>>   };
>>   
>> +/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
>> + * to operate on any TFE Full.
>> + */
>> +static const struct camss_subdev_resources vfe_res_kaanapali[] = {
>> +	/* VFE0 - TFE Full */
>> +	{
>> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +			   "vfe0_fast_ahb", "vfe0",
>> +			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
>> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
>> +		.clock_rate = { { 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 360280000, 480000000, 630000000, 716000000,
>> +				  833000000 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 200000000, 300000000, 400000000, 480000000 },
>> +				{ 0 },
>> +				{ 0 } },
>> +		.reg = { "vfe0" },
>> +		.interrupt = { "vfe0" },
>> +		.vfe = {
>> +			.line_num = 3,
>> +			.is_lite = false,
>> +			.reg_update_after_csid_config = true,
>> +			.has_pd = true,
>> +			.pd_name = "ife0",
>> +			.hw_ops = &vfe_ops_1080,
>> +			.formats_rdi = &vfe_formats_rdi_845,
>> +			.formats_pix = &vfe_formats_pix_845
>> +		}
>> +	},
>> +	/* VFE1 - TFE Full */
>> +	{
>> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +			   "vfe1_fast_ahb", "vfe1",
>> +			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
>> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
>> +		.clock_rate = { { 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 360280000, 480000000, 630000000, 716000000,
>> +				  833000000 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 200000000, 300000000, 400000000, 480000000 },
>> +				{ 0 },
>> +				{ 0 } },
>> +		.reg = { "vfe1" },
>> +		.interrupt = { "vfe1" },
>> +		.vfe = {
>> +			.line_num = 3,
>> +			.is_lite = false,
>> +			.reg_update_after_csid_config = true,
>> +			.has_pd = true,
>> +			.pd_name = "ife1",
>> +			.hw_ops = &vfe_ops_1080,
>> +			.formats_rdi = &vfe_formats_rdi_845,
>> +			.formats_pix = &vfe_formats_pix_845
>> +		}
>> +	},
>> +	/* VFE2 - TFE Full */
>> +	{
>> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +			   "vfe2_fast_ahb", "vfe2",
>> +			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
>> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
>> +		.clock_rate = { { 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 360280000, 480000000, 630000000, 716000000,
>> +				  833000000 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 200000000, 300000000, 400000000, 480000000 },
>> +				{ 0 },
>> +				{ 0 } },
>> +		.reg = { "vfe2" },
>> +		.interrupt = { "vfe2" },
>> +		.vfe = {
>> +			.line_num = 3,
>> +			.is_lite = false,
>> +			.reg_update_after_csid_config = true,
>> +			.has_pd = true,
>> +			.pd_name = "ife2",
>> +			.hw_ops = &vfe_ops_1080,
>> +			.formats_rdi = &vfe_formats_rdi_845,
>> +			.formats_pix = &vfe_formats_pix_845
>> +		}
>> +	},
>> +	/* VFE3 - IFE Lite */
>> +	{
>> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +			   "vfe_lite_ahb", "vfe_lite",
>> +			   "cpas_vfe_lite", "camnoc_rt_axi",
>> +			   "camnoc_nrt_axi", "qdss_debug_xo" },
>> +		.clock_rate = { { 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 266666667, 400000000, 480000000 },
>> +				{ 0 },
>> +				{ 200000000, 300000000, 400000000, 480000000 },
>> +				{ 0 },
>> +				{ 0 } },
>> +		.reg = { "vfe_lite0" },
>> +		.interrupt = { "vfe_lite0" },
>> +		.vfe = {
>> +			.line_num = 3,
> 
> The line count on the lites looks wrong here.
> ---
> bod

The line count of three for the TFE resources is intentional.

Although the Kaanapali TFE hardware provides 5 RDI ports for FULL and 4 
RDI ports for Lite, the current CAMSS framework supports only three RDI 
paths for this driver: RDI0, RDI1 and RDI2. Setting line_num to 5/4 
would expose a fourth or fifth path and causes the CAMSS validation to fail.

Therefore both the full VFE and TFE Lite resources use line_num = 3 in 
this series. This limits the currently exposed CAMSS output paths and 
does not describe the complete number of RDI ports implemented by the 
hardware. This has been discribed in commit message as well.

---
Best Regards,
Hangxiang


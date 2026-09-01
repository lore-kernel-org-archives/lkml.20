Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F354CCDFC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244910; cv=none; b=ndEQ6j9id0nxg1oKZms9u8QJI6w968X6WANhvjcdcg78Vg5EV2gkVABjTFJWacz1CO8VtoYdtkKRRtge2NAD8hqFf9m3dD+piqL9ReYK2Uz5YNb3Ul8tIfxu5XLSiVe6UZCAgj+x9GRn3sro7Js3CNT8ddkQ5AldScs1xYRp8/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244910; c=relaxed/simple;
	bh=yv25dNvbmF2jovmXJltSt/bO04w7YhADkudbSxNFdrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHOIvHmFlnOYWCIdvAl2RJBCVEi3PhdbawjrlMuRMUNhdZk/oilekP1c49A28Rypuo7D3c25jFCJmu0JhFhbbJEhpbE6zvfQlqTmlbMnn1kgBN4sHkwCgM3fdwxNVili1gBMbKp+10s2ymNL4AC48dCAag55GYbw3sWeQdapcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzZnW15Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+3ItXHH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzZnW15Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+3ItXHH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810p98N979839
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 06:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBmtNPoEtLv53P7QYpUKrlSYDCg6uvRG+fRo+D5U/VY=; b=BzZnW15YPjfK1/GK
	txgN0NKCskhKY0G9d2fA6dL54E9CMiOouIRoPsTdB69JsYDzpyFnF7f2wCL4Lf9X
	H027rHofqsmnTRILUTq2XQVynnQiTEwluH1hQT+xX1/1o5Sbf6iKl/B3dvP4jf0u
	5aSUeoC7YJgBrG2swSAQWaaUdvtIf+XxzUntRuigB7D7mqMBqZXQ69DphM4l+IWI
	yvNcnAhqucROg3zEuUj1eVSvFCsxsUw8pqM35PBEPo9qeqFAG8uWBxS7bzh6Z3av
	dbGPrFMAePuvRveV2sY9eZQUEtkYhd5wGJdTI3sKgksl093WjFP0HXK7WdiPs+ZD
	64mSaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dubdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:41:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7572966a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788244907; x=1788849707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mBmtNPoEtLv53P7QYpUKrlSYDCg6uvRG+fRo+D5U/VY=;
        b=Y+3ItXHHu78H+jWhsOOwiOpzEvrMzpE+ATtl8W9VztbDAV4In9tT7EXJ7aiyVv+bZB
         TUAlt77RomZ+w5/15AZev2BCVtDBULv8ySFvTuZZnI6LJTXL/y+4BZ5PVxIETTOrCWjv
         pBfCMzeV10LiNUvFbVLyr7li1XqQjOUkwtp4j5DSk2bZlw3UScCJ/TYqLuo5fANFS2Qv
         9voo93vWYzxVzWiSWqDylNx/x26h4KJUgz24kuS3QN5DedQzPlwpYqyYgwYSSuNQia1h
         j+ilfPV1LBGcSM6RgUGEUBklFcaWfKDFfpvjmLluS1goG9WLT9MgD+bctvl9LUXS0WFg
         KTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244907; x=1788849707;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBmtNPoEtLv53P7QYpUKrlSYDCg6uvRG+fRo+D5U/VY=;
        b=ke0j19dUU+/5XocfY/QXBs7CNUu8Get5gNu1wtSr3POojd27ceIxn3gn1krMoxKK0S
         m4ahob+UDHgSslpRXTPp+OG4/fK8FbemeeCHochYIlUOOugY0nfkvDDgs8INB7qRtfmI
         EJMAFSWRDUP7P1AHrsGZLQ1s9Y7owzrji2L1fAYo8xu4fhEvMX5n7q+64mZDmudGVfes
         EuxmivS8qoDrebqfGfSn3QGgc1DgJwVc96Wp2vz+14VQ/opEabZGlRkuGlDPWlMias+i
         cKI0Pc3zkfLagXLPPh0CAjb5i4oPHGS0uXHbsZlgiQIePKRdrCj175C2hjbunp2Rvk0r
         LQMw==
X-Forwarded-Encrypted: i=1; AKwUvBxeCtqEQjBwuTOEOXihzdE9PRXRHM+qqH9aA2nC4spjRiFrqTczZWr6vqBmW3S5d8lR3YtqlypnLeVdFvY=@vger.kernel.org
X-Gm-Message-State: AFuF++l9pErL49/ha0PiLrUE4S5tAyLBX4U5NwS0/MUQ+1VIZTZXVcYp
	HxLsnLTWaxJGfYMuDbjPKDIwS4ENKOrxb37LHqqiVchrPU1QtGJKNtKCEbZYxP2UWy1JVJTrV36
	x5Ek5NketEf8jQxuv4zWZJfRphTt0kyrL+QFI+RuiMYpZwK6Jyb22QpdZHl+k5BeEFWE=
X-Gm-Gg: AYBFou24q0zwxr6uJeI2f+hHS7HiIFvM6/8ZZsySJmOtvpTV5RW3V1odl8VDlMyyCaZ
	izULrJzwU1277GzwqMhAXruyjYpdFn6F51LozodDT7LOoT7zG47Fkq9gxFiqtwEkGNQcM8O+7Hv
	FlUZSP4Sqe5G5T8KUYC0r6EawCdnpea/KxKjRHxkfmc1YY4Sg0zjN4oT1L30defmvZCn++50eiT
	oOGq449urivfxON0WBsBzMYrqi/0rHe0LEDB0MQWXbvNZ6UZtk+0uSZhbZSBOtuErj/xwZmN00w
	sNcf3CoxK3IDAEWDeKFeNWMSkqcTPjwUmXaobGoZ5WX2RWEpdLFyX4RJOG5Ii6PujxoeaakZXNM
	PyVMojIPWQPaUZUhr5RWZA+orE/h5dkRxisFLGapIxnFDvRSBe5CCnUQejDc37DWNsQ==
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr50804725a91.13.1788244906810;
        Mon, 31 Aug 2026 23:41:46 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr50804616a91.13.1788244906377;
        Mon, 31 Aug 2026 23:41:46 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d29af238sm6427732a91.1.2026.08.31.23.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:41:45 -0700 (PDT)
Message-ID: <f7bf3408-6d07-4933-9610-d0719d429ffe@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 14:41:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
References: <20260226054113.4156874-1-xin.liu@oss.qualcomm.com>
 <abqrLY8mLiAGugPK@baldur>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <abqrLY8mLiAGugPK@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a9673ab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=msPNAV2qm2yT9iC0_akA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfX6YIf/+8Zevau
 Px4k12XS4QvUSxdOEX4UQE0U5j+duNa1U8PkF9GU8sjn3C3NmSQ2cq8ZXxKLkxlwE9KjIDVgIP+
 tndEsaaxhFgGp9JVEyNQVnF7WySkfCSFyS/NaVw+RHt5ahOUXNNKjwiA9hQasQLGvxNLOsndrA5
 UyrLcTwPYsfFLeRnuLTTLRpuDR6zDQGNNaSjg2VGK6k+IhIO1nE2zLaZhDCKJhccO2NGfVw02q0
 1Ve3xfytSfPFb9rhpO9mz9yrM8k+2JTwnAOrSB343lvx5LQkDb8GVrv9JUn6aNgwLPLhrPh45Jt
 Noa8AdxzmhTNfyf3LyGqz+HdSahs/pHbf93CrGoUvFEWwx2vurn8Wct3kMKkGFSBGesf883Fg3u
 0kEg4HTe7m6LnzG9mA9bZDhkP9lIVxl8Z8p7wNZF/NAU6mCXJ2GJtkcSOR9ScudaZWFQTCUikDt
 VXr2M3xyZgVDSkTrYgg==
X-Proofpoint-GUID: oxUozk7NnQ26u01EWqdbOq5Z3yR8wllv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfX9gWsNL1+qUrp
 Wwy14bkruqqPMC+4j7BEOvlJK65y/qgH0LNgMbMrEI6ZdO8Ua56ubjNM7c/UU5J+xA1Q8mVoSJf
 utl7cj0xmnXA8+IfmGyZVY4+AyFp/SY=
X-Proofpoint-ORIG-GUID: oxUozk7NnQ26u01EWqdbOq5Z3yR8wllv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010058


On 3/18/2026 9:42 PM, Bjorn Andersson wrote:
> On Wed, Feb 25, 2026 at 09:41:13PM -0800, Xin Liu wrote:
>> Add support for SYSTEM_RESET2 vendor-specific resets as
>> reboot-modes in the psci node.  Describe the resets: "bootloader"
>> will cause device to reboot and stop in the bootloader's fastboot
>> mode.  "edl" will cause device to reboot into "emergency download
>> mode", which permits loading images via the Firehose protocol.
>>
>> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> How did you test this? I tried to apply this, but I'm getting 52 counts
> of:
>
> xyz.dtb: psci (arm,psci-1.0) 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
>
> Am I doing something wrong?
>
> Regards,
> Bjorn

Hi Bjorn,

Thanks for testing!

The warning is expected without the companion binding patch. This DTS 
change depends on:
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
from Shivendra Pratap's series, which adds reboot-mode as a valid
child node in Documentation/devicetree/bindings/arm/psci.yaml.

Without that patch applied, the schema enforces additionalProperties:
false with no reboot-mode pattern, causing the check failures you see.


Regards,
Xin


>> ---
>> Changes in v2:
>> - Fix mode-bootloader and mode-edl reset_type
>> - Link to v1 : https://lore.kernel.org/all/20260209042700.1186392-1-xin.liu@oss.qualcomm.com/
>>
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index db65c392e618..a1bd8c3e4061 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -450,6 +450,11 @@ system_pd: power-domain-system {
>>   			#power-domain-cells = <0>;
>>   			/* TODO: system-wide idle states */
>>   		};
>> +
>> +		reboot-mode {
>> +			mode-bootloader = <0x80010001 0x2>;
>> +			mode-edl = <0x80000000 0x1>;
>> +		};
>>   	};
>>   
>>   	reserved-memory {
>> -- 
>> 2.43.0
>>

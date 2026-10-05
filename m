Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DC82931C3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791175233; cv=none; b=ihET7bddkmj7O+cMdFtjLwBzoFgaFZp9Kf6SCVShLNHZu8kduMKIlUDv1eKNmcPQeGtFkwu1nvLSNI8p+54uFGoWegmfqm8M9aXq/OZu8uKazv/ZEPmoaoP47yvkvWHkbkSs8eBBLvBtbeM4s149Pl46JQ0x2Srsbs6UrMo94sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791175233; c=relaxed/simple;
	bh=piSaU7u3lxuizoSGNuH8VAp/jRAKZ+r70tRHdIWnQ7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDOIx6Q2b31+sCmLKcYnuPq7SXTVriT7CQ5+FnvqOSJFG/EvFDajKp4hU6MryDZ7u6ixmHmH23BEAi9ATMSC051aEsyQy7GEmezrgjn3u/9AQNh5r7koRDW6TNaiHP5S94IlArPyFstMiUtobFWCJNcZyHo1jv/w5dvbmIwJnho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoCWsO/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SeVKkRXw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoCWsO/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SeVKkRXw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510Bwg787379
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 04:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ggULz4vwBuAHbZ84stjLwWZOA6YU/jtZhLLCdwL/6OQ=; b=HoCWsO/K4DcT1JHg
	ToOSHG1E/PeC1om45hN2LMzIegegjucR+mky2N7TXY0jNDwZCeZ8NdN3iTKan3xV
	WuWmnV/Nv5HQaA43Noz8LSmAD4PJfsGiODHewnjkVG2NdQd7/yZJl/kNr9kaxQq9
	2uNvwSbvfBQnsotyqx0RxbpP1e2PNoHFi/D4ekWn8CnsQ7g+2Gu0BqLMdODpXHqJ
	BGsRzKXTQVzqr4XpgVmG4r311gjrj++hnq94/wgA8/YS1sxHxFwi+ep6452ZS5oO
	w48kII8aSZKswu7NU8Jg8hgzP4ZFvOYV1phogA6Q3aGlj125TI5LNsOFx7mU+JSJ
	j4ZauQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4gj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:40:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1384427c3efso1739074c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791175230; x=1791780030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ggULz4vwBuAHbZ84stjLwWZOA6YU/jtZhLLCdwL/6OQ=;
        b=SeVKkRXwfWFgOE6AYb0WVLrq49MTEoCqxwn7qfxdzNmtDRFDVLeAki3Gbkv8u5MDTZ
         W2kDf1jmG7bwi+VlWk1HTWXbU9stUk4bmvj1yikeK3+om3+WD3hvqgybZ4FQD6Dox0IW
         PI2bfrSsRprPUADk3u4jugXRu9vXYnYvfzp/zw9u+FqTgYXr0apG64wez91f30uBKQPw
         0gLqME2Wd7iKE43JURAIjX1AY0N58gw2sjLROyfGC2S/vCpWiKgA5ihMoxFBzyLuqdFE
         0yfWwqfhGs2hE3Emfm3dZOvm202EF5axeCJXag/mhqU9QI3O6qMSEbYWlK58mzzLnhKK
         A4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791175230; x=1791780030;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ggULz4vwBuAHbZ84stjLwWZOA6YU/jtZhLLCdwL/6OQ=;
        b=Qrf1SomPHuVIs817NAerMtSoVipkaJBw/G+xXhHHJWyKoTgGEYk0kVedENwWLqWCuG
         uY+GWxIIkRVrde/lZqos0PFa6yhRAqaIged8bKdfxjUlAn3nl29GoAHqi25qapHBMoDM
         ekaNjkurB3KLCmQ5N1Ai5fdVALASyWzMNtMAsISaD8Y1JHWaRSIgWsRxixbgmCnr2jYM
         jC7RNlmyriPeXu0buvlBpfy0wShi9FTGo4gAf7gcVEUsksTuUOpH5rn7H2H2+prlPKEg
         LyBu04tr1SSrsg+96t+AhewQ/OJ8l1qVns4ZSRZspEf9KAUMSahx5cCfD/BLKc/ex6fX
         sS8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUqjaKI0Za59vgXjzX+voeWgHXZkBs9hdDpFztle/96YtJbm6TICacRQvncjVjIUInP/IJh2tFJxsR6Wc=@vger.kernel.org
X-Gm-Message-State: AFuF++mEFPWWZ9B3CW4o6pcNvaqcuQfTwAWk7+a9wBRD9wQhs+kArqZL
	zPW8QZkNgusInvwS0fxuonsSDm5JMoerKZwK+6ceJ1bF1DMtHXGYYkaS+rNHZMtpob/HeIZxLje
	k8qKL3vgmyUSSIWD5UCyqwNAsRIZkj2cw5KuvcdiM1YzWYzs9VMJwi8pk+sjsTsAL5BU=
X-Gm-Gg: AYBFou27RSbHZ4KtqA+UYJWU8BmhikR/XA1zNSvC8fHYs22+A1TLTMT0lWV2wBDKFxM
	Zb2rhAa9pxp0XwXxno61c30wg2sLnw4Y++hHOo0sEo8IdVfOuSbb9brSghn7+UbaQ9dGpj6+WA+
	RL2u1SdY2hMMVWTu8aQSuZJ+XfYX9DIZs1Zzav1/OHZUONmhn8YQSR/dZbqGndagF3FA/brGT9e
	nsm+Oa8Cv+g8wVVjmYrybmMtYqC1sKctz4xDdKP9HddHn6AZV+1VXwr8HzdxI8sKH0ilvqw9xwh
	SA/5W+YOd1jrX2/knvJ65aVKBPS4WK7fhycIOt3qBHVB5bYHaxQ1fVVvQh/8nF+JZJDmG7M+bUj
	Ed32BwgdW6ntFACLXC+A1lkjSrw==
X-Received: by 2002:a05:701b:2059:20b0:144:fb87:5b91 with SMTP id a92af1059eb24-14f5d0bbd97mr12325208c88.44.1791175230002;
        Sun, 04 Oct 2026 21:40:30 -0700 (PDT)
X-Received: by 2002:a05:701b:2059:20b0:144:fb87:5b91 with SMTP id a92af1059eb24-14f5d0bbd97mr12325174c88.44.1791175229391;
        Sun, 04 Oct 2026 21:40:29 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a6cbsm17981454c88.5.2026.10.04.21.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 21:40:28 -0700 (PDT)
Message-ID: <dacc806a-b7b0-4f6f-92d9-124363d480a1@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 10:10:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] firmware: qcom: Add support for TEE based EFI-var
 client driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
 <20261001-qcom_uefisecapp_migrate_qcomtee-v3-6-13df5c20c2e3@oss.qualcomm.com>
 <6aa0c698-509e-49d5-a229-7f756355b748@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <6aa0c698-509e-49d5-a229-7f756355b748@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxOCBTYWx0ZWRfX084WfFPcQS9x
 HUtPiB97/FN0HdRwBDC5RtoUKEICz7MlKFCGhsQ7JzzYCRMOwgB//bFjzQAWcNpiCMBQsDd10yZ
 5avCMcC/piLWZ/V2EyCUfMcvA3GMzd9hNpBBGUgo7VaY0pwae+ptqlTwdMnIoo27alcHvqFfGqg
 x+v5gc3L0N+fU77DxEZBj2TFT9FnPk2fGt0xDrVV68/bQyPEFEEgvGdMewQBsbLaXwBeW94fGkn
 0aerl9yHF5ELAH4MuMVerdSZCdEQA0gduNy3LhG671JY+z46uWiBt6oUuODtIXKbQNs8q68RU+I
 C5+WQv4kQYyN9p/NVeSRue8xUW+NqzzjFcGPIrqTeHR4TiTo+OSaNt9DSA85iGk1sdq9kNIXwOC
 08OGgCIyRyHlDhJ5cYOZfJAaAfQJ+sR92tUY2GtyEpMDg39Dsf4C5jBgB1eQuRBqjSC24gWm2Na
 0CywkOghNp5FNtNV23g==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac32a3f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=gJ6ZtcXeIMAt1hGiui0A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: Nz3c_jxkaDXxbUmLf3JhSl0sB65525--
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxOCBTYWx0ZWRfXxri6OvSq++bC
 4v4I4dz7HIS8QwiBUuEyYktX4p8uCrmazakKf1hk/P5UH704Az7sxsoI/T+nh5bZVTBehFLg6cG
 jQrQBmi9WuRZRRFUqfXz+KUnlyUkUN0=
X-Proofpoint-GUID: Nz3c_jxkaDXxbUmLf3JhSl0sB65525--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050018

Hi Krzysztof,

On 02-10-2026 11:16 am, Krzysztof Kozlowski wrote:
> On 01/10/2026 13:02, Harshal Dev wrote:
>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>> Replay Protected Memory Block (RPMB) located within either the UFS,
>> eMMC or SPI-NOR storage. The RPMB key which is one-time programmed into
>> the storage controller to allow authentication of the RPMB frames is
>> generated by and only available to the Qualcomm Trusted Execution
>> Environment (QTEE).
>>
>> The legacy QSEECOM protocol used for communicating with the QTEE is
>> deprecated and replaced with the use-case agnostic SMCInvoke protocol
>> starting with the Qualcomm SM8x50 series. On platforms where the QSEECOM
>> still driver probes, it does not support a listener interface with QTEE
>> to enable writing of non-volatile EFI variables to the RPMB for UFS and
>> eMMC storage.
>> Therefore on such platforms, a TEE client driver which communicates with
>> QTEE via the SMCInvoke protocol implemented by the QCOMTEE driver (and
>> registered with the TEE subsystem) must be used to update such EFI
>> variables.
>>
>> Add support for a TEE based uefisecapp client driver which installs efivar
>> operations after obtaining an object reference to the uefisecapp service.
>> This enables the kernel/user-space to access or modify both volatile EFI
>> variables stored by the Secure Application (in-memory) and non-volatile
>> ones stored within RPMB.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                                 |   6 +
>>  arch/arm64/configs/defconfig                |   1 +
>>  drivers/firmware/qcom/Kconfig               |  31 ++
>>  drivers/firmware/qcom/Makefile              |   1 +
>>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 636 ++++++++++++++++++++++++++++
>>  5 files changed, 675 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 30c1cdd0fb38..7ccedad8d388 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22981,6 +22981,12 @@ L:	linux-arm-msm@vger.kernel.org
>>  S:	Maintained
>>  F:	drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>>  
>> +QUALCOMM TEE UEFISECAPP DRIVER
>> +M:	Harshal Dev <harshal.dev@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/firmware/qcom/qcom_tee_uefisecapp.c
>> +
>>  QUALCOMM PINCTRL DRIVERS
>>  M:	Bartosz Golaszewski <brgl@kernel.org>
>>  L:	linux-arm-msm@vger.kernel.org
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index fce418fe6ff6..a8525878c679 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -277,6 +277,7 @@ CONFIG_IMX_SCU=y
>>  CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
>>  CONFIG_QCOM_QSEECOM=y
>>  CONFIG_QCOM_QSEECOM_UEFISECAPP=y
>> +CONFIG_QCOM_TEE_UEFISECAPP=m
> 
> I do not see how this change is relevant here. Adding a driver has
> nothing to do with defconfig. Drop or split.
> 
> Not mentioning that nowhere is explained why you actually need it.

Ack, I will split this into a separate commit and provide a brief explanation
for this config.

Regards,
Harshal

> 
> 
> Best regards,
> Krzysztof


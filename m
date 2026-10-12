Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAFA391E77
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801300; cv=none; b=WU1GEfVJBI1jMBmJokF+LbybBrMR2138cTDcREOgRnF69fOD+hwxDfLGH4EQcAYQddhSBljDAcH4TXeRttidgHrd1iyY4yvteQPdrEtcGiqp2IpfWLa1VmkGH2Ut2ETvgdcLOFrubdIBf+22188UfsbX/h41M1XS8yCmwpyew4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801300; c=relaxed/simple;
	bh=A/8d3MGe0cKlhjuNMdPI6hNkGEu7XvWn0HIltuSpx6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVREb+7WF7veaNczyVhTP8jCb4praERVSEGgFOwrLtVx02i6xaufmG+dEIiTYfQOX+O8uQKkSwQIls5ELR8BFhrOH/xunM41EUnbPT7ZrSEJz/XAQof98xYCvykQA30k625Df86a//GhPt3y5LO54ZVcTgiJgJj4fHost1B3vzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxK5zd2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJa7Z03w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxK5zd2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJa7Z03w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CA3YQK543531
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2F7D20dpodh/eJvaR+DqngoKHhbQHBiHpKVmEIWV09Y=; b=MxK5zd2xGBG3WilJ
	suaQei2srd3kRZniaWGU8wdCKUnqHdsmgjweB8zsHiDhD05UHtOMwp9yd/JZTcVf
	syXTLWlUpunpZmrQFjvViJn2gV7ZtTY0EbWtHijM6QrfR1T3aI+O08AMui1GsES3
	lvkQszgYFmkUJa331Z/iI5eisCw1k7RcNv9a+Qi4sNGkvS8kqKbloGTS7Z/A0pRa
	JpTjhAyvU3D6/x7wGlBAGiwSRGUtun58ptt/DSyYZ45RC2DtAJd3n+t06260DdE6
	mfPIUQVvASluiSusy0OLGoPwUogm2fLiTja9gW7ei9dNIn0xSUgVF9I2Ofh4h3C7
	2bFmoQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcr423-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:34:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so1715607a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791801296; x=1792406096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2F7D20dpodh/eJvaR+DqngoKHhbQHBiHpKVmEIWV09Y=;
        b=OJa7Z03wOXjYJs5Ky1BQ3JueoTBxKNpOc6zp25PeWSA0OqFSHR9I+YhHxsxXcvEKo/
         gFyQHq+4Svk8nzWs3L5qiuwlwr8gYfEbp6xCkV14bDAHIy9Li8/9m9Lzmuc3LS9lArYB
         wo9f1CITAJADpjaK14yNd9qmTQv1LqHYAD3gS3fWKvrkW8h9Pp1TnvXmUfirwuIDM6m6
         sI4CEs79hAcwRKz1w4Lls7zh4QQriW/pKqPbxlxDPAC8/fYRozmqxUdXpJhvYImgN/xI
         yfzWpuR82gFxBw0d2b70OiZ9xYRquO4zix6+cOf9T8sG5R9Om77E3a6kQxWgSg6MHpug
         8nZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801296; x=1792406096;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2F7D20dpodh/eJvaR+DqngoKHhbQHBiHpKVmEIWV09Y=;
        b=X8YRYxKNEDf769Z2FcMbfJnxXzU3b9noT5komc3/vR30F0cNYBMuGTkH6kBD176mr8
         NXrTG+wKkVNk7w61uv7q0T7QGcGYPVItMF+kmTLQ3IXJNPo6JN5HYz0PdnpsxJWh/5d+
         gYANyQCQMyhFxpjFyOnJ/p2WlNpKPRXO/OL7sKrDJynzymEypWQExL1ZQTFmDXRkx3OT
         VIwkTkiGqtnP0xfoRCf3k35WtNDXBHr1QuaVRHYQQOykcUkplgMtVYkEQ1Yrkq5GXqvF
         hlChovGJ8pY52+mYCcw1PDi38EUgVNksXQdePQiPVSNXW4Kj8uLCNS05J4xvQGiG9PKC
         0g3A==
X-Forwarded-Encrypted: i=1; AKwUvBwYFr3cJeLsv5ZCMYdSMrVQtVZzhv4dGm6cW6Se4GmN+djNqOUG/o5MeqK+viZ3oRU603FxKisHN6ZHtFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGN2zg67roZKglUmuY4M/15uDeOa30GAAJbIYkpZ5HAEWilh4E
	bwoZpA3Fvz9g2ppuPYS90LctvFO1Lz91F/ltNzR3CIpdQFBUnQ42mdxyNgo5fWyt0Pj3S+5s8AR
	Ef6pI+CKpyuxH7oPvwkNOr7RaGq7ZHAjcrR7x/3GmfB7Pg29IpFV9sjG5GydGO2v3liI=
X-Gm-Gg: AYBFou2HEWyl2/81u7AJINtPJ2R1BRO0J3W9oddGYieMI08It07Qr428wIuYTuvtA/r
	3g4y0n1Wf+J9tVNfa1TdSP8gbF4pS04ApBT0CZl6SbVAsoQmRbSnupbBPwZAu72EV2zWpcjwYXW
	ckIsU3Ip/tGbALvIhA6TLJg1QvnbKIQPMsTL5ciTXydSB29Chhd1YqNyR3j7pFMhunvkOA6VKzE
	MHkKhvTt7XvJEeUUOz/U3bN4QDYtgksKTLR94IpeiM0AzpChAs+1hxF1BoT7PDF+rM9SJQOoOc6
	Pqi2os+TMYWA6m634lBEZcVcFryyvkdHGryw+gwSdN8qRtGjpEtZzT04vc7KWsMpUKszF9Z3Sv0
	RW8Nn0DTe9uqPe48oGE+YpM0U1iuW
X-Received: by 2002:a17:90b:390a:b0:3ab:413:49a9 with SMTP id 98e67ed59e1d1-3ab3a932609mr8529234a91.50.1791801295708;
        Mon, 12 Oct 2026 03:34:55 -0700 (PDT)
X-Received: by 2002:a17:90b:390a:b0:3ab:413:49a9 with SMTP id 98e67ed59e1d1-3ab3a932609mr8529197a91.50.1791801294963;
        Mon, 12 Oct 2026 03:34:54 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.155.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3781d581sm16243499a91.1.2026.10.12.03.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:34:54 -0700 (PDT)
Message-ID: <74b6139b-a767-41fd-a628-a7d42a6c3aec@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:04:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] firmware: qcom: Add support for TEE based EFI-var
 client driver
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-6-bf1c8e2a64ab@oss.qualcomm.com>
 <ba0522df-8cdf-4510-96f8-748e0a419742@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <ba0522df-8cdf-4510-96f8-748e0a419742@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4TqYRKxgP2R4nYw3TDJ4TQT9oQuUNF86
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfX2nn0fl3h2wzN
 PAd4oW813RmwtvaYkyXsO1bZ5VCVwgqzk7PIxBlJ+slZ7gVmRDFk6UvmIeuQZAgn0YUiRamJBGH
 3YgOHguGLKqB3z3hkIsELdi6RFXn9bs=
X-Proofpoint-ORIG-GUID: 4TqYRKxgP2R4nYw3TDJ4TQT9oQuUNF86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfX79pKh4SPrf6C
 WRpo2wqsbHGxbQSiAnqTNQboM0ollbU1Or5Xl/qn+o6NMLCvEwbyMQBtl4Z9yIdW/XHgvX78ap6
 9Q/zQH8Agka5sZMKLG1FTRb8TmMObp28CUEzD5ZZSiQ7vjexz3btylrQaOFjlrZjZG7Qije6w/i
 mNh7JG3eq9KsxfAu2lCClzjAkcTG89dCCnwA2W2+lY4rTvub4YhRpFHZiu9kXer+Et4fTBv8xDc
 trL4LhqUKy4u46GjFqmh0vGp1bZTHk3mx9M/fg7ktPiNtHgTGk0gbFSS+m48pPASfSRIYcRTyrX
 V8poJLU/GafZLqvlZu0YVwg/rszsrKHtRNA51IGTrk+AttQkgx/zRXCi0WEhVL8vKllQFj5l+D/
 i3CzaVje4ABPKDQpTGzoIjvb4D0HNV+UnZpM7anYpohV1f4oKrKtBzBGzjb6vJ4uN+74mcmXOPO
 NuvJhZQcH0VJcbXebXw==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accb7d0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ivpbP8R7Mhpy7qfOLL/Q+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=XdMvMmsopDThE1cEod4A:9 a=Fj3fdtCelTHB4AuG:21 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120041

Hi Amir,

On 09-10-2026 08:04 am, Amirreza Zarrabi wrote:
> 
> 
> On 10/6/2026 10:33 PM, Harshal Dev wrote:
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
>> driver still probes, it does not support a listener interface with QTEE
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
>>  drivers/firmware/qcom/Kconfig               |  31 ++
>>  drivers/firmware/qcom/Makefile              |   1 +
>>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 648 ++++++++++++++++++++++++++++
>>  4 files changed, 686 insertions(+)
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
>> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
>> index 3ad22f8fc3e5..694d98fef4f4 100644
>> --- a/drivers/firmware/qcom/Kconfig
>> +++ b/drivers/firmware/qcom/Kconfig
>> @@ -79,4 +79,35 @@ config QCOM_QSEECOM_UEFISECAPP
>>  	  Select Y here to provide access to EFI variables on the aforementioned
>>  	  platforms.
>>  
>> +config QCOM_TEE_UEFISECAPP
>> +	tristate "Qualcomm TEE UEFI Secure App client driver"
>> +	depends on QCOMTEE
>> +	depends on EFI
>> +	help
>> +	  The QSEECOM protocol used for communicating with the Qualcomm Trusted
>> +	  Execution Environment (QTEE) is deprecated and replaced with the SMCInvoke
>> +	  protocol starting with the Qualcomm SM8x50 series. On platforms where the
>> +	  QSEECOM protocol still works (the QSEECOM driver probes) the driver does
>> +	  not support a listener interface with QTEE to enable writing of
>> +	  non-volatile EFI variables (via listener requests to Linux) in the Replay
>> +	  Protected Memory Block (RPMB) located on UFS/eMMC storage.
>> +	  Therefore on such platforms, the TEE based uefisecapp client driver
>> +	  (which communicates with QTEE via the SMCInvoke protocol) must be used
>> +	  to update such EFI variables through the RPMB service hosted in the QTEE
>> +	  supplicant user-space daemon (github.com/qualcomm/minkipc) which forwards
>> +	  RPMB packets to the RPMB device.
>> +	  NOTE: Qualcomm Compute platforms with SPI-NOR storage are an exception to
>> +	  this scenario. Since they do not have a firmware running on their SPI-NOR
>> +	  storage controller which must be programmed with a RPMB key, QTEE has a
>> +	  SPI-NOR driver which holds the key, and so the QSEECOM driver can be used
>> +	  for updating EFI variables on these platforms because QTEE never makes a
>> +	  listener request to Linux (QTEE doesn't need the Linux SPI-NOR driver).
>> +
>> +	  This module provides a TEE client driver for uefisecapp, installing efivar
>> +	  operations to allow the kernel and user-space access to EFI variables.
>> +
>> +	  Select m here to provide access to EFI variables on the aforementioned
>> +	  platforms if your Linux distribution has QTEE supplicant installed and
>> +	  running.
>> +
>>  endmenu
>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
>> index 88ce74d74c3e..237192b74de3 100644
>> --- a/drivers/firmware/qcom/Makefile
>> +++ b/drivers/firmware/qcom/Makefile
>> @@ -9,5 +9,6 @@ CFLAGS_qcom_scm-smc.o := -I$(src)
>>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
>> +obj-$(CONFIG_QCOM_TEE_UEFISECAPP) += qcom_tee_uefisecapp.o
>>  obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
>>  obj-$(CONFIG_QCOM_PAS_TEE)	+= qcom_pas_tee.o
>> diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.c b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>> new file mode 100644
>> index 000000000000..acb1709c0a53
>> --- /dev/null
>> +++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
>> @@ -0,0 +1,648 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/efi.h>
>> +#include <linux/tee.h>
>> +#include <linux/tee_drv.h>
>> +#include <linux/ucs2_string.h>
>> +
>> +#define QCOMTEE_OP_CLIENT_ENV_OPEN 0
>> +#define QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS 5
>> +
>> +/* Each service exposed by QTEE is identified by a 32-bit UID */
>> +#define QCOMTEE_UEFI_SEC_UID                 413
>> +
>> +/* Operations supported by the UEFI Sec App service */
>> +#define QCOMTEE_UEFI_SEC_OP_GET_VAR 0
>> +#define QCOMTEE_UEFI_SEC_OP_SET_VAR 1
>> +#define QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO 2
>> +#define QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME 3
>> +
>> +#define QCOMTEE_GET_VAR_NPARAMS 5
>> +#define QCOMTEE_SET_VAR_NPARAMS 4
>> +#define QCOMTEE_QUERY_VAR_NPARAMS 2
>> +#define QCOMTEE_GET_NEXT_VAR_NPARAMS 4
>> +#define QCOMTEE_GET_UEFI_SVC_NPARAMS 2
>> +#define QCOMTEE_GET_CLIENT_ENV_NPARAMS 2
>> +
>> +/* Error codes returned by the UEFI Sec App service */
>> +#define QCOMTEE_UEFI_SEC_SUCCESS 0
>> +#define QCOMTEE_UEFI_SEC_ERROR_INVALID_PARAMETER 10
>> +#define QCOMTEE_UEFI_SEC_ERROR_UNSUPPORTED 11
>> +#define QCOMTEE_UEFI_SEC_ERROR_WRITE_PROTECTED 12
>> +#define QCOMTEE_UEFI_SEC_ERROR_SECURITY_VIOLATION 13
>> +#define QCOMTEE_UEFI_SEC_ERROR_DEVICE_ERROR 14
>> +#define QCOMTEE_UEFI_SEC_ERROR_OUT_OF_RESOURCES 15
>> +#define QCOMTEE_UEFI_SEC_ERROR_VOLUME_CORRUPTED 16
>> +#define QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT 17
>> +#define QCOMTEE_UEFI_SEC_ERROR_NOT_FOUND 18
>> +#define QCOMTEE_UEFI_SEC_ERROR_ALREADY_STARTED 19
>> +
>> +/* Operations for objects are 32-bit. QCOMTEE transport uses the upper 16 bits. */
>> +#define QCOMTEE_MSG_OBJECT_OP_MASK GENMASK(15, 0)
>> +#define QCOMTEE_MSG_OBJECT_OP_RELEASE (QCOMTEE_MSG_OBJECT_OP_MASK - 0)
>> +
>> +/**
>> + * struct qcomtee_uefisec_app - An instance of UEFI Secure Application.
>> + * @dev: TEE client device on the TEE bus which represents uefisecapp.
>> + * @ctx: The context opened with the TEE subsystem by the uefisecapp client.
>> + * @uefisec_svc_obj: A TEE object representing the uefisecapp service.
>> + * @efivars: EFI variables registered with the EFI subsystem.
>> + */
>> +struct qcomtee_uefisec_app {
>> +	struct device *dev;
>> +	struct tee_context *ctx;
>> +	struct tee_param_objref uefisec_svc_obj;
>> +	struct efivars efivars;
>> +};
>> +
>> +#define UEFISECAPP_UUID \
>> +	UUID_INIT(0x01f95dcd, 0x2d7e, 0x58be, \
>> +		  0xa1, 0x43, 0x81, 0x32, 0xa1, 0x72, 0xdb, 0x7d)
>> +
>> +/* Short-hands for these long attribute names */
>> +#define UBUF_INPUT     TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT
>> +#define UBUF_OUTPUT    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT
>> +#define OBJREF_INPUT   TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT
>> +#define OBJREF_OUTPUT  TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT
>> +
>> +/* Init instance of 'struct tee_param_objref'. */
>> +#define SET_TEE_PARAM_OBJREF(param, attri, obj_id, obj_flag) do { \
>> +		(param).attr = (attri); \
>> +		(param).u.objref.id = (obj_id); \
>> +		(param).u.objref.flags = (obj_flag); \
>> +	} while (0)
>> +
>> +/* Init instance of 'struct tee_param_ubuf'. */
>> +#define SET_TEE_PARAM_UBUF(param, attri, ubuff) do { \
>> +		(param).attr = (attri); \
>> +		(param).u.ubuf = (ubuff);  \
>> +	} while (0)
>> +
>> +#define TEE_PARAM_UBUF(x) ((struct tee_param_ubuf){ .addr = &(x), sizeof(x) })
>> +
>> +#define SET_INVOKE_ARG(arg, object_id, opp, nparam) do { \
>> +		(arg).id = (object_id); \
>> +		(arg).op = (opp); \
>> +		(arg).num_params = (nparam); \
>> +	} while (0)
>> +
>> +static inline efi_status_t uefisecapp_err_to_efi_status(u32 err)
>> +{
>> +	switch (err) {
>> +	case QCOMTEE_UEFI_SEC_SUCCESS:
>> +		return EFI_SUCCESS;
>> +
>> +	case QCOMTEE_UEFI_SEC_ERROR_INVALID_PARAMETER:
>> +		return EFI_INVALID_PARAMETER;
>> +
>> +	case QCOMTEE_UEFI_SEC_ERROR_UNSUPPORTED:
>> +		return EFI_UNSUPPORTED;
>> +
>> +	case QCOMTEE_UEFI_SEC_ERROR_WRITE_PROTECTED:
>> +		return EFI_WRITE_PROTECTED;
>> +
>> +	case QCOMTEE_UEFI_SEC_ERROR_SECURITY_VIOLATION:
>> +		return EFI_SECURITY_VIOLATION;
>> +
>> +	case QCOMTEE_UEFI_SEC_ERROR_DEVICE_ERROR:
>> +		return EFI_DEVICE_ERROR;
>> +
>> +	case QCOMTEE_UEFI_SEC_ERROR_OUT_OF_RESOURCES:
>> +		return EFI_OUT_OF_RESOURCES;
>> +
>> +	case QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT:
>> +		return EFI_BUFFER_TOO_SMALL;
>> +
>> +	case QCOMTEE_UEFI_SEC_ERROR_NOT_FOUND:
>> +		return EFI_NOT_FOUND;
>> +
>> +	/* No matching on EFI_* list. */
>> +	case QCOMTEE_UEFI_SEC_ERROR_ALREADY_STARTED: /* EFI_ALREADY_STARTED.  */
>> +	case QCOMTEE_UEFI_SEC_ERROR_VOLUME_CORRUPTED: /* EFI_VOLUME_CORRUPTED. */
>> +	default:
>> +		return EFI_DEVICE_ERROR;
>> +	}
>> +}
>> +
>> +static struct qcomtee_uefisec_app uefisec_app;
> 
> Should not this singleton be protected, for instance against concurrent call and driver unbound?
>

The top-level efi_var framework which invokes the efivar_operations callbacks
defined below always takes an efivar_lock() before calling them, see:
https://elixir.bootlin.com/linux/v7.3-rc5/source/fs/efivarfs/vars.c#L501

Also, when this driver is being unbound the efivar_unregister() function called
at the start of qcomtee_uefisecapp_remove() attempts to take the same lock.
So a concurrent call efi-var call and driver remove are protected by
efivar_lock().

Since this singleton is always accessed under the same efivar_lock()
everywhere in this driver, it is also implicitly protected.
This is the reason why the STM efivar driver also doesn't protect its
singleton:
https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/firmware/efi/stmm/tee_stmm_efi.c#L27

I will add a comment on top of this singleton to explain that it is implictly
protected by efivar_lock().

Please do point out if there is some other corner case which you believe is
still not covered by the efivar_lock().

Regards,
Harshal 
>> +
>> +static int qcuefi_get_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
>> +			       struct tee_param_ubuf in_attributes,
>> +			       struct tee_param_ubuf *data,
>> +			       u32 *out_attributes, u32 *out_errno)
>> +{
>> +	int ret;
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
>> +	struct tee_param param[QCOMTEE_GET_VAR_NPARAMS];
>> +
>> +	struct {
>> +		efi_guid_t guid;
>> +		u32 in_data_size;
>> +	} in_cong = { 0 };
>> +
>> +	struct {
>> +		u32 out_data_size;
>> +		u32 attributes;
>> +		u32 errno;
>> +	} out_cong = { 0 };
>> +
>> +	in_cong.guid = *guid;
>> +	in_cong.in_data_size = data->size;
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	memset(&param, 0, sizeof(param));
>> +
>> +	SET_INVOKE_ARG(inv_arg, obj_id,
>> +		       QCOMTEE_UEFI_SEC_OP_GET_VAR,
>> +		       QCOMTEE_GET_VAR_NPARAMS);
>> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
>> +	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
>> +	SET_TEE_PARAM_UBUF(param[2], UBUF_INPUT, in_attributes);
>> +	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
>> +	SET_TEE_PARAM_UBUF(param[4], UBUF_OUTPUT, *data);
>> +
>> +	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_GET_VAR invoke ret: %d, err: 0x%x\n",
>> +			ret, inv_arg.ret);
>> +		return ret ?: inv_arg.ret;
>> +	}
>> +
>> +	data->size = out_cong.out_data_size;
>> +	*out_attributes = out_cong.attributes;
>> +	*out_errno = out_cong.errno;
>> +
>> +	return ret;
>> +}
>> +
>> +static efi_status_t qcomtee_uefi_get_variable(efi_char16_t *name, efi_guid_t *guid,
>> +					      u32 *attr, unsigned long *data_size,
>> +					      void *data)
>> +{
>> +	int ret;
>> +	u32 in_attr, out_attributes, out_errno;
>> +	struct tee_param_ubuf in_data, in_var, in_attributes;
>> +
>> +	if (!name || !guid)
>> +		return EFI_INVALID_PARAMETER;
>> +
>> +	/* 'attr' can be NULL, however an input attribute is always expected
>> +	 * by UefiSecApp TA
>> +	 */
>> +	in_attr = 0;
>> +	if (attr)
>> +		in_attr = *attr;
>> +
>> +	in_data = (struct tee_param_ubuf){ .addr = data, *data_size };
>> +	in_var = (struct tee_param_ubuf){ .addr = name,
>> +					  (ucs2_strlen(name) + 1) * sizeof(*name) };
>> +	in_attributes = (struct tee_param_ubuf){ .addr = &in_attr, sizeof(u32) };
>> +
>> +	/* On SUCCESS, 'data' member of 'in_data' has already been updated. */
>> +	ret = qcuefi_get_variable(in_var, guid, in_attributes, &in_data,
>> +				  &out_attributes, &out_errno);
>> +
>> +	if (ret)
>> +		return EFI_DEVICE_ERROR;
>> +
>> +	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT) {
>> +		/* If 'attr' is NULL 'out_attributes' is not updated. */
>> +		if (attr)
>> +			*attr = out_attributes;
>> +
>> +		*data_size = in_data.size;
>> +	}
>> +
>> +	return uefisecapp_err_to_efi_status(out_errno);
>> +}
>> +
>> +static int qcuefi_set_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
>> +			       u32 attributes, struct tee_param_ubuf data,
>> +			       u32 *out_errno)
>> +{
>> +	int ret;
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
>> +	struct tee_param param[QCOMTEE_SET_VAR_NPARAMS];
>> +
>> +	struct {
>> +		efi_guid_t guid;
>> +		u32 attributes;
>> +		u32 in_data_size;
>> +	} in_cong = { 0 };
>> +
>> +	in_cong.guid = *guid;
>> +	in_cong.attributes = attributes;
>> +	in_cong.in_data_size = data.size;
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	memset(&param, 0, sizeof(param));
>> +
>> +	SET_INVOKE_ARG(inv_arg, obj_id,
>> +		       QCOMTEE_UEFI_SEC_OP_SET_VAR,
>> +		       QCOMTEE_SET_VAR_NPARAMS);
>> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
>> +	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
>> +	SET_TEE_PARAM_UBUF(param[2], UBUF_INPUT, data);
>> +	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, TEE_PARAM_UBUF(*out_errno));
>> +
>> +	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_SET_VAR invoke ret: %d, err: 0x%x\n",
>> +			ret, inv_arg.ret);
>> +		return ret ?: inv_arg.ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static efi_status_t qcomtee_uefi_set_variable(efi_char16_t *name, efi_guid_t *guid,
>> +					      u32 attr, unsigned long data_size,
>> +					      void *data)
>> +{
>> +	int ret;
>> +	u32 out_errno;
>> +	struct tee_param_ubuf in_data, in_var;
>> +
>> +	if (!name || !guid)
>> +		return EFI_INVALID_PARAMETER;
>> +
>> +	in_data = (struct tee_param_ubuf){ .addr = data, data_size };
>> +	in_var = (struct tee_param_ubuf){ .addr = name,
>> +					  (ucs2_strlen(name) + 1) * sizeof(*name) };
>> +
>> +	ret = qcuefi_set_variable(in_var, guid, attr, in_data, &out_errno);
>> +	if (ret)
>> +		return EFI_DEVICE_ERROR;
>> +
>> +	return uefisecapp_err_to_efi_status(out_errno);
>> +}
>> +
>> +static int qcuefi_get_next_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
>> +				    struct tee_param_ubuf *out_variable,
>> +				    efi_guid_t *out_vendor_guid, u32 *out_errno)
>> +{
>> +	int ret;
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
>> +	struct tee_param param[QCOMTEE_GET_NEXT_VAR_NPARAMS];
>> +
>> +	struct {
>> +		efi_guid_t guid;
>> +		u32 in_data_size;
>> +	} in_cong = { 0 };
>> +
>> +	struct {
>> +		efi_guid_t guid;
>> +		u32 out_data_size;
>> +		u32 errno;
>> +	} out_cong = { 0 };
>> +
>> +	/* Pass size of available buffer */
>> +	in_cong.in_data_size = out_variable->size;
>> +	in_cong.guid = *guid;
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	memset(&param, 0, sizeof(param));
>> +
>> +	SET_INVOKE_ARG(inv_arg, obj_id,
>> +		       QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME,
>> +		       QCOMTEE_GET_NEXT_VAR_NPARAMS);
>> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
>> +	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
>> +	SET_TEE_PARAM_UBUF(param[2], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
>> +	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, *out_variable);
>> +
>> +	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME invoke ret: %d, err: 0x%x\n",
>> +			ret, inv_arg.ret);
>> +		return ret ?: inv_arg.ret;
>> +	}
>> +
>> +	/* UefiSecApp TA does not touch 'out_variable.size'. Update it here.
>> +	 * On SUCCESS (!out_errno), 'out_data_size' is length of name in 'out_variable.addr'.
>> +	 * On failure (out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT), 'out_data_size' is
>> +	 * actual name length.
>> +	 * Otherwise, it's undefined.
>> +	 */
>> +	out_variable->size = out_cong.out_data_size;
>> +	*out_vendor_guid = out_cong.guid;
>> +	*out_errno = out_cong.errno;
>> +
>> +	return ret;
>> +}
>> +
>> +static efi_status_t qcomtee_uefi_get_next_variable(unsigned long *name_size,
>> +						   efi_char16_t *name,
>> +						   efi_guid_t *guid)
>> +{
>> +	int ret;
>> +	u32 out_errno;
>> +	efi_guid_t out_guid;
>> +	struct tee_param_ubuf in_var, out_var;
>> +
>> +	if (!name_size || !name || !guid)
>> +		return EFI_INVALID_PARAMETER;
>> +
>> +	if (*name_size == 0)
>> +		return EFI_INVALID_PARAMETER;
>> +
>> +	/* For 'in_var', 'name_size' is not necessarily size of 'name';
>> +	 * could be size of buffer where 'name' has been stored. TA expects a
>> +	 * NULL-terminated string in 'name' and ignores the size.
>> +	 * For 'out_var', 'name_size' is size of buffer pointed by 'name'.
>> +	 */
>> +	in_var = (struct tee_param_ubuf){ .addr = name, *name_size };
>> +	out_var = (struct tee_param_ubuf){ .addr = name, *name_size };
>> +
>> +	ret = qcuefi_get_next_variable(in_var, guid, &out_var, &out_guid,
>> +				       &out_errno);
>> +	if (ret)
>> +		return EFI_DEVICE_ERROR;
>> +
>> +	if (!out_errno)
>> +		*guid = out_guid;
>> +
>> +	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT)
>> +		*name_size = out_var.size;
>> +
>> +	/* On SUCCESS, 'name' stores the next variable name. */
>> +	return uefisecapp_err_to_efi_status(out_errno);
>> +}
>> +
>> +static int qcuefi_query_variable_info(u32 attributes,
>> +				      u64 *maximum_variable_storage_size,
>> +				      u64 *remaining_variable_storage_size,
>> +				      u64 *maximum_variable_size, u32 *out_errno)
>> +{
>> +	int ret;
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
>> +	struct tee_param param[QCOMTEE_QUERY_VAR_NPARAMS];
>> +
>> +	struct {
>> +		u64 max_var_storage_size;
>> +		u64 remaining_var_storage_size;
>> +		u64 maximum_var_size;
>> +		u32 errno;
>> +	} out_cong = { 0 };
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	memset(&param, 0, sizeof(param));
>> +
>> +	SET_INVOKE_ARG(inv_arg, obj_id,
>> +		       QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO,
>> +		       QCOMTEE_QUERY_VAR_NPARAMS);
>> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(attributes));
>> +	SET_TEE_PARAM_UBUF(param[1], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
>> +
>> +	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO invoke ret: %d, err: 0x%x\n",
>> +			ret, inv_arg.ret);
>> +		return ret ?: inv_arg.ret;
>> +	}
>> +
>> +	*maximum_variable_storage_size = out_cong.max_var_storage_size;
>> +	*remaining_variable_storage_size = out_cong.remaining_var_storage_size;
>> +	*maximum_variable_size = out_cong.maximum_var_size;
>> +	*out_errno = out_cong.errno;
>> +
>> +	return ret;
>> +}
>> +
>> +static efi_status_t qcomtee_uefi_query_variable_info(u32 attr, u64 *storage_space,
>> +						     u64 *remaining_space,
>> +						     u64 *max_variable_size)
>> +{
>> +	int ret;
>> +	u32 out_errno;
>> +	u64 maximum_variable_storage_size;
>> +	u64 remaining_variable_storage_size;
>> +	u64 maximum_variable_size;
>> +
>> +	if (!storage_space || !remaining_space || !max_variable_size)
>> +		return EFI_INVALID_PARAMETER;
>> +
>> +	ret = qcuefi_query_variable_info(attr,
>> +					 &maximum_variable_storage_size,
>> +					 &remaining_variable_storage_size,
>> +					 &maximum_variable_size,
>> +					 &out_errno);
>> +
>> +	if (ret)
>> +		return EFI_DEVICE_ERROR;
>> +
>> +	if (!out_errno) {
>> +		*storage_space = maximum_variable_storage_size;
>> +		*remaining_space = remaining_variable_storage_size;
>> +		*max_variable_size = maximum_variable_size;
>> +	}
>> +
>> +	return uefisecapp_err_to_efi_status(out_errno);
>> +}
>> +
>> +/**
>> + * qcomtee_release_object() - Release an object returned by QTEE.
>> + *
>> + * Each object returned by QTEE repesents a secure service exposed to the
>> + * client. Whenever an secure service is opened, QTEE may allocate resources
>> + * on the client's behalf. Therefore, once the client is done accessing the
>> + * secure service, the object representing it should be explicitly released
>> + * so that QTEE can release the associated resources as well.
>> + *
>> + * @ctx: TEE context.
>> + * @object: The object to release.
>> + */
>> +static void qcomtee_release_object(struct tee_context *ctx,
>> +				   struct tee_param_objref object)
>> +{
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	SET_INVOKE_ARG(inv_arg, object.id, QCOMTEE_MSG_OBJECT_OP_RELEASE, 0);
>> +	tee_client_object_invoke_func(ctx, &inv_arg, NULL);
>> +}
>> +
>> +/**
>> + * qcomtee_get_uefisec_svc_obj() - Get a UEFI Secure App service object to
>> + * begin communication with the service.
>> + * @ctx: TEE context.
>> + * @client_env_obj: The client environment object returned earlier by QTEE.
>> + * @uefisec_svc_obj: The UEFI Secure App service object.
>> + *
>> + * Returns 0 on success.
>> + * Returns < 0 if client environment object invocation failed.
>> + * Returns > 0 if client environment invocation was success but UEFI Secure App
>> + * service object could not be returned for some other reason (represented by the
>> + * returned value)
>> + */
>> +static int qcomtee_get_uefisec_svc_obj(struct tee_context *ctx,
>> +				       struct tee_param_objref client_env_obj,
>> +				       struct tee_param_objref *uefisec_svc_obj)
>> +{
>> +	int ret;
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +	u64 obj_id = client_env_obj.id;
>> +	struct tee_param param[QCOMTEE_GET_UEFI_SVC_NPARAMS];
>> +	u32 uefisec_uid = QCOMTEE_UEFI_SEC_UID;
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	memset(&param, 0, sizeof(param));
>> +
>> +	SET_INVOKE_ARG(inv_arg, obj_id,
>> +		       QCOMTEE_OP_CLIENT_ENV_OPEN,
>> +		       QCOMTEE_GET_UEFI_SVC_NPARAMS);
>> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(uefisec_uid));
>> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
>> +
>> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(uefisec_app.dev, "QCOMTEE_CLIENT_ENV_OPEN invoke ret: %d, err: 0x%x\n",
>> +			ret, inv_arg.ret);
>> +		return ret ?: inv_arg.ret;
>> +	}
>> +
>> +	*uefisec_svc_obj = param[1].u.objref;
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qcomtee_get_client_env_obj() - Get a client environment object to begin
>> + * object exchange with QTEE.
>> + * @ctx: TEE context.
>> + * @client_env_obj: The client environment object returned by QTEE.
>> + *
>> + * Returns 0 on success.
>> + * Returns < 0 if root object invocation failed.
>> + * Returns > 0 if root object invocation was success but client environment
>> + * object could not be returned for some other reason (represented by the
>> + * returned value)
>> + */
>> +static int qcomtee_get_client_env_obj(struct tee_context *ctx,
>> +				      struct tee_param_objref *client_env_obj)
>> +{
>> +	int ret;
>> +	struct tee_ioctl_object_invoke_arg inv_arg;
>> +	struct tee_param param[QCOMTEE_GET_CLIENT_ENV_NPARAMS];
>> +
>> +	memset(&inv_arg, 0, sizeof(inv_arg));
>> +	memset(&param, 0, sizeof(param));
>> +
>> +	SET_INVOKE_ARG(inv_arg, TEE_OBJREF_NULL,
>> +		       QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS,
>> +		       QCOMTEE_GET_CLIENT_ENV_NPARAMS);
>> +	SET_TEE_PARAM_OBJREF(param[0], OBJREF_INPUT, TEE_OBJREF_NULL, 0);
>> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
>> +
>> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(uefisec_app.dev, "QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS invoke ret: %d, err: 0x%x\n",
>> +			ret, inv_arg.ret);
>> +		return ret ?: inv_arg.ret;
>> +	}
>> +
>> +	*client_env_obj = param[1].u.objref;
>> +	return ret;
>> +}
>> +
>> +static const struct efivar_operations qcom_efivar_ops = {
>> +	.get_variable = qcomtee_uefi_get_variable,
>> +	.set_variable = qcomtee_uefi_set_variable,
>> +	.get_next_variable = qcomtee_uefi_get_next_variable,
>> +	.query_variable_info = qcomtee_uefi_query_variable_info,
>> +};
>> +
>> +static int qcomtee_ctx_match(struct tee_ioctl_version_data *ver,
>> +			     const void *data)
>> +{
>> +	return (ver->impl_id == TEE_IMPL_ID_QTEE);
>> +}
>> +
>> +static int qcomtee_uefisecapp_probe(struct tee_client_device *tee_dev)
>> +{
>> +	int ret, err;
>> +	struct tee_param_objref client_env_obj;
>> +	struct tee_param_objref uefisec_svc_obj;
>> +
>> +	uefisec_app.dev = &tee_dev->dev;
>> +	/* Open context with QCOMTEE driver */
>> +	uefisec_app.ctx = tee_client_open_context(NULL, qcomtee_ctx_match, NULL,
>> +						  NULL);
>> +	if (IS_ERR(uefisec_app.ctx))
>> +		return -ENODEV;
>> +
>> +	/* Obtain a reference to client_env object to begin object exchange
>> +	 * with QTEE
>> +	 */
>> +	ret = qcomtee_get_client_env_obj(uefisec_app.ctx, &client_env_obj);
>> +	if (ret) {
>> +		err = -EINVAL;
>> +		goto err_get_client_env;
>> +	}
>> +
>> +	/* Obtain a reference to the uefisec_svc object which provides access to
>> +	 * the EFI var storage.
>> +	 */
>> +	ret = qcomtee_get_uefisec_svc_obj(uefisec_app.ctx, client_env_obj,
>> +					  &uefisec_svc_obj);
>> +	if (ret) {
>> +		err = -EINVAL;
>> +		goto err_get_uefisec_svc;
>> +	}
>> +	uefisec_app.uefisec_svc_obj = uefisec_svc_obj;
>> +
>> +	ret = efivars_register(&uefisec_app.efivars, &qcom_efivar_ops);
>> +	if (ret) {
>> +		err = ret;
>> +		goto err_efi_vars_reg;
>> +	}
>> +
>> +	/* We don't need to keep a reference to this object anymore, we only
>> +	 * needed it to obtain the uefisec_svc object.
>> +	 */
>> +	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
>> +	return 0;
>> +
>> +err_efi_vars_reg:
>> +	qcomtee_release_object(uefisec_app.ctx, uefisec_svc_obj);
>> +err_get_uefisec_svc:
>> +	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
>> +err_get_client_env:
>> +	tee_client_close_context(uefisec_app.ctx);
>> +
>> +	return err;
>> +}
>> +
>> +static void qcomtee_uefisecapp_remove(struct tee_client_device *tee_dev)
>> +{
>> +	efivars_unregister(&uefisec_app.efivars);
>> +	qcomtee_release_object(uefisec_app.ctx, uefisec_app.uefisec_svc_obj);
>> +	tee_client_close_context(uefisec_app.ctx);
>> +}
>> +
>> +static const struct tee_client_device_id qcomtee_uefisecapp_id_table[] = {
>> +	{UEFISECAPP_UUID},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(tee, qcomtee_uefisecapp_id_table);
>> +
>> +static struct tee_client_driver qcomtee_uefisecapp_driver = {
>> +	.id_table	= qcomtee_uefisecapp_id_table,
>> +	.probe		= qcomtee_uefisecapp_probe,
>> +	.remove		= qcomtee_uefisecapp_remove,
>> +	.driver		= {
>> +		.name		= "qcom-tee-uefisecapp",
>> +	},
>> +};
>> +
>> +module_tee_client_driver(qcomtee_uefisecapp_driver);
>> +
>> +MODULE_AUTHOR("Qualcomm");
>> +MODULE_DESCRIPTION("TEE client driver for Qualcomm TEE UEFI Secure App");
>> +MODULE_LICENSE("GPL");
>>
> 


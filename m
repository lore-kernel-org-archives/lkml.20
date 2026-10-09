Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84741A38F9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513311; cv=none; b=B2cZ4QcoyY2B7ngdBnHkB4wI/vkPS/q6AMPvB/2JzOvy3nWXJkE2fXnUXV8n8IXVEcUViZRNxLOli6QCmR0t8RsncMNzwqbS3BLUHpijZedu2BnSUMvi2D2OIJlZQab9Qws0Gvw+lKmyvcxUmpvmWZ0PUaXU2IzVx4PiaNs6ddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513311; c=relaxed/simple;
	bh=KOELMj0LwV5zsBTHyKOHzsraCuoji44mPg7ahaZLI+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rs3994I1lCH7/TdVF8X/WKk1RWxGjxzpE7y42phW22c2QZfZdBTiiFVRLzf2krzMOV6Npp8qn32oxNfHnVF/3TORluqT5p7ulNmK41ymQ08EK1evdFfdESgX3XegwAza9NTZHDJ+zBaHLaKpdstMmzISGb1/pug6FAmylHy7uQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1zsJbgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRXW02dJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1zsJbgh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRXW02dJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990PRaG2958817
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 02:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfsweV6M9RJMr0ZZ5+OOh8EVgv6iTz3OXA+hsWJLjpA=; b=Z1zsJbghBUFErQ3Y
	uEVuwSPPz/d0ltHTkpiPQKTzSK6lZPnBd8s5zQ2Xgw0DkmBLqz7ZIRm06akmTAwA
	ayGsZUQHVJ+VAsUTZI4Qqcjs/kKKkdtTiQ7giVqgyJgM33P1wybgPd8F5Hf6fKTT
	ZsPSqdyuKgDG9gcTG9a0995ohHBu0VO5YVqMYyqysPMn6gDobFttHAMBFuD3jp0t
	CDl25n6MuiMtHZf8kgJ8sghQjIuRXwRfhgAAxXBuJ7FtlULb6jAUTMA9aPN0Y0fu
	6xbx0qv8+Lh1OsvKFXhWm6qAqWzB7v7ptCDMN4mrU+U4AzHR1075a2qZ0fKkvzLn
	W3wxJA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev59t4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:35:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1254212a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791513308; x=1792118108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfsweV6M9RJMr0ZZ5+OOh8EVgv6iTz3OXA+hsWJLjpA=;
        b=eRXW02dJGS87QmEGYVpR6TZzjPHVWCobnMdqeRssrIKRXjAddQHixiq616bup69FQk
         9xBe06ka+Xj53j0VHRrT3RVpeUDepq0v6HjEfH3ffycenY2JOvZQSfbdPiWQt51ZVjc2
         d5Nh6uq4LWftH2WqVqmRhd3bxlhCUjnepr0Oftx9i+kKXQTfqMsDEIhNIGKUpzI0L+Hp
         ZDewwRCTnDIg0Da8MmoPLS5qJ92hE9HD/XBO4Aqu2wBhnlY9mcbtIQCsdxUqsLp4dhS9
         73KHbn2X+8RDM88zXxBAYfW4mQfsVRED+L3QclnMYPz8AtmWTTtdDDhC0/1gsAOCnll9
         qu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791513308; x=1792118108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfsweV6M9RJMr0ZZ5+OOh8EVgv6iTz3OXA+hsWJLjpA=;
        b=ynt5l5lf8pQA2iox1rSwW5gkkeYH+onzbZp2GSgDooMAryRWvnzroK8fW/a8Abr1Fw
         16SCrCfXLxDs4GnlSK94CdrHrdHspSwBSsHa/OA/NIaR7AqftQl45fPSgW3Y/Afw9zpp
         eEeb9gMKRf1HCE4u5rCIdJ+tD60mGIiuOJC2IJXAl4uVSY80mgnguRi/NYXDJ03blfHj
         CxtzdMzAEE5KqpWvPoqIhIL3dg0qVHoR5Ccnid4HiF28fgJb0hLoKkQfLqYoLF74Sy6O
         fN8vjpndp1ilINVcAz3Ir3YoKxcpEaLOAL26vNwLWHy4uwW+WWODvdI4WIqrugOzH6+b
         VlBA==
X-Forwarded-Encrypted: i=1; AKwUvByFSlZWMqg39cWxh4t32dDhdTh3KtVzUQBicynIplE3mxflyVv0dSy5YA1EoqdT3ej0962qnBZgU9jsmL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLopyyOEcMQY+nsdS+O+PY5ExMjcOAaX947RMmhogyfQp8P21S4
	HOjlM29dNKrkarHYORM9+BKAUxZ5SpjamJKTM7jo/xem/hOX1a8frarI2fBC4fAMXMxcHNMeN3M
	AB/218w/g5ZR0Bl/e+LUTc5dq26zotxMb5TSnhCIc0DhGLmVTUMHksUsR0S1nK2JNIA==
X-Gm-Gg: AYBFou0MrVKOt+3vgBdBEDCaNNfhK0jCAlHden05lKYIdXOu2AAbMI2eN4ey/T5A3L2
	hGwPFSIipzAkNSQWn3roPFqEE8EE5sa+pzUTDdJOAv6WNgj6NR3njDLCS2gfa9zQcYv8FPSPdoX
	7FtO5/N5yMIIXvPUAvlDM9sf060p7j+hTaOlJv4NKnAGOVU3m8tQa88fNU1q1Cmxww0KQdewb2E
	NLzPCp5Np9dbXW2guyX4Ts6bKe46dxNDjZe3giBRDAzArObcYllR5lyrYZqiZ56R5OC88jBiIcM
	UbbNLhdxTQl3tlVk4Q7dJ/9L4zP62PLFLSBR3WtxT5NlT8EA7O+RteZetfCVVp+OJ0qs4qcBYUm
	tIQhdxLzJ1L2SZi2wgESipXErRKBxSpjR
X-Received: by 2002:a17:90b:258f:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3ab3a9a8d2bmr301841a91.20.1791513306167;
        Thu, 08 Oct 2026 19:35:06 -0700 (PDT)
X-Received: by 2002:a17:90b:258f:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3ab3a9a8d2bmr301817a91.20.1791513305208;
        Thu, 08 Oct 2026 19:35:05 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ca1e04sm1399622a91.1.2026.10.08.19.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 19:35:04 -0700 (PDT)
Message-ID: <ba0522df-8cdf-4510-96f8-748e0a419742@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 13:34:56 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] firmware: qcom: Add support for TEE based EFI-var
 client driver
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
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
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-6-bf1c8e2a64ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxMCBTYWx0ZWRfXx9M8axaIU7JU
 OnHHGY7FMn4XmNkKybJ1TS5urdzl3FYflIg44Bix4ZgS52Oz86RFhmf+Aaw5S3mfdr3PGZ2ZvCE
 T5cvxkTgmPMKRigd12eCtsITstbr3QQ=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac852dc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=81jqDg-q10b2Op3f9YwA:9
 a=Fj3fdtCelTHB4AuG:21 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: -ojONWSvN2077qahzw3REMVZHHQboLJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxMCBTYWx0ZWRfX4bVLluuW0bfl
 ZQbZqZ4L/ZukPC6K+P/u6pcBwF3Ot+Tajc4eQ5LjfcxG65NUiinuZ3GNukCAfQZST/DeXNvkozw
 EHPVZIl/Ox1HhxFy8OIx7xYMe4Z7w8ZCcPZPqxGB8OyVCb7OpAVvy0rJNunXlS4lQ3mkBiZ8CLH
 jR+3twWTMJdbjBKd0mP9yO2uW7my9TsnZrpOEWkTJ+6M/3LDypWs/+MIERa6BspFqJJtmlXUkyR
 S7qAswHbC6FKepWcnPu7sO8cLeJSxaiQSe4Mfmnm1MyMRO/de0eAhn2keuZFpQZa8ZZ8bwu/pg5
 TIMjWzzEY9j+1z8E29VT8qSC/W1Je85xBs3/ezJHlDnv297U99U2bA1bkgxQ7MPZ+boHRohRY37
 TlxQw3+P1Zqf019kRxjdg4PYVI9/ppftQthwu2esW9salXZAAkjUtZbt9YIMWTafKgRmqHbfuqv
 +HzwFp3TG8FZMrtILrw==
X-Proofpoint-ORIG-GUID: -ojONWSvN2077qahzw3REMVZHHQboLJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090010



On 10/6/2026 10:33 PM, Harshal Dev wrote:
> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
> Replay Protected Memory Block (RPMB) located within either the UFS,
> eMMC or SPI-NOR storage. The RPMB key which is one-time programmed into
> the storage controller to allow authentication of the RPMB frames is
> generated by and only available to the Qualcomm Trusted Execution
> Environment (QTEE).
> 
> The legacy QSEECOM protocol used for communicating with the QTEE is
> deprecated and replaced with the use-case agnostic SMCInvoke protocol
> starting with the Qualcomm SM8x50 series. On platforms where the QSEECOM
> driver still probes, it does not support a listener interface with QTEE
> to enable writing of non-volatile EFI variables to the RPMB for UFS and
> eMMC storage.
> Therefore on such platforms, a TEE client driver which communicates with
> QTEE via the SMCInvoke protocol implemented by the QCOMTEE driver (and
> registered with the TEE subsystem) must be used to update such EFI
> variables.
> 
> Add support for a TEE based uefisecapp client driver which installs efivar
> operations after obtaining an object reference to the uefisecapp service.
> This enables the kernel/user-space to access or modify both volatile EFI
> variables stored by the Secure Application (in-memory) and non-volatile
> ones stored within RPMB.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  MAINTAINERS                                 |   6 +
>  drivers/firmware/qcom/Kconfig               |  31 ++
>  drivers/firmware/qcom/Makefile              |   1 +
>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 648 ++++++++++++++++++++++++++++
>  4 files changed, 686 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 30c1cdd0fb38..7ccedad8d388 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22981,6 +22981,12 @@ L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  F:	drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>  
> +QUALCOMM TEE UEFISECAPP DRIVER
> +M:	Harshal Dev <harshal.dev@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	drivers/firmware/qcom/qcom_tee_uefisecapp.c
> +
>  QUALCOMM PINCTRL DRIVERS
>  M:	Bartosz Golaszewski <brgl@kernel.org>
>  L:	linux-arm-msm@vger.kernel.org
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index 3ad22f8fc3e5..694d98fef4f4 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -79,4 +79,35 @@ config QCOM_QSEECOM_UEFISECAPP
>  	  Select Y here to provide access to EFI variables on the aforementioned
>  	  platforms.
>  
> +config QCOM_TEE_UEFISECAPP
> +	tristate "Qualcomm TEE UEFI Secure App client driver"
> +	depends on QCOMTEE
> +	depends on EFI
> +	help
> +	  The QSEECOM protocol used for communicating with the Qualcomm Trusted
> +	  Execution Environment (QTEE) is deprecated and replaced with the SMCInvoke
> +	  protocol starting with the Qualcomm SM8x50 series. On platforms where the
> +	  QSEECOM protocol still works (the QSEECOM driver probes) the driver does
> +	  not support a listener interface with QTEE to enable writing of
> +	  non-volatile EFI variables (via listener requests to Linux) in the Replay
> +	  Protected Memory Block (RPMB) located on UFS/eMMC storage.
> +	  Therefore on such platforms, the TEE based uefisecapp client driver
> +	  (which communicates with QTEE via the SMCInvoke protocol) must be used
> +	  to update such EFI variables through the RPMB service hosted in the QTEE
> +	  supplicant user-space daemon (github.com/qualcomm/minkipc) which forwards
> +	  RPMB packets to the RPMB device.
> +	  NOTE: Qualcomm Compute platforms with SPI-NOR storage are an exception to
> +	  this scenario. Since they do not have a firmware running on their SPI-NOR
> +	  storage controller which must be programmed with a RPMB key, QTEE has a
> +	  SPI-NOR driver which holds the key, and so the QSEECOM driver can be used
> +	  for updating EFI variables on these platforms because QTEE never makes a
> +	  listener request to Linux (QTEE doesn't need the Linux SPI-NOR driver).
> +
> +	  This module provides a TEE client driver for uefisecapp, installing efivar
> +	  operations to allow the kernel and user-space access to EFI variables.
> +
> +	  Select m here to provide access to EFI variables on the aforementioned
> +	  platforms if your Linux distribution has QTEE supplicant installed and
> +	  running.
> +
>  endmenu
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> index 88ce74d74c3e..237192b74de3 100644
> --- a/drivers/firmware/qcom/Makefile
> +++ b/drivers/firmware/qcom/Makefile
> @@ -9,5 +9,6 @@ CFLAGS_qcom_scm-smc.o := -I$(src)
>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
> +obj-$(CONFIG_QCOM_TEE_UEFISECAPP) += qcom_tee_uefisecapp.o
>  obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
>  obj-$(CONFIG_QCOM_PAS_TEE)	+= qcom_pas_tee.o
> diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.c b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
> new file mode 100644
> index 000000000000..acb1709c0a53
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
> @@ -0,0 +1,648 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/efi.h>
> +#include <linux/tee.h>
> +#include <linux/tee_drv.h>
> +#include <linux/ucs2_string.h>
> +
> +#define QCOMTEE_OP_CLIENT_ENV_OPEN 0
> +#define QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS 5
> +
> +/* Each service exposed by QTEE is identified by a 32-bit UID */
> +#define QCOMTEE_UEFI_SEC_UID                 413
> +
> +/* Operations supported by the UEFI Sec App service */
> +#define QCOMTEE_UEFI_SEC_OP_GET_VAR 0
> +#define QCOMTEE_UEFI_SEC_OP_SET_VAR 1
> +#define QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO 2
> +#define QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME 3
> +
> +#define QCOMTEE_GET_VAR_NPARAMS 5
> +#define QCOMTEE_SET_VAR_NPARAMS 4
> +#define QCOMTEE_QUERY_VAR_NPARAMS 2
> +#define QCOMTEE_GET_NEXT_VAR_NPARAMS 4
> +#define QCOMTEE_GET_UEFI_SVC_NPARAMS 2
> +#define QCOMTEE_GET_CLIENT_ENV_NPARAMS 2
> +
> +/* Error codes returned by the UEFI Sec App service */
> +#define QCOMTEE_UEFI_SEC_SUCCESS 0
> +#define QCOMTEE_UEFI_SEC_ERROR_INVALID_PARAMETER 10
> +#define QCOMTEE_UEFI_SEC_ERROR_UNSUPPORTED 11
> +#define QCOMTEE_UEFI_SEC_ERROR_WRITE_PROTECTED 12
> +#define QCOMTEE_UEFI_SEC_ERROR_SECURITY_VIOLATION 13
> +#define QCOMTEE_UEFI_SEC_ERROR_DEVICE_ERROR 14
> +#define QCOMTEE_UEFI_SEC_ERROR_OUT_OF_RESOURCES 15
> +#define QCOMTEE_UEFI_SEC_ERROR_VOLUME_CORRUPTED 16
> +#define QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT 17
> +#define QCOMTEE_UEFI_SEC_ERROR_NOT_FOUND 18
> +#define QCOMTEE_UEFI_SEC_ERROR_ALREADY_STARTED 19
> +
> +/* Operations for objects are 32-bit. QCOMTEE transport uses the upper 16 bits. */
> +#define QCOMTEE_MSG_OBJECT_OP_MASK GENMASK(15, 0)
> +#define QCOMTEE_MSG_OBJECT_OP_RELEASE (QCOMTEE_MSG_OBJECT_OP_MASK - 0)
> +
> +/**
> + * struct qcomtee_uefisec_app - An instance of UEFI Secure Application.
> + * @dev: TEE client device on the TEE bus which represents uefisecapp.
> + * @ctx: The context opened with the TEE subsystem by the uefisecapp client.
> + * @uefisec_svc_obj: A TEE object representing the uefisecapp service.
> + * @efivars: EFI variables registered with the EFI subsystem.
> + */
> +struct qcomtee_uefisec_app {
> +	struct device *dev;
> +	struct tee_context *ctx;
> +	struct tee_param_objref uefisec_svc_obj;
> +	struct efivars efivars;
> +};
> +
> +#define UEFISECAPP_UUID \
> +	UUID_INIT(0x01f95dcd, 0x2d7e, 0x58be, \
> +		  0xa1, 0x43, 0x81, 0x32, 0xa1, 0x72, 0xdb, 0x7d)
> +
> +/* Short-hands for these long attribute names */
> +#define UBUF_INPUT     TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT
> +#define UBUF_OUTPUT    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT
> +#define OBJREF_INPUT   TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT
> +#define OBJREF_OUTPUT  TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT
> +
> +/* Init instance of 'struct tee_param_objref'. */
> +#define SET_TEE_PARAM_OBJREF(param, attri, obj_id, obj_flag) do { \
> +		(param).attr = (attri); \
> +		(param).u.objref.id = (obj_id); \
> +		(param).u.objref.flags = (obj_flag); \
> +	} while (0)
> +
> +/* Init instance of 'struct tee_param_ubuf'. */
> +#define SET_TEE_PARAM_UBUF(param, attri, ubuff) do { \
> +		(param).attr = (attri); \
> +		(param).u.ubuf = (ubuff);  \
> +	} while (0)
> +
> +#define TEE_PARAM_UBUF(x) ((struct tee_param_ubuf){ .addr = &(x), sizeof(x) })
> +
> +#define SET_INVOKE_ARG(arg, object_id, opp, nparam) do { \
> +		(arg).id = (object_id); \
> +		(arg).op = (opp); \
> +		(arg).num_params = (nparam); \
> +	} while (0)
> +
> +static inline efi_status_t uefisecapp_err_to_efi_status(u32 err)
> +{
> +	switch (err) {
> +	case QCOMTEE_UEFI_SEC_SUCCESS:
> +		return EFI_SUCCESS;
> +
> +	case QCOMTEE_UEFI_SEC_ERROR_INVALID_PARAMETER:
> +		return EFI_INVALID_PARAMETER;
> +
> +	case QCOMTEE_UEFI_SEC_ERROR_UNSUPPORTED:
> +		return EFI_UNSUPPORTED;
> +
> +	case QCOMTEE_UEFI_SEC_ERROR_WRITE_PROTECTED:
> +		return EFI_WRITE_PROTECTED;
> +
> +	case QCOMTEE_UEFI_SEC_ERROR_SECURITY_VIOLATION:
> +		return EFI_SECURITY_VIOLATION;
> +
> +	case QCOMTEE_UEFI_SEC_ERROR_DEVICE_ERROR:
> +		return EFI_DEVICE_ERROR;
> +
> +	case QCOMTEE_UEFI_SEC_ERROR_OUT_OF_RESOURCES:
> +		return EFI_OUT_OF_RESOURCES;
> +
> +	case QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT:
> +		return EFI_BUFFER_TOO_SMALL;
> +
> +	case QCOMTEE_UEFI_SEC_ERROR_NOT_FOUND:
> +		return EFI_NOT_FOUND;
> +
> +	/* No matching on EFI_* list. */
> +	case QCOMTEE_UEFI_SEC_ERROR_ALREADY_STARTED: /* EFI_ALREADY_STARTED.  */
> +	case QCOMTEE_UEFI_SEC_ERROR_VOLUME_CORRUPTED: /* EFI_VOLUME_CORRUPTED. */
> +	default:
> +		return EFI_DEVICE_ERROR;
> +	}
> +}
> +
> +static struct qcomtee_uefisec_app uefisec_app;

Should not this singleton be protected, for instance against concurrent call and driver unbound?

> +
> +static int qcuefi_get_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
> +			       struct tee_param_ubuf in_attributes,
> +			       struct tee_param_ubuf *data,
> +			       u32 *out_attributes, u32 *out_errno)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
> +	struct tee_param param[QCOMTEE_GET_VAR_NPARAMS];
> +
> +	struct {
> +		efi_guid_t guid;
> +		u32 in_data_size;
> +	} in_cong = { 0 };
> +
> +	struct {
> +		u32 out_data_size;
> +		u32 attributes;
> +		u32 errno;
> +	} out_cong = { 0 };
> +
> +	in_cong.guid = *guid;
> +	in_cong.in_data_size = data->size;
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, obj_id,
> +		       QCOMTEE_UEFI_SEC_OP_GET_VAR,
> +		       QCOMTEE_GET_VAR_NPARAMS);
> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
> +	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
> +	SET_TEE_PARAM_UBUF(param[2], UBUF_INPUT, in_attributes);
> +	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
> +	SET_TEE_PARAM_UBUF(param[4], UBUF_OUTPUT, *data);
> +
> +	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_GET_VAR invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	data->size = out_cong.out_data_size;
> +	*out_attributes = out_cong.attributes;
> +	*out_errno = out_cong.errno;
> +
> +	return ret;
> +}
> +
> +static efi_status_t qcomtee_uefi_get_variable(efi_char16_t *name, efi_guid_t *guid,
> +					      u32 *attr, unsigned long *data_size,
> +					      void *data)
> +{
> +	int ret;
> +	u32 in_attr, out_attributes, out_errno;
> +	struct tee_param_ubuf in_data, in_var, in_attributes;
> +
> +	if (!name || !guid)
> +		return EFI_INVALID_PARAMETER;
> +
> +	/* 'attr' can be NULL, however an input attribute is always expected
> +	 * by UefiSecApp TA
> +	 */
> +	in_attr = 0;
> +	if (attr)
> +		in_attr = *attr;
> +
> +	in_data = (struct tee_param_ubuf){ .addr = data, *data_size };
> +	in_var = (struct tee_param_ubuf){ .addr = name,
> +					  (ucs2_strlen(name) + 1) * sizeof(*name) };
> +	in_attributes = (struct tee_param_ubuf){ .addr = &in_attr, sizeof(u32) };
> +
> +	/* On SUCCESS, 'data' member of 'in_data' has already been updated. */
> +	ret = qcuefi_get_variable(in_var, guid, in_attributes, &in_data,
> +				  &out_attributes, &out_errno);
> +
> +	if (ret)
> +		return EFI_DEVICE_ERROR;
> +
> +	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT) {
> +		/* If 'attr' is NULL 'out_attributes' is not updated. */
> +		if (attr)
> +			*attr = out_attributes;
> +
> +		*data_size = in_data.size;
> +	}
> +
> +	return uefisecapp_err_to_efi_status(out_errno);
> +}
> +
> +static int qcuefi_set_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
> +			       u32 attributes, struct tee_param_ubuf data,
> +			       u32 *out_errno)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
> +	struct tee_param param[QCOMTEE_SET_VAR_NPARAMS];
> +
> +	struct {
> +		efi_guid_t guid;
> +		u32 attributes;
> +		u32 in_data_size;
> +	} in_cong = { 0 };
> +
> +	in_cong.guid = *guid;
> +	in_cong.attributes = attributes;
> +	in_cong.in_data_size = data.size;
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, obj_id,
> +		       QCOMTEE_UEFI_SEC_OP_SET_VAR,
> +		       QCOMTEE_SET_VAR_NPARAMS);
> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
> +	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
> +	SET_TEE_PARAM_UBUF(param[2], UBUF_INPUT, data);
> +	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, TEE_PARAM_UBUF(*out_errno));
> +
> +	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_SET_VAR invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static efi_status_t qcomtee_uefi_set_variable(efi_char16_t *name, efi_guid_t *guid,
> +					      u32 attr, unsigned long data_size,
> +					      void *data)
> +{
> +	int ret;
> +	u32 out_errno;
> +	struct tee_param_ubuf in_data, in_var;
> +
> +	if (!name || !guid)
> +		return EFI_INVALID_PARAMETER;
> +
> +	in_data = (struct tee_param_ubuf){ .addr = data, data_size };
> +	in_var = (struct tee_param_ubuf){ .addr = name,
> +					  (ucs2_strlen(name) + 1) * sizeof(*name) };
> +
> +	ret = qcuefi_set_variable(in_var, guid, attr, in_data, &out_errno);
> +	if (ret)
> +		return EFI_DEVICE_ERROR;
> +
> +	return uefisecapp_err_to_efi_status(out_errno);
> +}
> +
> +static int qcuefi_get_next_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
> +				    struct tee_param_ubuf *out_variable,
> +				    efi_guid_t *out_vendor_guid, u32 *out_errno)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
> +	struct tee_param param[QCOMTEE_GET_NEXT_VAR_NPARAMS];
> +
> +	struct {
> +		efi_guid_t guid;
> +		u32 in_data_size;
> +	} in_cong = { 0 };
> +
> +	struct {
> +		efi_guid_t guid;
> +		u32 out_data_size;
> +		u32 errno;
> +	} out_cong = { 0 };
> +
> +	/* Pass size of available buffer */
> +	in_cong.in_data_size = out_variable->size;
> +	in_cong.guid = *guid;
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, obj_id,
> +		       QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME,
> +		       QCOMTEE_GET_NEXT_VAR_NPARAMS);
> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
> +	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
> +	SET_TEE_PARAM_UBUF(param[2], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
> +	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, *out_variable);
> +
> +	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	/* UefiSecApp TA does not touch 'out_variable.size'. Update it here.
> +	 * On SUCCESS (!out_errno), 'out_data_size' is length of name in 'out_variable.addr'.
> +	 * On failure (out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT), 'out_data_size' is
> +	 * actual name length.
> +	 * Otherwise, it's undefined.
> +	 */
> +	out_variable->size = out_cong.out_data_size;
> +	*out_vendor_guid = out_cong.guid;
> +	*out_errno = out_cong.errno;
> +
> +	return ret;
> +}
> +
> +static efi_status_t qcomtee_uefi_get_next_variable(unsigned long *name_size,
> +						   efi_char16_t *name,
> +						   efi_guid_t *guid)
> +{
> +	int ret;
> +	u32 out_errno;
> +	efi_guid_t out_guid;
> +	struct tee_param_ubuf in_var, out_var;
> +
> +	if (!name_size || !name || !guid)
> +		return EFI_INVALID_PARAMETER;
> +
> +	if (*name_size == 0)
> +		return EFI_INVALID_PARAMETER;
> +
> +	/* For 'in_var', 'name_size' is not necessarily size of 'name';
> +	 * could be size of buffer where 'name' has been stored. TA expects a
> +	 * NULL-terminated string in 'name' and ignores the size.
> +	 * For 'out_var', 'name_size' is size of buffer pointed by 'name'.
> +	 */
> +	in_var = (struct tee_param_ubuf){ .addr = name, *name_size };
> +	out_var = (struct tee_param_ubuf){ .addr = name, *name_size };
> +
> +	ret = qcuefi_get_next_variable(in_var, guid, &out_var, &out_guid,
> +				       &out_errno);
> +	if (ret)
> +		return EFI_DEVICE_ERROR;
> +
> +	if (!out_errno)
> +		*guid = out_guid;
> +
> +	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT)
> +		*name_size = out_var.size;
> +
> +	/* On SUCCESS, 'name' stores the next variable name. */
> +	return uefisecapp_err_to_efi_status(out_errno);
> +}
> +
> +static int qcuefi_query_variable_info(u32 attributes,
> +				      u64 *maximum_variable_storage_size,
> +				      u64 *remaining_variable_storage_size,
> +				      u64 *maximum_variable_size, u32 *out_errno)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
> +	struct tee_param param[QCOMTEE_QUERY_VAR_NPARAMS];
> +
> +	struct {
> +		u64 max_var_storage_size;
> +		u64 remaining_var_storage_size;
> +		u64 maximum_var_size;
> +		u32 errno;
> +	} out_cong = { 0 };
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, obj_id,
> +		       QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO,
> +		       QCOMTEE_QUERY_VAR_NPARAMS);
> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(attributes));
> +	SET_TEE_PARAM_UBUF(param[1], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
> +
> +	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	*maximum_variable_storage_size = out_cong.max_var_storage_size;
> +	*remaining_variable_storage_size = out_cong.remaining_var_storage_size;
> +	*maximum_variable_size = out_cong.maximum_var_size;
> +	*out_errno = out_cong.errno;
> +
> +	return ret;
> +}
> +
> +static efi_status_t qcomtee_uefi_query_variable_info(u32 attr, u64 *storage_space,
> +						     u64 *remaining_space,
> +						     u64 *max_variable_size)
> +{
> +	int ret;
> +	u32 out_errno;
> +	u64 maximum_variable_storage_size;
> +	u64 remaining_variable_storage_size;
> +	u64 maximum_variable_size;
> +
> +	if (!storage_space || !remaining_space || !max_variable_size)
> +		return EFI_INVALID_PARAMETER;
> +
> +	ret = qcuefi_query_variable_info(attr,
> +					 &maximum_variable_storage_size,
> +					 &remaining_variable_storage_size,
> +					 &maximum_variable_size,
> +					 &out_errno);
> +
> +	if (ret)
> +		return EFI_DEVICE_ERROR;
> +
> +	if (!out_errno) {
> +		*storage_space = maximum_variable_storage_size;
> +		*remaining_space = remaining_variable_storage_size;
> +		*max_variable_size = maximum_variable_size;
> +	}
> +
> +	return uefisecapp_err_to_efi_status(out_errno);
> +}
> +
> +/**
> + * qcomtee_release_object() - Release an object returned by QTEE.
> + *
> + * Each object returned by QTEE repesents a secure service exposed to the
> + * client. Whenever an secure service is opened, QTEE may allocate resources
> + * on the client's behalf. Therefore, once the client is done accessing the
> + * secure service, the object representing it should be explicitly released
> + * so that QTEE can release the associated resources as well.
> + *
> + * @ctx: TEE context.
> + * @object: The object to release.
> + */
> +static void qcomtee_release_object(struct tee_context *ctx,
> +				   struct tee_param_objref object)
> +{
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	SET_INVOKE_ARG(inv_arg, object.id, QCOMTEE_MSG_OBJECT_OP_RELEASE, 0);
> +	tee_client_object_invoke_func(ctx, &inv_arg, NULL);
> +}
> +
> +/**
> + * qcomtee_get_uefisec_svc_obj() - Get a UEFI Secure App service object to
> + * begin communication with the service.
> + * @ctx: TEE context.
> + * @client_env_obj: The client environment object returned earlier by QTEE.
> + * @uefisec_svc_obj: The UEFI Secure App service object.
> + *
> + * Returns 0 on success.
> + * Returns < 0 if client environment object invocation failed.
> + * Returns > 0 if client environment invocation was success but UEFI Secure App
> + * service object could not be returned for some other reason (represented by the
> + * returned value)
> + */
> +static int qcomtee_get_uefisec_svc_obj(struct tee_context *ctx,
> +				       struct tee_param_objref client_env_obj,
> +				       struct tee_param_objref *uefisec_svc_obj)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	u64 obj_id = client_env_obj.id;
> +	struct tee_param param[QCOMTEE_GET_UEFI_SVC_NPARAMS];
> +	u32 uefisec_uid = QCOMTEE_UEFI_SEC_UID;
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, obj_id,
> +		       QCOMTEE_OP_CLIENT_ENV_OPEN,
> +		       QCOMTEE_GET_UEFI_SVC_NPARAMS);
> +	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(uefisec_uid));
> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
> +
> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_CLIENT_ENV_OPEN invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	*uefisec_svc_obj = param[1].u.objref;
> +	return ret;
> +}
> +
> +/**
> + * qcomtee_get_client_env_obj() - Get a client environment object to begin
> + * object exchange with QTEE.
> + * @ctx: TEE context.
> + * @client_env_obj: The client environment object returned by QTEE.
> + *
> + * Returns 0 on success.
> + * Returns < 0 if root object invocation failed.
> + * Returns > 0 if root object invocation was success but client environment
> + * object could not be returned for some other reason (represented by the
> + * returned value)
> + */
> +static int qcomtee_get_client_env_obj(struct tee_context *ctx,
> +				      struct tee_param_objref *client_env_obj)
> +{
> +	int ret;
> +	struct tee_ioctl_object_invoke_arg inv_arg;
> +	struct tee_param param[QCOMTEE_GET_CLIENT_ENV_NPARAMS];
> +
> +	memset(&inv_arg, 0, sizeof(inv_arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	SET_INVOKE_ARG(inv_arg, TEE_OBJREF_NULL,
> +		       QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS,
> +		       QCOMTEE_GET_CLIENT_ENV_NPARAMS);
> +	SET_TEE_PARAM_OBJREF(param[0], OBJREF_INPUT, TEE_OBJREF_NULL, 0);
> +	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
> +
> +	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(uefisec_app.dev, "QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS invoke ret: %d, err: 0x%x\n",
> +			ret, inv_arg.ret);
> +		return ret ?: inv_arg.ret;
> +	}
> +
> +	*client_env_obj = param[1].u.objref;
> +	return ret;
> +}
> +
> +static const struct efivar_operations qcom_efivar_ops = {
> +	.get_variable = qcomtee_uefi_get_variable,
> +	.set_variable = qcomtee_uefi_set_variable,
> +	.get_next_variable = qcomtee_uefi_get_next_variable,
> +	.query_variable_info = qcomtee_uefi_query_variable_info,
> +};
> +
> +static int qcomtee_ctx_match(struct tee_ioctl_version_data *ver,
> +			     const void *data)
> +{
> +	return (ver->impl_id == TEE_IMPL_ID_QTEE);
> +}
> +
> +static int qcomtee_uefisecapp_probe(struct tee_client_device *tee_dev)
> +{
> +	int ret, err;
> +	struct tee_param_objref client_env_obj;
> +	struct tee_param_objref uefisec_svc_obj;
> +
> +	uefisec_app.dev = &tee_dev->dev;
> +	/* Open context with QCOMTEE driver */
> +	uefisec_app.ctx = tee_client_open_context(NULL, qcomtee_ctx_match, NULL,
> +						  NULL);
> +	if (IS_ERR(uefisec_app.ctx))
> +		return -ENODEV;
> +
> +	/* Obtain a reference to client_env object to begin object exchange
> +	 * with QTEE
> +	 */
> +	ret = qcomtee_get_client_env_obj(uefisec_app.ctx, &client_env_obj);
> +	if (ret) {
> +		err = -EINVAL;
> +		goto err_get_client_env;
> +	}
> +
> +	/* Obtain a reference to the uefisec_svc object which provides access to
> +	 * the EFI var storage.
> +	 */
> +	ret = qcomtee_get_uefisec_svc_obj(uefisec_app.ctx, client_env_obj,
> +					  &uefisec_svc_obj);
> +	if (ret) {
> +		err = -EINVAL;
> +		goto err_get_uefisec_svc;
> +	}
> +	uefisec_app.uefisec_svc_obj = uefisec_svc_obj;
> +
> +	ret = efivars_register(&uefisec_app.efivars, &qcom_efivar_ops);
> +	if (ret) {
> +		err = ret;
> +		goto err_efi_vars_reg;
> +	}
> +
> +	/* We don't need to keep a reference to this object anymore, we only
> +	 * needed it to obtain the uefisec_svc object.
> +	 */
> +	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
> +	return 0;
> +
> +err_efi_vars_reg:
> +	qcomtee_release_object(uefisec_app.ctx, uefisec_svc_obj);
> +err_get_uefisec_svc:
> +	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
> +err_get_client_env:
> +	tee_client_close_context(uefisec_app.ctx);
> +
> +	return err;
> +}
> +
> +static void qcomtee_uefisecapp_remove(struct tee_client_device *tee_dev)
> +{
> +	efivars_unregister(&uefisec_app.efivars);
> +	qcomtee_release_object(uefisec_app.ctx, uefisec_app.uefisec_svc_obj);
> +	tee_client_close_context(uefisec_app.ctx);
> +}
> +
> +static const struct tee_client_device_id qcomtee_uefisecapp_id_table[] = {
> +	{UEFISECAPP_UUID},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(tee, qcomtee_uefisecapp_id_table);
> +
> +static struct tee_client_driver qcomtee_uefisecapp_driver = {
> +	.id_table	= qcomtee_uefisecapp_id_table,
> +	.probe		= qcomtee_uefisecapp_probe,
> +	.remove		= qcomtee_uefisecapp_remove,
> +	.driver		= {
> +		.name		= "qcom-tee-uefisecapp",
> +	},
> +};
> +
> +module_tee_client_driver(qcomtee_uefisecapp_driver);
> +
> +MODULE_AUTHOR("Qualcomm");
> +MODULE_DESCRIPTION("TEE client driver for Qualcomm TEE UEFI Secure App");
> +MODULE_LICENSE("GPL");
> 


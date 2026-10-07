Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF0A40861C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355491; cv=none; b=eV1vs6oZWY4iyJG+FZjcAgewX7WWS3MKLO4zKQ67AUJrMTkw2q3E5FXwSoHHIhgn0p4nPClYXv0kkt5Z2Z7Z7am4eYeYunozTLlF8u2RtBROvCTOd5kTGETQyHLQbdDcvxCW4VlgYeVJ/prX4OhqJVVWa5vlj3yysKSx56IcbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355491; c=relaxed/simple;
	bh=OHYnhcGNkcXhgKogIXD4dkbJwv1pkohaxyfGxIlcDRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ce4bfwJR/VXRU74GPzxE3BAceoWWNXYbMljsLUdeU5Z31lwtLH0MyXNl8DIVIBRFMtWa32Fk73J0OtEW3h6k/SNk/VtbDmSVlCdKfTGuyEJ5muixWCFEwKG0t+13ppJj8YcXv5f5Sv0zTZOizAjflHlQXfngQwDzVEu5x4/+A8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVz/PEgT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AogbUUTw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVz/PEgT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AogbUUTw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U2MP2295035
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 06:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJFwA61JyA5wdbFs7MVnT+FErhhO9x6O7TkQU80VFYA=; b=FVz/PEgTBEh8obQG
	a7Kv7BpSsGoGTNPDXBTCym+sTNfFpAzu6doTNrysh61FCK7X9Wb/HueG6xPqLJY6
	qq/kpGndDL/vN8/uhertq9nar1EcpWVPWYwQRKkH+9qAbLUVBz4ZT2FFPHYYGzCr
	1qt8spQKMjgxmxrUdCFqSL0tmkNkD3gV1Gfyzwbkr1n0dxvdSg6WCNBdfzr8diHf
	6qa/Z4Rju1K4eWjXf2mOI/Qwtf4NrpLr5Y+oIVr3iXAMmM0nZN5DRA0hlkvciLDq
	qsV3hn0UGT0iNwcOREKvY4GYI3Yjwik3K3yCRBX56WibAQBrv+rWEpJzYS9DoOKX
	bUo73Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s0y73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:44:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179a556c43so86144826d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355487; x=1791960287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJFwA61JyA5wdbFs7MVnT+FErhhO9x6O7TkQU80VFYA=;
        b=AogbUUTw/huqpYnW9ePakc6C3SNso6heBtjHvMVWJMISzHp+nyGBxSN0CEIukRGnqq
         A8diKXueBV+BJvBrsq6SpHpY8Ba2TE7Wb4+b50DrwY/dg++YvnpzXpddGhDM2qptkhH2
         Tob3YInMDzIAQ9YICtyiesLI6s5w0PBOLh5BIgIuhdqf4CUw2I4RlTHkURGcBJTZKdsU
         SNQ2BCSoJgm29mADQkGZiZx8EDF/BZqxB4RXz9lmDnKRQCKfU+knzsS28E9HJGxX31sJ
         74ic+QSWalPHOsvVhQ17bmNoiD0TWJTJcOUC0vn8ly6KZjQlwkq3cHgQBnol4KevBhDO
         v6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355487; x=1791960287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJFwA61JyA5wdbFs7MVnT+FErhhO9x6O7TkQU80VFYA=;
        b=CxGR3m/Xj8yOXoIinXNR+Dds7VUvSorrvnnm+hNrW1IKBuDur2gWbWQWrzLVob/Xvq
         XJxyBt2bBy51tzjC+gJmHdR1z1arh5efSE/QMzA2dUq8KGibDIj36FcopLXjg3EXeFqm
         Lm9R0J5WqtB+ze1FcebJ9mrYD1mmTlXedvHMnps+ksrANOJ/DkZN6PSqWG2E7B0j9HCa
         MjEkL03TJ879yw48cRNkbpE8rLmjDCeDvgOlgsHI2qb9pJehLrDBKvzl16CS2sOpAZj1
         txaurjJdxY9KAIcN6Ly/9HKimIGYtDTtLUeOdRhJv3m2CWOsIYeXz7sS66y+1v7coKrt
         Xmew==
X-Forwarded-Encrypted: i=1; AKwUvBzymofFgra5BWxMxEYxX0WXvj/MRrRb/jI2o5GWPGK8A6C3Skl3//xR+ByIg3mtTuUGdGjAiFmRUr3KRqE=@vger.kernel.org
X-Gm-Message-State: AFuF++lhiBR2XZUmyD2BobLMkP82zgbIqr2KBBdB5yLGXktkdmHU80tK
	tUSGJeBJIefUAGAsxR0bFdVmzxIw+sOIa8PbOY+cxCVHaeC8WUZ77HOB2HXtI8TgniJ+7tm1Q4O
	xk6d+1DCt8mlCEnR64gL8lXS1dkX3AR/Vk7Zdoudv5pnmSL5lSDHo4bqHFrqzE0HBtpY=
X-Gm-Gg: AYBFou3vTqopJLCPa21nXS881mtl99xI5X71uJjgljDgL+BVcrf8DC6TGrNrycXuHSO
	oSlVC/55xKHhKbrbO4F5Aa7/tmWE2wwYSUiGVHCNqsSd/15Jkg7A6Ny9yrN4vDEszseJpMwFQx2
	GM7Rsy1rAlISN64hH6v6VUosSGOBp5lTGvddO8nAPJQjhuTiwANhWZ95YP0T39bIKIMYmHHGEry
	LGU+Y8LpKPU+J7LVXzc7hvb9VtwFUqqb/1RIFnm2vvoJfWz74ChK6fd7sYK9b6h+6pbEeKiuYrC
	cpLspsin/YpLh9uwd0f59fMtXUgG0g4oW+fzBqaDjNADqauhCWojFanshkpwc56Z7nPuwnUF4s/
	If/nDPDyoLEGxBJi8A1uIUmfUJSUP2vnmtvtNlSly
X-Received: by 2002:a05:620a:19a1:b0:93e:980a:2ff1 with SMTP id af79cd13be357-93e9b802152mr247421785a.69.1791355487056;
        Tue, 06 Oct 2026 23:44:47 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:93e:980a:2ff1 with SMTP id af79cd13be357-93e9b802152mr247417785a.69.1791355486596;
        Tue, 06 Oct 2026 23:44:46 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f54a5cesm39549625e9.5.2026.10.06.23.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 23:44:45 -0700 (PDT)
Message-ID: <b9ed7848-36ef-4b70-9d5c-b18af9eee83b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 09:44:43 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/45] media: qcom: camss: sa8775p: add IFE BUS v3.1x
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-28-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261006223953.3382273-28-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o5ITORFr5cHbEy3yEkSMWnmdqmkYLTge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNiBTYWx0ZWRfX9pa0hZ66Xmq8
 2nKYi3Iamy1cBb+wEqQwnDs3rbaXS77xfcnFAvByuHoAf0VgHFhsJxtX9uIOqiamoNhvXEM98Tz
 fDtO1QRLrNekLTSjIxAGY3DAdd9I0tgEhyTZuQuixBNjXDHv7j0GYspRfw195UG4yrrNbxP3CZ9
 Y8GhZUbl8tkqQnDHeV8/+R/dniEfmDLkq4wROcZBam6mJkoN+2r2o7V07fMs8JqG7ZpKwYu/Db5
 WTIwQqIeW+jXo8lbQhUzis16V7dqpEAVUc/aXcC06KFfgesKVxuQGXkxxn6g7SkSaHqnpxsUdcP
 xzdcuOXSO2CnwGLhDrPaAWYekkNbjODV6+aYyFecsoxB+x81VsWazlMgrJMMqIVl7sB4HYUWMMk
 WoQ96jjTsl8duy4m68AFVhofowRrFpqCD8RakC5GAtfA3IyWuMiUPlvSPSYKMyglSMAr/V1eYU5
 G+sYLtWwlb8byx7zeNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNiBTYWx0ZWRfX6uslM6tzhjzB
 szIjfYoUE7TAVLq469kVefTKq8MjTKhTL/GoGniMERB/JjY6/U52Dc4l64wzZnmgmKpc2CRsbns
 o4R+SWWiybQOAvHUQYim+ogwMvmSEDI=
X-Proofpoint-GUID: o5ITORFr5cHbEy3yEkSMWnmdqmkYLTge
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac5ea60 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Y4P9ch1KcTPFiUn8tYgA:9 a=UPhfUc_oUKe9iv7q:21
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070026

Hello,

Appoagies somehow after my last rebase the co-develped by was removed. For all the changes
of SA8775P credits to Vikram and Prashant. This will be fixed in the next series.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

~Gjorgji

On 10/7/2026 1:39 AM, "Gjorgji Rosikopulos gjorgji.rosikopulos"@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Add the IFE BUS v3.1x write engine used by the SA8775P full and lite
> pixel paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile    |   1 +
>  .../platform/qcom/camss/camss-ife-bus-v31x.c  | 267 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-ife.h |   1 +
>  3 files changed, 269 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 500b056a906c..2251b57ba38b 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -16,6 +16,7 @@ qcom-camss-objs += \
>  		camss-format.o \
>  		camss-ife.o \
>  		camss-ife-bus-v20x.o \
> +		camss-ife-bus-v31x.o \
>  		camss-ife-camif-v10x.o \
>  		camss-ife-lite-top-v10x.o \
>  		camss-ife-mod-v10x.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c b/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
> new file mode 100644
> index 000000000000..c3a99bd0f75e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +
> +#include "camss.h"
> +#include "camss-ife.h"
> +
> +/* Block base offsets */
> +#define BUSWR_V31X_OFFS		0x400
> +#define BUSWR_V31X_LITE_OFFS	0x480
> +
> +/* Per-client register offset */
> +#define BUSWR_V31X_CLIENT_OFFS(n)	((n) * 0x100)
> +
> +/* Interface interrupt and violation status bits */
> +#define BUSWR_V31X_IIF_IRQ_CMD_CLEAR			BIT(0)
> +#define BUSWR_V31X_OVERFLOW_ERR_MASK			GENMASK(25, 0)
> +#define IS_BUSWR_V31X_OVERFLOW_ERR(s)	\
> +	((s) & BUSWR_V31X_OVERFLOW_ERR_MASK)
> +#define BUSWR_V31X_VIOLATION_ERR_MASK			GENMASK(25, 0)
> +#define IS_BUSWR_V31X_VIOLATION_ERR(s)	\
> +	((s) & BUSWR_V31X_VIOLATION_ERR_MASK)
> +#define BUSWR_V31X_IMG_SIZE_VIOLATION_ERR_MASK		GENMASK(25, 0)
> +#define IS_BUSWR_V31X_IMG_SIZE_VIOLATION_ERR(s)	\
> +	((s) & BUSWR_V31X_IMG_SIZE_VIOLATION_ERR_MASK)
> +#define BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION	BIT(31)
> +#define IS_BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(s)	\
> +	((s) & BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION)
> +#define BUSWR_V31X_IIF_IRQ_S0_VIOLATION			BIT(30)
> +#define IS_BUSWR_V31X_IIF_IRQ_S0_VIOLATION(s)	\
> +	((s) & BUSWR_V31X_IIF_IRQ_S0_VIOLATION)
> +
> +/* Client configuration field values */
> +#define BUSWR_V31X_IIF_CGC_OVERRIDE			GENMASK(26, 0)
> +#define BUSWR_V31X_CLIENT_CFG_MODE			GENMASK(17, 16)
> +#define BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN		BIT(4)
> +#define BUSWR_V31X_CLIENT_CFG_EN			BIT(0)
> +#define BUSWR_V31X_CLIENT_IMG_CFG0_HEIGHT		GENMASK(31, 16)
> +#define BUSWR_V31X_CLIENT_IMG_CFG0_WIDTH		GENMASK(15, 0)
> +#define BUSWR_V31X_CLIENT_IMG_CFG2_STRIDE		GENMASK(23, 0)
> +#define BUSWR_V31X_CLIENT_PACKER_CFG_ALIGN		BIT(5)
> +#define BUSWR_V31X_CLIENT_PACKER_CFG_FORMAT		GENMASK(4, 0)
> +#define BUSWR_V31X_PACKER_FMT_PLAIN16_10_BPP		0x5
> +#define BUSWR_V31X_PACKER_FMT_PLAIN16_16_BPP		0x8
> +#define BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD	GENMASK(4, 0)
> +#define BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN	GENMASK(31, 0)
> +#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_PERIOD		GENMASK(4, 0)
> +#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_PATTERN	GENMASK(31, 0)
> +
> +/* FIFO limit and frame-based RDI defaults */
> +#define BUSWR_V31X_IMG_ADDR_FIFO_MAX_DEPTH		2
> +#define BUSWR_V31X_RDI_DEFAULT_WIDTH			0xffff
> +#define BUSWR_V31X_RDI_DEFAULT_STRIDE			0xffff
> +#define BUSWR_V31X_CLIENT_ADDR_STATUS_2_IMAGE_ADDR_FIFO_WORD_CNT	GENMASK(2, 0)
> +
> +/* Common registers */
> +#define BUSWR_V31X_IIF_CGC_OVERRIDE_REG		0x00000008
> +#define BUSWR_V31X_WM_TEST_BUS_CTRL_REG		0x000000fc
> +#define BUSWR_V31X_IIF_IRQ_MASK_S0		0x00000018
> +#define BUSWR_V31X_IIF_IRQ_CLEAR_S0		0x00000020
> +#define BUSWR_V31X_IIF_IRQ_STATUS_S0		0x00000028
> +#define BUSWR_V31X_IIF_IRQ_CMD_REG		0x00000030
> +#define BUSWR_V31X_STATUS_CLEAR_REG		0x00000060
> +#define BUSWR_V31X_VIOLATION_STATUS_REG		0x00000064
> +#define BUSWR_V31X_OVERFLOW_STATUS_REG		0x00000068
> +#define BUSWR_V31X_IMG_SIZE_VIOLATION_REG	0x00000070
> +
> +/* Per-client registers (relative to client base = module_base + CLIENT_OFFS(n)) */
> +#define BUSWR_V31X_CLIENT_CFG_REG		0x00000200
> +#define BUSWR_V31X_CLIENT_ADDR_IMAGE_REG	0x00000204
> +#define BUSWR_V31X_CLIENT_IMG_CFG0_REG		0x0000020c
> +#define BUSWR_V31X_CLIENT_IMG_CFG2_REG		0x00000214
> +#define BUSWR_V31X_CLIENT_PACKER_CFG_REG	0x00000218
> +#define BUSWR_V31X_CLIENT_IRQ_SS_CFG0_REG	0x00000230
> +#define BUSWR_V31X_CLIENT_IRQ_SS_CFG1_REG	0x00000234
> +#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_REG	0x00000238
> +#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_REG	0x0000023c
> +#define BUSWR_V31X_CLIENT_ADDR_STATUS_0_REG	0x00000270
> +#define BUSWR_V31X_CLIENT_ADDR_STATUS_2_REG	0x00000278
> +
> +static void ife_buswr_31x_acquire(struct ife_device *ife, void __iomem *base)
> +{
> +	struct ife_buswr_ctx *ctx = &ife->buswr_ctx;
> +
> +	if (ife->res->type == CAMSS_IFE_SUBDEV_TYPE_IFE_LITE)
> +		ctx->base = base + BUSWR_V31X_LITE_OFFS;
> +	else
> +		ctx->base = base + BUSWR_V31X_OFFS;
> +
> +	ctx->dev = ife->camss->dev;
> +}
> +
> +static void ife_buswr_31x_release(struct ife_buswr_ctx *ctx)
> +{
> +	ctx->base = NULL;
> +}
> +
> +static void ife_buswr_31x_wm_config(struct ife_buswr_ctx *ctx, const u8 wm,
> +				    const struct camss_ife_wm_config *cfg)
> +{
> +	void __iomem *base = ctx->base;
> +	bool align = cfg->packing_fmt >= BUSWR_V31X_PACKER_FMT_PLAIN16_10_BPP &&
> +		     cfg->packing_fmt <= BUSWR_V31X_PACKER_FMT_PLAIN16_16_BPP;
> +	u32 pattern = 1;
> +	u32 period = 0;
> +	u32 bytes = cfg->bytes;
> +	u32 stride = cfg->stride;
> +	u32 lines = cfg->lines;
> +	u32 rval;
> +
> +	if (cfg->mode_config == BUSWR_CLIENT_CFG_MODE_FRAME_BASED) {
> +		bytes = BUSWR_V31X_RDI_DEFAULT_WIDTH;
> +		lines = 0;
> +		stride = BUSWR_V31X_RDI_DEFAULT_STRIDE;
> +	}
> +
> +	writel_relaxed(BUSWR_V31X_IIF_CGC_OVERRIDE,
> +		       base + BUSWR_V31X_IIF_CGC_OVERRIDE_REG);
> +	writel_relaxed(0, base + BUSWR_V31X_WM_TEST_BUS_CTRL_REG);
> +
> +	rval = FIELD_PREP(BUSWR_V31X_CLIENT_CFG_MODE, cfg->mode_config);
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
> +
> +	rval = FIELD_PREP(BUSWR_V31X_CLIENT_PACKER_CFG_FORMAT, cfg->packing_fmt) |
> +	       FIELD_PREP(BUSWR_V31X_CLIENT_PACKER_CFG_ALIGN, align);
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_PACKER_CFG_REG +
> +		       BUSWR_V31X_CLIENT_OFFS(wm));
> +
> +	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG0_WIDTH, bytes) |
> +	       FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG0_HEIGHT, lines);
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IMG_CFG0_REG +
> +		       BUSWR_V31X_CLIENT_OFFS(wm));
> +
> +	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG2_STRIDE, stride);
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IMG_CFG2_REG +
> +		       BUSWR_V31X_CLIENT_OFFS(wm));
> +
> +	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD, period);
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IRQ_SS_CFG0_REG +
> +		       BUSWR_V31X_CLIENT_OFFS(wm));
> +
> +	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN, pattern);
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IRQ_SS_CFG1_REG +
> +		       BUSWR_V31X_CLIENT_OFFS(wm));
> +
> +	rval = FIELD_PREP(BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_PERIOD, period);
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_REG +
> +		       BUSWR_V31X_CLIENT_OFFS(wm));
> +
> +	rval = FIELD_PREP(BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_PATTERN, pattern);
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_REG +
> +		       BUSWR_V31X_CLIENT_OFFS(wm));
> +}
> +
> +static void ife_buswr_31x_wm_enable(struct ife_buswr_ctx *ctx, u8 wm)
> +{
> +	void __iomem *base = ctx->base;
> +	u32 rval;
> +
> +	rval = readl_relaxed(base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
> +	rval |= BUSWR_V31X_CLIENT_CFG_EN | BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN;
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
> +}
> +
> +static void ife_buswr_31x_wm_disable(struct ife_buswr_ctx *ctx, u8 wm)
> +{
> +	void __iomem *base = ctx->base;
> +	u32 rval;
> +
> +	rval = readl_relaxed(base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
> +	rval &= ~(BUSWR_V31X_CLIENT_CFG_EN | BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN);
> +	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
> +}
> +
> +static bool ife_buswr_31x_is_fifo_full(struct ife_buswr_ctx *ctx, u8 wm)
> +{
> +	u32 rval = readl_relaxed(ctx->base + BUSWR_V31X_CLIENT_OFFS(wm) +
> +				 BUSWR_V31X_CLIENT_ADDR_STATUS_2_REG);
> +
> +	rval = FIELD_GET(BUSWR_V31X_CLIENT_ADDR_STATUS_2_IMAGE_ADDR_FIFO_WORD_CNT, rval);
> +
> +	return rval >= BUSWR_V31X_IMG_ADDR_FIFO_MAX_DEPTH;
> +}
> +
> +static void ife_buswr_31x_queue_buf(struct ife_buswr_ctx *ctx, const u8 num_wms, const u8 *wm,
> +				    dma_addr_t *addr)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_wms; i++) {
> +		if (addr[i])
> +			writel_relaxed(addr[i], ctx->base + BUSWR_V31X_CLIENT_ADDR_IMAGE_REG +
> +				       BUSWR_V31X_CLIENT_OFFS(wm[i]));
> +	}
> +}
> +
> +static u32 ife_buswr_31x_consumed_addr(struct ife_buswr_ctx *ctx, u8 wm)
> +{
> +	return readl_relaxed(ctx->base + BUSWR_V31X_CLIENT_ADDR_STATUS_0_REG +
> +			     BUSWR_V31X_CLIENT_OFFS(wm));
> +}
> +
> +static u32 ife_buswr_31x_irq_status(struct ife_buswr_ctx *ctx)
> +{
> +	void __iomem *base = ctx->base;
> +	u32 bus_stat;
> +	u32 iif_stat;
> +
> +	bus_stat = readl_relaxed(base + BUSWR_V31X_OVERFLOW_STATUS_REG);
> +	writel_relaxed(BIT(0), base + BUSWR_V31X_STATUS_CLEAR_REG);
> +	if (IS_BUSWR_V31X_OVERFLOW_ERR(bus_stat)) {
> +		writel_relaxed(bus_stat, base + BUSWR_V31X_STATUS_CLEAR_REG);
> +		pr_warn("BUSWR common overflow: 0x%x\n", bus_stat);
> +	}
> +
> +	bus_stat = readl_relaxed(base + BUSWR_V31X_VIOLATION_STATUS_REG);
> +	if (IS_BUSWR_V31X_VIOLATION_ERR(bus_stat))
> +		pr_warn("BUSWR common violation: 0x%x\n", bus_stat);
> +
> +	bus_stat = readl_relaxed(base + BUSWR_V31X_IMG_SIZE_VIOLATION_REG);
> +	if (IS_BUSWR_V31X_IMG_SIZE_VIOLATION_ERR(bus_stat))
> +		pr_warn("BUSWR common image size violation: 0x%x\n", bus_stat);
> +
> +	iif_stat = readl_relaxed(base + BUSWR_V31X_IIF_IRQ_STATUS_S0);
> +	writel_relaxed(iif_stat, base + BUSWR_V31X_IIF_IRQ_CLEAR_S0);
> +	if (iif_stat) {
> +		if (IS_BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(iif_stat))
> +			pr_warn("BUSWR image size violation from CCIF: 0x%x\n", iif_stat);
> +		if (IS_BUSWR_V31X_IIF_IRQ_S0_VIOLATION(iif_stat))
> +			pr_warn("BUSWR violation from CCIF: 0x%x\n", iif_stat);
> +	}
> +
> +	writel_relaxed(BUSWR_V31X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V31X_IIF_IRQ_CMD_REG);
> +
> +	return iif_stat;
> +}
> +
> +static void ife_buswr_31x_irq_enable(struct ife_buswr_ctx *ctx)
> +{
> +	writel_relaxed(~0, ctx->base + BUSWR_V31X_IIF_IRQ_MASK_S0);
> +}
> +
> +static void ife_buswr_31x_irq_disable(struct ife_buswr_ctx *ctx)
> +{
> +	void __iomem *base = ctx->base;
> +
> +	writel_relaxed(0, base + BUSWR_V31X_IIF_IRQ_MASK_S0);
> +	writel_relaxed(~0, base + BUSWR_V31X_IIF_IRQ_CLEAR_S0);
> +	writel_relaxed(BUSWR_V31X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V31X_IIF_IRQ_CMD_REG);
> +}
> +
> +const struct ife_hw_buswr_ops ife_buswr_31x_ops = {
> +	.acquire	= ife_buswr_31x_acquire,
> +	.release	= ife_buswr_31x_release,
> +	.irq_enable	= ife_buswr_31x_irq_enable,
> +	.irq_disable	= ife_buswr_31x_irq_disable,
> +	.wm_config	= ife_buswr_31x_wm_config,
> +	.wm_enable	= ife_buswr_31x_wm_enable,
> +	.wm_disable	= ife_buswr_31x_wm_disable,
> +	.queue_buf	= ife_buswr_31x_queue_buf,
> +	.consumed_addr	= ife_buswr_31x_consumed_addr,
> +	.irq_status	= ife_buswr_31x_irq_status,
> +	.is_fifo_full	= ife_buswr_31x_is_fifo_full,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
> index c163c336fcc3..efbb1e75d550 100644
> --- a/drivers/media/platform/qcom/camss/camss-ife.h
> +++ b/drivers/media/platform/qcom/camss/camss-ife.h
> @@ -397,6 +397,7 @@ camss_ife_pipe_for_stream_id(int nstreams,
>  extern const struct ife_pads_descriptors ife_pads_v20x;
>  extern const struct ife_hw_top_ops ife_top_20x_ops;
>  extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
> +extern const struct ife_hw_buswr_ops ife_buswr_31x_ops;
>  extern const struct camss_mod_ops ife_mod_v10x_ops;
>  
>  extern const struct ife_pads_descriptors ife_lite_pads_v20x;


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D25146EC9E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371266; cv=none; b=pnHXfNnHjo/BK6AVBbH4U+Yr6tGLBmuLoP6UeziEPqRYrE2Cg3RQIkvnQ8AbExCHVUPR5Im0IotOtrGUOEi9xBJCL425LsavAZ/kotFvkova+GygVXssV6ebH3C08OCi4qr1ez3Y+/mbsXqFOzQyO0ak8Jtwp4WfbaHLc9CraoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371266; c=relaxed/simple;
	bh=TlBausZj7paEpSo2OCG+1/hcAa2g/DP2/0Ysy19OtmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEjNiaScu7epovl62bMntPFdnhbuIeQJu9ZaL0QSnhcx1Yb1cxx2fSGb2KMeXeYNTfsHf5o6RU5KSWs4z1YYLahw7ORdxLmHSbOCTkUObf/PhRlGLGhYgPnej1xIG1cXzhmWz+HUGrzInG+CisNll1eF+cwdRLxi1+xAlE2Y6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nk/qRXh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0Q2ajj4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nk/qRXh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0Q2ajj4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jfwE119499
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OVylAlNGDwx+g4PVQ8xpoFzVdG/4fpU7iJCZjezlUGY=; b=nk/qRXh8EF9OtEni
	KcUHsL09xhTtGtOQfctwkUVYYcD2K5oLWDxbBjLktAEAowbb8EuLLVFhNBTFPpa/
	L4qguJGrVTm7yIsfBzpjThAUhtJbO4UsyZhxQOWc1eFOlcZNQ3E0SNGV05R3D3i6
	iv3WdCCIItCp5aPO5mZs9S9+aXYDPT+eACk/LIRsUKedAFltreHV6kwRX9WYdQo0
	Vypoo7lyvsYVzVDguNa2WtvxliwD/c4p0RA+yyJWU69W3qjZJANaHwvXDWH8lCFm
	dzLYaVcCoiKyBjbRU0EzHHJeg8snYjx0aOYoB3QKi1aufk74iEKXTzs42tIiivYN
	5bIGsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc59510-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:07:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so672631785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791371243; x=1791976043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVylAlNGDwx+g4PVQ8xpoFzVdG/4fpU7iJCZjezlUGY=;
        b=e0Q2ajj4dqhg2hF09hTniEAdrxG0Vbw523aoRtIXWj2GBaYsU4u6hguFgLw/DU5cIc
         su4EI/dD5SADq/j+OYZdgtc4yipWpVWCpuJyMzK3Qw/bF6ydj3+xmIK0l/sbuC4URCAS
         XqcWXpf6yOcOG1mgyD4ZWE9mDkivsIK9yuh6/Kjz+hR29qvZOHQpa470AkHKDvNLD6NF
         XHIg725MhidicN/qZVFO0u3yqas18DvPs+S3KcMnitcb6S7u/EMrjL/qa3mfIF3jGFEA
         ODkSECZwJQP6hfXPqbyxXYWU8F/C2+sYMcho5URJqItoiIRNDHqSFT9ZPA2fBt0wdHvN
         kU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371243; x=1791976043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVylAlNGDwx+g4PVQ8xpoFzVdG/4fpU7iJCZjezlUGY=;
        b=jQ5dqxpf+5Wscd4ObJ4/v+kD1cOFBCeLZ11oMeWevY1tS/g85ffWw4vv5EWt/O642r
         +3rfPrQTf41Vx10kTSOg61tNdl9J7wRU8nTXrU0uPtZtL5txFRi8H1Wu1vC6elAJsRjw
         Pxh4TFoI2Eh+Xqh497Wa1elsd8rsFA3X4aHhasHg6gYr1SsbgluOwJAds9r5OQZHusqv
         /apFl1oQflNLFlPQ9L+eNelnIGQumt29dXIbM1AhK7SUgQRPsTM+eDMQFGbTZwitmBR4
         gbwEHQVfZso1ni/CbatvU6aYYQSe4nrTTRHLYaxTkMc5dXHuP1I2z8juBSE4JxgWwh+e
         9IRg==
X-Forwarded-Encrypted: i=1; AKwUvBxuWaimmScDmFz90B6/0wS32zbQvlPbBKPrgWVxcnEyDjiLcPGYC0NoiE2XLMYeJvFylDwyOmaddhlCrGs=@vger.kernel.org
X-Gm-Message-State: AFuF++mrkYmm+mqJDzZtxZojJDAhDa+VAFJ5ReuzrMcpQwPO7d0PWSrC
	hrnAn+iG6M3aOBfnQeVfdoW2XKIRuBnf4PKgj6Lv+ZofrZCl0ZGcGUcEn7pjoDIVvrKTkwXa5tz
	WXziJwv1+JFuMgDnAhtX4KJgMBnsizfmcGpKMSucJk4qDMqdq7FD0h4zX7fJlfIfk4Dc=
X-Gm-Gg: AYBFou0gKTvt+VVUgApgpXYwxzb0Wg2wdCnq4xZmFtGQB8U/H5z34BXh47QcTNy/MH7
	d9KhSpEqNZ87PthriB5hmF2Lmlb1dNti1y9jWAYXP0dstQ20IawZYPZfw3Aov/EsjiCPIiU1A4s
	nqx/db/+iQMHqcsQATcBimInLOVj5kcvwnfzGw3iLRNrf/usiSLWxHUbM/wPRQvXJyTJaCgG/Ze
	iaRAtsZdbBh8FL421QJOPl2Qz31Lvx9VqLagigEUTtJi+Vv13Mh+nvep5ArZ9f7SfMdrBzrNpl4
	8J8TXpAe9vG7b3x8U1vkO7xHDy0Cypb3FbyFHscwRDnQkepIKP4TT6ck2HfHC1N7VQwmJnYp7C6
	RD5RizG6vc8p6C+csa65QGSUI3/Xsbm7b5+c87u99
X-Received: by 2002:a05:620a:470b:b0:93c:29b3:3525 with SMTP id af79cd13be357-93e9b7e072bmr326351085a.36.1791371242787;
        Wed, 07 Oct 2026 04:07:22 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93c:29b3:3525 with SMTP id af79cd13be357-93e9b7e072bmr326345885a.36.1791371242174;
        Wed, 07 Oct 2026 04:07:22 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f558028sm69510025e9.10.2026.10.07.04.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:07:20 -0700 (PDT)
Message-ID: <59a79ee2-1cc4-409e-bf42-c2e375b51af6@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:07:19 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/74] media: qcom: camss: vfe: Separate VFE 690 from VFE
 780/880
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-2-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-2-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NCBTYWx0ZWRfXyL375VoDVaoJ
 zDzpC1KjLUadWrst9bQHwORkiF7eK3OEQqz9U5rXfPwCb1X1oZV4Is4blPf4d1+vVlsPp6+4SO3
 Fho0+i6zv+bbyaNH60y52um7WsSe3bo=
X-Proofpoint-GUID: BIpiYjSu6tYZTUcpSA8mR5cD_v6EUE4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NCBTYWx0ZWRfX2idhDsZ4UJZF
 Oh6fDqo0vHoFE4qVzJsrqaJWLsebB6Edi+F0re7pvgmwwXlQYfp2MQOXZ6vWvqnsCENpNhU6vci
 wtYEKXRvLbQk/NXNHj7I53VTCmbDzxBdhDtFSm275o369XL7Jt6b7eYbBu5YkUJlEktVZ+YSRzQ
 uku601glEliIFwMPHrrRQAn84flRl4iL1m1uyD81Y94HnqHd/rQZmfacpDWONpm+Sif4r02/kRy
 3hDqCr7fc3XkxsrCsvxngeBUyAHyRLioKt8Af6HkP4KV7VQoDMGz7yRhFE5jkgtcMCOQ6e429+x
 UoCl5eF2ATnKKV9hkjl0ixJ9bkZUQIA76/wsv6xcXt7rKYS7zMOnDzWeq8DWxZGwa6aDIuLBIti
 vXowQ27emx2u88m9mDREPY2JKeXLjctPj4kNKG7lv2qd5W+ciMj6SSkWoPTXxxGA4PNtqiCJbTd
 dJgGmIowzEzdmasp5Eg==
X-Proofpoint-ORIG-GUID: BIpiYjSu6tYZTUcpSA8mR5cD_v6EUE4a
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac627eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=9BHYvpX70SqsbJ8ECAEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070044

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> Looking at the write-master index for VFE 690 and VFE 780/880 we can see a
> discontinuity between 690 and 780/880. Extending out the functionality in
> these files will result in spaghettification of the code for no good
> purpose.
> 
> The WM index difference is indication enough that the silicon should live
> in separate files.
> 
> Disjoin now.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/Makefile        |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe-690.c | 168 ++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe-780.c |  53 ++-----
>  drivers/media/platform/qcom/camss/camss-vfe.h     |   1 +
>  drivers/media/platform/qcom/camss/camss.c         |  14 +-
>  5 files changed, 187 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index e82bc8141c241..4dcb08a0e25aa 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -25,6 +25,7 @@ qcom-camss-objs += \
>  		camss-vfe-340.o \
>  		camss-vfe-480.o \
>  		camss-vfe-680.o \
> +		camss-vfe-690.o \
>  		camss-vfe-780.o \
>  		camss-vfe-gen1.o \
>  		camss-vfe-vbif.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-690.c b/drivers/media/platform/qcom/camss/camss-vfe-690.c
> new file mode 100644
> index 0000000000000..6f90134d5ed64
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-690.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 690
> + *
> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +#define BUS_REG_BASE (vfe_is_lite(vfe) ? 0x480 : 0x400)
> +
> +#define VFE_TOP_CORE_CFG (0x24)
> +#define VFE_DISABLE_DSCALING_DS4  BIT(21)
> +#define VFE_DISABLE_DSCALING_DS16 BIT(22)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL (BUS_REG_BASE + 0xFC)
> +/*
> + * Bus client mapping:
> + *
> + * Full VFE:
> + * VFE_690: 16 = RDI0, 17 = RDI1, 18 = RDI2
> + *
> + * VFE LITE:
> + * VFE_690 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
> + */
> +#define RDI_WM(n)	((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
> +#define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
> +
> +#define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
> +#define		WM_CFG_EN			BIT(0)
> +#define		WM_VIR_FRM_EN			BIT(1)
> +#define		WM_CFG_MODE			BIT(16)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)	(BUS_REG_BASE + 0x204 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)	(BUS_REG_BASE + 0x208 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)	(BUS_REG_BASE + 0x20c + (n) * 0x100)
> +#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH	(0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)	(BUS_REG_BASE + 0x214 + (n) * 0x100)
> +#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE	(0xFFFF)
> +#define VFE_BUS_WM_PACKER_CFG(n)	(BUS_REG_BASE + 0x218 + (n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x230 + (n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x234 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x238 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x23c + (n) * 0x100)
> +
> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)

So copy paste entire file just to get different wm indexes i dont think is good to have.
You can look in the series posted for pixel path enablement we have different
bus version implementations and different descriptors for wm indexes. I think
that fits better and it is more extensible.

Different isp versions share same modules (some of them are different) but the idea
to have sub-module abstraction is to address those issues. That was main reason
to go with new implementation.

Just speaking to technical debt new ife sub-device vs duplication of the code
for each version, is still matter of choice.

~Gjorgji 

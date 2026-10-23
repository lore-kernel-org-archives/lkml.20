Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739264;
	b=lf1F16VLV3h6nttKyooFOXfg0WwR6010NSmOlFsuo3WoMHnmpI5HWIGYjOBKyO0uy+dh
	 DaefxHY+u7Lrr44aL6V2kZkpYIFUL8EUcpMQV8khL2+f3jiTMqoeWVZ2dEvvbhBbsuddg
	 Gpw9BIVMIYZQ1TExoDLew7hV/0fB0eE9kd04FzuU8Q1Ve0oqDfPEErrYYWVxL8faQtm2h
	 igfkJ4vb+27I+NjJ8NL0yroHMll5HlxcCNSyZ9HfMPQ/K4WZc1klXJra11GUu+4fbpbOr
	 zWQP/CuPVJQjbq6TAop0opOXlV+qMmskKo5D1bLMjS4aGRezsFR0w+8MP+6cHkbOwRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W0j3DK1pQyRPHV5eNDN30+zBgsEig8/8mLkHDbB34mQ=;
	b=PxPb8zvTkqc2HfEPmS5K2ky+wVwMMmyS1ZBD2sE0ZCmbYwff1Pm1b8aqdo0EkXrJGmKB
	 xQ7sbI/JHFTVczJ42+ee2CLpsJrBNwLQhB9mTzbLVWuODBlIl5hrPFG+4+azlOeiKAtce
	 RDrZBncuzZJXcayB06F4LKoZgd0JNlXm624XFTwbCKn33AYFL+aIIR+zQsw0XJ/3DrCys
	 wERes8Mmemw6JKtxwOTsQIP5czvi9KyBwBlXrNVKfSbDah3tLoVWnhLGIoN1TXz7OYayo
	 l8dRWjEMgRfb7UePJlZo0Ge/u3VVfVARLB/3FcuhFwxM67iysC+GWUNi+5eE8t7c+5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BisFdoEF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buV6q46I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45344606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45344606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BisFdoEF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buV6q46I
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F3Et1290755
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0j3DK1pQyRPHV5eNDN30+zBgsEig8/8mLkHDbB34mQ=; b=BisFdoEFJm80HS13
	1bxTNVVpGPZC3Lr4L0VQhHBXGzygWzq/fSYYUBaKAlHKM3CRuy8AigPGskINW1Ct
	DUT4ZACdoWdQkTSWdRC9oUyZmZPR+Sv/9fd3ZdXdHEcD7NQ2yzASkruOz7yOrOYy
	SGMoPQkcONkc90O9oNCOLJqnCn1Y5bQHonoOlJZQsfZrugxoz5E4vKIDDQTZf6jw
	ozttfF1Qd4BGGQvc9FaNSTSpTHh582G9/Mx/xb++SeNANvP0dSYiEnSk0IRsetfb
	VeH4ZEmVMfOimq46Bnt3NyBM/tkOn7Tpk4WL/RpiFn1/E9ZLvsz1bLCa4q0Mrn8v
	WekSnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw2wa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:07:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad436a9d00so619937a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792739262; x=1793344062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0j3DK1pQyRPHV5eNDN30+zBgsEig8/8mLkHDbB34mQ=;
        b=buV6q46I7oHpE+/lgG0YKwRyyaQGtifMD1Rcg0BTXDLGCnOUhLVG8AY5DqeBB4KW+q
         sFKnni628E8h8WyvYeJqr74YtTReuNap6pEUKsQaRz733WtXshQ+vTv+Cn7fRhQeYiN3
         yy+pJ8gXx7i0d3ZoN5dy0aVjnoWQZz8oVupHRMT+eQIp3PSDLlKZXqxt8MvbwyZAV3fI
         txJYoDVSDCfkeu9D1bYjvz+pJunT9BsieYNalgNGZ7flnVI++VG1UUjw/rBvSexAKQff
         KmyLC+33uqeYHSVwMxdbhs6+kwZqFTpICv+6SVmtf+yk/g+O2VgRCOXdLnXr0gkpvuDr
         YCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739262; x=1793344062;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W0j3DK1pQyRPHV5eNDN30+zBgsEig8/8mLkHDbB34mQ=;
        b=sj0J63CgsszinhgeLw3aAGo/jXJ2smYzYwaVlIguhOw/BTr4ul0bOZnY1SWAaHsPk5
         JDWM4tpsJn2H+J+wSmFSUFhAfn5DMAvvOUqtoeS824zMLj1ap/cTuckcb0EHTSQvPpOR
         j5hzTmhZ6cqGQKAPoz+sJ1V1jE1FsSf0RVGftBK69CHQG0ONxpG7eF+L4kS9HhgV+8YU
         Nus9gxK8/IrHopxhK6y1Y5GVUtUh4WkbC9IEsdiNYOHaYrOuZ0s1WiCHK9qfkRkY4toa
         EZU49qnGjFBxWyPP/DTUMVYgCLAO+6CfmBoQheRZhMD05mE4xyAqVxDv0+RRnxJPfLNN
         bxPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvXKV9CNXsWqllPMu9WnlCKYPyJi061J5MNJrUrh5M9j2qBjlaDssLdVzGO3bSrtXbBEl0Dr3UOe/bu30=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPikIRo5fIO77zlD7CSxYJspdxWtTDYfSJQlyBmLaiR4egzQj/
	N7gZ9nUE0fsRdLoxtUKeMX0KGoxVUehBXqMvG4KNZKcuWSz5mencR6KSMQimyg76Rz8ocYV79pO
	EUgZoHpZJWtiO37fFnm0AtKM3Ggb1h3q2XFgZ1sCdZ06HXtECuHFM3V0ho6JEJFN7aQk=
X-Gm-Gg: AYBFou0X+5OONnc3yCpNeX7DbAq1dcijCJ7mVLyUQBWaT7xbyvUyl1AuasozyCDG3zQ
	TTi06b8Q6J4YWmmoue/s26JYQweEj743od8OTEZf33wP0GIb52YGA9ZS6J/GGdPuobl6gbgVU19
	Sdt8DhCkp5TLsN6tCva7cGNIUSrCPrc8FmQcRe+pyPzmCiwTGpbHSMiWWWtoMCpPtMAz8KILlwc
	dsULQOiIVei6mmO7P9Z5dIZ6Erc5NUdKZgmw8aQCpWYMOlbwqvcP2cRa6YGVueDlg5PQY6GqpF9
	7fm6IOAPYTf/5KBHwRsIgZg77oYRWFRX4kSUvo80BT3z5MlwC1rgJ3HPdnpH4IzVHUX0S0by90u
	LihGLpyswyOgqrXBFFdnHphYBCZFv2Av5tw==
X-Received: by 2002:a17:90b:510a:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3adce0d645cmr1126025a91.54.1792739261849;
        Fri, 23 Oct 2026 00:07:41 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3adce0d645cmr1125984a91.54.1792739261260;
        Fri, 23 Oct 2026 00:07:41 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49366fdsm7417920a91.14.2026.10.23.00.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:07:40 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:37:30 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] drm/msm/dcp: Add IPCC power notification
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-4-48aad0fe4f72@oss.qualcomm.com>
 <u7pcn75yh435vuuwqezml37bqfzdztvrywggbmkydkilwe5yzp@myijo4wd2bob>
Content-Language: en-US
In-Reply-To: <u7pcn75yh435vuuwqezml37bqfzdztvrywggbmkydkilwe5yzp@myijo4wd2bob>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1ZYacIuQp1JGg0jMwVBe4NnLjZFBtDw_
X-Proofpoint-ORIG-GUID: 1ZYacIuQp1JGg0jMwVBe4NnLjZFBtDw_
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb07bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8T9rNCmtLWH8V0CgYQwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX5rsxr7URe+OQ
 z+GkjF1c63ws76uNCv7tHWuyIXnTmz6wT20sGz2c790OoZ8pNn/uaTrm94QjXVPuE+NsP+Lu+9+
 WwaRQbZYM4B4+dcEloBx6rPnKzKisUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX/DJhN16WwnXR
 2Fo4mLLsDkzCxecfOihe0DVvQ3a63ZG5K0cDaRev9Zoi2yjK4gQsaci1OxLoUfM+fjTC8uO/zgw
 hL+rxhrsd2q5wLE5d8UlLs+k9q5ljDvdfelNKteNjJ494fPZbv4ufAFxbcEqiwSTpDeZ6fK59Kn
 LqIsA+Pq54Dfo6Y7H/7Cj4aR4nTshVF14KHiZ8nav1Ood1xkuWBi1Tog+pB9NT8j5o7z47/iXhJ
 KZ227NK2lhfekt8aawNkv3NUfkN2y3phmAPSMS4vn2rC4IDFYTtwi7INGolBfd86g5fbM5ViF3M
 vOZANQMMeigKN3gktyNnhvxYMFbIxI1GXJ64VXqTVB+vuefEo2BDiaYHfikWSBH1vTEhOtIm2AZ
 h8Iq6Wh37OdFZSNIfSpd/zgIslh3Fl9ec/YgW3IAWNyXedzIvpP8arjyG7rwwXpN9biKVumvv+0
 I43UlsNMUAB8vKMp97g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230028


On 15-10-2026 18:12, Dmitry Baryshkov wrote:
> On Thu, Oct 15, 2026 at 01:08:24PM +0530, Jayant Shekhar wrote:
>> DCP may be power-collapsed while the VirtIO transport remains available.
>> The host therefore needs the platform IPCC channel to wake the firmware and
>> to receive notification that it can service HFI queues.
> Is it allowed per the VirtIO spec?
>

As we discussed, its not compatible, will address in v2.


>> Add the IPCC mailbox client and power-notify interrupt handling. Wake DCP
>> before VirtIO queue activity, wait for the firmware acknowledgment, and
>> notify the response queue when the IPCC receive path completes.
> Don't describe patch contents. Describe your design decisions. The
> reasons for the flags, init/deinit functions, etc.
>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>> ---
>>   drivers/gpu/drm/msm/Makefile       |   1 +
>>   drivers/gpu/drm/msm/dcp/dcp_drv.h  |   1 +
>>   drivers/gpu/drm/msm/dcp/dcp_ipcc.c | 212 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dcp/dcp_ipcc.h |  56 ++++++++++
>>   4 files changed, 270 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index bdc34babfc21..4195bc0e1fc9 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -71,6 +71,7 @@ msm-display-$(CONFIG_DRM_MSM_MDP5) += \
>>   
>>   msm-display-$(CONFIG_DRM_MSM_DCP) += \
>>   	dcp/dcp_hfi_core.o \
>> +	dcp/dcp_ipcc.o \
>>   	dcp/hfi/hfi_packer.o \
>>   	dcp/hfi/hfi_unpacker.o \
>>   	dcp/hfi/hfi_utils.o
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.h b/drivers/gpu/drm/msm/dcp/dcp_drv.h
>> index bf6c34af43a0..af2db3cf9066 100644
>> --- a/drivers/gpu/drm/msm/dcp/dcp_drv.h
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_drv.h
>> @@ -13,6 +13,7 @@
>>   #include <linux/virtio.h>
>>   
>>   #include "dcp_hfi.h"
>> +#include "dcp_ipcc.h"
>>   
>>   struct dcp_dpu_kms;
>>   
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.c b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
>> new file mode 100644
>> index 000000000000..e60a3ecbe3d8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
>> @@ -0,0 +1,212 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * DCP IPCC power-notify mailbox client.
>> + *
>> + * The APSS-to-DCP channel must be signaled before a VirtIO queue kick.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/string.h>
>> +#include <linux/virtio.h>
>> +
>> +#include "dcp_ipcc.h"
>> +
>> +#define DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS	10000
>> +
>> +static void dcp_ipcc_handle_rx(struct dcp_ipcc *ipcc)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ipcc->state_lock, flags);
>> +	if (ipcc->shutting_down) {
>> +		spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +		return;
>> +	}
>> +
>> +	if (atomic_xchg(&ipcc->power_notify_pending, 0))
>> +		complete(&ipcc->power_notify_done);
> Can there be more than one power notification pending? Can't we just
> call complete() here?
>
>> +
>> +	if (ipcc->resp_vq && virtqueue_kick_prepare(ipcc->resp_vq))
>> +		virtqueue_notify(ipcc->resp_vq);
>> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +}
>> +
>> +static irqreturn_t dcp_ipcc_power_notify_irq(int irq, void *data)
>> +{
>> +	struct dcp_ipcc *ipcc = data;
>> +
>> +	dcp_ipcc_handle_rx(ipcc);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void dcp_ipcc_rx_callback(struct mbox_client *cl, void *data)
>> +{
>> +	struct dcp_ipcc *ipcc = container_of(cl, struct dcp_ipcc, client);
>> +
>> +	dcp_ipcc_handle_rx(ipcc);
>> +}
>> +
>> +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev)
>> +{
>> +	int irq, ret;
>> +
>> +	if (!ipcc || !dev)
>> +		return -EINVAL;
>> +
>> +	memset(ipcc, 0, sizeof(*ipcc));
>> +	init_completion(&ipcc->power_notify_done);
>> +	mutex_init(&ipcc->power_notify_lock);
>> +	spin_lock_init(&ipcc->state_lock);
>> +	atomic_set(&ipcc->power_notify_pending, 0);
>> +
>> +	ipcc->client.dev          = dev;
>> +	ipcc->client.tx_block     = false;
>> +	ipcc->client.tx_tout      = 0;
>> +	ipcc->client.knows_txdone = true;
>> +	ipcc->client.rx_callback  = dcp_ipcc_rx_callback;
>> +
>> +	ipcc->power_chan = mbox_request_channel_byname(&ipcc->client,
>> +						       "dcp-power-tx");
>> +	if (IS_ERR(ipcc->power_chan)) {
>> +		ret = PTR_ERR(ipcc->power_chan);
>> +		ipcc->power_chan = NULL;
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(dev, "IPCC: failed to get 'dcp-power-tx': %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	irq = of_irq_get_byname(dev->of_node, "dcp_power_notify_irq");
>> +	if (irq <= 0) {
>> +		ret = irq ? irq : -EINVAL;
>> +		ret = dev_err_probe(dev, ret,
>> +				    "failed to get required power notify IRQ\n");
>> +		goto err_free_channel;
>> +	}
>> +
>> +	ret = request_irq(irq, dcp_ipcc_power_notify_irq,
>> +			  0, "dcp-power-notify", ipcc);
>> +	if (ret) {
>> +		ret = dev_err_probe(dev, ret,
>> +				    "failed to request power notify IRQ %d\n", irq);
>> +		goto err_free_channel;
>> +	}
>> +	ipcc->power_notify_irq = irq;
>> +
>> +	ret = enable_irq_wake(irq);
> This is typically called from the suspend callback. Why are you calling
> it in init path?
>
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable power notify IRQ wake: %d\n", ret);
>> +		goto err_free_irq;
>> +	}
>> +	ipcc->power_notify_irq_wake = true;
>> +
>> +	return 0;
>> +
>> +err_free_irq:
>> +	free_irq(irq, ipcc);
>> +	ipcc->power_notify_irq = 0;
>> +err_free_channel:
>> +	mbox_free_channel(ipcc->power_chan);
>> +	ipcc->power_chan = NULL;
>> +	return ret;
>> +}
>> +
>> +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq)
>> +{
>> +	unsigned long flags;
>> +
>> +	if (!ipcc)
>> +		return;
>> +
>> +	spin_lock_irqsave(&ipcc->state_lock, flags);
>> +	if (!ipcc->shutting_down)
>> +		ipcc->resp_vq = resp_vq;
>> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +}
>> +
>> +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc)
>> +{
>> +	struct mbox_chan *power_chan;
>> +	int irq;
>> +	bool irq_wake;
>> +	unsigned long flags;
>> +
>> +	if (!ipcc)
>> +		return;
> Oh, you again ignored the feedback. Can ipcc be NULL here? What would
> that mean?
>
>> +
>> +	mutex_lock(&ipcc->power_notify_lock);
>> +	spin_lock_irqsave(&ipcc->state_lock, flags);
>> +	ipcc->shutting_down = true;
>> +	ipcc->resp_vq = NULL;
>> +	irq = ipcc->power_notify_irq;
>> +	ipcc->power_notify_irq = 0;
>> +	irq_wake = ipcc->power_notify_irq_wake;
>> +	ipcc->power_notify_irq_wake = false;
>> +	power_chan = ipcc->power_chan;
>> +	ipcc->power_chan = NULL;
>> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
> Ugh. No.
>
>> +
>> +	if (irq > 0) {
> Can it be 0 here?
>
>> +		disable_irq(irq);
> What for?
>
>> +		if (irq_wake)
>> +			disable_irq_wake(irq);
> It is enabled at this point. Drop the useless flags.
>
>> +		free_irq(irq, ipcc);
> We have devm_foo() functions to simplify the teardown. Can we use them
> here?
>

All of above comments to be addressed in v2.


>> +	}
>> +	if (power_chan)
>> +		mbox_free_channel(power_chan);
>> +	mutex_unlock(&ipcc->power_notify_lock);
>> +}
>> +
>> +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc)
>> +{
>> +	unsigned long flags, timeout;
>> +	int ret;
>> +
>> +	if (!ipcc)
>> +		return -ENODEV;
>> +
>> +	/* Wait for the doorbell acknowledgment before returning to VirtIO. */
>> +	mutex_lock(&ipcc->power_notify_lock);
>> +	spin_lock_irqsave(&ipcc->state_lock, flags);
>> +	if (ipcc->shutting_down || !ipcc->power_chan) {
>> +		spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +		ret = -ENODEV;
>> +		goto out_unlock;
>> +	}
>> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
>> +
>> +	reinit_completion(&ipcc->power_notify_done);
>> +	atomic_set(&ipcc->power_notify_pending, 1);
>> +
>> +	ret = mbox_send_message(ipcc->power_chan, NULL);
>> +	mbox_client_txdone(ipcc->power_chan, ret);
>> +	if (ret < 0) {
>> +		atomic_set(&ipcc->power_notify_pending, 0);
>> +		dev_err(ipcc->client.dev,
>> +			"IPCC TX: power notify failed: %d\n", ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	timeout = wait_for_completion_timeout(&ipcc->power_notify_done,
>> +					      msecs_to_jiffies(DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS));
>> +	atomic_set(&ipcc->power_notify_pending, 0);
>> +	if (!timeout) {
>> +		dev_err(ipcc->client.dev,
>> +			"IPCC power notify acknowledgment timed out\n");
>> +		ret = -ETIMEDOUT;
>> +	} else {
>> +		ret = 0;
>> +	}
>> +
>> +out_unlock:
>> +	mutex_unlock(&ipcc->power_notify_lock);
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.h b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
>> new file mode 100644
>> index 000000000000..a3430e5cbe72
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * IPCC power-notify mailbox interface for DCP firmware.
>> + *
>> + * Channel 5 carries APSS-to-DCP wake notifications; responses arrive through
>> + * the mailbox client's RX callback.
>> + */
>> +
>> +#ifndef __DCP_IPCC_H__
>> +#define __DCP_IPCC_H__
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/completion.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +
>> +struct device;
>> +struct virtqueue;
>> +
>> +/**
>> + * struct dcp_ipcc - DCP IPCC power-notification state
>> + * @client: Mailbox client used for APSS-to-DCP notifications.
>> + * @power_chan: Mailbox channel carrying power notifications.
>> + * @resp_vq: VirtIO response queue notified by the IPCC receive path.
>> + * @power_notify_done: Completion for the firmware acknowledgment.
>> + * @power_notify_lock: Serializes power notifications and teardown.
>> + * @power_notify_pending: Indicates an outstanding acknowledgment.
>> + * @state_lock: Protects shutdown state and response queue access.
>> + * @shutting_down: Prevents callbacks from accessing teardown state.
> What is going to access it during teardown? Can we shutdown in a logical
> way, so that there are no accessors after starting the teardown?
>

The access can come from dcp_ipcc_handle_rx(), which is invoked by 
either the power-notify IRQ handler or the mailbox RX callback. An RX 
callback may already be running when teardown begins. Without 
protection, it could complete power_notify_done or notify resp_vq after 
the queue has been detached.


>> + * @power_notify_irq_wake: Whether IRQ wake was enabled.
>> + * @power_notify_irq: Power-notify acknowledgment IRQ number.
>> + */
>> +struct dcp_ipcc {
>> +	struct mbox_client client;
>> +	struct mbox_chan *power_chan;
>> +	struct virtqueue *resp_vq;
>> +	struct completion power_notify_done;
>> +	/* Serializes power notifications and teardown. */
>> +	struct mutex power_notify_lock;
>> +	atomic_t power_notify_pending;
>> +	/* Protects shutdown state and response queue access. */
>> +	spinlock_t state_lock;
>> +	bool shutting_down;
>> +	bool power_notify_irq_wake;
>> +	int power_notify_irq;
>> +};
>> +
>> +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev);
>> +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq);
>> +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc);
>> +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc);
>> +
>> +#endif /* __DCP_IPCC_H__ */
>>
>> -- 
>> 2.43.0
>>

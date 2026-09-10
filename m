Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696457EDBF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066339; cv=none; b=sqqvBjZVPMWi7lWGm9cz4/akElyiAwXgLsKvOxu0VQ/CSdH7GfxSa4uA5icp+TIvnD/DePOhYbvxhB+Gn74/TcdbEZ0BGmkxwBFrjxJudm1Yl0HuhfE/y8gESn9fvoYbFLapnaO1BJ2QQ5wPduuLEAH2iahqnDiQPgTlyuI8Vik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066339; c=relaxed/simple;
	bh=pMRYSRw2mhZcwAJ57AFUgi49JzM3WlQNcDcoySJu+38=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cv2YjUGZNTQyNNigIAE3+iwTRHZQdg1/ooFpNipsZsn3TpC2wCBMPUsoRyTjTHHoS4/p2mMr9l0643pSx2j6DspM6bRadFWwpS8VgrBnw0kJOoz3EJvpahXozFXDigErLEyE+4mfc6v+5eMhUhix9OWwaFS+54EwR66VB7za/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gH/QsaNe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLm10/EZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gH/QsaNe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLm10/EZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AIRQPH1108918
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TX5xEsN7qCQIDoopBpS4rzgxnoxv1TE/SIlS+HozpQQ=; b=gH/QsaNew8fS9YD3
	aaeGAtD0VvU7vFgRWpaDiASb1uzIfqLDaNBkBzDVlG4/VrWhKIGtcqrmTBJHQDyr
	mDgwG6CZ6S+X8bzauacPhlh/ngomTg6pptt7OhCYtuAiTv5A3JqEsKENZ+A15FwO
	sjn2mQi8eBkaHn2dMkVk04pCt0qblHhAu1RahJRpUZaYj3V/TvI8fAEoCm1fc8ae
	aklzVnAtWJDpipHIcRjbJcY3hcNjbrBECdGJWmSxLkw/QCN+McRIsczCk6ap2QVm
	N9BZWnqyyVj7ZjRKpTmEKcB/z1f4jr9ms9B5nDwMuKUE9gqPR6FOH9kMf0cytwwN
	z5RP1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv793eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:52:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1478486a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789066331; x=1789671131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TX5xEsN7qCQIDoopBpS4rzgxnoxv1TE/SIlS+HozpQQ=;
        b=jLm10/EZN7zOjUSCvrjDQlfmHQ8AMPv5j25aiz5HHv4/45y4Qyvt+82dStIGCAtk+L
         5FMS6jxLXgj89z+SK2ExMc7T3Rq3wmRFL56rn7SMAa1ltsi4iNUXw0FuATxJrC9N6n8y
         ORfM8RBEXQGJac4cIuewRZMHsuKQmkW2g822iuHtfUFL5+VxOtz+Pb6neQvXZ1nJDYd1
         G1FIJHOROJbtxSirabjbmyW+NaEd/OZoHxFp/+s/fP3GAwWymVKMOlzAKs4nr7vmi9Zt
         ERjuASD/1o2FC6BwG6J+qZFgQb4SiLtNFf/nK9IXqKKOYZefhiiq8PSV/TZv7Nzh/T0t
         KXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066331; x=1789671131;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TX5xEsN7qCQIDoopBpS4rzgxnoxv1TE/SIlS+HozpQQ=;
        b=XZes7equttpqcW4tULqWNs7S8DcggBabEVxIsbCVNTUdmVQBDmZuQ4sbgDRAcLgARF
         U/bGvh1+hUvfWbcxvDFDubP99pxa5e3jghTHt5IqChcSda0o2AdKSU9JZcc01Hr6vFcv
         1/tGvYxJSBM/+fWV/91iLIG7DQSgwR6sunfkYtUXMwBm0xRtGoYFZMvVcKHD+llFBMwr
         g4BLixggt+pMgkAafb2U36HnkY/G/NJc4ils7HYWnhEr5hVRGOw9n1OSruzye01+3epf
         1xFF9bMUj8tlwmeXKLeEnLrFE+pdJvicm/2NiF0RKPtna+hu62KaEGxRMnxL8vICU5YE
         BcFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKVkU8nVycMyOwBEn2HOgkFDJWBbsjR1ZLWNjMf+6jNy6LQAij0fMLWVJVnGhCf7Ne/Wm/Kxc/K7++gNo=@vger.kernel.org
X-Gm-Message-State: AFuF++maHAVJ9W43J13VBRkRlE+9r9mh1GLVdkAIx099rVZApUkSPp4T
	6N2qHuvA2ie7YHK/LNz6EAo5iaykVaNzwNJLseBt788Lm4v5sUEfMMBnWxRNkgZubQw+9lK6fGX
	VwqROy8Rcts3Cn/cyTNWM3XmGmXn9tQg5aaMNDIKY6PdtpUT0uh/F+IoHNFyxX01QjPM=
X-Gm-Gg: AYBFou2Yer2E5mjZMuS/cmwShm5SlWZvsmv34rrIcfxPACI/xxPzA3IbUdXqokHbnmp
	oAfzAepWoLf7cDYMqRa59O2/rv2phNY6Lfo8CjR9h4goZC3yaeTicC9jQ76wnagWZh5T8DHC3Vb
	c/i4xi1LAEa6TGyw6I27shJiP/lcdBaa9XngWFTjvH3XZ+Gv2Dwk08KV7xjpWA/5NXlKe7E1ce7
	zwTR9gtIrAddf+QIfrmvqF+kj8zp5xcSjIT8e5+WhXdCN11D9vxYYTd6h6b/GXCqneN/JHGqmEY
	kamofPtH+uzud0D5xH77zIZ2b1EVD8hNv/P6DDRTrTtEpY67a0KWP3c1e2PHm46IenMfuaVwekh
	QusueDeU3EawoASeQxoFV9FeRoDI=
X-Received: by 2002:a17:90b:54c6:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39d779167ddmr7340985a91.1.1789066330758;
        Thu, 10 Sep 2026 11:52:10 -0700 (PDT)
X-Received: by 2002:a17:90b:54c6:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39d779167ddmr7340943a91.1.1789066330283;
        Thu, 10 Sep 2026 11:52:10 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm893525c88.12.2026.09.10.11.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:52:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:52:04 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
        conor@kernel.org, jic23@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        bence.csokas@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] cache: add SMCCC-backed cache invalidate
 provider
Message-ID: <20260910115204.00005a79@oss.qualcomm.com>
In-Reply-To: <20260910082142.1522865-3-smadhavan@nvidia.com>
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
	<20260910082142.1522865-3-smadhavan@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIzMiBTYWx0ZWRfX7jJlP0IYOr9O
 qL93t21tc9qSO+PVp9TRlCLUE+m2e1u/WWOgRDSF5zkk8o/ZWSgv1Cp/y0CWNBykXYK7AeWCjq+
 qb3xz83uaqMvEh3eRUkpRJJLZ7txghY=
X-Proofpoint-GUID: kbmHytPLofsMcpHaOS3BEDMzeHG51fwr
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa2fc5b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ikd4Dj_1AAAA:8 a=VwQbUJbxAAAA:8 a=6Y3uqnu38QBErNT00lMA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIzMiBTYWx0ZWRfX0qWczLdXT9St
 yGEseaAQoyHA1NF4GSu0zupR2b0Xr4472K03szQZrSpsHnrhdqKSBU95LUn2LM2oc9IgLt3d396
 HnS+3QrlL6HlRYsU6NIHTFr8xZ09OSALtA0jOmZ1pRHXy5IDbbYZQtqIx1U0mEQ6Iq9AdTEBDmP
 kMGoSQmTmDT1Y/qyRVPGiF2gld1AWCtPMzxh+RiItDeS1ZCivSPxy0laNOwVp4ZMMsOZNQBlg2W
 g4EV7/4XVpAB8bS1A8+Fz8mGDPIosWCiRw49HGhgRYevwD08kIviLtHakrmQOwBRpipw1fo4fs8
 zRw4lK2IWwh3eqyljAW+ogs+o46TlBAEQwkH13J8pYUjwlJm4opAht9UsmdQ57JmrhT/F5Nj7Ud
 UYmtef4Jpupn8WcaAK4sc0654XuHI6dbqALYhn+tkZpMnImxr7L0M2xMDiKbbVbFL2AoT89gpv6
 hZxvHCjf9o5BDK6XXnQ==
X-Proofpoint-ORIG-GUID: kbmHytPLofsMcpHaOS3BEDMzeHG51fwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_06,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100232

On Thu, 10 Sep 2026 08:21:42 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
> interface.
> 
> The provider discovers SMCCC support and attributes at init time,
> serializes firmware calls, handles transient BUSY and RATE_LIMITED
> responses with bounded retries, and registers with the generic cache
> coherency framework used by memregion callers.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org>

One tiny thing inline.

Thanks,

Jonathan


> diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
> new file mode 100644
> index 000000000000..1cfa8f8809d0
> --- /dev/null
> +++ b/drivers/cache/arm_smccc_cache.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 NVIDIA Corporation
> + *
> + * Arm SMCCC cache maintenance provider using cache clean+invalidate calls.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/cache_coherency.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>

Small thing, but can we avoid including the catch all that is kernel.h.
Generally aim for more specific headers for what is actually used.

> +#include <linux/mutex.h>
> +#include <linux/nmi.h>
> +


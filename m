Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618523BCEE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825641; cv=none; b=U/YLG1+rKiBdLCw08aQcWv09N87PTdLIaobjHNoNVAVLdAM7tM6RDJNyvvDM3d7Y+i+t2G0F2wixICTPmP1NhASJJsMvEu8vuZW/lSWY334jMY1GPKj9NcF1YRXBkcWXu0NuAdg0cymfK+VtSVYU/uiwiqog/Kag9hS5p+geRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825641; c=relaxed/simple;
	bh=bCAmFmW4eH9KsywosXlTGHx0uzAhktmc2BCUJbmrHY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrf1mjth53VEHGOjRHtQ5KTKUpe8QHyRpODQ7+TioG8s24e0exg6Hs5Ncb92fEaQV9rnViLeeqDv6kyArBDzLuVx1IpHPGWv6kB3SDQFEmvjr9jRbPCmU/MOGGuKpoyqzFjLHuRszK2T7TdHwL0elFfxXCl7u0v7krcT6X7teBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxU74tfD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnCMCMRx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxU74tfD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnCMCMRx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9HjDS3643614
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	08PVDrdFiMsGhuzXt0QxvkpAr/fHXOjfdnZ42eGdeSY=; b=SxU74tfDR7Ldyy+I
	Woc/VI34LT2Cx9PectxKNWYLzMfjWRo2D5JcC0br7wev4WnqZkDrjqIOiF5VgvF+
	N3WB57cWfG16U1Gi4L4PfVexpUA+7GJpXmkfkvV9CtWPjLpzse6ke/HOAtqrl51u
	L1UnFf3nQjVaIEPCSwaFB/YIwifS+Aqqk6ZgV+UyBtmKUIYwxH5Is8kRM6NvdAJ3
	T8Zol4RMD3dCxOz/LXlmQYy2+b+W7NElEAHF9/0F2ZtRiNo877zfaVzH/jLykgBD
	srQXNHo033NhhsHOy+LzjmLnaIKLBnODyUn5tAmsQvPgmc/TIA3cv0W4nc7R0hwO
	RVrO8A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ecb73d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:13:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so1076677a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787825632; x=1788430432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08PVDrdFiMsGhuzXt0QxvkpAr/fHXOjfdnZ42eGdeSY=;
        b=HnCMCMRxTnx3EBLwVaTzRuOOC5Dr1/q9PVueh57oTbWz+LHAof0MysKJCXMrNTkxO7
         bXLF5260LXdDd0jwTbtmJQkn9Df1e+8DH926ptkbqSfhL2Fjnj8Px/FxqkosCgh5gGAi
         s+db2l1KmsEeb+YcBLZSPYElwSkWArRldwzEougWb8L6aBwSdijSmBGcxVYbnom5ZPN3
         0N4sqys4taGkAkzeKZCLIpQN1p2ya5dhdxMO1/hCRAxWfh26lkDnqRKA3ziwxmna99+s
         TP9zepg0vPk9QALD4cjkb/7Gg1MC5MoEn14rGOd9Ra1yU8Ah0kJu6Duf3ei13qMikbtA
         ZDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825632; x=1788430432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=08PVDrdFiMsGhuzXt0QxvkpAr/fHXOjfdnZ42eGdeSY=;
        b=ZEUeX5202Uk34X+VGoRa0eLOJaG+ukyLh6pCABwYMfRfb5qXt0DekarSHLbGMyDH1i
         rFFSNijS9U4SNPzskGRcQZor8K7o8fDtKdpoIsMg3iws/dJFO/dofJkfv16CedNQ+sMo
         z/FAV0AYU3gQYihaj16hbgQSpBctLULrcCuvSUmZS4RstPnRJVGQmNFCBdFJTHxZIJlc
         9gEUmGbsnea90k/ezrp+HI4x3IQk/voSNhaofkFCWjNJS35MeYKf/fpUA1/A0LnEGhQ2
         Y2fWGydv0O6Bh4q/JcyGaJ2uyw3zTRqtieAogbjogzuSZ0MgDv+95jV8DGgU67PRe/MV
         NqcA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3miOHx28849WdQYeMCaBpydbPiOtULkeNwNeuT35T1/1ph1QzTxctQ2+pJt6JREKO+mmZ2eIcoIv6nMo=@vger.kernel.org
X-Gm-Message-State: AFuF++lHtHIwayFvepWRIlbKXD04splL568GEGuREotJUe978hlVHctR
	K06RfC/mX3NWZNyPYHSASB7s8kCJBHXWH+vc3L4OctAw/L3r4pfKBaYRTvQB+IXVmGRL2apuuLD
	ykymaA02CUf+SE/ggi+rKbu1Hhz/W+JSYOtcbsgbN9Qq2bSCbzX+UD7BQpSHaCyxULC4=
X-Gm-Gg: AR+sD12hQkdUD4SUOhjSdNuqbGZQeeSxhpppToP3Mf3medPbmlXSouwwRGUKUL+fche
	mtvKIzJpMDYo2kx8T/tsIUd6e8AczzdnRKY8JcfTLKr75i1Cv2trQQOouVF6fHZjWUIe4nkVIGk
	M20t+cL94v8zbGKX1bLAktaTCByxect9euwTwD+Z46szYbikzu8B7nCB1guSpaD4oCFKhxgUbTH
	Al/+LnNSojgQYRZMNaccCyigSXNUK4b2ZEWOlV+3LCbeTDAj5p0X9ZnYJ2Huagkrka6cuFyFtyn
	Lv+Vxx05G34YRgn61E9SZS+U0zpcjy76tODcktNJCjZiqKq1UcZt13u+TpfIffbo4x086dICmjO
	BQYQKXCQQNw+5v2OkItfZ2RvlwHEzlg==
X-Received: by 2002:a17:90b:530c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-3966d3dc393mr25974509a91.11.1787825631711;
        Thu, 27 Aug 2026 03:13:51 -0700 (PDT)
X-Received: by 2002:a17:90b:530c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-3966d3dc393mr25974405a91.11.1787825631238;
        Thu, 27 Aug 2026 03:13:51 -0700 (PDT)
Received: from [10.218.18.30] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm20318655eec.4.2026.08.27.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 03:13:50 -0700 (PDT)
Message-ID: <5798db8e-4c26-4208-ab65-16ff3ad4d446@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 15:43:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amba: Fix driver_managed_dma check
To: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
        Russell King <linux@armlinux.org.uk>, gregkh@linuxfoundation.org,
        rafael@kernel.org
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Will McVicker <willmcvicker@google.com>, driver-core@lists.linux.dev
References: <20250425133929.646493-1-robin.murphy@arm.com>
Content-Language: en-US
From: Ketan Kishore <ketan.kishore@oss.qualcomm.com>
In-Reply-To: <20250425133929.646493-1-robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a900de0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=7CQSdrXTAAAA:8
 a=C8WugiQ-6VtP81x-AMAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: yDBIFPO_wU3fQteDJVeTitydyJv1AYhN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA4NCBTYWx0ZWRfX/KamK94qBPqu
 KooaMuft24XwKqn9tne7pLKGxP473/uXQYIQy2jrIbKbpOwsUZGOtyBx5oX44DkTIPTLiPyCd6S
 zuK55yryrLR59zE5JVxcMrbdlHAHwlLII/bpjqi4hwmFFow3oLu2FsZ/Llz4/3zBQdHYK2SeBpo
 In+Lv2iKvaxz17j3Sru3UvSRVZuR9uOedeX+WkW9WBLeW5YIzzATcci+p4UXAXzVeO66nB4WL9e
 RYJGT/7je8SjmjFq5FPYn4Z6xkz/Vdjg9k4EQqgqh4AUb9tpx74JT2iTYTH1O2d2HjRjudmcpkw
 463JTrYa4i7xHFJqRMBu6nQHjRdqsCJXU74o3HKh+UHl9HgeLHZ3PE5sMwKtoBymXLMbiPFbOq5
 Y5MArJe9S9KKyTifUaTS/97e6GIjPneeCdVetzQvXIzptTITaPblaCY5DANKJqEhhTrduS5ORcK
 X4I+CGF/yQvxRAZT5Yg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA4NCBTYWx0ZWRfX6ffISChcqg0B
 IKeIbz2IPuKrwmvZGYgXjA8bMTlwpBYmr2CO/cbIIHmkA7SEO0kN9b5wh8WwDvCt6m2EtpOcJK3
 XTb1v6bhOCF1NcLGsoTOFa0arDYng+o=
X-Proofpoint-GUID: yDBIFPO_wU3fQteDJVeTitydyJv1AYhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270084



On 4/25/2025 7:09 PM, Robin Murphy wrote:
> Since it's not currently safe to take device_lock() in the IOMMU probe
> path, that can race against really_probe() setting dev->driver before
> attempting to bind. The race itself isn't so bad, since we're only
> concerned with dereferencing dev->driver itself anyway, but sadly my
> attempt to implement the check with minimal churn leads to a kind of
> TOCTOU issue, where dev->driver becomes valid after to_amba_driver(NULL)
> is already computed, and thus the check fails to work as intended.
> 
> Will and I both hit this with the platform bus, but the pattern here is
> the same, so fix it for correctness too.
> 
> Reported-by: Will McVicker <willmcvicker@google.com>
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
			arch_teardown_dma_ops(dev);

Hello Robin

We faced this issue with amba_dma_configure race internally as well:
Call trace:
   amba_dma_configure
   __iommu_probe_device
   probe_iommu_group
   bus_for_each_dev
   iommu_device_register
   arm_smmu_device_probe
   platform_probe
   really_probe
   __driver_probe_device
   driver_probe_device
   __device_attach_driver
   bus_for_each_drv
   __device_attach
   device_initial_probe
   bus_probe_device
   deferred_probe_work_func
   process_scheduled_works
   worker_thread
   kthread
   ret_from_fork

We raised change for this based on already merged changes that fixed the 
same TOCTOU race for the platform bus in
commit 95deee37a123 ("platform: Fix race condition during DMA
configure at IOMMU probe time") and for fsl-mc in commit 152f33ee30ee
("bus: fsl_mc: Fix driver_managed_dma check").
Link: 
https://lore.kernel.org/all/20260825-iommu_races-v2-1-49de6de71357@oss.qualcomm.com/

We later found this change you raised which was never merged.
Can you please help to revive and take this change forward for merge.

Reviewed-by: Ketan Kishore <ketan.kishore@oss.qualcomm.com>

Regards
Ketan

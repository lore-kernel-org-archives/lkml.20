Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723692DF719
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540596; cv=none; b=g2YgETNMz55ivymR53dxwjITunUTaF8fxURLno2dPhcf8POzjhW+0RhEXxZH32V1kAxyetxSJLi82ZfZdzK5KVXWDMUsplstWFrIVhymVjqChum0hmY5ZJ2D+zMv2M7jiDES6jwXaQyk2LGE5TRHLT5xJPEhqGdhCpaarwDEpqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540596; c=relaxed/simple;
	bh=RojMG25mfLm/DZzwFxgu93kfVSJUhFHHMYlqpPJ+GL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8hByxWzkdu+imzm0f7tZM3O47vNRzEqwH6b0t3ECJInHWUn09I2QmLOPLgEEE+t5osayDpoEooncF2ORVQOcPAaVPkyju1VCX5tnxrrUG/57mIc+5IAI8DDyah3Js0XS5MiWV6o6J0fm5O+HdokJgv2DDFFrhu+oz1/yLIfN6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSubTwXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bn2/OZeU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSubTwXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bn2/OZeU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KHT6642384
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 10:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=; b=lSubTwXBIZExw0y3
	mCKZ5O4RcU+/WWJNznioXRJFmxmv2GrYHrkRjOa3R3q6tSX7A7IwWV72YHThbB1X
	BuThoo8If2omR1gAoC1f2v7eykSQhm0ccmnHC6i6CM47K9us4bBUeBOAjmN3eM4n
	GIGSlqKAfQ/9VN7U0HZSYpCQnLW5jXDly/MjbPKshHYSFObcG1UJ9C6dWVHcsF28
	80m3hnNpGuNXfSqOZ/B/RTxtQ49QS/WHvEGq3kXN072GEDoeM32Y1QN9NKKszayG
	IQB869AkZhR9JErwJOvj4U7kTI5QFl7X6qj6II8IRs6KHfN8EGJSNUQR7sqSSvj/
	wZfbLg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxru2j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:09:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so9279799eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540594; x=1792145394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=;
        b=Bn2/OZeUj4l5AMiD2YJbIJjmNOWFjbeNrWODyuHqE82JnAfvvgo57OaSySF6+ONrfE
         IZ8ZaCCvUVgVdV4LJ1O6ywcHfMGSejY4gCfMD0p2znXwm/3x2O8d8kxB8woe5ng1BPQ1
         pFpgqL3uO08cnRbwKWCDpHFa6rAqHNDZePbjM4p917EJLnVymE0frqpmxbjsn4sjJH4a
         TBryB0HElXQZh56n79OYiEmn9CaLb77rAUAxZE3wQu2lPRbvIdgHWB3q5cVjUl1Av9Nl
         Zd1hwbdEZNfmP4TXWh7nVT96cAAcl4auHdPQvHu9NBasldCB43x6/bZWvptVI8dL2nRG
         eBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540594; x=1792145394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=;
        b=0f+yytlFr3ayF34ABrtvjyy5dnYMt7Zpo0znJ6U58CbCEmHRMNAtngSAnrAWKSZtCi
         LuNJfsywzyx+sPjwJU2jYsQi7MP9DLl8JrpPLEjKHX3U1ewnTEFg8vZ7jg0yv5Zl7Aya
         PH5pbHsl0MU/yQfPUFVOKSzmMrFslntFq0fUD1NLcprhR+J1f37Y7QsOmZlbd2hdZ3Q5
         WzvEzqkamnXvccN96t+ZozIHqcp/G0np/3DemwM3XP0nTs5okuXVVlbXjYqwbD61fkci
         jHf/iFtw8VfWEkVKmlDO9Jw0sQFtEWfqfdcxLGFv4jKzGN+GnQ4/uqRRKadAVMzxZJcp
         Pi1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYoHuU0223mLquCQvNioHf95z1m1e4Q56lLf8Zeojfg83FQdBBsiHE36xJ3waUzDkEPFlwACuL21HxAfw=@vger.kernel.org
X-Gm-Message-State: AFuF++knSkiJ3knbtWpMmK+u4fQv8w1ojVwcdtKGhQKxIVvL8yVaR9uf
	cF3trrHNNDrVScE/zmCb8hAAOOLcKB+SPPvTkBWE7KxtzYK4073CNvQ8RlGJd8U+l9yqa261ibi
	w4lR6753KOtt1hfa1vIO6q1PaOjhGxfbSsb7PIWBsvOZ0xlLdMyqj2k2uFTkou8sppWw=
X-Gm-Gg: AYBFou3V7Z6LhUauwaSAeC7tuaCv3G5n3YC4y6+AKYHF6GZloaRMBPth/VVkWMIjV6H
	GmInyySI4RxyItnbxufUxe8Mw+y3ev+3366e7Tp9gr47XrqpIf6jIfz/jKW7l+d6LsJYrDB6fMz
	QCFYxFPBTGcXmfxenMLFpCeTAqOgadIyS39Tx34JAkzUCc0x819o/fF62MN6qKt8q9tIVpmE1sQ
	pa9R81zkXL70p8emmZCQWGtBwX2pD2Vd4xfpmHsCQ28HqDmBoxgeOfDn6vYbt0rSBMMdmjA9gc8
	5ZQkgbny4lh2y3vFVDGR52/PkidWxQtDv1vAbbcYobXZuGfGkUns6F7mbx/mTczqu9bPzefSE5A
	ECquSGZDYPneKvkrJfYDiSjUKAd/kSRaZ
X-Received: by 2002:a05:7022:3b87:b0:148:80d4:84b0 with SMTP id a92af1059eb24-16a60de2f7fmr2202194c88.23.1791540593815;
        Fri, 09 Oct 2026 03:09:53 -0700 (PDT)
X-Received: by 2002:a05:7022:3b87:b0:148:80d4:84b0 with SMTP id a92af1059eb24-16a60de2f7fmr2202142c88.23.1791540593160;
        Fri, 09 Oct 2026 03:09:53 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1cc25sm7332804eec.8.2026.10.09.03.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:09:52 -0700 (PDT)
Message-ID: <7ab6eab6-ec6e-47dc-b387-eb380e2e365c@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:39:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <20260924001502.GO1540250@ziepe.ca>
 <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
 <20260924225340.GC16465@ziepe.ca>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260924225340.GC16465@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8bd72 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=9jRdOu3wAAAA:8 a=EUspDBNiAAAA:8
 a=YC-9j5RmPirwrlDSig8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-GUID: PHdz7G8XAyXYMKK_smvOdIdH9cWQqfX5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX4lsnofbE+xNk
 ZUIX8wVUBmZyQjr/p9GBZarsc1pEYA5e/5NkmAPecpdzWPLkI618FpNCzQp+5J16tmiDPniwzfA
 PZTdJnVnUTESbtFX1h2261rcXTNTQmBChDdH5oEYij+YH+xheFfTVwYiDb2BCBKwV8mo0gTR7Eq
 vAvdnEx4uGkwuv1e0Txi/QJQ9jKmFgTh/3w/zjbA9JUUbuV6zIO5L6f6Ck9Y8cW1LR8/BhTk3zQ
 1fRxYjRm4QY9pyOoju0QpLncU7fkevYj0x5i+VsKf/Lo8EVuNvzHoevc2xU7WQUwP3+XpEOvOgF
 VZBBJrM8ioI7gh0WP7O32cVXwO6vo3HohDcR0YlP6v4JVG0k+3X2truBieN9weWVk/6rV6JpI4p
 uEFIvV9zV0WPYh43xj8XCOB/ZBNSei7mdVfahPSQNMSfI0gYl/LIh/gPphTqyr0tKgAJuHiUfL9
 5JpUYUg+59yyoOSflVA==
X-Proofpoint-ORIG-GUID: PHdz7G8XAyXYMKK_smvOdIdH9cWQqfX5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX+ZYeZdSPB3Zk
 FdcUBi4mUNko4OqFNrrWJXZIXEbnfxkEysmznmwfwGG9HLxdCrosaQTHi1KU6YfJXBzj+ZDZuL2
 CABj32O8d259UqoBlb2WsQiz8GNGe+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090040



On 9/25/2026 4:23 AM, Jason Gunthorpe wrote:
> On Thu, Sep 24, 2026 at 11:49:50AM -0700, Daniel Mentz wrote:
>> On Wed, Sep 23, 2026 at 5:15 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>
>>> On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
>>>> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>>>
>>>> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
>>>> When a set of consecutive PTEs map a naturally aligned contiguous block of
>>>> memory, set CONT on every descriptor in that group so the hardware can
>>>> combine translations and improve TLB reach.
>>>>
>>>> Advertise the supported CONT group sizes in pgsize_bitmap. Callers select
>>>> those sizes through the normal page-size selection path; io-pgtable-arm
>>>> then installs the corresponding tagged descriptors directly. A partial
>>>> unmap of a tagged CONT group is rejected before modifying any descriptor,
>>>> so a rejected request cannot leave the group partly unmapped.
>>>>
>>>> The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
>>>> CONT support for hardware with implementation-specific errata.
>>>
>>> smmuv3 has this errata, it must be disabled there too. I didn't notice
>>> it in this patch?
>>
>> SMMU is an architecture specification. I am not aware of errors in
>> this architecture specification that would preclude the usage of the
>> contiguous bit. I understand that Arm MMU-700 has the following
>> erratum
>>
>> 3777127 Under invalidation in TBU possible when using contiguous page
>> table entries
> 
> And a neoverse one too.
> 
>> The recommended workaround is described as
>>
>> "Ensure that contiguous page tables are removed using a single range
>> invalidation. Arm recommends using range invalidations to remove
>> contiguous entries anyway for performance reasons."
>>
>> and I believe we are already doing this.
> 
> No we aren't. Go read my fix on this:
> 
> https://lore.kernel.org/linux-iommu/1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com/
> 
> I have another patch that fixes it for iommu domain mappings too.
> 
> Jason

Sure , will disable it for smmuv3 for now.

Thanks,
Vijay

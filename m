Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558685;
	b=L9pZ2bC6SjGrWW7txVBPXIma0XN3/m3YiLhSql0ELaRw5pGfp61DFG90H2eCBgLmkcJe
	 joz8Q+llqWPaHnFDQqw/R6Y6HxvgpE73ECu8zCZ7jx8lItiEEL8JXWHpBrZTAbUa1u2IQ
	 qOKlsLIW6ThJ6IXVFKwWCB0g2028n5r+mJZ9K+7bwLYF63DZ1IJE+AZrO81ThqlMzcizb
	 YkY+OblNbyuXrXZ0/Mnz0va9cz61GIQEEs2Gk46TsNfHpM/xZ5SIAvHJJ2T6c2120mi5j
	 P/q8ocxq/pmveAsaFh16hjY2ZLxlQPHHAQwFilQA6ZL//gGtobhgNsXzC3s8FGr6QBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0dsTghYJdYyXlr964iy4q3c+0pF5MB8OiLCrCAX4yUE=;
	b=4Mi6MJbLjLjfpywMWqxMynieQCHbxpcZkiqsV4//cEJmsX29Pi/5ZV1KHLfcXAbiGTRp
	 ju8HgJODJe4pGUH9ZRpP3iOgI78nT1FYD0snya5E7oinhrwkPYSDbK9/s83UDNEhR31co
	 +Fp+KrE/2jp7QjHpId4h1/ZWP521ePuIR+7if+hGXUA+jbxunVT4JNmFIFWQeeQ6ruYHQ
	 E5PpM9pZpeP8OHNpM1CFcSdB3Wzb8D6GpXk6csVv38TP5jLSJ/vFbLlZiOp8MvcmwkKIl
	 4b3pVLguQZeQkVX8NUx13/SxDGepnluw3eN5auXMge+pcGBq1Er0d6CkvX0Dd40esXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J0MKqCQ2;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73427606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73427606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J0MKqCQ2
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2E3Zx061697;
	Wed, 21 Oct 2026 04:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0dsTgh
	YJdYyXlr964iy4q3c+0pF5MB8OiLCrCAX4yUE=; b=J0MKqCQ2tjsAQy9LvEq2MV
	8AcNRxpEUgcP2il2kfn9a7kzJraMzUxfd5P+Nn7z1tuZRkpoddy5WMSCcRi+Qd/M
	4uKGKKbqlCV1NsXWJZUwaHfzjK1lRCwzD6TtW5slUWuSz4jZo+J4+VzMu4m2c+HZ
	S+ImFk091dCLdnyhdXCG2fU0c0YqfR+uVNLf5/ppnsMfGZ02SaK7Zvzfmphvm48M
	kulJ+ixNCpQeEQ4RVSNFJny9BWLg3sA8d7NaGFVL27cB9GuwffciBynrmWavLrye
	vUZPSg1b6a8NdlpEyFbSJTrujkd6xwXWf1/pCE2Pm7vU5Ypjp6oqEJ1oL8GrjA/Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hdw58q0v4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 04:57:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2JrrA2374699;
	Wed, 21 Oct 2026 04:57:42 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4he7bs3khy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 04:57:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69L4vcGG23855828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Oct 2026 04:57:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2487420089;
	Wed, 21 Oct 2026 04:57:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAA0920082;
	Wed, 21 Oct 2026 04:57:34 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Oct 2026 04:57:34 +0000 (GMT)
Message-ID: <6394334a-b8d5-4729-843a-1601182e173f@linux.ibm.com>
Date: Wed, 21 Oct 2026 10:30:15 +0530
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
Subject: Re: [PATCH v1 1/2] kho: check scratch vs CMA alignment at runtime
To: Mike Rapoport <rppt@kernel.org>
Cc: kexec@lists.infradead.org, Aditya Gupta <adityag@linux.ibm.com>,
        Alexander Graf <graf@amazon.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <baoquan.he@linux.dev>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20260928083226.107807-1-sourabhjain@linux.ibm.com>
 <20260928083226.107807-2-sourabhjain@linux.ibm.com>
 <asC15ISMMbHMwnHi@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <asC15ISMMbHMwnHi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 1Ag3-4et4_vcswAII1d4cO_ZdVunaa3k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxOCBTYWx0ZWRfX+WUyRk+4Kjne
 0EdzLTIgDfcxRBnB30wA8HPh3JRlxRX/FAHCmSYTpkPxhgZAwEv8mPRhvFRHjyHTXAb7Bpr3hQ0
 jUxHH8aHVApntTxLITB98Hs/YJZ3Sk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxOCBTYWx0ZWRfX5fEJzFNW15yr
 pLQSPCPz/qxWaHbWNxCcTDCsfo9M9dLYhkgAUdqiu07cET5Bn0pAsY8D/OGK2yOfs7Is9ZdQMbQ
 WGfVrcJR40VlzA+n+o31m2VOvQLgUcsw5VhKOL0y06E8NzgD26n49OHyxG8InkhRvZvUW7SuD3Z
 HiEHO4PlxgS7Egef7hBmdxFVkLHQQcc+2lx7GODQlP74geZeveBNcUEwcksmgeb9OshKCiuCnnD
 C5eSt4rGyg029altpW7qZhvQNnlLz5X2ET9EzMWROmRRdXqSmGK/tVbjzMZR26f3PrTL/g6n/jI
 w+vzqeu83YHI/XNeaN+RIKdF2JCA8vQyxOuyQMQTWHJ9fN3D4UukoYMixWeeUFlfAV+WheOdGKX
 mct4s5bd4dYvbhKR6cBbfWoTmm/3pHgyMtYeMc3UbuM4zRuHyV2IWl2AqpYyfsrlRm6ks493t4N
 yxI9L+3rLcl+L/Q+w1A==
X-Proofpoint-ORIG-GUID: UekKh77U18D1_mgqPP7FelDhuaXoCyLg
X-Authority-Analysis: v=2.4 cv=Ob4NnRTY c=1 sm=1 tr=0 ts=6ad84648 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=vggBfdFIAAAA:8 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=7ipKWUHlAAAA:8 a=voM4FWlXAAAA:8 a=rxpbpe3YEeMVxz9nh0AA:9 a=QEXdDO2ut3YA:10
 a=HkZW87K1Qel5hWWM3VKY:22 a=gpc5p9EgBqZVLdJeV_V1:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210018



On 03/10/26 13:29, Mike Rapoport wrote:
> Hi,
>
> On Mon, Sep 28, 2026 at 02:02:25PM +0530, Sourabh Jain wrote:
>> KHO requires the scratch alignment to be at least CMA_MIN_ALIGNMENT_BYTES,
>> and this is currently enforced with a static_assert().
>>
>> That assertion breaks the build on powerpc once CONFIG_KEXEC_HANDOVER is
>> enabled together with CONFIG_TRANSPARENT_HUGEPAGE or CONFIG_HUGETLB_PAGE:
>>
>>      kernel/liveupdate/kexec_handover.c:49:39: error: expression in static assertion is not constant
>>         49 | static_assert(SCRATCH_ALIGNMENT_BYTES >= CMA_MIN_ALIGNMENT_BYTES);
>>      ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
>>         80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>            |                                                        ^~~~
>>      kernel/liveupdate/kexec_handover.c:49:1: note: in expansion of macro 'static_assert'
>>         49 | static_assert(SCRATCH_ALIGNMENT_BYTES >= CMA_MIN_ALIGNMENT_BYTES);
>>
>> CMA_MIN_ALIGNMENT_BYTES depends on pageblock_order, which is not a
>> compile-time constant with certain configs, such as
>> CONFIG_HUGETLB_PAGE_SIZE_VARIABLE on powerpc. The next patch in this
>> series enables KHO on powerpc, so the alignment must be checked at
>> runtime instead.
>>
>> Replace the static_assert() with a runtime check at the start of
>> kho_reserve_scratch(), before any scratch memory is reserved. If the
>> scratch alignment is smaller than the CMA minimum alignment, warn once
>> and disable KHO rather than continue with a misaligned reservation.
> Can we keep static_assert() for everything !powerpc please?
> Like something along these lines:
>
> #ifndef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
> #define check_scratch_alignment static_assert(...)
> #else
> static inline bool check_scratch_alignment()
> {
> ...
> }
> #endif

Sure I will address this in the next version.

Thanks,
Sourabh Jain

>
>   
>> Cc: Aditya Gupta <adityag@linux.ibm.com>
>> Cc: Alexander Graf <graf@amazon.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan He <baoquan.he@linux.dev>
>> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
>> Cc: Pratyush Yadav <pratyush@kernel.org>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   kernel/liveupdate/kexec_handover.c | 23 +++++++++++++++--------
>>   1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
>> index 7c4d86daf86d..dc76dd6b74da 100644
>> --- a/kernel/liveupdate/kexec_handover.c
>> +++ b/kernel/liveupdate/kexec_handover.c
>> @@ -39,15 +39,7 @@
>>   #include "../kexec_internal.h"
>>   #include "kexec_handover_internal.h"
>>   
>> -/*
>> - * This is the minimal alignment required by deferred struct page init.
>> - * deferred_init_memmap_chunk frees memory to the buddy allocator, which looks
>> - * at the neighboring pages (up to MAX_PAGE_ORDER) to merge them.
>> - * If KHO scratch is not aligned to that value, buddy can access uninitialized
>> - * struct pages, which can cause a crash.
>> - */
>>   #define SCRATCH_ALIGNMENT_BYTES (PAGE_SIZE * MAX_ORDER_NR_PAGES)
>> -static_assert(SCRATCH_ALIGNMENT_BYTES >= CMA_MIN_ALIGNMENT_BYTES);
>>   
>>   /* The magic token for preserved pages */
>>   #define KHO_PAGE_MAGIC 0x4b484f50U /* ASCII for 'KHOP' */
>> @@ -836,6 +828,21 @@ static void __init kho_reserve_scratch(void)
>>   	if (!kho_enable)
>>   		return;
>>   
>> +	/*
>> +	 * This is the minimal alignment required by deferred struct page init.
>> +	 * deferred_init_memmap_chunk frees memory to the buddy allocator, which looks
>> +	 * at the neighboring pages (up to MAX_PAGE_ORDER) to merge them.
>> +	 * If KHO scratch is not aligned to that value, buddy can access uninitialized
>> +	 * struct pages, which can cause a crash.
>> +	 */
>> +	if (WARN_ON_ONCE(SCRATCH_ALIGNMENT_BYTES < CMA_MIN_ALIGNMENT_BYTES)) {
>> +		pr_err("scratch alignment %lu < CMA minimum %lu, disabling\n",
>> +		       (unsigned long)SCRATCH_ALIGNMENT_BYTES,
>> +		       (unsigned long)CMA_MIN_ALIGNMENT_BYTES);
>> +		kho_enable = false;
>> +		return;
>> +	}
>> +
>>   	scratch_size_update();
>>   
>>   	/* FIXME: deal with node hot-plug/remove */
>> -- 
>> 2.55.0
>>


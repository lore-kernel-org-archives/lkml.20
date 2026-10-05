Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1A442AF85
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191589; cv=none; b=neoVIY198evIfAR5o/0pE+C5qwBWwA9RDPqpy2Y/FQ9keVMl6LNlE4G5kCAcBMNGMTw5N6jtUQGZB71IjEulcitKiVoz1dR21ktfUgOCc2KmXI4kGGr1oci9S3QB8Xx+Wtw0LN/uoiCxGwm99LWDwYeqNpnVBR/WlrHjDL6xC0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191589; c=relaxed/simple;
	bh=wyoJLEkd4h1KP1Q/f8tgpBLmDAIiWbKw9Wj5O/wqTDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLCIsN2RsBMz8nQJt5lstyPsf/CElotvywsL1V/mHdnkumas6WFdV9dgLd34k1t4fCaPFOTRu4T+7ShNyiBksxtgUCo8LBA6DWsyVAJR1OkYz2pFOPxHd56TDPOCu3ljFRmPLrW0acPikSKIf451QwsnhDdh5MG+QRP1LPlBsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=W0wQqDOj; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="W0wQqDOj"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69516hra3276412;
	Mon, 5 Oct 2026 09:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=utxReP
	00qD5cgqEWxGBm18zTCm8VojZQaF5MSHHROUQ=; b=W0wQqDOj8WMJEBHN54EWFs
	t3F8mchffU7RUPGCIbna4Z96bGUmMd2isOsNZygVc9b180jH/o9Md0xpoYvmpcFB
	1RdDXF9N2aYuXizkcFTfUUVIieXhlUOaSOji38lQGErVx2Mngflld8fTArcrB93H
	DIY9LH163jOyC8sWmQdKXos4+S3V3Kn1RmN5+cBWM8ZjI4ouf4b4+/Nj/kREgl1y
	87vmDe+B5zTe2Qtb2+J2syIIVB0dliCjeQNEygPqp8gZFDw60hko/fhUe4+g2rTC
	uUWOYAjB7dU+nvRGOR2dCzUP6lKKXLk6eSRtn66+UZseNFhL8JlY8lZ9DZVZcvMA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h2se59axa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 09:12:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6956S4rk2175575;
	Mon, 5 Oct 2026 09:12:45 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h3eqy4h42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 09:12:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6959Cf9A48169384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Oct 2026 09:12:42 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77A8D20040;
	Mon,  5 Oct 2026 09:12:41 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01B5A2004B;
	Mon,  5 Oct 2026 09:12:38 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Oct 2026 09:12:37 +0000 (GMT)
Message-ID: <a5a1879f-32e4-4e7f-a209-6ec4826c937f@linux.ibm.com>
Date: Mon, 5 Oct 2026 14:42:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXz7edKAP3e9+i
 mvX6hewUt/vlLwnts11l0A7mpkv49bpI/PS9nb+fKU0L212iUw8itQ1kJ31RnbP+gBmWsi1pMB8
 DZbmxCa7bFZR4Rjb9Fo2hoTwe+GHRTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX75QgcX01hVAd
 wVwzG1dOTHEM6laQ+uHZmKye3IdTcVapEBSZpALEkR3cFN+tDMEb7QcL3OyMN9ZT2bHz9wJ+M4C
 VgCV+o5XB2jC9P6t4X4y6zYQw8uRn/KFq+/aZd/ti07qiIdGF+OQVh6d8LdiAmL8S+OMBtrm009
 BUc63hiNu+yV4yEdY6nFPafop6n2NbWI9atVansrlCebcWG7OUT5JDNJSHz/hdzjLtvBZJ53f3h
 FzPrsoocMfuArkmiDvMw3sZsbugA3aVkfYdIoFaV9okS3LRzXmRGWsbR+EwsNj+0wyJbL0zHiKW
 h1uLbsfET0zEIEwJsmvrN7XkxXeiPSWo5pFjq5MfV5+8nxmUwgmPCR82p+64HLzUXMokbRRoXsX
 n0kmGGmSY2C2vSbQ8bJv7Yret8x36WPvMcWFT6oFd+31X1A4EC2FCuiuJO63MYnGnplwOm82YFw
 o4RU4+s9DsOl2RnCflQ==
X-Proofpoint-GUID: goHjBEAZB996cFteavISIUM1oEYle7Ki
X-Authority-Analysis: v=2.4 cv=UNRIjyfy c=1 sm=1 tr=0 ts=6ac36a0f cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=vggBfdFIAAAA:8 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=7ipKWUHlAAAA:8 a=voM4FWlXAAAA:8 a=rxpbpe3YEeMVxz9nh0AA:9 a=QEXdDO2ut3YA:10
 a=HkZW87K1Qel5hWWM3VKY:22 a=gpc5p9EgBqZVLdJeV_V1:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: LC6TT4KO37m9DrhgAtOZuI7GeiqV65P-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050036



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

Yeah, that's a good idea. We can have a dynamic check for cases
where a static check is not possible.

Thanks for the suggestion.

- Sourabh Jain


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


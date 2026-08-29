Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B4224AF1
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 04:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787979516; cv=none; b=YI2uNGoPoT7dYbJehhwyr1vVIfBUmJydWCtmg+BDKpVwC23kmDp5AMpPnQ1mwiuETrAx7jK1v5yTdXSKRXEURKyh9f5yjZizhH83vhUNGtgg8Dn81iViZ/8tJQXMTWr8N2dF/ce4Xek3LiU3sKyBQ3nRQlGvLW8YpNvrHY+llvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787979516; c=relaxed/simple;
	bh=nJatNh1tzJhEScXoBifGehLQ/5BC234MiN09J0Wk16o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxQ6YUPK/cZeHC3/DvrvqIgzqXxL9jQL30xrV4foV6c7QkZ4Ra7iGcUFjUaQ+DKRm6/3o8JG0pjkQo41KU22gVC7oBL/ZEt1u+CbPxXAIzuSPbVl9qHsJIPaed9ZSwGi+6IMj4lxuAQXZuyrgxikujbajObQVChLgErATPobHQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Zj5rn3Cj; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Zj5rn3Cj"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T4eZVp2999898;
	Sat, 29 Aug 2026 04:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MvU1Yg
	ZR++bACy1sJMFzvjbRDgfeehycZdKhfrovGi4=; b=Zj5rn3Cjs02ununzct8Z2a
	GbyZyUgT7tPqEI1srPF5w4Vft8X50TI3aN9rUhwInphRH1ebh3N5sX/NtvvXXGU4
	kykve1Fa1OdKfn4SagLzHb3CLvbohgmvssIljgu/qyWR3Y6oMbnjwGxqlQgrRO23
	F5UQqbXPO9PmmFoB/+w2pN5pjSBzX8oLje2RNMbNS0p/QIF1qSBb+CODux1LweMo
	N/rY0sLgiSla69RWgwVSdQUFpMKiSTAS9JcBPpsRlWmV6AHgG1WriHAFR1G+PcWn
	Y3r/KUoOVohEtAEye91DT8zpyD8zlyyTvbMh6bfe5sA5rf4KqJNUpYAXl/TBzUuQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbnud8g69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Aug 2026 04:58:21 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67T4uKsi027085;
	Sat, 29 Aug 2026 04:58:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4g7p3qt9nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Aug 2026 04:58:20 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67T4wIRd42598784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Aug 2026 04:58:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 455D920043;
	Sat, 29 Aug 2026 04:58:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F69C20040;
	Sat, 29 Aug 2026 04:58:13 +0000 (GMT)
Received: from [9.67.168.106] (unknown [9.67.168.106])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 29 Aug 2026 04:58:12 +0000 (GMT)
Message-ID: <f1c3c554-8500-45ef-953d-b7bcece988c7@linux.ibm.com>
Date: Sat, 29 Aug 2026 10:28:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec_file: remove unused arch_kexec_locate_mem_hole hook
To: Mukesh Pilaniya <mpilaniy@redhat.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He
 <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260827144452.508328-1-sourabhjain@linux.ibm.com>
 <d16164ef-7211-4272-bc74-bc38efd8623e@redhat.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <d16164ef-7211-4272-bc74-bc38efd8623e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QFEz6_1xCeh_s7XdPVEckiU29dNxYHT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDAzNiBTYWx0ZWRfX2BX64Y0kbRAQ
 yc4BSUY5FEDucDc/PeW2rD8DJYpfjGFnD9GKQXtS/TI2Jdd3miY6W4iSmHZq8CGFR2bijfbcLoK
 EmVLyVCSTWshiJaVBIEsgCGgphuiOGlnZiDWSu7bO8sUs6Z4yTxvzUVOlvZ37R6Pa8PcHthar/D
 Zzwx/D97IfYtYt/uL9jOJGfbfDO+S/yr7EeeOLH1ZZ7jEdNvnmyjWVsaL+52Yiu88j3MnSGQGjJ
 0vWd6Cn/WbHJfcgOnwk8S2Q1xxixWF57aUYk1hOoJI8HUp/09XgFyWW85ANYojvGxkSZrRRPQT+
 Xq23mkOB86FfTLtOejS8pB3Vhbjv+Muuu8EP06/0kJksmcAR323qDWnVMV6+GmzLme+AKVNbQex
 Rh+3CcnZRGsIh1babi8dJLFXC4H7Dx9SF2uSvnTsdkiIGntsPq+Zj8IMMXwxgdTyOjy6PWT1MrM
 tWeY19Kd223stIRnN8Q==
X-Proofpoint-ORIG-GUID: QFEz6_1xCeh_s7XdPVEckiU29dNxYHT7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDAzNiBTYWx0ZWRfXxQd/LPuLAi1s
 gY/kvfTHIyKx6iKe6VDrVjCSOgeiiCJePziKcWU0pLAeh38sLfjmXdIJL4DzSo6jc/V/ykxYLFL
 KUiItu7b3WEx964RM5BBbZkG8lPoN6g=
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a9266ed cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=20KFwNOVAAAA:8
 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=_O3DOGVWAAAA:8 a=7ipKWUHlAAAA:8
 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=QOtqApWeW9QkeAJZ1uEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=2TKV-7w1aU1AVAwN0oqT:22
 a=gpc5p9EgBqZVLdJeV_V1:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290036

Hello Mukesh,

On 28/08/26 18:50, Mukesh Pilaniya wrote:
> Hi Sourabh,
>
> The patch touches three files across three subsystems so kexec: would be
> a more accurate prefix than kexec_file, for e.g.:
>
> kexec: remove unused arch_kexec_locate_mem_hole hook

As I understand it, the kexec: prefix is generally used when the changes 
apply to both
the kexec_load and kexec_file_load syscalls.

Since these changes are specific to kexec_file_load, I used the 
kexec_file: prefix for the patch title.

That said, I’m happy to follow the convention if you and others feel the 
patch should use the
kexec: prefix. Otherwise, I would prefer to keep the kexec_file: prefix.


>
> On 27/08/26 8:14 pm, Sourabh Jain wrote:
>> No architecture provides an implementation of
>> arch_kexec_locate_mem_hole(). Use kexec_locate_mem_hole() directly
>> and remove the unused fallback wrapper from the kexec header.
>>
>> This simplifies the kexec memory allocation path without changing
>> its behavior.
>>
> Also, it might be worth mentioning in the commit message that this hook
> was originally introduced by commit f891f19736bd and that the last arch
> override was removed in commit 6e5250eaa665; making it safe to remove now.

Sure, I don’t mind including this in v2.


>
> Otherwise, the change looks good to me. Feel free to add:
> Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

Thanks for the review.

- Sourabh Jain

>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan He <baoquan.he@linux.dev>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
>> Cc: Paul Walmsley <pjw@kernel.org>
>> Cc: Pratyush Yadav <pratyush@kernel.org>
>> Cc: linux-riscv@lists.infradead.org
>> Cc: kexec@lists.infradead.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/riscv/kernel/kexec_elf.c |  2 +-
>>   include/linux/kexec.h         | 15 ---------------
>>   kernel/kexec_file.c           |  2 +-
>>   3 files changed, 2 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
>> index 3e9a32acb8f2..ca5abbad59e5 100644
>> --- a/arch/riscv/kernel/kexec_elf.c
>> +++ b/arch/riscv/kernel/kexec_elf.c
>> @@ -91,7 +91,7 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
>>   	kbuf.memsz = ALIGN(kernel_len, PAGE_SIZE);
>>   	kbuf.cma = NULL;
>>   	kbuf.top_down = false;
>> -	ret = arch_kexec_locate_mem_hole(&kbuf);
>> +	ret = kexec_locate_mem_hole(&kbuf);
>>   	if (!ret) {
>>   		*old_pbase = lowest_paddr;
>>   		*new_pbase = kbuf.mem;
>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>> index 0af8ae4fdd08..e5f1cfc11fef 100644
>> --- a/include/linux/kexec.h
>> +++ b/include/linux/kexec.h
>> @@ -259,21 +259,6 @@ int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
>>   extern int kexec_add_buffer(struct kexec_buf *kbuf);
>>   int kexec_locate_mem_hole(struct kexec_buf *kbuf);
>>   
>> -#ifndef arch_kexec_locate_mem_hole
>> -/**
>> - * arch_kexec_locate_mem_hole - Find free memory to place the segments.
>> - * @kbuf:                       Parameters for the memory search.
>> - *
>> - * On success, kbuf->mem will have the start address of the memory region found.
>> - *
>> - * Return: 0 on success, negative errno on error.
>> - */
>> -static inline int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
>> -{
>> -	return kexec_locate_mem_hole(kbuf);
>> -}
>> -#endif
>> -
>>   #ifndef arch_kexec_apply_relocations_add
>>   /*
>>    * arch_kexec_apply_relocations_add - apply relocations of type RELA
>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>> index 59fb9d71e9d8..9a981359addd 100644
>> --- a/kernel/kexec_file.c
>> +++ b/kernel/kexec_file.c
>> @@ -784,7 +784,7 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>>   	kbuf->cma = NULL;
>>   
>>   	/* Walk the RAM ranges and allocate a suitable range for the buffer */
>> -	ret = arch_kexec_locate_mem_hole(kbuf);
>> +	ret = kexec_locate_mem_hole(kbuf);
>>   	if (ret)
>>   		return ret;
>>   


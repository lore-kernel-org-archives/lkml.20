Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12D9492505
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442306; cv=none; b=kFPz+KSYBkQ5Y6q+2rBsBxXrqk7UU5FCKryn6ETp9EcyddJn6vZMJiRL6Y+QvjpCsl1XMawuRiROArTT5HIA3NLed58qrS2/F5T0QFyYPIPm5jabYmCWmJke2vYTRV2TmCwMbor5a8bXCK+nCJcsW1Fa1uyCO9tUxPAwJgSFKog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442306; c=relaxed/simple;
	bh=6jh9fiVDr4URvVJ8Mrz2nPNcwLCkZM+aM3RtNO+gXmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F/zANsBtAzDqqGkLOsR0eZCkE/hKhiHi6Ni5QrpypDxKA2yGfCZ/64ybAci4NxpJ7qE6xwrzZI23idGPH+EoHu1Ce5LLHFvvO2H3uiVhgECfdk5BAKfebJV/+lkT9v4LaTswPo6rzqJtcbzZbdtRHU+phS+QAFUcH+8tU9RnaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d4+eoeV/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LTcLa57C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d4+eoeV/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LTcLa57C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788442288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+0Di3qj5r5ZLKVg7VMQtnJsK/2I+OQNTE5J5ZZ279A=;
	b=d4+eoeV/PiQKqd2MSitu0zGCxmlsp3/ezzMK39/Q1NLHBDTVHcBJ3+GqZptReox/hpySQ4
	xcPBw7unlTbwoe8Od2b8R/kdUIXzmuYaKiB2Mzx0K6NpLBYC4x7QcnWh0AdxPkgZG+P1lu
	GknO1CcD2lOLD/Q0h76EQ0FM5k9s8Nw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-udh4OYCxOzqDOyYP4Gc5Qg-1; Thu, 03 Sep 2026 09:31:22 -0400
X-MC-Unique: udh4OYCxOzqDOyYP4Gc5Qg-1
X-Mimecast-MFC-AGG-ID: udh4OYCxOzqDOyYP4Gc5Qg_1788442281
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so3534353a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788442281; x=1789047081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+0Di3qj5r5ZLKVg7VMQtnJsK/2I+OQNTE5J5ZZ279A=;
        b=LTcLa57CR40p4enES/Hd3joYWVdp0NnhNCwfmHMN/1kGotRO/aLjKrRts3/F0YkRjz
         vpwffXf1vEoyn3dAUVtrmPeJPTqNpRbu+2u/nSZE7LyiLeMrjN1wtwZHjh5NAakTNF2y
         BF+zXe8TbVPQuS/99Es5shgH75dhc7GmkRCiBLNviLRCoC7cuQ0JZVpx/vNVD/Kdtufw
         bxGLQ2hsgGPQDpGa3hVQyAqWliNPuv1JxRe6XZJrSfiH/cF3QPc8aV4F3zry55G1O/x3
         WncMZWWJmNS8ksnkqFZua1PoyM3nJhLyXw282AXozyJvWyCFtJfvEtjinAZ2nCzjg+7a
         BRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442281; x=1789047081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+0Di3qj5r5ZLKVg7VMQtnJsK/2I+OQNTE5J5ZZ279A=;
        b=V4ADwxCa8qM3GPTcoLZca5NyS8OhFz5F9KXgOP4yJbhLLfp7X9DTC+seX8d7i0NEhB
         qs7LI0db5XOT6cTVrxOpeMO+bwNadNdMdZsabfS+HA/w6LqoWxj1t/0Ufotv+Y7Ooxzx
         +G5USA1SksSsPg9bxON64pZfEHTCNLmSyazI4+nWOCM5uRCASbxmNhd+tjMWa+96lyBK
         mrKwlS3WNVfCflZotIpZJrxdSbgGXP+vL8KCueAiz9FG3aS5+JLCOw9mz7DWsgVxBxPL
         Vq/7V37XlICqHKcJaj2p1YybpPDYJJ75F5qBd70Up9QVb4VDrwp5AYxb8hilaDaJoO+u
         7mxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUAAl65FBPKFmqUsQKO2aBPLYqUbn0qtSNcbIUOAfqrizMxjBy8dll2gUxfFdPg639LHuQYeWrzsToTxI=@vger.kernel.org
X-Gm-Message-State: AFuF++mgaauwENDQLVm0xn1EJpDpGpJQbOSY2s0fyQV0G912wQXsJ7Iu
	fwx0Jg+SCNlVUcKyvLWQFL+2IBsQCyAT4ERmNRJ50uR6LAWpEXLe74dFkLZ40E6kDHx1QEpc4w9
	mZmhmG6s6f+xnjQ/dz3oj6mjiKZn9hLBo5dYYk2xmgy6/vnZTF6fNmQ+QXkBW5GkBbw==
X-Gm-Gg: AYBFou3cvlK0USzlU9tEXAP2tEChv5tguOiiHynJ6DZWgr74GwzNk9U6VlC8La7pWZi
	cWtVH9i1C2Zjvkm2TSnbMUV23prm7RToElTsgeX9Ue2djQfTNu7bb9r++qmd+8R8DxeO2Q17WeG
	B39TN7wASuGNb87vVxxvgYolWweOL1j9QuDkK6B7TgKPMcx5wYgXZaR0LSCGTfSlF4DrtBRGXOe
	epDgzEoTjtf7vzAeRi9XZ1MNZoez/t2WUY7DI9FCXTsORWUY+myYllzE1j9Y2Cp4oQNGh8+fSW5
	Fmuhp442aurCfeshoDktb8m95FDFEUOWVwE7Wea/h8q67lghkrtKkhEUOf0WNflEOuxUdWN8q5v
	6M5fyc9RLg9iXR136
X-Received: by 2002:a17:90b:5102:b0:398:9be6:f998 with SMTP id 98e67ed59e1d1-39aee16a180mr19981112a91.23.1788442281222;
        Thu, 03 Sep 2026 06:31:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5102:b0:398:9be6:f998 with SMTP id 98e67ed59e1d1-39aee16a180mr19980948a91.23.1788442280416;
        Thu, 03 Sep 2026 06:31:20 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm5659399a91.13.2026.09.03.06.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:31:19 -0700 (PDT)
Message-ID: <1b845292-1117-458d-ab58-67c3e643ddc8@redhat.com>
Date: Thu, 3 Sep 2026 19:01:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec_file: remove unused arch_kexec_locate_mem_hole hook
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He
 <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Paul Walmsley <pjw@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260827144452.508328-1-sourabhjain@linux.ibm.com>
 <d16164ef-7211-4272-bc74-bc38efd8623e@redhat.com>
 <f1c3c554-8500-45ef-953d-b7bcece988c7@linux.ibm.com>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <f1c3c554-8500-45ef-953d-b7bcece988c7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sourabh,

On 29/08/26 10:28 am, Sourabh Jain wrote:
> Hello Mukesh,
> 
> On 28/08/26 18:50, Mukesh Pilaniya wrote:
>> Hi Sourabh,
>>
>> The patch touches three files across three subsystems so kexec: would be
>> a more accurate prefix than kexec_file, for e.g.:
>>
>> kexec: remove unused arch_kexec_locate_mem_hole hook
> 
> As I understand it, the kexec: prefix is generally used when the changes
> apply to both
> the kexec_load and kexec_file_load syscalls.
> 
> Since these changes are specific to kexec_file_load, I used the
> kexec_file: prefix for the patch title.
> 
> That said, I’m happy to follow the convention if you and others feel the
> patch should use the
> kexec: prefix. Otherwise, I would prefer to keep the kexec_file: prefix.
>

You're right, I hadn't noticed that the hook is entirely within the
CONFIG_KEXEC_FILE block and both callers are in the kexec_file_load
path. kexec_file: is the correct prefix here. Thanks for the clarification.

> 
>>
>> On 27/08/26 8:14 pm, Sourabh Jain wrote:
>>> No architecture provides an implementation of
>>> arch_kexec_locate_mem_hole(). Use kexec_locate_mem_hole() directly
>>> and remove the unused fallback wrapper from the kexec header.
>>>
>>> This simplifies the kexec memory allocation path without changing
>>> its behavior.
>>>
>> Also, it might be worth mentioning in the commit message that this hook
>> was originally introduced by commit f891f19736bd and that the last arch
>> override was removed in commit 6e5250eaa665; making it safe to remove
>> now.
> 
> Sure, I don’t mind including this in v2.
> 
> 
>>
>> Otherwise, the change looks good to me. Feel free to add:
>> Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>
> 
> Thanks for the review.
> 
> - Sourabh Jain
> 
>>
>>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Baoquan He <baoquan.he@linux.dev>
>>> Cc: Mike Rapoport <rppt@kernel.org>
>>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>>> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
>>> Cc: Paul Walmsley <pjw@kernel.org>
>>> Cc: Pratyush Yadav <pratyush@kernel.org>
>>> Cc: linux-riscv@lists.infradead.org
>>> Cc: kexec@lists.infradead.org
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>>   arch/riscv/kernel/kexec_elf.c |  2 +-
>>>   include/linux/kexec.h         | 15 ---------------
>>>   kernel/kexec_file.c           |  2 +-
>>>   3 files changed, 2 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/
>>> kexec_elf.c
>>> index 3e9a32acb8f2..ca5abbad59e5 100644
>>> --- a/arch/riscv/kernel/kexec_elf.c
>>> +++ b/arch/riscv/kernel/kexec_elf.c
>>> @@ -91,7 +91,7 @@ static int elf_find_pbase(struct kimage *image,
>>> unsigned long kernel_len,
>>>       kbuf.memsz = ALIGN(kernel_len, PAGE_SIZE);
>>>       kbuf.cma = NULL;
>>>       kbuf.top_down = false;
>>> -    ret = arch_kexec_locate_mem_hole(&kbuf);
>>> +    ret = kexec_locate_mem_hole(&kbuf);
>>>       if (!ret) {
>>>           *old_pbase = lowest_paddr;
>>>           *new_pbase = kbuf.mem;
>>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>>> index 0af8ae4fdd08..e5f1cfc11fef 100644
>>> --- a/include/linux/kexec.h
>>> +++ b/include/linux/kexec.h
>>> @@ -259,21 +259,6 @@ int kexec_kernel_verify_pe_sig(const char
>>> *kernel, unsigned long kernel_len);
>>>   extern int kexec_add_buffer(struct kexec_buf *kbuf);
>>>   int kexec_locate_mem_hole(struct kexec_buf *kbuf);
>>>   -#ifndef arch_kexec_locate_mem_hole
>>> -/**
>>> - * arch_kexec_locate_mem_hole - Find free memory to place the segments.
>>> - * @kbuf:                       Parameters for the memory search.
>>> - *
>>> - * On success, kbuf->mem will have the start address of the memory
>>> region found.
>>> - *
>>> - * Return: 0 on success, negative errno on error.
>>> - */
>>> -static inline int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
>>> -{
>>> -    return kexec_locate_mem_hole(kbuf);
>>> -}
>>> -#endif
>>> -
>>>   #ifndef arch_kexec_apply_relocations_add
>>>   /*
>>>    * arch_kexec_apply_relocations_add - apply relocations of type RELA
>>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>>> index 59fb9d71e9d8..9a981359addd 100644
>>> --- a/kernel/kexec_file.c
>>> +++ b/kernel/kexec_file.c
>>> @@ -784,7 +784,7 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>>>       kbuf->cma = NULL;
>>>         /* Walk the RAM ranges and allocate a suitable range for the
>>> buffer */
>>> -    ret = arch_kexec_locate_mem_hole(kbuf);
>>> +    ret = kexec_locate_mem_hole(kbuf);
>>>       if (ret)
>>>           return ret;
>>>   
> 

-- 
Regards,
Mukesh Pilaniya


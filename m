Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985B36A36B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232831; cv=none; b=W+01x/4NUJtTOnZ50VWx5rRdt3uTNWztdNJbEeTJ17FmNJ0NXQaM004i7xh66xSD/wmrx4JOmftRYQV4prlyehMJf1+ECShAxiIQoBsyNPRMU9Yfi8xi2iIJgNYoNUGEEWoG6oe4ik3UKG7nw/U4CcmotEekV5+w6aPZfKouvaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232831; c=relaxed/simple;
	bh=Wt2hr4OJOLZrss8OJtSespvg+uRq36sUzT4MXTbkgk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irP2py1Ly3O+mVShF8uZGAUkkC44XNvFydlTVjGBcZHKeY/RdhTd/3Hc4nf3R7wOKD9CnOD+gOQJtFVJ1GxeGxUiQu5H0qcrexcA39Y0wAhHoc+oaEWDOKxf9kvILW/YKNv/pORP/2eO+T3O5SnnAdF0xprvupBiU7QZFPrhnC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e98kb577; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e98kb577"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791232828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hW5P4NCcHfyGHbJZF1DNl1NQBu8IkdsCT0CTDVEsdgw=;
	b=e98kb577/X8znMvAz7rQY8nBwlLymDnAkTlC9Qb3X+IKIuFB6H+at59XjEbGsqGszvGAak
	mh0yF2pqChV5eFBzQvGMuxq/uAt7lbTI7eNBL8Jd/GB8uXqRw7VUAUKVmFFCQSDfE2jREv
	xHQ4sGrzZcQIFIZ0CO3qYIkl53YFbhc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-cdUQsBFcMT6_MtyZtLIz4w-1; Mon, 05 Oct 2026 16:40:23 -0400
X-MC-Unique: cdUQsBFcMT6_MtyZtLIz4w-1
X-Mimecast-MFC-AGG-ID: cdUQsBFcMT6_MtyZtLIz4w_1791232822
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3a782da8ce7so13588721fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232822; x=1791837622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hW5P4NCcHfyGHbJZF1DNl1NQBu8IkdsCT0CTDVEsdgw=;
        b=y4mY9LsA25aqLPQyy5VEgNtlLk+IiZNeCoOvObR/WC4i1MC7xKbQZwlRxWC0jn8rX1
         72oglqbNyWnrCmuO8lcBtEJz+FUtm257mBpmmb8vyPFoOpg9NpcP3R8hXkWLgZI4DKME
         YXWBty3vK5xu6AQFyc7VHT2RXdEUkLc/Rl6DFIM21z5BAbKiDWBmMDvhd/j0Nc150Pea
         3lhAq2fuDWdifeeGQ28LYP5KhD3mMjPVBBt9QprzD5OiHnNAJzprQPzyWTFc5cfrFpTi
         nOWri4W2nWI7ygii6JK84UZSwH0IYiedshcASQ3+LguAsGp/XO1skl4x+BG4Wp0V6/eB
         8amg==
X-Forwarded-Encrypted: i=1; AKwUvBxCYoLM609A/pC/m49w1IcZeZzlA+qwJGE9kuoINqVMAoHwjxs+q9PK9ex3AyeuxWy+lNU81MCHsgIYbLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyjDiUDhJiB9SxfY5w+ZHCdcLxAUyn0ZhIS3pvZRhjqaHsV+9W
	xrb4wxiiMytNyNiUHA7VW9xqu50JlsbFx9xjZTfStLUj3nH7M9q7Y2NZSS1HT4D19zSDQtPp32u
	El+LDuJwqzYc2FODh8g+S8DFxxh5Y3IvRVgUCpf3GMCCfwKMqorpGZqo3MD/82OHKMrgfNY9jKX
	AdYu8=
X-Gm-Gg: AYBFou3knrFTwqnKL0fjLcGnj6GAr1gazNt85R4BqQJA1uuXlnFyId14N/LcfbRYyYT
	vDmnLbSSXThicVUSsQ0xYdN3RICuDYONOM0xVHjx5TUQGxuYQp2msCmoq47y2Xiq3G6hKkWqfb7
	phbF4yU+G+fEGDdgN0+bo/cujvqdvGyjJof6TVQYmLAiG0AXfyTlMyK9DfreHt7J8fdfEHoDbi4
	MEZhw5y1oERFx5EWWmdpI1/QiCI1/UFBcy6sRa31uCkwPn1+5aPCcm5Han/RmVPVIZUqnwTBhlR
	eSNXCaAyyJAv1NPmplSCO6smH8qRwG2JyQg8HTW6gXNXOzu6gaxPKl5WHke/KSXoAeUeaFYEDFt
	fJhU=
X-Received: by 2002:a05:651c:1602:b0:3a5:b1f7:a7bf with SMTP id 38308e7fff4ca-3a974f64065mr22350651fa.21.1791232822114;
        Mon, 05 Oct 2026 13:40:22 -0700 (PDT)
X-Received: by 2002:a05:651c:1602:b0:3a5:b1f7:a7bf with SMTP id 38308e7fff4ca-3a974f64065mr22350491fa.21.1791232821598;
        Mon, 05 Oct 2026 13:40:21 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e28b131sm45437081fa.1.2026.10.05.13.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 13:40:21 -0700 (PDT)
Message-ID: <9adb6aaf-6e50-4ab0-a021-2529807dff02@redhat.com>
Date: Mon, 5 Oct 2026 16:40:14 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] powerpc: move has_transparent_hugepage() out of
 THP guard
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 lance.yang@linux.dev,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <05a71b6011a6eab7b096f262485fcb8b4987976f.1789695931.git.luizcap@redhat.com>
 <f54d5d75-5cc1-488b-b640-76163419cf4d@kernel.org>
 <25bb02df-a795-4e48-9de6-99f1ca799176@redhat.com>
 <802564f8-1376-451e-8308-6f98d1efb099@kernel.org>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <802564f8-1376-451e-8308-6f98d1efb099@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/5/26 12:52 AM, Christophe Leroy (CS GROUP) wrote:
> Hi,
> 
> Don't forget <linuxppc-dev@lists.ozlabs.org> when you address powerpc architecture.

Will do.

> 
> Le 03/10/2026 à 17:44, Luiz Capitulino a écrit :
>>
>>
>> On 10/2/26 3:28 PM, David Hildenbrand (Arm) wrote:
>>> On 9/18/26 03:45, Luiz Capitulino wrote:
>>>> A future commit will introduce a kernel API to allow for checking if the
>>>> CPU supports PMD-sized pages. This API will be based on the
>>>> has_transparent_hugepage() implementation but will be orthogonal to THP
>>>> and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.
>>>>
>>>> Move its definition out of the THP guard.
>>>>
>>>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>>>> ---
>>>>   arch/powerpc/include/asm/book3s/64/hash-4k.h  |  2 +-
>>>>   arch/powerpc/include/asm/book3s/64/hash-64k.h |  2 +-
>>>>   arch/powerpc/include/asm/book3s/64/pgtable.h  | 18 +++++++++---------
>>>>   arch/powerpc/include/asm/book3s/64/radix.h    | 14 +++++++-------
>>>>   arch/powerpc/mm/book3s64/hash_pgtable.c       |  4 ++--
>>>>   5 files changed, 20 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/ powerpc/include/asm/book3s/64/hash-4k.h
>>>> index 8e5bd9902bed..79511e6abfca 100644
>>>> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
>>>> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
>>>> @@ -165,9 +165,9 @@ extern void hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
>>>>   extern pgtable_t hash__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
>>>>   extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
>>>>                          unsigned long addr, pmd_t *pmdp);
>>>> -extern int hash__has_transparent_hugepage(void);
>>>>   #endif
>>>> +extern int hash__has_transparent_hugepage(void);
>>>>   #endif /* !__ASSEMBLER__ */
>>>>   #endif /* _ASM_POWERPC_BOOK3S_64_HASH_4K_H */
>>>> diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/ powerpc/include/asm/book3s/64/hash-64k.h
>>>> index 7deb3a66890b..a4a44a112ff9 100644
>>>> --- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
>>>> +++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
>>>> @@ -278,9 +278,9 @@ extern void hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
>>>>   extern pgtable_t hash__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
>>>>   extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
>>>>                          unsigned long addr, pmd_t *pmdp);
>>>> -extern int hash__has_transparent_hugepage(void);
>>>
>>> Without some of these helpers in place, I assume actually using PMD leafs
>>> without THP would require some more work. (which is not the goal of this series,
>>> just asking).
>>
>> Yes, you're right.
>>
>>> I do wonder whether the architecture should instead simply say "not supported"
>>> if !CONFIG_TRANSPARENT_HUGEPAGE?
>>>
>>> That should still enable your series: using mTHP without PMD support.
>>
>> Yes, it would. However, I think this introduces an inconsistency.
> 
> powerpc has two types of MMU (HASH and RADIX) with different page layout. MMU type is selected at boottime based on the capabilities of the CPU. For transparent page you have:
> 
> static inline int has_transparent_hugepage(void)
> {
>      if (radix_enabled())
>          return radix__has_transparent_hugepage();
>      return hash__has_transparent_hugepage();
> }

Right and, unless I'm misunderstanding your comment, this supports my
position that the new arch_has_pmd_leaves() API is all about reporting a
hardware capability and not tied to THP support.

> 
>>
>> In in its current form, arch_has_pmd_leaves() should always report a hardware
>> capability. This is true even for the default case where
>> arch_has_pmd_leaves() defaults to
>> IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE) in the assumption that
>> archs supporting PMD-sized pages by default will have this config
>> enabled.
>>
>> Your suggestion will change this and for some archs
>> arch_has_pmd_leaves() may have different behavior depending on the user
>> configuration. Additionally, I intended to decouple the base API
>> implementation from THP.
>>
>> If you feel strongly about this I can implement your suggestion, but I'd
>> still vote for keeping the API about consistently reporting the hardware
>> capability. Even if the only user is THP code today, new use cases can
>> be added incrementally.
>>
>>>
>>> [...]
>>>
>>>> -static inline int radix__has_transparent_hugepage(void)
>>>> +static inline int radix__has_transparent_pud_hugepage(void)
>>>>   {
>>>> -    /* For radix 2M at PMD level means thp */
>>>> -    if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
>>>> +    /* For radix 1G at PUD level means pud hugepage support */
>>>> +    if (mmu_psize_defs[MMU_PAGE_1G].shift == PUD_SHIFT)
>>>>           return 1;
>>>>       return 0;
>>>>   }
>>>> +#endif
>>>> -static inline int radix__has_transparent_pud_hugepage(void)
>>>> +static inline int radix__has_transparent_hugepage(void)
>>>>   {
>>>> -    /* For radix 1G at PUD level means pud hugepage support */
>>>> -    if (mmu_psize_defs[MMU_PAGE_1G].shift == PUD_SHIFT)
>>>> +    /* For radix 2M at PMD level means thp */
>>>> +    if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
>>>>           return 1;
>>>>       return 0;
>>>>   }
>>>
>>> You are swapping both implementations, which might create some unnecessary churn
>>> I think.
>>
>> I suspect this was done by git diff as I just moved the functions, but
>> I'll take a better look.
>>
> 


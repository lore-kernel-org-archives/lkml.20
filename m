Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799D1DFFB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791175959; cv=none; b=sJOun9r2PEUYEtCMSbaTCFcu99plGJ8ga+AToqQFK0kYo4bFv4xdQvl1zzfWNeiIf/dJuLknHa7W7n+HsA7SUyN+0B+x++b7YZDmmRpTzG80VW/YslnK/Zi7W8sKf9Eo+JNTLcjcwzkb+qjiL+gg6VTsp8V3ergBdzgo6VWR+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791175959; c=relaxed/simple;
	bh=eHMXmqxJV67IGKdUCch7Elyp//XEJscbQYkR6yHhLM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMG8nJDaWHCduk5V85aWob1Cu6VA1dpujiu8orxc7ouB3h9pnXhrf8CCXbvLocmvASWri0ZN5KTYaWL8gHF6qmjIJ9rLufEjbfBno7slE8DCvwBH4Uq1c/59YTDoz8WMY5gAS5eqWe75jcFn6Og2ODV7WM/WgvaIri7sxJyapCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhZ6DkPv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhZ6DkPv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5D41F000FF;
	Mon,  5 Oct 2026 04:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791175957;
	bh=tgeHzxHQ5p6pOK3o0bpbw4gdkXFbQVK+Bxib4DUA518=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LhZ6DkPvu/CoOBPRzNG1DhOEHHqlaVdsmXRzBnLlEWnqCFfpAYuceGVUNQJZHlMuw
	 gkb/KIz5DgdHFfKYiBPx8QuVQNXYD8LSlJ5OK6ropaAG1n2cCrJgVtuXxTj9UGkDGY
	 d00j8TypicLptK30ZVNnCZ2jX5SXvK3pcVZ51LPYkHFhFP0Ze+emPMgtSYd7G16iJt
	 RnGJh0g0MDV/SMpvPWhceAou17U6VDzcQ0cW8VS/qk0g8elN6DSO5TICcWZ0EHI5OE
	 BE7c+JgxsEYYhR+ukWXBWPn4i3yuYyrKmgx7HBJFbmzU2HQ1BvceG9BrIQ3Gg5akks
	 ac6+o05tU/D+w==
Message-ID: <802564f8-1376-451e-8308-6f98d1efb099@kernel.org>
Date: Mon, 5 Oct 2026 06:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] powerpc: move has_transparent_hugepage() out of
 THP guard
To: Luiz Capitulino <luizcap@redhat.com>,
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
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <25bb02df-a795-4e48-9de6-99f1ca799176@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Don't forget <linuxppc-dev@lists.ozlabs.org> when you address powerpc 
architecture.

Le 03/10/2026 à 17:44, Luiz Capitulino a écrit :
> 
> 
> On 10/2/26 3:28 PM, David Hildenbrand (Arm) wrote:
>> On 9/18/26 03:45, Luiz Capitulino wrote:
>>> A future commit will introduce a kernel API to allow for checking if the
>>> CPU supports PMD-sized pages. This API will be based on the
>>> has_transparent_hugepage() implementation but will be orthogonal to THP
>>> and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.
>>>
>>> Move its definition out of the THP guard.
>>>
>>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>>> ---
>>>   arch/powerpc/include/asm/book3s/64/hash-4k.h  |  2 +-
>>>   arch/powerpc/include/asm/book3s/64/hash-64k.h |  2 +-
>>>   arch/powerpc/include/asm/book3s/64/pgtable.h  | 18 +++++++++---------
>>>   arch/powerpc/include/asm/book3s/64/radix.h    | 14 +++++++-------
>>>   arch/powerpc/mm/book3s64/hash_pgtable.c       |  4 ++--
>>>   5 files changed, 20 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/ 
>>> powerpc/include/asm/book3s/64/hash-4k.h
>>> index 8e5bd9902bed..79511e6abfca 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
>>> @@ -165,9 +165,9 @@ extern void 
>>> hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
>>>   extern pgtable_t hash__pgtable_trans_huge_withdraw(struct mm_struct 
>>> *mm, pmd_t *pmdp);
>>>   extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
>>>                          unsigned long addr, pmd_t *pmdp);
>>> -extern int hash__has_transparent_hugepage(void);
>>>   #endif
>>> +extern int hash__has_transparent_hugepage(void);
>>>   #endif /* !__ASSEMBLER__ */
>>>   #endif /* _ASM_POWERPC_BOOK3S_64_HASH_4K_H */
>>> diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/ 
>>> powerpc/include/asm/book3s/64/hash-64k.h
>>> index 7deb3a66890b..a4a44a112ff9 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
>>> @@ -278,9 +278,9 @@ extern void 
>>> hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
>>>   extern pgtable_t hash__pgtable_trans_huge_withdraw(struct mm_struct 
>>> *mm, pmd_t *pmdp);
>>>   extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
>>>                          unsigned long addr, pmd_t *pmdp);
>>> -extern int hash__has_transparent_hugepage(void);
>>
>> Without some of these helpers in place, I assume actually using PMD leafs
>> without THP would require some more work. (which is not the goal of 
>> this series,
>> just asking).
> 
> Yes, you're right.
> 
>> I do wonder whether the architecture should instead simply say "not 
>> supported"
>> if !CONFIG_TRANSPARENT_HUGEPAGE?
>>
>> That should still enable your series: using mTHP without PMD support.
> 
> Yes, it would. However, I think this introduces an inconsistency.

powerpc has two types of MMU (HASH and RADIX) with different page 
layout. MMU type is selected at boottime based on the capabilities of 
the CPU. For transparent page you have:

static inline int has_transparent_hugepage(void)
{
	if (radix_enabled())
		return radix__has_transparent_hugepage();
	return hash__has_transparent_hugepage();
}

> 
> In in its current form, arch_has_pmd_leaves() should always report a 
> hardware
> capability. This is true even for the default case where
> arch_has_pmd_leaves() defaults to
> IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE) in the assumption that
> archs supporting PMD-sized pages by default will have this config
> enabled.
> 
> Your suggestion will change this and for some archs
> arch_has_pmd_leaves() may have different behavior depending on the user
> configuration. Additionally, I intended to decouple the base API
> implementation from THP.
> 
> If you feel strongly about this I can implement your suggestion, but I'd
> still vote for keeping the API about consistently reporting the hardware
> capability. Even if the only user is THP code today, new use cases can
> be added incrementally.
> 
>>
>> [...]
>>
>>> -static inline int radix__has_transparent_hugepage(void)
>>> +static inline int radix__has_transparent_pud_hugepage(void)
>>>   {
>>> -    /* For radix 2M at PMD level means thp */
>>> -    if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
>>> +    /* For radix 1G at PUD level means pud hugepage support */
>>> +    if (mmu_psize_defs[MMU_PAGE_1G].shift == PUD_SHIFT)
>>>           return 1;
>>>       return 0;
>>>   }
>>> +#endif
>>> -static inline int radix__has_transparent_pud_hugepage(void)
>>> +static inline int radix__has_transparent_hugepage(void)
>>>   {
>>> -    /* For radix 1G at PUD level means pud hugepage support */
>>> -    if (mmu_psize_defs[MMU_PAGE_1G].shift == PUD_SHIFT)
>>> +    /* For radix 2M at PMD level means thp */
>>> +    if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
>>>           return 1;
>>>       return 0;
>>>   }
>>
>> You are swapping both implementations, which might create some 
>> unnecessary churn
>> I think.
> 
> I suspect this was done by git diff as I just moved the functions, but
> I'll take a better look.
> 



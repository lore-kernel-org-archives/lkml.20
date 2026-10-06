Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000952DF3F2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262108; cv=none; b=O7C6rs7QGSbIqwx0skYjQEW8v0xhpIHX3DPF4Gg5iImpdH2KVda/0cjCxzSna8Qw3rjKuqmF8x+ZnfndNybbeMQpmTcMmzWXu967lv0SQ3xK8wqgDU1ggmus/6+hJoyZKC3Fs2tUrc9Qj0k0P2pOnrN23Glww0N3auDCR7og8tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262108; c=relaxed/simple;
	bh=91c4EcvSfzG2VlGe48Rs80Mw+ZN+aS6psCSIQbjYE5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baUvKoRinqEZKsMCQ/Y1lpsHpRcAM7xB0FmodzI6wi13zX66um9YJi+166BnZhsASvpMw1c89qnnTUbqiP3gBmQuWUdZWTgXZoTo1I8ItlGse/9ouG/I2dR5Yoe75Bgl5FlY0+o7ht06bbYKp7lHyluxKz2OC4aSTBOkzPp4V4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsEA5ZIq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsEA5ZIq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED441F000FF;
	Tue,  6 Oct 2026 04:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791262106;
	bh=tUGgZYKffjWTe3V1ODHloSUeuNia8mWQRgDKRJsPR88=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OsEA5ZIqc/mPpRuhVowK4aw5jZ8eghvG7y0Pp/YXBR799iq/5qLtwCKODGdbYAjzM
	 mMXUwyZf8+0AyuHCOc9vOWN9viyle94GLCVlRkWzUvi4zF21a9PSK3aJ30kTwgcLoL
	 ZZhZfsMaHYTn+Ck7xOGxLqIF4KxoC54rxa/LhhG/yTxa1XWlKlSf37XVww0D+W5SUA
	 D+VqK62OHKXSYn7pfH1ldc0KsdhaMoM+FG6g1vW1gUX1JDaH/VXzVKDeLpCG6xqUPz
	 TibpvnDRZdCfT7m93htEvTZBXn4mc1H9WcjWwqJozM8WDuSjmZi2c9RZzrGvx8TGAX
	 ggrfME3ZVs2Qw==
Message-ID: <3d358c88-e0a9-47c5-a7a9-74edcf5e4cfb@kernel.org>
Date: Tue, 6 Oct 2026 06:48:05 +0200
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
 <802564f8-1376-451e-8308-6f98d1efb099@kernel.org>
 <9adb6aaf-6e50-4ab0-a021-2529807dff02@redhat.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <9adb6aaf-6e50-4ab0-a021-2529807dff02@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 05/10/2026 à 22:40, Luiz Capitulino a écrit :
> 
> 
> On 10/5/26 12:52 AM, Christophe Leroy (CS GROUP) wrote:
>> Hi,
>>
>> Don't forget <linuxppc-dev@lists.ozlabs.org> when you address powerpc 
>> architecture.
> 
> Will do.
> 
>>
>> Le 03/10/2026 à 17:44, Luiz Capitulino a écrit :
>>>
>>>
>>> On 10/2/26 3:28 PM, David Hildenbrand (Arm) wrote:
>>>> On 9/18/26 03:45, Luiz Capitulino wrote:
>>>>> A future commit will introduce a kernel API to allow for checking 
>>>>> if the
>>>>> CPU supports PMD-sized pages. This API will be based on the
>>>>> has_transparent_hugepage() implementation but will be orthogonal to 
>>>>> THP
>>>>> and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.
>>>>>
>>>>> Move its definition out of the THP guard.
>>>>>
>>>>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>>>>> ---
>>>>>   arch/powerpc/include/asm/book3s/64/hash-4k.h  |  2 +-
>>>>>   arch/powerpc/include/asm/book3s/64/hash-64k.h |  2 +-
>>>>>   arch/powerpc/include/asm/book3s/64/pgtable.h  | 18 ++++++++ 
>>>>> +---------
>>>>>   arch/powerpc/include/asm/book3s/64/radix.h    | 14 +++++++-------
>>>>>   arch/powerpc/mm/book3s64/hash_pgtable.c       |  4 ++--
>>>>>   5 files changed, 20 insertions(+), 20 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/ 
>>>>> powerpc/include/asm/book3s/64/hash-4k.h
>>>>> index 8e5bd9902bed..79511e6abfca 100644
>>>>> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
>>>>> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
>>>>> @@ -165,9 +165,9 @@ extern void 
>>>>> hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
>>>>>   extern pgtable_t hash__pgtable_trans_huge_withdraw(struct 
>>>>> mm_struct *mm, pmd_t *pmdp);
>>>>>   extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
>>>>>                          unsigned long addr, pmd_t *pmdp);
>>>>> -extern int hash__has_transparent_hugepage(void);
>>>>>   #endif
>>>>> +extern int hash__has_transparent_hugepage(void);
>>>>>   #endif /* !__ASSEMBLER__ */
>>>>>   #endif /* _ASM_POWERPC_BOOK3S_64_HASH_4K_H */
>>>>> diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/ 
>>>>> powerpc/include/asm/book3s/64/hash-64k.h
>>>>> index 7deb3a66890b..a4a44a112ff9 100644
>>>>> --- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
>>>>> +++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
>>>>> @@ -278,9 +278,9 @@ extern void 
>>>>> hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
>>>>>   extern pgtable_t hash__pgtable_trans_huge_withdraw(struct 
>>>>> mm_struct *mm, pmd_t *pmdp);
>>>>>   extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
>>>>>                          unsigned long addr, pmd_t *pmdp);
>>>>> -extern int hash__has_transparent_hugepage(void);
>>>>
>>>> Without some of these helpers in place, I assume actually using PMD 
>>>> leafs
>>>> without THP would require some more work. (which is not the goal of 
>>>> this series,
>>>> just asking).
>>>
>>> Yes, you're right.
>>>
>>>> I do wonder whether the architecture should instead simply say "not 
>>>> supported"
>>>> if !CONFIG_TRANSPARENT_HUGEPAGE?
>>>>
>>>> That should still enable your series: using mTHP without PMD support.
>>>
>>> Yes, it would. However, I think this introduces an inconsistency.
>>
>> powerpc has two types of MMU (HASH and RADIX) with different page 
>> layout. MMU type is selected at boottime based on the capabilities of 
>> the CPU. For transparent page you have:
>>
>> static inline int has_transparent_hugepage(void)
>> {
>>      if (radix_enabled())
>>          return radix__has_transparent_hugepage();
>>      return hash__has_transparent_hugepage();
>> }
> 
> Right and, unless I'm misunderstanding your comment, this supports my
> position that the new arch_has_pmd_leaves() API is all about reporting a
> hardware capability and not tied to THP support.

Yes my comment was in reaction of comment below, I wanted to say that 
CONFIG_TRANSPARENT_HUGEPAGE is not always enough to tell if a powerpc 
actually has transparent hugepages or not.

 >>>> I do wonder whether the architecture should instead simply say "not
 >>>> supported"
 >>>> if !CONFIG_TRANSPARENT_HUGEPAGE?
 >>>>
 >>>> That should still enable your series: using mTHP without PMD support.


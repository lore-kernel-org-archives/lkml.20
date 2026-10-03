Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235611632DD
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791042275; cv=none; b=r432zUcVFhdkse9G0Zt1peZZX2pX9gM0iGbY5LCobxedQkYrRXEk4YJmwWH02XeaiAnz29ELirK54zxG3dGWr63ztIFxISgYAEPNMO7GQDZHpxdJAiINMgaPfN9R52pb7r10R5VNOOh9Hw4v6cFSeWzPOgjYUzJbITWTkgpK+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791042275; c=relaxed/simple;
	bh=wnRyPuaQLEHraec8zUJ0iuvV9FgWSERshUTKGL2e1WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwEKnaSChHu+juQVBYIrk+tQaty8a3r9nnYwU3lVC3nHQ8JN/MtqEUZg4jba1BOGwmyBAjKG2KdN62qiXsl1iF93n7dDYa+fEWzcIDO0UhfROfB8laWCa6JmGalcf2O7pJFaOc4DZojxdc43qRzo09+eAZ5Q8jHJDmHy8jdybfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EuSi7Gqq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EuSi7Gqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791042273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wZiVOoBi9CdBRkhP9ZWY4fcF1JHhwbOBeOslp4i10I=;
	b=EuSi7GqqX7VrxIVDVW7L7vcz99j0gCxwsmpRFgEAmdX93OKkgqeCEYlZzs6t3HZ5H+7Fxd
	8CdGV2Gyf3hOkk9kgV/zw5gDIwe9ppWbtA3EmfKtel+nu6brJx7J5orrBqxSno1NtCr3ZN
	azcE4oZlkr0I6sZDjcIJ3uMWW2hM60M=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-Y1_6dxRwNreUliKTq8pg2g-1; Sat, 03 Oct 2026 11:44:31 -0400
X-MC-Unique: Y1_6dxRwNreUliKTq8pg2g-1
X-Mimecast-MFC-AGG-ID: Y1_6dxRwNreUliKTq8pg2g_1791042271
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350bf63ba3so10125361cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 08:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791042271; x=1791647071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wZiVOoBi9CdBRkhP9ZWY4fcF1JHhwbOBeOslp4i10I=;
        b=a0vgkQtMSHoAAN+bMCErK+IrwkPpL9WEfUh730AjxILlkVTKY/yYX7p5HKTF0qXwpI
         0rQ9gsp9Jf2nZkNIIh0tdvL1Iqzf/YRdtC+MJmJN2dazOuEWBOuXwY2H2ub/mYAjUT0W
         4LbWQvcq4CBKsCrmqZAYWo9SYtVKEAT7C7ZZbueocoZlJCRXsTxc+/5pJsQeAJ2On0pb
         q7uc/e6cTUmXQDutXc1+OVyh06PVFA0KgFu+/mhlrmbNIqVvTBa06g7or9Afk+J/p/Bd
         aQgRLTDiDyMMUK7MKV+jUK/bV5bmFlNMwBuYuAf7Z9yJmGk9zaxybE/roIL2Mx9MW329
         KAzw==
X-Forwarded-Encrypted: i=1; AKwUvBwJOII4COiQcnlvZGTjOGqHd8KOWEEtt7Ck8VTJ6fntKQ+1CxPePOTghWS5e+g9R2HwZhKZw7QGzBhMWys=@vger.kernel.org
X-Gm-Message-State: AFuF++mPDKutk/7gECzlF3PcENYQYD+RoTV2Wv3yPdg8X/TfINDRZDO3
	UisasWkNIZw0Pp5hcRxq0uliuXkAG1CkEzJG2c9cL4TJhmT3B6XcULKXyp+CTSIpzZt7YITAF/P
	gkGUouCZY5yWPB2LyeM9A4IjhBF8CUKrznmdOCIxvtqEDRk8PSFuPlDWbBVBgVD98Fg==
X-Gm-Gg: AYBFou0XWoi6zrOJWQd0yyhTsm59t9XPbIK9sT4ft2Orv4nx+r2dZhW26pFttnqMKHW
	j7nsU/ojgl1ljGnw+a4a3bWx2spwBAajrS8CSzWdRMdbOURe7Nw/3bBt/gpLZfkDnoC3pjBm7OO
	eoRvoMTI/qIW5FmLynBYvGDuda3P9t8qvboE1lGJpyFdDA7hXDXLw5Ltvy3MMPPKOAqTGlNvL2Q
	BGPyvR8jrXjLN+Ru17d2byP+9p4d+RrOJLa+yw1OAXu9qsLxlkDKC1WnfVXE6dchz68eQdvRJGO
	Tsl1qGz5SHnx25cGNro8pltQls+zdaCWEv4cwDnl83UyCUQdExJcxukyhjU9oyxqp0g9j29znLh
	Mzjo=
X-Received: by 2002:ac8:610c:0:b0:532:ca82:51f7 with SMTP id d75a77b69052e-533d971af67mr96753461cf.54.1791042271059;
        Sat, 03 Oct 2026 08:44:31 -0700 (PDT)
X-Received: by 2002:ac8:610c:0:b0:532:ca82:51f7 with SMTP id d75a77b69052e-533d971af67mr96753111cf.54.1791042270560;
        Sat, 03 Oct 2026 08:44:30 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c3e2bdsm46623276d6.49.2026.10.03.08.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 08:44:30 -0700 (PDT)
Message-ID: <25bb02df-a795-4e48-9de6-99f1ca799176@redhat.com>
Date: Sat, 3 Oct 2026 11:44:28 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] powerpc: move has_transparent_hugepage() out of
 THP guard
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, lance.yang@linux.dev
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
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <f54d5d75-5cc1-488b-b640-76163419cf4d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/2/26 3:28 PM, David Hildenbrand (Arm) wrote:
> On 9/18/26 03:45, Luiz Capitulino wrote:
>> A future commit will introduce a kernel API to allow for checking if the
>> CPU supports PMD-sized pages. This API will be based on the
>> has_transparent_hugepage() implementation but will be orthogonal to THP
>> and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.
>>
>> Move its definition out of the THP guard.
>>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/hash-4k.h  |  2 +-
>>   arch/powerpc/include/asm/book3s/64/hash-64k.h |  2 +-
>>   arch/powerpc/include/asm/book3s/64/pgtable.h  | 18 +++++++++---------
>>   arch/powerpc/include/asm/book3s/64/radix.h    | 14 +++++++-------
>>   arch/powerpc/mm/book3s64/hash_pgtable.c       |  4 ++--
>>   5 files changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
>> index 8e5bd9902bed..79511e6abfca 100644
>> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
>> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
>> @@ -165,9 +165,9 @@ extern void hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
>>   extern pgtable_t hash__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
>>   extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
>>   				       unsigned long addr, pmd_t *pmdp);
>> -extern int hash__has_transparent_hugepage(void);
>>   #endif
>>   
>> +extern int hash__has_transparent_hugepage(void);
>>   #endif /* !__ASSEMBLER__ */
>>   
>>   #endif /* _ASM_POWERPC_BOOK3S_64_HASH_4K_H */
>> diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
>> index 7deb3a66890b..a4a44a112ff9 100644
>> --- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
>> +++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
>> @@ -278,9 +278,9 @@ extern void hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
>>   extern pgtable_t hash__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
>>   extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
>>   				       unsigned long addr, pmd_t *pmdp);
>> -extern int hash__has_transparent_hugepage(void);
> 
> Without some of these helpers in place, I assume actually using PMD leafs
> without THP would require some more work. (which is not the goal of this series,
> just asking).

Yes, you're right.

> I do wonder whether the architecture should instead simply say "not supported"
> if !CONFIG_TRANSPARENT_HUGEPAGE?
> 
> That should still enable your series: using mTHP without PMD support.

Yes, it would. However, I think this introduces an inconsistency.

In in its current form, arch_has_pmd_leaves() should always report a hardware
capability. This is true even for the default case where
arch_has_pmd_leaves() defaults to
IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE) in the assumption that
archs supporting PMD-sized pages by default will have this config
enabled.

Your suggestion will change this and for some archs
arch_has_pmd_leaves() may have different behavior depending on the user
configuration. Additionally, I intended to decouple the base API
implementation from THP.

If you feel strongly about this I can implement your suggestion, but I'd
still vote for keeping the API about consistently reporting the hardware
capability. Even if the only user is THP code today, new use cases can
be added incrementally.

> 
> [...]
> 
>>   
>> -static inline int radix__has_transparent_hugepage(void)
>> +static inline int radix__has_transparent_pud_hugepage(void)
>>   {
>> -	/* For radix 2M at PMD level means thp */
>> -	if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
>> +	/* For radix 1G at PUD level means pud hugepage support */
>> +	if (mmu_psize_defs[MMU_PAGE_1G].shift == PUD_SHIFT)
>>   		return 1;
>>   	return 0;
>>   }
>> +#endif
>>   
>> -static inline int radix__has_transparent_pud_hugepage(void)
>> +static inline int radix__has_transparent_hugepage(void)
>>   {
>> -	/* For radix 1G at PUD level means pud hugepage support */
>> -	if (mmu_psize_defs[MMU_PAGE_1G].shift == PUD_SHIFT)
>> +	/* For radix 2M at PMD level means thp */
>> +	if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
>>   		return 1;
>>   	return 0;
>>   }
> 
> You are swapping both implementations, which might create some unnecessary churn
> I think.

I suspect this was done by git diff as I just moved the functions, but
I'll take a better look.


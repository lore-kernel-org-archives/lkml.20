Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89B4534A9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361980; cv=none; b=VThShl/wW2Ob4ovwHSSpUDCf6hT555js3K1fCDFcz06zLY0jdF//8Jv6HfFjgTtf/ndT48ulswU+CAegUSvdaxhkmKXc2xG42Z/W/+8hiKvoOQA4pCxdyMD2rSbYG4MCn8NKE6WqRAOjrjWkUF0almjdz8uc0R/drgsMQm5xH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361980; c=relaxed/simple;
	bh=pB9Ev5fsAztB3k2u8zei7hDY5Lg9Sc/waWfjvO1ogxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+jwp6vS/9CmOQGkYHPdflLcDnxBNqFc8m74XoAJZLQ5mqmO34blUkA4bx+sHpzEHOzCKv6Xh+oswi9Ure0Jlhqf6PATDsH4GLGh5q1PFJZFE27zIWLtseR/YQ6sEipfaHu551mYe7Mh8aTFFaSVSXWaKcIPAIQjv0Zg1qFTmWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MJSrUhKe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MJSrUhKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788361976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hW0UXPiaj5HBVsIwr+z0dRI3kHamagF/s5VaYIAmBvo=;
	b=MJSrUhKe1fRjBqZf8HwgFpTEkd65rJtWykMehEKigQY/sIsKbw86am31a0xv88rJO9XDOs
	cCBX4/HJODPP66InN4sHCuhKHwIpQSUpLvjsI+vKlUYdimusoDGVElCTdCd6G3xJRGPtag
	hQvMxEWCVAHTZ+uUxTmxWZFrmmKbjKM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-l0SJmi_nNaaEv0mLYKpWYA-1; Wed, 02 Sep 2026 11:12:55 -0400
X-MC-Unique: l0SJmi_nNaaEv0mLYKpWYA-1
X-Mimecast-MFC-AGG-ID: l0SJmi_nNaaEv0mLYKpWYA_1788361974
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d33c89a29so30199181cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361974; x=1788966774;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hW0UXPiaj5HBVsIwr+z0dRI3kHamagF/s5VaYIAmBvo=;
        b=eQwX404t5rJ4WUK8HUOH6vGQydwY6gPq7/winW4GECkxkOPHag7rcruCW06S7IbFDi
         ldPNeJqOWf3MKptIIabmdY65OeAg4HTjUJIGY3PyxNr7SqQ7FvtjzH4JTC/tcHF0L5gm
         nnzGwfeVynqOsihzc1EJiLWdOuzMgSrWdYcLCXeY88WKbkiOY2lVufvPhYMEs14JBhEw
         TReYtiHeXRsjgBWQQ3u3lGZd9sUIJoiqXounoe/ZMOOve132y+7oMXkRNt55eN3tTnmT
         Idq5NBPNISZX6Bg9cFAnjfwAApKqkr1DB3mIb+s8Ep6zk1Z/mhbmRNPiwWcq3KTV5XST
         VyzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDYh2Ims7ZWmJvg2LBYAptHcPXFhd8cD1Cma68rxbg0OyT/PpfoSFfPceALJP+ApPmQJLXmTs3sMGDnZU=@vger.kernel.org
X-Gm-Message-State: AFuF++m+7/hIF0wl8G3OGC5Mu08UOmielnqOurLy6ClblbO4rQLTbkI6
	IXxTiBQZqgmNz/HLCe8ziV7BSUw/QM0h3rqtt6CSjVabBrud5FT+CAQ+xJozLNVfFaoWu6Hiijb
	4IfCT6zv26OdefG3QkRQvAQspeK/XKzcFIqe8gpiJseMTNlksCfbAlFWMc++A2XQwQg==
X-Gm-Gg: AYBFou1l9GO8HtpCdVzXI+3//NqGpmZBja7QxRNe+Kk2X1n3wBT4QBqb0POoQ1VQW55
	lQlRh9nHtJ6jy1cBlV9l/fm75z8wBi0SRn2YB67rLctDXTyZwYRcpCKVKXNJQtg6PwB31jSGe/5
	Qneca493Q1byO5aLLvR4xvJCj/JZa0XhTjqk1+/gr3gkT4xBG1k1VeWzrgDq9mXP97fMLtD/cFl
	w3/thwtH0yEjkKjSZacwh6WxesF1exTZvtWvxO2Kkm8RaCnpsZnqmqZrfA/AKRCaukLwkRDpi0k
	GES8/T86LY1obCLI1aUWxqmODO9d3yq/LigcciwBiHQM4PD1dnaozcr40O5kORapkeIr+oTzqlJ
	uKw==
X-Received: by 2002:a05:6214:434a:b0:8cc:d29:9f73 with SMTP id 6a1803df08f44-90ebab8fb94mr89149096d6.21.1788361973755;
        Wed, 02 Sep 2026 08:12:53 -0700 (PDT)
X-Received: by 2002:a05:6214:434a:b0:8cc:d29:9f73 with SMTP id 6a1803df08f44-90ebab8fb94mr89146766d6.21.1788361973014;
        Wed, 02 Sep 2026 08:12:53 -0700 (PDT)
Received: from [192.168.2.110] ([76.65.104.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef4f2fsm19747746d6.40.2026.09.02.08.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:12:52 -0700 (PDT)
Message-ID: <2802ba90-fee8-455b-9858-a6bcd0212c46@redhat.com>
Date: Wed, 2 Sep 2026 11:12:40 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] mips: move has_transparent_hugepage() out of THP
 guard
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Lance Yang <lance.yang@linux.dev>, corbet@lwn.net, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, david@kernel.org,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, djbw@kernel.org,
 vishal.l.verma@intel.com, dave.jiang@intel.com, akpm@linux-foundation.org,
 yintirui@huawei.com, dev.jain@arm.com, usama.arif@linux.dev,
 linux-mm@kvack.org
References: <cover.1788232334.git.luizcap@redhat.com>
 <371e2d3a7bcac265ac748ad3c67b74abfa238422.1788232334.git.luizcap@redhat.com>
 <f4c568ad-a17a-4982-b8d2-d5852a789a4d@linux.dev>
 <00eb76eb-c330-4662-9ca9-1e89fbc1e4ce@redhat.com>
 <apdQ2FJrLhkdjh_n@alpha.franken.de>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <apdQ2FJrLhkdjh_n@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-01 18:25, Thomas Bogendoerfer wrote:
> On Tue, Sep 01, 2026 at 03:53:18PM -0400, Luiz Capitulino wrote:
>> On 2026-09-01 07:42, Lance Yang wrote:
>>>
>>>
>>> On 2026/9/1 11:12, Luiz Capitulino wrote:
>>>> A future commit will introduce a kernel API to allow for checking if the
>>>> CPU supports PMD-sized pages. This API will be based on the
>>>> has_transparent_hugepage() implementation but will be orthogonal to THP
>>>> and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.
>>>>
>>>> Move its definition out of the THP guard.
>>>>
>>>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>>>> ---
>>>>    arch/mips/include/asm/pgtable.h | 6 +++---
>>>>    arch/mips/mm/tlb-r4k.c          | 4 ----
>>>>    2 files changed, 3 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
>>>> index fa7b935f947c..b038da872ec6 100644
>>>> --- a/arch/mips/include/asm/pgtable.h
>>>> +++ b/arch/mips/include/asm/pgtable.h
>>>> @@ -615,9 +615,6 @@ unsigned long io_remap_pfn_range_pfn(unsigned long pfn, unsigned long size);
>>>>    /* We don't have hardware dirty/accessed bits, generic_pmdp_establish is fine.*/
>>>>    #define pmdp_establish generic_pmdp_establish
>>>> -#define has_transparent_hugepage has_transparent_hugepage
>>>> -extern int has_transparent_hugepage(void);
>>>
>>> Assume a decstation_defconfig build. CPU_R3000 selects CPU_R3K_TLB, so the
>>> Makefile builds tlb-r3k.o but not tlb-r4k.o IIUC ...
>>>
>>> The only MIPS definition is in tlb-r4k.c, so R3000 would fail to link with
>>> an undefined reference ... no?
>>
>> Yes, you're right. I can reproduce this. Would the solution below be
>> acceptable?
>>
>> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
>> index fa7b935f947c..b038da872ec6 100644
>> --- a/arch/mips/include/asm/pgtable.h
>> +++ b/arch/mips/include/asm/pgtable.h
>> @@ -615,9 +615,6 @@ unsigned long io_remap_pfn_range_pfn(unsigned long pfn, unsigned long size);
>>   /* We don't have hardware dirty/accessed bits, generic_pmdp_establish is fine.*/
>>   #define pmdp_establish generic_pmdp_establish
>> -#define has_transparent_hugepage has_transparent_hugepage
>> -extern int has_transparent_hugepage(void);
>> -
>>   static inline int pmd_trans_huge(pmd_t pmd)
>>   {
>>   	return !!(pmd_val(pmd) & _PAGE_HUGE);
>> @@ -743,6 +740,9 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>> +#define has_transparent_hugepage has_transparent_hugepage
>> +extern int has_transparent_hugepage(void);
>> +
>>   #ifdef _PAGE_HUGE
>>   #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
>>   #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
>> diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
>> index 10835414819f..3a5b411493d9 100644
>> --- a/arch/mips/mm/pgtable.c
>> +++ b/arch/mips/mm/pgtable.c
>> @@ -23,3 +23,30 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(pgd_alloc);
>> +
>> +#if defined(CONFIG_CPU_R4K_CACHE_TLB) || \
>> +    defined(CONFIG_CPU_SB1) || \
>> +    defined(CONFIG_CPU_CAVIUM_OCTEON)
> 
> I guess using CONFIG_CPU_SUPPORTS_HUGEPAGES is a better approach

Makes sense. Updated patch below.

Subject: [PATCH 10/14] mips: move has_transparent_hugepage() out of THP guard

A future commit will introduce a kernel API to allow for checking if the
CPU supports PMD-sized pages. This API will be based on the
has_transparent_hugepage() implementation but will be orthogonal to THP
and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.

This commit moves has_transparent_hugepage() definition to
arch/mips/mm/pgtable.c under CONFIG_CPU_SUPPORTS_HUGEPAGES guard in
order to ensure that it's only used in CPUs that support the register
operations performed.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
  arch/mips/include/asm/pgtable.h |  6 +++---
  arch/mips/mm/pgtable.c          | 25 +++++++++++++++++++++++++
  arch/mips/mm/tlb-r4k.c          | 22 ----------------------
  3 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index fa7b935f947c..b038da872ec6 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -615,9 +615,6 @@ unsigned long io_remap_pfn_range_pfn(unsigned long pfn, unsigned long size);
  /* We don't have hardware dirty/accessed bits, generic_pmdp_establish is fine.*/
  #define pmdp_establish generic_pmdp_establish
  
-#define has_transparent_hugepage has_transparent_hugepage
-extern int has_transparent_hugepage(void);
-
  static inline int pmd_trans_huge(pmd_t pmd)
  {
  	return !!(pmd_val(pmd) & _PAGE_HUGE);
@@ -743,6 +740,9 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
  
  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
  
+#define has_transparent_hugepage has_transparent_hugepage
+extern int has_transparent_hugepage(void);
+
  #ifdef _PAGE_HUGE
  #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
  #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
index 10835414819f..4515fa42f0b3 100644
--- a/arch/mips/mm/pgtable.c
+++ b/arch/mips/mm/pgtable.c
@@ -23,3 +23,28 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
  	return ret;
  }
  EXPORT_SYMBOL_GPL(pgd_alloc);
+
+#ifdef CONFIG_CPU_SUPPORTS_HUGEPAGES
+int has_transparent_hugepage(void)
+{
+	static unsigned int mask = -1;
+
+	if (mask == -1) {	/* first call comes during __init */
+		unsigned long flags;
+
+		local_irq_save(flags);
+		write_c0_pagemask(PM_HUGE_MASK);
+		back_to_back_c0_hazard();
+		mask = read_c0_pagemask();
+		write_c0_pagemask(PM_DEFAULT_MASK);
+		local_irq_restore(flags);
+	}
+	return mask == PM_HUGE_MASK;
+}
+#else
+int has_transparent_hugepage(void)
+{
+	return 0;
+}
+#endif
+EXPORT_SYMBOL(has_transparent_hugepage);
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 24fe85fa169d..625f1c0dd71e 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -432,28 +432,6 @@ void add_wired_entry(unsigned long entrylo0, unsigned long entrylo1,
  #endif
  }
  
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-
-int has_transparent_hugepage(void)
-{
-	static unsigned int mask = -1;
-
-	if (mask == -1) {	/* first call comes during __init */
-		unsigned long flags;
-
-		local_irq_save(flags);
-		write_c0_pagemask(PM_HUGE_MASK);
-		back_to_back_c0_hazard();
-		mask = read_c0_pagemask();
-		write_c0_pagemask(PM_DEFAULT_MASK);
-		local_irq_restore(flags);
-	}
-	return mask == PM_HUGE_MASK;
-}
-EXPORT_SYMBOL(has_transparent_hugepage);
-
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE  */
-
  /*
   * Used for loading TLB entries before trap_init() has started, when we
   * don't actually want to add a wired entry which remains throughout the
-- 
2.55.0


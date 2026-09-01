Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD093D6CC4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292419; cv=none; b=Y6j4QcxTkVSK23f9TH/KDc3ba7mrLJpB9M1idVDnzrS9fttCVPT69z+TCiev1J8pbBfK8/xUrCoeeW7ZvT3gBzXaJGlqEeyMhJBEm1Na7tjccEbRsFL4HI3chjZGEgFX/nnJ9bCSYLJUzVvHn3Et8AZV6cSKixT5ZDLJh3BNJsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292419; c=relaxed/simple;
	bh=EmQC+HAtvL68p3YIjMO0wuH//FKGtvsUEkjl67ykW+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZRj2D4nugYfMh9WDnzkFkge6r/R8SlMxZCFQopr/lxSkmwfPpDL54SLPsv2byOw9F3jFrjd8iHn2bG9RLq5gjL6jFr4oCPdOe31nibp59n65lVVb1fgGqobVhnANT2aPwI/eIpWA8vlk6+iNA1qmGlP1qh1fDL/xTmhxn89XQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xb/tPboS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xb/tPboS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788292417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reG9gp6F6Sc44ynjc987c7Nir1HVN+IgKVtXu+sNVIw=;
	b=Xb/tPboSri371ft0XHYjjnY7nRqLe9t5nZrz85ERq5azUmV+N539mIBAvOwFZMXpkU8ngN
	YUDhHfZuLGUNeOKpAX0OdunXMgr7nxLb2hvSncKEHIT8uc7NFzt8hQoi83J/CZW9Nj6KmI
	zc/oVnPDL9M3AF55N3+CjA9Ly7rBdOc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-u9DQn7sbOI2pYhR5jiSN3Q-1; Tue, 01 Sept 2026 15:53:36 -0400
X-MC-Unique: u9DQn7sbOI2pYhR5jiSN3Q-1
X-Mimecast-MFC-AGG-ID: u9DQn7sbOI2pYhR5jiSN3Q_1788292415
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so58209885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292415; x=1788897215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reG9gp6F6Sc44ynjc987c7Nir1HVN+IgKVtXu+sNVIw=;
        b=q5wikjGb40tmeBhRhgAAFVP85TPPr7sswDyZAnGuv1WArq5cwpYfygJIF9d6m3Xg40
         F/bYq0fQMDfkAKJfFHJ068i5kMJGq1zx4UCVB8yqvXqxMO1NMa3oNiekM5t/YsuEShWY
         gzox5V5LN7VjoqDj4vLd3U2bG3bKOhRwS3IW6qz47j62xgpxSK5KtTu1DuSRybN5DnBL
         8ndV4VTkqEo5K1wLXjYm9m9g7o9HzZ4wKu2M6YvmWLSqT39f2YhZvxHVFGqDdiHQogeI
         PRblTSuYVo6W5SzIbi7m1osYVSMYZ1eJy4/P4xC+VoxcL3Lgi39u3M47aXdsY4oUoH28
         Q7JQ==
X-Forwarded-Encrypted: i=1; AHgh+RocdD+nB1l3wjTRFbTYXMOqEZQVhTtxq0BBPKFRJ/zkV/CXl08yS6xFL9o6tygCHyJk5bACTC/Jw/mlc2E=@vger.kernel.org
X-Gm-Message-State: AFuF++mtXgo6g6ihDT/znOFTZAOUgWbv+rF3O3rXVxcKR4UcgWZf743u
	lyVyOTY01iByE+vx72R8Gg8ClLNGGV5fFNnJWrkpohRt1CRpnNMRSQEHot8J0gc4ueVLoZiy8ON
	6JIeQHl9EXFJhSzG2Q17dsNXXk9xM1V2VHSx3ASZzDG6ORaoEr+yvEprcP4i03lwBpQ==
X-Gm-Gg: AR+sD12QFZP5lljgP0iH9Vn7g7XTPR9f/aIhlnkI3aMZFvyUe7iXRWyncexJmEk1+ct
	YLTQctTXvwFFF2fisToaeowDpDdaC9ku66ggR3YEmExwx64IGMlxFUQe83V9iTQ1vqBmdGnf2JQ
	pz4BuM2g7eXl8aXTF/3UnpIWOJzOFG4uIBp1jXhvSUjc92h4AZfJlwfSM5JrI8DlrGrA1vICgfy
	mEJwDaW1k747eMmLUgweL2O5j3sGMi1vxAxiPL2QYDN2WN/RdSjmoX9WqZYdYQr9qZGsDRFt0kV
	Cv5AriV4LpoCrH+xV5NL0kQj7erEKqx8qDzF3HYyAo88VcEo7UOrFLZEjJ+DYGRQNOBkMnUQJn4
	+WQ==
X-Received: by 2002:a05:620a:439e:b0:936:883d:89c6 with SMTP id af79cd13be357-939480def48mr1638125385a.28.1788292415331;
        Tue, 01 Sep 2026 12:53:35 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:936:883d:89c6 with SMTP id af79cd13be357-939480def48mr1638064385a.28.1788292409955;
        Tue, 01 Sep 2026 12:53:29 -0700 (PDT)
Received: from [192.168.2.110] ([76.65.104.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f1aba80sm20825085a.20.2026.09.01.12.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:53:29 -0700 (PDT)
Message-ID: <00eb76eb-c330-4662-9ca9-1e89fbc1e4ce@redhat.com>
Date: Tue, 1 Sep 2026 15:53:18 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] mips: move has_transparent_hugepage() out of THP
 guard
To: Lance Yang <lance.yang@linux.dev>
Cc: corbet@lwn.net, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 tsbogend@alpha.franken.de, maddy@linux.ibm.com, mpe@ellerman.id.au,
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
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <f4c568ad-a17a-4982-b8d2-d5852a789a4d@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-01 07:42, Lance Yang wrote:
> 
> 
> On 2026/9/1 11:12, Luiz Capitulino wrote:
>> A future commit will introduce a kernel API to allow for checking if the
>> CPU supports PMD-sized pages. This API will be based on the
>> has_transparent_hugepage() implementation but will be orthogonal to THP
>> and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.
>>
>> Move its definition out of the THP guard.
>>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
>>   arch/mips/include/asm/pgtable.h | 6 +++---
>>   arch/mips/mm/tlb-r4k.c          | 4 ----
>>   2 files changed, 3 insertions(+), 7 deletions(-)
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
> 
> Assume a decstation_defconfig build. CPU_R3000 selects CPU_R3K_TLB, so the
> Makefile builds tlb-r3k.o but not tlb-r4k.o IIUC ...
> 
> The only MIPS definition is in tlb-r4k.c, so R3000 would fail to link with
> an undefined reference ... no?

Yes, you're right. I can reproduce this. Would the solution below be
acceptable?

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
index 10835414819f..3a5b411493d9 100644
--- a/arch/mips/mm/pgtable.c
+++ b/arch/mips/mm/pgtable.c
@@ -23,3 +23,30 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
  	return ret;
  }
  EXPORT_SYMBOL_GPL(pgd_alloc);
+
+#if defined(CONFIG_CPU_R4K_CACHE_TLB) || \
+    defined(CONFIG_CPU_SB1) || \
+    defined(CONFIG_CPU_CAVIUM_OCTEON)
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


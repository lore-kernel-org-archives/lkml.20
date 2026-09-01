Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69593932D5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262970; cv=none; b=Up5mmKGVtCAwclZyj2z+9x5TowE/ePPn4Rw9MgIAWntHQ/uk7avI1zc3/f6hrUFQL38G+kU7lghHl8XaHLpXv/TqkJW/JGP7Zkoyol1QEHBkEQvg9UH+5nhE03ccR2KlgrX08Q8AOnqljqARuBRZ72Wyalbi+/rhuwmzP0a1tOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262970; c=relaxed/simple;
	bh=jW/g7skipUiySI9QtwdH2wDkEYlVS/kGmkog5T/rBHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cyE380Xx0pRDSIF0C9iTOr+sde16EqkzkRWkjZgOgtSm1yKUBUoUew0wfQI3rw2odFmSNTUv5o1M7zPevRKYwKYv5ixwdxztNdK8KuwPnfS1QVlpoFm6XRZXHmXfobNr/TyFQ9O44+iIW6Hi6Zz/8iFq+E3liFLEhrgxKW+EQIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lfsvrvti; arc=none smtp.client-ip=95.215.58.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lfsvrvti"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jW/g7skipUiySI9QtwdH2wDkEYlVS/kGmkog5T/rBHE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788262965; v=1; x=1788867765;
 b=LfsvrvtibHhBUHVY2X6xwFevKlEDCA0r9Kmf0y37jwH7WvQnTg97nb5/qhva3BPmAlE6WliB
 JLC+El2ftJ2d7Yh+ioGfVnr+vo7wJaCBiRGdwaphjJx/M1VblEBLu+JkKKiadPIGtpM8lOC5/x3
 eGmUXzogX6YYYRGW996jvEs4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ff2d6d342cf5eee9;
	Tue, 01 Sep 2026 11:42:35 +0000
X-Mizu-Trace-ID: ff2d6d342cf5eee9
X-Migadu-Flow: FLOW_OUT
Message-ID: <f4c568ad-a17a-4982-b8d2-d5852a789a4d@linux.dev>
Date: Tue, 1 Sep 2026 19:42:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] mips: move has_transparent_hugepage() out of THP
 guard
Content-Language: en-US
To: Luiz Capitulino <luizcap@redhat.com>
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
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <371e2d3a7bcac265ac748ad3c67b74abfa238422.1788232334.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/1 11:12, Luiz Capitulino wrote:
> A future commit will introduce a kernel API to allow for checking if the
> CPU supports PMD-sized pages. This API will be based on the
> has_transparent_hugepage() implementation but will be orthogonal to THP
> and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.
> 
> Move its definition out of the THP guard.
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>   arch/mips/include/asm/pgtable.h | 6 +++---
>   arch/mips/mm/tlb-r4k.c          | 4 ----
>   2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index fa7b935f947c..b038da872ec6 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -615,9 +615,6 @@ unsigned long io_remap_pfn_range_pfn(unsigned long pfn, unsigned long size);
>   /* We don't have hardware dirty/accessed bits, generic_pmdp_establish is fine.*/
>   #define pmdp_establish generic_pmdp_establish
>   
> -#define has_transparent_hugepage has_transparent_hugepage
> -extern int has_transparent_hugepage(void);

Assume a decstation_defconfig build. CPU_R3000 selects CPU_R3K_TLB, so the
Makefile builds tlb-r3k.o but not tlb-r4k.o IIUC ...

The only MIPS definition is in tlb-r4k.c, so R3000 would fail to link with
an undefined reference ... no?

Cheers, Lance

> -
>   static inline int pmd_trans_huge(pmd_t pmd)
>   {
>   	return !!(pmd_val(pmd) & _PAGE_HUGE);
> @@ -743,6 +740,9 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>   
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>   
> +#define has_transparent_hugepage has_transparent_hugepage
> +extern int has_transparent_hugepage(void);
> +
>   #ifdef _PAGE_HUGE
>   #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
>   #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
> diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> index 24fe85fa169d..f4e369342a56 100644
> --- a/arch/mips/mm/tlb-r4k.c
> +++ b/arch/mips/mm/tlb-r4k.c
> @@ -432,8 +432,6 @@ void add_wired_entry(unsigned long entrylo0, unsigned long entrylo1,
>   #endif
>   }
>   
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -
>   int has_transparent_hugepage(void)
>   {
>   	static unsigned int mask = -1;
> @@ -452,8 +450,6 @@ int has_transparent_hugepage(void)
>   }
>   EXPORT_SYMBOL(has_transparent_hugepage);
>   
> -#endif /* CONFIG_TRANSPARENT_HUGEPAGE  */
> -
>   /*
>    * Used for loading TLB entries before trap_init() has started, when we
>    * don't actually want to add a wired entry which remains throughout the


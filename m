Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355366;
	b=HU7HBKtWKLo2nS+7ceexPSJpSKrWfJK4/af+8onak3wvjCZGscDREDh+2esAPa+MSZBz
	 mx1yXsNl/l2IDmhGdQBIhDJqggoCO1dgMzbXL65nWsh8OvXso4XMhqe0UKMmcTO7lHPzY
	 6U8tjuBFWBRmCJ/HQldk5Pxw/PFawDcThNpuiq9K9qvuY9sangFbgKNIbFI6SaZOlGkvI
	 YGCbIoIxsoYJT1DtG/Js/ahTbg++qkFBl+U1ATUBdjYaU4RBu+SkwDLWy7YweilWNVlAD
	 sCCMeyAQaO0ojjGC/VhjrDvAdoZLDF7T2IojvxqNW2KI6pDBO0jMSLuKsiaJBhNccqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355366;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yi8rwFMd9BghO9lmTtGQ2dC4Wi31UNr7sStszJWXA+U=;
	b=rcY6GEubqbNzU5IeiVeX7vBamXj1Cv0TiwpJ32NNAXlVBUvaEvHW28jsojgD8Ux5rFqM
	 6GPpeQWLm4bhvPoccoN5XZ2eJ6DK18/OJa2UyqMb+ODWg3mWHmlkk3vGo+LGwegHYahze
	 276jt3sJEYEw0Zx/RZSAK1QywoxnCO5gEtm67AQ3LZhmsHwWJZsCRgJd/Fw/qdtD5LRu0
	 xbDHY1jwneypSFUChWruCe7RvM8EsvpS5WnomIAlB6fofy5JAf6kityuH1hqoOen1Vt9y
	 KP0oqTfEzrRgVnrlvJ0OSCx9dA+pSKW/KBt+TlA0lmywlVPVRuYxzkrKDnjeE7XKIhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jc7pqsm4;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F51606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jc7pqsm4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9550B1E8D;
	Fri, 30 Oct 2026 03:16:00 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D61D03F673;
	Fri, 30 Oct 2026 03:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793355363; bh=FhDY5fSWPJ3mhD73WP57LfIGqwZxwSuLppmUfiz+pOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jc7pqsm4vTE7kxMElmrskn/EFX99V9Yb2EuLMypfOO2ZWfNtb0tubd3Tiu9Tny8KX
	 zoDjgWDKpT2jRIBwBifLnk0S7QSprVBpDEwWlcXJXAOf1P40PgvLkc070ObMrnKT1x
	 6iXOQ/2hUm2zteDsuYeY/4EVppLxMq2gzEySNSj8=
Message-ID: <b2856d6e-dce6-4933-a43a-3ce7b5f9d2c2@arm.com>
Date: Fri, 30 Oct 2026 10:15:59 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshan.ljs@antgroup.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Huth <thuth@redhat.com>,
 linux-arm-kernel@lists.infradead.org
References: <20261027100231.31184-1-jiangshanlai@gmail.com>
 <r56ewhlz5fihgwd34zbiaxgmxdw4eq4t36jlsmwepu4nbhon6i@kjsqwoivmfhr>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <r56ewhlz5fihgwd34zbiaxgmxdw4eq4t36jlsmwepu4nbhon6i@kjsqwoivmfhr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 06:30, Anshuman Khandual wrote:
> On Tue, Oct 27, 2026 at 06:02:27PM +0800, Lai Jiangshan wrote:
>> From: Lai Jiangshan <jiangshan.ljs@antgroup.com>
>>
>> Switching to init_mm should prevent further accesses through the
>> previous address space's translations.
>>
>> Commit e53f21bce4d3 ("arm64: Use the reserved TTBR0 if context switching
>> to the init_mm") avoided installing init_mm.pgd as a user page table.
>> At the time, the ASID was held in TTBR0, so installing the reserved
>> TTBR0 also switched to ASID 0.
>>
>> Since commit 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1"),
>> installing the reserved TTBR0 no longer changes the active ASID.
>> Consequently, switching to init_mm leaves the CPU using the previous
>> address space's ASID. An empty page table does not prevent TLB hits
>> for that ASID.
>>
>> This can retain access beyond the lifetime of the backing pages.
>> During fullmm teardown, user data pages can be freed before their
>> cached translations are invalidated. If those pages are subsequently
>> reused for kernel data, an erroneous uaccess that hits a surviving
>> translation can read or corrupt that data instead of faulting.
>>
>> Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
>> Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
>>
>> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
>> index 803b68758152..7e56099c5fbb 100644
>> --- a/arch/arm64/include/asm/mmu_context.h
>> +++ b/arch/arm64/include/asm/mmu_context.h
>> @@ -235,15 +235,6 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
>>  
>>  static inline void __switch_mm(struct mm_struct *next)
>>  {
>> -	/*
>> -	 * init_mm.pgd does not contain any user mappings and it is always
>> -	 * active for kernel addresses in TTBR1. Just set the reserved TTBR0.
>> -	 */
>> -	if (next == &init_mm) {
>> -		cpu_set_reserved_ttbr0();
>> -		return;
>> -	}
>> -
>>  	check_and_switch_context(next);
>>  }
>>  
>> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
>> index 0f4a28b87469..a96ebe904dd7 100644
>> --- a/arch/arm64/mm/context.c
>> +++ b/arch/arm64/mm/context.c
>> @@ -218,6 +218,16 @@ void check_and_switch_context(struct mm_struct *mm)
>>  	unsigned int cpu;
>>  	u64 asid, old_active_asid;
>>  
>> +	/*
>> +	 * init_mm.pgd contains kernel mappings, so use the reserved page
>> +	 * tables for TTBR0 and switch TTBR1 to ASID 0. Leave active_asids
> Just curious - does TTBR1 switch to ASID 0 ? AFAICS TTBR1_EL1 gets
> the ASID which is derived from the mm_struct via ASID(mm) earlier.
>

AFAICS, mm in this case is init_mm, and ASID for init_mm is 0.

Cheers
Vladimir
 
> void cpu_do_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm)
> {
> 	unsigned long ttbr1 = read_sysreg(ttbr1_el1);
> 	unsigned long asid = ASID(mm);
> 	unsigned long ttbr0 = phys_to_ttbr(pgd_phys);
> 
> 	/* Skip CNP for the reserved ASID */
> 	if (system_supports_cnp() && asid)
> 		ttbr0 |= TTBRx_EL1_CnP;
> 
> 	/* SW PAN needs a copy of the ASID in TTBR0 for entry */
> 	if (IS_ENABLED(CONFIG_ARM64_SW_TTBR0_PAN))
> 		ttbr0 |= FIELD_PREP(TTBRx_EL1_ASID_MASK, asid);
> 
> 	/* Set ASID in TTBR1 since TCR.A1 is set */
> 	ttbr1 &= ~TTBRx_EL1_ASID_MASK;
> 	ttbr1 |= FIELD_PREP(TTBRx_EL1_ASID_MASK, asid);
> 
> 	cpu_set_reserved_ttbr0_nosync();
> 	write_sysreg(ttbr1, ttbr1_el1);
> 	write_sysreg(ttbr0, ttbr0_el1);
> 	isb();
> 	post_ttbr_update_workaround();
> }
> 
>> +	 * unchanged to preserve the ASID rollover bookkeeping.
>> +	 */
>> +	if (mm == &init_mm) {
>> +		cpu_do_switch_mm(__pa_symbol(reserved_pg_dir), mm);
>> +		return;
>> +	}
>> +
>>  	if (system_supports_cnp())
>>  		cpu_set_reserved_ttbr0();
>>  
>> -- 
>> 2.39.5 (Apple Git-154)
>>


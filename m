Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198845;
	b=E4Gafks59fu8I4drC43GKyqwHly+TaV4CazxV6ejvKXh2YeoN5gdctYcMP0UYoDE4kWc
	 ZYbwIza4+WZ+p+Bd6EbZU8tKpIEljiCPicN9VMCPjU4VtgnAOmkIJTQDqgQYUF1l3SP1x
	 OHR011Wr3mImBO9WSbd8hBSPN2K6yP9f4W4qix6aS7B5mS4VdE+q4aN5tN2qW3gjcg8BC
	 i87WsBMSXmwSgM0FadnNKamZMSRjosskTzPq/vJ/eTRjZKOrf/mX2Wl6VTjTktMaJS2+Y
	 Y5Os9XEMxX0KendufyCZzzYdxxw/LOBxnOHnIBQNUK2i1Re8Y6lpRdUAogfMJRCQyig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198845;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Cc:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bkdqYhvgTV3TxfzYF2JwGYAKi+AJ0WqJz3A5EIXwgoA=;
	b=H0YrLpVeQoF+HOIMt72oG1QSHUJxgRr4fUbTNuVBsxtw+O9gx+6E91Sn8HLDRZjExODq
	 sTJhLYOJczbPZ6T2U0jK7Tcoj0DSIGzIN5jkMunogeDaWa3HrkzOmpw9OOrWLICV5I3+P
	 d9i3LSxTmsRnSKzVa8Zvm78BDpvoPCkL3oYy5tcYolElW+PYXJnxKBm76qMMPqYtSQoIa
	 raqJtHeubxynnrKBnO5Me6TTc9cxeVXkumgt+mYFNKPkyw5pQjG9hq0V8Jd1kMzJ2r6bG
	 WhjrlvqtmtDjbsdI7fuApl1eiCzkfTLx8qLLebbk/J/SQuI0xHkCLCZ/0LmHiQ/BF/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=j1P+R26b;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D2F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D2F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=j1P+R26b
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B39DB16A3;
	Wed, 28 Oct 2026 07:47:19 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07F623F59E;
	Wed, 28 Oct 2026 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793198842; bh=2tVTu6ii/9taQ5GtfJNHTPR+6ACyTcaIodAIeyi7TGs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=j1P+R26bOcMrWaELyp34i/98r/7w5fTQNChzqPiga/JISr1nqJbQ4We0hNbuuGjeg
	 H7q9ehNQUB9jRxE/zRbk8EwMca6V4wgsOh8Vc07XAcrDrwfztI1Xy5prVAm2QnY6hp
	 MU+LeurmQsJGVowuIdkIJnizoG00o5i3osTC7nBE=
Message-ID: <b6f0d10a-d098-43cc-b923-0245af5f51f0@arm.com>
Date: Wed, 28 Oct 2026 14:47:19 +0000
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
Cc: usama.anjum@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only active
 on local cpu
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Mark Rutland <mark.rutland@arm.com>,
 Huang Ying <ying.huang@linux.alibaba.com>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
From: Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260523134710.3827956-1-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/05/2026 2:47 pm, Linu Cherian wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> There are 3 variants of tlb flush that invalidate user mappings:
> flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> would previously unconditionally broadcast their tlbis to all cpus in
> the inner shareable domain.
> 
> But this is a waste of effort if we can prove that the mm for which we
> are flushing the mappings has only ever been active on the local cpu. In
> that case, it is safe to avoid the broadcast and simply invalidate the
> current cpu.
> 
> So let's track in mm_context_t::active_cpu either the mm has never been
> active on any cpu, has been active on more than 1 cpu, or has been
> active on precisely 1 cpu - and in that case, which one. We update this
> when switching context, being careful to ensure that it gets updated
> *before* installing the mm's pgtables. On the reader side, we ensure we
> read *after* the previous write(s) to the pgtable(s) that necessitated
> the tlb flush have completed. This guarrantees that if a cpu that is
> doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> entry cannot have been seen by any other cpu and we can flush only the
> local cpu.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
> Changelog from RFC v1:
> - Adapted for v7.1 flush tlb API changes
>   No changes in core logic
> - Collected Rb and Tb tags
> - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
>   hence retained dsb(ishst) in flush_tlb_user_pre	
> 
> 
> Testing with 7.1-rc4 :
> +-----------------------+---------------------------------------------------+-------------+
> | Benchmark             | Result Class                                      |  Improvement|  
> +=======================+===================================================+=============+
> | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> +-----------------------+---------------------------------------------------+-------------+
> | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> +-----------------------+---------------------------------------------------+-------------+

I tested this patch using a synthetic Firecracker benchmark on a 192-CPU
arm64 host, with Linux v7.3 on both the host and guests. Each worker
repeatedly creates a fresh 1-vCPU microVM, boots Ubuntu, verifies an echo
response over the serial console, and shuts the guest down, waiting for
Firecracker to exit before starting the next VM. Each guest has 256 MiB of
RAM, with two VM slots per workload CPU.

With 4 KiB guests, the unpatched workload stops scaling between 64 and 96
CPUs: throughput falls from approximately 68 to 65 completed lifecycles/s
despite the additional CPUs.

Applying the patch to the guest substantially improves throughput at higher
concurrency. At 128 workload CPUs, I measured:

  Guest pages  Unpatched  Guest patched only  Host patched only
  -----------  ---------  ------------------  -----------------
  4 KiB        73.83/s    108.55/s (+47.0%)    74.09/s (+0.4%)
  64 KiB       86.46/s    105.04/s (+21.5%)    90.15/s (+4.3%)

The host uses 4 KiB pages throughout. The host-only difference with 4 KiB
guests is small enough that I would regard it as essentially unchanged.

I have not observed any functional regressions during these tests.

Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>

> 
>  arch/arm64/include/asm/mmu.h         |  12 +++
>  arch/arm64/include/asm/mmu_context.h |   2 +
>  arch/arm64/include/asm/tlbflush.h    | 127 +++++++++++++++++++++------
>  arch/arm64/mm/context.c              |  30 ++++++-
>  4 files changed, 141 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 5e1211c540ab..0002101c1f21 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -16,6 +16,17 @@
>  #include <linux/refcount.h>
>  #include <asm/cpufeature.h>
>  
> +/*
> + * Sentinal values for mm_context_t::active_cpu. ACTIVE_CPU_NONE indicates the
> + * mm has never been active on any CPU. ACTIVE_CPU_MULTIPLE indicates the mm
> + * has been active on multiple CPUs. Any other value is the ID of the single
> + * CPU that the mm has been active on.
> + */
> +enum active_cpu {
> +	ACTIVE_CPU_NONE = UINT_MAX,
> +	ACTIVE_CPU_MULTIPLE = UINT_MAX - 1,
> +};
> +
>  typedef struct {
>  	atomic64_t	id;
>  #ifdef CONFIG_COMPAT
> @@ -25,6 +36,7 @@ typedef struct {
>  	void		*vdso;
>  	unsigned long	flags;
>  	u8		pkey_allocation_map;
> +	unsigned int	active_cpu;
>  } mm_context_t;
>  
>  /*
> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> index 803b68758152..101cae0c7262 100644
> --- a/arch/arm64/include/asm/mmu_context.h
> +++ b/arch/arm64/include/asm/mmu_context.h
> @@ -172,6 +172,8 @@ init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>  	/* pkey 0 is the default, so always reserve it. */
>  	mm->context.pkey_allocation_map = BIT(0);
>  
> +	WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE);
> +
>  	return 0;
>  }
>  
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index c0bf5b398041..1f75bce4fa0d 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -164,6 +164,12 @@ static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
>  
>  typedef void (*tlbi_op)(u64 arg);
>  
> +static __always_inline void vae1(u64 arg)
> +{
> +	__tlbi(vae1, arg);
> +	__tlbi_user(vae1, arg);
> +}
> +
>  static __always_inline void vae1is(u64 arg)
>  {
>  	__tlbi(vae1is, arg);
> @@ -308,6 +314,74 @@ static inline void __tlbi_sync_s1ish_hyp(void)
>  	__repeat_tlbi_sync(vale2is, 0);
>  }
>  
> +typedef unsigned __bitwise tlbf_t;
> +
> +/* No special behaviour. */
> +#define TLBF_NONE		((__force tlbf_t)0)
> +
> +/* Invalidate tlb entries only, leaving the page table walk cache intact. */
> +#define TLBF_NOWALKCACHE	((__force tlbf_t)BIT(0))
> +
> +/* Skip the trailing dsb after issuing tlbi. */
> +#define TLBF_NOSYNC		((__force tlbf_t)BIT(1))
> +
> +/* Suppress tlb notifier callbacks for this flush operation. */
> +#define TLBF_NONOTIFY		((__force tlbf_t)BIT(2))
> +
> +/* Perform the tlbi locally without broadcasting to other CPUs. */
> +#define TLBF_NOBROADCAST	((__force tlbf_t)BIT(3))
> +
> +/*
> + * Determines whether the user tlbi invalidation can be performed only on the
> + * local CPU or whether it needs to be broadcast. (Returns true for local).
> + * Additionally issues appropriate barrier to ensure prior pgtable updates are
> + * visible to the table walker. Must be paired with flush_tlb_user_post().
> + */
> +static inline bool flush_tlb_user_pre(struct mm_struct *mm, tlbf_t flags)
> +{
> +	unsigned int self, active;
> +	bool local;
> +
> +	migrate_disable();
> +
> +	if (flags & TLBF_NOBROADCAST) {
> +		dsb(nshst);
> +		return true;
> +	}
> +
> +	self = smp_processor_id();
> +
> +	/*
> +	 * The load of mm->context.active_cpu must not be reordered before the
> +	 * store to the pgtable that necessitated this flush. This ensures that
> +	 * if the value read is our cpu id, then no other cpu can have seen the
> +	 * old pgtable value and therefore does not need this old value to be
> +	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
> +	 * needed to make the pgtable updates visible to the walker, to a
> +	 * dsb(ish) by default. So speculatively load without a barrier and if
> +	 * it indicates our cpu id, then upgrade the barrier and re-load.
> +	 */
> +	active = READ_ONCE(mm->context.active_cpu);
> +	if (active == self) {
> +		dsb(ish);
> +		active = READ_ONCE(mm->context.active_cpu);
> +	} else {
> +		dsb(ishst);
> +	}
> +
> +	local = active == self;
> +	if (!local)
> +		migrate_enable();
> +
> +	return local;
> +}
> +
> +static inline void flush_tlb_user_post(bool local)
> +{
> +	if (local)
> +		migrate_enable();
> +}
> +
>  /*
>   *	TLB Invalidation
>   *	================
> @@ -408,12 +482,20 @@ static inline void flush_tlb_all(void)
>  static inline void flush_tlb_mm(struct mm_struct *mm)
>  {
>  	unsigned long asid;
> +	bool local;
>  
> -	dsb(ishst);
> +	local = flush_tlb_user_pre(mm, TLBF_NONE);
>  	asid = __TLBI_VADDR(0, ASID(mm));
> -	__tlbi(aside1is, asid);
> -	__tlbi_user(aside1is, asid);
> -	__tlbi_sync_s1ish(mm);
> +	if (local) {
> +		__tlbi(aside1, asid);
> +		__tlbi_user(aside1, asid);
> +		dsb(nsh);
> +	} else {
> +		__tlbi(aside1is, asid);
> +		__tlbi_user(aside1is, asid);
> +		__tlbi_sync_s1ish(mm);
> +	}
> +	flush_tlb_user_post(local);
>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>  }
>  
> @@ -475,6 +557,12 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>   *    operations can only span an even number of pages. We save this for last to
>   *    ensure 64KB start alignment is maintained for the LPA2 case.
>   */
> +static __always_inline void rvae1(u64 arg)
> +{
> +	__tlbi(rvae1, arg);
> +	__tlbi_user(rvae1, arg);
> +}
> +
>  static __always_inline void rvae1is(u64 arg)
>  {
>  	__tlbi(rvae1is, arg);
> @@ -573,23 +661,6 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
>  	return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
>  }
>  
> -typedef unsigned __bitwise tlbf_t;
> -
> -/* No special behaviour. */
> -#define TLBF_NONE		((__force tlbf_t)0)
> -
> -/* Invalidate tlb entries only, leaving the page table walk cache intact. */
> -#define TLBF_NOWALKCACHE	((__force tlbf_t)BIT(0))
> -
> -/* Skip the trailing dsb after issuing tlbi. */
> -#define TLBF_NOSYNC		((__force tlbf_t)BIT(1))
> -
> -/* Suppress tlb notifier callbacks for this flush operation. */
> -#define TLBF_NONOTIFY		((__force tlbf_t)BIT(2))
> -
> -/* Perform the tlbi locally without broadcasting to other CPUs. */
> -#define TLBF_NOBROADCAST	((__force tlbf_t)BIT(3))
> -
>  static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
>  					unsigned long start, unsigned long end,
>  					unsigned long stride, int tlb_level,
> @@ -597,6 +668,7 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	unsigned long asid, pages;
> +	bool local;
>  
>  	pages = (end - start) >> PAGE_SHIFT;
>  
> @@ -605,10 +677,9 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
>  		return;
>  	}
>  
> -	if (!(flags & TLBF_NOBROADCAST))
> -		dsb(ishst);
> -	else
> -		dsb(nshst);
> +	local = flush_tlb_user_pre(mm, flags);
> +	if (local && !(flags & TLBF_NOBROADCAST))
> +		flags |= TLBF_NOBROADCAST;
>  
>  	asid = ASID(mm);
>  
> @@ -622,8 +693,8 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
>  					asid, tlb_level);
>  		break;
>  	case TLBF_NOBROADCAST:
> -		/* Combination unused */
> -		BUG();
> +		__flush_s1_tlb_range_op(vae1, start, pages, stride,
> +					asid, tlb_level);
>  		break;
>  	case TLBF_NOWALKCACHE | TLBF_NOBROADCAST:
>  		__flush_s1_tlb_range_op(vale1, start, pages, stride,
> @@ -640,6 +711,8 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
>  		else
>  			dsb(nsh);
>  	}
> +
> +	flush_tlb_user_post(local);
>  }
>  
>  static inline void __flush_tlb_range(struct vm_area_struct *vma,
> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index 0f4a28b87469..f34ed78393e0 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -214,9 +214,10 @@ static u64 new_context(struct mm_struct *mm)
>  
>  void check_and_switch_context(struct mm_struct *mm)
>  {
> -	unsigned long flags;
> -	unsigned int cpu;
> +	unsigned int cpu = smp_processor_id();
>  	u64 asid, old_active_asid;
> +	unsigned int active;
> +	unsigned long flags;
>  
>  	if (system_supports_cnp())
>  		cpu_set_reserved_ttbr0();
> @@ -251,7 +252,6 @@ void check_and_switch_context(struct mm_struct *mm)
>  		atomic64_set(&mm->context.id, asid);
>  	}
>  
> -	cpu = smp_processor_id();
>  	if (cpumask_test_and_clear_cpu(cpu, &tlb_flush_pending))
>  		local_flush_tlb_all();
>  
> @@ -262,6 +262,30 @@ void check_and_switch_context(struct mm_struct *mm)
>  
>  	arm64_apply_bp_hardening();
>  
> +	/*
> +	 * Update mm->context.active_cpu in such a manner that we avoid cmpxchg
> +	 * and dsb unless we definitely need it. If initially ACTIVE_CPU_NONE
> +	 * then we are the first cpu to run so set it to our id. If initially
> +	 * any id other than ours, we are the second cpu to run so set it to
> +	 * ACTIVE_CPU_MULTIPLE. If we update the value then we must issue
> +	 * dsb(ishst) to ensure stores to mm->context.active_cpu are ordered
> +	 * against the TTBR0 write in cpu_switch_mm()/uaccess_enable(); the
> +	 * store must be visible to another cpu before this cpu could have
> +	 * populated any TLB entries based on the pgtables that will be
> +	 * installed.
> +	 */
> +	active = READ_ONCE(mm->context.active_cpu);
> +	if (active != cpu && active != ACTIVE_CPU_MULTIPLE) {
> +		if (active == ACTIVE_CPU_NONE)
> +			active = cmpxchg_relaxed(&mm->context.active_cpu,
> +						 ACTIVE_CPU_NONE, cpu);
> +
> +		if (active != ACTIVE_CPU_NONE)
> +			WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_MULTIPLE);
> +
> +		dsb(ishst);
> +	}
> +
>  	/*
>  	 * Defer TTBR0_EL1 setting for user threads to uaccess_enable() when
>  	 * emulating PAN.


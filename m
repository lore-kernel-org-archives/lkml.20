Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565757;
	b=rddvFA5Kx2gc65ViVu5JKxZne5ywliofML+/+a1TWrukNusVEJ5/uH9a1NHR6+G8BLcH
	 EZPHJXne+V6xvgl3sjEFUQ4r7011Jmg9EoQo1vlHWrcH36k2nMP3pXZWfEexLRiENZlrO
	 Ul4WaCO369UkDjLubMyg5cQ/PT3s9WtVlXTMdGeXksJyaNbA3tLNMjOgmYoc4K1Vtvadr
	 yyuyKDbhSzrd0ggv6H9bdofa/vI6TVK7kPhT35vTJzAqfIgUkp8cfmKdK1/N2n9oCzPbi
	 cetdBHI4kT9ndVkOUBCRSq5O9anxNxg4lZ3JHxaVtg9F0mxOT/plaoZGO+quXgvVuMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565757;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=CT8U4Q29aGYjqSS4zWx9hqDxh+kziiY7Qkd0eclbYtA=;
	b=4/pD4ZdkaNC1zUYUqF0Yei0OzF1urslu+L7iEVSUGwSJoSOBlOuzqUq5wkZPN9sv7nCE
	 JZYnwtd9NbrUfz1f3RR9LY1EUVwb4kSn6KfW2Jz7DZnQ1oqZwVLdTJvMHcjQNrKCclnOJ
	 wLDF+cNxU4UvVCwssws7MJukSTNh+oCOrrQ5Xx9XZHk/ti/VXsq9a3xYjTWTHq/iQtSAz
	 c5il2prB2VLB1TKwAna50TseJG1sAowBxZ4W9xN1max4gIJQYhyqN5uAHOAOPDGi+STmm
	 XwyV6Aa/k/WuSWe0M9ZIfuAx3SjOmsXQIGMG5ZpzyFDSXHYD3PYXJqzEXUegvDx1nPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O/Zi2n8T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D6606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/Zi2n8T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFF61F000C4;
	Fri, 13 Nov 2026 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565756;
	bh=CT8U4Q29aGYjqSS4zWx9hqDxh+kziiY7Qkd0eclbYtA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O/Zi2n8TiGSKIRFWSXPmcu/nA+o63e1Qu3TtCwOU9Hz8fjczRGYx1alC76NyYox7x
	 OVrl3HxSMMSd4MlljdO2FBF4ZQnXp7ZYOUWk8ZO6iK5QfYjJDalbgdqWBpZqkvhprq
	 PI6mL/0kx/vd/G2CcTuhEdaUSsOR2myaZ3owYYvUcR3pBXDPERmQOQjSCyqKK1HXHa
	 HoHC7ndTnpDmoklThcEqYst8UJIHZqtm1hQyPD/RD/Apig/WZU61RmkEitksiogh3p
	 INLk2L6nz/b1elPkB8apW5Y3scOQIuR6Q8Su4KQOSPNLM9LS1/KIWCkPugzqDIXNay
	 GWYr20JEFHWBA==
Message-ID: <011cd94f-1789-4909-83f9-4007776f1b05@kernel.org>
Date: Fri, 13 Nov 2026 11:29:09 +0100
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
Subject: Re: [PATCH v4] mm/migrate: don't batch the TLB flush when there is
 nothing to batch
To: Zhiteng Qiu <qiuzhiteng@hygon.cn>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Alistair Popple <apopple@nvidia.com>,
 Xin Hao <xhao@linux.alibaba.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Yuan Zhong <zhongyuan@hygon.cn>, Shifei Ge <geshifei@hygon.cn>,
 Jianyong Wu <wujianyong@hygon.cn>, Shijie Huang <huangsj@hygon.cn>,
 Yibin Liu <liuyibin@hygon.cn>, Fengyu Wang <wangfengyu@hygon.cn>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261112010357.2739389-1-qiuzhiteng@hygon.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261112010357.2739389-1-qiuzhiteng@hygon.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 02:03, Zhiteng Qiu wrote:
> NUMA balancing migrates one folio at a time, but since commit
> 7e12beb8ca2a ("migrate_pages: batch flushing TLB") it still unmaps
> with TTU_BATCH_FLUSH like any other MIGRATE_ASYNC migration.  When the
> batch contains one small folio mapped only once, there is nothing to
> batch, and the batched unmap can leave mm->tlb_flush_batched pending,
> so the NUMA scanner's next change_pte_range() can call flush_tlb_mm()
> before changing the PTE table.  With migrations running concurrently,
> that state keeps being refilled, and on this workload the scanner
> often flushes the whole mm as it walks the PTE tables.
> 
> This slows scanning and keeps mm->tlb_flush_pending raised longer.  On
> x86, a migration that unmaps a PROT_NONE PTE while
> mm->tlb_flush_pending is set gets true from pte_accessible() and needs
> a flush too; with batching, the resulting arch_tlbbatch_flush() is a
> full flush.  The two feed each other.  In one run, 33% of the
> migrations overlapped a scan pass, although passes covered only 9% of
> the time.
> 
> On a 2-socket, 384-CPU x86 machine without INVLPGB, with v7.3, a
> 120 GiB anonymous working set on 4 KiB pages and 384 threads (three
> balancing on/off pairs per kernel):
> 
>                                      v7.3          patched
>   throughput loss from balancing     13.0-16.5%    0.5-6.3%
>   TLB interrupts per migrated page   202-210       12.7-13.6
>   average scanner mmu_gather time    ~90 ms        ~6.7 ms
> 
> The mmu_gather times were measured in separate instrumented runs.
> 
> So don't ask for a batched flush when the batch holds a single small
> folio that is not mapped shared; try_to_migrate_one() then uses
> ptep_clear_flush() for each PTE it encounters.  Large folios retain
> their existing flush behavior.  migrate_pages_batch() computes the
> flags, since it knows how many folios it is migrating.  PMD-mapped
> THPs are not affected, since set_pmd_migration_entry() flushes them
> regardless of TTU_BATCH_FLUSH.
> 
> Signed-off-by: Zhiteng Qiu <qiuzhiteng@hygon.cn>
> ---
> Changes in v4:
>  - Compute the try_to_migrate() flags in migrate_pages_batch() with a
>    helper and pass them to migrate_folio_unmap() instead of a bool, as
>    suggested by David.
>  - Go back to v2's check, limited to small folios, using
>    folio_maybe_mapped_shared() as Zi suggested.  folio_mapcount() would
>    stop being a good hint for large folios once try_to_unmap() batches
>    them better (David).
>  - Shorter comment (Zi).
> 
> Changes in v3:
>  - Use folio_mapcount() for the check, as Ying suggested.
>  - Cut the changelog down.
> 
> Changes in v2:
>  - Pass the try_to_migrate() flags directly and use single_folio in
>    the VM_WARN_ON_ONCE(), as suggested by Ying.
>  - Rewrote the changelog after looking into why b99a342d4f11 does not
>    avoid the flush here.
> 
> v3: https://lore.kernel.org/r/20261109122915.2150586-1-qiuzhiteng@hygon.cn
> v2: https://lore.kernel.org/r/20261107143456.1590658-1-qiuzhiteng@hygon.cn
> v1: https://lore.kernel.org/r/20261106041628.1177963-1-qiuzhiteng@hygon.cn
> 
> The table was measured on v7.3 with the same check as v4.  On mm-new
> with v4, three balancing on/off pairs gave a 1.9-2.9% loss and
> 13.2-14.6 TLB interrupts per migrated page.
> 
> I re-ran the tests on v4: mm/migration selftests 6/6, LTP move_pages
> and migrate_pages 14/14, 30 minutes with compaction forced every 30 s,
> and 4.5 hours of NUMA balancing racing with fork(), MADV_DONTNEED and
> move_pages(), 4 of them on a CONFIG_DEBUG_VM kernel, all without
> warnings.  Splitting partially mapped 2 MiB THPs during NUMA migration
> still gets the batched flush (0.115-0.120 TLB interrupts per migrated
> page), and 64 KiB mTHP and a MAP_SHARED mapping shared by two processes
> behave like base.
> 
> No Fixes: tag, as this is a performance trade-off that has been there
> since v6.3 and nobody has reported it as a regression.  Happy to add
> one if you think it should have one.
> 
>  mm/migrate.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index cb699ea59d33..8eb14b0a5d73 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1218,11 +1218,28 @@ static void migrate_folio_done(struct folio *src,
>  		folio_put(src);
>  }
>  
> +/*
> + * Batching the TLB flush only helps when the rmap walk can clear more than
> + * one PTE.  A single small folio mapped once has nothing to batch, and the
> + * batched unmap would leave mm->tlb_flush_batched pending.
> + */

These comments belongs split up into the function above the relevant checks.

> +static enum ttu_flags migrate_ttu_flags(struct folio *folio,
> +					enum migrate_mode mode,
> +					bool single_folio)

Just pass the from list, please and check for ; internally.

Also, use two-tab indent here.

Further, i would suggest calling this

	folio_migrate_ttu_flags


> +{
> +	if (mode != MIGRATE_ASYNC)
> +		return 0;
> +	if (single_folio && !folio_test_large(folio) &&
> +	    !folio_maybe_mapped_shared(folio))
> +		return 0;

/* Helpful comment. */
if (!list_is_singular(from))
	return TTU_BATCH_FLUSH;
/* Helpful comment. */
if (folio_test_large(folio))
	return TTU_BATCH_FLUSH;
/* Helpful comment. */
if (folio_maybe_mapped_shared(folio))
	return TTU_BATCH_FLUSH;
return 0;

> +	return TTU_BATCH_FLUSH;
> +}
> +
>  /* Obtain the lock on page, remove all ptes. */
>  static int migrate_folio_unmap(new_folio_t get_new_folio,
>  		free_folio_t put_new_folio, unsigned long private,
>  		struct folio *src, struct folio **dstp, enum migrate_mode mode,
> -		struct list_head *ret)
> +		enum ttu_flags ttu, struct list_head *ret)
>  {
>  	struct folio *dst;
>  	int rc = -EAGAIN;
> @@ -1344,7 +1361,7 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
>  		/* Establish migration ptes */
>  		VM_BUG_ON_FOLIO(folio_test_anon(src) &&
>  			       !folio_test_ksm(src) && !anon_vma, src);
> -		try_to_migrate(src, mode == MIGRATE_ASYNC ? TTU_BATCH_FLUSH : 0);
> +		try_to_migrate(src, ttu);
>  		old_folio_state |= FOLIO_WAS_MAPPED;
>  	}
>  
> @@ -1835,9 +1852,11 @@ static int migrate_pages_batch(struct list_head *from,
>  	LIST_HEAD(unmap_folios);
>  	LIST_HEAD(dst_folios);
>  	bool nosplit = (reason == MR_NUMA_MISPLACED);
> +	bool single_folio = list_is_singular(from);
> +	enum ttu_flags ttu;
>  
>  	VM_WARN_ON_ONCE(mode != MIGRATE_ASYNC &&
> -			!list_empty(from) && !list_is_singular(from));
> +			!list_empty(from) && !single_folio);
>  
>  	for (pass = 0; pass < nr_pass && retry; pass++) {
>  		retry = 0;
> @@ -1924,8 +1943,10 @@ static int migrate_pages_batch(struct list_head *from,
>  				continue;
>  			}
>  
> +			ttu = migrate_ttu_flags(folio, mode, single_folio);
>  			rc = migrate_folio_unmap(get_new_folio, put_new_folio,
> -					private, folio, &dst, mode, ret_folios);
> +					private, folio, &dst, mode, ttu,
> +					ret_folios);

While at it, might as well fixup the indentation.



-- 
Cheers,

David

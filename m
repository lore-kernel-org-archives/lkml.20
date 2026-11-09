Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229649;
	b=VdHLTuUoiTzARQ7YPqox5mF0+yOZX1oGxVuPYNbS7Z5AkO7M4oZxt9/EfwuahNm7XKrh
	 7qRDJM2KTf5j5MpeInIpPnfmeVm7dLVDiWo0mY4aXdpe8v9mdIM/RoJV4MAsMX3y4kijp
	 cBkzy1jydR6N9ohkIIiaC9nVG/8pvvhsQNE1Q19uzlYSnY8Nn4Wkp2bPnTJ2UKSGMKFmj
	 8dINR+S/BpK1aJZ8cApoYPTKlf/BUZeSf5zFMVoAAZ5Em5iYHLeImQb+vceZDkiq9SWgM
	 WtbO42Bw8Y6xmUuU3VUlleksS77UFgyuCvXqbVm8jhkj24UMr2cffLmxrydJgj9dXTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229649;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=c1ZkJOx0YMKAetnR53KLSam63/lIe1qshCB1Rhi1SdI=;
	b=PNbHO1Mr+ycCrQEX1DpsKO2FdaCh2HvAwhZwyZNyegg4p84aHq5jIrM6WYfm6cPBUB0Q
	 AdCp+4WlZksng70uUG0EIbsVeHImCIq/MilTwOhIH/RaeQkiE+URMLE+gUCHQxc/iBFOx
	 CSgmx8HHCYk8doupd15wJJDq/H3hkoLtlT4+4c75b47j8Gy8whjR/xGVqIB3FIbdde6l7
	 +pHO4o1ERK0WPyoPgCm3p8/7hweFA+Ay1/1wQIHozZcm8Um/V9ELSzWhgX6JZNyOJhz54
	 gX56Pm/slDQv6gpYbBqHHXz5yT57Fv1wgLvlQcEMOd4rkwzKBCTH932oJsS+7jMk3HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jintyy2t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9C3606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jintyy2t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D971F0089F;
	Mon,  9 Nov 2026 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794229648;
	bh=c1ZkJOx0YMKAetnR53KLSam63/lIe1qshCB1Rhi1SdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Jintyy2t6HxmVDZlycaWEo7AAMjqehFKdng6seOXe/g6d/1I3wVVjh6r+arwqxKrf
	 9rta+uA/JzciTqwz9OdfvIElYB0QaZV7n7G7BnuR0/jikIRBtjZS3061egy7tFF2TR
	 RiXUPIBK9jNMyHeliNPmF9+a2o8F4CRrcPAKyBnSgm6erFAFnE+Q/NGX/fvFAQxGc+
	 4VSkrHAWe1c/B+nVwfFA11XFnnIz6DR+dGIUiA3BM8nFUpzwFypaCGmFEPYdxXMHSX
	 TcgpG153T2QupoQ5w4BGPoah40g/xJrux8DCDs9R2cpVLAzMLE/JqyHrMvgNmTeHyp
	 61xdrh3+TGHdA==
Message-ID: <ef12d685-d111-4a6f-b72a-77bbd1369548@kernel.org>
Date: Mon, 9 Nov 2026 14:07:21 +0100
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
Subject: Re: [PATCH v3] mm/migrate: don't batch the TLB flush when there is
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
References: <20261107143456.1590658-1-qiuzhiteng@hygon.cn>
 <20261109122915.2150586-1-qiuzhiteng@hygon.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261109122915.2150586-1-qiuzhiteng@hygon.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 13:29, Zhiteng Qiu wrote:
> NUMA balancing migrates one folio at a time, but since commit
> 7e12beb8ca2a ("migrate_pages: batch flushing TLB") it still unmaps
> with TTU_BATCH_FLUSH like any other MIGRATE_ASYNC migration.  When the
> batch contains one folio mapped only once, there is nothing to batch,
> and the batched unmap can leave mm->tlb_flush_batched pending, so the
> NUMA scanner's next change_pte_range() can call flush_tlb_mm() before
> changing the PTE table.  With migrations running concurrently, that
> state keeps being refilled and the scanner ends up flushing the whole
> mm for many of the PTE tables it walks.
> 
> That slows each scan pass down a lot, and mm->tlb_flush_pending stays
> raised for the whole pass.  On x86, a migration that unmaps a
> PROT_NONE PTE while mm->tlb_flush_pending is set gets true from
> pte_accessible() and needs a flush too; with batching, the resulting
> arch_tlbbatch_flush() is a full flush.  The two feed each other.  In
> one run, 33% of the migrations overlapped a pass, although passes
> covered only 9% of the time.
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
> So only ask for a batched flush when the rmap walk can meet more than
> one PTE, that is, when there is more than one folio in the batch or
> the folio is mapped more than once.  Otherwise try_to_migrate_one()
> uses ptep_clear_flush() on the one PTE.  PMD-mapped THPs are not
> affected, since set_pmd_migration_entry() flushes them regardless of
> TTU_BATCH_FLUSH.
> 
> Signed-off-by: Zhiteng Qiu <qiuzhiteng@hygon.cn>
> ---
> Changes in v3:
>  - Use folio_mapcount() for the check, as Ying suggested.  It counts
>    PTEs, so PTE-mapped large folios are still batched when more than
>    one PTE remains mapped.  The only difference from v2 is a large
>    folio with just one PTE still mapped, which is no longer batched
>    either.
>  - Cut the changelog down.
> 
> Changes in v2:
>  - Pass the try_to_migrate() flags directly and use single_folio in
>    the VM_WARN_ON_ONCE(), as suggested by Ying.
>  - Rewrote the changelog after looking into why b99a342d4f11 does not
>    avoid the flush here.
> 
> v2: https://lore.kernel.org/r/20261107143456.1590658-1-qiuzhiteng@hygon.cn
> v1: https://lore.kernel.org/r/20261106041628.1177963-1-qiuzhiteng@hygon.cn
> 
> The table was measured on v7.3 with the check as posted in v2.  v3
> only differs for a large folio with a single PTE left mapped.  On
> mm-new with v3, one balancing on/off pair gave a 3.2% loss and 13.5
> TLB interrupts per migrated page.
> 
> I re-ran the tests on v3: mm/migration selftests 6/6, LTP move_pages
> and migrate_pages 14/14, and 30 minutes with compaction forced every
> 30 s without warnings.  Splitting partially mapped 2 MiB THPs during
> NUMA migration still gets the batched flush (0.11-0.12 TLB
> interrupts per migrated page, same as base), and 64 KiB mTHP and a
> MAP_SHARED mapping shared by two processes behave like base.
> 
> No Fixes: tag, as this is a performance trade-off that has been there
> since v6.3 and nobody has reported it as a regression.  Happy to add
> one if you think it should have one.
> 

For the future, please don't send new revisions in reply to old revisions.

>  mm/migrate.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index cb699ea59d33..011cceadeda9 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1222,7 +1222,7 @@ static void migrate_folio_done(struct folio *src,
>  static int migrate_folio_unmap(new_folio_t get_new_folio,
>  		free_folio_t put_new_folio, unsigned long private,
>  		struct folio *src, struct folio **dstp, enum migrate_mode mode,
> -		struct list_head *ret)
> +		bool single_folio, struct list_head *ret)

Is there no way to avoid that boolean?

>  {
>  	struct folio *dst;
>  	int rc = -EAGAIN;
> @@ -1344,7 +1344,19 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
>  		/* Establish migration ptes */
>  		VM_BUG_ON_FOLIO(folio_test_anon(src) &&
>  			       !folio_test_ksm(src) && !anon_vma, src);
> -		try_to_migrate(src, mode == MIGRATE_ASYNC ? TTU_BATCH_FLUSH : 0);
> +		enum ttu_flags ttu = 0;
> +
> +		/*
> +		 * Batching only helps if the rmap walk can find more than one
> +		 * PTE to clear.  With a single folio mapped once there is
> +		 * nothing to merge, and a batched unmap would only leave
> +		 * mm->tlb_flush_batched pending, making later page table
> +		 * changes in this mm (e.g. NUMA scanning) flush the whole mm.
> +		 */
> +		if (mode == MIGRATE_ASYNC &&
> +		    (!single_folio || folio_mapcount(src) > 1))

This is all information the caller could provide, and the caller could just
provide the TTU flag then instead of passing a new "bool".

Also, likely this check can be put into a separate helper function.

> +			ttu = TTU_BATCH_FLUSH;


I am not quite happy about the folio_mapcount() check, though: as soon as we
optimize try_to_unmap() to batch better for large folios, it would be just plain
wrong.

So this needs a second thought.

-- 
Cheers,

David

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794054379;
	b=BHkvc6uFvD5DIjg6un07l5GSP+wY5BDkW/bNsRwTpKIXe70Bqo09JKW/1dyyTW3m4K7y
	 ypvJYX3U4oD0BK53bee8/dJ3EPF3O8ds1so6Y5uVuo6jlt3fXtrSuENrcJg1nsAz/+hyn
	 IoXjFSl1WEkPz7zsK7El/y5X1KDHXOMqZlxLb1KAuvNi8q3VMltaiEcTG5+2b82eGDHHp
	 ytj/2z/1mJEDUgle60DpqM9HDcdhv3ox2O/KARjTeEYlJxWKL7v3Zk/d8DHKnb6NeTLpF
	 t/jNyeE+grBXI0QpvgZAzdsyjzgJvBjHxbCz+12+j36kA3YIsFAZDzx+ol1b4PsfwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054379;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=u5ZJ/wlGvJUQePH7rwc/09MLnxEpQRsgWYMeOcnU8Wo=;
	b=X0LKgJMt/Oh6z1xq7LhSBbekz5Ti041a4nQGMbxr5zFL8A2aEXpwk5Bt1zWKpSt21Rej
	 7sDH39V9QrAy6dfBh36v8EbY3uOS+xOscEPrsImWEmJrscqosH9uTblW4Yy1732szJgZQ
	 yWUGYkvjjZ95VOj6aNdF/ttY4sTOyEDGRZW+smzsyvKVA6Y2p+PmQ6Wh0xvpu3UiECppI
	 vOcu4uCW9zelghR1OgxGb6nzalHevKUnfnYgGwvZ1cZ2udx6DKE541gUVG6AeeP/buFco
	 GUViCn/vferar0nt3nb+XjyivQ2rCeI7jOO2udwdClOZ0yC6uNS0bVhtnVFdZly6kBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=f5j7H+ft;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27370606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27370606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=f5j7H+ft
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794054370; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=u5ZJ/wlGvJUQePH7rwc/09MLnxEpQRsgWYMeOcnU8Wo=;
	b=f5j7H+ftdnAMo7dWdjE96G71mJnSim62TYIVXUSkG4cAO4XO3xAweQMZrkdFxa6qtGCloaAgRHzc1zs7BdlkHrQttpmPYR0tdF6qp/4RVVRc/bDWhVyqla30NoL1sYsSMjl/N1XzA12HekLzjL4nv/UPDxffTdInlwQGGGCkKMU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XEESKRq_1794054367;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XEESKRq_1794054367 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Nov 2026 20:26:08 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Zhiteng Qiu <qiuzhiteng@hygon.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@kernel.org>,  Zi Yan <ziy@nvidia.com>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,
  Byungchul Park <byungchul@sk.com>,  Gregory Price <gourry@gourry.net>,
  Alistair Popple <apopple@nvidia.com>,  Xin Hao <xhao@linux.alibaba.com>,
  Dave Hansen <dave.hansen@linux.intel.com>,  <linux-mm@kvack.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/migrate: don't batch the TLB flush when there is
 nothing to batch
In-Reply-To: <20261106041628.1177963-1-qiuzhiteng@hygon.cn> (Zhiteng Qiu's
	message of "Fri, 6 Nov 2026 12:16:28 +0800")
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
Date: Sat, 07 Nov 2026 20:26:07 +0800
Message-ID: <87h5hsx1y8.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Zhiteng Qiu <qiuzhiteng@hygon.cn> writes:

> Since commit 7e12beb8ca2a ("migrate_pages: batch flushing TLB"), every
> MIGRATE_ASYNC migration unmaps with TTU_BATCH_FLUSH.  That includes NUMA
> balancing and memory-tiering promotion, which migrate one folio per call
> through migrate_misplaced_folio().  For an order-0 folio with a single
> mapping the batch holds one PTE and there is nothing to merge, but the
> flush still changes: on x86, arch_tlbbatch_flush() sends a full TLB
> flush to every CPU in mm_cpumask() instead of invalidating that one page.
>
> On a 2-socket, 384-CPU x86 server without INVLPGB, a 4 KiB-page,
> memory-heavy multithreaded workload takes about 200 TLB shootdown
> interrupts per page migrated by NUMA balancing (v5.15 on the same machine
> takes about 11), and balancing costs it 13-16% of its throughput.
>
> Skip the batched flush only when the batch cannot merge anything: the
> folio is the only one in this migrate_pages_batch() call, it is not a
> large folio, and it is mapped only once.  The rmap walk then meets at
> most one PTE, and ptep_clear_flush() invalidates just that page.
> Everything else keeps the batched flush, including PTE-mapped large
> folios, folios mapped more than once, and the batch of sub-folios
> produced when a partially mapped large folio is split during migration.
>
> PMD-mapped THPs already invalidate their mappings through
> set_pmd_migration_entry(), independently of TTU_BATCH_FLUSH, so their
> flush behaviour is unchanged.  On arm64 the batched path only defers the
> final DSB, so a one-PTE batch should cost about the same either way.
>
> migrate_folio_unmap() cannot see how many folios its caller is
> migrating, so migrate_pages_batch() passes that down.
>
> Measured on v7.3: 120 GiB anonymous working set, 384 threads, 180 s per
> run, three A/B pairs (numa_balancing on vs. off, same boot) per kernel.
>
>                                     v7.3            patched
>   throughput loss from balancing   13.0-16.5%      0.5-6.3%
>   kernel cycles per hinting PTE    1.18-1.22M      0.28-0.31M
>   TLB interrupts / migrated page   202-210         12.7-13.6
>
> Signed-off-by: Zhiteng Qiu <qiuzhiteng@hygon.cn>
> ---
> Notes:
>
> An earlier version decided on reason == MR_NUMA_MISPLACED.  That also
> dropped batching for the split sub-folio batch mentioned above.  In a
> test that splits partially mapped 2 MiB THPs during NUMA migration, the
> earlier version raised TLB interrupts per migrated page from 0.13 to
> 16.1; this version keeps them at 0.11.  For 64 KiB mTHP and for a
> MAP_SHARED mapping used by two processes, this version behaves like the
> base kernel (TLB interrupts per migrated page: mTHP 2.2-2.7 patched vs.
> 2.6-3.3 base; shared 31.3-31.5 vs. 31.2-31.7).
>
> The earlier version behaves the same as this one for order-0, private,
> single-mapped memory.  These results were measured with it:
>  - 192 CPUs (SMT off, 192 threads, 4 pairs): balancing loss
>    3.1-14.7% patched vs. 7.4-54.3% base.
>  - Memory first-touched on the remote socket, threads on the local
>    socket (6 runs per kernel): no regression in time to convergence or
>    in throughput after convergence.
>  - 2 MiB THP (2 pairs): no difference, as expected for PMD-mapped
>    folios.
>  - A 30-minute run with compaction forced every 30 s: no warnings.
>
> With this version, tools/testing/selftests/mm/migration passes 6/6
> (including the THP and hugetlb cases), the LTP move_pages and
> migrate_pages cases pass 14/14, and the scenario tests above saw no data
> mismatches.
>
> There is no Fixes: tag.  This changes a performance trade-off in code
> that has been there since v6.4, and nobody has reported it as a
> regression.  Please add one if you see it that way.
> ---
>  mm/migrate.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 953af633ec..0f3404c3d7 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1222,7 +1222,7 @@ static void migrate_folio_done(struct folio *src,
>  static int migrate_folio_unmap(new_folio_t get_new_folio,
>  		free_folio_t put_new_folio, unsigned long private,
>  		struct folio *src, struct folio **dstp, enum migrate_mode mode,
> -		struct list_head *ret)
> +		bool single_folio, struct list_head *ret)
>  {
>  	struct folio *dst;
>  	int rc = -EAGAIN;
> @@ -1344,7 +1344,18 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
>  		/* Establish migration ptes */
>  		VM_BUG_ON_FOLIO(folio_test_anon(src) &&
>  			       !folio_test_ksm(src) && !anon_vma, src);
> -		try_to_migrate(src, mode == MIGRATE_ASYNC ? TTU_BATCH_FLUSH : 0);
> +		/*
> +		 * Batching only pays off when the rmap walk can meet more than
> +		 * one PTE.  A lone order-0 folio with a single mapping has
> +		 * exactly one, and on x86 the batched flush turns that one-page
> +		 * invalidation into a full flush of mm_cpumask().
> +		 */
> +		bool batch_flush = mode == MIGRATE_ASYNC;

Better to set try_to_migrate() flags directly?

> +
> +		if (single_folio && !folio_test_large(src) &&
> +		    !folio_maybe_mapped_shared(src))
> +			batch_flush = false;
> +		try_to_migrate(src, batch_flush ? TTU_BATCH_FLUSH : 0);
>  		old_folio_state |= FOLIO_WAS_MAPPED;
>  	}
>  
> @@ -1835,6 +1846,7 @@ static int migrate_pages_batch(struct list_head *from,
>  	LIST_HEAD(unmap_folios);
>  	LIST_HEAD(dst_folios);
>  	bool nosplit = (reason == MR_NUMA_MISPLACED);
> +	bool single_folio = list_is_singular(from);
>  
>  	VM_WARN_ON_ONCE(mode != MIGRATE_ASYNC &&
>  			!list_empty(from) && !list_is_singular(from));

s/list_is_singular(from)/single_folio/

?

> @@ -1925,7 +1937,8 @@ static int migrate_pages_batch(struct list_head *from,
>  			}
>  
>  			rc = migrate_folio_unmap(get_new_folio, put_new_folio,
> -					private, folio, &dst, mode, ret_folios);
> +					private, folio, &dst, mode, single_folio,
> +					ret_folios);
>  			/*
>  			 * The rules are:
>  			 *	0: folio will be put on unmap_folios list,
>
> base-commit: dba8aba0a9a00ff781c03d82ae534fc6f8c2e263

---
Best Regards,
Huang, Ying

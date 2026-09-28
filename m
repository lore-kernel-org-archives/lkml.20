Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194524A689C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597573; cv=none; b=AFXYqD2YXuJlUrc8Ec62h79NnFRWMuquaGetILHPIZpBltVCjsEWctLpOq1Iulx2bldbObEuEJM5x7PyhaHjKrl5cpHDA2AuUKGhqrerj7+aQqW9EgwsmtcJN0R3SGUUz/War87Ppkq2E9Tzardxjl1tbBwfWOghW5VgB6qpu4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597573; c=relaxed/simple;
	bh=A8WQjby6bYLoQXrcT6w7S9TK7OfFS8eOPE8WAN4eFRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=saXVj6fRNYEt48cB5RzijfeYmExB5+Z4uSCPLRsxPyCU/aeu+/pRSMdzhHQDTkqrfs5S7YbF1yIa+RkAMm22fvAhKj0rHN08+dXg5zqfHdbf/UCPT2evipZqP0tYL+s0Y9XL1YzTJj4yGPrvl5bxnNU5p8hWO5uHoCoFvs1mzhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EM2ykc2s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EM2ykc2s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03C81F000FF;
	Mon, 28 Sep 2026 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790597571;
	bh=NbUJiBdpcS0GzzmqNyFIkdeNdQt2pSr1lbMMC4G4AE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EM2ykc2sM19KUh3ECVkSBtjYmF1T/YD422txRparDWpIGchUyfu0bytpEKHETTBr5
	 yUYEcTH1X3HLe+PqbcVI/+dICbEoRpmgiPWApitwbfuBy5hXFbYulC0VAXVJIy1Yi4
	 ChJaV9rq33xfDxawCarfPUAEmeYUekEgN2kvUBjhOm4lQF0f6p+BAl0Q+WLbNdbNf/
	 JPqIKWyFFZDCtb9qgI6o5h0tLF8FEKyLWtRMAlFanVX0Bg2OS0WWwL4vjgbJ4uB8as
	 Zl/isFqpW7Z6FL3tOqgju/5R6d752QxK/jZ8kZhxr0mo1AhZumzVGMPIK1dU/M/UpW
	 KIsD3dKSupsVg==
Message-ID: <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
Date: Mon, 28 Sep 2026 14:12:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned
 pages
To: Yuanhe Shu <xiangzao@linux.alibaba.com>, akpm@linux-foundation.org
Cc: vbabka@kernel.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com,
 ziy@nvidia.com, ying.huang@linux.alibaba.com, wangkefeng.wang@huawei.com,
 tujinjiang@huawei.com, mgorman@techsingularity.net, kaitao.cheng@linux.dev,
 chengkaitao@kylinos.cn, muchun.song@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
 <20260928105805.1215770-2-xiangzao@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260928105805.1215770-2-xiangzao@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/28/26 12:58, Yuanhe Shu wrote:
> memory_failure() sets PG_hwpoison on the error page before it manages
> to pin the folio via get_hwpoison_page().  Compaction running on
> another CPU can isolate that same folio in the meantime, so
> HWPoisonHandlable() then fails on !PageLRU(), the retry loop in
> get_any_page() exhausts itself and memory_failure() gives up with
> MF_IGNORED - while compaction still has the folio on its
> migratepages list, flagged PG_hwpoison.
> 
> Nothing stops compaction from migrating such a folio afterwards.
> The corrupted data is copied into a fresh folio that carries no
> poison marker, and no hwpoison PTE entry is installed on the way
> back: the userspace mapping is silently redirected to the corrupted
> copy and no SIGBUS is ever delivered.
> 
> Note that a large folio with a PG_hwpoisoned subpage can also sit on
> the LRU without any race at all, via the THP-split-failure path of
> memory_failure() (kill_procs_now() + MF_MSG_UNSPLIT_THP).  Guarding
> compaction is therefore needed regardless of how the race in
> memory_failure() itself might be addressed.
> 
> folio_mc_copy() does not close this hole: it only detects corruption
> at copy time and only where ARCH_HAS_COPY_MC is implemented (x86_64
> and PPC64; elsewhere copy_mc_highpage() degrades to a plain copy).

Then they should implement it.

> Software-injected poison - what MADV_HWPOISON and the hwpoison-inject
> interface produce, and what tests and fuzzers exercise - never traps
> during the copy on any architecture.  

And these are debug interfaces, why do we care?

> An isolation-time check avoids
> the migration entirely, on all architectures and for both real and
> simulated poison.

It's racy. See the link below.

> The check itself is two flag tests on the head page (PG_hwpoison
> and the folio-level has_hwpoisoned marker), not a walk over
> subpages.
> 
> Neither page reclaim nor memory hotplug lets such a folio be
> copied into a fresh one: reclaim unmaps the poisoned order-0 page,
> and skips the hwpoisoned large folios it cannot safely unmap, in
> shrink_folio_list()
> commit 1b0449544c64 ("mm/vmscan: don't try to reclaim hwpoison folio")
> commit 9f1e8cd0b7c4 ("mm/vmscan: fix hwpoisoned large folio handling in shrink_folio_list")
> while memory hotplug refuses to migrate them in do_migrate_range()
> commit 5f5ee52d4f58 ("mm/hwpoison: introduce folio_contain_hwpoisoned_page() helper").
> Skip them in compaction as well, for the same reason reclaim settled
> on skipping: the UCE is rare and a race with compaction is rarer
> still, so skipping is enough, and a later memory_failure() will
> handle the folio if the UCE is triggered again - while a migrated
> folio would silently propagate the corruption instead.
> 
> Deterministic validation on v7.3-rc4-75-g62f4c998b297: order-4
> mTHP folios were brought into the stable "large, on LRU,
> PG_hwpoisoned subpage" state by pinning a sibling subpage with
> vmsplice and injecting MADV_HWPOISON on another subpage, which
> makes memory_failure() take the THP-split-failure path; after
> triggering compaction, /proc/kpageflags shows which poisoned
> folios moved.  The unpatched kernel migrated 16/16 poisoned
> folios and 16/16 clean controls in the same pageblocks; with
> this patch, 0/16 poisoned folios were migrated while their
> controls still migrated 16/16.


Was any of this written by an LLM?

> 
> Soft offline is not affected: it only sets the poison marker after
> its own migration has succeeded.
> 
> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> ---
>  mm/compaction.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index a049415512c6..491adcbc5313 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -1093,6 +1093,14 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>  		if (unlikely(!folio))
>  			goto isolate_fail;
>  
> +		/*
> +		 * Migrating would copy the corrupted data into a fresh
> +		 * folio with no poison marker; skip, as memory hotplug
> +		 * refuses to migrate such folios for the same reason.
> +		 */
> +		if (folio_contain_hwpoisoned_page(folio))
> +			goto isolate_fail_put;
> +
>  		/*
>  		 * Migration will fail if an anonymous page is pinned in memory,
>  		 * so avoid taking lru_lock and isolating it unnecessarily in an

See

https://lore.kernel.org/linux-mm/20260707090136.52904-1-kaitao.cheng@linux.dev/

-- 
Cheers,

David

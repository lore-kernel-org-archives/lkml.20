Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510893D3008
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175397; cv=none; b=YI5nvpP4vtnaHNhApZtbvtSV/Bmwxzzi2BvRaB41keX05CTAXAUEeJydhhZBn3VO/ciMPOrMhxc7MDLSrBuAIE6TGNrGKSIQET80NKTgSN1/BzAR2wvz16GX3rxm7IBbQ8b1DTMN9M/5hcFsRpcZ+ghIwCHs1QW0Xc8/v4fsCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175397; c=relaxed/simple;
	bh=2FGAuKBAnVuvrfl8BpuL8kcvxiiWdtByJuqPiUkCZuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clbJWO56yRNMly3D3jFWpga9ROy8vUpXV7yX5YWjSi1AzlUW1YEFI7hAoP2mI3PbRJufOSUlP0xm8XVNSKSTqb/6IvqUmI9j081o+5Dq/C2fkq1N1DSG7vS88yG33ERGD11/HmpxdLMjWyoViSHXWuWfWjZ9IOy2U5YCYOo7T98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o7TqchhN; arc=none smtp.client-ip=91.218.175.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o7TqchhN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2FGAuKBAnVuvrfl8BpuL8kcvxiiWdtByJuqPiUkCZuM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788175392; v=1; x=1788780192;
 b=o7TqchhNCUQPemqRNT2gvBRZmZK0ygz944LWsDMvlsrvIx0pEYBlNb8wwtxCcugBieAYzmhv
 D/Te9edx8V3nBipXDANvuJCHqfd2GgN7pdXfDUMqTGpiuu2bh3WpXhg3D6Rw76onlwJitkSKpzh
 xfuWM6zLRG7lWg1LpepcLfhQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 18fcbf994d3f25d8;
	Mon, 31 Aug 2026 11:23:12 +0000
X-Mizu-Trace-ID: 18fcbf994d3f25d8
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Usama Arif <usama.arif@linux.dev>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hannes@cmpxchg.org,
	lance.yang@linux.dev,
	ziy@nvidia.com,
	kasong@tencent.com,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	balbirs@nvidia.com,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/huge_memory: do not touch frozen folios in deferred_split_isolate()
Date: Mon, 31 Aug 2026 04:23:03 -0700
Message-ID: <20260831112305.466147-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831091514.1879786-2-kirill@shutemov.name>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 10:15:13 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:

> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> deferred_split_isolate() probes each queued folio with folio_try_get().
> folio_try_get() failure is treated as a lost race with folio_put(): clear
> PG_partially_mapped, correct MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, take
> the folio off the queue.
> 
> The folio_put() race is the most common case for !folio_try_get(), but
> it is not the only option. Another scenario is folio_ref_freeze().
> 
> A zero refcount in such cases does not mean the folio is going away.  It
> means "don't touch me" and current deferred_split_isolate() doesn't
> respect it. It can lead to unqueueing folios from the deferred list for
> no reason:
> 
>     CPU 0                            CPU 1
>     ---------------------------      ------------------------------
>     freeze a mapped folio            deferred_split_scan()
>       folio_ref_freeze()               folio_try_get() fails
>                                        folio_clear_partially_mapped()
>                                        NR_ANON_PARTIALLY_MAPPED--
>                                        folio off the queue
>     give up, put it back
>       folio_ref_unfreeze()
> 
> The folio is still partially mapped, but it is no longer a split candidate.
> Nothing queues it again until part of it is unmapped once more.
> 
> Skip the folio instead: whoever freezes the folio, owns it and owner is
> responsible for its fate. It also covers the folio_put() case:
> __folio_put() unqueues the folio via folio_unqueue_deferred_split().
> 
> Nothing is lost by skipping.  Everything that frees a queued folio
> unqueues it first, and folio_unqueue_deferred_split() clears
> PG_partially_mapped and brings MTHP_STAT_NR_ANON_PARTIALLY_MAPPED down
> on the way:
> 
>     __folio_put(), folios_put_refs()   mm/folio.c
>     __folio_migrate_mapping()          mm/migrate.c
>     shrink_folio_list()                mm/vmscan.c
> 
> __folio_freeze_and_split_unmapped() does the same by hand, under the
> list_lru lock it holds across the freeze.  A freeze that ends in
> folio_ref_unfreeze() leaves a folio that is still partially mapped and
> still belongs on the queue.
> 
> Fixes: 8422acdc97ed ("mm: introduce a pageflag for partially mapped folios")
> Reported-by: Lance Yang <lance.yang@linux.dev>
> Closes: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
> ---
>  mm/huge_memory.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index ced400f72d43..6281ed993243 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -4590,22 +4590,11 @@ static enum lru_status deferred_split_isolate(struct list_head *item,
>  	struct folio *folio = container_of(item, struct folio, _deferred_list);
>  	struct list_head *freeable = cb_arg;
>  
> -	if (folio_try_get(folio)) {
> -		list_lru_isolate_move(lru, item, freeable);
> -		return LRU_REMOVED;
> -	}
> +	/* Lost race to folio_put() or the folio is under folio_ref_freeze() */
> +	if (!folio_try_get(folio))
> +		return LRU_SKIP;
>  
> -	/*
> -	 * We lost race with folio_put(). Read folio state before the
> -	 * isolate: folio_unqueue_deferred_split() checks list_empty()
> -	 * locklessly, so once removed the folio can be freed any time.
> -	 */
> -	if (folio_test_partially_mapped(folio)) {
> -		folio_clear_partially_mapped(folio);
> -		mod_mthp_stat(folio_order(folio),
> -			      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
> -	}
> -	list_lru_isolate(lru, item);
> +	list_lru_isolate_move(lru, item, freeable);
>  	return LRU_REMOVED;
>  }

Acked-by: Usama Arif <usama.arif@linux.dev>

>  
> -- 
> 2.54.0
> 
> 

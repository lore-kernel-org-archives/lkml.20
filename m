Received: from mta1.migadu.com (out-195.mta1.migadu.com [95.215.58.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029E4908B8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848741; cv=none; b=NUn1yujwmz3MI7rGzk5V7oi06AiuocOFCRLDO23L9UK9r2rhQncXUK9zXhzHcaUIFQeA+oikMtYuyfnh0ev8ed/H6K9Yfd9IaXbSIUu+C+7Xq0F8faaqPoPNPSacgdChxTaOi9rICZAQq1hZCTwI4vdYBrOIxVXHvhXri2MkN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848741; c=relaxed/simple;
	bh=47ud2sjFvuwpCPT/8aoyQa7HTi3PcHWzDdeGQYgymmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dinT+umpHXZ3xvoG6HCEwQh+e7SbEoKT6f6smRTff+OeZiLIycRERVfZ4hR9yguE3esew730E5aq44aMLZsMWh2A7FuzKcB9NCxJim9YDg1KIo1zjE46Wr4LE6K4/pUDsksR8lk/2CT+1BGu54G+FoB1USZw3p/aDC6KgMnAnuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jindaCvf; arc=none smtp.client-ip=95.215.58.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jindaCvf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=47ud2sjFvuwpCPT/8aoyQa7HTi3PcHWzDdeGQYgymmk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787848735; v=1; x=1788453535;
 b=jindaCvfeMYaDy/PpvPZFoxUobHxPwdNizSKib8zIQEBy5jqcHH+x41AASsQBgPWH+sYPDNC
 aWCo2YUpzB7ePeCdTrHFwwJUt1Q9O+Is2VS5laWrKLvZb3N9FTeXdgjRqPrrqgT2YtpnRI5ROBZ
 oCFbeFSy+9jl514/Wfc/jUQw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 5f895ce9d536e3b4;
	Thu, 27 Aug 2026 16:38:45 +0000
X-Mizu-Trace-ID: 5f895ce9d536e3b4
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
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	balbirs@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH 1/5] mm/huge_memory: do not touch frozen folios in deferred_split_isolate()
Date: Thu, 27 Aug 2026 09:38:37 -0700
Message-ID: <20260827163838.1813081-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826162101.1314941-2-kirill@shutemov.name>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 26 Aug 2026 17:20:57 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:

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
> Reported-by: Lance Yang <lance.yang@linux.dev>
> Link: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
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

I think we might have a problem here for ZONE_DEVICE folios?

This assumes the final put always dequeues the folio, but ZONE_DEVICE folios
bypass the generic folio_unqueue_deferred_split() path.
With memcg disabled, this can leave a recycled folio linked on the
deferred-split list?

Should we dequeue folios in free_zone_device_folio()?
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
>  
> -- 
> 2.54.0
> 
> 

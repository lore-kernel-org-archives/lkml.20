Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415FA42848B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789910926; cv=none; b=VYYofsDeGgUgy3MLvKyFSDnUm/6ypmGe8RVYe7pPSd8RE3W+4GdaivxjKo7mvzY2fOqHyKVX8g48e+nQPVBxUO7mA8ctM2N8tawQJVXjOE3I30mzQ1PLwEnUp6SACiQBpkczyVCMtpMUS//koMFkNr75+RsCbFAk09pWx/3A0qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789910926; c=relaxed/simple;
	bh=TrOfoz90+kswxzJXergF/HK3rvuEH9Lz3DiPPvC1nkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kt1TwtvocZBUyX8rk5RfBoE13xqLNuT93atQ1/UrUWl0wCLm7aC5bfYm3eKEkz0c1HhFlEOdUxkfT44zkcOw6oaEa+YXAWtfIkKaajAwBQTQfvk3QNfwKF07tfW4urZUZeah0rNAjo5exxhLKR5WCaEQc3d9cGjIBdNrLtmqlFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GZw2XZ7s; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GZw2XZ7s"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TrOfoz90+kswxzJXergF/HK3rvuEH9Lz3DiPPvC1nkg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789910919; v=1; x=1790515719;
 b=GZw2XZ7sk16XX8TYiMc+pdwkxixx7LJQb5LFOlwX0B6Wf7dmnzZECT/e4h/zP+QzuUetHCqE
 +0WDJ3oEkCAJW0ua6YpQPz6As3G/PObvb6fugYRhcjOsgDne/UOlpVKCVcb+UVfGV+LXKdV4AeJ
 8hi3JFSrqTtLZbWt/htqbF6U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d4bbc0b7fbaa0cb1;
	Sun, 20 Sep 2026 13:28:39 +0000
X-Mizu-Trace-ID: d4bbc0b7fbaa0cb1
X-Migadu-Flow: FLOW_OUT
Message-ID: <1d61ee17-edbb-4491-a5e2-32aa2779d839@linux.dev>
Date: Sun, 20 Sep 2026 21:28:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: vmscan: put rotation-missed folios at the LRU tail
To: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20260920132030.3368138-1-ridong.chen@linux.dev>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260920132030.3368138-1-ridong.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/20/2026 9:20 PM, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> The page reclaim isolates a batch of folios from the tail of an LRU list
> and works on them one by one.  For a suitable swap-backed folio on an
> async swap device, it queues the folio for writeback and, after finishing
> the batch, puts the folio back to the head of the original LRU list.
> 
> Meanwhile the page writeback flushes the queued folios in its own,
> independent batches.  For each folio it writes back it calls
> folio_rotate_reclaimable(), which tries to rotate the folio to the LRU
> tail.  But folio_rotate_reclaimable() only takes effect once the folio has
> been put back by reclaim.  If the async swap device is fast enough, the
> writeback can complete a folio while reclaim is still working on the rest
> of the batch that contains it.  In that case the folio stays near the head
> and reclaim will not revisit it before wrapping around, causing a cold/hot
> inversion: a clean, written-back folio that should be a prime reclaim
> candidate is kept ahead of hotter folios.
> 
> commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back while
> isolated") addressed this for MGLRU only.  The traditional active/inactive
> LRU has the same problem, reported at [1].  A reproducer is available at
> [2].
> 
> Rather than re-reclaiming those folios (which would drop the swap cache
> that may still be useful for a future hit [4]), restore the rotation that
> was missed: when move_folios_to_lru() puts a folio back, add it to the LRU
> tail if it looks like it missed folio_rotate_reclaimable() (inactive, not
> mapped, not dirty and not under writeback).  A referenced folio is left at
> the head so it still gets a second chance, and a folio with an unexpected
> reference (e.g. a GUP or speculative pin) is left at the head because it
> cannot be reclaimed yet anyway.  A new do_rotate parameter gates this so
> it only applies on the reclaim put-back path (shrink_inactive_list()), not
> on shrink_active_list() where the list order is already deliberate.  This
> approach was suggested by Barry Song [3].
> 
> Only the traditional LRU is handled here.  MGLRU already retries such
> folios via its own clean-list retry pass in evict_folios(), so it is left
> unchanged.  The same do_rotate scheme could later replace that retry pass
> to unify both LRUs, which is left for a follow-up.
> 
> Test result with [2]:
> 
>    Without patch:
>      cat memory.usage_in_bytes
>      1073700864
>      cat memory.memsw.usage_in_bytes
>      1413124096
> 
>      free -h
>                    total        used        free
>      Mem:           1.6Gi       1.2Gi       299Mi
>      Swap:          1.0Gi       678Mi       346Mi
> 
>    With patch:
>      cat memory.usage_in_bytes
>      1071140864
>      cat memory.memsw.usage_in_bytes
>      1413423104
> 
>      free -h
>                    total        used        free
>      Mem:           1.6Gi       1.2Gi       322Mi
>      Swap:          1.0Gi       328Mi       695Mi
> 
> After applying the patch, the difference between
> memory.memsw.usage_in_bytes and memory.usage_in_bytes is close to the swap
> "used" value reported by 'free -h'.
> 
> [1] https://lore.kernel.org/linux-kernel/20241010081802.290893-1-chenridong@huaweicloud.com/
> [2] https://lore.kernel.org/lkml/46037a37-4cf6-448e-a94b-30a4d16e8814@linux.dev/
> [3] https://lore.kernel.org/lkml/CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com/
> [4] https://lore.kernel.org/linux-mm/20260911121341.178028-1-alex@ghiti.fr/
> 
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
> 
> v1 -> v2:
>   - skip referenced folios (FOLIOREF_KEEP) and unexpectedly pinned folios
>     when rotating to the LRU tail.
>   - add test result to the commit message.
> 
>   mm/vmscan.c | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index e200ce3eb056..91295070ca33 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1971,7 +1971,7 @@ static bool too_many_isolated(struct pglist_data *pgdat, int file,
>    *
>    * Note: The caller must not hold any lruvec lock.
>    */
> -static unsigned int move_folios_to_lru(struct list_head *list)
> +static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
>   {
>   	int nr_pages, nr_moved = 0;
>   	struct lruvec *lruvec = NULL;
> @@ -2018,7 +2018,19 @@ static unsigned int move_folios_to_lru(struct list_head *list)
>   			continue;
>   		}
>   
> -		lruvec_add_folio(lruvec, folio);
> +		/*
> +		 * Put clean, unreferenced and unpinned folios that may have
> +		 * missed folio_rotate_reclaimable() at the tail to avoid
> +		 * cold/hot inversion.
> +		 */
> +		if (do_rotate && !folio_test_active(folio) && !folio_mapped(folio) &&
> +		    !folio_test_dirty(folio) && !folio_test_writeback(folio) &&
> +		    !folio_test_referenced(folio) &&
> +		    folio_ref_count(folio) == folio_expected_ref_count(folio))
> +			lruvec_add_folio_tail(lruvec, folio);
> +		else
> +			lruvec_add_folio(lruvec, folio);
> +
>   		nr_pages = folio_nr_pages(folio);
>   		nr_moved += nr_pages;
>   		if (folio_test_active(folio))
> @@ -2135,7 +2147,7 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
>   	nr_reclaimed = shrink_folio_list(&folio_list, pgdat, sc, &stat, false,
>   					 lruvec_memcg(lruvec));
>   
> -	move_folios_to_lru(&folio_list);
> +	move_folios_to_lru(&folio_list, true);
>   
>   	mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
>   					stat.nr_demoted);
> @@ -2246,8 +2258,8 @@ static void shrink_active_list(unsigned long nr_to_scan,
>   	/*
>   	 * Move folios back to the lru list.
>   	 */
> -	nr_activate = move_folios_to_lru(&l_active);
> -	nr_deactivate = move_folios_to_lru(&l_inactive);
> +	nr_activate = move_folios_to_lru(&l_active, false);
> +	nr_deactivate = move_folios_to_lru(&l_inactive, false);
>   
>   	count_vm_events(PGDEACTIVATE, nr_deactivate);
>   	count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE, nr_deactivate);
> @@ -5115,7 +5127,7 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   			folio_set_active(folio);
>   	}
>   
> -	move_folios_to_lru(&list);
> +	move_folios_to_lru(&list, false);
>   
>   	walk = current->reclaim_state->mm_walk;
>   	if (walk && walk->batched) {

Sorry for sending this patch without a version tag. I've resent a new one; 
please ignore this patch.

https://lore.kernel.org/lkml/20260920132519.3369946-1-ridong.chen@linux.dev/

Thanks.

-- 
Best regards
Ridong


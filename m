Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A4734D385
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792114817; cv=none; b=FvVCXiHt83IfL3vKfj0S3Ii4TCSM9hhyRLx6DG2vjyX/lsBMWQI5hFa+UMRG8tbbd0FPgiAucMGtduGgSR6/ClrAi/LFhxz0P3mRnwWpOLI3eeHaVNIczAg5XXtOnVT8ZqIHcrSo7WhJrFsRNdcHfUWgHf6Ti8mvDrL4vS+fVZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792114817; c=relaxed/simple;
	bh=149cB7lQJwwFSjUFc078C8Z+CTiTOYCeYfXZbY85vGM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bba+H7Dil7DWJYyKc7mz/nRgf3/YKVrL9f3xGDuJLU5rpGFL81M7UC97ZFZyniv4K1eyl5u/H2S1D924HBf6jpa9yLHF09uz9g7tJrQmP2zUnlUSEvymgKCAyouyABzsyEEXOyI0qbaucau5DwiTFNg4o313XodX3udu/mS1TeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uheqztBX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uheqztBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9ACD1F000C4;
	Fri, 16 Oct 2026 01:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792114815;
	bh=OqA+IMC6CUvEx2INsJZJI6SA5Kzqwelaql3bEKHklyk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=uheqztBXAXmG9qw9vDm3YiF69UyyJRc8UyD8oZ/QJCGiWUlESf3T5A6EZIGVHIl3v
	 xIyts3pqh187rqqiyrQMYwSn96WnREf9JT70qJEtQxry1kL8gmoIIFmIjfIHAIcUf5
	 59w11rC4mmi44ykUtuRfqBlUBIYtzcdUOX7xWA5o=
Date: Thu, 15 Oct 2026 18:40:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>, Chris Li
 <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Youngjun Park
 <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/swap: fix swap_cache_get_folio() returning a folio
 that left the swap cache
Message-Id: <20261015184014.715dcdd3a25e18fd4df49e95@linux-foundation.org>
In-Reply-To: <20261015060528.302634-1-jiayuan.chen@linux.dev>
References: <20261015060528.302634-1-jiayuan.chen@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 14:05:27 +0800 Jiayuan Chen <jiayuan.chen@linux.dev> wrote:

> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> 
> swap_cache_get_folio() reads the folio from the swap table and takes a
> reference with folio_try_get(), without any lock. If the folio is
> removed from the swap cache and freed in between, and its memory gets
> reused, folio_try_get() still succeeds and we return a page that has
> nothing to do with the swap entry:
> 
>   CPU 0                                  CPU 1
>   do_swap_page()
>     swap_cache_get_folio()
>       swp_tb = swap_table_get()
>       folio = swp_tb_to_folio(swp_tb)
>                                          madvise(MADV_DONTNEED)
>                                            zap_nonpresent_ptes()
>                                              swap_put_entries_direct()
>                                                swap_put_entries_cluster()
>                                                  __try_to_reclaim_swap()
>                                                    swap_cache_del_folio()
>                                                    folio_put()   <- freed
>                                          page reused, e.g. as an anon
>                                          folio of another task
>       folio_try_get(folio)               <- succeeds
>       return folio
>     swap_update_readahead()              <- may clear PG_readahead on it
>     folio_lock_or_retry()                <- locks it
>     folio_matches_swap_entry() fails, unlock and put
> 
> filemap_get_entry() does the same lockless lookup for the page cache,
> and after folio_try_get() it rechecks the xarray, because the folio may
> have been freed and reused in between. swap_cache_get_folio() lost
> that recheck when the swap cache moved to the swap table.
> 
> So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead and
> takes the folio lock of someone else's page, before
> folio_matches_swap_entry() finds out the folio is not ours.
> 
> Recheck the slot after folio_try_get() and retry if it no longer holds
> this folio.

Thanks.

As always, when fixing a bug please fully describe the worst-case
userspace-visible runtime effects of that bug.

I asked $LLM for this and was told

: When the race occurs, a swap fault can acquire a reference to a
: physical page that has been freed and reused for an unrelated purpose,
: potentially by another process.  The fault handler may then clear that
: page's PG_readahead/PG_reclaim flag, wait on or acquire its folio lock,
: and potentially attempt to remove it from an unrelated swap cache.
: 
: These operations can interfere with unrelated workloads and may cause
: unexpected stalls, impaired reclaim or writeback, and potentially
: system hangs.  The subsequent swap-entry validation normally prevents
: the wrong folio from being mapped into the faulting process, and
: neither data corruption nor a kernel crash has been demonstrated.

Do you agree with this?  OK with me adding this to your changelog?

> Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap cache and switch API")

Given the above, I suggest adding cc:stable.

Do you and maintainers agree?



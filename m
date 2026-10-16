Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E1246784
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144683; cv=none; b=TDlM8/t+BXNeim2bOqqH9UtnOm8KvujFDGcN/UMun2xCN0TJPcn0c7sMuq6zq5w+kdJqhvFN6zP3wpaQK3X+tmzRLVBjHH/LYavTZxtNrnOCB4mlf1/TjnxBDDbho0MbBW9zPZ2dl7PTx23PsffFGSwmp3wd0eYcKCbyb09XXj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144683; c=relaxed/simple;
	bh=g/ue6j42PAMVBFYKRRP/60F/c70PufirmsQ+SYOrazk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UbnowcY0DxcDopSaF89nkePrPWLi5dWuoip889JVubSGABxkngSuc0QvavLP9A5sgMKb9TzOavjObeBMdsoOcKmylRUaQ9JYVGiZA3k6wP9GZAEKo18+bJ2C0+Lfe8dQV7j1cDrEgJ/0KwuqLsFj5GvdMqpkFhfzbNvUvXf5weo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=s2coRmpL; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="s2coRmpL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792144672; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hAt144Vk7k8qMXgrEGhDpPZonayJjWzttOQo4WX8s+E=;
	b=s2coRmpLq7mOznbe57IIu547L90JOB/Ts/7ngvo436tPI2nSB71mqltBuGSKTX0EkPIaqguktWB0nISuvmtZ1TsYBqeqXwKfOf7xxsl8Zrt+y2CaqRjfV6VJhk5dCIHaRagXyDiKjv+lFhCOqoMj6RADRJmOr4iaWuB2Run4K+s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R481e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XCuU.YY_1792144668;
Received: from 30.74.144.163(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCuU.YY_1792144668 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 16 Oct 2026 17:57:49 +0800
Message-ID: <27e5aadc-2d68-428f-a958-308e4a75c058@linux.alibaba.com>
Date: Fri, 16 Oct 2026 17:57:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] khugepaged: fix readahead lock inversion in
 collapse_file()
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org
Cc: david@kernel.org, ziy@nvidia.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, usama.arif@linux.dev, kas@kernel.org, jack@suse.cz,
 djwong@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 hch@lst.de, syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com,
 ngocthang2710.1999@gmail.com, willy@infradead.org, rppt@kernel.org,
 ljs@kernel.org
References: <20261016065920.4153-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261016065920.4153-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 2:59 PM, Lance Yang wrote:
> collapse_file() can end up calling page_cache_sync_readahead() with
> source folios from earlier in the range still locked. If truncate already
> holds mapping->invalidate_lock exclusively and is waiting for one of
> those folios, readahead blocks on the same invalidate_lock and neither
> side can make progress.
> 
> Do readahead in a separate pass before we start holding source folios
> locked for collapse. Keep page_cache_sync_readahead() and its existing
> policy, and drop each folio's lock and reference after checking that it
> is uptodate. If truncate or reclaim removes a folio between the two
> passes, roll back instead of doing readahead again with source folios
> locked.
> 
> Shmem handles swapin and fallocated folios through shmem_get_folio()
> without taking mapping->invalidate_lock, so it isn't affected by this
> lock inversion.
> 
> Reported-by: syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=16bf7cd0ebeb1de93aa5
> Fixes: 730633f0b7f9 ("mm: Protect operations adding pages to page cache with invalidate_lock")
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---

Thanks for the fix.

> Thanks to Nguyen Ngoc Thang for v2. David asked for volunteers, so I'm
> happy to take this over.
> 
> Some older stable trees lack the folio infrastructure used here, and the
> code will differ for each stable tree, so each backport will need quite a
> bit of rework and its own review. I'm not sure whether to Cc stable here.
> Once we agree on the fix, I'll send a separate backport for each maintained
> stable tree except 5.10, which isn't affected.
> 
> v2 -> v3:
>   - Replace the scan-wide invalidate_lock and page_cache_ra_unbounded() with
>     a preparation pass using page_cache_sync_readahead().
>   - Roll back on a new page cache miss during collapse.
>   - https://lore.kernel.org/all/20260913163644.122133-1-ngocthang2710.1999@gmail.com/
> 
>   mm/khugepaged.c | 42 +++++++++++++++++++++++++++++++-----------
>   1 file changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index ef5cd6fda34f..b3f67617caf0 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2262,6 +2262,34 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>   	new_folio->index = start;
>   	new_folio->mapping = mapping;
>   
> +	if (!is_shmem) {
> +		/*
> +		 * Populate the range before accumulating locked source folios:
> +		 * readahead may block on invalidate_lock.
> +		 */
> +		for (index = start; index < end;) {

why drop xas_unlock_irq()?

> +			folio = filemap_lock_folio(mapping, index);
> +			if (IS_ERR(folio)) {
> +				page_cache_sync_readahead(mapping, &file->f_ra,
> +							  file, index, end - index);
> +				folio = filemap_lock_folio(mapping, index);
> +				if (IS_ERR(folio)) {
> +					result = SCAN_FAIL;
> +					goto rollback;
> +				}
> +			}
> +			if (!folio_test_uptodate(folio))
> +				result = SCAN_FAIL;

Do we need to check PG_uptodate after locking the folio? If we 
successfully lock the folio, doesn't that mean the read I/O has 
completed? The following code also checks the writeback flag, so the 
uptodate check seems unnecessary to me.

> +			index = folio_next_index(folio);
> +			folio_unlock(folio);
> +			folio_put(folio);
> +			if (result != SCAN_SUCCEED)
> +				goto rollback;
> +		}
> +		/* drain lru cache to help folio_isolate_lru() */
> +		lru_add_drain();
> +	}

Could we factor this code out into a small helper?

> +
>   	/*
>   	 * Ensure we have slots for all the pages in the range.  This is
>   	 * almost certainly a no-op because most of the pages must be present
> @@ -2320,17 +2348,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>   			}
>   		} else {	/* !is_shmem */
>   			if (!folio || xa_is_value(folio)) {
> -				xas_unlock_irq(&xas);
> -				page_cache_sync_readahead(mapping, &file->f_ra,
> -							  file, index,
> -							  end - index);
> -				/* drain lru cache to help folio_isolate_lru() */
> -				lru_add_drain();
> -				folio = filemap_lock_folio(mapping, index);
> -				if (IS_ERR(folio)) {
> -					result = SCAN_FAIL;
> -					goto xa_unlocked;
> -				}
> +				/* The range changed after the preparation pass. */
> +				result = SCAN_PAGE_LOCK;
> +				goto xa_locked;
>   			} else if (folio_test_dirty(folio)) {
>   				/*
>   				 * This page is dirty because it hasn't


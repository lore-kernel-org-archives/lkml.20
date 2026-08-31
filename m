Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC523EAB4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138529; cv=none; b=mruBH5P+nQ5TE172WfV+ioYZTRPv+6zqXOzrW55kbjI1TgeOSbo3ypO2sYBspeb5EonOlcdrVu1w8nFN5+qEjmP8/n/0J0aK9k+TDi222eAwXlT/EzKMyog3L5bP6ysuw60/JEUBAp7QcZyKsF1whZAUtpOgJL/us+CaFmX/QcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138529; c=relaxed/simple;
	bh=Oe4S4dZBXDiu5QO05FCf3FatGvkk7jfJITlDwQ8HIlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4VfNJx68ULOjwWFOsMJgBahaaKNn7yOjzsPJAKqfhmN7Kz+1HlFuIt2r1igikgrNB8TfhCqYLopTfoBHVSZpGIE/q4TW9fHRpEJx9yW5UUoL5eRKnhFjPFZ4K0vx+rW9OS0pwBedXGwuzuvvMCUHaifXO9iq2I9Xgqi6yDuYu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=QKB9cHnh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gkl78bz6; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="QKB9cHnh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gkl78bz6"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id F33E313802BC;
	Sun, 30 Aug 2026 21:08:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 30 Aug 2026 21:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788138525; x=
	1788145725; bh=pcYiN9hPzomn6VxGROJwyZUszyLpRHLmB252cOSS7hk=; b=Q
	KB9cHnhUWgTu9hvARDDLODrYe0li0yA6vbEaTwAwlw3+OP1jjwnRy0SZE/wAAn8a
	yXKYXoU0ztH80oEYgvBEiYHRMOTXdmxOBEy0fp+xF5CS3nnkkOigKUKb8PBs/nZ5
	/WkoBmO/6Q+4Yl2YDjUC5RdHxA8/QcifculInqr27ul59CHQal/MSTXs+6KzDiaq
	9vugpHiP4bgkbQZ8+7tcrStFH01ZxTNij3nmq8iTu3Lx6nIhw46+D3N6gEIjv35K
	mx6oYEFat3ZxhX/Ua1Myhr9eBASXqRrfbqbFGnk0EgjTmOMJsxEd5ONoHWQCsiG8
	Kee6cPhlGm5nAVYjo+oOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1788138525; x=1788145725; bh=pcYiN9hPzomn6VxGROJwyZUszyLpRHLmB25
	2cOSS7hk=; b=gkl78bz6aDUoVq84Gt7gki848LZXCwqsjV8JXwvCaUTijWqEyMe
	wlqXi5tn/+d/ughWDHYI8dax5Q/+IkYP9DNLqMrUCP6Q5HRy8SQ3IjjxLjT7RRCI
	4MRkw543ndM31NPy8pXubF4BDDbyqCIViMRTFYmJXTlQPUKkYOKJ7Ep8otmq46Cd
	xY6gH5Gj+YbF5b0ykAHXvlfsldZjP6WPCitPLmOfNoR2ihSkrtd95tK1qOZK8Gis
	K98LZ2tsHtHG9ZqLTcrYz3juvplhS0bKpP++l1b+tP4pFb8biDqaLfrceumuxb3C
	XM2rMghyfYvwsDF8TJvmLZOPE88vOelnZ8g==
X-ME-Sender: <xms:HNSUatIeImfMy28s6i4xl9c4joT_JoUitOtg7829AUwPdvA6J2xLqA>
    <xme:HNSUarJSPBZ5efeNCMakAKPBIE7maM_kFE6hSjOqfuo1JLW-6xeElkP7Y_D-LDNDC
    P7VHmarDr1ZhVJhTX79Gwr__LafM9CaC4nHESD3FnVVZx5YiIm8G3Q>
X-ME-Received: <xmr:HNSUaqDWTfRnaD9lKmkzcjpnBH-1IPE6Je3L3NKu6UlhopSP2QOSnuUG4ho>
X-ME-Proxy-Cause: dmFkZTGGc+Gu02ZdKCpCP7OHlx60+GgUxx9Kp0lhdu4a7JV4r06bP7qbYHA4pM9NdUMpZq
    e0bRKzG4e5HaXReDIHw2HDX4OdNSWUbvTxTb/gWhDOyFpeTCkwqTH1HsO+ez23ugIz8654
    0YnkyqemaNLncDt92kb0RKKa8fLdHDJ+oRwKchffgDSYDsWbM0SAbgteyqm62dXMH460ra
    XCWEVNSishKsYyzMo+6AtFAkkqJje8OxjKjgaCgIFHND4ep/ZrVml49rxw5rKaG+uj9qPu
    Wu+nwR0G9Bk5flygkGddDdNw/7IHwAntv6m6tWMDoSbQcBp3vHbyLKJH80TdQlWUYByzXU
    xKmu+1GWZzB1tJZvwYPcDXqVDL1UWzKceOPckXnscB743wDgbgdT+SMqdC+rr6nj66S467
    wtwfACoL+Uf/Vh+192DoVuhOy+7BWAlQACwg6ZExRzeJBAxhirr3Lk6BCVus1hJPXol5Os
    D0F3Ex/ISdR2hzNp8o21ibXH1KvMXAGPLDGfw4Rga+IAS8+X5kGK6svZMx1vrMIYF4VOt6
    Ns75qlfQlwPaIDX6tYSwfNVZj/fO5WufstpP4Rn9pXTsu/ZgvpDIrhp56v3A89W1xjY9JR
    jtIewJdkCdZ6R4x/Xy8zFP7VJf6xmUVvRrEnumehMNNKsFmizQyUsg60YsOQ
X-ME-Proxy: <xmx:HNSUamk-XLERBLNYMXAftqvObgfRhzYodPzL1C0TlaxeC3GHG2pULw>
    <xmx:HNSUauGdxsUe6TB_MYLRVJUBdraSo1uX2Nic9u7bXgIep_Dou0xNig>
    <xmx:HNSUatgRBMvYz_JDH6dI-IcRghjNgMGjcdT53OUcD5G6-yeChCHk6Q>
    <xmx:HNSUaueNUQ4ETDyKD4U76Nz1pSpF2UcHT9naC5GaxTYKii2m95Sb3g>
    <xmx:HdSUauELfQ2DzjV0JYv2felkyOb8QaPQ2S1H6xFn0TbV4I8XmORakdIX>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Aug 2026 21:08:44 -0400 (EDT)
Date: Mon, 31 Aug 2026 02:08:43 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v3 07/18] mm/huge_memory: move EOF trimming into the file
 split helper
Message-ID: <apTTW3q5Gj0razE4@thinkstation>
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-7-9b43f5163238@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-swap-thp-cleanup-v3-7-9b43f5163238@tencent.com>

On Fri, Aug 21, 2026 at 02:55:20AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Instead of receiving @end and @nr_shmem_dropped from the caller, the
> file split helper now computes the EOF boundary and trims pages beyond
> it itself, as this is only needed for file split.  This drops the
> redundant parameter passing and sanity check.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Couple of nits below.

> ---
>  mm/huge_memory.c | 42 +++++++++++++++++++-----------------------
>  1 file changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 69d3a6889f9e..01c8cf428595 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -4029,14 +4029,26 @@ static int __folio_freeze_split_unmapped_anon(struct folio *folio, unsigned int
>  static int __folio_freeze_split_unmapped_file(struct folio *folio, unsigned int new_order,
>  					      struct page *split_at, struct xa_state *xas,
>  					      struct address_space *mapping, bool do_lru,
> -					      struct list_head *list, enum split_type split_type,
> -					      pgoff_t end, int *nr_shmem_dropped)
> +					      struct list_head *list, enum split_type split_type)
>  {
>  	struct folio *end_folio = folio_next(folio);
>  	struct folio *new_folio, *next;
> +	int nr_shmem_dropped = 0;
>  	struct lruvec *lruvec;
> +	pgoff_t end = 0;

No need to initialize.

>  	int ret;
>  
> +	/*
> +	 * __split_frozen_folio() may need to trim off pages beyond

Does it require update?

	 * The loop below may need to trim off pages beyond

...

> +	 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
> +	 * seqlock, which cannot be nested inside the page tree lock.
> +	 * So note end now: i_size itself may be changed at any moment,
> +	 * but folio lock is good enough to serialize the trimming.
> +	 */
> +	end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
> +	if (shmem_mapping(mapping))
> +		end = shmem_fallocend(mapping->host, end);
> +
>  	xas_lock_irq(xas);
>  
>  	/*
> @@ -4101,10 +4113,9 @@ static int __folio_freeze_split_unmapped_file(struct folio *folio, unsigned int
>  			continue;
>  		}
>  
> -		VM_WARN_ON_ONCE(!nr_shmem_dropped);
>  		/* Drop folio beyond EOF: ->index >= end */
> -		if (shmem_mapping(mapping) && nr_shmem_dropped)
> -			*nr_shmem_dropped += nr_pages;
> +		if (shmem_mapping(mapping))
> +			nr_shmem_dropped += nr_pages;
>  		else if (folio_test_clear_dirty(new_folio))
>  			folio_account_cleaned(new_folio,
>  					      inode_to_wb(mapping->host));
> @@ -4125,6 +4136,8 @@ static int __folio_freeze_split_unmapped_file(struct folio *folio, unsigned int
>  
>  fail:
>  	xas_unlock_irq(xas);
> +	if (nr_shmem_dropped)
> +		shmem_uncharge(mapping->host, nr_shmem_dropped);
>  	return ret;
>  }
>  
> @@ -4161,9 +4174,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  	struct anon_vma *anon_vma = NULL;
>  	int old_order = folio_order(folio);
>  	struct folio *new_folio, *next;
> -	int nr_shmem_dropped = 0;
>  	enum ttu_flags ttu_flags = 0;
> -	pgoff_t end = 0;
>  	int ret;
>  
>  	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
> @@ -4240,17 +4251,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  
>  		anon_vma = NULL;
>  		i_mmap_lock_read(mapping);
> -
> -		/*
> -		 * __split_frozen_folio() may need to trim off pages beyond
> -		 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
> -		 * seqlock, which cannot be nested inside the page tree lock.
> -		 * So note end now: i_size itself may be changed at any moment,
> -		 * but folio lock is good enough to serialize the trimming.
> -		 */
> -		end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
> -		if (shmem_mapping(mapping))
> -			end = shmem_fallocend(mapping->host, end);
>  	}
>  
>  	/*
> @@ -4266,16 +4266,12 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  
>  	if (!is_anon) {
>  		ret = __folio_freeze_split_unmapped_file(folio, new_order, split_at, &xas, mapping,
> -							 true, list, split_type, end,
> -							 &nr_shmem_dropped);
> +							 true, list, split_type);
>  	} else {
>  		ret = __folio_freeze_split_unmapped_anon(folio, new_order, split_at, true,
>  							 list, split_type);
>  	}
>  
> -	if (nr_shmem_dropped)
> -		shmem_uncharge(mapping->host, nr_shmem_dropped);
> -
>  	if (!ret && is_anon && !folio_is_device_private(folio))
>  		ttu_flags = TTU_USE_SHARED_ZEROPAGE;
>  
> 
> -- 
> 2.55.0
> 
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863026;
	b=v43FPcKyxQUo/EFMswkqLK9HDPrfx2J0vbF2jTQvJ0NPB9xGzhV7IVevLpUTymyqQ8xo
	 h8BHuNfEWvyDubVlSiDnBZ/grHAOJGyV1zukH7nx7YBii9il3vW2D5G2Yxm8qO0qBFGtX
	 ToA3kJVvn9kccr5M6XNZ63IesaL103aAfR92tLTFBmu1fwrV46NSAu0sf4dWyQkM5MbOp
	 cxaDCUVycFD5AY+1/T13DCXjB7OwUkvlNX7GfoZxdBt2njVUvnkhZjAOls3oe8P5Ka+Z5
	 kyj4xzQWksdN/oKkgXX2ZuwA+TLQZIzi83G+doRv09H9/FHstSoSNQzo+nh6LqU24eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863026;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ikTLCztXVjoeaw96G/as+sU0mQkTLug+7IxY5by8NuA=;
	b=AL+C7tu8yPgzbDw7iooVN+n/SuxYbR73+8EwtAb7zO+BhYDYQugJXPJcmKbkekDPYOeG
	 jEItl04d/OJOS3use2ZN61JgwQ98PXuekdMmjxfwHrHaUZMYsjppwilo0v+VYNHob33kI
	 2HogP8E5vvfwce7lv+F1mT+a1N4CzrRx4yt9Y/P0SrQF7HItnGCe9zBnM5GRibUjGpY2p
	 5Ph9jH1jUfVru64YVFJ5t1jHxBvqwI+gLxn8BAJKbn0csYpMPbz3syIQmAtyUrDW+cHcD
	 amNMv/oKXW2QiPL4oRVJ0kgLeDH9isYjG4cyX/UtW3IDbkRHEKwY/Lxno8XvZ716MUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YRz5t8jC;
	arc=none smtp.remote-ip=91.218.175.82
Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC0C606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BC0C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YRz5t8jC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MwUlEU6UA+1p7eL2QxWULcMIS2F/vL+3zPY714jTYPE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794863022; v=1; x=1795467822;
 b=YRz5t8jCIKWPIThCDXl56Dh7elLKSSS/bRd9skcpLvKx0+WWfSfWQTapAupzV4HI/mMdeV44
 oxpcEVPqlQtUjtJYvqvGUF7RFhGfDudOqCkDGdZ+SPKnALEDBHntagkbMg6oxuL8CnxxzEnxwhC
 8OWyrDOrZMKhSxkcg5E7rFOY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d132572e0baffed5;
	Mon, 16 Nov 2026 21:03:42 +0000
X-Mizu-Trace-ID: d132572e0baffed5
X-Migadu-Flow: FLOW_OUT
Message-ID: <32c5f583-1b2c-4ca2-864d-bc98cd24cb73@linux.dev>
Date: Mon, 16 Nov 2026 16:03:39 -0500
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
Subject: Re: [PATCH] mm/util: fix retry detection and handling in
 snapshot_page()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shivank Garg <shivankg@amd.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Shao Mingyin <shao.mingyin@zte.com.cn>
References: <20261116-snapshot_page_fix-v1-1-8e425984e8d1@kernel.org>
Content-Language: en-US
From: "Luiz Capitulino (Red Hat)" <luiz.capitulino@linux.dev>
In-Reply-To: <20261116-snapshot_page_fix-v1-1-8e425984e8d1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/26 9:12 AM, David Hildenbrand (Arm) wrote:
> snapshot_page() detects races with concurrent folio split+construction by
> checking whether the given page still falls into the folio. Unfortunately,
> we have an off-by-one error in there, and we should be checking for
> "ps->idx >= nr_pages", because idx 0 is valid.
> 
> For example, we might currently report a tail page at idx 1 as faithful,
> although the snapshotted folio is now a small folio.
> 
> However, there is one complication: As we don't hold a folio reference,
> folio_nr_pages() can return 0 on races (or when called from page freeing
> code). Handle that by just setting it to 1 in that case, so we don't
> wrongly report a head page as "page does not match folio".
> 
> In addition, we should reset ps->flags when retrying, by just resetting
> it to PAGE_SNAPSHOT_FAITHFUL. Otherwise, PAGE_SNAPSHOT_PG_BUDDY and
> PAGE_SNAPSHOT_PG_IDLE from a failed attempt could stick around.
> 
> These races are fairly rare, so this is not really critical, we simply
> report something slightly wrong. No need to CC stable.
> 
> Fixes: d863a12108f2 ("mm/util: introduce snapshot_page()")
> Reported-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Closes: https://lore.kernel.org/r/20261115004657890Pz8ERDf5nCtE-B6M7KFzu@zte.com.cn
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Luiz Capitulino (Red Hat) <luiz.capitulino@linux.dev>

> ---
>   mm/util.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/util.c b/mm/util.c
> index 80f6c714844f2..338f259b00351 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1406,9 +1406,9 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
>   	int loops = 5;
>   
>   	ps->pfn = page_to_pfn(page);
> -	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
>   
>   again:
> +	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
>   	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
>   	memcpy(&ps->page_snapshot, page, sizeof(*page));
>   	info = ps->page_snapshot.compound_info;
> @@ -1437,14 +1437,15 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
>   
>   	if (ps->idx < MAX_FOLIO_NR_PAGES) {
>   		memcpy(&ps->folio_snapshot, foliop, 2 * sizeof(struct page));
> -		nr_pages = folio_nr_pages(&ps->folio_snapshot);
> +		/* On races, or when freeing pages, we can read 0. */
> +		nr_pages = folio_nr_pages(&ps->folio_snapshot) ?: 1;
>   		if (nr_pages > 2)
>   			memcpy(&ps->folio_snapshot.__page_2, &foliop->__page_2,
>   			       sizeof(struct page));
>   		set_ps_flags(ps, foliop, page);
>   	}
>   
> -	if (ps->idx > nr_pages) {
> +	if (ps->idx >= nr_pages) {
>   		if (loops-- > 0)
>   			goto again;
>   		clear_compound_head(&ps->page_snapshot);
> 
> ---
> base-commit: d164c7d754f0e1f020298366ea92430e62476089
> change-id: 20261116-snapshot_page_fix-fae185e61c94
> 
> Best regards,
> --
> David Hildenbrand (Arm) <david@kernel.org>

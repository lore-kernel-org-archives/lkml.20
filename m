Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FF4207A20
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789446131; cv=none; b=cgBlnxOsl4m/C/Eia6r9lV5RMV2qoK4x+77atIUwkLB+ykBeRvxdEYLVHbCiuWnLF2VMV+vYgx63BcSXtqNmxN0CdU5Wx86dTpchz1j9X7ECCM7zSKqZjjYeZ4nyVBJXXOZa+FMFpOzF6gBYPcS3I+ZSNKaG+kuI/YsHgmeZ5Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789446131; c=relaxed/simple;
	bh=EgLmNwknFRSvaTUZKsKACV02Xuqlig9xHcS9B7vnmbU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=p3RtpIBStr5B8aaUrTtaa6XLzL9oEVksznXHI7WlXokTRegGd598D/ZG657OQWi/hvsZtZ5k7qV9JykxOK+jT4aPr6tofkSmNag3ZI+EDAB3+SpktsE4hu6Zt46h0zgCI18Kuj828YNrrNzbt0MBXgjFu9nsbP64R+8YTuRfXcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HjMkU9d+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HjMkU9d+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04171F00893;
	Tue, 15 Sep 2026 04:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789446129;
	bh=ift+8DOHb+25wOaqafeC4wcfvzXMnHSS8K6du3vmu8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HjMkU9d+BgVEFK7w9OEsa07Hxd+IEX0/9SPIjTm8q/qBwGp/Hib20MhNeAn2yF4qT
	 izlwmKZd2Y9HCX5CglHOMNjP1J6FtHorkkg/QuTp8qlaVXmsewQy9z/BbEEmOCT6ml
	 GmYcxgiFtalrqIO8ne4uIbK9LqgFyskfY28Dy+mk=
Date: Mon, 14 Sep 2026 21:22:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Muchun Song
 <muchun.song@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH] mm: Remove unused exact_nid parameter from
 memmap_alloc()
Message-Id: <20260914212200.75878c86ab806c7e09b6c69e@linux-foundation.org>
In-Reply-To: <20260914055130.44543-1-kaitao.cheng@linux.dev>
References: <20260914055130.44543-1-kaitao.cheng@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 13:51:30 +0800 Kaitao Cheng <kaitao.cheng@linux.dev> wrote:

> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
> mechanism") removed sparse_buffer_init(), which was the only caller of
> memmap_alloc() that passed true for exact_nid.
> 
> All remaining callers pass false, leaving the exact-node allocation
> branch unreachable. Remove the exact_nid parameter and unconditionally
> use memblock_alloc_try_nid_raw().
> 
> This has no functional impact.
> 

Latest development code has changed quite lot, but this was an easy reject
to fix:

> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -53,7 +53,7 @@ static void * __ref __earlyonly_bootmem_alloc(int node,
>  				unsigned long align,
>  				unsigned long goal)
>  {
> -	return memmap_alloc(size, align, goal, node, false);
> +	return memmap_alloc(size, align, goal, node);
>  }
>  
>  void * __meminit vmemmap_alloc_block(unsigned long size, int node)


--- a/mm/sparse.c~mm-remove-unused-exact_nid-parameter-from-memmap_alloc
+++ a/mm/sparse.c
@@ -215,7 +215,7 @@ struct page __init *__populate_section_m
 {
 	const unsigned long size = PAGE_ALIGN(sizeof(struct page) * PAGES_PER_SECTION);
 
-	return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), nid, false);
+	return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), nid);
 }
 #endif /* !CONFIG_SPARSEMEM_VMEMMAP */
 


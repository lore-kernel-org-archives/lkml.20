Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47043E315E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538210; cv=none; b=FuGn8vAIFvf9RqMrDTNM0XlXl6X7ygqiCzOM2zTVB6FE82AV43jiEj1jXe8wJakvCTD3XpzRKrzrg+XJ6VomINYI8u46+El9wduivQjP3O/v8soik1JXUbonat/24/61ALOh8VeO7d1oaoxfdIJvkTSAubuhwJsFQ39tHzeI7C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538210; c=relaxed/simple;
	bh=P2rW3hKxGUs4nS+9TbwXfR4YDLmtL/y0lG03tWYudJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciu9coZCp9zfJZoDasHENRIi1vqHp3yewu2bNleIvG9jvY3qbUj+7WZ1nq1ZjDvXxivY3jbJ1syiyjojdEQ10VteAzRznumg6gjKKTRnXdnb6U1mjvX2CY7PUpP8hnS8Qun0gkV7K9WAc0y7RaujPNFJwDIxKY31jOX0HRnLiE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=ipShBVYG; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="ipShBVYG"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-936623c6dd3so274279185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788538206; x=1789143006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O/dj2tdiAd1cTUZz8ylHlEPfPG8XqvRkzCQtnk9erCM=;
        b=ipShBVYGUEPVo/2xJcwbG8HL69uayIEmWrV9qfp3YrpAq1vKwLSCgwjOEEF4wYoP0e
         sKqEWfuatCdPtXWRMihqoXAnjjIx9Rtksb18qhi/3nMSk4gA5/Kx+lKQLFOlvvWEYHxc
         7xIACYFAbw39B3PyMKMzu1Grac/91Zv5mmQP3Og9jqTuntnd/kfiNoeFuNIj07I0xrXL
         nSVYfcZKW1AHXvAmOVpDHMA+Jz9miNOIeX3DhkX7SvoDWq5b5X4apmAXPq+LsK3hu3Wx
         EL/KYgjj/pD7C1C3C9AvT0+FB2qjvHm/u1Jdu4py9eG2aZHnmBQ29OFQwsaGRWbU1xl5
         BaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538206; x=1789143006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/dj2tdiAd1cTUZz8ylHlEPfPG8XqvRkzCQtnk9erCM=;
        b=dkfI/YgAJuwCMzwcPqPGCH7WRf/BG0roltJG3X2GZnKNx31eynY6Ruj/3AwoXp9ZXV
         UVqzqcd06eTTELfYeA7ctyIRtn4uO3WBHYvcOV4NFxBZz+RTahhoPEbpIRUwyPGCgGjm
         sS50cuyWXT+/hVigs/Ql8D4zVrlh+m5SedLyTC5voErkw7SpbmKQ6PlCnfcBYS+O8qKf
         VJhRYEKsWKUZa/89lDeOxqAIg7Uu4WXtI8eAqh+2/FXwb9vNVlUwBJJ5lLq1QD/3z5Yf
         rQoSO9CY9+mEwnpXbX014Hvy0apZ0eic0thg9uJ/VsIF0rSSOQxgBvbJ2tBjy5e2eR6K
         kIdQ==
X-Gm-Message-State: AFuF++l6UUmgab7mOt8+CbinAJuYsBv5XSrgExjep0GRxODhr4jbqw33
	t1l4DWbVEyYu5cP40+uG561rOBxJYuI0qt2a50oY1yyLD2j63OIzXLIgpds0Jj68gE2gN0NcEcu
	I2p1ZZUnrTw==
X-Gm-Gg: AYBFou1jH8wKiJKIa8XqGYJl2DQGWuMWAs5dEXZtiG9LXIkWUpNQfwnV6pvScRDBz4I
	J2BmUu8tgxtVk0TGUKDaSgn1TeDdkwg3hVuzNEwYEPh1BcDtB5JzJHD8RCb8Z75Woh8fa2wbA5E
	GgbpW8Zo5jzK7FnuNWHNlBdYTB7+RNjA3qiNRAHkKxbKFfjG3606z7oMK3jl1WD1ijo5XUtaUQs
	sq40aA84QqyWbQrVbAzt0ZBSSnOw149ZfkZt5NfKAvINF8qDc82yojF0jPu9h6n3dBSQLS+UHDF
	q8/iqyW90QNo/K0xyOlwMpdCrKCm23m5WdMmBzG8amI3qIuLoISP5jqqGIsU76oy8FXb9vRt1KY
	5W/WjCNwqCR4Ah04vCip3Bew5a0laXARy9oJ+OMpVmhIv+yWW4tfpN1yB23tUFRTGpYb4OmCgRX
	fpBgclIrX1dlSv1h58ZDXtt8d/MIiO3LrmYA9r
X-Received: by 2002:a05:620a:6cc6:b0:930:f285:5ee9 with SMTP id af79cd13be357-9396e0b2fc3mr1194176885a.20.1788538206229;
        Fri, 04 Sep 2026 09:10:06 -0700 (PDT)
Received: from localhost ([2603:7001:f100:501::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104067b125sm23869576d6.29.2026.09.04.09.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:10:05 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:10:00 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Salvatore Dipietro <dipiets@amazon.it>
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, abuehaze@amazon.com,
	akpm@linux-foundation.org, alisaidi@amazon.com, blakgeof@amazon.com,
	brauner@kernel.org, dgc@kernel.org, dipietro.salvatore@gmail.com,
	djwong@kernel.org, jackmanb@google.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, mhocko@suse.com, ritesh.list@gmail.com,
	rvvandan@amazon.com, stable@vger.kernel.org, surenb@google.com,
	vbabka@kernel.org, willy@infradead.org, ziy@nvidia.com,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	Brendan Jackman <brendan.jackman@linux.dev>
Subject: Re: [PATCH v4] mm/page_alloc: avoid direct compaction for costly
 __GFP_NORETRY allocations
Message-ID: <20260904161000.GC6641@cmpxchg.org>
References: <20260904115629.3993331-1-dipiets@amazon.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904115629.3993331-1-dipiets@amazon.it>

On Fri, Sep 04, 2026 at 11:56:28AM +0000, Salvatore Dipietro wrote:
> Commit 5d8edfb900d5 ("iomap: Copy larger chunks from userspace")
> introduced high-order folio allocations in the iomap buffered write
> path.  When memory is fragmented, each failed costly-order allocation
> enters __alloc_pages_slowpath() which runs direct compaction and
> drain_all_pages(), causing a 0.38x throughput drop on PostgreSQL
> pgbench (simple-update) with 1024 clients on a 96-vCPU arm64 system.
> 
> The root issue is that direct compaction is too expensive for hot
> allocation paths that have fallbacks to smaller allocations.
> __filemap_get_folio_mpol() already marks higher-order allocations with
> __GFP_NORETRY | __GFP_NOWARN, signalling that the caller can handle
> failure.  However, the page allocator still attempts full direct
> compaction for costly orders with __GFP_NORETRY, which is unnecessarily
> aggressive when the caller will simply retry at a lower order.
> 
> For costly-order allocations with __GFP_NORETRY, clear
> __GFP_DIRECT_RECLAIM at the very start of the slowpath, before
> can_direct_reclaim, can_compact and the nofail checks are evaluated.
> This makes the entire slowpath treat the request as non-blocking: no
> direct reclaim, no direct compaction and no drain_all_pages() IPI
> across every CPU. kswapd (and in turn kcompactd) is still woken further
> down for background defragmentation, so compaction keeps working for
> long-term system health while being removed from the latency-critical
> direct allocation path.
> 
> Allocations that also request __GFP_THISNODE are exempted.  That flag
> pairing identifies the local-node-first THP attempt issued by
> alloc_pages_mpol() (mempolicy.c), which relies on direct compaction to
> form transparent huge pages.
> 
> Test environment:
>   Hardware:  AWS EC2 m8g.24xlarge (96 vCPU, arm64)
>              12x 1TB IO2 32000 IOPS RAID0 XFS
>   OS:        AL2023
>   Kernel:    v7.3-rc1
>   Database:  PostgreSQL 18.4
>   Workload:  pgbench simple-update, 1024 clients, 96 threads, 1200s
> 
> Results (average of 3 runs, TPS):
> 
>   Config                   Avg TPS      % vs Baseline
>   baseline (no patch)       59,408       -
>   With this patch          155,409      +161.6%
> 
> Link: https://lore.kernel.org/all/20260403193535.9970-1-dipiets@amazon.it/T/#t [v1]
> Link: https://lore.kernel.org/linux-mm/20260420161404.642-1-dipiets@amazon.it/T/#u [v2]
> Link: https://lore.kernel.org/all/20260710143437.12379-1-dipiets@amazon.it/T/#u [v3]
> Fixes: 5d8edfb900d5 ("iomap: Copy larger chunks from userspace")
> Cc: stable@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Dave Chinner <dgc@kernel.org>
> Cc: Ritesh Harjani <ritesh.list@gmail.com>
> Cc: linux-mm@kvack.org
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-xfs@vger.kernel.org
> Signed-off-by: Salvatore Dipietro <dipiets@amazon.it>

Looks good to me, thanks for keeping at it.

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>

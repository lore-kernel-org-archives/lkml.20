Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747E305E1F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787871022; cv=none; b=lMAJd/uMO0o5mAG8IZtemq1yMhJShyZc2whWJyD6Uf1OuLjYqpJhYf6+9rcKAr4/hm2kWZRziCz4eu/8AEB2WtOESJtYpGgETWuJdo4dsx6KW3y2eXnZGIj11obNijsjmCSN+DcR0xDzEeVEQxpJF5kZESicXxZORgjo2X/QWYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787871022; c=relaxed/simple;
	bh=IaddE9FgVri+4Jsb9k/07EXrkrSjcH9dZxAETt/uggk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EGS36h232J/PA4qFdTIcYf22rMQ8DzU5AvGv6e4S5WLgl4k02RCQGR7L3b6KSOU2fBHy1UpEVZGS+iqYhYOsXek+OjL63GxqxmrsfJI9N8o1/B411H/I+Vje9LoAmJzKlRPZGLuVHMvLLeg7Vq3SPlpgsH4f1uk9HvnfT+zMoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YqeGqYYh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YqeGqYYh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0801F000E9;
	Thu, 27 Aug 2026 22:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787871020;
	bh=+hrqml8c1MbGVS6iqvEsIMrnzdqhBIjUR56tKZiSMOs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YqeGqYYhzoVgUUpvm6KZZd2OD/Z3uRoWsdGSckp6y1yuo07avs2dtVccmTgA3rAuN
	 xLTD5R+6EJC33dMiEMn4dyGGtaDB66YqnWGpg7sTHXp6ji8UYr73RO7H2hsn4DHnFL
	 5FpE2ib+D8JF9JtjbvfhRS9FJFFgyt7rYD+KzpgI=
Date: Thu, 27 Aug 2026 15:50:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, usama.arif@linux.dev,
 brauner@kernel.org, david@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v4 0/4] make unused huge shrinker memcg aware
Message-Id: <20260827155020.530e28b0afa3b43fede9aa9c@linux-foundation.org>
In-Reply-To: <cover.1786955972.git.zhengqi.arch@bytedance.com>
References: <cover.1786955972.git.zhengqi.arch@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 17:03:24 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:

> Changes in v4:
> Changes in v3:
> Changes in v2:

Thanks for the diligent versioning info.  fyi, it is conventional to
maintain this below the --- separator.  It's not really the most
important part of the [0/N]!

> 
> The shmem unused huge shrinker maintains a per-superblock list of inodes
> whose tail huge folio extends beyond i_size.  Because this list is not
> memcg aware, reclaim triggered by memcg A can scan inodes across the
> entire superblock and split huge folios charged to unrelated memcg B,
> causing unexpected impact on it.
> 
> In the worst case, memcg A has no reclaimable shmem at all, making the
> reclaim entirely useless and incurring unnecessary latency.  We observed
> this in production, where page lock contention during split caused
> multi-hundred-millisecond stalls:

Ugh.  That's the most important part!

>   tid 11340 comm scanner locked a page for 182264 us! kstack:
>           unlock_page+1
>           split_huge_page_to_list+3135
>           shmem_unused_huge_shrink+767
>           super_cache_scan+329
>           do_shrink_slab+291
>           shrink_slab+533
>           shrink_node+400
>           do_try_to_free_pages+206
>           try_to_free_mem_cgroup_pages+262
>           try_charge_memcg+591
>           mem_cgroup_charge+136
>           __handle_mm_fault+2431
>           handle_mm_fault+194
>           do_user_addr_fault+462
>           __do_page_fault+176
>           do_page_fault+48
>           page_fault+62
> 
> Usama's recent patch [1] prevents the shmem unused shrinker from being
> invoked during memcg-level reclaim altogether, but this is overly
> conservative: we can do better by reclaiming only the shmem charged to
> the reclaiming memcg.
> 
> This series converts the shrinker list to a memcg-aware list_lru, so
> that non-root memcg reclaim walks only candidates charged to the
> reclaiming memcg.  Global reclaim, root memcg reclaim and shmem quota
> reclaim retain their existing global semantics.
> 
> To avoid pinning a dying memcg through a long-lived CSS reference, each
> inode stores an obj_cgroup reference instead of a mem_cgroup reference.
> The list_lru add/delete paths resolve the current memcg from the objcg
> under RCU, staying consistent with list_lru's own memcg migration on
> offline.

Sashiko said a few things and they look disturbing-if-true:

	https://sashiko.dev/#/patchset/cover.1786955972.git.zhengqi.arch@bytedance.com

(Apologies if this has already been considered - we don't have ways of
tracking all this (yet, I hope) apart from personal memory and personal
memorys are quite fried at present)


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF3E3537C7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283755; cv=none; b=aIFvcW+jUs0mVv98SgmBbZnb3Yif+RVQUm00OMn5aGlJ+1WQoDsKLXKPqnOMa9GlcR8DzXvM16JYyhI51ZDX2FimDA71QcCFKG85wS4liqb37In9qJ5DFm17ciMP4SvEA4M3AFLDEjDhq3fJrACm1mPs+3Ewz1pr7FZNk0XEeeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283755; c=relaxed/simple;
	bh=/FFrJYTVM7e3EQoU6dqccPYv02h/IASAcqRVL1kZWyQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IO25XEvVGmyobe86q8bgr7pYSkXNOZzEyitR26H/BXI9xtTp7iUaZt1gT5gxEDXgEcDiIRAuEEP9yFZliiKwN2RiNIHFRy0WQrQOk+zTi7hQLcLLSNLE78ZPqbj1LAqgB8Zs/PcWTXIFA6pjdkrTaBnS8zblr5JabPUEOny/TkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sQHF9wmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sQHF9wmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8191F000E9;
	Tue,  1 Sep 2026 17:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788283753;
	bh=tnzUsYmBzTkG/qduuXF36go4ShLApC/ylajzDtl8Juw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=sQHF9wmbR7uB2TkEtzgH81EVp6gsoWuhzfGCCboeFIcl1DKbRtUJEiAmdpdSvFuEb
	 0vWSSJF4hE1nqSM6y3rKl84LvWBFB8SJ33xlL3sjoATBlS3DNAz1C+EQ9oGoIL7ns3
	 tIOoZ6CdwNeU+P8gNBFaxhC1X5VZAVV9j8CNFVQc=
Date: Tue, 1 Sep 2026 10:29:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal =?ISO-8859-1?Q?Koutn=FD?=
 <mkoutny@suse.com>, Lance Yang <lance.yang@linux.dev>, Qi Zheng
 <qi.zheng@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, Muchun
 Song <muchun.song@linux.dev>, Dave Chinner <david@fromorbit.com>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>,
 Xunlei Pang <xlpang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
Message-Id: <20260901102913.5c571bf153bc3830905c6770@linux-foundation.org>
In-Reply-To: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Sep 2026 19:51:04 +0800 Qinyun Tan <qinyuntan@linux.alibaba.com> wrote:

> With cgroup.memory=nokmem, shrinker_memcg_alloc() fails with -ENOSYS
> for shrinkers without SHRINKER_NONSLAB, and shrinker_alloc() falls
> back to a non-memcg-aware shrinker.  On this fallback path,
> shrinker->id is never assigned and keeps 0 from kzalloc(), which is a
> valid id belonging to whichever memcg-aware shrinker registers first.
> 
> __list_lru_init() copies shrinker->id unconditionally, so every
> list_lru backed by such a fallback shrinker (thp-deferred_split,
> zswap-shrinker, workingset shadow nodes, superblock lrus, ...) ends
> up with lru->shrinker_id == 0 instead of -1.
> 
> Under nokmem the list_lru collapses to the shared per-node lists, but
> __list_lru_add() still calls set_shrinker_bit() against the memcg of
> the added object.  Most list_lru users are unaffected because their
> objects resolve to a NULL memcg without kmem accounting, but the THP
> deferred split queue holds user folios, which are charged regardless
> of nokmem.  Since no memcg-aware shrinker can register under nokmem,
> shrinker_nr_max stays 0 and every memcg's shrinker_info has
> map_nr_max == 0, so the first folio added by khugepaged triggers on
> every boot:
> 
>   WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x99/0xa0
> 
> On systems where a SHRINKER_NONSLAB shrinker (btrfs, xfs) did register
> and expand the maps, there is no warning; instead bit 0 is set
> spuriously for an unrelated shrinker.
> 
> shrinker->id is only meaningful while SHRINKER_MEMCG_AWARE is set,
> and all readers inside mm/shrinker.c already check the flag before
> using the id.  Make __list_lru_init() do the same and fall back to -1,
> so set_shrinker_bit() is never reached with a bogus id.  The stale
> shrinker->id itself is left as is; cleaning that up is a separate
> topic.

Thanks.  I'll queue this for test and review.

> Fixes: 03375203e1da8 ("mm: do not allocate shrinker info with cgroup.memory=nokmem")

Worth a cc:stable, I assume.

> ---
> 
> Verified on a machine booting with cgroup.memory=nokmem and
> CONFIG_TRANSPARENT_HUGEPAGE=y: the warning fires once per boot from
> khugepaged, disappears when nokmem is removed from the command line,
> and no longer triggers with this fix applied and nokmem set.

That's useful info.  I'll move it into the changelog.


Sashiko thinks there's a problem with cgroup_disable=memory as well:
	https://sashiko.dev/#/patchset/20260901115104.2944996-1-qinyuntan@linux.alibaba.com

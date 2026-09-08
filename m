Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324E34FDE4F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864058; cv=none; b=dO46GnHn3cPBv9ZYP/xS5/xrJY4jiN++46wBaDb2tLpVGO0mAMj8rNX4Op/hupkd++l2tlI40VZj205n1O6/ig5vXSl/4o3tepo7Z3zt4tUGdjqOqV5k5jd7JsWG0z/FGAXwR/1hLAJDePlywGz9cYWLLXcsXEZjKsOs4cx0+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864058; c=relaxed/simple;
	bh=6MrkOvxvKnW7TUEX38uVtxuQVcubBsW6gHoqh8Zyu5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8JwpAfdRouBVFqHds7ydeAwz4RCPSShXIc6QKUJs1NOZPgSVNsLE1MkqUhve5TulFWeuq0NCnocZj/ChnD+lSLIXbB3UvW7/Dq++8z0ixz/9+qLF8w6NHR3aSBIH9ifEY6DqvsMnKHkjcyZcX2kYwG+Hx0SygypMKZ0zOccW4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3aU1Y8T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3aU1Y8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3401F00A3E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788864056;
	bh=6MrkOvxvKnW7TUEX38uVtxuQVcubBsW6gHoqh8Zyu5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h3aU1Y8Ttw8AHk97pm1z5GvUGuxS/5NzZCoZ7+H59y1UFTmbVQjWt33n8tLl8zWQ3
	 UVfQyyqbqdBCgwHMvGzwe9jnCy7WRIjxkm5kujPLQKakZqOj0ryl52CAntlCTWS+Bu
	 IYkqVN+mYg+cSxVUeEJLaP8Np6nt1Uo57l5YP+DWjFYI7baiVgCbzj1Z+EGO1etbFo
	 Xb41ZHljrfpZasXBU7C4/wQ2144N+asOVnf/vgDhUU2v865aRvYECko7n0KNueDd3b
	 ZshO3qHhIcwEl4uC4EZxfhRLSHSj3dHDD/IHHSGxxwcyY3Mmeo4gR2IpOXjKHlLhBJ
	 yuKkPwyQ2A8Tg==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-939b5ded99dso100762085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:40:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByzg8gudk6eYKuJwgG652evaGrM8kej4KM6LIv8FwKL4b+6sWFQaVe7vrEFzPxTFeHR3tzmq4X0sX29pOA=@vger.kernel.org
X-Gm-Message-State: AFuF++mid2QgAuuOWsfFjHPcYlUfuHfyHqrsIEEA8H3jlSOKaq+LmEQn
	4/8g8Gkh73NYWgFUPY7bz5hiyF5MKaI3TobSoD6v2i8t+Sc+ygrz7xr7QzAH6IEQAn9BdnAGS9y
	1op14pxs1OTD3FTArB6lN1v2U0jmd81w=
X-Received: by 2002:a05:620a:2903:b0:939:13a7:70f0 with SMTP id
 af79cd13be357-939802f7939mr3057881485a.5.1788864056096; Tue, 08 Sep 2026
 03:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901190123.3511535-1-noren@nvidia.com> <20260901204449.GK3004@cmpxchg.org>
 <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com> <20260901220917.GM3004@cmpxchg.org>
 <69C018F5-A1C8-47AD-9567-3497AA6808EC@nvidia.com> <20260902160417.GN3004@cmpxchg.org>
In-Reply-To: <20260902160417.GN3004@cmpxchg.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 8 Sep 2026 18:40:43 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w-GF06J0kd1X9Hxzfcs3YtpO6KRGLAv1w4j1L1Zt=ibg@mail.gmail.com>
X-Gm-Features: AcwNN1VT6lhf2AnAT1VcPvsMl-I0MnH4-pnEeOyIikJkyUIQO06ZRhqlMrKECeA
Message-ID: <CAGsJ_4w-GF06J0kd1X9Hxzfcs3YtpO6KRGLAv1w4j1L1Zt=ibg@mail.gmail.com>
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Zi Yan <ziy@nvidia.com>, Nimrod Oren <noren@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Nirmoy Das <nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo0325@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:04=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
[...]
>
> The idea is that the pageblock maintains contiguity for the largest
> size you routinely expect to allocate.
>
> The page allocator is very passive right now, and it doesn't work
> super reliably. But even in the current regime, smaller blocks have a
> better chance of containment.
>
> For example, when the ever-growing page cache runs out of movable
> block space, it spills into unmovable free space. When the next
> unmovable request finds no space, it runs LRU reclaim - which is more
> likely to free space in one of the many movable blocks. And so the
> next block is poisoned. Smaller blocks have a better chance of filling
> up natively, means less pressure to spill into incompatible ones.
>
> And the higher min_free_kbytes, the more likely there are still native
> options when the zones are down to the watermarks. E.g. better odds
> there is still unmovable free space, you just need to reclaim some
> movable/reclaimable space elsewhere to satisfy the watermarks.
>
> I've been working on making this more robust with the huge page
> allocator / defrag_mode stuff: instead of falling back and poisoning a
> block, invoke reclaim/compaction to produce a neutral block that can
> be converted entirely.
>
> It's the same idea as the higher min_free_kbytes and watermark
> boosting, but it is more targeted at the end result: readily available
> space in compatible or convertible blocks.
>
> But with that active regime, oversized pageblocks are even
> worse. You'd pay ongoing compaction work to produce a level of
> contiguity that you don't actually need.

Hi Johannes,

This could also be true when running 16KB or other mTHP sizes,
such as 32KB or 64KB, on a system with 4KB base pages and
2MB pageblocks.

Proactive compaction would try to create 2MB pageblocks, even
by migrating mTHPs, but 2MB isn't actually needed for large
folios on the system.

So here is an mTHP-friendly compaction RFC from Bo (Cc: Bo):
https://lore.kernel.org/linux-mm/20260825043833.2659350-1-zhangbo56@xiaomi.=
com/

The idea is to let compaction create mTHP orders rather than
2MB pageblocks, with much lower cost and greater efficiency.

I'd be interested to hear if you have any comments on it.

Best Regards
Barry

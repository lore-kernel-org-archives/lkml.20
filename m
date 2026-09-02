Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D14369D72
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369219; cv=none; b=KqgKG5d843+BHC+Q4G0gry27EexXOC/08msSRaRC8dR8v2AUVs4c35syy0ItpvnSP3SXxUw8ZHxyDhESNQxCthyrQ5zIIGEXLIDn8lQTzbvfdX5Y5IvEeZltIsj+zxJDzgCBnaBwsF/5s+h/IKbJuSrzYXGKNnVy5bTtR0ZgEuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369219; c=relaxed/simple;
	bh=f3nwn87c4Lpe8vKpDrR7AuSrNKE1exH0c3AsnhQC674=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sd1UE7yiSREopDgjX3L2Cv094UhtDakyJ8awnAmIVF/Yf7Gmk+0lrUbI/Es024zJM0qE86GkNs/iF56aa1h9zDzHTTS2EVd0NChzTEqnkng/x95Wdh6cKwWjCih1x/OW4jgZjDr/Uqb0nM1N8DR4LVmzmMZOVS1pDv9RbmoPQ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeTJKXiE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeTJKXiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E581F000E9;
	Wed,  2 Sep 2026 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788369217;
	bh=f3nwn87c4Lpe8vKpDrR7AuSrNKE1exH0c3AsnhQC674=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WeTJKXiEAAgVeCmFM7XaKiqi5fZ+Y3lNsfTK/Bq8aBKIC4WQ+3BTzNnia733l5ix6
	 AST44JtLrtspR3BPEwZ5Bs9PfINVL9AmYLP/HSiU9+RZy1JgVRHMQvOEaRMFdLPrTf
	 ak/FYGrNQeNNyVwzzjHkFmLsmvUD0Lny4efliBEe2ukoey4EtzOS34eWP47aPU6ttJ
	 MGulQsimJNVx0gyeVXTGMHN/D1V62hIvLy6t/Yq/GPvN9uf2q0tg1ehZLGTDsGclKz
	 /zFtjpyeeWtfr0RIf3emP1pU98Sf7OXPzmnXeY1tm9ZdBsb/QR0ZM6UEzAge0XPjub
	 Lqx26o60RmGqw==
Date: Wed, 2 Sep 2026 18:13:30 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Zi Yan <ziy@nvidia.com>, Nimrod Oren <noren@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <aphWz3Ww41jIG7Bs@gremlin>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260901204449.GK3004@cmpxchg.org>
 <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>
 <20260901220917.GM3004@cmpxchg.org>
 <69C018F5-A1C8-47AD-9567-3497AA6808EC@nvidia.com>
 <20260902160417.GN3004@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902160417.GN3004@cmpxchg.org>

On Wed, Sep 02, 2026 at 12:04:17PM -0400, Johannes Weiner wrote:
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

It strikes me that a lot of THP problems are really compaction problems.

>
> And the higher min_free_kbytes, the more likely there are still native
> options when the zones are down to the watermarks. E.g. better odds
> there is still unmovable free space, you just need to reclaim some
> movable/reclaimable space elsewhere to satisfy the watermarks.

I mean in general, yes, but the question is how much. This isn't really an
argument for retaining what we have, and as you say below, it's not really
clear what how much is.

>
> I've been working on making this more robust with the huge page
> allocator / defrag_mode stuff: instead of falling back and poisoning a
> block, invoke reclaim/compaction to produce a neutral block that can
> be converted entirely.
>
> It's the same idea as the higher min_free_kbytes and watermark
> boosting, but it is more targeted at the end result: readily available
> space in compatible or convertible blocks.

I wonder whether compaction needs to be improved before we can do that
sanely?

>
> But with that active regime, oversized pageblocks are even
> worse. You'd pay ongoing compaction work to produce a level of
> contiguity that you don't actually need.

I agree having 512 MiB page blocks on 64-KiB arm64 is a bad idea, but I
feel like the entire mechanism needs some degree of rethinking before that
kind of change is done.

Like I said in my other reply, I see this problem as consisting of the
short term (resolving real world pain people experience now) vs. the long
term (reworking compaction, reclaim, and how page blocks function).

>
> > > Seems to me the excessive min_free_kbytes is just a symptom of a
> > > deeper problem.
> >
> > Yes, our anti-fragmentation mechanism does not work as we expected,
> > so that we need an excessive min_free_kbytes to get khugepaged working.
> > I wonder why reclaim cannot get the extra free memory instead of
> > reserving it via min_free_kbytes. Maybe we need a watermark boost
> > when some consecutive THP allocations are seen to achieve similar
> > effect of boosting min_free_kbytes?
>
> I'm just wondering what the easiest way forward is to fix the ARM 64k
> page problem.

I mean you're not alone :) we've had a whole host of proposals all of which
were rejected, and you just rejected another...

This is why I suggested the 'if you are concerned about reserves being >X
then cap them at X' proposal.

(v2 of this patch)

https://lore.kernel.org/linux-mm/20260831075635.2244437-1-noren@nvidia.com/

That way nobody is changed, and only really huge page size gets capped.

I mean that's still a possible short-term way forward given this approach
was rejected?

>
> Yes, optimally, reclaim would work to satisfy compaction space by
> itself. We've seen it fail at that before, though.
>
> How critical set_recommended_min_free_kbytes() is today is a question
> that neither of us has a clear answer to. It's from 2011 and a lot has
> changed. However, knowing Andrea, I'm willing to bet he added this
> based on seeing a need in testing data. And I would actually expect it
> to work better now with proactive compaction, since that has a better
> chance of turning low-order chunks of that volume into pageblocks that
> can be converted instead of needing a poisoning steal.
>
> It's a change of long-standing behavior for everybody. It has a
> regression risk and requires careful evaluation and testing.

See other mail for thoughts on this :) I mean I share your concerns, but I
worry that we continue to persist in doing things because 'that's how they
were always done'.

>
> Meanwhile, adjusting the pageblock size on 64k page arm configs has a
> much smaller blast radius, appears to be the right move ANYWAY given
> what pageblocks are for, and makes the min_free_kbytes a non-issue.

Well it doesn't make it a non-issue, it redefines the size of page blocks
while the rest of the THP code continues to treat PMDs as first class
citizens.

I wonder if Kiryl's work to make PMD _not_ be the 1st class citizen of THP
will make such a change more reasonable.

Perhaps he has thoughts?

--
Cheers, Lorenzo

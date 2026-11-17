Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911390;
	b=fXemPpl0L2VuIFlwFkMUxK+WRSAjH3r1oIrDcH6zs//EpILu/4459U8uQXkq3xxXxoFb
	 LjL8FVgcgmXwibzwo3GItmScvCYW9C+/pBTrRyyXsXI6su4FyyHlMNPmcGmHkt4kLmcv7
	 M2eixt860HSb32WKzf5HXT1LdBu9H2pRLQ81jVeig7Bfnh8txlrnEXL4V/M94EjII3emw
	 Yh1fafrmBaL3Fq7y8zpYM7CDXdEdsT8fBK1GksQK+ATDviVIuyQ+WuAcNXXhhToWNnFCD
	 ScEDKbP1MQqZsasG9EDC2zELBpiu5Sm8Je78IdO1yo3EWB7KsPLgt02Z1Yw2NQrdRyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911390;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kMMalkHqyexrRI9uTeursGHU/2uETz56pJsgymByLq0=;
	b=VaQgGp0dPHNfghfvS3WPtC8YMed53XwxV5liDj5uScIaZTgNC1u14EsAPE/BHb3fOKyn
	 nLyEG1whX7C0wdJO+6mxI9f9SBib05lNpP+3Ivx2bVpdzV+i3X68cPLhktM210jojUzSu
	 PfTHGjxHExdpJRPi5cyHeQig9tEgT9w3/z+Giamv89cCdGCaA2cpF/n15PX3Sihh2yakC
	 MJKSOXQENtNZ8/5NvX7gUHASvnfKA1lFgApNfn3g9ZFm92gtX/LnlRnPLixgh7kuKPStG
	 raDgokx3Fsbuo8I7vvZawMCmeEwN2YP38PEHyMJ9/SbCZH0z5/4lfFtBCBHFT9NG0aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9VnvS5U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8D0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9VnvS5U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B988C1F000C7;
	Tue, 17 Nov 2026 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794911389;
	bh=kMMalkHqyexrRI9uTeursGHU/2uETz56pJsgymByLq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f9VnvS5UX5+LIAeVYyYRIRpkL5m0lTRnBcuVKqy827ff1wba9e2isZsOrj6XCR/ik
	 EgdzcbUfaN0xZtXR22MmzlYwP1rm0ff/emQdmF9ctm7+5ZqAoKm8d+fw3TgjDVuPh+
	 SOfKUTpVcf+uRnwivTORXAnlFyNn2vfY8x/M9eVwhNhvpurhk0nUiZhjkIn16nxrUP
	 xW6DtboYWJFnd5fjxscJLfotDtTO2IBhXqQEVGF0nh2EjfX3XrKxy2xM/tGrV0SdDr
	 f00Sc/CjbszbamBbSTzIEo9UpxCsD2QGOOMdDGMGWsKbP1do6SJMy8ezzE4zbu1Qph
	 Vrin2ViTVkDRw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0C1EC1980047;
	Tue, 17 Nov 2026 05:29:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 17 Nov 2026 05:29:47 -0500
X-ME-Sender: <xms:mCz8aug91pNoR66em1YAWzlIThrX5Epv1ZIhi_Kq_8QTuZw3Lqt0fg>
    <xme:mCz8agg1iPkBuhsSNmNcLK3LNtrQqQNWSCySOOswlVx09ZZfR4zvp-EurLqTixLxs
    JFBg7UhMUS6AxyaFG168RjcZEEUmD6qm9BGWnUZMPRM3eiawNF8y-op>
X-ME-Received: <xmr:mCz8aqojE7bomun_BA0hgxs9p1QqMt-NlFnfo7O5gTaLHvic3P0R9FqL7mo>
X-ME-Proxy-Cause: dmFkZTFWht0HuXcLPxNLST5jGk7LEnSc4D1QzzdUn/dMpxot85529SlKu9p5b6DrbabwHb
    U1Qe8kzPDpQS/ETM1hDqgmCVEktjdOhhANEYt/LI80k9Q69nOSi6h0tcHNNU6FjfzwQwXh
    dygIdfWp2cmscSyQe2XvhShcOVYPiwajXDuDzUKj+tJ858wuSiY3qPHauvrgPvSlXq6Df0
    uUe0kRQh4jdjDqjwxcWNnVmUFE2g8/IcroHpvHWqlR7eEB1RQbH/Vb9K/yZ2VmpefvexOr
    /M6uW021gxUkfQ+yi+YpC310rSzvh/bTmuLORYOCAvsG0jP8FPKuJDTjA3Teg4/v9gznEQ
    cG8rIfCuXV/Y4EHkBmLiLzUqEOKYSS6zfgYxqyMS9rztZi6rk9QF8sHIEeKLXwADKHnqrr
    nwYmFArIggU5U5ZMdjjCUoeNzGDAu6cAESZ/ZaghRAe75DM1QD0fS/0Ch51y0R1Sb+v/oS
    6YETzi0Lq39gG+gDAWD2ZZgJDCKUaafY8two1BWSBB0WA8V9apq4oD8Jy5qvxhtpRhQWJ9
    2R4l2Z1nd2/lPBsARD2bSHYXkk7FMtr0LzX4Cy6tX1NmowJ/Up9JJfWhvkedtrys9KziTP
    dl+nt3DgrNrEpQN47uRmWgWrH7CPELhP+mgIk81lJMkI44b0GoOM2dKmnBHg
X-ME-Proxy: <xmx:mCz8amyV2qhW2qczQFdj0pybGNjjlEHdDeqtin34cQv1IJp9yehVZQ>
    <xmx:mCz8apz-12YK2dwhzoV7bSb3pq2xClcXWW20yjeI_JEv1rCXuTTWXA>
    <xmx:mCz8auamK2IpklSycQZm3OXNYbswF4V3Pz43koguSAWH7rt3h3VhPw>
    <xmx:mCz8aqm9QaTytRvHEqOl6qvgrBLh8yeVkhr0in9mRNe_0VeG2Z9ccw>
    <xmx:mCz8ajF43WNrC2vEOtTUqZEctJr_4ZxrF7Hje7WNvexSNWE0ytLVTwg_>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 05:29:43 -0500 (EST)
Date: Tue, 17 Nov 2026 10:29:42 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Dev Jain <dev.jain@arm.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] mm/compaction: do not skip the free scanner's periodic
 lock drop
Message-ID: <avwsUxvOymaJqcXX@shutemov.name>
References: <20261116125746.2897395-1-kas@kernel.org>
 <20261117013702.109081-1-sj@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117013702.109081-1-sj@kernel.org>

On Mon, Nov 16, 2026 at 05:37:02PM -0800, SJ Park wrote:
> On Mon, 16 Nov 2026 12:57:45 +0000 "Kiryl Shutsemau (Meta)" <kas@kernel.org> wrote:
> 
> > isolate_freepages_block() drops zone->lock, checks for a fatal signal
> > and calls cond_resched() at every pfn that is a multiple of
> > COMPACT_CLUSTER_MAX.
> > 
> > With a stride above one, the scan steps over a compound page, or over a
> > high-order free page it has just isolated, to a pfn that is not a
> > multiple of the stride.  From there it never reaches a multiple of
> > COMPACT_CLUSTER_MAX, so the rest of the pageblock is scanned without the
> > check, possibly with zone->lock held and interrupts off.
> > 
> > Count probes instead, and check every COMPACT_CLUSTER_MAX of them.
> 
> Makes sense to me.
> 
> > 
> > Fixes: 4fca9730c51d ("mm, compaction: sample pageblocks for free pages")
> 
> I understand you intentionally not Cc-ing stable@, buecase the user impact is
> not that bad.  I think that makes sense.  I just wanted to call out this for a
> case that it was not intentional.

Right, I have not see the actual user effect of the bug.

> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> >  mm/compaction.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/mm/compaction.c b/mm/compaction.c
> > index f1b2060eb201..4465c1551406 100644
> > --- a/mm/compaction.c
> > +++ b/mm/compaction.c
> > @@ -579,7 +579,7 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
> >  				unsigned int stride,
> >  				bool strict)
> >  {
> > -	int nr_scanned = 0, total_isolated = 0;
> > +	int nr_scanned = 0, nr_probes = 0, total_isolated = 0;
> >  	struct page *page;
> >  	unsigned long flags = 0;
> >  	bool locked = false;
> > @@ -599,13 +599,15 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
> >  		/*
> >  		 * Periodically drop the lock (if held) regardless of its
> >  		 * contention, to give chance to IRQs. Abort if fatal signal
> > -		 * pending.
> > +		 * pending. Count probes rather than pfns, as the scan does not
> > +		 * always land on a multiple of COMPACT_CLUSTER_MAX.
> >  		 */
> > -		if (!(blockpfn % COMPACT_CLUSTER_MAX)
> > -		    && compact_unlock_should_abort(&cc->zone->lock, flags,
> > -								&locked, cc))
> > +		if (!(nr_probes % COMPACT_CLUSTER_MAX) &&
> > +		    compact_unlock_should_abort(&cc->zone->lock, flags,
> > +						&locked, cc))
> 
> Why don't you let the later two lines unchanged?  No strong opinion, no
> blocker.

&& on the new line is odd to me.


> Reviewed-by: SJ Park <sj@kernel.org>

Thanks!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

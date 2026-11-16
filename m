Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825680;
	b=C7ezT5buSnbDFJoSaTFFrQd8xVZ1mvKUXaC1OFsk4ICt1kz/30qNONMuKojWxIBhnDkg
	 a00LIZhXR+tBo3VuvGwvi/sD9Lp9bEoDSq8WjQzdfQhFDgHSSgjl/v0Ih19gw+xteO5pA
	 UcT73gGKqQeIoebJU2xDfmeW9WNNyp7NDMGIn9gOfXv9JQrNiHe+HW1FjOQ1T+38jTiJo
	 ur+iZeahB8UJOLs3p1ZhEy13gbR8TXpU+W/deYxk2/i9Vek3sFXnPxRTe5TAk+hiqA+P2
	 1su5gIWshBVGo0Fr0bYQ4jLhL+IEobGh/9TVhmxBEK3GCJj1OKeV3u9ZNmLxytJBApg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825680;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mtA/R92C925aFVKDUjGI6ndZPtLKG+BE7ZufHgCQDo8=;
	b=M8nJEkbon0AkQYAsQn6uqTuWPBydO1EEM+E6do9MqdOcmgshGuRmk77wVZ04LJkODFGQ
	 tZEayzZJK4vxB3am/fLs8ES8gCgBlz+vzAxZgCP8KaDOCrYfPrCGvYT8csRtYkdsuofOb
	 AFZtwlmSdgr6tbNkf8M4o5FuqYABb6LfJFpLxjqHJ7Snbt05mSo533LZxaZqjzrCkMa0k
	 KqdDeluVdXUJeyj19eheJI4wUuFKCk1FVGj+soJ2k5eL5CVWw3MDOtBsT6m4zvf39AsIK
	 CuPmGFbfrfeEOFOXxHNXEMcmdKDtYO49hRmIDLLMV+qDwoPCmwfAvyPM/JlOreJ+3uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngpSOVeP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A4A606A893
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngpSOVeP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937011F000CB;
	Mon, 16 Nov 2026 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825680;
	bh=mtA/R92C925aFVKDUjGI6ndZPtLKG+BE7ZufHgCQDo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ngpSOVePFMDtjm1DFvzRnPE1XRgzCOD2oFWJ8d4Ream75ZBgI7koYW2I/saxoji/J
	 1+uCmmQeOMgoo+jshQgPUiPmss+TmNaGpwDyvXqgzQe/RWwgu+IJI4m6i6B61JMi/m
	 rCIP5rLDm2h19YGXLN94+rZXkioXU8QE1bQO60M2rkv1BDhCOIcbLLtWS9MRIZtQ+n
	 LLP9cgbpqqeDHbgnkFTAtLiwNRMWICu6dq1X2S88HrqilNbq+a3xMbhBvT3iukTD01
	 8QqpR4gaEllLTdiOPeosh9KJCFvmPbwNeUkZHwsDqSHGyNh/MIyguwDsoN0rsSP6gv
	 wgmqBDkZKRprQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 34DBF198003A;
	Mon, 16 Nov 2026 05:41:12 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 16 Nov 2026 05:41:16 -0500
X-ME-Sender: <xms:x936atmzbygUR7XWzOiKGxfcLwKsJOya4h-Ar0Mn3OKoB9QGoFtuug>
    <xme:x936aq0QnYyW5PTqhqHkxOM4CXviJXliGKgeLIWM7tJeecpknpS_Gn1johgvcZVfF
    MhQFhFe-38bbxkDKv_P35jWnBvIgRB3F8t4OtAgvqI68648BrU6ZgX1>
X-ME-Received: <xmr:x936an88khMU2qOvRn8b0glhAUvuZM-wtt_kSvhtnOcbNUUNxYco-juxNxk>
X-ME-Proxy-Cause: dmFkZTEpJfblbk62xZOAh/T/EZa08rF7h46EjEoJinMEsXgVXH+bIddNYbMR8VMGVvyjT8
    e0mdxzBtL7KE7zvFOr8XDChSXWMNwAELnNLe6JjwxbgAr66Bmx5PsKcc76FYvA8nBU/xw8
    pAb4ThAd4RJeI6MMqU1Vt3s2dUzLwASTdOnH2qsvH+G1t2n2pTdLQ1t4ndkKRCNCfhFYm5
    GCh3wxhrd7AbePBcsqP2oD6+5F38itLQgjTL/aQUe3o5aSsOW4X+hWPgtwBaNbEwPhFHE3
    eV8SvqS5DvXPD3FVL9DXlExm4dDg7mFNWv8YKZi78rqOBjjaUcFYXUc9s29yi3JEVPEyPl
    NCtaEUv4NsRuQxjeh0Y3twDDIPA9k+soCpWA8q3h9GaJiLplOTLX4GX5j23NNarWS921Io
    J9SUfaeGQ6JyOASSCpZQN4Q9WdvfOxLEVFS0LcH8Apt0YxxJNbvyxL/dB2XzBKeTZkLDg2
    Evv18iMcM24ALKfuzxn1S7QGQxAr5aTUBvoow9y/RTzn6OxJu0wZftggMv9w0yZU9lgp04
    xlCRh+tQJmbaOd9/Xa4r3ZrKdvNQOLGHhEqUvHZqaWUcJCrsp8D3sMciYvyRkqIARnvDj4
    LV7fma3BMYE9FjnYWS8+9epfCGHFlSN/CpHvDJvwZ8kDXvH3GU15VnPCiC4w
X-ME-Proxy: <xmx:x936alz4lcBJrfREqjxlWztg2fzAlF8fd8aA3oJ6dF2QNYaj4N0Yhg>
    <xmx:x936algcb0RdjmMRuoFlqrgKqKoJvecTq7J7OwAjzHkquLxVnRiw3g>
    <xmx:x936aoPUFOLTRHygWjueWYnK7Gu0OKbrLHetD6D8nF_4t0ZqVcAePw>
    <xmx:x936arYS_q73xtLqBDDAESC9ZGUx2P4m_oGvVwn7fPCWUCUUa24WLQ>
    <xmx:x936auJAJr4cKPopqEOgaD1CiQGQmNMwCRCkmixrRIWirSeI9guGVxbS>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 05:41:10 -0500 (EST)
Date: Mon, 16 Nov 2026 10:41:09 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dev Jain <dev.jain@arm.com>, Harry Yoo <harry@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 1/3] mm: page_alloc: add a watermark check that knows
 the migratetype
Message-ID: <avrVAUGFUJdoVRG7@shutemov.name>
References: <20261102093939.3340540-1-kas@kernel.org>
 <20261102093939.3340540-2-kas@kernel.org>
 <7e82bf2d-3a36-46d4-b63e-6b6720620380@kernel.org>
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
In-Reply-To: <7e82bf2d-3a36-46d4-b63e-6b6720620380@kernel.org>

On Fri, Nov 13, 2026 at 05:51:52PM +0100, Vlastimil Babka (SUSE) wrote:
> On 11/2/26 10:39, Kiryl Shutsemau (Meta) wrote:
> > The high-order check in __zone_watermark_ok() accepts a free page of any
> > migratetype.  Under ALLOC_NOFRAGMENT, a request below pageblock_order can
> > only take a page of its own migratetype or claim a whole free block, so
> > the check can pass when the allocation cannot succeed.
> > 
> > Telling those apart needs the request's migratetype, but not every check
> > wants them told apart.  A check whether an allocation can be served now
> > has to count only the pages it can take.
> > 
> > A check whether there is enough free memory counts every migratetype:
> > kswapd and kcompactd balancing a zone, order-0 thresholds, the
> > slowpath's forecast whether reclaim and compaction can still make
> > progress.  Reclaim and compaction work across migratetypes to free whole
> > pageblocks.
> > 
> > Move the body of __zone_watermark_ok() into __zone_watermark_ok_mt(),
> > which takes the migratetype as well, and make __zone_watermark_ok() a
> > wrapper around it for the second kind of check.  These use the new
> > function:
> > 
> >   - the allocator fast path, zone_watermark_fast();
> >   - its recheck after node reclaim in get_page_from_freelist();
> >   - compaction's up-front check, compaction_suit_allocation_order().
> > 
> > Declare both in mm/internal.h: nothing outside mm uses them.
> 
> Why not mm/page_alloc.h instead, now that it exists.

Ack. Will change.

> > @@ -3665,6 +3666,21 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
> >  	return false;
> >  }
> >  
> > +/*
> > + * For checks that are not about serving one allocation now: kswapd and
> > + * kcompactd balancing a zone, order-0 thresholds, forecasts whether
> > + * reclaim and compaction can still make progress.  They count free pages
> > + * of every migratetype: reclaim and compaction work across migratetypes
> > + * to free whole pageblocks.
> > + */
> 
> What a slop comment, sigh. Can you rewrite it normally?

/*
 * Return true if free base pages in the zone are above 'mark' regardless
 * of migratetype. Use it to check whether the zone as a whole has enough
 * free memory. Use __zone_watermark_ok_mt() instead to check whether a
 * particular allocation can be served.
 */

Okay?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

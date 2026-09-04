Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFC94E8DE0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535259; cv=none; b=KUyuDSyxdgz9AV/G9E+SfknZmVuYnkO8ENjq3woyXfJCBIicL01gVKdfC8RRNyzhlp6ZGvt5KHCyXF77rGDpTzG9kTIq6KoEuXybJwX+gXZlVhf8+yD/8imQjsxAEliqfbkMQMydgPYbQlnmMLaFrV4zcQwaWXKkvSy9CsjyW7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535259; c=relaxed/simple;
	bh=IZ57S6AWAgyNIM5eM5BFcdor5BxROzRhpclK/d68NOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtT42cuLPRn7M+EY7CKlU7eD8DI1CucqS/ZQfVR98zIl1IxXNo2cCqdyZG5tk897tGazDmm5TNwToRR5ab+PkcC2wxJXKVGfZ4ME2W2V3NZa2aTJzPqNQZ2ruDfCd3KSlT1YT6wQXj7dPCZM72xfir7D0sf8tiKC48OHvHKKfSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=X9yBXJEy; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="X9yBXJEy"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90e8e70fa02so13439816d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788535255; x=1789140055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O362rQF00y/JKc7213VDRMRIdmSf7bkWLibT5UwQexQ=;
        b=X9yBXJEyGBmRPBAy6grNoQO7d/gbWuCsdkbmEW1YhseagguXo2Gyqr0Ja0k0J0lJdY
         kWWlsh6nC4o8X6j1dFR+aooOFeBh+neMNiSO0oYuZEK+pniMzdl8Y+eT9ePtwhbr3lh/
         sM8ZQxxdZEeMCR79d6cnOdyHtJq9BT6TzvgTmZjnCUiLgkBzXxd9yaGtzLVlUe6POfoI
         MNmAXJABDKSDRfg3kXc1i2HK5c3Q+JC393ThQs+Vdv8Dc5x94gcolKd3KMwhCnJMLSF5
         vUhS6AlEQSxBvQSvqa/X6lT+9H1n8uauKAv5tW57ksoazXWG6wsC0NbO4dYMEpMIba/j
         BA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535255; x=1789140055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O362rQF00y/JKc7213VDRMRIdmSf7bkWLibT5UwQexQ=;
        b=T6h/HP4dEuqIjy8SuiJjU61pZo4PGqEDedKbsFhoQqIrQYvTi5mTpGqyX5gmsmWzWy
         p7z3vTacz5NLyt8NTpLpjuMIw6SL8m3RP33lk0JMyUi28vdWCOstYhLpHn2zEQ/rhOj3
         lbGm5UrzWjnh/WwWVAHkQ9xhvrzdw9Q28p7CDG8gSMA2u5ojjc+DiJ42FAkLUAAXaoDV
         IXXpANozgd/yrx0HCrb7Rv4C0HY0DovRb9A5oqcBsw7/G+IjXBYNXZ2V059FaaQfEGWU
         QnYBfX5PXNWdJ0GqIVOPlns6juyHo6OfTBMZYcep8FBZjl63avddLvQn7Z+Tn4BLfiGq
         8OmA==
X-Forwarded-Encrypted: i=1; AKwUvBxDv07NaBWGcSJjtlDWkqTuPOwjaXp/on060H02KWODKgSVGQLTxIYAfx2qTvnBnIIMmErNtHir8kKdtok=@vger.kernel.org
X-Gm-Message-State: AFuF++lUCuSK73ys5B83LerH9/Y1KuqmFCeErh4T15q4CiJ4jt6ipezq
	9bgheqHwydcfW0VcQPLsqaIC2vuthrNljteqAspHJv1Uvqt2iMrs4ICVMXA+oZ6HCuA=
X-Gm-Gg: AYBFou359TN/5Ts85Tyt0ITD7pbaCEGo9m/4K52ji8hCX8XGQUP4s6/RmykYzr6lV0z
	3syhGxSAvqtz8UGYnZBuJ4tRQ5cXeK+vEwsWUR8RWCdZJhFBhkAmoPFjoCp7DqUmiJwqjMBDejh
	TrkNP7i1Ay4oPlqedYuXMxpxWtfYKm3f8BQhr5zirQAGvYb22QXRCVZOOOUsD1MDutS3rO62KHD
	pOOa/5FGnh9omxGqWsJwpeG0gEOh6Wfiiv4E7EmpJwtCcOl/j5CSZ7+eAGUUrtWfEMTebsdnUUT
	AKSSsRzyJ7QoOVjW8XuQWo5BVAWbE0/SxPQhvA9WNGwQs13r02WKbi/lP/laQO4EqJE93tdv+5C
	OVdKkqWQ9kUv7mvVqnlVvuc8GmGv3xkQj3RO00O6OyZpQxq3qJx5ejiQZrmsUegyelwT2+OK3rb
	l83MA+1ZJWUXZlF1BsPC86eg==
X-Received: by 2002:a05:620a:6d47:b0:939:6dfa:7528 with SMTP id af79cd13be357-939804ee530mr481834685a.52.1788535254506;
        Fri, 04 Sep 2026 08:20:54 -0700 (PDT)
Received: from localhost ([2603:7001:f100:501::2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f0734sm239642785a.4.2026.09.04.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:20:53 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:20:48 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Nimrod Oren <noren@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Rik van Riel <riel@surriel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <20260904152048.GA6641@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260901204449.GK3004@cmpxchg.org>
 <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>
 <20260901220917.GM3004@cmpxchg.org>
 <69C018F5-A1C8-47AD-9567-3497AA6808EC@nvidia.com>
 <20260902160417.GN3004@cmpxchg.org>
 <DL5WUE8JD6MH.3W984LEQQMFV@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL5WUE8JD6MH.3W984LEQQMFV@nvidia.com>

On Thu, Sep 03, 2026 at 02:58:54PM -0400, Zi Yan wrote:
> OK, digress to the compaction and reclaim discussion. Isn't this 512MB
> pageblock size issue also telling us 1GB THP allocation will not work at
> all? It is a proxy of 1GB super-pageblock.

Yes. I doubt this will work well with the conventional page allocator.

If you recall, when Usama floated 1G THP, one of the first questions
was how do you allocate this. Rik's gigablock patches are an
interesting push in that direction. CMA as a stop-gap measure.

Meanwhile I'm trying to also make the native pageblock defragmentation
better to make order-9 requests more reliable to allocate at runtime.

Both of these efforts are kind of complicated by this config saying
pageblock is now half a gig. It's too large for gigablocks. It's too
large for watermarking/pageblock-aware reserves (as this patch shows).

We're struggling with order-9 blocks and you're saying this should
work fine with order-13 blocks - with a 16x larger page - but with
defrag reserves that are reasonable in absolute bytes. ;)

> I need to spend some time on it to understand all the heuristics and see
> if anything can be improved.
> 
> A quick chat with Claude results in some items for me to explore:
> 
> 1. reduce pageblock conversion threshold from half of the pageblock.
> That can reduce the number of slowpath entries.

That means you have pageblocks that contain a supermajority of a
foreign type. What does the block type mean at that point?

> 2. make reclaim pageblock aware, so when an order-0 unmovable page
> allocation incurs a reclaim, the reclaim will try to get free movable
> pages from an unmovable pageblock first.
>
> 3. in addition to produce a neutral block, compaction/reclaim need to
> repair unmovable blocks by getting rid of movable pages. Proactive
> compaction should do that too.

This makes a lot of sense. I believe Rik was looking at more directed
evacuations of exactly that type. CCing him. You guys might be able to
collaborate on this.

> >> > Seems to me the excessive min_free_kbytes is just a symptom of a
> >> > deeper problem.
> >> 
> >> Yes, our anti-fragmentation mechanism does not work as we expected,
> >> so that we need an excessive min_free_kbytes to get khugepaged working.
> >> I wonder why reclaim cannot get the extra free memory instead of
> >> reserving it via min_free_kbytes. Maybe we need a watermark boost
> >> when some consecutive THP allocations are seen to achieve similar
> >> effect of boosting min_free_kbytes?
> >
> > I'm just wondering what the easiest way forward is to fix the ARM 64k
> > page problem.
> >
> > Yes, optimally, reclaim would work to satisfy compaction space by
> > itself. We've seen it fail at that before, though.
> >
> > How critical set_recommended_min_free_kbytes() is today is a question
> > that neither of us has a clear answer to. It's from 2011 and a lot has
> > changed. However, knowing Andrea, I'm willing to bet he added this
> > based on seeing a need in testing data. And I would actually expect it
> > to work better now with proactive compaction, since that has a better
> > chance of turning low-order chunks of that volume into pageblocks that
> > can be converted instead of needing a poisoning steal.
> >
> > It's a change of long-standing behavior for everybody. It has a
> > regression risk and requires careful evaluation and testing.
> 
> Not for 4KB systems with large memory, since khugepaged's
> min_free_kbytes is capped at 66MB for one-node, 88MB for two-node, and
> 44MB + N*22MB for N-node. For a GB300 host you mentioned above, it has
> 494GB memory and with pageblock size set to 2MB, it should be a nop,
> right?

For single node, normal minfree catches up with recommended at
256G. For two nodes, it catches up at 484G.

I would say that affects the majority, or at least a sizable share, of
machines out there today.

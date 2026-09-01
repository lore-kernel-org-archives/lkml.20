Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D3839A4A4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788300566; cv=none; b=HuFzTLArvDpxx9V3Azk3qqEpnfnprzB++OiLOggZdQLXe+hQ8qCY1DZjrGvq5nxOk0zY5hCbxrCByCc3mbzlvMCVIyOvk/hHkwPa1ynXsN4w5OOtoEbsFRC9xCa7067RJ8vGFaduZ9sVFklKTkV2bLiLLi7g+6qNrqvfsY7uoEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788300566; c=relaxed/simple;
	bh=7RBFT/jzVt2TZvCkr50FJgetNEOcyAfjPOyqUNOAWgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6ypdGSblw3i6PKmXXMOuFZYkcc77kczr1G4ypCAbc4Oq8ZbM7NU9MKN++6kqUO1U90kmWc+Ej4EwOUJYStRatf1rHB3NnyPX+Wa/Ulu/IOmU7qq/7EG9Rf8nYuHJZ4SAtwxPLQ3unjwDwzL7Pwo3bzyjJwQzM8BgLFOW2GXP7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=dhBHukGY; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="dhBHukGY"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-836c8bdac50so6805307b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788300562; x=1788905362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M4+niubgl505BkFKhEwPKEaItzjdUcc0IlA8qi6slv4=;
        b=dhBHukGYt8PioOMSWQxAkbpTHT/tAmPd7qGywIMH0OfDlfaHoF+79qqIGrAGzDLh3k
         cKI1FX+pEoOZ9hND3R3nrokKDYOBLcCtvEcLxIjpdd0fGfjv6xn2EBl9gaTLE1+5nST/
         SrOvzuiPCjJRfKOI6bbwGVuIyM+Av5i3QfM6t3cOKvsDPqf0eO1LAtSvbzN3lQLFVt38
         S7yYnvsIM8HvWPtqJag80flY/u8hR+WJ4fGuxiEXyOjdLBmoxSjXYskwgMbruASvIhDE
         wk7PHcdRsbGcFzf3tSAaQFu+hjxfzBsjTjTjz9UlK5q5ICbtPmfvVd/68BMH6KuQgqO8
         +dpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788300562; x=1788905362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4+niubgl505BkFKhEwPKEaItzjdUcc0IlA8qi6slv4=;
        b=iei5Tdm+c9gzrw+s7oxC5UYwoLdLV0ySTtP3WdiKHzr2fOFYU06tm75FO1ZCIvVIOc
         p5o3MSPIOfLqmrVkiB+Q60Soo8nlvfCAJyX5893vYafNA0c48bVz3eWCC5Lt2/dvuHkf
         KSYYEK2ivpRRalNY9HcHBs2/apwmWI7Vpc+dT1uA8dDwFFm1q0gid+6KEgeFAySLdD60
         ZYKra/PksZCK4xXd1n8r0B6uAeyv5+52DvE5GF/+nN1C0NBVNS16yenVFrr5D/iSf4Ug
         RM/pna2qR52kcpunNw08q42xmPkzPxtpo6emFNxwK7U9Ajdvq2iiz1ud5/x2RVscmrLS
         MGQw==
X-Forwarded-Encrypted: i=1; AKwUvBwXMFc0HvH/ycgoRA7o7Fs9RkTGIn9/bTNG7ytr7BKAS/jvWm1hhmkuiHTj6ARsUclLD9CBaUWJpszZ19I=@vger.kernel.org
X-Gm-Message-State: AFuF++nYzaNR0KCO05a58EzSpSlThm9MV4ZeupDi+qJPChp+E3OVij+v
	qJQzhBTrVjbHQa4TTIG3lNOxDybXs97bvxCN/wrRHZhiAMGwvn73fhFQ3BbHKelf2pM=
X-Gm-Gg: AYBFou04iQS7B+ZDKA7sG9xNRvnBJeln4WrOq6Zy4d2hnzt3xe1EZCzsiMwnmDHWUWi
	dkzHGV6d7B3aycRP4LBSnruXrw2fdU6Bs6GcoiBNxWXxHnla07JqZCAtxxFYf9++TOZjRXjLl+2
	TWn+d9LVQbvY9KyoXe8vjoT9JTteH+FWS/2O9ZyJ3/aw6fqVelWjzuK2Yn6aYVoJkAKuB+zrJR+
	eS2Zadd6We57JL+Ra2A8E8wdBhaVKFkKt7mdwozf4WXccMGo/YpR/AVfFMfYP17NEM7KRza8BQB
	p0cwPA+jGNzs87JWsiv5JWrkm+vdDQggDoRo3hn2bT1njsdnDJnUVPIRb0O57ak1DpdoC0UQ6nl
	wIAvToZfVNnq/NZkkBJcxaPnjfiu/1QG0AwodYhSwj0fiPweQSSj5Ky0Di/Xj07JsDX1ikaJjaD
	1F7P48uib/pLNwX+AZ54ULVWt46pU6lTTtizA+a+9PsItxleONQ8kAhgyEYzNHQJLfIOq+JV8=
X-Received: by 2002:a05:690c:d8a:b0:81d:6af3:b9b5 with SMTP id 00721157ae682-86c4e7d322dmr2445717b3.9.1788300561871;
        Tue, 01 Sep 2026 15:09:21 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c10c93fa5sm4188977b3.3.2026.09.01.15.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 15:09:21 -0700 (PDT)
Date: Tue, 1 Sep 2026 18:09:17 -0400
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
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <20260901220917.GM3004@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260901204449.GK3004@cmpxchg.org>
 <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>

On Tue, Sep 01, 2026 at 05:09:52PM -0400, Zi Yan wrote:
> On 1 Sep 2026, at 16:44, Johannes Weiner wrote:
> 
> > On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
> >> When THP is enabled, set_recommended_min_free_kbytes() may raise
> >> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> >> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
> >> heuristic to help keep pageblocks free and reduce fragmentation for THP
> >> allocations.
> >
> > We've had problems with compaction before when min_free_kbytes was too
> > small on large machines. Competing free space scanners do a lot of
> > work only to fight over a very small set of possible target pages.
> >
> > So I'm a bit uneasy that you didn't include any benchmark numbers with
> > this that prove basic functionality on larger hosts isn't regressed.
> >
> >> The recommendation scales poorly with larger base page sizes. With the
> >> default arm64 pageblock sizes, the contribution per eligible zone
> >> before applying the existing cap of 5% of low memory is:
> >>
> >>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
> >>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
> >>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> >
> > I question whether pageblocks need to be 512M on those machines to
> > begin with. After this patch, you're still asking the page allocator
> > to optimize grouping such that 512M pages can be allocated at
> > runtime. Only now you took away part of the mechanism to do so.
> >
> > If you're using 512M THPs, I would kind of assume it's on machines
> > with a memory size where 5.5G for defrag purposes isn't devastating.
> >
> > And if you're not, it would make more sense to lower the pageblock
> > size to the mTHP size you're actually using. And that would fix the
> > "excessive" min_free_kbytes issue as well.
> 
> But lowering pageblock size requires a kernel compilation. That means
> maintaining two sets of kernels for different needs.

That depends on whether anyone actually wants 512M pageblocks...

> The ultimate solution is to enable better compaction to generate
> THPs bigger than a pageblock size, like Rik's super-pageblock
> proposal.

...or whether we can say, at that point, use gigablocks/cma+hugetlb.

And then the static pageblock size for the fallback logic etc. can be
a smaller, saner default for everybody.

Because the point you didn't address: it doesn't make really sense to
have 512M pageblocks on smaller machines, beyond the min_free_kbytes
issue: Fragmentation events will poison half a gig at once,
should_try_claim_block() becomes harder which results in less
conversions and more allocations falling through to stealing, page
isolation is more likely to fail, compaction locks and operates on
oversized chunks which is bad for latency and concurrency...

Seems to me the excessive min_free_kbytes is just a symptom of a
deeper problem.

> After removing automatic min_free_kbytes boosting, user can still
> increase it via sysctl to restore the old free memory head room.
> It is much easier, right?
> 
> >
> >> The automatic min_free_kbytes increase predates proactive compaction
> >> and many subsequent changes to compaction. Given those changes,
> >> increasing min_free_kbytes for THP by default is no longer clearly
> >> justified.
> >
> > That's pretty handwavy. How would these changes specifically eliminate
> > the need for compaction scratch space and allocator fallback options
> > to stave off fragmentation during placement?
> 
> Extra free memory is still necessary. min_free_kbytes can be adjusted
> at machine boot time to achieve it, right?

That argument cuts both ways, no? ;)

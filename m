Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EB34FD289
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690900; cv=none; b=rDvSkdrJWdZrjNe6ZD7wOocVYwswa1lkU5zjUMa7jPBSXFWbitxiUn4yo5QybQGlp9Zk+l09iIIyH2orrKx6V/yV68Avw6PRCTjCRFtSgfqjwdJnFQe9Ph11e0Q0+5bDctqZB31sdt+nTbtRtQWNmAwAhgRqWhYBryma8kKs9tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690900; c=relaxed/simple;
	bh=q5ljtWC8ENLEfYWr4CJjgo7xex6qYZgS0gb8SW2SDlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdGIJ6iZudjwy4XhZKvWdpT9v0AJA9CtwyvjzKcrZNcwRgpAPKAffc6OGES4LcX9+mhu8iI3oPV3fahwzCmcZaHY3JDNrbx2N3gfg2nBL9EzuETAin8puB6cjzgdTqT0lCACeIIs93bQWjfBFVVzOF6kM+Jn5oG1+pr0WAXwjaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVewW5Qn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVewW5Qn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684D01F00899;
	Tue, 29 Sep 2026 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790690899;
	bh=jlNOYHiT07K2az/l+2y4AGC9fafFmKTrBoDd4N5U5z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mVewW5Qn2qAmgjkDHrm7h9ImBLizby8aLuxf2ZTi8kNSecxlc9kpgDODMBKmTYCjw
	 dNLgsxol+gnQyNk8YPciyWzgpMPTtzYl0ZqWF2CrR+HvUn5tvJUT6R3GhQdk7pM6Gj
	 aWETMcRzoLIrFr85P7qlcdkYgSo9X+lf17RWX2QbzvvIiw0+rBy2vXTI+uyooN95zp
	 bTtivmEZSjOPyXvBPNdLnfaEheHIB2jbaJfy63pMIYZo8OREkTw7ofwEdFcu2U3y6g
	 beLHIDKMXzCH5xXoz2cKjHf/g0IcvsPaGKXbV4uO6WafJVG3ds1Z8T+GNcDv9SaJD9
	 CJulhZMBVU0HA==
Date: Tue, 29 Sep 2026 15:08:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Deng, Pan" <pan.deng@intel.com>
Cc: Pedro Falcato <pfalcato@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Barry Song <baohua@kernel.org>
Subject: Re: [PATCH] mm/vma: don't remove VMA from rmap if pgoff unchanged
Message-ID: <arvEs8PNXNkJJYfe@gremlin>
References: <20260925-speed-up-inplace-rmap-v1-1-babc48ce7c83@kernel.org>
 <arqI5QB5tUr8dd_r@pedro-suse.tail5790ac.ts.net>
 <arqczL8K39qBoqgV@gremlin>
 <SA1PR11MB6824A3768F22AA274860809A968C2@SA1PR11MB6824.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6824A3768F22AA274860809A968C2@SA1PR11MB6824.namprd11.prod.outlook.com>

+cc Barry for anon question below

On Tue, Sep 29, 2026 at 01:45:48PM +0000, Deng, Pan wrote:
> > > > The anonymous rmap is keyed on anon_vma_chains not VMAs, so in those
> > > > instances anon_rmap_tree_update_vma_inplace() iterates over
> > > > vma->anon_vma_chain, invoking anon_rmap_tree_update_inplace() on
> > each one.
> > > >
> > > > For the anon rmap case, with CONFIG_DEBUG_VM_RB set, avc-
> > >cached_vma_last
> > > > is also updated in anon_rmap_tree_update_inplace().
> > > >
> > > > When performing a VMA shrink or a split where the VMA is the lower one,
> > the
> > > > page offset cannot change, so set the flags unconditionally in these cases.
> > > >
> > > > When merging VMAs the page offset is unchanged only in some cases, so
> > > > update init_multi_vma_prep() to set the flags only if the page offsets
> > > > remain the same.
> > > >
> > > > These changes ultimately result in less rmap lock contention.
> > >
> > > I think this asks for numbers?
> >
> > Well I don't have any :)
> >
> > It logically reduces the contention, and that can only be a good thing.
> >
> > Pan had some numbers, I've asked him to re-run against this one.
> >
>
> Yes, UnixBench/execl case, measured on my 2-socket, 192 core / 384
> Thread x86-64 system, on v7.3-rc4 with and without this patch, built
> from an identical kernel .config.
>
> Configuration, re-applied after each boot:
>   - cpufreq governor "performance"
>   - uncore frequency pinned to max
>
> Run rule: 10 runs per kernel, 30s cool-down in between, cmd:
>   $ ./Run execl -c 384
>
> Result: Execl Throughput, index score:
>
>                               avg    %stdev         min        max
>   v7.3-rc4        3511.5     0.44%    3494.5    3543.4
>   + patch         4069.0     0.48%    4047.4    4109.5
>
> The speedup is +15.9%.
>
> In addition, I also profiled lock contention data ~10s in the
> middle of one iteration, cmd:
>   $ sudo perf lock contention -ab -l -S vma_prepare -E 8
>
> The dominant lock is i_mmap_rwsem
>
> Result: avg wait on that lock in ms, 5 runs per kernel:
>
>                         avg    %stdev        min       max
>   v7.3-rc4    9.470     2.91%     9.070     9.820
>   + patch     8.420     3.34%     8.100     8.770
>
> avg wait is ~11.1% reduction.
>
> Note: under the i_mmap_rwsem write lock, this case only exercises the
> split path, for both the file and the anon rmap, while  merge and shrink
> are not reached when the lock is held.

Thanks Peng! Much appreciated.

I'll fold this into the commit message on respin, should get that out today
(some trivial renaming, etc. functionality will be identical).

Be interesting to look at anon also, there could be impact for android
specifically given zygote.

Suren - do you have any bandwidth for checking whether this patch impacts anon
rmap lock contention?

Barry - I know you've looked at this in the past, are you able to assess whether
this has impact for your workloads?

>
> Best Regards
> Pan
>

--
Cheers, Lorenzo

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ADA523786
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912455; cv=none; b=Rjw6T7zlE9/Ht+/KpDyFwuZedw8k+I3xPeJJL3g10SXXZR35kYILYQMqfZnFGR4Q080ZSy7+2OIHhS94v9zvQPbIqvns1+TphtqoZKhKTtLcPrw078/xrg9yJFZa+RTjbV7llY1O0JAQWVvR/TA3V7EK+7TUmXsV2ldk5x6xYL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912455; c=relaxed/simple;
	bh=kBqPeAl/Erzs9EYtSMNdCZJp64YGQcRni3aYbwbhVCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzigPv8+AKFU7jmkNHApaWyTn7U/pKU8BXisoUmz4TJnTDP/KV4Z5d39cPDufMUo+9/v2b1+2z9GCS9ZHqLnqIdkgQMBWbgZN8HwTl/1iqLk7mZRYOwsyBmcEF3Rmh242UBV+tzEy8HdlrxynRsVJsKddnlDtIfsp6LMeZgYfRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDzXC/8V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDzXC/8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A1D1F0089D;
	Tue, 13 Oct 2026 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791912454;
	bh=YPFavUKg/elaqUmt/6yrwjPSlADw013VHKQ/g+fF28w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TDzXC/8VPxgfaNP4AsW2ASI3EDrr3YTRcseWQXnfjAJOZYzLiTtCLCLsMFJ8kdgjs
	 lOLEV7Vu4qNwNg8JT41fOaWiWyT3kuzIx4cJsW11nzbJi0f33DL2cFhnLM5GJa0FC0
	 tF5WXl7KjdVs8lp51p4LQ7HZmweMsg9YOHIcw1ntPf5uDyS8MQspxUmXeOZbAmAmQ8
	 1QiCaSxih1Hb9GmXRDbkAKkmgbIAmHI/o25B/9xtEZtJx98fgOta4NAW/Ya8T3jd9L
	 xRtsGpM5OETM5x6QPTYDM9XiTfK7Sy7bkYfTCYL5aUbacszaM147G1NygpjgYd/HvV
	 WR1+oicE2nxpg==
Date: Tue, 13 Oct 2026 20:27:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Kaitao Cheng <kaitao.cheng@linux.dev>,
	Priyanshu Kumar <priyanshukumarpu@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] memblock: Remove unused exact nid allocation API
Message-ID: <as5p_av2Y0Hu70_2@kernel.org>
References: <20260919135327.74089-1-kaitao.cheng@linux.dev>
 <179188501773.4183299.8247277870365097333.b4-ty@b4>
 <35057B7F-9E89-447B-AF4F-92A78B45F8E2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35057B7F-9E89-447B-AF4F-92A78B45F8E2@linux.dev>

On Tue, Oct 13, 2026 at 06:06:49PM +0800, Muchun Song wrote:
> > On Oct 13, 2026, at 17:50, Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > On Sat, 19 Sep 2026 21:53:24 +0800, Kaitao Cheng wrote:
> >> memblock: Remove unused exact nid allocation API
> >> 
> >> Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
> >> mechanism") removed the only memmap_alloc() caller that requested an
> >> allocation from an exact NUMA node. All remaining callers allow fallback
> >> to other nodes, leaving the exact_nid argument unused.
> >> 
> >> [...]
> > 
> > Applied to for-next branch of memblock.git tree, thanks!
> > 
> > [1/3] mm: Remove unused exact_nid parameter from memmap_alloc()
> >      commit: 063b5e8bbd216c27e885f45e29e23d053aa565fc
> > [2/3] memblock tests: Move exact nid tests to memblock_alloc_range_nid()
> >      commit: fba3e86fb848f79c4573243affcd7d79d378958d
> > [3/3] memblock: Remove unused memblock_alloc_exact_nid_raw()
> >      commit: ea27be9f7ce90a05e779d20b60969ce2a9834f77
> > 
> > tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
> > branch: for-next
> 
> Hi Mike,
> 
> Just a heads-up, the tree has moved to:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock
> 
> Might want to update it next time.

Yep, thanks!
 
> Cheers,
> Muchun
> 
> > 
> > --
> > Sincerely yours,
> > Mike.
> > 
> > 
> 
> 

-- 
Sincerely yours,
Mike.

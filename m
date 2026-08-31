Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAAA39FCD7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214433; cv=none; b=pirNHiKa73k/HhX9GlVLu4JT+k/WO3QgsDagxkPijEKxAq+X2hkmsCY8RkuUhnAQFx87249vF776GkTj+LIvRX7Dx0Fa65U042nPrvg/V+pio6S6MEO2M2qw5oho2+PWKRXLOfX0C92ZKeYABwvmXAvw4sp9ahxXsorUcx/4ufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214433; c=relaxed/simple;
	bh=++uYQUMvFwFMMUcMfMUrEyexfdb2Id4wtR4X7wQ5p2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsbxX4md0tzA+vsCiRTdn15Rz5d2NU1zE7XxHPn/qU5Gsw9l5ekipjsJvtIV9ImSWF4O771UiBOOsLiGqn56O14ofvl2dShNy6vngIZ3XJVWPgKlsEnMuxqoV+BvfcTJwi5fBUgZeBfz0188mBFOEHH40BQE+RtUX5QxTjdKzwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=36q+etKU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="36q+etKU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VOlevrFdEXRUzbmZojs2dVjkkSXh++UDxDK4wG8MPBY=; b=36q+etKUhagPNuiwzgaG5YP4/U
	bxJkAJXydme5CsT5PwvoX7Bdgj1xQ8qSC70UnI0yjYTNIRg2DPG9pn99BN3rMtpmvMUv+2iQMleLX
	lpOE9CwUGFnqhTb2WOZwREc5okZLIrQdmxnVmIwLyh1p02f4Ixl5TRWehOAPqfW3mkSvISnWTBXIv
	7VXDoz+3IrM7n+y+xCwaPQC31ZiJFkYO9I3GLwwosCLuC03ye8GSMaPh62lNnu+TTE/7Ki0SFglk5
	cwDi75BBIkmba3o49OvpdHv9u6AGw39/WJGbP1Ag68rxZqzpgXKM07dlE31GIf4pd91ArG5akXHMG
	pzawV2aA==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1AGC-0000000AaEI-0blG;
	Mon, 31 Aug 2026 22:13:48 +0000
Date: Mon, 31 Aug 2026 18:13:45 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Andi Kleen <ak@kernel.org>, akpm@linux-foundation.org, ljs@kernel.org, 
	jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RCU safety for vma maple tree walks
Message-ID: <bft5zaxtu4sqbixj2zuxnjcdjy4we2522w4qxxhqypdvy4lot6@lcwehbvsh3wd>
References: <20260831143511.1133029-1-ak@kernel.org>
 <nq4g527ozizmp2iqmozau7xwgdq4cny43onciw2mw7vu4bwabg@uzkdpjchygkn>
 <apWxTNwhaMU3XiZP@firstfloor.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apWxTNwhaMU3XiZP@firstfloor.org>

On 26/08/31 09:52AM, Andi Kleen wrote:
> > 
> > Did you check this with lockdep?
> 
> Yes all tests were running with lockdep, and it didn't trigger.
> 
> > 
> > Any access to the maple tree without holding the write lock or the rcu
> > read lock will cause lockdep to complain.
> 
> Hmm, seems that's not working for some reason?
> 
> The VM callers of for_each_vma clearly don't take rcu read locks.

I can't say why it's not triggering for you, but I can tell you that
lockdep detects incorrect locking for me and others using the maple
tree.

You even pointed to a syzbot example of a report of an rcu locking issue
- which is resolved.  No unresolved issues by syzbot (which has lockdep
 working..) has been reported in any of the functions you have patched.

It is okay to not hold the rcu lock if you hold the write lock.

> 
> > 
> > Likewise, any sleeping while holding the rcu read lock would produce
> > warnings.
> 
> Right but the walkers don't use the read lock.

Every walker either holds the read or the write lock, please recheck the
code.

> > Note that you do not need to hold the rcu read lock on the vma maple
> > tree if you have the write lock.  This looks to be the case for most (or
> > all?) of the cases you have below.
> 
> Yes the write lock is hold (like I discussed).  The problem isn't parallel
> modification but that splitting during the walk invalidates the
> iterator caching if you sleep too. That's all purely on the local
> thread. The only contribution from others is to cause more sleeping
> due to memory pressure or rescheduling.

I'm going to state some things that will hopefully help us understand
our disconnect.

Parallel modifications are not possible.

Splits are writes.

Writes update the maple state.

Sleeping with the write lock means nothing writes.

Writers replace the nodes in the tree before marking old nodes as dead.

Writers mark the nodes dead before they are added to the rcu free list.

Writers return pointing to the new node, not the dead node.

Readers cannot sleep.

Readers that see a dead node restart the walk from the top of the tree
into a new node that is not dead.

Nodes cannot be freed until all readers which could have had a reference
have dropped the rcu read lock.

I am very confident you are doing something wrong in the code that is
not upstream.  If you have a reproducer with the upstream kernel, then I
can help you.

Thanks,
Liam


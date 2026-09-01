Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C153C5DB6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273590; cv=none; b=i9KXyi3CLjSzYo+LB+YhftSMLqfZcQcbXHKPPRwdBSPZfzOXNrOFmbY2lHhYXLBSm6KUlC8wu/MEEM1E2kMD/P6DizD6X0E2wjxSjddNFViOpAg3zXZwK0BgEX6GHufct4EFWSJ03izhItiQ4N8MLxL193H1GLgHywA9/zhAGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273590; c=relaxed/simple;
	bh=H7NAJCGi+VOvfXr7sYxpW0HEer0al0I4HcnWHDaeVS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fs74XZXCj8Ppnf72D5XV1A5E8zmj8ajjnUqdBoJxJRp+9QUS9qSfWUTEjls6MNqjKWjfpkqYMTARC2FE5jeszQCLNhisdVHoJABhT4VuIxiVh3QhEUz/KosBVpcfl20kdPR3ti9dKIKZyUgLI4DGS4rVv82biFnvR154bMECiX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3IxuO/R2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3IxuO/R2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JbptY317iCIcm32IzYm0oPV/KpXQWcrlQ6Fff3K8MvE=; b=3IxuO/R2DAnNuaEFV3p2YTr4qw
	fswV62fbGGX+8PBkni88n6Ln2ftsLB0f6xyblLR2/f6y0QtWJl0PpkF/R4XXEgZvy32d7qZmuayFy
	Mc/ncMEgsCjVdq3cIiMe3c27FglZUuS4YnR6HWfN242upAdgX5te9Q3uMn2YNzW1gPpbhP9ymEFmF
	6pfJdFzJy79VYU7KYvanFsKObObz5V9GCJuqNCsyddGcgKoInKM4Nk6g/xvFtrx5wqBHC+7iHAVD+
	wGGGeGJJI1xQMl5YIjMHbgfzQBU4fFXoerQ3nHFNFpm2DqYsK5LHIYZEdbplCOPr9q8N/eAEW/BzM
	X8DhpbQA==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PeF-0000000CMXh-1Q7u;
	Tue, 01 Sep 2026 14:39:39 +0000
Date: Tue, 1 Sep 2026 10:39:37 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Ballance <andrewjballance@gmail.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH] maple_tree: Annotate lockless pivot reads for KCSAN
Message-ID: <ccgj2ukobxzdpypdi45vvapxbot56lsqmqfzzkcyrgnkjetybh@gghifhsc7v4t>
References: <20260826074430.1139325-1-hui.zhu@linux.dev>
 <20260826094147.42e1e71e91a5a537ced30a21@linux-foundation.org>
 <kpzm3pcwxwnzk5kngcsfcybzst5jtyrdcphd3hcpmoc6dbtswq@atn5yddl23qx>
 <f33eaa0c730feb9f598738ff79d98cb25b4b2bcd@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f33eaa0c730feb9f598738ff79d98cb25b4b2bcd@linux.dev>

On 26/08/27 05:35AM, Hui Zhu wrote:
> > 
> > On 26/08/26 09:41AM, Andrew Morton wrote:
> > 
> > > 
> > > On Wed, 26 Aug 2026 15:44:30 +0800 "Hui Zhu" <hui.zhu@linux.dev> wrote:
> > >  
> > >  In RCU mode, replaced maple nodes are marked dead and freed via RCU
> > >  after the new node has been published. Arming the RCU free writes
> > >  node->rcu.next and node->rcu.func, which share storage with
> > >  pivot[0] and pivot[1] (see struct maple_node), while lockless
> > >  readers may still walk the dead node. These stores therefore race
> > >  with the pivot loads performed by the walkers.
> > >  
> > >  This is harmless: the writer marks the node dead with an smp_wmb()
> > >  before arming the rcu_head, and the walkers re-check ma_dead_node()
> > >  after reading the node and restart the walk when the node is dead,
> > >  so any pivot read that raced with the rcu_head stores is discarded.
> > >  KCSAN cannot see this protocol and reports the plain accesses, so
> > >  annotate the lockless pivot reads with data_race() through a new
> > >  ma_pivot_rcu() helper.
> > >  
> > >  Found by fuzzing on a 6.6 kernel; the race still exists on
> > >  mainline. No functional change intended.
> > >  
> > >  
> > >  Thanks. AI review suggests that the patch is correct, but incomplete?
> > >  
> > >  https://sashiko.dev/#/patchset/20260826074430.1139325-1-hui.zhu@linux.dev
> > > 
> > Yes, this is literally every read of numerous pivots on any reader that
> > would need something like this. Most code is shared with the writer
> > side, so we'll have data_race() annotation where it is not needed there.
> > 
> > I don't like the name of the function and I don't agree that it is worth
> > doing, especially half of it. If you notice ma_ functions take a maple
> > node as the first argument, but your new function takes an array pointer
> > in the node.
> > 
> > The from address does not agree with the sign-off on the patch.
> > 
> > I also don't think a benign race needs a Fixes tag?
> > 
> > It might be worth looking at other ways to calm kcsans down such as the
> > type qualifier __data_racy, or maybe the makefile option.
> 
> Hi Liam,
> 
> __data_racy is defined as volatile for KCSAN kernels, so the qualifier
> has to propagate to every access site: ma_pivots() would return a
> volatile pointer, and all the "unsigned long *pivots" locals and helper
> parameters in maple_tree.c (about 25 sites) would need the qualifier
> too.
> It also marks the whole pivot array as racy, while only pivot[0] and
> pivot[1] actually overlap the rcu_head.

Isn't your change already using the data_racy annotation on more than
pivot 0 and 1?  For instance, mas->offset is often passed in and that
is likely not 0 or 1.

Fair point about the code churn, though.  I don't need every function
being changed to accept a volatile.

> 
> The Makefile option (KCSAN_SANITIZE_maple_tree.o := n) is a one-liner,
> but it disables KCSAN for the entire file, so any real data race
> introduced in maple_tree.c later would go unnoticed.

KCSAN has never reported anything real to me and that's why I suggested
turning it off.  After speaking with Paul McKenney on the matter I have
been convinced to not disable it.

I still don't really see a whole lot of value in annotating the code to
say a particular race is not an issue - we will have mostly disabled the
tool by annotation in the end.  And these are most likely going to be
the areas where we have issues if any arise - ie, some special arch
corner case that comes up that didn't exist or wasn't in mind during
annotation.

> 
> Do you think one of these two is still the better choice, or should I
> keep the current approach and fix the patch according to your review
> comments?
> 

I guess respin it and see how it looks with your current path.

Thanks,
Liam


Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21275519B5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791925400; cv=none; b=Hd1jf9lCLTfCtUOtV5dExT+6qg6WqaMb6/TYR4ffKW8bjao1EU0eL1VesuuKVysI8iWcV/OT0TGn8AbpZm1vyvH+6y7NI/U4f8voEyLawbbvnsBCWyTVUEEbk1FcqirlNl2GkM75TdW2/Tjmlsa2wuK1lUoEWUtj2Z6ThHkFK/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791925400; c=relaxed/simple;
	bh=52CoH4PKuXeSo+UVZjPnNyV9TKnaUQI2LBq8Fu9YJI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8HfO8cuF/WJUPecOGZqMJyU7Wd3pPV768tc0y1tvcakakyKoK5wcWkN1mbr3RA5LD4TqE9Pw4nzYas3zSXYEXLeq2tZ9bHJiNcEWVHEQz1McjJ/8On/6DpgNG+Vs8jaNe7zyH7+k5LccXk44oeWOOGJcOI9J2A2zoyYPl2pyhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Le/OWGnU; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Le/OWGnU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SUa7NgEfoTcw3P3DlukQ4SYNZTtD4CNNK8X1IUo2784=; b=Le/OWGnUMrk7JyDUzirJbH6tzr
	3ISoX686d78tGc1tpKfDC/rsN1Pplj6pMi2Xl5fqzLG6m1GVFciIMwTeKyDA6KwpdhVAifhFz31Vw
	/INHKQeVNzfLRSsOjsCKTSm+7i1ck6snENGK/GrSqZBguDId/U0TieIHbPoX5mSfhPUHWAaKv4SfY
	DoZd9vVWzqcwCMGkjUj7z1RAObBmPfQk/3jSHkgWmgBjZx5R+/6Iqiegrd6cfJkbA2VgR0SS2Wn1+
	g+lximLmK0nV+AtDHDhFQLhu49JId70kgBDlu2h3aqerqiWkDYlvT/Xux79uappfLf5tfmfEnF2ag
	dqyck3OA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjeS-0000000FrDz-48vC;
	Tue, 13 Oct 2026 21:03:13 +0000
Date: Tue, 13 Oct 2026 22:03:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Kiryl Shutsemau <kirill@shutemov.name>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <as6ckC9NJVB8JBuV@casper.infradead.org>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>

On Tue, Oct 13, 2026 at 11:43:14AM -0700, Linus Torvalds wrote:
> The fairly short series of ten patches basically enhances folio lookup
> by noticing when folios are hot, and setting a "delay relasing this
> folio until after a RCU period", and then using that RCU delay it does
> not just the folio lookup itself under RCU (which we've done forever),
> but also the actual folio data accesses themselves under RCU. No
> refcount taking needed for the fastpath where we can just read the
> data from the folio entirely in an RCU-protected region when the user
> copy doesn't cause page faults.
> 
> Unlike my original approach - because it now actually delays the
> freeing of the underlying folio data - there's no need for any double
> buffering, and a lot of the original limitations of my original patch
> go away too. That improves performance quite a lot. And by "quite a
> lot"  I mean "I see a 23x performance increase on my Ryzen
> threadripper". Admittedly that is a very artificial case of reading
> the same small part of a page over and over in a threaded loop on all
> CPUs, so any real life impact will be much much less.
> 
> Anyway, I wasn't planning on posting the individual patches, I think
> we all use git by now and probably find it easier than fetching
> patches from the list. So it's all at
> 
>     git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux rcu-free-v3
> 
> and the commit messages are a bit more verbose than I would have done
> it myself without tool use, but maybe it's better that way.

Obviously the numbers are compelling.  And thanks to Kiryl for figuring
out a workload that confirmed my fears, then remedying the problem.

I don't like the PG_rcu_free flag.  I hope we're guaranteed that folios
in the process of being freed by RCU will not be mapped into userspace.
That means we can use PGTY_rcu instead, where there is no shortage of
available types.

The workload that Kiryl identified (truncating/holepunching folios
from files) is not the normal way we free folios from the page cache,
so while we need to accommodate it, it's not what we shuld optimise for.
Most page cache folios get freed through reclaim.  I started sketching
out a new state (I was going to call them "ghost folios") when I realised
I was basically reinventing the inactive list.  So maybe we should make
folios on the inactive list immediately freeable as long as one RCU
generation has passed?

This may be where I run into trouble.  I don't know how RCU works
internally.  Is it possible to record some kind of generation number in
the folio such that we can see if it's only recently been added to the
inactive list?  Or do we need three lists --active, purgatory, inactive
where the folio is moved from active to purgatory as it ages, then
from purgatory to inactive after an RCU perid?

This will somewhat complicate filemap_get_entry().  It'll have to be
able to cope with finding folios in all three states, and moving
them from the inactive or purgatory lists back to the active list.
I think it's doable with the right cmpxchg() magic.

What do you think?

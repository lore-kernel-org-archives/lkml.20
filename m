Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB634734F4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933648; cv=none; b=FQC25luymcZIXz2rO1+26gpuRE1qMD2FlTy+S0LFUBHNdstA0f9qSkPbdNlTTMDxv0yoEeLlrmxJXrYOt0+kY+tkpUbPj7Np0ehDCpx1UkAwfPEM51eZXAbo4S950NoijDzICv5iG+Z7s2F0U5UGeIbb2V/qvHGEo35OYXWJfgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933648; c=relaxed/simple;
	bh=cWU3WeYa6uUolwQkaXyKsrhxLzWe8kBTtAlLE44a2H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FG5vsst1WwlxzHemEcvro+mFPUB+HNCb1eb+CAsSJ+A8WUo9cDnFSzYTRNVF5eNiRCl6Y6iDfAh+4Fl5otUkZ/o8dHC0XBcWB0ugRmEPuIivUmk1kynBmPCbnhVneSPjonbcPjA5jBDzW9Dl9vTqdEwyufD807GB0t5DPMYytIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHpEDoQy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHpEDoQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6D11F000FF;
	Tue, 13 Oct 2026 23:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791933646;
	bh=jiC8CjfdKGg/9xRJ2M1zfp1fJXqanJWTtOmmSFQ5vK0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=mHpEDoQymjOAnmVmeI69vDMEXcrS8IhmWgL9lz+Jv+BBfkLiVYKN0vI1w2iz2EgRx
	 FOLejqiP1QGy42Yu+4ORZNclzJsH4nIwifkpqMQiF/EHtuy2YRUoNmJ7K7gtsqYR+O
	 r+Oy8DQX35Mm3hcOsEXRtUJgaArjSOKVpCuyorLJL0HsEC66uHloYeCa3KQr9/y9Ov
	 FWy0hVUDBgOo1WVA4FEazwGa3pWRzMjSX6RvQ6WP9uwS2EWWVegdZOrJVCEyl/YCXD
	 mFsQA6Ag6WN6MbcVkxnyJaI5OiWg/nMgC2S/ONRoJs4wnMejGaz7vhEIyOeLDnhuiO
	 1pkNysghFajpQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CA006CE0459; Tue, 13 Oct 2026 16:20:45 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:20:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Kiryl Shutsemau <kirill@shutemov.name>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>
Subject: Re: Improve page refcount scalability
Message-ID: <3bb52262-b183-437a-a7ba-9e5f3c32f355@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as6ckC9NJVB8JBuV@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as6ckC9NJVB8JBuV@casper.infradead.org>

On Tue, Oct 13, 2026 at 10:03:12PM +0100, Matthew Wilcox wrote:
> On Tue, Oct 13, 2026 at 11:43:14AM -0700, Linus Torvalds wrote:
> > The fairly short series of ten patches basically enhances folio lookup
> > by noticing when folios are hot, and setting a "delay relasing this
> > folio until after a RCU period", and then using that RCU delay it does
> > not just the folio lookup itself under RCU (which we've done forever),
> > but also the actual folio data accesses themselves under RCU. No
> > refcount taking needed for the fastpath where we can just read the
> > data from the folio entirely in an RCU-protected region when the user
> > copy doesn't cause page faults.
> > 
> > Unlike my original approach - because it now actually delays the
> > freeing of the underlying folio data - there's no need for any double
> > buffering, and a lot of the original limitations of my original patch
> > go away too. That improves performance quite a lot. And by "quite a
> > lot"  I mean "I see a 23x performance increase on my Ryzen
> > threadripper". Admittedly that is a very artificial case of reading
> > the same small part of a page over and over in a threaded loop on all
> > CPUs, so any real life impact will be much much less.
> > 
> > Anyway, I wasn't planning on posting the individual patches, I think
> > we all use git by now and probably find it easier than fetching
> > patches from the list. So it's all at
> > 
> >     git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux rcu-free-v3
> > 
> > and the commit messages are a bit more verbose than I would have done
> > it myself without tool use, but maybe it's better that way.
> 
> Obviously the numbers are compelling.  And thanks to Kiryl for figuring
> out a workload that confirmed my fears, then remedying the problem.
> 
> I don't like the PG_rcu_free flag.  I hope we're guaranteed that folios
> in the process of being freed by RCU will not be mapped into userspace.
> That means we can use PGTY_rcu instead, where there is no shortage of
> available types.
> 
> The workload that Kiryl identified (truncating/holepunching folios
> from files) is not the normal way we free folios from the page cache,
> so while we need to accommodate it, it's not what we shuld optimise for.
> Most page cache folios get freed through reclaim.  I started sketching
> out a new state (I was going to call them "ghost folios") when I realised
> I was basically reinventing the inactive list.  So maybe we should make
> folios on the inactive list immediately freeable as long as one RCU
> generation has passed?
> 
> This may be where I run into trouble.  I don't know how RCU works
> internally.  Is it possible to record some kind of generation number in
> the folio such that we can see if it's only recently been added to the
> inactive list?  Or do we need three lists --active, purgatory, inactive
> where the folio is moved from active to purgatory as it ages, then
> from purgatory to inactive after an RCU perid?

The polled grace-period APIs handle the last sentence for you, but you
knew that already.  I am not sure what "recently added" means in this
context, but I cannot resist suggesting using the jiffies counter.

But tell me more about the meaning of "recently added" and I will try
to be more helpful.  ;-)

							Thanx, Paul

> This will somewhat complicate filemap_get_entry().  It'll have to be
> able to cope with finding folios in all three states, and moving
> them from the inactive or purgatory lists back to the active list.
> I think it's doable with the right cmpxchg() magic.
> 
> What do you think?

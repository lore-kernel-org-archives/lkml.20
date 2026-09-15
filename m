Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E394399DC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492438; cv=none; b=Cqc1ucbso1TMlG4vq4JII2fIX849NT1SDl8+ESdCt+c+8XOHm10zC3ZV68PT3t0+Jai8fZTLFOn4x+Fos/lVq9+tmDnPjL1VK6iFFUeF74CttY1pPsDQxGIz4h1WbcxfRHhrKSZc45n5EkXgCB3Vcdz5u8ITF4ko5NbiOtReaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492438; c=relaxed/simple;
	bh=B8vOUDw/mFIddBtWVTOTTbWauITyTSSELXFXRnFno1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eC6bhUE+TFbVXS7jLZCG7DMTJiM8lJ7p7IbkTE+0bbyUeu8aqqVEay1VPHEmI0pZprqXaaAK8TKia1WGK9eAD6MDWNNDNdQGGQCrXP2buwn2Fh6CK0wfdpbh76rIkcQHTSQyTfMEaogokoaA41jlkLCV855iobnHLgF6tayeKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uYx0502O; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uYx0502O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YjUHfOUDrYPjLwDx00t8Narh0DuwVAVgRAmMLLFkTFY=; b=uYx0502OpV1W4MIwCWgQnuiPwM
	sYiPyp+DDLijndBGWheIGilVK5gKml/LJ0zXqgLclUSaQRMarRWBfHCJd5piVw+y9BhlUO8fuhu8t
	Wm/y595hw/JvMO4w1smAveqIbV6074D/0XvzfQc/pghg0kMMq8o6cInK8ES/+tDvwlI+Peze9c9Y4
	6mj+QujbSeETLh9iAAekG3byYqEA8dAbxdEbDnNrowfMOm2V1H1s70Vl0nRnVykkC+aJP8d6O83+0
	XTZ/45GmDz0ZZXnvLlcZaYp8h/ZmdoycshO4aioQSnvmhwwQzCt4usjON7IicrYFm9PF0OVVhc70b
	JqxN0iVQ==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wj9-00000007YVz-1IEN;
	Tue, 15 Sep 2026 17:13:51 +0000
Date: Tue, 15 Sep 2026 13:13:34 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Ballance <andrewjballance@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] maple_tree: fix maple_range_64 crashes in RCU mode
Message-ID: <npw6xqsjzsdmtezkca4osoncnle62wvde7ycaladk3xzlmzguf@d7smzgbzsmpj>
References: <20260913-fix-maple-tree-range64-rcu-v1-0-31a130bb8cbf@cslab.ece.ntua.gr>
 <3aqxp6zcomm3wzfc6jt4nhltutnvoatqqsjxlxpxlo3j72eeva@nkqwz43zxsug>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aqxp6zcomm3wzfc6jt4nhltutnvoatqqsjxlxpxlo3j72eeva@nkqwz43zxsug>

On 26/09/15 11:23AM, Liam R. Howlett wrote:
> On 26/09/13 03:26PM, Dimitris Charisis wrote:
> > I was running a patched kernel using a maple tree in RCU mode without
> > specifying the MT_FLAGS_ALLOC_RANGE flag and the kernel crashed. I
> > switched to an upstream kernel, and after some investigation and
> > debugging (thanks tools/testing/radix-tree/maple.c) I discovered that
> > there were two separate issues on the RCU destroy path that were
> > responsible. Both arising from the fact that a maple_range_64 node that
> > is not full repurposes its last slot to hold metadata. Each issue is
> > addressed by one of the two patches.
> > 
> > AFAIK there is no in-tree user of maple_range_64 nodes in RCU mode at
> > the moment. All in-tree users of MT_FLAGS_USE_RCU that I found also set
> > MT_FLAGS_ALLOC_RANGE which makes the internal nodes maple_arange_64.
> 
> Hello!
> 
> Thank you for your investigation and patches.  I will have a closer look
> soon, but for now I have a request for this series.
> 
> > 
> > Below is the minimal reproducer I used during debugging.
> > 
> > static DEFINE_MTREE(tree);
> > static int __init maple_fix_init(void)
> > {
> >         unsigned long i, j;
> > 
> > 	for (i = 10; i < 4000; i++) {
> >                 mt_init_flags(&tree, MT_FLAGS_USE_RCU);
> > 
> >                 for (j = 0; j < i; j++) {
> >                         mtree_insert_range(&tree, j * 10, j * 10 + 9,
> >                                         xa_mk_value(j), GFP_KERNEL);
> >                 }
> > 
> >                 mtree_destroy(&tree);
> >                 rcu_barrier();
> > 	}
> > 	return 0;
> > }
> 
> Awesome!  What I ask people to do is to create a patch for the
> tools/testing/radix-tree/maple.c with the reproducer in its own patch
> that gets added after the fix.  This way we never re-introduce new
> features and the testing keeps passing for every bisection.
> 
> If you have one of these for each bug, then please add them after the
> fix.  I understand rcu is tricky to test when a race is involved, but I
> do have testing for many threads (which you probably saw).
> 
> The testing is less organized than I'd like and since this is RCU
> specific, you may need to use the testing file and not the module
> testing in lib/test_maple_tree.c.  If possible, I add the testing to the
> module, but if internal poking or threads need to be used, we put them
> in the userspace testing.

Your fixes look good - Thanks again.

Please respin with a few changes:
1. The message in this email will be preserved by Andrew including it as
part of the first patch change log so "I was running a patched kernel.."
should probably be removed and made more into a change log statement.

2. Add the testing to the userspace testing patch to enhance the test
suite please.

Thanks,
Liam


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794609;
	b=edcEzeLlZYA7q8zcQGcWDHLrrIgNKxmb+SboAP3wpbsQyIqlmbUM4cAM/QJ2OvN2sYW3
	 d54FJWbrBCop40FzuRIL9H6i7gOC0x0+cbG/qit4OLZttRAIN/10fjuVf+NByIseIL2he
	 8ta5HZxbK7mR/RoBq0sVvY5z+n3mFWLGkSy9FPwROWQHg0bTpPOWxnu2cXSy0xml9PZ1w
	 i+TvsK5qZgJcxsEuQ/P7zbsVh/HyYk+1FU2w3bqwRn6PQKChPSdKSOlWF3atnGqaV2rqM
	 z4BMLRuJEIBv/MwOG3UWAN4GmxHH94G1787QYtPTczK1S1YXYsp8mZAocODIWgdizXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794609;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5/3vwj+tiIm8HubUvjjG20WDs17JU+2NaRtagz2TVFw=;
	b=e1kXBRqnVUQqKWeBvaoXB2ZPOS4gixbT5jhZIUretIc13hv4559zPpNXXT1U2MeAmDQl
	 NazEsAWN81fJJWBMWgGpos2yQM6581so0ylm3VTJkJGKaWO6d/0u6DGWpnGkbSWPZfJZ0
	 rzVORgCDtUxL2aToJ+gSu2VQ9iPnLXyLYYGd4OowVzPD7YhDFuVmtNs+Ono57R/xp1Hb3
	 P1C/p38XjTBMgghSeOQlcj1PICa9oG+tjh4MiGuShlJivYoNvedff21xWFjS6Q1afhDUm
	 Qgs32ghExTVGc5evq7RZi3jDSAhkzyXcWgkVzVeW50ZfvUIZR6TIIqS6KDo5QQQ3qsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjXz8EtB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C836F606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjXz8EtB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6581F000C1;
	Wed,  4 Nov 2026 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794608;
	bh=5/3vwj+tiIm8HubUvjjG20WDs17JU+2NaRtagz2TVFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VjXz8EtBZHlvkbgkiDZA4dGgUrfn6x4W2ZaYI3reZytIB49vC7+K9tkSlFq8cnvAr
	 MfTS0Ovayt0zPn9AW9/ZEz4jx+zZMRXBsSe5PR/RhIo04p8vyofcnRSZ4KBKWTmfrk
	 IhqAJ8VQaaez+i9POmQRNK9CK0LGAu1yM0EDY8gbYijmKxNAX13KWX8qq21nIeKqr9
	 g3rl7By2zm9EO55PQvYWsyGKv+1McckTMwir1q56IvK7COH9oQmi/pZLA9ktpXwjB2
	 Q/Yjvxfu2GEOG7a3eSS85xpv06XoRIKkv9fOkKYZ7lpJQzrj4Y0FHzGeLTC0tuEJJF
	 pfUiyu44MfovQ==
Date: Wed, 4 Nov 2026 12:16:46 +0000
From: Harry Yoo <harry@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: kernel-team@meta.com, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array
 after concurrent resizes
Message-ID: <aush3AHoVsuLJ_Ig@thinkstation>
References: <20261016132510.789715-1-nickolai@csail.mit.edu>
 <179330739525.606664.13318485044610934477.b4-ty@b4>
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
In-Reply-To: <179330739525.606664.13318485044610934477.b4-ty@b4>

On Thu, Oct 29, 2026 at 08:59:01PM +0000, Harry Yoo (Meta) wrote:
> On Fri, 16 Oct 2026 09:25:10 -0400, Nickolai Zeldovich wrote:
> > mempool_resize() shrinks a pool by dropping pool->lock around every
> > free_fn() call and, once the pool holds no more than new_min_nr
> > elements, stores new_min_nr into pool->min_nr.  new_min_nr was only
> > compared against pool->min_nr before the lock was first dropped, so that
> > store assumes nothing changed meanwhile.  The kernel-doc allows
> > mempool_alloc()/mempool_free() to run while a resize is in progress and
> > the grow path also copes with concurrent resizes ("Raced, other resize
> > will do our work"), but the shrink path does not: while its lock is
> > dropped another resize may shrink the pool below new_min_nr and a third
> > one may grow it again to a size between the two, replacing
> > pool->elements with an array of exactly that size.  Storing the stale
> > new_min_nr afterwards leaves pool->min_nr larger than the elements
> > array.
> > 
> > [...]
> 
> Applied to mm/slab.git slab/for-next-fixes, thanks!
> 
> [1/1] mempool: fix min_nr exceeding the elements array after concurrent resizes
>       commit: 8dde7b06d2d819422c736dad7efb9635b6673cc2

For the record, I rerouted this from slab/for-next-fixes to
slab/for-next as it's not targeting -stable.

mempool: mempool: fix min_nr exceeding the elements array after concurrent resizes
commit: ce6518e61e3b4bf4f97f7ac6204049b9eba7eb75

-- 
Cheers,
Harry / Hyeonggon

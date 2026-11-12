Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470087;
	b=cDCN6hrVNM2xljYGwERO+aOU30+4mxJ/DtdgnwCgLBaWbXmI20jWla2BPGqj2s/x/tpw
	 93JTVMreZmotiJ8YpNDjMaMilue1rDBqxli96WmYoxfGyIBgq0qyJTYVjecEXNxW6go0y
	 XyuH9i9I6M30usWyNSnZX6MXldQWcmHmvkrNtGAG77gkWf/YQsqFLjWYcH9W/DY1m9wA4
	 qtOkg0GqjavfWeub3kNHoojh8l+4D6cX6j/1Ysz4ilSl5jlrXCceugU8hotHn08er3gb7
	 D2NoAjkSf7M5AENW1NFR45EfrqKpIbnNooxKGf6r7qurtogWxhoudUJtsZWRgqAdTOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470087;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AOyscFKrcf3HoEJx6DsofUhA5XV1u8geAqpYw/YcyDI=;
	b=3vd9H/be4+Va2EdPh1IM0GgbCKAdiMHeMt3oCyYi/8nmDaUef2nTdoLQIEieTtxxmin7
	 huKeVjYdFWJtXd3gSelg0NbGKiipvI4gY3uA67sv3iV/fT6KB2mMnUQrT3OoyvnPhpseb
	 GfVKJ109KK1rwpKMkKTdZkbhB68fUgH00RaxuHY3MP37R6kCTPsG7eiG2XLPTo0B4xAtA
	 hMr+dzCO47nNE0V9LrlMqcV/dmrL1a2RFe6nIHgUIFIeJwvs4AyyKEcgxFqWjxewB5Q29
	 FD+VaZGKRnLs3/VJOAoDUMfgywXpPh/EMfzHNMCxuqN97HUXGCTzkDIykTGpJ5TYelQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=trl+XZ4x;
	arc=none smtp.remote-ip=95.215.58.85
Received: from mta1.migadu.com (out-85.mta1.migadu.com [95.215.58.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E8606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646E8606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=trl+XZ4x
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=F1KV9kfLOuuKpASrj84EFbYg1WhgMuoDLqyIrj1tqDg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794470084; v=1; x=1795074884;
 b=trl+XZ4xOQJCHNmSKbDaI/7F9e2Y0ilzx2oFKYKdUfKkHZ1DhCkki/6gxky811EDDsFADVXB
 hXYSwyBOG9GDUOElAW2Fj+BzvDXp78y96zi4zzgg3zYPIsePgNk7I5AyYT5Chq8NbOGNVbCT6wk
 j9tpRuvZM4hjsj5zOK8XPoNQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 30a148ff905e7f1e;
	Thu, 12 Nov 2026 07:54:44 +0000
X-Mizu-Trace-ID: 30a148ff905e7f1e
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 15:54:34 +0800
From: Hao Li <hao.li@linux.dev>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: harry@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH] mm/slab: don't set SLAB_MAY_ACCOUNT for
 KMALLOC_PARTITION_CACHES
Message-ID: <avVnuWCQW56qznll@fedora>
References: <20261111125628.375624-1-hao.li@linux.dev>
 <e2d1dc9f-59ff-4dfb-8ca4-35c584d14b35@kernel.org>
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
In-Reply-To: <e2d1dc9f-59ff-4dfb-8ca4-35c584d14b35@kernel.org>

On Wed, Nov 11, 2026 at 02:08:40PM +0100, Vlastimil Babka (SUSE) wrote:
> On 11/11/26 13:49, Hao Li wrote:
> > An allocation with __GFP_ACCOUNT set (without __GFP_DMA or
> > __GFP_RECLAIMABLE) is redirected to KMALLOC_CGROUP and will never hit
> > KMALLOC_NORMAL or KMALLOC_PARTITION_CACHES. Consequently, neither of
> > these caches requires objcg slots in obj_exts.
> > 
> > While KMALLOC_NORMAL already skips setting SLAB_MAY_ACCOUNT,
> > KMALLOC_PARTITION_CACHES still carries it unnecessarily.
> > 
> > Extend the check to skip KMALLOC_PARTITION_CACHES as well, saving
> > unnecessary objcg slots in obj_exts.
> > 
> > Signed-off-by: Hao Li <hao.li@linux.dev>
> 
> Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Thanks!

> 
> > ---
> > This doesn't seem like a real bug to me, just a small waste of memory, so I
> > didn't add a Fixes tag.
> 
> Hmm I'd add
> Fixes: 7def2e8549e5 ("mm/slab: add cache_ and slab_needs_objcg() helpers")

Ah right, I mixed up Fixes with cc stable. Thanks for pointing it out!

> 
> The question is whether cc stable as well. 7.3 LTS will be used for Android
> and IIRC they have memory allocation profiling enabled. Not sure about
> kmalloc partitions. Cc'ing Suren.

Makes sense. If Android uses partitioned caches, then it looks like we should
cc stable.

> 
> > ---
> >  mm/slab_common.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > index 2befd24b4d09..f0ea1fa178e7 100644
> > --- a/mm/slab_common.c
> > +++ b/mm/slab_common.c
> > @@ -1000,16 +1000,18 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
> >  #endif
> >  
> >  	/*
> > -	 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL cache and not
> > -	 * aliased with any other type, make sure it's never merged with any other
> > -	 * cache.
> > +	 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL or
> > +	 * KMALLOC_PARTITION_CACHES cache and not aliased with any other type,
> > +	 * make sure it's never merged with any other cache.
> >  	 *
> >  	 * In other cases the kmalloc cache may end up being used for a
> >  	 * __GFP_ACCOUNT allocation so mark it as such. The exception is a
> >  	 * KMALLOC_NO_OBJ_EXT cache.
> >  	 */
> >  	if (!mem_cgroup_kmem_disabled()) {
> > -		if (type == KMALLOC_NORMAL && KMALLOC_RECLAIM != KMALLOC_NORMAL)
> > +		if (type >= KMALLOC_PARTITION_START &&
> > +		    type <= KMALLOC_PARTITION_END &&
> > +		    KMALLOC_RECLAIM != KMALLOC_NORMAL)
> >  			flags |= SLAB_NO_MERGE;
> >  		else if (!(flags & SLAB_NO_OBJ_EXT))
> >  			flags |= SLAB_MAY_ACCOUNT;
> 

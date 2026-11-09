Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193293;
	b=FezNj65A4iE3AMol1gDGpReF9sVBRuU8CrrgHLmtCtKdliBAc1eChlnQjEWi8MVItP0e
	 TllHQx7vGsQzGFyrZMReCTzs7WKeOTv9+5WuoSEkk5AXE7MlWEiXgjZwpfb+JB2KKGa3b
	 DXdq1V3fMcJrqFYlym/0AuLkB7HBgErKji9WTaU6c0mreV5UpgW+gCMubLy0nIit5W6Zi
	 qsAlSkUvKjix1Xv0Cvv5/+9iqqNkCrRvLdQRHraTmWkUNCZf70zRIOjxasZxcBIgc/e1G
	 s7e6KxnKkMYd8ETJrdRbtUcNa2BxrIgxnqd78S8vgxWZTt8PRu+DpFl7tYPWnNTRUXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193293;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Y0cBsTfKr29EprWvRWdTno7HJ6tVflTBayogkYmKhf8=;
	b=1JvY3T7EOEmi6rsTt0YJna/WW2FVWFa0KpN5YlVEPuBr5JG3NvBDOmhsKo85RZDmmVUP
	 3GpCVW5rT0CN6PwyW6rGca1fr+/TGPJXGUxJWt62YXnpERZdNo11rdfWtbXSUeFiFUour
	 fqU6qIhvn5nJuymNH/3//KJuQ8wwmSK5eQZTXtAYqyrbaOW7fpvZR2Q7yE/vIzb1rR6Fq
	 qrgfbAN76EPPQRhey82oHLvUgozVEauXqjJKL1aJ9HWcpTMdIzpDrBWO6S8HG3SIMELHZ
	 CXVuwrX9kgEDLWlyaGj0AHV4TvULzJ7eczW00d0H3isuYpNNArDTesx5xpwGMS0VR9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J94oXTKr;
	arc=none smtp.remote-ip=95.215.58.84
Received: from mta1.migadu.com (out-84.mta1.migadu.com [95.215.58.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF6C606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF6C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J94oXTKr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sPWwyCgiEM79EBArYvsUTzRVt5A3f2FMp+z7ozhU+4M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794193290; v=1; x=1794798090;
 b=J94oXTKrpISxrFZDMcsRTX8ndZq5TdkicIjyguqi0hP6sytimOkWguN6F5Vvk7D30cU4pugx
 CrUzSTSlhyxjns081C0A19ec3Snfxuu6eg70ZFbZT5PmPZBXt6BzNaxUjS8jk/ATMbgY7UnYyeS
 itaN52sRfHwWGwDs3m9slzQA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b7bc58d81506faf9;
	Mon, 09 Nov 2026 03:01:30 +0000
X-Mizu-Trace-ID: b7bc58d81506faf9
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 11:01:24 +0800
From: Hao Li <hao.li@linux.dev>
To: Harry Yoo <harry@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/8] mm, slab: rework KMALLOC_RECLAIM handling of
 SLUB_TINY
Message-ID: <avE01iTQccxQnhl6@fedora>
References: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
 <20261024-slub_tiny_rework-v2-3-bf1419ab5ffd@kernel.org>
 <auHcj2G78VkXy-Vz@fedora>
 <auycUvCC2mL_EQ1r@thinkstation>
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
In-Reply-To: <auycUvCC2mL_EQ1r@thinkstation>

On Thu, Nov 05, 2026 at 03:19:01PM +0000, Harry Yoo wrote:
> On Wed, Oct 28, 2026 at 07:43:14PM +0800, Hao Li wrote:
> > On Sat, Oct 24, 2026 at 09:07:25PM +0200, Vlastimil Babka (SUSE) wrote:
> > > One (relatively minor) aspect of CONFIG_SLUB_TINY is the assumption that
> > > letting reclaimable and non-reclaimable caches merge will save more
> > > memory, which is more important on small systems than the page allocator
> > > level fragmentation (where distinguishing reclaimable slabs should
> > > help).
> > > 
> > > For now that has been achieved by #ifdefs that result in making the
> > > SLAB_RECLAIM_ACCOUNT no-op and aliasing KMALLOC_RECLAIM to
> > > KMALLOC_NORMAL on the enum values level.
> > > 
> > > With the goal of converting CONFIG_SLUB_TINY to a boot-time decision,
> > > rework this so that SLAB_RECLAIM_ACCOUNT and KMALLOC_RECLAIM are
> > > distinctly defined always. Now, creation of kmalloc-rcl caches is
> > > avoided by assigning a pointer to the normal kmalloc cache on the
> > > kmalloc_caches array level.
> > > 
> > > To prepare disconnecting of this boot-time decision (and the evaluation
> > > of the need for kmalloc_no_objext) from CONFIG_SLUB_TINY, introduce a
> > > slub_tiny_enabled variable that's initialized to the CONFIG_SLUB_TINY
> > > state.
> > > 
> > > There is one minor functional change for CONFIG_SLUB_TINY=y. Since
> > > SLAB_RECLAIM_ACCOUNT is not 0 anymore, caches that differ only in that
> > > flag will stop being mergeable. If that turns out to have a noticeable
> > > impact on memory footprint, we can adjust the merging decisions to
> > > ignore SLAB_RECLAIM_ACCOUNT when slub_tiny_enabled is true.
> > > 
> > > Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> > > ---
> > >  include/linux/slab.h | 10 ----------
> > >  mm/slab.h            |  5 +++--
> > >  mm/slab_common.c     | 12 ++++++------
> > >  mm/slub.c            |  2 ++
> > 
> > [...]
> > 
> > > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > > index 02dfe4351e8b..33e76a0c3084 100644
> > > --- a/mm/slab_common.c
> > > +++ b/mm/slab_common.c
> > > @@ -1009,7 +1009,7 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
> > >  	 * KMALLOC_NO_OBJ_EXT cache.
> > >  	 */
> > >  	if (!mem_cgroup_kmem_disabled()) {
> > > -		if (type == KMALLOC_NORMAL && KMALLOC_RECLAIM != KMALLOC_NORMAL)
> > > +		if (type == KMALLOC_NORMAL && !slab_tiny_enabled)
> > 
> > (While reviewing Harry's patch [1], I happened to notice a small inconsistency
> > in the current code. Since these lines are being touched in this series, I
> > figured I'd bring it up here, even though I haven't properly started reviewing
> > this series yet :D)
> > 
> > IIUC, for both KMALLOC_NORMAL and KMALLOC_PARTITION_START + n, if gfp has
> > __GFP_ACCOUNT set (and without __GFP_DMA/__GFP_RECLAIMABLE), the allocation is
> > redirected to KMALLOC_CGROUP.
> 
> Right.
> 
> > This seems to mean that neither KMALLOC_NORMAL
> > nor KMALLOC_PARTITION_START + n actually needs an objcg slot in obj_exts.
> 
> Right.
> 
> > Right now, KMALLOC_NORMAL already doesn't carry SLAB_MAY_ACCOUNT, but
> > KMALLOC_PARTITION_START + n still does.
> 
> Ouch, good catch!
> 
> > Given that, would it make sense to
> > change this line to something like:
> > 
> > if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END &&
> > 	!slab_tiny_enabled)
> 
> Maybe you could send a patch as it's a separate issue from the patchset?

Sure thing! I'll post it once vbabka's slab_tiny series lands.

-- 
Thanks,
Hao

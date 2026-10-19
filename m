Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441324;
	b=1aDQEg96fdAqKfrXb8Z93mNUnaHOc5cE9flP0gadUF4b1ugv12FPnyghJUDtMFQIyyrc
	 hENvhoib3XQUJAvMQoBIp/m45ravMDsUyKGO1dEj9bQZhdqtbpH4acMxmtirV3u3EeMqB
	 EIgtI2j4DBerkVnjphyNZkYqh5mg7Z5jcKjo8ytqdtsEuySJy/Jm0p61nn7XaH5PHIofU
	 jolNvj40vZGu2dhueteLYMVTkOtAmSpXc50V+b08tH6+ZXJOAoa7Ngj/kt/0xoRwhv5Hd
	 J8BuMaTaJtgWstsLEkqcOO4muypB0wAbXSxJgu6zkpDilkoVRoD0VzVBQMvo0NZ8H9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xaZswgjMQxqUYMWBnUZYKi38KmIZV7yoAiPyk8ZDoPQ=;
	b=md5IT0Ct8wWTCVVSsCZioefheIK6kuVZCfxfD4ekUtgxjg2YCVoCnOjPrUFmAsjWnEOu
	 3jCETVomz2aPHoCoU4v3p9pWXpE8445XxbeL4dKFl3sIdRLBOxs95ODA4AihQDBw66Ds1
	 1ajGwKHYk5aGpJ7loW/oEJrJss6ewEAs9pTQRetyKuZrbwW2pR5KRJTcAXNrtt2TxEEGK
	 hmXiWBHUmaZMY+blzGy4sIKlkp0kdPKH0QWRmi3rDX6iUCdfS3ZAbhtCF07w3w2XiziHW
	 NE5zlbqXCyPQMNVYx+tcYMTS82pLQqgZdIpkj1qiZzImZpQnGqbi99UNmElvQX9779w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Etj1uhkN;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691C606A322
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B691C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Etj1uhkN
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53512cd2f85so28786041cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792441323; x=1793046123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xaZswgjMQxqUYMWBnUZYKi38KmIZV7yoAiPyk8ZDoPQ=;
        b=Etj1uhkNvH8RmH0+szbsI7rPAC+zjPoSSyxVhXzvlVrSY+ns7YGODT4bOwTgjA91Rt
         IDwpcB+IXEgM2bOa2uOeSxB338D8WmTmdn4K/E0ZhucxX9r1EQPJVVk1bDrRSWg/NDZX
         bW8pM7QZ+rrMjXVeD/cVCf5/DOgBg2ZlzFaulek6kUSn2St0M1Z4hh+baeluInQ8r0hU
         Ld4BQMPv5BS3mGIpcnKmMqSEREfhXRZrFPGcG68WHFsLK9LN0lgJ+iGfBCDiq9enpvYx
         c9jfxOb141iKJRj2s7puROofBAXH4WVFtwYT2K7Bi3S7J+imaSrbv8ZMa4WcLRTpQOfB
         paLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441323; x=1793046123;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaZswgjMQxqUYMWBnUZYKi38KmIZV7yoAiPyk8ZDoPQ=;
        b=RKbmYSoq/8yCVJPv8gXNOaPQafhmV6P57epvAeVnoSqoS6lgPFATpRZiQRZXGxoO/m
         /wEQf//RradfJWxGqOMUHvLKcoL6umZTwhKK+byEsy2lMXfmGo8cXOeWC1VcRz34pz3y
         +Y3Aqy5c55Bdu/cMMCpTyY0cN9MCe2wsRDvUP4uliRQ3uQ34UA3pU9A5STnPNPr1iZNz
         ic1kxXrl0W78qGQsHaiwRXp8V+Sjyfjzmzoe87VMvGEh4HvvsRH+sBrQATP7Sunfda23
         mJuKzwrFBF22bIuu8zIukme3dMusHPcKPxdZ9rej2oRov11RWPTE2zrJFOyQEzXp9scs
         D43w==
X-Forwarded-Encrypted: i=1; AKwUvBxI8PGluHJpAEDadJx4dFUasuzoFmovfxcBgDoY8GkV2aZGQeToUb2ZogsCRULfs90y9dY13F2+ba05690=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Hs7CvCoPyb0fu8yejtQhA+iyzCoq6dygHvOBgzdeCCeKSXpI
	nCvWziskCshnR3NsFa52Fyh55ds6zyF00NBQGPSGVyEpcy1IN+bGY9S8spSvWvQ2ybo=
X-Gm-Gg: AYBFou0OvlGDEGZ+pIUj9INSOjLOhR2XU2KXi09cMy8mVoFrpu8R5l2qXNlJNgqHTs7
	g7WLt7whQPjFfxdW/CAoZAphnmSngM2X4TcrWOZM7jnb7jJA8gVxbt5GQM0oBk+44ydCHe8/Drw
	UXjpSYres5yGrRML+uqPbKgo9sfBlfE6bTb1g8TdJCVi4UflqOGhF6XdgbhBrn3BN1rfn8wXI7x
	mnSevzfx/Ca3Jr2Jfh5Gchjs41DpoWoym4V9M3iHTOq8uVbHst4SqSjwq55xceLnEtzvdlzmdJd
	c4LeI75x/8t0PWqqGp7f3D/4c+YSi5rv3Vp++wfVkb1+pH1MUsAUDfTym8fF8Y8Z7X7uY+qOlqK
	5PvzzHWRsRNH3rlp8XMWdi0aQV1/0jhRzMjg+xq5cAWitBDRSoabzEJNu5Ljoy85jFLM3UY29jp
	sgZtgka4mLa2axft6DjaUzd0vcm1nt/JduDctYl5+s643jvrE1Ur6GJqsgIBi1GTg+mGDebRmIj
	RNdqFcEC+Iu5CKVX8QRTb+yJs684QBFPNKc1tek/8iw6acVKEhe5oY=
X-Received: by 2002:a05:620a:258d:b0:93a:f9:614a with SMTP id af79cd13be357-93f29d3838cmr1482213385a.34.1792441322748;
        Mon, 19 Oct 2026 13:22:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b0b9098sm46239385a.30.2026.10.19.13.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:22:02 -0700 (PDT)
Date: Mon, 19 Oct 2026 16:22:00 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com, weixugc@google.com, aneesh.kumar@linux.ibm.com
Subject: Re: [PATCH] mm/memory-tiers: reset demotion targets of nodes without
 memory
Message-ID: <atZ67m_JYJADzY-C@gourry-fedora-PF4VCD3F>
References: <20261019184712.3422641-1-gourry@gourry.net>
 <DM91RXTJ5EFF.2YQARRB6TXQIK@nvidia.com>
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
In-Reply-To: <DM91RXTJ5EFF.2YQARRB6TXQIK@nvidia.com>

On Mon, Oct 19, 2026 at 03:04:45PM -0400, Zi Yan wrote:
> On Mon Oct 19, 2026 at 2:47 PM EDT, Gregory Price (Meta) wrote:
> > When a node loses its last memory, offline_pages() clears N_MEMORY
> > before the memory-tier callback rebuilds the demotion targets.
> > disable_all_demotion_targets() resets only N_MEMORY nodes, so the node
> > keeps its old node_demotion[] entry while it has no memory. Before
> > 6c542ab75714, the reset covered every online node.
> 
> establish_demotion_targets() uses for_each_node_state(node, N_MEMORY),
> because the to-be-online node is already added into N_MEMORY?
> 

NODE_ADDED_FIRST_MEMORY happens after the memory is already added
(though not necessarily online). 

NODE_REMOVED_LAST_MEMORY happens after the last memory block is removed
(and therefore N_MEMORY is gone).

slightly different timing for each event.  There isn't a reasonable
change we can make otherwise.

> >
> > A reclaimer reads the stale entry only between the node regaining memory
> > and its targets being rebuilt, and it filters the entry against the
> > current allowed targets, so there is no user-visible effect. To see it,
> > online and then offline a node's only DIMM: a debugger still finds the
> > lower-tier node in node_demotion[nid].preferred.
> >
> > Reset the targets of every node.
> >
> > Fixes: 6c542ab75714 ("mm/demotion: build demotion targets based on explicit memory tiers")
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> >  mm/memory-tiers.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
> > index 25e121851b586..7197f1a67a340 100644
> > --- a/mm/memory-tiers.c
> > +++ b/mm/memory-tiers.c
> > @@ -378,7 +378,7 @@ static void disable_all_demotion_targets(void)
> >  	struct memory_tier *memtier;
> >  	int node;
> >  
> > -	for_each_node_state(node, N_MEMORY) {
> > +	for_each_node(node) {
> 
> I think the above code deserves a comment explaining why for_each_node()
> is needed instead of for_each_node_state(N_MEMORY), because when a node
> is added or removed during memory hotadd or hotremove matters here.
> 

Sure.  Will respin tomorrow and give others a chance to look at it.

~Gregory

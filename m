Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B8249B21F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166078; cv=none; b=rjOfcPhfY7MeTJo0DHylOe9y/VEhtHiSFAtbdyJgTmN4yTSZModym8b+Njqe1n2D5OtvIP85zRLJR/iLqagG0oMlEVuSeXH9DQnXkEPJF0+hRbnlfq+S3CQqtcu3eKqlNjdIb80B1y72kq8p1MMAiLMt1UOtmBep/Gt+X8kCUCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166078; c=relaxed/simple;
	bh=wjuk4NCrie5dMBbhM88AldrzUZxv3A0d8nLHTH6WJX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLINyqtZGb1ov0XkGiBC1FmjEnZ1OslaYyhVLDto9/fhPMSD2hRkjk1L27V0kOwWKpN92bfxq8TQmnyqTTrT7WNqJJRYinpLdJlrUE6cLnv1ucPAEN1AIPWtaz0wNK8IV2ofcT+UpemTEhOyMFKIAzkBZNiGPhJ+vRk0Blw6rpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD+qgMfm; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD+qgMfm"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so885921f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166074; x=1790770874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TL+zy+izjVx2cYsJok0G732OpLexLuuUAzyKfEF0o8=;
        b=FD+qgMfmGmQjMb6al383LngVUsQv/APWkPsxecLMsoS+7EzTfir7ucBOUAfi/lhqbW
         XfKz8UMkoBSckLyKHqXHG5bcGBJIhml0v3gCf7iXJRaT+S3PalcCJcicUeem7fIjGQKK
         bE8he8XTtSbbUW7xZjQ9f7DP1wCDCMID6FSdPKksB4ihRRlZnn1tOSTTWQgetsBzoG+U
         n+MT0gR7d/KrY0KdsI0MXb4W3JkZ6Q2A3SEPIte0psPv/koqtLL+VoCIBYELmZzXPj13
         6OfOdiavlw0oIK5QNGaccGjjX2iWi3d73ki3X3B9xsTtaOFqQqPC3vtI9uGjYxvNY48m
         NJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166074; x=1790770874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TL+zy+izjVx2cYsJok0G732OpLexLuuUAzyKfEF0o8=;
        b=rwIz0osxr4NLOyy3muJHB+FEwTkcYoityGfP2Tgj5DTmPB0eAdzpHSXWMQYqqhTuAP
         1IVgv6vnAl80ScFXWwUA8S/yNZmyE9G9HaUoFQ2KyH0/C3fuvW/1jRHeGGsD8RHQ9TBU
         nt/Ok+d1ccJyarTkMo1cW6yPR/sHN8UGyIAbOXyAmgwN+YTMnzBBe++OpAXujtp332nz
         ++29oRaxDQbujOqQ5ecyRNIc2vTTRBg2svV/1+uyy6n/ImriSZOAcpy3P/VEWHP0cF7O
         qA3oPCw4I65rbf/nYZw2wYLKMCPkCTjoe5WVt0KmH4n0kEqJmtjDRpVXSUMc6BdfRIxy
         aM3g==
X-Forwarded-Encrypted: i=1; AKwUvBySf6NEa3Td1yS7pGOoOtA0z6hgFo2wJYFArwYaKNGOFuyECxJSQxPrb7gpkdIP85vaxibesiL8HQrps2E=@vger.kernel.org
X-Gm-Message-State: AFuF++kh4zUDBqJUZaSbCutbp0eOESm6o2tSkz7WSy9fLbxPp61wNanv
	ZshoC3wMl6TIh8scK03oZGAVaGlwEduFUcZ5DxGFeN4RZQiQ19SV+IKl
X-Gm-Gg: AYBFou1+A01ywtcVR3Lgz3SR7yqPEcz9qJph/V8iGc83+JH74b98LLtT85ztdHkLsyO
	BZ0ESMIULgfjxisAmAT0xCxoRFxKQYjXckpCkpTAmhqQahXgWxsKN+m8XBemb1gF6YqHxEM3CXl
	bBfGpfgR0XV498Jmas/ICJNP08RnkOWjd4oV90bQAqFQIDeFMSRlm4szx5uzRB2yd4kyKACOzFC
	X8CPkmT0FdeUuWDp5NF9bIzwgxO2BLy4l04CVjfBrWNDoVwJb4U+hRc7ZPeeMoHJFRrNT25oIpC
	64RYp7SF4h+lTJ0xJsNxEILLEowuWBCSkoxcLCBZFzGfb3A4twVKay/Rg60I7JLRtiniBLBqqoZ
	bLWiqvhCLQzhjaxdNldp82glQBV3OW2OH9vy/69E9VMes9c5/uoRFz7Is+EyKfYFmLtGwgub2JD
	JXcO8io5p30ergKGUZCK0EvLTLqTCMFP48vuwGeHSCODJ/IJh9QtrY8XUXwKBvHx9C3mB4+ZxSj
	lih//DdQBq/5TABG/qd/dnbXhc/yH3p5GHcKchfiPBfMKCnHe2km+BCpkNcY83KfDRYuQ==
X-Received: by 2002:adf:e18c:0:b0:487:aff:c060 with SMTP id ffacd0b85a97d-4886709d0f8mr3962430f8f.48.1790166074377;
        Wed, 23 Sep 2026 05:21:14 -0700 (PDT)
Received: from KASONG-MC4 (11.pool90-167-203.static.orange.es. [90.167.203.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848636asm6261900f8f.6.2026.09.23.05.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:21:12 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:21:08 +0200
From: Kairui Song <ryncsn@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: kasong@tencent.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	Shivam Kalra <shivamkalra98@zohomail.in>
Subject: Re: [PATCH v5 09/17] mm/huge_memory: rename remap_page() to
 remap_anon_folio()
Message-ID: <arPD3ztCpw0r0mBu@KASONG-MC4>
References: <20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com>
 <20260915-swap-thp-cleanup-v5-9-39878b37dfb0@tencent.com>
 <6e542162-fe6c-47da-b0c4-a36251242950@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e542162-fe6c-47da-b0c4-a36251242950@kernel.org>

On Fri, Sep 18, 2026 at 10:46:55PM +0100, David Hildenbrand (Arm) wrote:
> On 9/14/26 19:14, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> > 
> > remap_page() now only has one caller, __folio_freeze_split_anon(),
> > and is only ever called for anon folios: unmap_folio() currently
> > leaves file folios unmapped after the split, so they need no
> > remapping.
> > 
> > Rename it to remap_anon_folio() to make that explicit, and add a
> > VM_WARN_ON_FOLIO() documenting it.
> > 
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/huge_memory.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 1749905ade6a..77bf68c9b9af 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -3552,7 +3552,7 @@ static void unmap_folio(struct folio *folio)
> >  	/*
> >  	 * Anon pages need migration entries to preserve them, but file
> >  	 * pages can simply be left unmapped, then faulted back on demand.
> > -	 * If that is ever changed (perhaps for mlock), update remap_page().
> > +	 * If that is ever changed (perhaps for mlock), update remap_anon_folio().
> 
> See my comment below, delete that comment about "what if X" entirely. Also, we
> wouldn't want to update remap_anon_folio().

Sure, it was added due to some previous reviews, but things are cleaner
now with the renaming so just remove it is indeed better.

...

> 
> Add remap_anon_folio for file folios? Just delete this entire code comment.
> Whoever wants to implement that can look into the pieces that are actually needed.
> 
> 
> With the comments sorted

Thanks!

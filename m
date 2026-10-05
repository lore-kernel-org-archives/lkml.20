Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A7F54707F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791176339; cv=none; b=nIPfYlBMfmtABXdjLZieCf7apARCpLuwXYwoDlMYpt4FsHzsVIp5b5tAu6ntE8X/kUYpUPEACE9s9PbHrpPbDv24R8zINaXfgxqBY4cwtETqe9x0PNq4u7briOAI6QghxPZfn+3OmZ6JXzU+0PxgifoY/5ex6mSv0YbbSJ/oD3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791176339; c=relaxed/simple;
	bh=OWeLqewt6cDtSzZMGAcsd1VNoKJM2XpzzuMOzXs1SEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwr9uXieSKC3ABkRFaju94zFK4uNaKnVEY6lK3V+RzHLzMsAwTUF9dfhVVbt3L8kXDxlhbGLHcnDISol9MWY1VDo/RtdlnnpZMVL/9RITHxK5r1V3bdxzoExGFpGVkNCmFRQ55PMaBKnrKIB3seiic6/fZLiEaHRxH7Grvfnsms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BDle2CA1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BDle2CA1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so48305ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791176338; x=1791781138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wh1AxkS8SWKuWWWh7pZFQjWGZF9aNJY94i0CrRQCRF8=;
        b=BDle2CA1N8YViKalxWMaeUIabFFYJK75CyBPdggBqBUwrqQSo+4iu7xUiA0Ku334UU
         Ze//pRClTf9Cluy6OK21LdSLCF8wZAxqXfpUznm+u4OhvLP8Npt7NgcuxourrV/ceL0C
         hMGgWqNQktOjbdkt/Pjl11TqkHHlHJw+X03X4Fj6SDjNF9/hOtXEHkihAEs/TCsWJmHM
         dC0uPpRLKsaAUea4xVb9ZJnVB/frrOIM8gZb0vz+qxbs62YGXsCxDCdmnBiadPsPD3lM
         aplDoekDMhBkoauP/eTpM21OYs09FZNq0k6OqiL181HhXytPxj3mzlrc2pAPBgea+6Yc
         6/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791176338; x=1791781138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh1AxkS8SWKuWWWh7pZFQjWGZF9aNJY94i0CrRQCRF8=;
        b=cKiL7VEWe8HJlypXRM9VOm/QsiF70lkAMFrHEYMnPpr6YG8I93JQVylhcdMaUTPrBo
         ETyU2aefuaQe+fArH75m12xA4Kf9HYLkA9T4kV8jJNFCFxC1UA1HzbuiEwgnnSF4kf2h
         aBsDk5Zj+ggs95tJAwS+JNUtFmrlc29EX3e8sCwzY5PCylPiCrn25q4HCWCAPUYbT2bB
         vQVESU2mPqTJFn7K3KkLXV/YMbsaJNspLtpiLohGq4HfZtU6DjtTEv5SpwDbjkOjjr3z
         7jtjlSPoRpSJ3bktyHjFnGQ4yRnpuwMWqdvI/RrKS/qE3fe7841PVFVA+EriiyLm7kiv
         oDSA==
X-Forwarded-Encrypted: i=1; AKwUvBxpkxEzV50F/bxUpq1SjKMX0mId5pGB6lPCn/kuXNaUT2UIzDmewlOxtjlTf/g8bNQtP5vZBqnnU33ttCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRHeV+l1ve5LkBddlNuY6VcU97VvmOlUrVSUyp7eUn2swTChOi
	d9Sx4koDS6hUj5yKTYCho0HW4Wk3TVw+96/jqUdXIUfGvOxzN905XTw+p/6WZjjFaQ==
X-Gm-Gg: AYBFou1AsPgCS0yxd0O55npGdlfPRFyh3gvwMtR2p5mmjyqZSjZKPNcng938tr0VzE8
	+X4l0IlHsY0dpnFcWfHfMCDep7dFiWR2maiip+hIEcihhxtUOCYWC9ukrGfJOqyB9aFDnUOt4X1
	wmlx9wHHMX81XOoNKE+JkahKnoslZgoWYB9f1pUea7P41yTtRNyoDxoaCWBOa4UXwHpoXZTjMj/
	KPtDHB1bUxuTglMS+7nJOPlvdOE3+PCDL/34LvAz7tpPbXrXwA5W+eGg5y0e1XtKurU/0wJNsNA
	1X6uN4iyZQ88FMGVgi0vj41Zi9cthS4S7qzPJN0L2zF3BJcxhusAhorx4KwmoMeQMCIGLJZgk8y
	fiqElfCkQh8KgFMtsLfFd4WJ4ECjrTuy8TTq7BzvnkMsm7elgjQMJSislck56rpcw9gg9QRR//h
	yV/z2cgR28B4VCPEHzwLkase+0w3dKRkxLvdp/UDdD12gTeXX6frt2Pc2WunIjS0xgn0RpmoVGK
	xFKLq1GL7XLqiJgnW45lf96gc9BLUdUTOno
X-Received: by 2002:a17:902:d987:b0:2d7:1cc3:a69c with SMTP id d9443c01a7336-2e5339b60b6mr5288515ad.7.1791176337084;
        Sun, 04 Oct 2026 21:58:57 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d901a2asm185534a12.17.2026.10.04.21.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:58:56 -0700 (PDT)
Date: Mon, 5 Oct 2026 04:58:50 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Logan Odell <loganodell@google.com>, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] iommupt: Introduce IO page table shrinker
Message-ID: <asMuigioXmHZmjO2@google.com>
References: <20261001230219.818128-1-praan@google.com>
 <20261002150844.GC3481470@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002150844.GC3481470@ziepe.ca>

On Fri, Oct 02, 2026 at 12:08:44PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2026 at 11:02:14PM +0000, Pranjal Shrivastava wrote:
> > Introduce a lockless, deferred reclamation framework for IOMMU page tables
> > built on the generic_pt library. As VMMs and userspace drivers map and
> > unmap large, sparse IOVA regions through VFIO and iommufd, page table
> > directories are often left allocated but completely empty. generic_pt
> > frees a table when a single unmap covers it entirely, but tables that
> > empty through a series of partial unmaps stay allocated until the domain
> > is destroyed. Under memory pressure, this *stranded* memory cannot be
> > reclaimed and has resulted in OOMs.
> > 
> > This series refcounts leaf directories natively in struct ioptdesc and
> > registers a domain-aware MM shrinker that prunes empty directories under
> > system memory pressure.
> 
> We had talked about doing it this way
> 
> But I had proposed a different, and possibly simpler, solution that
> addresses *just* the iommufd use case.
> 
> After unmapping something have iommufd compute the gap in IOVA that
> contains what was unmapped and then issue a 'clean(gap)' operation to
> generic_pt.
> 
> This is the same operation as unmap, except we know now that the gap
> has no PTEs so all it does is clean up the table pointers.
> 
> This requires no special refcounting or anything difficult beyond
> some locking in iommufd to hold the gap stable while we clean it.
> 
> Would it work for you? It seems substantially simpler, but I never
> tried to implement it.
> 

I was tempted to use the interval trees too, but I started thinking
about:

a) Locking: For the gap to stay stable while we clean it, we'd need to
add some kind of serialization either through iova_rwsem or a dedicated
gap_lock to prevent a concurrent map to allocate IOVA from that gap. 
Thus, every unmap pays for clean under the lock. I haven't perf-ed it 
yet, but I'm not sure whether users/Guests using virtio-iommu, where any 
guest DMA unmap becomes an unmap on the host, would regress.

b) Other users of IOMMU API (unmanaged domain) like the type 1 (which
was the one hurting our systems) and other in-tree drivers that use an
unmanaged domain and call iommu_map()/iommu_unmap() with their own IOVA
allocator. One of the goals was to avoid enabling the user-space or
in-kernel IOVA allocation (ab)users to cause OOMs via IOPT allocation.

> An alternative version is closer to what you have here, somehow
> connect iommufd to the shrinker and have it lock and walk the gaps
> cleaning them on shrink requests?
> 

I like this one better than cleaning on every unmap, since it keeps
the cost off the map/unmap path and only does work under memory
pressure. Although, it doesn't help type1 or the in-tree iommu_map()
users.

Would you consider those users worth covering, or would you rather
they track their own holes and call clean() themselves? Happy to dig
into this at the LPC session too.

Thanks,
Praan

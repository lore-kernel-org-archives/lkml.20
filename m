Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75D747F3C8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450625; cv=none; b=HevsoYS0kazK6dpS4mebR+zriVM312l3yTmPeWvqdNAwyC0jbifkOU7XPk5bT7SmlvjFne/IwBiDhRyxjMIiiL0VHkU+4RqK2cjPgxVKR5Bfp9lT2HD/Y21Pb3TxzyKA5umC4a76F1zhIqyerkLzeRktj4PPoE6TkHqtnefQMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450625; c=relaxed/simple;
	bh=3l0oo/suUsqKotsYltmSzm99CZLR9eDCeo7Cry0InUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4O21td+kCSw89bQBwrlHCLrq/LbUk9HIC/SecUnOl8QR/4VcE2B+7TJWq4XKO4Gf2cackZ5XysQwkEeUUE5O4xyJC0Ys/PPwKY/8c31Oe9DBIkYuW8fOs2UrnJgv1StXye5MGQnTI28hkAlDX+ldIUGe/PYQC78w9L3X6YxoNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gIjTg3Cf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gIjTg3Cf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b060ec084so1968818f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791450618; x=1792055418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6uy/kPke9fi9GxHZDbYTp9LZEJXPKNC8bWEdNfKWUhA=;
        b=gIjTg3Cfu7AKmMMY+j0ddcWT3wiVJURZQp83Rf4xo1OpotzLw+v3aaVfEAxeqxfXck
         MfzlmolJ3nXBwDsvhLiTpGV/JX2o2jYC3pavLTrhqYtyr8jq6rzK2e2HB481x1ONdXU3
         Ifv9WgP5Si3x/Wd0QuydWu6u6S+9Hq77NGLkyXAukwApqgk+PirU3slQaLIRIdXDPfR7
         CJZdxD4eWDLsG5C1+GHAnww0la05gAKYX+6itQ0ijZnkkh6XDAYxlQIAyc2ZwRMgJC67
         FITHxG/TtZJ35vehFdABWRr2QNLJilLOe94DdlbMvA64iKVr/V6MJKEKnuUw6Q9hYDGo
         aTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450618; x=1792055418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uy/kPke9fi9GxHZDbYTp9LZEJXPKNC8bWEdNfKWUhA=;
        b=LxUHRBRD8UJV45gIXtUP7LPaqserLoKWUJSWgna4g5P6ALa6L3APU0OdHrQMqAzRnV
         flyFPvhNSfbJ1/EvOasXE4aktP3hjomyFAh1CisgoOZcIT5B/5NZGvmgtixDDxlZo/8Q
         T/GIXNVC25YXe5FSCl7aRWeQ40LTHxNPcfxQ9JcvXUxrYpoWQZuPYowsPunxgG0x0dKc
         zWCiEmJF+xvxGRg20LtHegEc2TFyRdE5gvZj8K4QzJxebQJxF1Muh/OOVdBPdS2T+T6U
         vLppGqNZ4ZcpgOQD5Tlx2nkLf0IS0ABgBHqCns7WQvy+F79jklvnrx34Lrv6Oio6W1qV
         HRAA==
X-Gm-Message-State: AFuF++lU3OCUZ1w/DjYnuJAFNMcMIkGJ2gLDLS/AcIXhdSNijLI5eE2C
	18RnJCrO3r5EcsixpNpb6b9uVh0LkB1oPmnAr5bKPvufl1boJGiby664fR1yShe/+dE=
X-Gm-Gg: AYBFou1tRbtTbT0hyzPoRVAGIXoABQFcmoG0u6ek1W0NX9ISwVF1aK2WtsClCZqJvKK
	fG0akz8iBUfJWWDlrDozlPNScuwjdhnUJTs9yCcNfeswvyE4qBKXzzPuFeBgg9GSSQyZIp5EVCH
	j6BTOlRnV760io4VjZ4e7HGMbHyw6/VxwjqErLsLb+FcPEA8xWdy/5kqvF87PEgReBUuoBbaCWr
	CLMsN0Ce7h8YaZALQXLZw4rrqoDQvvS7W+aU1pP5u09uDpdXuzG1i93+Dv/7Z0FlpXCD02vX17j
	NR3IHNgskyF0CL9Q3hPM8O6LARm2dFqI+p9d/YQVZhwy+W63gMZutcEJUWjS+lHzVLeRslzUS0b
	tgWCHyBocn+L6MhxtQig8obVfGaQgrb1UkMPqEUgGEuXdHrQM1O/XKy+9DRexw0NhlsQ0ZTvlG4
	H6AU1zLRNCsV3nOxnN28sVGqVaubthZFxsnKvlJwixzGxwSi88n4m0c8nY2zwcT0Omun2UXYVTV
	3rp/hOc
X-Received: by 2002:a05:600c:821a:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a1802f6338mr82809725e9.7.1791450617925;
        Thu, 08 Oct 2026 02:10:17 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([213.198.107.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm199060405e9.2.2026.10.08.02.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:10:17 -0700 (PDT)
Date: Thu, 8 Oct 2026 05:10:12 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org, willy@infradead.org, david@kernel.org, 
	vbabka@kernel.org, brendan.jackman@linux.dev
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	kernel-team@meta.com, jack@suse.cz, akpm@linux-foundation.org, ziy@nvidia.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, ying.huang@linux.alibaba.com, 
	surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org
Subject: Re: [RFC PATCH 0/6] mm: pass alloc_flags through folio, filemap, and
 bulk allocators
Message-ID: <asdTptfeLkuypU8t@gourry-fedora-PF4VCD3F>
References: <20260923211041.3127588-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923211041.3127588-1-gourry@gourry.net>

On Wed, Sep 23, 2026 at 05:10:34PM -0400, Gregory Price wrote:
> This six-patch series first separates allocator behavior flags from
> the bulk allocator fast-path flags and shares their validation and
> preparation. It then passes alloc_flags through the MM-internal folio,
> NUMA policy, filemap, and bulk helpers.

I had various discussions this week regarding ALLOC_ZONELIST_PRIVATE and
ALLOC_UNMAPPED, and whether adding alloc_flags to the APIs is a good/bad
idea and what the alternatives are.  I'd like to summarize the notes
here and try to find a way forward.

recommendations that were made:

1) re-use unused GFP flags
   #define __GFP_X  __GFP_DMA
   or simply delete/replace __GFP_DMA

   There presently are no truly unused GFP flags, though there may be
   some users who can be shuffled around if we are willing to add
   functions.

2) alias 2+ incompatible GFP flags to make a new one
   #define GFP_A (__GFP_NORETRY | __GFP_RETRY_MAYFAIL)
   #define GFP_B (__GFP_NORETRY | __GFP_NOFAIL)
   #define GFP_C (__GFP_NOFAIL | __GFP_RETRY_MAYFAIL)
   #define GFP_X (__GFP_DMA | __GFP_DMA32)
   #define GFP_Y (__GFP_DMA | __GFP_HIGHMEM)
   #define GFP_Z (__GFP_DMA32 | __GFP_HIGHMEM)

   These are all nonsensical combinations.

   Downside: We should probably just forbid these, otherwise the function
   contract just ends up being confusing - i.e. (__GFP_DMA | __GFP_DMA32)
   should just warn / return NULL.


3) expose alloc_flags as mm-internal only flags (this series)
   in addition - convert some GFP flags to ALLOC flags

   In 99% of callers they would simply add ALLOC_DEFAULT (0).

   The upside - it seems like there are 2-3 GFP flags that may be
   good candidates for conversion to alloc flags:
     __GFP_WRITE
     __GFP_ZEROTAGS
     __GFP_SKIP_ZERO

   And the zone/zonelist selectors seem like candidates to free up GFP
   flags by turning them into internal-only flags and giving drivers
   some kind of explicit API, e.g.:
     __GFP_DMA/__GFP_DMA32 -> dma_alloc(...) -> intenal ALLOC_DMA|32

   I considered whether __GFP_THISNODE should actually be broken up,
   as it actually means two things (don't oom, use thisnode zonelist)
   Something like:
     ALLOC_NO_OOM
     ALLOC_THISNODE_ZONELIST  (or keep __GFP_THISNODE)

   The downside is yet another flag interface in the page allocator.
   Note: This is basically 1/2 way done, this series finishes it.


4) simply add functions to the page allocator

   folio_alloc_private(...) {
     alloc_flags |= ALLOC_ZONELIST_PRIVATE;
   }

   This has the downsize of requiring page allocation callers to know
   more than page/folio allocator functions if they want a particular
   type of page (unmapped, private, etc) and increases the surface of
   the page allocator.


Would like to find a path foward.  I lean towards GFP -> ALLOC flag
conversion and making alloc_flags internal-only.

~Gregory

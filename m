Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A993339934B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263139; cv=none; b=p1RukXt+HbMMygkeMGWuJ0iuqQvCZzkDqpWsXzStM5LMRtR+SKmzPE68kjKa0cFPGU4qVnZgxuRo31ZOvaQ2PL8ZdfxR2pIwk9+993P2j/+kKGiLTsAoJLXUDuoegzzzdODVT13FwjMIA0djVHcqSU5iDKJG45Ee6Aw2cw+1tfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263139; c=relaxed/simple;
	bh=RtRCphddFy8zJQ+8c8C1JPE8grvQpuSu4FeGPB4Xko4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTQ2XBu5E9IUu1qciYJ8UA8acMQKnzpxgEbI0YxWBExQumaV2DEM1Z3S+lX9UMgXeTGadX15SffO0s9cUrkPfPhsT54E+37Bi7LWvp+G1/o+nSf6RCEygwMycTjzRwjN1g9tylBQ/gxrqsFg5SoJjZdPRWUSUYhP+BIyViKw9K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVDH9WLs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVDH9WLs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6A61F000FF;
	Thu, 24 Sep 2026 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263138;
	bh=r7s1CAgd45i1qVFJKno+reNnGoGUQMAT+I7uYiP/nks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VVDH9WLsvrmzpUg4Z+hLDHBG/pO4qlIBnTIodD5pt0BF9Re7iMX6ULoPqbHSz2RnM
	 mymMnw1a5pmRQCiKHNjX4xaFkJd3E2HmVEGs+O7u5jfWVN5bmkH6nlOUe7THYjtE/f
	 mL9o7Tj6iKdrgU8ZuOjyGB03amWLl/t1FrPbO9ve033yVQ+VQR2hizSLCNpgOzVIWT
	 6XnXVTerX2Y6rVe8Mk+UHq65CpLKmamkWuT4mkfE3jZlWwLjl051pbc+nuoNQpiPAh
	 +Z2Nny5WtQQtwJzs7+VmPoQhFBBLhVHeoXzW8TFatOOXvBDWsF+IG4mzjumIzBkQ0I
	 foBvXytVcx/3g==
Date: Thu, 24 Sep 2026 16:18:56 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] replace CONFIG_SLUB_TINY with a slab_tiny boot
 parameter
Message-ID: <arU956kfc1QpA7N-@thinkstation>
References: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>

On Wed, Sep 23, 2026 at 05:45:05PM +0200, Vlastimil Babka (SUSE) wrote:
> To sum up, after this series:
> 
> - CONFIG_SLUB_TINY is a deprecated option that has no interaction with
>   other options and only controls the default behavior.
> 
> - New slab_tiny boot parameter controls the functionality (and can
>   override CONFIG_SLUB_TINY in both directions).
>
> - slab_debug=N can effectively achieve most of slab_tiny and on a
>   per-cache basic

Allowing "slab_tiny=0" doesn't make much sense given that
CONFIG_SLUB_TINY is deprecated anyway. I was assuming specifying
"slab_tiny" would enable it and not specifying it would disable it
unless CONFIG_SLUB_TINY is set.

Also it's bit confusing to have multiple ways to achieve the same thing.
Is there a reason why we can't interpret "slab_debug=N" as
"slab_tiny_enabled = 1" internally and drop "slab_tiny" boot parameter?

> - the implementation is simpler with many ifdefs removed
> 
> [1] https://lore.kernel.org/all/CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com/
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
> Vlastimil Babka (SUSE) (8):
>       mm, slab: refactor slab_min/max_order handling
>       mm, slab: introduce slab_debug=N
>       mm, slab: rework KMALLOC_RECLAIM handling of SLUB_TINY
>       mm, slab: make SLUB_TINY handling dynamic for sizing decisions
>       mm, slab: convert CONFIG_SLUB_TINY checks to kmem_cache_debug()
>       mm, slab: remove remaining compile-time checks for CONFIG_SLUB_TINY
>       mm, slab: add slab_tiny boot param
>       mm, slab: deprecate CONFIG_SLUB_TINY and reduce its Kconfig effects
> 
>  Documentation/admin-guide/kernel-parameters.txt |   4 +
>  Documentation/admin-guide/mm/slab.rst           |  18 ++-
>  include/linux/slab.h                            |  17 +--
>  lib/Kconfig.kasan                               |   2 +-
>  mm/Kconfig                                      |  16 ++-
>  mm/Kconfig.debug                                |   2 +-
>  mm/slab.h                                       |  32 +++--
>  mm/slab_common.c                                |  12 +-
>  mm/slub.c                                       | 149 +++++++++++-------------
>  9 files changed, 120 insertions(+), 132 deletions(-)
> ---
> base-commit: b4218126d498275444f315b0ed4cef6add6beabc
> change-id: 20260911-slub_tiny_rework-8f2634dd17a7
> 

-- 
Cheers,
Harry / Hyeonggon

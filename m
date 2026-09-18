Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F293AE706
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749698; cv=none; b=D/j20e6EnI82oMe1uLMy5+xy8m6bGaLyq8DrSOiG8+kbNbOoLlpVXniz6DN5JdafNgYBrIL62ysShZEn8dBNlyhlxh69aSsLB5QSOJPMmAS5ffdWnhytis2hNn0HZc6w6dFW5AnEtGQyLie1zjus0gtw2udZVms7TBwadPZ5VYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749698; c=relaxed/simple;
	bh=ZzG2YLskQkv+6ljk1OoLbvtDc24pB72q0vxTb8cJh0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElLz3VBBQBpucOOwlhG5A4m1ZXJ1wBIfksqq49Ri95zYofQP+Nom5J2FHj1kHC6KNFr7qVsYh7seBs4dDG0A8vft73dCq93KWcAYx6i4/zWKROgkxhjIpGGud26KB1FRtxuwsoJp77OmdbLOtn7VS95vLeux4ydADDdUzzXjHt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9c0xfB4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9c0xfB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8541F0089A;
	Fri, 18 Sep 2026 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749689;
	bh=XkdJK9giFjk4YEtdusx2eMulBHT1yDg70N+OeuIzdy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m9c0xfB4N+NXT0c8cDLuNHJ7ec/rQ3jURIK1q6ZLvhP71iE7DZhb9SLkAZYAqKs+x
	 VGl7K+dqvCryyuRvs9vOlSfvh9WSywC5plv/gurICgHD5fGc/p1LRd+i5H9z/V3MbS
	 8Yw87VL50qTMVjIPG9mYqcjnrBeZYlhQR2PxaO+ZqrVXNQIC22fnushTSTfn3NpjeF
	 sonFNU6lX+BZQViV2c439ykmAPR+fGLoig2TZx7C7LBwU5TEUzkn65aPQMMSXnAGXJ
	 fZu/xuGM/KzvCuwhqeWw6HrHh8hW6eznkuq8BLp4AaJQ3u1NqrAhIclQuF1+T891Bv
	 zQ3eOceISmqMA==
Date: Fri, 18 Sep 2026 17:41:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Rakie Kim <rakie.kim@sk.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: make Gregory a co-maintainer of MEMORY
 MANAGEMENT - NUMA PLACEMENT
Message-ID: <aq1pX_L_On9rWspf@gremlin>
References: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
 <20260918-maintainers-mempolicy-v1-3-9a94cac6d135@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-maintainers-mempolicy-v1-3-9a94cac6d135@kernel.org>

On Fri, Sep 18, 2026 at 06:34:26PM +0200, David Hildenbrand (Arm) wrote:
> Gregory is extremely familiar with NUMA placement handling and volunteer
> to help co-maintain the numa placement bits. So add him as a
> co-maintainer.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Makes sense to me, Gregory has shown himself to have expertise in this area
and is very technically capable and great to work with in mm in general, so
am happy to see this :)

Congrats Gregory!

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 344875eefd175..2b99a593436d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17298,10 +17298,10 @@ F:	mm/numa_memblks.c
>  MEMORY MANAGEMENT - NUMA PLACEMENT
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
> +M:	Gregory Price <gourry@gourry.net>
>  R:	Zi Yan <ziy@nvidia.com>
>  R:	Joshua Hahn <joshua.hahnjy@gmail.com>
>  R:	Rakie Kim <rakie.kim@sk.com>
> -R:	Gregory Price <gourry@gourry.net>
>  R:	Ying Huang <ying.huang@linux.alibaba.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>
> --
> 2.43.0
>

--
Cheers, Lorenzo

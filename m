Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2478518131
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749480; cv=none; b=bBOVBlz5COXc2R2pi9+H1/6PjCd9757wuKX1U+gf+0Ulb+No40qeTSE9tZ/C6mwMNTucSawerZFHJ/b8Udko4jK3EtAU5NXnfwKCL7Dp17rD9vEmsLDjYBRsJWjp9x29BTHP7nIXxUPSWWcwIdSPr7C68G1gcpwhBRdPVRhxvqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749480; c=relaxed/simple;
	bh=xfSsePRe38LzjvIuEGw8voixb2HDqeswPl7l/jtzmxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huWLh85Sx7x4YnqHOzxZN02grJvCxFKypQIoDufGocWYqqE4awuoeqFsbZAyZwk4KRk0an0DfgI58btbMqtFMyy+kZlxIF5jQyxfGFRWlYlT5cUJuCCDul+1DxXSUNjiMlQ/49ePpmWu9PNbal2BhNEWJdpPan7Kc74JUHeR7mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGwnyY61; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGwnyY61"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426101F000FF;
	Fri, 18 Sep 2026 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749478;
	bh=iD5n9wZgFu9t1L3ANTHITm97oEB8VYi5DwC7XLPAORY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hGwnyY611cszDR+4TPDrMQUZbBiqdoW5ZLKxi3j0ka0qbi07BvkgFcht3lFcgtMAN
	 cUTZC/mnV94XiRp6wkg4b8j1YEZC6dGfY3hVTucL0vSwhj+pPResc5dB8SikiHA29v
	 AJPQHog9QUpPVT6CEw1iRJxQgXH+gozatAQBF5TP2iBuHzqsmrJfnUNLtRoYjmYDGP
	 V2TWmYDpdSP0Gr3RUv+ByFZDUpfKZJdMeK6nz+qPUndyTtBSRZHgMiS5JNPlYOfK1j
	 LfM2HXrGLqH0npfDRJjKtvVhAP1TScMAQc962ur9z9Axg6xKl0qxHljlkCkwXmwWMV
	 yGBw9UBuvUJFQ==
Date: Fri, 18 Sep 2026 17:37:51 +0100
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
Subject: Re: [PATCH 1/3] MAINTAINERS: split up MEMORY MANAGEMENT - MEMORY
 POLICY AND MIGRATION
Message-ID: <aq1o04SylcmHpPVH@gremlin>
References: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
 <20260918-maintainers-mempolicy-v1-1-9a94cac6d135@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-maintainers-mempolicy-v1-1-9a94cac6d135@kernel.org>

On Fri, Sep 18, 2026 at 06:34:24PM +0200, David Hildenbrand (Arm) wrote:
> Let's split it up into MIGRATION and NUMA PLACEMENT. The latter is a
> better fitting description for mempolicy.c.
>
> Make a best guess about which pieces existing reviewers are interested
> in. Move the split sections to keep alphabetical order.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Makes sense, so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 62 ++++++++++++++++++++++++++++++++++++-------------------------
>  1 file changed, 37 insertions(+), 25 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b2eb2a7a89a8..77232db57b53d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17207,31 +17207,6 @@ F:	include/trace/events/ksm.h
>  F:	mm/ksm.c
>  F:	mm/mm_slot.h
>
> -MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> -M:	Andrew Morton <akpm@linux-foundation.org>
> -M:	David Hildenbrand <david@kernel.org>
> -R:	Zi Yan <ziy@nvidia.com>
> -R:	Matthew Brost <matthew.brost@intel.com>
> -R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> -R:	Rakie Kim <rakie.kim@sk.com>
> -R:	Byungchul Park <byungchul@sk.com>
> -R:	Gregory Price <gourry@gourry.net>
> -R:	Ying Huang <ying.huang@linux.alibaba.com>
> -R:	Alistair Popple <apopple@nvidia.com>
> -L:	linux-mm@kvack.org
> -S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> -F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
> -F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
> -F:	include/linux/mempolicy.h
> -F:	include/uapi/linux/mempolicy.h
> -F:	include/linux/migrate.h
> -F:	include/linux/migrate_mode.h
> -F:	mm/mempolicy.c
> -F:	mm/migrate.c
> -F:	mm/migrate_device.c
> -
>  MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  R:	Kairui Song <kasong@tencent.com>
> @@ -17252,6 +17227,25 @@ F:	include/linux/mmzone.h
>  F:	mm/vmscan.c
>  F:	mm/workingset.c
>
> +MEMORY MANAGEMENT - MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@kernel.org>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Byungchul Park <byungchul@sk.com>
> +R:	Gregory Price <gourry@gourry.net>
> +R:	Ying Huang <ying.huang@linux.alibaba.com>
> +R:	Alistair Popple <apopple@nvidia.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/migrate.h
> +F:	include/linux/migrate_mode.h
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
> +
>  MEMORY MANAGEMENT - MISC
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
> @@ -17304,6 +17298,24 @@ F:	mm/numa.c
>  F:	mm/numa_emulation.c
>  F:	mm/numa_memblks.c
>
> +MEMORY MANAGEMENT - NUMA PLACEMENT
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@kernel.org>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>
> +R:	Gregory Price <gourry@gourry.net>
> +R:	Ying Huang <ying.huang@linux.alibaba.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
> +F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
> +F:	include/linux/mempolicy.h
> +F:	include/uapi/linux/mempolicy.h
> +F:	mm/mempolicy.c
> +
>  MEMORY MANAGEMENT - OOM KILLER
>  M:	Michal Hocko <mhocko@suse.com>
>  R:	David Rientjes <rientjes@google.com>
>
> --
> 2.43.0
>

--
Cheers, Lorenzo

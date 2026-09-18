Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06704519932
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749588; cv=none; b=BuQ+B7RmCD9nTXc90Nv7WvVc9spxzKoo9MXOll7xyCvQR68WqIxgvSX8UgbPWPlvyUTs4/01A/Qyzr/K0vdW1Cya877czYxLcx0BKrqzxp3Q3znVQZsRZsXD4ONSWTOnlNWBzEpRl4vmxqCCsZ4/vsg6BhzEFiSU9VDD0x3ge7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749588; c=relaxed/simple;
	bh=Gm1ZkXjv6s+OBJjQN/BJC5GegtunoWxNVgnMEPq6gYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=id49u5zAl8ZeeRpfHkPaml0ZWUJP/qc/GmwR7/2DcYQBQweZoopBpz6NtHxkNFjPHkOHq69gYx3uLFqzErbpLh3PG0HCRNYsoD2vhXWoYMENEKzWUynoltYp+N3hiUvO2tipvBDHWE5778RhGg/zvq2IMwTqyMBocDGQD0JybsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1DzYxTh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1DzYxTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E1D1F00898;
	Fri, 18 Sep 2026 16:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749586;
	bh=44YWyMJ/oG0eAU0DmApWBZ/DLAfd4ODL3tuxQj9TMfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1DzYxThowbi3RiBsdbmXS/O5AG4VGMWydaNARzyoMLaghy4SL/lIetjBxVuwgNq+
	 xU4ncHb3vCXSfvgqSa5AcqITAv7zdnY8i1LrBlimqroO2rT08t+fHQxfpf8GIMzURA
	 dpelOgxBGGz70DJ6iOlLXb+sV1PrtIN1hvfv26bsNMTdzeZVaNMPyvkha9egpLvvW/
	 XEeD70Jc03bqvJ2W9+uloNdAE947Bb0bRCfgotF0LyknGZR3FIAgqSFISszVPYDis1
	 +LC3MUwTyqT44vOBo1I89sSlCkbSuvXH+AjSw72aBOjcSCF9VmlyYegEOEw94t4qJK
	 BfvEA3Kt8lTyg==
Date: Fri, 18 Sep 2026 17:39:39 +0100
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
Subject: Re: [PATCH 2/3] MAINTAINERS: move memory tiering under MEMORY
 MANAGEMENT - NUMA PLACEMENT
Message-ID: <aq1pEgR0c20-gazD@gremlin>
References: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
 <20260918-maintainers-mempolicy-v1-2-9a94cac6d135@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-maintainers-mempolicy-v1-2-9a94cac6d135@kernel.org>

On Fri, Sep 18, 2026 at 06:34:25PM +0200, David Hildenbrand (Arm) wrote:
> NUMA PLACEMENT is a better place for memory tiering.

So you are finding a better placement for the placement bit of mm? :P

>
> My best guess is that existing MISC reviewers are not that interested in
> memory tiering, so don't carry any over.

I think misc by its very definition is a place to stash stuff that doesn't
belong elsewhere so seems rasonable :P

>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 77232db57b53d..344875eefd175 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17261,7 +17261,6 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	Documentation/ABI/testing/sysfs-kernel-mm
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-cma
> -F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-numa
>  F:	Documentation/admin-guide/mm/
>  F:	Documentation/mm/
> @@ -17269,7 +17268,6 @@ F:	drivers/char/mem.c
>  F:	include/linux/cma.h
>  F:	include/linux/dmapool.h
>  F:	include/linux/ioremap.h
> -F:	include/linux/memory-tiers.h
>  F:	include/linux/page_idle.h
>  F:	mm/backing-dev.c
>  F:	mm/cma.c
> @@ -17281,7 +17279,6 @@ F:	mm/early_ioremap.c
>  F:	mm/fadvise.c
>  F:	mm/ioremap.c
>  F:	mm/mapping_dirty_helpers.c
> -F:	mm/memory-tiers.c
>  F:	mm/page_idle.c
>  F:	mm/pgalloc-track.h
>  F:	mm/process_vm_access.c
> @@ -17310,10 +17307,13 @@ L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
> +F:	include/linux/memory-tiers.h
>  F:	include/linux/mempolicy.h
>  F:	include/uapi/linux/mempolicy.h
> +F:	mm/memory-tiers.c
>  F:	mm/mempolicy.c
>
>  MEMORY MANAGEMENT - OOM KILLER
>
> --
> 2.43.0
>

--
Cheers, Lorenzo

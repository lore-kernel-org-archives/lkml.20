Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46C370ACE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975104; cv=none; b=Fzle5kSfjEa39W/nYjc5pLEl4j9HDfCtj4ddcKRqvPrl63w0DmiW5dcrkZGGVe4MKdlc6LgXh71AAGZDQBlOpiNDS42nybHh8XEccQpIuxqDO2fkNDrKoXkN8q96ycc7nMSbDOfyyjr3bK5koqrZkEhkrXosoaBP6twxk99YLys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975104; c=relaxed/simple;
	bh=2/rMWCkO4aZzJVzr5jJlDLvcNPi5by6DepfmbUqWQlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv34YkXIkgD/yncR9WoJG1gjCbW0v/0CWUzOUuvEGCNZvkD+via7lxgDXOdgPeWV1hBbXfmVdTlarP7NUNh5vV7/9uMI2GqFZ3W+d8rpQCtVSf2CHuu+TC7aC87/osDyP1uxCJrp706kQbq1PsInDG2v/Xw9MfZqR6h4NKok7co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2aybex3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2aybex3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333FC1F000FF;
	Wed,  9 Sep 2026 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788975102;
	bh=0ubKjcUHJ8BQDEwwualgzTahZHaTSfH4i57++l4iDsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m2aybex3X2RAJXPixBts2jyvWtg7abtHlmkNtumHVYjajCSdO+TTS0vt7NuUZa+ED
	 u+oo/zEfcmYwmSFc/bU2p5oE3US3YBdd7yZVlM4HJAe2nOXHLNUcpSJQ0kdVMimmUc
	 7M7nmVvUJUHHccsh3Qv/X+6UEd6u1wa3Q6r6AHH356SUSRi2rqlNX2n0F4YisRygFC
	 hZ3VC7HzkMVzeP9QNI+2l3RssjnwC3GSwxbDniSPL4jbNA++YlNjfObQ82VGeCZhaJ
	 BGtAvoOA/uLjSPjr2VqQp6i9cYOnRkw9DvcGEwxsxsISI0GZp8PL3IQRgZmxmJZKlJ
	 3KYIfDGsjSBQw==
Date: Wed, 9 Sep 2026 20:31:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Tianyi Chen <hi@tychen.cc>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] memblock tests: cover low-address allocations
Message-ID: <aqGX-ZhxsJppfNpi@kernel.org>
References: <20260906144011.848898-1-hi@tychen.cc>
 <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc>

Hi,

For the future postings, please don't send vN+1 as a reply to vN.

On Mon, Sep 07, 2026 at 09:20:31AM +0800, Tianyi Chen wrote:
> Model a low allocation limit within the dummy memory registered with
> memblock, then exercise memblock_alloc_low() in both allocation directions.
> 
> Changes in v2, following Mike Rapoport's review:
> - Clarify why the limit splits MEM_SIZE, the region registered by
>   setup_memblock(), rather than the larger PHYS_MEM_SIZE malloc buffer.
> - Explain why the malloc-backed base still needs alignment.
> - Describe the boundary in terms of the last usable byte and clarify
>   that reserving low memory succeeds; the following allocation fails.
> - Update Assisted-by tags to the required tool:model format.
> 
> No allocator or test behavior changes from v1.
> 
> Validation with the existing Makefile and ASan/UBSan enabled:
> - Default, NUMA=1, 32BIT_PHYS_ADDR_T=1, 32BIT_PHYS_ADDR_T=1 with NUMA=1,
>   and MEMBLOCK_DEBUG=1 with NUMA=1 builds passed.
> - Each configuration passed both ./main -v and ./main -v -m.
> - A separate BUILD=32 run still hits the pre-existing
>   memblock_free_near_max_check assertion in basic_api.c, also seen on
>   the baseline. This is distinct from the passing 32-bit physical-address
>   configuration above.
> 
> v1: https://lore.kernel.org/r/20260906144011.848898-1-hi@tychen.cc
> Review: https://lore.kernel.org/r/ap3LTQlKTpDbAEJZ@kernel.org
> Review: https://lore.kernel.org/r/ap3NJsaG10rLDVpd@kernel.org
> 
> Tianyi Chen (2):
>   memblock tests: model the low allocation limit within dummy memory
>   memblock tests: cover allocations below the low address limit
> 
>  tools/testing/memblock/Makefile              |   3 +-
>  tools/testing/memblock/README                |  14 +-
>  tools/testing/memblock/TODO                  |   5 -
>  tools/testing/memblock/asm/dma.h             |   6 +
>  tools/testing/memblock/main.c                |   2 +
>  tools/testing/memblock/tests/alloc_low_api.c | 148 +++++++++++++++++++
>  tools/testing/memblock/tests/alloc_low_api.h |   9 ++
>  tools/testing/memblock/tests/common.c        |   6 +
>  8 files changed, 180 insertions(+), 13 deletions(-)
>  delete mode 100644 tools/testing/memblock/TODO
>  create mode 100644 tools/testing/memblock/tests/alloc_low_api.c
>  create mode 100644 tools/testing/memblock/tests/alloc_low_api.h
> 
> -- 
> 2.55.0
> 
> 

-- 
Sincerely yours,
Mike.

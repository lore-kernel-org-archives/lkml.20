Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB40248F72
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266766; cv=none; b=X0lhMATwkIQW7fADm4X1slfOgWFoiBfHIV79QcZ8cEN5Z6+lTIgXJPHOohyK6S2dwnceLEHIIEQIX+wPqzgH423tin/lRGRASijYhk1aq4Rn8J8FktBvt52wJLr/EAfOkdH3XFjRt1U0/XZkXKtn9gtCZhUkRowpxooFomR/26g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266766; c=relaxed/simple;
	bh=YzteygZMHpBXI+5OGWmCKY4UA0FAcpCsWSMsMyhyGFI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=A6bCfTYdGvZ4w+kn9NpokNw4Pb1EFQNM/UyWkTjEHbO9OfuvXYDbTJhddHiqknInKPOhG9fCaI/GSv1zvzVKqgrd4MG9od9RBXzYoukvQE0uNrM/XdA/YuHAGxeSjPEtETnkGwj5X1zp7LfqZ1iDAx+pE/40tGo08BJSLEk6xGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aQXSkLOj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aQXSkLOj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3A31F000C4;
	Sat, 17 Oct 2026 19:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792266764;
	bh=VMtc0vXLRWczunwpL2LvoNH+JwWReughg0I7XEnUY2c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aQXSkLOjh9yKdtK3jSdADMm1RGMg+VUukebvPUolea0IF7YCKMeM1zU43gUFkhTq4
	 GnGfWKlts8PJHicUa1vvcqvgq78rg0pWMpbVnLwJeJV4qQEPag6IfPoZBE85L0YYZA
	 K2mozBlD2MPgf5YkHA7kCE3Qpmn67EJPkXxkc6Ns=
Date: Sat, 17 Oct 2026 12:52:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Uladzislau Rezki <urezki@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm/vmalloc: read vm_map_ram block regions from the
 requested offset
Message-Id: <20261017125244.b2d7134fa9697b2982cb8cec@linux-foundation.org>
In-Reply-To: <20261017154120.795844-1-nickolai@csail.mit.edu>
References: <20261017154120.795844-1-nickolai@csail.mit.edu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 17 Oct 2026 11:41:20 -0400 Nickolai Zeldovich <nickolai@csail.mit.edu> wrote:

> Reading a vm_map_ram() mapping through /proc/kcore returns the wrong
> memory for every page except the first page of the first used region in
> its vmap block.  read_kcore_iter() calls vread_iter() one page at a
> time, so a root user reading a live system with drgn, crash or gdb gets
> that first page in place of every later page of the mapping, and in
> place of the zeroes of the unused pages after it.  This affects every
> vm_map_ram() mapping that fits in a vmap block (up to BITS_PER_LONG
> pages): erofs and f2fs decompression buffers, videobuf2 vmalloc/dma-sg
> buffers, udmabuf vmaps, fuse readdir pages.  Kernels since v6.3 are
> affected.
> 
> vmap_ram_vread_iter() walks the used regions of the block and, for each
> region, zero-fills up to its start and then copies from
> start + offset_in_page(addr).  A read starting in a later page of a
> region therefore copies the region's first page, and a read starting
> past the end of a region still copies from that region.
> 
> Skip regions that end at or before addr, and copy from addr itself,
> i.e. use addr - start as the offset into the region.
> 
> Tested on x86_64 by queueing a 29-page V4L2_MEMORY_USERPTR buffer on a
> vivid capture device, which videobuf2-vmalloc maps with vm_map_ram(),
> page i starting with "userptr page i", and reading every page of its
> vmap block through /proc/kcore.  Before, all 1024 pages of the block
> read as page 0.  After, pages 0..28 read back in order and the rest of
> the block carries no tag.  With a second buffer in the same block and a
> 100-page buffer outside the block path, reads at unaligned offsets,
> across page and region boundaries, into and within the unused part of
> the block, and of the whole block return the true contents.

Thanks.  The Sashiko review is annoyingly embargoed for 24hrs, but it
found a possibly-preexisting off-by-one which should also be fixed in
the context of this patch.

I'm working on some akpm review prompts (which incorporate Tejun's
prompts, Chris's prompts and some Sashiko things).  Its summary:



The fix looks good, but there's an off-by-one in the new size
calculation:

> +		size = (re - rs + 1) << PAGE_SHIFT;

for_each_set_bitrange() returns half-open ranges [rs, re), so re is the
first unset bit.  The size should be (re - rs) << PAGE_SHIFT.

This matters because vb_free() clears the used_map bits before
unmapping the pages.  A concurrent /proc/kcore read could therefore
copy the contents of a just-freed page instead of zero-filling it.

Please drop the +1. Otherwise, the change looks good to me.

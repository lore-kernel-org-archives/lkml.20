Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86493D7D80
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462193; cv=none; b=jlS7qiKh4nECYsu2ktPOH8SOx+jhHoEMN96QtfCksjv2/XuED8T/IZIlwzS8f1fqPx+3ZG76LmMs1QhA8l4yv7GyUgF5YeOqWGYypdv0rX2eV9/aL7I3aRBu+r2HEHp7zlqpkFhVM8SaxaBmsLTXk+WPqlTbcFGXxRWZAM5XMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462193; c=relaxed/simple;
	bh=lcuYg8DmnHzMf3jKM32d20h1Q/xQnm8TpOPnvT8T4qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEenZRgIJ/pwyWRUZFGg1LuxyHzFagJ8UIkY7wYf25XbmeWZK8Jdtp97/RrtHun+yzfr1+rREKA3amb/4bDosKpsKXEJ3A1qis21W/QE6VizryRCAhsVgiPTR3uo06zrbPy9DYiY7/XUiUAU23VPjyh7q6v38pIDjbtTHJhgjTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBZB5WTZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBZB5WTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871E51F000E9;
	Thu,  3 Sep 2026 19:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788462185;
	bh=rKJemz5ICg83tGFQcJ4mPN4VnwzmurrHkskXzI16ark=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MBZB5WTZLt05umMt+cRoJnwKItp4sJxlinugvuPa8LlkukKfn0nkIMgJAC2m+MTOq
	 7iuzEvTpNZ98F7S78kXvVj7J1vLVmYQhXZ8wqVX6wb+Z7zPi2SyDipYiC1xUk62OUV
	 DI8ZYbXMGL5eUQlptOJEAE80tDZwDcjE7MMDQcc3Tmrq3wjCkJg83sPU5gKdBlka18
	 bd98qKiXmL91nQ6XQfnXd9LfHeEndoJhxftAgiOQfizy/f/Jxq8KYYJZi4lnPO2nMO
	 y80C2VJV0/7gfb+giObYkHb9/CLUaAdHBr+EUBR6xupPYqhF13QeeXq+Djcig9M0IG
	 E5HesY2OGnbDw==
Date: Thu, 3 Sep 2026 20:03:00 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mike Kaplinskiy <mike@recall.ai>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, liam@infradead.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com
Subject: Re: [BUG/RFC] mm/madvise: MADV_WILLNEED skips swapped file-backed
 COW pages
Message-ID: <apm68kgHC0NK2zVI@gremlin>
References: <CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com>

On Mon, Aug 31, 2026 at 11:24:48AM -0700, Mike Kaplinskiy wrote:
> Hi,
>
> I'm seeing a strange behavior when using MADV_WILLNEED to schedule
> swap page-in. It seems MADV_WILLNEED does not schedule swap reads for
> swapped-out COW pages in an ordinary file-backed MAP_PRIVATE mapping.
>
> I reproduced this on Linux 7.0.14 on aarch64, but I think this code
> hasn't changed in a while. mm/madvise.c:madvise_willneed walks swap

It's more a known limitation of MADV_WILLNEED that has existed forever.

The issue is that every single MAP_PRIVATE-file backed mapping would then
need to be walked twice, once via page tables -> swap cache and once via
readahead.

But you could figure out if it was CoW'd...

Something like:

diff --git a/mm/madvise.c b/mm/madvise.c
index bc6a7dc73021..33ff3ba69c7f 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -297,10 +297,12 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
        loff_t offset;

 #ifdef CONFIG_SWAP
-       if (!file) {
+       if (!file || (vma_is_cow_mapping(vma) && vma->anon_vma))
                walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
                lru_add_drain(); /* Push any new pages onto the LRU now */
-               return 0;
+               if (!file)
+                       return 0;
        }

        if (shmem_mapping(file->f_mapping)) {

(This also happens to fix a bug there with MAP_PRIVATE-/dev/zero though
that'll get fixed with my upcoming series anyway :)

The vma->anon_vma check ensures CoW'd pages have actually been mapped in.

But then you'd have to do two walks for every single CoW'd MAP_PRIVATE-file
backed mapping.

The majority of the anon walk would be a no-op also.

> PTEs only when vma->vm_file is NULL, and sends other file-backed
> mappings to vfs_fadvise(POSIX_FADV_WILLNEED). This skips the case of
> MAP_PRIVATE mappings with changes, which frequently happens for
> libraries/binaries with relocations and/or writable globals.
>
> The code is at the top of
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/madvise.c#n282

That code is skipping non-swap entries for a swapped out shmem folio? I
think that's irrelevant to this.

> .
>
> Minimal reproducer attached. Would there be interest in changing this
> path to prefetch private copies in addition to the readahead?

I mean I'd like to hear from others, if OK I can send the patch above.

Are we concerned about the inefficiency of this?

Or dropping the mmap lock right after and faulting in the file-backed bits?

I guess if you're doing an MADV_WILLNEED you are fine with it taking a bit
of extra time to swap stuff in.

>
> Thanks,
> Mike

--
Cheers, Lorenzo

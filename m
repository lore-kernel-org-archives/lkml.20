Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739777;
	b=NhFXbseEf3sfC070/noIpEq5UE6Q0gkvCWwJL19P51dleU3ohStV0mJGvlJS68v2Vs5h
	 3+XGrhxSVCLVWjeweFXwdqg0ErT1cNyR7VxUWEm4TxlIxi2rhQ42PzXvPkUFTCK/64BG/
	 yobLY7YJeyOiMhvWNmMytYjUYNB0x1YREU6XnBR3uZG6/86u7FUiUR+J5DVPLvbhUljkn
	 WxYfQ42cu+ZiIDqIgLzmuVM6o9RHvtOWdUx8j9ASjRzEn+DO6RWlnwW8dAIN4yxVJHPbD
	 YyLdywoizliGATChsXx5RlImWfZuldQu01fWyVsoBFADCCCMKPqfal8gFjwZNQGGmRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739777;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pkqrD//fnGQ72hjouszMioilp+NszrPnGIYWVd5G9RA=;
	b=pSGxoNQQgXU/zfTmHL1M/4tOjPjAEhlTbF4ErMQ84W2igM/w8wUzXl8s/pD+OP4b30AM
	 ABNmJ0sbFNQs1Dhqb4ICm0KTGvEEHIJ17v/OInOvo2YnncCy7ieLa91eSYLEfoXvbSdNe
	 aWV2jW8MCcSSUCLqFH3pCh/LCaF0E0zXp8k8p4PW/FDrRo2Q7l5phBEbd2InfUCEYa8/t
	 OWGqMX48/LMwfcIlWbAuaG4NmnF+3wwxGzby4yDziVSrSkhh98Ryi0SKwZhmt5Bo627Kf
	 29A4G10I89qW55nNiqKkRelpA3NM0RZbW1VbD2mTYVQWtNGklJ961mtUyxMZqzLmohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G285uqat;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07453606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G285uqat
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F771F01825;
	Fri, 23 Oct 2026 07:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792739776;
	bh=pkqrD//fnGQ72hjouszMioilp+NszrPnGIYWVd5G9RA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=G285uqatlfpZ6ocauqOB0OLsQ70I1Dgw7gK2NxUGwd/MJRYS7Y6vqNl+H7gQbGOcK
	 ftTeh0DVX4xAqez6LW/Vht3wP+DRN48+3dv2nf50i8NnbwNXWGOp2NWv7uMAtIwl/B
	 wn131MQ1wIWH1p4Fxfow5ose0tQU+YmBccoXuePJXI4+LieWBCayhLnw/BIreTaCcf
	 SGriwCo3bcjVU9kJmUHE7nBCVWx0ouoPkS0fHzvpWNGjMVD5RsT83KGen5F+L1fzOA
	 Skf1aCe4gwU8hoEyy1eTHSXTX0MTUtX/eDuHaHy8C+I0b8AklN7DahVTc92e5aUbi5
	 tIKR+bgmltb0w==
Message-ID: <8c53e58c-f7d2-4e98-8d03-7ff1163c1159@kernel.org>
Date: Fri, 23 Oct 2026 09:16:12 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
To: Luiz Capitulino <luizcap@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 David Hildenbrand <david@kernel.org>, Jakub Matena <matenajakub@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261023023106.515365-1-luizcap@redhat.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261023023106.515365-1-luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/26 04:31, Luiz Capitulino wrote:
> Growing a VM_MIXEDMAP VMA with mremap(), with or without MREMAP_MAYMOVE, fails
> with -ENOMEM when the address range after the VMA is free.
> 
> This regression was introduced in v6.1 by commit ca3d76b0aa80 ("mm: add merging
> after mremap resize"). This commit changed mremap() to use vma_merge() instead
> of vma_adjust() for the expansion case. However, vma_merge() returns NULL for
> a VMA that has any of the VM_SPECIAL flags set.

Hi,

6.1 was a rather long time ago. How was it discovered just now? I.e. what
use case broke by the change and prompted creating the reproducer?

Thanks,
Vlastimil

> The issue is also present in latest Linus tree, except that the code has been
> refactored. In the current tree, the path now is expand_vma_in_place() ->
> vma_merge_extend() -> vma_merge_new_range(), which performs the check:
> 
> 	/* Special VMAs are unmergeable, also if no prev/next. */
> 	if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) ||
> 	    (!prev && !next))
> 		return NULL;
> 
> This issue was originally reproduced with an external module that sets
> VM_MIXEDMAP on a VMA because it wants to insert pages with vm_insert_page().
> However, there's at least one in-tree reproducer: tcp_mmap().
> 
> Note that commit ca3d76b0aa80 introduced other VMA expansion regressions,
> but they were caught and fixed early:
> 
> - 6f12be792fde ("mm, mremap: fix mremap() expanding vma with addr inside vma")
> - d014cd7c1c35 ("mm, mremap: fix mremap() expanding for vma's with vm_ops->close()")
> 
> Below you'll find a reproducer and an attempted fix.
> 
> Reproducer
> ==========
> 
> This reproducer was written by an LLM and uses tcp_mmap(). It reproduces
> against v6.1 and latest Linus tree (2a08195e4db5). The issue is not
> reproduced on v6.0.
> 
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <unistd.h>
> #include <errno.h>
> #include <sys/mman.h>
> #include <sys/socket.h>
> 
> int main(void)
> {
>         int fd, pagesize;
>         void *p, *ret;
> 
>         fd = socket(AF_INET, SOCK_STREAM, 0);
>         if (fd < 0) {
>                 perror("socket");
>                 return 1;
>         }
> 
>         pagesize = getpagesize();
> 
>         /* tcp_mmap() sets VM_MIXEDMAP on this vma. */
>         p = mmap(NULL, 2 * pagesize, PROT_READ, MAP_SHARED, fd, 0);
>         if (p == MAP_FAILED) {
>                 perror("mmap");
>                 return 1;
>         }
> 
>         /* Drop the upper half, so growing back into it can happen in place. */
>         if (munmap((char *)p + pagesize, pagesize)) {
>                 perror("munmap");
>                 return 1;
>         }
> 
>         errno = 0;
>         ret = mremap(p, pagesize, 2 * pagesize, MREMAP_MAYMOVE);
>         if (ret == MAP_FAILED) {
>                 printf("BUG REPRODUCED errno=%d\n", errno);
>                 return 1;
>         }
> 
>         printf("NOT REPRODUCED\n");
> 
>         return 0;
> }
> 
> Sketch fix
> ==========
> 
> In the fix below, I started with the same idea as d014cd7c1c35: on v6.1 I
> made mremap() expand VM_MIXEDMAP VMAs the same way that commit did for 
> VMAs with vm_ops->close(). Then I adapted it to the current tree. It fixes
> the reproducer and I didn't get regressions in MM kselftests nor the
> tools/testing/vma test.
> 
> However, I'm not posting this as a fix because I'm unfamiliar with the VMA
> code so I'm not confident this is the right approach.
> 
> I really don't mind someone more familiar with the code taking this over.
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index 6c35f0d775ab..ac9a0a8a4be9 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -851,9 +851,15 @@ static int commit_merge(struct vma_merge_struct *vmg)
>  	return 0;
>  }
>  
> -/* We can only remove VMAs when merging if they do not have a close hook. */
>  static bool can_merge_remove_vma(struct vm_area_struct *vma)
>  {
> +	if (vma_flags_test(&vma->flags, VMA_MIXEDMAP_BIT))
> +		return false;
> +
> +	/*
> +	 * We can only remove VMAs when merging if they do not have a
> +	 * close hook.
> +	 */
>  	return !vma->vm_ops || !vma->vm_ops->close;
>  }
>  
> @@ -1093,6 +1099,20 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  	return NULL;
>  }
>  
> +static bool can_merge_vma(const struct vma_merge_struct *vmg)
> +{
> +	/* VMAs without prev/next are unmergeable */
> +	if (!vmg->prev && !vmg->next)
> +		return false;
> +
> +	/* We can't merge VMA_IO, VMA_DONTEXPAND or VMA_PFNMAP */
> +	if (vma_flags_test_any(&vmg->vma_flags, VMA_IO_BIT, VMA_DONTEXPAND_BIT,
> +			       VMA_PFNMAP_BIT))
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * vma_merge_new_range - Attempt to merge a new VMA into address space
>   *
> @@ -1152,9 +1172,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
>  
>  	vmg->state = VMA_MERGE_NOMERGE;
>  
> -	/* Special VMAs are unmergeable, also if no prev/next. */
> -	if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) ||
> -	    (!prev && !next))
> +	if (!can_merge_vma(vmg))
>  		return NULL;
>  
>  	can_merge_left = can_vma_merge_left(vmg);
> 


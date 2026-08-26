Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4437C448B97
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757334; cv=none; b=PtGhjsPeZbBcoY2kaxjksXPhHaTQwL6Ujpgj7R/MBYtHKy2K+FLaqNh2F3B9yFsWCEWkxdUBYjMp0lxNaetHxKyJ29gpZThTdNfu+E1V+AYlpRNaHb1I6douDaYv4+WrvAtSszXPVFDzW2nBpqk7y3FOgvBWYxQfKIcPof1JQs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757334; c=relaxed/simple;
	bh=AOSallpxcBi0KuMs56qQjt8eo7EPNvMoCUYPq2fkzMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQrzmFBji7GCiZLQvbf+jggG6Y61uaqN5GtQCYOxHUSFuYvopzptXPdnzGB0kGrZdfrP0lZOTLkdJQPlorZkInz480IVuwVqbH++//pEaC0rf/qNMMQn+FwzXBN6mmYHVPzJ6JPQA/yB85Mdg68EyqvyUD6VefLxXjsKWFizN5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTa+VWSc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTa+VWSc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace91f112so13267005ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787757332; x=1788362132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iabL4kgmT7SgLzPah6x1/xIKKVEsvB6N2EyVIOlzTHg=;
        b=GTa+VWSctTY88mIo66LXnMi8IyIGl+LEbV0sw+9C+95YTlqVKJGL8QPj9FpzZl47bs
         lehTRE3WoxNJchkOGn9F7X8HZpG2pvWc9Ep2ENr7nCxYchX/7Dtev99var6XVBcwP9MS
         hcwgkqAnPG9ZUcpRv8xWcuAHMFSa6aXWcFphCu3jeLJV9W0P/t+4OImfpKBLOBtDRwfV
         AxyOR6wK0WApodKm4XZB7Y9rkNzbRCe3XfwYG7d/IwNtqXrjGZx2MPodtGzGT4QhyIZn
         Y07RU2xHn1Mng3/5jSE5o3UQ0+hNUPO55IIaXAc1Q7AeYPgPg34jSKLAEal6oqKoQLf3
         HyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757332; x=1788362132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iabL4kgmT7SgLzPah6x1/xIKKVEsvB6N2EyVIOlzTHg=;
        b=gUw5vWNE3bqUl5U1Jl3Kcdhguty60AgLE3HuG6j4coCUCvxXV0VVZnDuCVxSOj6j+r
         VHERbw+3XA0IVL1IljamBD//ceDFJlArlnw3VX0DjF9gmOy8Rc5aRgoIemeMw9zY5con
         4RCBau7MzidDCeDolaRptM0NcL1teScdS7T/lWTJAlKw+U7NFkcuw6Knix3DojV3GWzV
         pXtjYmdNkpTCyKvBvM8HdugTmCH6/eyHwCDvhaMfFoFCSzOT/Kns8iNm4Jq9loJoAgve
         aALlV/mEDZe93eAa3/IxX2umSTInICGbd3VESTRtqpg0g0LvK9SOvCvJ6vn4sOZc+6VX
         1zkw==
X-Forwarded-Encrypted: i=1; AHgh+RrwF8MaE8jSq2h89VWadm8vGCPKsx1MdhiLcVJEwacGv49MS/cWrmFym9CxoBhLNzoGzuQrc6bANsH2gp8=@vger.kernel.org
X-Gm-Message-State: AFuF++mXh0nxY8HqZ8XCuejklDOT6SuBzhRiiSOEO4ywM8nex2ZjeMVJ
	yKw3CBEDLrPOa2JweTeLvQtdwb+OMOmhbZgrJyZRXKbwKdRh+rcMK7aC
X-Gm-Gg: AR+sD11f378RjVxOwgPy+gwYwqhaokUY2eSP2ttDAG31yVP9WRM+kUmNsS3LRNexM1S
	BU+VtXD64/kMVgqBfjD+6zAVGQ+5FnukCkER9oniNwcuIf4dKY2VQf42A4Pyx9J2RFUtNzFI+Bt
	u1R54boG4eqp2C0pEyOccD9YvL9Ti8X4z2IzGX6oLGZ7V9daE3FZOcQukbJw/ytJKmm7YUaEHST
	PvhHMFliXympUaccMaUzfMYbv+SwuHZzR55jtc70186eub/9mXcCWnMxABp1OvGyRvMk2GVYAhy
	A4/20LxNdNBjFHIlYeuj/YnanHeSGLLIWUqZWkbhiokRKUGhHK75BBmkgKNqvY9CTRUGHKqhz2A
	kbOzgIDFrfUq46+cKNXUOCSE6f7b0M/Jk0ON1N9yONI4dNjVcJ8w0UHXHdhyeGXh7/dxMEs8mip
	e6RkgkpJVYzCv73uwTA6BUmvh5q0sPVD3A/3JVoXTPUMiAZsZYJn1bgI/0L5CvGnhHXAER8ptTo
	ryYuLY=
X-Received: by 2002:a17:903:2c03:b0:2d6:ee6b:1b08 with SMTP id d9443c01a7336-2d707a2f363mr134001285ad.3.1787757331763;
        Wed, 26 Aug 2026 08:15:31 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704baa758sm8932645ad.52.2026.08.26.08.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:15:31 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Li Xinhai <lixinhai.lxh@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+f12658786a4153df5113@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/mremap: reset unfaulted VMA page offset for MREMAP_DONTUNMAP
Date: Wed, 26 Aug 2026 23:15:18 +0800
Message-ID: <20260826151520.202465-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825-fix-mremap-dontunmap-pgoff-v1-1-39a40b2c98b3@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 08:55:26 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> Uniquely an mremap() invocation using the MREMAP_DONTUNMAP flag can reset
> a faulted VMA into an unfaulted one.
> 
> It does so after the page tables have been moved to the copied VMA with
> MREMAP_DONTUNMAP leaving the old VMA in place which is naturally unfaulted
> as the page tables it had are no longer present.
> 
> However, in doing so, it violates the invariant that the anonymous page
> offset of an unfaulted VMA is vma->vm_start >> PAGE_SHIFT.
> 
> This is because a VMA may have been faulted in, mremap()'d (causing a delta
> between its page offset and vma->vm_start >> PAGE_SHIFT), and then
> mremap()'d again with MREMAP_DONTUNMAP resulting in the unfaulting.
> 
> This condition is a violation of a fundamental assumption in mm, but now
> also triggers an assert in assert_sane_pgoff() which explicitly checks for
> this condition.
> 
> Correct it by resetting the VMA's page offset at the point of completing
> the MREMAP_DONTUNMAP operation.
> 
> Reported-by: syzbot+f12658786a4153df5113@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a87853b.ae6ddae5.3da009.0023.GAE@google.com/
> Fixes: 1583aa278f5f ("mm: mremap: unlink anon_vmas when mremap with MREMAP_DONTUNMAP success")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/mremap.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index e8df5cdb0ac9..2b4b523a86b8 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1331,18 +1331,30 @@ static void dontunmap_complete(struct vma_remap_struct *vrm,
>  {
>  	unsigned long start = vrm->addr;
>  	unsigned long end = vrm->addr + vrm->old_len;
> -	unsigned long old_start = vrm->vma->vm_start;
> -	unsigned long old_end = vrm->vma->vm_end;
> +	struct vm_area_struct *vma = vrm->vma;
> +	unsigned long old_start = vma->vm_start;
> +	unsigned long old_end = vma->vm_end;
>  
>  	/* We always clear VMA_LOCKED[ONFAULT]_BIT on the old VMA. */
> -	vma_clear_flags_mask(vrm->vma, VMA_LOCKED_MASK);
> +	vma_clear_flags_mask(vma, VMA_LOCKED_MASK);
>  
>  	/*
>  	 * anon_vma links of the old vma is no longer needed after its page
>  	 * table has been moved.
>  	 */
> -	if (new_vma != vrm->vma && start == old_start && end == old_end)
> -		unlink_anon_vmas(vrm->vma);
> +	if (new_vma != vma && start == old_start && end == old_end) {
> +		const pgoff_t pgoff_unfaulted = vma->vm_start >> PAGE_SHIFT;
> +
> +		unlink_anon_vmas(vma);
> +		/*
> +		 * The VMA is now unfaulted and it is an invariant that
> +		 * unfaulted anonymous VMAs have page offset equal to
> +		 * vma->vm_start >> PAGE_SHIFT.
> +		 */
> +		vma_set_anon_pgoff(vma, pgoff_unfaulted);
> +		if (vma_is_anonymous(vma) && !vma->vm_file)
> +			vma_set_pgoff(vma, pgoff_unfaulted);


Hi Lorenzo,

I think the fix makes sense. One thing I wanted to make sure 
I understand correctly is the distinction between anon_pgoff 
and vm_pgoff here. 
Is the intention that anon_pgoff should be reset when the 
VMA becomes unfaulted, while vm_pgoff should only be reset 
for a truly anonymous VMA, since it may retain file-offset 
semantics for VMAs with a vm_file?

Thanks,
KunWu

> +	}
>  
>  	/* Because we won't unmap we don't need to touch locked_vm. */
>  }
> 
> ---
> base-commit: efecab401cb15fd3bb9bc05990609acb6b267ff2
> change-id: 20260824-fix-mremap-dontunmap-pgoff-a687134e995e
> 
> Best regards,
> -- 
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> 


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70B520D4FC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410012; cv=none; b=Bsn5/swOPwu7XOmTW8SiI+TRmkscnGWVe0m3ULX342nQmnOedZQx5Rpu3N1a1ifBcVwXhVj09VQOBL95U2XxL3/4SfRvMcPY8rAo/LPDBisqTBzap/6YHjp4n5FamTYqIGy3NBPBrahLjFZW0gaWvUiAtYb7VgMe09RNgfECffw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410012; c=relaxed/simple;
	bh=OKmZX8WFn26WX7lPHg8Kprr6uw25O+bMyDGAZAM2D1U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SsKp1IRp7CTrWLmfKoK5dn+Fzn+Z+Dr4adXNYBs7Vj888dJA2NQBswKnKKBIRxYbM793KgfNYQxCj8jsAgyjrYLg8BNaEnc3FIRqHkL+4LWhgZI1NvQitRY1h+N0+pyu2VPuXXA3Rt42ZD8RvmCGUPdYsrIOOBnZyiSfsImCfAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ASBFPsZW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ASBFPsZW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5849A1F00893;
	Wed,  7 Oct 2026 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791410010;
	bh=jT1L+BywClITywCWFZ9MOXvq5XIqR36SrLF3w65PlSM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ASBFPsZW3zEXVhJIZOeQRX1MGBQEqkcFNOH6WBhMDGBbntuahWb2E5XQNoPpSZEZx
	 PYsmGKNV4pjc09CcqdJ5SFzYcrQXfpkg8K7Hx0alnXbm5JrayoziaAMP37yieNDF/n
	 HKhLQN0082RcqjyIwdQ1tOBZHhqKtM5VhX/nVm1o=
Date: Wed, 7 Oct 2026 14:53:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Oleg Keri <okerixx@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/vma: keep the unlinked VMA off the file across
 unmap on mmap hook failure
Message-Id: <20261007145329.dd944233d7986bc0f5b2d63c@linux-foundation.org>
In-Reply-To: <20261007194708.2009-1-okerixx@gmail.com>
References: <20261007101800.58d50b1b20a10738e630bfd5@linux-foundation.org>
	<20261007194708.2009-1-okerixx@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2026 21:47:08 +0200 Oleg Keri <okerixx@gmail.com> wrote:

> Since commit 2ceb21171dd9 ("mm: consistently validate VMA state after
> mmap[_prepare] hooks"), the mmap error path clears vma->vm_file only
> after unmap_region(), so free_pgtables() unlinks the never-linked VMA
> and drops i_mmap_writable. Once it goes negative, every later shared
> writable mmap of that file fails with -EPERM until reboot.
> 
> Clear vm_file across unmap_region() only, so that free_pgtables() does
> not unlink a VMA that was never linked to the file, and restore it for
> vma_close(): when the hook succeeded and the validation failed, the
> driver's close() still runs and may use vma->vm_file.
> 
> ...
> 
> Seen on next-20261006: one refused PCM mmap probe from alsa-lib left the
> device unmappable, so PipeWire could not play anything.

Thanks.

> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2616,12 +2616,15 @@ static int __mmap_new_file_vma(struct mmap_state *map,
>  	map->vm_file = vma->vm_file;
>  
>  	if (error) {
> +		struct file *file = vma->vm_file;
>  		UNMAP_STATE(unmap, vmi, vma, vma->vm_start, vma->vm_end,
>  			    map->prev, map->next);
>  
> +		vma->vm_file = NULL;
>  		vma_iter_set(vmi, vma->vm_end);
>  		/* Undo any partial mapping done by a device driver. */
>  		unmap_region(&unmap);
> +		vma->vm_file = file;
>  		/* Only safe once unmapped. */
>  		vma_close(vma);

Signaling the unmap code in this fashion and the effect of this on
__zap_vma_range()'s uprobe_munmap() ->vm_file test needs thinking
about.  Perhaps a new bool in unmap_desc would be better.

But that's why we have Lorenzo.  I'll queue this for now to keep
linux-next happier.

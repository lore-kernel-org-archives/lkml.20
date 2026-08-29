Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F62FBE
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788017601; cv=none; b=aJFy8ZOIlUPUp6n00NMjiv0ny2NZoxUiY5N2Ic+SqMOFqUgP3R7g17lwOLqR6jwm+crmu69N64W3eRNyadFJyfvQbt4TiO7I6a5FLryC7mciOGmSN8Ijn5qf01auXQE1FWs8cVk91y95BQ1XjRqwpP1YPif5HtVKpFGFd69AeUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788017601; c=relaxed/simple;
	bh=ZGzi+Mz+4azghrtB4tO3Y2wqsF/sEFookZm5k94ebXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foGjYic4bXInufImd0cS470Cb0xyIkzcr8AGPAqNvz8N4Euu12gQB4WlrFAlNTPvoRWbCQRCAch6wmKu/Vg2V+/19Og/6oqgGtN4KHFrpaa0KsQR2bk0S63j1X9fVfn1YG9p2VV9zfsEpKgCx+JtbvfrHMgbn31K1T2XDw7aqYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=odVvcDw8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="odVvcDw8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PTXM/L1YMzcWkx0TvEWF9ybpX+LDr+TbOCu+xxZ8gOk=; b=odVvcDw8QIZEc6bpPL/oo1dlAk
	xunFD+gKNfROXB0FaNBVTfXT0mnxucvbWzVOibBNwcLw/6uMmuwczc+ZDUtuvW3bOvMf5lj0f2ZbJ
	s1dk3uUY7yK6qUIsOmbdIifIiAzi/tYESsQjDzEfdmD1bFX5ebk8/X8anuUdjjFwBM1z+MyKBrTaQ
	8C4VUmq1wRJp0cbEcEWxGdOl0glLPCJHoO8W8bRNRAVl1N+ILC6sJgoP3E8Txkt0P11OYyyjvT3Sy
	htxPSApwtUr4hmoYxUe0or4/z37I8KYnsISdwdqz+rxJQ+o/jfun6q7tTf4Rj5GBaGsiHQAfcaeML
	K2z/PjDA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0L3P-0000000GhL8-0SOt;
	Sat, 29 Aug 2026 15:33:11 +0000
Date: Sat, 29 Aug 2026 16:33:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, riel@surriel.com,
	harry@kernel.org, jannh@google.com, lance.yang@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: fix the race on huge alloc failed
Message-ID: <apL7tqn5Jw28S9p_@casper.infradead.org>
References: <20260829100034.423064-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829100034.423064-1-trintaeoitogc@gmail.com>

On Sat, Aug 29, 2026 at 07:00:34AM -0300, Guilherme Giacomo Simoes wrote:
> The race occurs because the reader (__vmf_anon_prepare()) checks
> `vma->anon->vma` without holding the mmap_lock and withou the
> READ_ONCE() macro. Since the writer (__anon_vma_prepare()) is holding the
> mmap_lock and updating the pointer, it creates a data race as the two
> access are not properly synchronized.
> 
> Use READ_ONCE() on the reader side and WRITE_ONCE() on the writer side
> to tell to compiler treat these memory access carefully and not to
> optimize them leading to inconsistent read.
> 
> Reported-by: syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=395b7abe9696862fc188
> Fixes: 164b06f238b9 ("mm: call wp_page_copy() under the VMA lock")

what makes you think this is the right commit for fixes?

> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  mm/memory.c | 2 +-
>  mm/rmap.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 6b8280cfc1db..33c1fbd30cdd 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3820,7 +3820,7 @@ vm_fault_t __vmf_anon_prepare(struct vm_fault *vmf)
>  	struct vm_area_struct *vma = vmf->vma;
>  	vm_fault_t ret = 0;
>  
> -	if (likely(vma->anon_vma))
> +	if (likely(READ_ONCE(vma->anon_vma)))
>  		return 0;
>  	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
>  		if (!mmap_read_trylock(vma->vm_mm))
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 1c77d5dc06e9..9d64d776b8c5 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -209,7 +209,7 @@ int __anon_vma_prepare(struct vm_area_struct *vma)
>  	/* page_table_lock to protect against threads */
>  	spin_lock(&mm->page_table_lock);
>  	if (likely(!vma->anon_vma)) {
> -		vma->anon_vma = anon_vma;
> +		WRITE_ONCE(vma->anon_vma, anon_vma);
>  		anon_vma_chain_assign(vma, avc, anon_vma);
>  		anon_vma_interval_tree_insert(avc, &anon_vma->rb_root);
>  		anon_vma->num_active_vmas++;
> -- 
> 2.52.0
> 
> 

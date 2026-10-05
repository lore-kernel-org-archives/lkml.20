Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78A7547072
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 02:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791167825; cv=none; b=FH6Si8z/df6vJNTymRsql8BOdfauiemuRmmILrfHhy2oV4We0iTRgYstIZDedoTo3SD3RJKw7QG4K7ADUPrtH3kHSkwy+hNOxn6xr5oU7V5+XZmAbqQ40t7H4w42Cp7CPWCNBE1zIM8+wBr2pWYnTZ40t2e6jv3iMeyhzMR29/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791167825; c=relaxed/simple;
	bh=vl5s19mW9JNXxaeLZH+yT4sg+eJntMKRYJiYiz2MomI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFbuLoiCRT2Pe9PIYN15Nxo41g9TpapKK5ydeBPdMgYCj3lcoJkBoPejV7gTraUoVSR/Gnii+JDGop9UFQO0LFWrj2FThxGlS5WQpLTduGxTS2HrRECBIPhV86RdCbBVEucwfZTdJEPZ3UXMOZY0xtQpFSGMybs9BJ7H2rr1840=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rnGKV3nE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rnGKV3nE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F37D81595;
	Sun,  4 Oct 2026 19:36:57 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D30B3F763;
	Sun,  4 Oct 2026 19:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791167821; bh=vl5s19mW9JNXxaeLZH+yT4sg+eJntMKRYJiYiz2MomI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnGKV3nEwlK1X7k2zdzTLzFY3mWapTTQwNrztTtOi3ummT0/lyYsdvlaUhu45qvFY
	 xpwyQmnpwBWKkCvOdt+6ByczUIMmQ23umDaPucYD6k+OSjQ5ZsFEXF3+XcahbKsM9i
	 XYobLAf2SI5KCsWqouvorXCBMdU284WPfwjFxhIc=
Date: Mon, 5 Oct 2026 08:06:57 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Jose A . Perez de Azpillaga" <azpijr@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 1/3] mm/memory: remove unused
 vmf_insert_mixed_mkwrite()
Message-ID: <d7bksa3fzrynovdlajlvlnlwzgkyw433dyp7zkvme562hrxap6@xfifh46fce5n>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <20261002160535.661399-2-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002160535.661399-2-ekffu200098@gmail.com>

On Sat, Oct 03, 2026 at 01:05:32AM +0900, Sang-Heon Jeon wrote:
> Since commit 38607c62b34b ("fs/dax: properly refcount fs dax pages"),
> vmf_insert_mixed_mkwrite() has no callers.
> 
> So remove the function and its declaration.
> 
> The comment above the function describes the -EBUSY handling in
> __vm_insert_mixed(). Move it above that check.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  include/linux/mm.h |  2 --
>  mm/memory.c        | 16 +++++-----------
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c038d06825c3..2ac734efd4ec 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -5008,8 +5008,6 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
>  			unsigned long pfn, pgprot_t pgprot);
>  vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
>  			unsigned long pfn);
> -vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long pfn);
>  int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsigned long len);
>  
>  static inline vm_fault_t vmf_insert_page(struct vm_area_struct *vma,
> diff --git a/mm/memory.c b/mm/memory.c
> index 330cde31bf8b..4b2e4be28031 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3052,6 +3052,11 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>  
>  	if (err == -ENOMEM)
>  		return VM_FAULT_OOM;
> +	/*
> +	 *  If the insertion of PTE failed because someone else already added a
> +	 *  different entry in the mean time, we treat that as success as we assume
> +	 *  the same entry was actually inserted.
> +	 */
>  	if (err < 0 && err != -EBUSY)
>  		return VM_FAULT_SIGBUS;
>  
> @@ -3085,17 +3090,6 @@ vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
>  }
>  EXPORT_SYMBOL(vmf_insert_mixed);
>  
> -/*
> - *  If the insertion of PTE failed because someone else already added a
> - *  different entry in the mean time, we treat that as success as we assume
> - *  the same entry was actually inserted.
> - */
> -vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long pfn)
> -{
> -	return __vm_insert_mixed(vma, addr, pfn, true);
> -}
> -
>  /*
>   * maps a range of physical memory into the requested pages. the old
>   * mappings are removed. any references to nonexistent pages results
> -- 
> 2.43.0
> 

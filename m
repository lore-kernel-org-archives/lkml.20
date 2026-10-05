Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFC328CF5D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 03:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791170067; cv=none; b=ryuqly7sjCzeTZZd0RYZLTyCbtTQCqIH6WrNWx0N3Xhss4kUn59yCCw+iH8gDwSvp07viA23zSMeWb6LszJwXkCg+RF2rjwkNKa3fY+3J69j2tdxgUL7EtpeLlccSuxubUXr5eitbNh19+jYodUTm+1St8jLk1CMjkyKXNNpxaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791170067; c=relaxed/simple;
	bh=RwRpQ6j7Lh8Cw0VxVyBV2Ml57YHE5z8+0pVEOB0/zWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkgC51bfqvFouofmQRn6Ye1j3LCFQ/ma+P/h8rxAYbLNz2bA9M87WwYYANyP2n7gtPAVYCbbva786gVK6othU2WvycfP0AOG8dkBRwBuZznRyDOITtS2+Gcxvk1eif+M8Venh0FC5RUt8hVPJA/PFvZ5jFgjyjTxnkXwhH21XVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oa7+Ev3a; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oa7+Ev3a"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E00CF1595;
	Sun,  4 Oct 2026 20:14:21 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AA703F66F;
	Sun,  4 Oct 2026 20:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791170065; bh=RwRpQ6j7Lh8Cw0VxVyBV2Ml57YHE5z8+0pVEOB0/zWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oa7+Ev3aFSuAcjDxN++3JTFT/7QLfaF0ONAhnlcbnovBD+A+ezJ0eOKSGpysU5g9C
	 /5OW1eJMf6ZA0AKa+qr/tuCSfRnU8RmC3Ng9Hk8SHMCPxugcJ2R7bl87JbpiAXPPQh
	 JJ46vqfpSHuZ8Xw+lkp4h5+64vLNio1IJg0+xzkc=
Date: Mon, 5 Oct 2026 08:44:21 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Jose A . Perez de Azpillaga" <azpijr@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 3/3] mm/memory: merge __vm_insert_mixed() into
 vmf_insert_mixed()
Message-ID: <5rttqmps6cycg7pxlsvynfilvt3auj3isl2prhv7ay6epel32x@nyezrhn4wut6>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <20261002160535.661399-4-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002160535.661399-4-ekffu200098@gmail.com>

On Sat, Oct 03, 2026 at 01:05:34AM +0900, Sang-Heon Jeon wrote:
> vmf_insert_mixed() just calls __vm_insert_mixed() with the same
> arguments.
> 
> So merge __vm_insert_mixed() into vmf_insert_mixed().
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  mm/memory.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 6c1d38eba7b2..bde650e207c9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2991,8 +2991,8 @@ static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn)
>  	return false;
>  }
>  
> -static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long pfn)
> +vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
> +		unsigned long pfn)
>  {
>  	pgprot_t pgprot = vma->vm_page_prot;
>  	int err;
> @@ -3041,6 +3041,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>  
>  	return VM_FAULT_NOPAGE;
>  }
> +EXPORT_SYMBOL(vmf_insert_mixed);
>  
>  vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
>  			bool write)
> @@ -3062,13 +3063,6 @@ vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
>  }
>  EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
>  
> -vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
> -		unsigned long pfn)
> -{
> -	return __vm_insert_mixed(vma, addr, pfn);
> -}
> -EXPORT_SYMBOL(vmf_insert_mixed);
> -
>  /*
>   * maps a range of physical memory into the requested pages. the old
>   * mappings are removed. any references to nonexistent pages results
> -- 
> 2.43.0
> 

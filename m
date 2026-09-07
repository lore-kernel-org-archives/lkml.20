Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77A244D6B2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774620; cv=none; b=MCTo2GlL1Ht7AV7SL2i9/ZZ53FsC/yrBVzN2+NrBaOpDii0Xzdh652vcZnlcqGbBbYZ7kmq0mBPBBDlhInWdCb2xrN7/zq8HHAbQv2h+TpSMIm4mjXHvoOY1Z88c4CUNVMFYJTjkcYEsL7+pMQHsXvDtVH1UJpFKYGB8u3Ruhqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774620; c=relaxed/simple;
	bh=jcSHuYkkSx/TOO3ELmd5fYDSVWMlRxHO2m5zczAIUrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAHPcLs6FVPmpJyCO5v1z5nLBm/wvg5kNBg8tQafI4Kp+l1P6wJTRcNaJsFgFEG2BhdBRR2WGai9c5BveYAoX/pjxVL3empMeOuXqaKJWil6x6H2jQ4BRXLcGlDHTlMFc4PRYEl3QHn9fVamBzzNvF4ryIjx33xSf7Py0idXd0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M0GDR1vV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M0GDR1vV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48589798dbbso2717869f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788774617; x=1789379417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vkgu8toociZzIJhvAE7ca3qg7cytH4ujCtgPL1CR/5A=;
        b=M0GDR1vVVggsDE7i/K3uquQcj9oDhmHVA8xXxgGgIrrFKcxxgovFk07GUUa/0Ye9j+
         iqnMAcjHbTgfFXt/rHzfRQ5SVqBvqVK4Od28hFGq4uYqFyG33XQieHLNAifa0AG3TAGD
         SdwlxXw9nNQs1/8i1f1jmidOiDqbVQbCjFglmT+NGv8NSwhxgTgJogR+v1tqvPyWkfil
         sGQ8bDlRLusJeygRH48E/KpWXoQA+P+qFZ1tDI+GYc4p+ZiunkjVwizNsQOfp8xcPqQC
         KB3SZzQC7te0KlI4f/Lr1/R4KHAY4NUpK3Pec5Yw1PZ6Q1Y4AxdoYcQOhmmb/BOXUdr8
         ZaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774617; x=1789379417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vkgu8toociZzIJhvAE7ca3qg7cytH4ujCtgPL1CR/5A=;
        b=pd6DUnaR2tLBpcOOcMPdvAOAH3iLXcTnPgH1qrBhnP2/1gb1rBVom9Psi/fioDCFWy
         lFZn+PeupvNL+6LU086Fnj86SFKp+hZt5g03U37RurkLMYQaJyNTB9uOvmM8OTLnJYsr
         oiJTt4KEf//iK2WoEzt5s8GCjaKbd7WhH7u1VWmhMZ31MPA6lrRGouE9BhKsg8myxiCh
         zW+d2KYJ5mdtchTqLzSFO21aAScQ7Cecltd/2l9RW21tPRvzlMjvIFMC2w6rUmWp4f+G
         14oc55xEezJQnsRl6vUZNZTkp7gDdYyM4YAKvvH7+3oDhqRKfcQdckLUkO66O3ZEDZL0
         H3CQ==
X-Forwarded-Encrypted: i=1; AKwUvByYrTmlJCAnBWAIS2TdJPt+otXGLeE+YjNHQWX8xZgXNw6X9QKG4ufF75WbOa39na81kKa/m2aYKpBxS6I=@vger.kernel.org
X-Gm-Message-State: AFuF++lUGc3SlAa9Qh4CzyDvK7X7CFK9HDZufG1zQ1hIfu3lIbHRSHhW
	OgyB0hITi3A9gGxuprZYK1N9oRpwcAQRK3RKBJER1gddcdr6O5xMnIQRzzQ3x56M9w==
X-Gm-Gg: AYBFou2yGLmxl03yTZ1ap/ByKMz7QHaX0zKrHR/yPOuQC3aHwa+Y23mI5/Gz7UHOEGG
	A/qv3RsZwgjI6JjxE8TKzVxZDYPnMLvOOvHG+xKOzSC0GUmo5U34aRj1vVoO+VA9Bx7YbuskZ5r
	U4fNkzTsKZ8XXK/pQ9NZXAYuoQhe8A3vBdQWqwm3n3ZNLzB1JRpXJrR3nM2+AzrUyvjtGZm7kJb
	G7qOsR0y3HtupnbWim3nXpdFQXv3cEAfWilDZd7g1P649hwMb9qKAKie6Yhqvcu0ohmWMQwkzSt
	fkgzwMwxSsMydqkCcrRa5H06oF0Le2I1+ZIk2v5Zqf+sLA7UWk7zL4ZaTqzin/smCDMFiR+rfmn
	cUF6A4OixIWDozFd+YSOo0N8CsS12GmF0yrL9k5f0X6QuG9quk4CI7dfZMbNiQ+Nu53sNb8cDdN
	dHomUbjC3Rp8F/Szk+OYPkkzt2TmvK1CmTGFd8GbRcmRyMZleXRFCI4m+b9R92ZBH1+j45ru9DW
	VMUs1Z4aGs5f1CnE4/a8QsVQe7ZML4Y
X-Received: by 2002:adf:e18d:0:b0:485:8a46:7060 with SMTP id ffacd0b85a97d-4858a46720amr19581670f8f.50.1788774615795;
        Mon, 07 Sep 2026 02:50:15 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm27142034f8f.4.2026.09.07.02.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:50:15 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:50:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap6I1FN_2ylRzFXH@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
 <ap2_926WXr7uAYVX@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap2_926WXr7uAYVX@kernel.org>

On Sun, Sep 06, 2026 at 10:33:11PM +0300, Mike Rapoport wrote:
> On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> > Keeping last-level mappings is interesting on some architectures as it
> > allows mapping/unmapping pages from the kernel direct map without the
> > risk of splitting blocks which, under the break-before-make rule, may
> > trigger page-faults the kernel can't handle.
> > 
> > However, mapping the entire direct map at PTE-level is costly. So
> > instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system
> 
> I believe MEMBLOCK_PTE_MAP sounds more descriptive.

The idea was to have something close from NOMAP, to emphasis it is one or the
other. But PTE_MAP sounds good too.

> 
> > to decide which region must be covered by mappings up to the last-level.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > index d62db9e776cf..d40a5ded188d 100644
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
> >   * kernel that we know is good to use. It is the only memory that
> >   * allocations may happen from in this phase.
> >   * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
> > + * @MEMBLOCK_LLMAP: memory region to be mapped using last-level mapping
> >   */
> >  enum memblock_flags {
> >  	MEMBLOCK_NONE		= 0x0,	/* No special request */
> > @@ -63,6 +64,7 @@ enum memblock_flags {
> >  	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
> >  	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
> >  	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
> > +	MEMBLOCK_LLMAP		= 0x100,/* last-level mapping */
> >  };
> >  
> >  /**
> > @@ -160,6 +162,8 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
> >  int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
> >  int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
> >  int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
> > +int memblock_mark_llmap(phys_addr_t base, phys_addr_t size);
> > +int memblock_clear_llmap(phys_addr_t base, phys_addr_t size);
> >  
> >  void memblock_free(void *ptr, size_t size);
> >  void reset_all_zones_managed_pages(void);
> > @@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
> >  	return m->flags & MEMBLOCK_KHO_SCRATCH;
> >  }
> >  
> > +static inline bool memblock_is_llmap(struct memblock_region *m)
> > +{
> > +	return m->flags & MEMBLOCK_LLMAP;
> > +}
> > +
> >  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
> >  			    unsigned long  *end_pfn);
> >  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
> > diff --git a/mm/memblock.c b/mm/memblock.c
> > index 9ce86349a29f..1591b50503ed 100644
> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -1119,6 +1119,16 @@ int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
> >   */
> >  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
> >  {
> > +	struct memblock_region *r;
> > +
> > +	memblock_cap_size(base, &size);
> > +
> > +	for_each_mem_region(r) {
> > +		if (memblock_is_llmap(r) &&
> > +		    memblock_addrs_overlap(base, size, r->base, r->size))
> > +			return -EINVAL;
> > +	}
> 
> I'm not very fond of implicit skips here. memblock has no idea what's the
> caller intention, maybe it actually wants to change the memory from nomap
> to pte-mapped.
> 
> I'd rather warn in memblock_is_nomap() and memblock_is_llmap() if they both
> are set and let the caller deal with making sure they are not.

ack.

> 
> > +
> >  	return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
> >  }
> >  
> > @@ -1204,6 +1214,45 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
> >  				    MEMBLOCK_KHO_SCRATCH);
> >  }
> >  
> > +/**
> > + * memblock_mark_llmap - Mark a memory region with flag MEMBLOCK_LLMAP.
> > + * @base: the base phys addr of the region
> > + * @size: the size of the region
> > + *
> > + * If supported by the architecture, such region is mapped at the last-level in
> > + * the kernel direct map.
> > + *
> > + * Return: 0 on success, -errno on failure.
> > + */
> > +int __init_memblock memblock_mark_llmap(phys_addr_t base, phys_addr_t size)
> > +{
> > +	struct memblock_region *r;
> > +
> > +	memblock_cap_size(base, &size);
> > +
> > +	for_each_mem_region(r) {
> > +		if (memblock_is_nomap(r) &&
> > +		    memblock_addrs_overlap(base, size, r->base, r->size))
> > +			return -EINVAL;
> > +	}
> 
> same here

ack

> 
> > +
> > +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
> > +				    MEMBLOCK_LLMAP);
> > +}
> > +
> > +/**
> > + * memblock_clear_llmap - Clear flag MEMBLOCK_LLMAP for a specified region.
> > + * @base: the base phys addr of the region
> > + * @size: the size of the region
> > + *
> > + * Return: 0 on success, -errno on failure.
> > + */
> > +int __init_memblock memblock_clear_llmap(phys_addr_t base, phys_addr_t size)
> > +{
> > +	return memblock_setclr_flag(&memblock.memory, base, size, 0,
> > +				    MEMBLOCK_LLMAP);
> > +}
> > +
> >  static bool should_skip_region(struct memblock_type *type,
> >  			       struct memblock_region *m,
> >  			       int nid, int flags)
> > @@ -2886,6 +2935,7 @@ static const char * const flagname[] = {
> >  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
> >  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
> >  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
> > +	[ilog2(MEMBLOCK_LLMAP)] = "LLMAP",
> >  };
> >  
> >  static int memblock_debug_show(struct seq_file *m, void *private)
> > -- 
> > 2.55.0.970.g62bdec98f9-goog
> > 
> 
> -- 
> Sincerely yours,
> Mike.

-- 
Vincent

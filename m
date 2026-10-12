Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC333932CA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803721; cv=none; b=H35EOnghOB8u612KG0sBDjaUbfDT8Tj2E7Gp2oZZdTHdd27inQ0FPHMFe93C1KtTGgh6fm1taM/S5ier9RgETs+IX3ML9EOuQss/r28RjGEIkKi9OC2WFCtToGrL3WN3LTUtfEsfr1QE70DLApX4tBLu+0RIzjchBtFpUk6fosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803721; c=relaxed/simple;
	bh=HdqTt+q/rfbcDE1yH9uRCugIMBEwtlrnLu6S9W7U8R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKRKpW7yv6M+6EMj4xdr5C9ma2H6xx/iunPPIxMTHps/XEkhjV+GKuECxB32u7ePdKvQNdC20ERlbsMeCsJzmeb42Cf7/rLbk/lbaauZzUasxzR08+2aAj74Jwy5i+gVvXQC+HAX9tMyda9NzJYGmGomATiG4UVKFMpN4lz/BdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5nu7ddK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5nu7ddK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-486e70f2457so740084f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791803718; x=1792408518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dOcvEm9msY+cl7KKbAZfMaogQnVH3/RbIaSfojxkTRo=;
        b=h5nu7ddK/nORjzfhtVUdNW0OJdY868u1dyHw35LvA5jcKRRM6xO0CmFU/IfAF/Z1US
         y2dRizCmATL95I/H81DPPSzZZzqRQDnY1wqW5iiEJIYOHAbYsF6eH792WtAh5SH8fNbJ
         QkKfCBDwPwSgOZURXMBo/oFeMLjo6DrH0M0Q1h5ijloVxirL/sC9+3AlU1qZKDdgFeva
         Q1TOJNVkYoGHrGXkHRNIPRvTdGbgxEjPXKCNVCjVDCmDkUSFLNbmeDNpRK748Un6I/3g
         +vYLIyIs/DCeG/+fAUWaCI1dxaw9/Rt4rUHh2SqszoWLywDVM11VB90iogVtlnhIqpPd
         IiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803718; x=1792408518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOcvEm9msY+cl7KKbAZfMaogQnVH3/RbIaSfojxkTRo=;
        b=a2V3bV+QnXwuSsg13NgaTJEh+OYupe/nDuFwkEhePQte983zIwMStstjw3rKVpse8F
         ufVXU2KQa4UEONbdVMJMGnodFf8kIbJ1sSxShH4Jun428Xflyp0JuP9xg4owk22fB1Hk
         bPOclbVvFxYTsIYQBv/mXMqygAJHv2Xyd4TJ6pq8IsKhLqypwQEsQqRauqXD2zlrNcnh
         8KHwps0IuQzIviriMaMqNlr90zTJTU3QUAXNURkLPILEA3XjKchLOf9D9+YHHBa64ghB
         bwCPB156JMNrkcT/QjnFbSife8EU8KH7xrGRnh2hEuAnEvf5O4Um+22+UGlf/OSjHqOd
         p4Qw==
X-Forwarded-Encrypted: i=1; AKwUvBx/yVVpUGrnGb9pyNjET4HV/tUzKFP1WywTfOr4pwjbnPmcng7C+sXhzCaeQ6PR8mE3zItDD1OQ889Xrx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1H5BTE0+DJ0b4KUPSsXAXOSR0XKvFaCxsKoXwS7lKqJArnuWv
	6N9yLPJk7AzPQBqFZav3ivFTOu9WyHk+ZuTDljeA1v20S7XntWTPf3eQ
X-Gm-Gg: AYBFou2m5eQTRgAhEmVXXu0HTlLztSXPuul7F4M8T49MqnuGezU57AdEPSzxtkOJ4u6
	5voeycEcCHcKCWo+sbql8Qj+8D+8ISUlj+Sjh+WSIZG/t5mb2JmAUJqcsaT7NPX3AJ2LHKc03l9
	GHtCV/La8FE8c0d5r5klAuSf2e0mouL31XaAYHi55ptxoSaFh/rFPABm4t1UTdvs0SJ/ltza6B4
	bus3fC0esSzts1YObphq5dhnWesErfm83WbMBM9t1Mn7/XnEsj5HyGVBPW4FY5cg+11tgsY/h27
	EwDiWJAGrqeq7awyH7hSa24xTm/6DW3HleqVguG6mNNMJk+fMz5OBVpi3ieUoS12GKuunmE+sVE
	0LqGG4ijLvu6VT5BnmgcpxgTVvrwjxYuvucKP7iVxNyQShD9AoWMZaa9x87cAHlll6cvhmmc+8d
	l6PDY1XhivWlBbHPbNp7JjqPf3XEns2WoBzM6Hpe+NL5mJKpQFmM6LhRzoMKQgQCUrJHBnPg==
X-Received: by 2002:adf:e005:0:10b0:48d:dec7:974c with SMTP id ffacd0b85a97d-48ddec797bfmr346783f8f.7.1791803718021;
        Mon, 12 Oct 2026 04:15:18 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20034954f8f.9.2026.10.12.04.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:15:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:15:14 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
Message-ID: <asy-b7_C3SjnmSaS@gmail.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010112457.49485-2-songmuchun@bytedance.com>

On Sat, Oct 10, 2026 at 07:24:54PM +0800, Muchun Song wrote:
> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
> tables.
> 
> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
> splitting a PMD. Restoring the vmemmap backing pages does not collapse
> the PTE table, so a later memory hot-remove eventually frees it through
> pagetable_free() on x86-64. That releases the page without running the
> matching destructor and leaves NR_PAGETABLE elevated.
> 
> Make pagetable_free() detect constructor-backed pages and run the
> destructor before releasing their memory to fix the problem.
> 
> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
> Cc: stable@vger.kernel.org

is the x86 case covered for 6.16-6.18? as far as I can see, x86
free_pagetable() only uses pagetable_free() since bf9e4e30f353
("x86/mm: use pagetable_free()") in v6.19, so the backport wouldn't
change anything there. or am I missing something?

> Assisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - Move destructor handling from x86 into pagetable_free() (suggested by
>   David Hildenbrand)
> - Trim and update the commit message (requested by Dave Hansen)
> ---
>  include/linux/mm.h | 37 ++++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5cca90fc1df6..771a7d60b0a5 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3969,23 +3969,6 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
>  	__pagetable_free(pt);
>  }
>  #endif
> -/**
> - * pagetable_free - Free pagetables
> - * @pt:	The page table descriptor
> - *
> - * pagetable_free frees the memory of all page tables described by a page
> - * table descriptor and the memory for the descriptor itself.
> - */
> -static inline void pagetable_free(struct ptdesc *pt)
> -{
> -	if (ptdesc_test_kernel(pt)) {
> -		ptdesc_clear_kernel(pt);
> -		pagetable_free_kernel(pt);
> -	} else {
> -		__pagetable_free(pt);
> -	}
> -}
> -
>  #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
> @@ -4078,6 +4061,26 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
>  	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>  }
>  
> +/**
> + * pagetable_free - Free pagetables
> + * @pt:	The page table descriptor
> + *
> + * pagetable_free frees the memory of all page tables described by a page
> + * table descriptor and the memory for the descriptor itself.
> + */
> +static inline void pagetable_free(struct ptdesc *pt)
> +{
> +	if (PageTable(ptdesc_page(pt)))
> +		pagetable_dtor(pt);
> +
> +	if (ptdesc_test_kernel(pt)) {
> +		ptdesc_clear_kernel(pt);
> +		pagetable_free_kernel(pt);
> +	} else {
> +		__pagetable_free(pt);
> +	}
> +}
> +
>  static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
>  {
>  	pagetable_dtor(ptdesc);
> -- 
> 2.54.0
> 
> 

-- 
cheers,
jose a. p-a

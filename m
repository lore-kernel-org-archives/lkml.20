Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73ED4A091C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841522; cv=pass; b=gd5zX8u9s2IntmRw96GYWXlv6w4gkMbaeP7qBcZjmACAM2Ev1IsuF+9ALSDnBwVyPtY/gDCvCDrTiywb/TIhuLEKs1/cQyxJZx0DvKxh065bX+fD9kKHHhkEC01UYhtWehqsmKDYBh4IrywNzNe4UeQAS2Fp0LnzpeT61bb4gGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841522; c=relaxed/simple;
	bh=wHPbZfItCfnsEeAQs9LYst1fqTFTmWe81HqIhsycaH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4m2jWWGC29f4d8cOF7C+1LpkOTPSAWLAtxQbq4lAq96yQMHkY0zEbyIwA7f0WOjvDymCwYbJtznHznoMzVz4pkAi+/BWa8r1l3oH5l+byTcXKKFl7SwRcLgFuPv9pl0/fBOvoB2BTgG5qRgiUWtuChUiugZ2CVOuah52shYaQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUVUPUMs; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUVUPUMs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso4801972f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790841514; cv=none;
        d=google.com; s=arc-20260327;
        b=rnrwBhKMQNDlS1quSCV3OI8IPYuQzwxQy4UtfM+n42vHXOf34u5EH5bL2uYHg9j+6d
         Sr5MHVXma7togUGFwyO0EyJ8LbFOyoM5LA+uVWUIRrHizs+JoC7M0iyUnc6zN0cCWJqI
         W+hPw2ED41QnwtTllWEUUZ03rgFqeDd85goR8KvrslGMCPJ4lpaQGWn1+432fENjqv7O
         fpbK3f8zopn2W6Z9L+EZrLbyzXdooHBiMu1UiAzWY7nFq5Ym8TJVOHgBbpMAmGWC+ZAf
         O0GMy8mi9S5OE+61ox8plnTo5sBAlP1h/LQuMdfSzVx0R3uLaQiVlLdqvrZE51X7c56x
         dPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I0ryAjqgJbQ97DrgWNuEBrn7YtVDsU7C9id15LD6WBU=;
        fh=55wqM50XGBJMItuKrO6eES+KsyahsUey00M4bNvOn2Y=;
        b=CAvfy94ZYDiW+SomtcJaAJo9xBp1USkxCv2khYNFOPqfZ84aUUzxlzZXl4JQcfaYMy
         rHpdrX36m9kRslmo0a99Q3gIDMQNN09b6PAmRFHJwDRYYq/C3k2U9B0enMLGupQHHaUz
         4+kXzsSw7qi5Ndi27a092lwD3KrqqkTUmdroGNJssPV9bkM2/Mgn03JyFlPJQphTK26o
         gpiSdMb38Sn4i7G5LJJ+opCrKvTrRIAQqcB/81EWRG5WlkJub/VrXki3WjbHf/7n7m9v
         Drhx+j27CvwRZlOjduSh/NFSvMp6HiGbwZhfNhB/Vyx5YTtXgy/KSoniZiPO9Iwa2MwM
         vJsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841514; x=1791446314; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0ryAjqgJbQ97DrgWNuEBrn7YtVDsU7C9id15LD6WBU=;
        b=RUVUPUMst3/aqbhjmzagyAlAEIFKY051TqAZLlEhCeHP+votXerel2enDWGGuoThMO
         zjK/gHbzDaS3J1SZ1tGVIsZp4o3YGj9a9NCgDq7jZJLFpoelvghxEyy4vhXAwT1/r2LO
         jsvFrRNy4VlJJQKXFwBzjpS/WUrrzLAsCbihjcvjV+A01PwSj8a9Er5Zshiv1j6/gso8
         sYChiFKlKRLPk3rCebqWJm92dfgkDmsHGFNxCeWNHJRo1/JpvWWO1VDxN5yoaglWMsLU
         Kx2TuBNs11O8xBYUsnpp7rcJWtAiJQfM0lBUfXIQIKDY19vpypLFPxQV2CX7H7pQOSFO
         RbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841514; x=1791446314;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I0ryAjqgJbQ97DrgWNuEBrn7YtVDsU7C9id15LD6WBU=;
        b=P5AhYpAaef0sGzqIXnAY1RjHYViLahWjeuq8wbAYpVtzDYhfO7xxfCQFXDDQtM8kVb
         NPB4NFCNr8l1lUfoCLoa1eaMpR+2oU4YjlMyqgAHckyXESGD883LZoBm0XsAJP2Ujv0C
         PI/OZM3EDz/AjyVJRDDbvi5E8EQPnTXYayGoroxfCiZwM7zryrBEftoiWCGd8e9mRhMZ
         ncILPAtATTID+5FlFCiMqFtXw8lPmVt3/tyZEUCctpP46ctMBt7oXzmrKz543xSxu6by
         wHQtEN7HPYXf1gKTa0mEePE0nfwNF314qOdUpHH9BIoA832u7S4qe8GKNmOk0JUVJe0q
         w/+Q==
X-Forwarded-Encrypted: i=1; AKwUvBybRe2VPrit4LVGdBT2SxiVKTNhgnlodd8YOdiphoMOIkmgzKRv1Jl5J4nwZgiG9G0FIzGd/Htc+cYvqCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL82eMYNZGWf5RsSimtDkZ7pc7McE9FK6LpBB3+04AkeDAX0b++
	jLVoHl6qsK/0Txi8xl2B4mIP6R4TaiKMZvw8PrdwJBfE6MiQ/Md2qhgd0SdeZyXcOMuS8G1gLfa
	JRiTh0u6sO7Z8pB6ZrO0rKf7BpSe8uz0=
X-Gm-Gg: AYBFou0diApFct6y9/iiSCt8HKmbdPsWQOtty1F46Fr8F3ZqnqnrAUt4Snqyk3qKzBv
	aaOj0nwa4O6LGVkDAp9InP5A7YDvFwUFTSzmStiQe2tosP2dTB8mrVaBCYrkKZuBZgADRk1dhKG
	siqk72DdQseUuk0WfVfdTcatccK0VOCrZn38yc0WOYMf80g4O713O1ELYb3t0hE79OO8l43U8zn
	+K/4zfSYF6tJKrsNGFb0OmMvwYxVWNc1gpMvE2tHwJopQ2Rfh4e8DhkYlChZZZNg/csMTmayINY
	PyTIBgSLM/SyScoapxvCzIVuPpfPNPjCjs3JnLsVgyoWyJElUU7gIQrQLsEHQo7WVII=
X-Received: by 2002:a05:6000:4a19:b0:48b:1b6:3df8 with SMTP id
 ffacd0b85a97d-48b02520a95mr7176472f8f.35.1790841514203; Thu, 01 Oct 2026
 00:58:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-7-jiangwen6@xiaomi.com>
 <ar0fJcjNmGGV6uFu@milan>
In-Reply-To: <ar0fJcjNmGGV6uFu@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 1 Oct 2026 15:58:21 +0800
X-Gm-Features: AclHuK_89bv7uwzbXx-_ECYL_ZRmqX93WJQq5H0UucnAezX9o9f55Dqa5iDge00
Message-ID: <CAHKocdF43Rqnt8-v0WP-t=Dxz2sSJ9xpyjLAYc2fzzKAW1_N8A@mail.gmail.com>
Subject: Re: [PATCH v9 06/10] mm/vmalloc: extract vmap_set_ptes() to
 consolidate PTE mapping logic
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 22:39, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Wed, Sep 23, 2026 at 02:28:28PM +0800, Wen Jiang wrote:
> > Extract the common PTE mapping logic from vmap_pte_range() into a
> > shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> > PTE mappings in a single function, preparing for the next patch which
> > will extend vmap_pages_pte_range() to also use this helper.
> >
> > No functional change.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
> >  1 file changed, 27 insertions(+), 9 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index fb757d95bde25..d475e52110e4a 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -92,6 +92,29 @@ struct vfree_deferred {
> >  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
> >
> >  /*** Page table manipulation functions ***/
> > +
> > +/*
> > + * Try contiguous mappings at the PTE level for arches which support them, and if
> > + * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
> > + *
> > + * Return: mapping size.
> > + */
> > +static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
> > +             unsigned long addr, unsigned long end, u64 pfn,
> > +             pgprot_t prot, unsigned int max_page_shift)
> > +{
> > +     unsigned long size;
> > +
> > +     size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > +     if (size != PAGE_SIZE) {
> > +             pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
> > +             return size;
> > +     }
> > +
> > +     set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
> > +     return PAGE_SIZE;
> > +}
> > +
> >  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >                       phys_addr_t phys_addr, pgprot_t prot,
> >                       unsigned int max_page_shift, pgtbl_mod_mask *mask)
> > @@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >       u64 pfn;
> >       struct page *page;
> >       unsigned long size;
> > +     unsigned int steps;
> >
> >       if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> >               return -EINVAL;
> > @@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >                       BUG();
> >               }
> >
> > -             size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > -             if (size != PAGE_SIZE) {
> > -                     pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
> > -                     pfn += PFN_DOWN(size);
> > -                     continue;
> > -             }
> > -             set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> > -             pfn++;
> > -     } while (pte += PFN_DOWN(size), addr += size, addr != end);
> > +             size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> > +             steps = PFN_DOWN(size);
> > +     } while (pte += steps, pfn += steps, addr += size, addr != end);
> >
> #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT) - how many pages covers the size.
> Replace steps by nr_pages or nr_ptes?
>

Agreed, I'll use nr_pages. Since vmap_pages_pte_range() in the next patch has
the same "step = PFN_DOWN(size)" pattern, I'll rename it there too.

Thanks,
Wen

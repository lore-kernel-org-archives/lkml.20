Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6DE4D90D4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161784; cv=pass; b=CuJHkjkzFQB35pbsJNX6sLyY1s0xowCsewtqA54d8Q+oCa+TH0cpYLuWLlBOEOyfnqM6YvHG2eoT9ajPdody3FNjpRrpo9AV/YFhXzo+37mjs35S5H5XZvcuIi/5THf14wiPpf4LKODtKW7crc8fmFqS4iXBmr8N0WrejSXQRKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161784; c=relaxed/simple;
	bh=UBNtMDVYWEB8MGKn1aRe8o7inZto3DUEyzBIj6oCEAY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKX5dXE7hZEx37jHAQTgoRVNZZs6z9GOMTgrmxia0zyR0wdppELQYuXJGSSHURbd+1ffE69DSPNl+MwahwW1KRcI8Lo72ay/C9sM6lBiZ7GjlVqHzuSVbqqMYg161dkMEqoq73822yqv9h7Qvv87FqBU6h3t4Uqcm+JYF7h/IWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPEFogDd; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPEFogDd"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66fbdb0a5a7so13047d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792161781; cv=none;
        d=google.com; s=arc-20260327;
        b=i6B3zuzfAmi2bcYje/3LIa1+1OpY+peqsPDqItqw/mmhKQtJjvSepJV0zjE2PNlGSB
         qX3xVQZOnhVmxaI0Zf1fzRYS/1NztTTQqEMIibH2zg34/OdexRL2MwDIaZwD0per7b04
         CD3tGyjkAN3wbgFTloa50NE5KvCsZEYrYlkDP2lJDdT8nS2AZ5xZJC8XGl6wRcX5nWQI
         2uBCwQtop9N++vVBo6yylKo18nIX+vdt//ErwFunkQOFae9nkLeaYjddU/p/vDeg97Yy
         Fr9V8pY+8QrSQ0f9vZgei8k6ur0hoqZBE6xruSf8Mnj3AUjS6iLWoMGCwIhCM0h3F4+I
         7hsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=nJtgmZrmor3FIwfdZIg6Zf/PH5vjzxmpZb34dCGZXac=;
        fh=w3emcLTiVvU6Q2/lIpsbagVEAvJYj56zpcL0lNEm9iM=;
        b=jlKk3wkLha1MW8O2wYZ4Tc55+gLACZZ/SbUJ4vqR1Q1htx84w5iyH5VfwLPk3bbq7R
         +hJfLDE4uu5kFIDNWjzMNx3trTSxCiEo2+wSj2yM62LlYH64Usfe4X24XFdpKWee9glQ
         RiDoIOXfynnAVjWun7oOqjsWN9FFVLm7PM8KCdt6PXBV/b7ebfqX5VJYeiR/nW9nCUzi
         hD+Zgr3ITJa70AKapG+PunsiPkQD+ibSIH45kTbr1bP4uCb66UchhlT+Gy0XJFDeKhkN
         1A0iEukWWN7nvmZngyjqJk+abutiH+Q2zU1PxbX92YtKwRqejD48LJmItfMv22Ic1rmA
         Zd6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792161781; x=1792766581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJtgmZrmor3FIwfdZIg6Zf/PH5vjzxmpZb34dCGZXac=;
        b=lPEFogDdyjA4KU4rBBYFB4XkH5xmA8pXiAZf+emHARds2DMbt+SGxHaqCnZYxBG7Ty
         tNIxUwPE7ZF+AQppTTEpd3cCiR3b8SH6f+EwmYRjjRGpz88v81Qkk5iPTdg+5Q2cbkwB
         gNZcatTihYtSrt7Qsjl97N+ZsLmrP/pDfIBzynMkZvRyyeb3ng3A8OjEI9LhmHowaEIR
         OMrt8u9ZQV28WKACeB88RA8+0wMhOnLT9DQZxiL3mq9WKSuY8O6GWOIgnJH8UJTZ/IRo
         RwdD2b0B9/q0kHykEJOWbxIyie+dsCh0woMVl7UCxWuVlYB+QXVA7cVvEIfE5PwOdVMs
         OVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161781; x=1792766581;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJtgmZrmor3FIwfdZIg6Zf/PH5vjzxmpZb34dCGZXac=;
        b=OL1s+VHI80etJMdV/9FBVMtWsCiip0bevLHDWq/1ht1InREQw/58n+pu/3oHV3EZe/
         uhetN8mHkaqKQkkEG16qg4oCDxQCg7fxSko3HvH7NMQEarXLAewwsJgFYrDIM+zdmptH
         3Dr7vvHQJn+Ldjx7EJOOppl+zt+e7i8pFMJrFXXbhpCpPYna4FrjWas27mMMOKnpyuvw
         XB+VdVjUuj7xgiG6IRsobw3dDl7lzPNrbiWatU43vkCuE+tnT6VQlF1j0VMQfSlckuQi
         vPvdEX7JvRGWsUlA8LDLgc+8u9CWcH1yO8yLBqOC3McuH4MOe8lLEwS4qEi2oDAcXi3X
         AKyg==
X-Forwarded-Encrypted: i=1; AKwUvBzv4P31ZcMNUURRgVJReUGHqJA/l0q/RrS6wsmXlx1MIOnUhJOgVKcQrvGqpP5Cf/hANEkn2BSkkyr0m80=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDJgWvJFkMY+5z2JKAYwHuIm2ZwlQVmfW0xjSYE5wCFeRKBkFC
	xO2TeIp+PLS0rVDwpeZc+4XocaX73SC3u0NOrqLHASxZpn9x18qV7CfO/GWuo7YVru3s+5gYMlD
	TeO2gJs+qf+LIZJhXBxOD9YMuFZiCZxQ=
X-Gm-Gg: AYBFou2h17zzdnaaOr8P1YJ/H/SxRo6wisk50ek0QGnhwhYm3/T0YvnMya5rB4B3iOy
	C5POzwobQuNwPzJmxUlG1WkBozz90BWKzUuYlI5ba7j2D5erO5jMDn5qGHQJMH50ExOnH86/cz6
	xywDjrO8MjhNpMWK7Z/hQHindnSSy1X48Z+PpV2Tp+C46nbq17AlKawLy9NcM0kySqPkv6saCUD
	zFrZU1vcop8mmHXd1tRycUv1vo9lerSER3OnNKg8N2dWhpIpBYhILEQjs0bSBNvft/FC+DBOelR
	Tc5kzOLMOXgEDK854Xjy44iL5yj/CmV6lAlegdwHpIH+FWExEb5FoA==
X-Received: by 2002:a53:ac86:0:b0:679:bf13:c02c with SMTP id
 956f58d0204a3-679bf13cd2cmr835137d50.0.1792161781303; Fri, 16 Oct 2026
 07:43:01 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 09:42:59 -0500
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 09:42:59 -0500
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261010133751.46807-1-songmuchun@bytedance.com>
References: <20261010133751.46807-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 16 Oct 2026 09:42:59 -0500
X-Gm-Features: AclHuK8b5Saw62oROYWx_NReQFrlF0sxRRr84kcTA0PC8A8ZSdrqwWS_5T0zMZs
Message-ID: <CAPAsAGyDqG0_JPB3c-4bY9jwdQ7eTxGJT0Ce-NowKiJ44T3LsA@mail.gmail.com>
Subject: Re: [PATCH] kasan: fix runtime shadow page table synchronization
To: Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Dan Williams <djbw@kernel.org>, linux-mm@kvack.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, muchun.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Muchun Song <songmuchun@bytedance.com> writes:

> kasan_populate_early_shadow() is also used after slab becomes available
> to install shadow mappings for hot-added memory. When this path
> allocates a new P4D or PUD table, p4d_alloc() and pud_alloc() publish it
> only in init_mm.
>
> On x86-64, runtime kernel mappings that add a top-level entry must call
> arch_sync_kernel_mappings() so existing process page tables can see it.
> Without this synchronization, the KASAN shadow mapping can remain
> unreachable and fault when the hot-added memory is accessed.
>

Did you actually hit this crash or it's just LLM's/code inspection finding?

> Add p4d_alloc_kernel() and pud_alloc_kernel() to perform the required
> synchronization, and use them for runtime KASAN shadow population.
>
> Once copied, a top-level entry remains in other process page tables.
> Clearing only init_mm and freeing its target table during teardown would
> leave stale pointers behind. Retain these shared levels instead. On x86,
> this keeps PUD tables with four-level paging and P4D tables with
> five-level paging, while lower-level tables can still be freed.
>
> Fixes: 0207df4fa1a8 ("kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  include/linux/mm.h | 24 ++++++++++++++++++++++++
>  mm/kasan/init.c    | 10 ++++++++--
>  2 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5cca90fc1df6..5453d3e42780 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3855,6 +3855,18 @@ static inline p4d_t *p4d_alloc(struct mm_struct *mm, pgd_t *pgd,
>  		NULL : p4d_offset(pgd, address);
>  }
>
> +static inline p4d_t *p4d_alloc_kernel(pgd_t *pgd, unsigned long address)
> +{
> +	if (unlikely(pgd_none(*pgd))) {
> +		if (__p4d_alloc(&init_mm, pgd, address))
> +			return NULL;
> +		if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PGD_MODIFIED)
> +			arch_sync_kernel_mappings(address, address);
> +	}
> +
> +	return p4d_offset(pgd, address);
> +}
> +
>  static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
>  		unsigned long address)
>  {
> @@ -3862,6 +3874,18 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
>  		NULL : pud_offset(p4d, address);
>  }
>
> +static inline pud_t *pud_alloc_kernel(p4d_t *p4d, unsigned long address)
> +{
> +	if (unlikely(p4d_none(*p4d))) {
> +		if (__pud_alloc(&init_mm, p4d, address))
> +			return NULL;
> +		if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_P4D_MODIFIED)
> +			arch_sync_kernel_mappings(address, address);
> +	}
> +
> +	return pud_offset(p4d, address);
> +}
> +
>  static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
>  {
>  	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> index 66a883887987..93a74a1fcdec 100644
> --- a/mm/kasan/init.c
> +++ b/mm/kasan/init.c
> @@ -206,7 +206,7 @@ static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
>  			pud_t *p;
>
>  			if (slab_is_available()) {
> -				p = pud_alloc(&init_mm, p4d, addr);
> +				p = pud_alloc_kernel(p4d, addr);

I think it would be better to reuse pud_alloc_track() here.
Pass a pgtbl_mod_mask through zero_p4d/pud/pmd_populate(), and call
arch_sync_kernel_mappings()
only once at the end of kasan_populate_early_shadow()

>  				if (!p)
>  					return -ENOMEM;
>  			} else {
> @@ -268,7 +268,7 @@ int __ref kasan_populate_early_shadow(const void *shadow_start,
>  		if (pgd_none(*pgd)) {
>
>  			if (slab_is_available()) {
> -				if (!p4d_alloc(&init_mm, pgd, addr))
> +				if (!p4d_alloc_kernel(pgd, addr))

Ditto

>  					return -ENOMEM;
>  			} else {
>  				pgd_populate_kernel(addr, pgd,
> @@ -322,6 +322,9 @@ static void kasan_free_pud(pud_t *pud_start, p4d_t *p4d)
>  			return;
>  	}
>
> +	if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_P4D_MODIFIED)
> +		return;
> +

With 4-level paging the PUD table is now kept here after it has been
synced to every pgd. A later kasan_add_zero_shadow() call can overwrite
it in init_mm only. This might cause a problem, because the aligned
shortcuts in kasan_populate_early_shadow() and zero_p4d_populate()
don't check whether the entry is already populated:

mm/kasan/init.c:kasan_populate_early_shadow() {
    ...
                if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >= PGDIR_SIZE) {
            ...
                        p4d_populate_kernel(addr, p4d,
                                        lm_alias(kasan_early_shadow_pud));
    ...
}

So sequence of kasan_add_zero_shadow(), kasan_remove_zero_shadow(),
kasan_add_zero_shadow(), arch_sync_kernel_mappings()
might trigger the BUG_ON() in sync_global_pgds_l4():

arch/x86/mm/init_64.c:sync_global_pgds_l4() {
    ...
                        if (!p4d_none(*p4d_ref) && !p4d_none(*p4d))
                                BUG_ON(p4d_pgtable(*p4d)
                                       != p4d_pgtable(*p4d_ref));
    ...
}

Perhaps the aligned populate paths should skip an entry that is
already populated.

>  	pud_free(&init_mm, pud_start);
>  	p4d_clear(p4d);
>  }

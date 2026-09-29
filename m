Received: from mail-dl2-f16.google.com (mail-dl2-f16.google.com [74.125.229.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FBA526AA9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.144
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689057; cv=pass; b=O3ZJ+SgqO4XeOZZNCX/L8QOUg9DpCd8bkOu4pMtjGPsEJ/2eQgH8W99YgcQ4GIxdFkIW5pTCUApN7dzFUn7kfZ1lyn5Nef233vrV5ER1kSPJ1rL2RQtrMNl1379HKNGgCgyzWO2WvmM2Nd7xv3K8yF5mGDwpKZfIEkdmaj2Chl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689057; c=relaxed/simple;
	bh=YagtFCBitM4qndUdbdLuLDTHnPtMJCDBGGfXIhio04o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgmhae81oEPhsXSAtQhMHUKemztpnTIiHc6SNzrTSgTR7aVZt6ipjmfKuGJ7JosGvfiLO9m5rxpXiEjguUBwtyqnOCehvZlrcJJPoAWCPN2WqVgqr3I007DAEE6QSxx/1a3FpdpFS/Uj/NeZzy6k6R9qrn4DFyuKVZ4XnW3JeNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bqX4aXgu; arc=pass smtp.client-ip=74.125.229.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bqX4aXgu"
Received: by mail-dl2-f16.google.com with SMTP id a92af1059eb24-1473f265b82so1013400c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790689054; cv=none;
        d=google.com; s=arc-20260327;
        b=Us6TenO8VAK94h3q/rKT6kjXjpugxRHFlhXBeWwjKrOqEfBydBMy0Zp5CEW6UnX6n3
         KseNt7T31mYbk24LrHL+XZdVZwhjn1Oafspu6saLnUEuKzDZf8M7Q5eOZXPuwryxmNAu
         QWBBHoQ2qddyv+C9tpw1hyYeMHpDedlxndnNVi98oRTktGe4pEXwaSb+uVoJEYPzeEmJ
         b5gWOVMjYolevs8fGBvJ2kvxPIdkvLNhxpjOyt/udP1kqFzDK2ZepwoUWnb6JQwAyr8w
         mfnZKle4Ht5+BKVJs7H/sj2zlq6HXw1pF3rwdMIjH4wa13mzMvchiakjl8sC316AOpAC
         EYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H1gd2gwEvh9R3nMhqTwmiYx3C+mNAyQraQhhd36JlyE=;
        fh=GnNBVLUHDpMMoc5Hoq2zYzMmXY0IKuc2j3DweOAQG5E=;
        b=KgKu4JIhwJkoHU2G3VAeeLxq/VoJ5huZaumIJuQFqnaqnRf09G0WerPAvBsRtoxaE1
         Lrn69g0GKlF6mMei1WaAGStl4y3wtgNrgaWsLi1Ol4syOa5nitjz1yNkpGDPOS16Csg6
         04ckpZ4m7fB6Rr+avzW2ukJYignyP4orYlK0cT5XXV/Do/zLq9N92vrZ81i01cFklgTP
         3lpiHauBdaqp1k7Gu45LN5trpNZ+AXh1u122WZj7BIS36D1Zy0W13ecxpLrMXvvyRVrE
         +uOZ3h+XZKk5t2pp+Qctr81nUznVvjaeN0ZNomKdawjFIj3d91eA9K2w5KoPnw3D1NtU
         kVHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790689054; x=1791293854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H1gd2gwEvh9R3nMhqTwmiYx3C+mNAyQraQhhd36JlyE=;
        b=bqX4aXguXIM64dG8KBBauKLEKxx6awquv00StzPMPNmtyaZvNGE3U09HLkAzVQU7ut
         jcEqSuXpc5ApG25jqv0UXRWlF/z7W82oAqa6a0hd8vcwibz/+Nx24iXfxV1nkPlhaXJM
         wnUzXZDuup0ZkTBIMTdOytWpHa2igGZElIt+5KWULcX1kaIgLFcy9BBhp4hpKwAhFcI6
         YYoi5rfXzSElnCcmMnrh8rwVvobhhXEeBpyxLGKu1GbzGS8IuP0CNvFIEL8BI0PwNCbD
         ece534p+ZPmAmu2GRGrBZ5RluspCiJegq90LOu7ynQhorxYRB4wLjFa2AytPN0kudt24
         p/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689054; x=1791293854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1gd2gwEvh9R3nMhqTwmiYx3C+mNAyQraQhhd36JlyE=;
        b=nntSCoe33muvEevnMnd/98IsYCFQwJYkDo9IjpgGdQrLE2sRNh30YF2yDZOqmhy3GQ
         APr8ZD2GMcR2LXsy4Fdf6byQi1Md8KrcaqQzU2CKMSq6rVZgj/qvDRJtVq2VVH7bBG91
         5f4LHXVpC7rVXGLHZSoB0zc53yT3/QSV4Y96Z4dTdAL5Bm7lEAyZ0HOg74EsbZNzytqC
         ovyXSR7GL+jQrLq9sgQ0e723tyMBn08b4DQr0XjnjZdqOnxW7RWY8+fqxQYvAgntmuWI
         7v7vUYE+YNwwhUeKSRU6Sxjqwh8iPlJH+ipgPSPj1syVEtSXZ+6xWSzX+5ZiltjsX/0H
         NGmw==
X-Forwarded-Encrypted: i=1; AKwUvBzvIPAun6I3XipOflv+b9vl2ZGQhJdwfMt/paqHEEVVcNJLVzZrWs7laYt70KJmuQLyMN9AE4YblsSmBd8=@vger.kernel.org
X-Gm-Message-State: AFuF++kiI1+KNCku1fKQ03Rw0PujcX4O6pUKJu2SNZT0jQaFjVn2C4gk
	TLdgeZgdJV14zELC7fWF14+x8YvWRTUv8SZPN/UlCJ8yE6hFd5WMdmT5+PsB6ABizSVaQLv6PE7
	tgS0e5l6w/1LbEkRlfMmGml6tCU1kx/j+HNTozzqa
X-Gm-Gg: AYBFou1QDekEcXvHRZltj1q26jPBoiUGoigH3Af6cqFGaYxjKqoASf4ZPtzPvoR9Pi+
	U/iVjSzgwvAohAFivhNZ6FTmyB66KE9ZhTqCd4d+WuieZPUOGfBflNmAIhRzqeBDEvVryAmroSP
	SoQ9W+R0Fim7kdKpiUUFBvt97hGH5sg3kdd9VewVvCUo//eFQZDx/KyHSuRj/IKCIp+3PhCPU3b
	4KM50yQ/wjrvb7VYO1ntNp0E7mH96ytizdMMXa4cgGtOFbOEE4Rh0236fi+PcoV1PZnlKBIFOFP
	npom3CxmXhjuFNuGkyEik1hQvAIQQ3uuUvKs2GNlK0ovptw32A+7+oS4QexL4cdbkVQ5wgfLmr3
	TVEDXynT/BpP2clYSXYbf
X-Received: by 2002:a05:701b:4314:b0:144:c90f:256a with SMTP id
 a92af1059eb24-146cdebd363mr13589594c88.5.1790689053295; Tue, 29 Sep 2026
 06:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160207.2952-1-dmytrokoziuk68@gmail.com>
In-Reply-To: <20260915160207.2952-1-dmytrokoziuk68@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 29 Sep 2026 15:36:56 +0200
X-Gm-Features: AclHuK9CoiMQVngJtj4D1_HG-SY1tsnE6dhOHICgB6kvknxlkNRvieBJ03LZumE
Message-ID: <CAG_fn=V9XMhQT=uz8zCbr=nFZU2bC+Cp6uKRyi6V+LhMpeugEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: kmsan: fix iounmap metadata teardown
To: Dima Koziuk <dmytrokoziuk68@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:02=E2=80=AFPM Dima Koziuk <dmytrokoziuk68@gmail.c=
om> wrote:

Hi, sorry for this taking so long.

>
> While studying the code, I noticed that kmsan_iounmap_page_range() calls
> __vunmap_range_noflush(v_shadow, vmalloc_shadow(end)) inside its per-page
> loop, and does the same for origin. The first iteration therefore unmaps
> the entire metadata range, removing the PTEs for later pages before the
> loop can recover their backing pages.
>
> Looking at the page lookup, I found another problem. The only callers of
> kmsan_vmalloc_to_page_or_null() pass shadow and origin addresses, but the
> helper accepts only regular vmalloc and module addresses. KMSAN metadata
> lies outside those ranges, so the helper returns NULL and the backing
> blocks are never freed.

My bad, kmsan_vmalloc_to_page_or_null() is indeed bogus.
But what if we factor out the page walking part of vmalloc_to_page()
into a separate helper, so that it looks like:

struct page *vmalloc_to_page(const void *vmalloc_addr)
{
        /*
         * XXX we might need to change this if we add VIRTUAL_BUG_ON for
         * architectures that do not vmalloc module space
         */
        VIRTUAL_BUG_ON(!is_vmalloc_or_module_addr(vmalloc_addr));
        return __vmalloc_to_page(vmalloc_addr);
}
EXPORT_SYMBOL(vmalloc_to_page);

Then kmsan_vmalloc_to_page_or_null() will start working:

struct page *kmsan_vmalloc_to_page_or_null(void *vaddr)
{
        struct page *page;

        page =3D __vmalloc_to_page(vaddr);
        if (page && pfn_valid(page_to_pfn(page)))
                return page;
        else
                return NULL;
}

, and we'll only need to fix kmsan_iounmap_pages() to vunmap the pages once=
:

static void kmsan_iounmap_pages(unsigned long start, unsigned long end)
{
        unsigned long shadow_start =3D vmalloc_shadow(start),
                      shadow_end =3D vmalloc_shadow(end);
        unsigned long origin_start =3D vmalloc_origin(start),
                      origin_end =3D vmalloc_origin(end);
        unsigned long v_shadow, v_origin;
        struct page *shadow, *origin;
        int nr;

        nr =3D (end - start) / PAGE_SIZE;
        v_shadow =3D shadow_start;
        v_origin =3D origin_start;
        for (int i =3D 0; i < nr;
             i++, v_shadow +=3D PAGE_SIZE, v_origin +=3D PAGE_SIZE) {
                shadow =3D kmsan_vmalloc_to_page_or_null((void *)v_shadow);
                origin =3D kmsan_vmalloc_to_page_or_null((void *)v_origin);
                if (shadow)
                        __free_pages(shadow, KMSAN_IOREMAP_META_ORDER);
                if (origin)
                        __free_pages(origin, KMSAN_IOREMAP_META_ORDER);
        }
        __vunmap_range_noflush(shadow_start, shadow_end);
        __vunmap_range_noflush(origin_start, origin_end);
        flush_tlb_kernel_range(shadow_start, shadow_end);
        flush_tlb_kernel_range(origin_start, origin_end);
}

I think this is cleaner than reimplementing the page walk exclusively for K=
MSAN.

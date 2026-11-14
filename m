Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676600;
	b=Gh+8jIVjUkqVEqJdsy4+mlWDTS7M8vs6DBWvVd9fGBKZQiKbZwQ1UNFkE7cYDQ+ES+6I
	 3fjLWTn3ryQ9Q/jPgds/igqmstECPtenaTTPiPyAxkSxLNN5tUTn6Ertd2LSEC1RLaA/K
	 SHqAv2AJ3h7kp2BfzqEv9rU+Q9Ur0RC5Fqh8xYftt/w0GmaWFOFn9B3pQAI6Qk9N2fOyR
	 9P0jrGrI+pUM32kpuIylW31MHYzWU2OKLZRxd7lUFlS3rwKkQKCIdG0kiMY9rGAiiutxy
	 1+C9NefOhkY0grq/+UKUaycqY7TBQbxkwmTtO9E8m2l347qZ+fzcFmBW2kv1L4+t+GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SjuxZpxo2VdoY/uM6bNancwZ4LLZPAOCdWtVCyHoJ6c=;
	b=vEO1x2w1ChNEAoZ4vckZwu9slOUvWEcSwc3yv3YVJD0K8oxtkjK85YnR+9hEtnfieZWA
	 hkNqjep3YUMVa/dxsPHNsD+aYmcnAjhVmAtwBaO9k9QeSStbj4eVu0avu/ozAqbZmWJM8
	 ROdzi/5F8qyrNOFRFEhbY1JC5tSQ1g8/tKxmHtymVn5odbZU6dqq955Uzh41FzCJIQp50
	 YTAlXchXAHZdENA8HGpr/Kb3ZaqoMKRmv3rkND13RnsQ4RPBZ5X+bCw1NkOIbCZGwI7EW
	 5I3189AuHeR6m/ss8RpKUbmaaJuvqpmsyjNUKEF/+mHCA5G5wYOaGQtbUK4qfN62v4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvqmD5t4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C530606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C530606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvqmD5t4
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so23290371fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794676598; cv=none;
        d=google.com; s=arc-20260327;
        b=h7LD4cwiPk1HIXjp4WmKM/wdMHOiRgZL0oewiB6/j71/vDFX4l2QybYhmKLzStpDCL
         Q0al3ufG2dqsw3o5/lNIOfQtSCDTrumxPdDxaiDxOpLxaZeFFWeEAdC99FcZQ2heEYWN
         4VS8UAS84iaKJp2YkxI12dPR252V8Qzc/d6LVZqr3WJlEYgr/qHE4beNHX3Kt3Cz/lDj
         dlVksCDzZIG4TCrCHPmCk0w+J64Xf27R9re/LpxjhHgkIbu/grNtL8sxAgTLy95kfo+a
         AZ9iq0/JqnjMUha2N1USKkiHwANqqrXnQky8iHHSbkTu0BLOd+HXwEr0AcAtdxvSy7HS
         QdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SjuxZpxo2VdoY/uM6bNancwZ4LLZPAOCdWtVCyHoJ6c=;
        fh=430lnioHFZaMlgTR02u/wZZfRqnGeL0+KcfH8uphdSk=;
        b=oDF00TfSSiS+/iS0EyDOcN73BAvgiQr3qMaLoJD5PoavtDhQFMdvzQsQlq/9fvIWMC
         QvwoVg3w5xMgPjwvhJYD60WiGKuOtl8c2agES6m4x18BrJ4W1X6yU0xMbmzBNLCJZYg8
         ypkbKskRxcdxGs51+Zdu7T53PZoYmyes1IZH/XEtpIFXh7JP1+tqMYJ43z8qCq6wyImZ
         rmOhy+PssYPfUuvL8MLSrYxQEdl5ISgqmLl+OD5ido0vAXaKaXyI8TLbJP0GFZ/GX59a
         WlIHzaqXpMvcvsl64OCAE3lcxwUmWb4FPuP4HU7bdajX/lUXqMg+c2fmpdZlAQFUGtER
         yL8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676598; x=1795281398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SjuxZpxo2VdoY/uM6bNancwZ4LLZPAOCdWtVCyHoJ6c=;
        b=fvqmD5t4Wqd12zYagXQBWMFhc8VcfANemipTgF3OukheTTKf4Ofv1Bhe0nm1qfpc3+
         g0DLw75qTBQ5WCis51xDN+RcxUrccJQlfz74bveo2QQrQsWyCrWFivfueG7dS5uvnLk7
         KBheu6+/wG3DWPbxIEXn9wDlzobIkWlCdgkAZRbzG+aELuDWCnp9ebCln5kxXNjJOR1D
         Y2NhfIf9VgU5GCA3iNDNQtI8tkd47PvvhyqghZIoOZ8V4wmzn/AUAt3Y/xyoP0T054UZ
         7O11GeJUotazYBq/f7XSLCgEXqOWCfxBQz30memeFuWxE8obafKQkfH6W6DlZtmN6JXW
         6Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676598; x=1795281398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjuxZpxo2VdoY/uM6bNancwZ4LLZPAOCdWtVCyHoJ6c=;
        b=vgXFG471oSEwHp7f1rWKQH/EZEV7RljafTpenztvqPv/9FNMFYRKw5s/Y1o+nzyy9X
         cgGB1tB6EW1aTVHbmlR4GXVIm3KO6QRg+zLibQXIibaowW7K5myDqPF7hTAb2+20PTbp
         BAB/3fv+i3EwDq4zMat72LrUA8JtxYvGse/oUxbsnju+EtXxxGrzw6UaUhWfhF2JNNhw
         70PCil/aPQyiO/M87NwqXa3IE0ALoi3KJ1ErE0tcpx0NK3S00xoFNsj3JhJonTBEPxw7
         2N+valtUiihHdI5w3pumU1bLmCC97f4YceBV99vup6cGj8TTn6aqGWYOfAGT+R11E70f
         ssbQ==
X-Forwarded-Encrypted: i=1; AL+hErGcPQUVYlmVOdj8nazre8Dpp/THqfql8rRg8xBF5p+7jVQj7bVeF64fRJf0ZnFV4+NTFhCy9XmuBzs55/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sj3yqw39TZsP7EfWNZHHB2SGOS7eaeTE+l62r8vyN+wjQZ7sC
	jQF9C92unCf/Jr0OQ17+m9goNIUmMdDkoP1bY+ewQSfwbPUmvGMF8x+NMmCq0NU0j1pv4cJOjgv
	PnSc47f5jy7VL2QqxAtGnQP3c1O/DJ80=
X-Gm-Gg: AYBFou0HuPy7jSeaTa5QBfxSnlQ36iO0xZ+ZzW/1JSRut/aYh6f1UM5PaD2bOmYgctx
	ZiwZUOu64KVxQRw3pAj8sTAjfY8qDnGguNnl3cbBY23m1KAMxwplXnzRpDRmF+S7H2W+jbFTiao
	XRcyelYolKBlqrZzj91UCj2jtQcY6Q2a5k0MoeBv1fR8131xgVpCs6rRSxE6GBFeWGmLeNa0M8o
	vKN/tptBRfPtKOm7PhChzmVjhNr/bpYHaOjw4lExkitLhPDEu1NGNFrhJ6dQo/gF7m45TQ15/+v
	iZ6Ys1PLphzFACACyEOe+tjohtLZ5aUTLpjGCcrA6eGXfoT1QwUU1rJMds5fp5Uxrwkv4XE6p1j
	va9QV4SDMBZtcef+DqTTiIHGnb7SfsKlEuuLgL18qGOx8FYwiK6CR7uNXGstINv5RZor+09d8ZG
	pC1KuxS/040QeZJ2A0PXLslJJwQtrSWgGJRsVgag==
X-Received: by 2002:a2e:a543:0:b0:3ac:7ad6:2007 with SMTP id
 38308e7fff4ca-3ae2b6a7862mr16289171fa.25.1794676598373; Sat, 14 Nov 2026
 09:16:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114095335.1283016-1-linmag7@gmail.com> <20261114095335.1283016-3-linmag7@gmail.com>
In-Reply-To: <20261114095335.1283016-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:16:26 -0500
X-Gm-Features: AclHuK_J9LkDU4Ejd97Ghggn0eepCu1-9VA9AiIWRy_3uPpOUQcjqWFzA10azKk
Message-ID: <CAEdQ38GQTPA3jaWf+qUaQr50i9_zaYREA2V2UYd5vWUYk1z2fg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 4:53=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> @@ -408,12 +408,17 @@ static void *alpha_pci_alloc_coherent(struct device=
 *dev, size_t size,
>  {
>       struct pci_dev *pdev =3D alpha_gendev_to_pci(dev);
>       void *cpu_addr;
> -     long order =3D get_order(size);
> +     struct page *page;
>
>       gfp &=3D ~GFP_DMA;
>
>  try_again:
> -     cpu_addr =3D (void *)__get_free_pages(gfp | __GFP_ZERO, order);
> +     /* A low-memory retry must not return the same unsuitable CMA pages=
. */
> +     page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, g=
fp);

size here comes straight from the driver's dma_alloc_coherent() call
and isn't necessarily a multiple of PAGE_SIZE. dma_alloc_contiguous()
assumes it is: cma_alloc_aligned() passes size >> PAGE_SHIFT to
cma_alloc(), but dma_free_contiguous() releases
PAGE_ALIGN(size) >> PAGE_SHIFT pages.

So a 12K allocation gets a single 8K page from CMA, the memset() below
runs 4K off the end of it, and the free later releases two pages, one
of which we never owned. dma_direct_alloc() does size =3D PAGE_ALIGN(size)
before it gets this far. I think we need the same at the top of both
alpha_pci_alloc_coherent() and alpha_pci_free_coherent().

The 8K, 24K and 32M cases in your test are all page multiples, so they
wouldn't have caught this. Something like 12K or 20K would.

> +     if (page)
> +             cpu_addr =3D page_address(page);
> +     else
> +             cpu_addr =3D alloc_pages_exact(size, gfp | __GFP_ZERO);
>       if (! cpu_addr) {
>               printk(KERN_INFO "pci_alloc_consistent: "
>                      "get_free_pages failed from %ps\n",

Minor, but this message isn't accurate anymore. Maybe just say
"allocation failed".

Rest of it looks good to me. Skipping CMA on the GFP_DMA retry is the
right call.

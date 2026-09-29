Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672231799F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648491; cv=pass; b=jQrf0U1kIINL4WmqZ+DhDvGUTA7yhplLvZso/87LQSOKmcOZQ3DbjCpZ/NlM8WYTz3Q5Up5cOzRFbYL9FbPuIsGGkpF79TeYBv3B9mig2JHamGsW9YA+UIGXRSkofw76Lvcc+oSU6CTOXxz4i9NKd/C9XK2bx42jfGqgxMYci2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648491; c=relaxed/simple;
	bh=QhRXGlPI7eTuBNU9/cBeyXlhvR5QBZCVis/qgqQbLB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzsyNpj4cL2qc7xY4mUZl3ese7FpdaH3i7Pv1yS2arCsIChbA2xHehvZ1ZQcWR3K243uB5mujTYF/Dr/WIbWaqs6JJ9yAphqdYl1tIf8UmwUucJJ94sqb+3Brr53g8PCUu5A7BUwRnpdp/9K8fudm+h7RZP4eSA0Zs71IQPtGDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjsYYvwE; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjsYYvwE"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso2871267f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790648487; cv=none;
        d=google.com; s=arc-20260327;
        b=LyPze+MldAGW0rEbx5u3en115paWxLMaN+Rx7cadnmg1KSvnYz38sk5XqN8pMKaF8y
         QJXpG+/xDB8gx5l4tirSR1KCIKULdU9Gf1i/u0i+EjSY+r411oAm6cYfJP7njZHbf1BW
         GWDmVF91q0+y1ooSgX2E/VNZfUspUGrwyalfvrNqNVDTrRiYjW2OiHztgQWU2CmTbx+3
         gNXQZfzNBMZ0sb37nKk4hJEe5JWK+hAqsLyNpqPjYRXMMv1cdAKT/jJ0aGml7UlySPPw
         gk0+/ulj5LAgJQ9HMhC50HXjUm+Ze1+e37QWrwt7/pFAzVfKicZXAuWJO6wWHzK1GhdN
         isag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhRXGlPI7eTuBNU9/cBeyXlhvR5QBZCVis/qgqQbLB8=;
        fh=4x6XYH0EA2d5ifxl6Rt024ird6FOdeWaEV5TIWa95RA=;
        b=dVE+O0kBQdkVT6KW1OPTqxhrg4SNsKquthoUtx2EPajwDxIZSBNCz8+XuCqUrp3qvT
         3hYtyHTM793BCHVj4eFI7kHflw9mROXanWRI+qcaSaVISv3MurpsmkRNybFOsozMNs31
         B+zIUZaIZQCzgFVnadsEfJZ/a3v3EafdTshdazRWfM4+X/hJ6sy7FZk+2SxtUomSH4HA
         zsmQqNRPW93ufHE8gr6FdE79EWxs9cbXvSwTkN8ZV72F/Ioky1hM8OUS/WcbGOW2A7Cz
         hSmtBkoMX0OhPkewEEL9rixF+5BgqyxfXu6AJA7cvUYBI6ytpADJqXk+9QbWtaLnN8fx
         9thg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790648487; x=1791253287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhRXGlPI7eTuBNU9/cBeyXlhvR5QBZCVis/qgqQbLB8=;
        b=BjsYYvwEh8CD0af3QyCad+1OtD57tNEVXIbHqRFFanoAJhwqD990aEZ7A7SC02DqKw
         hhb7UBVNNNH/1T3tR95ITF2ydfTh87D6joiI2cwmJHWrqdzldcqcTj5gg33KjbH2IIW6
         Gp/yiLc+C6r1FlzyiKrzEITQpa7OTsmP7vpgtiS4sSmfaXNusR2OHxwh+k5EN6CnWiwe
         I9b/Bo8lCxdgSDrgokTg7gDDy4XD4b5x4LLLClbF148Uy1uIcUiRdP0FZelKZOb8/lPu
         G6oKqIa4PadutaPLB+XV6GGYqXPeWhrIYKtSPDXHOHWxeDALp8nEUYZBnud32uRj9YLz
         ow8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648487; x=1791253287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhRXGlPI7eTuBNU9/cBeyXlhvR5QBZCVis/qgqQbLB8=;
        b=yPLO45behO+4+x+OL/aQ9GUKz4lKjIrNid0wKcksy7+wDTS40JkdDP7t2WLFtDzCyt
         aAnaDMaST9lwqiRWwMbfKHSQJ7Fq1KtUPnOtiMXRUtPOd2MhyBwkOMG9ZQixGljvL5Wi
         B330o/073dyo0/zzBmtkTEA7xYQAY3qvuZmufKG2hW51PE90FemHIY9cdKDl9UrnjTzf
         zDKI3/CiQAKtR1JtIIyaGfYWyYcCu6sR3AFHpydHkZc4syIwhkPBwXH1bkUqrABV1vCO
         fnAtprnJGN1FRysYQ4DIG1r3GXtcOdX+GKYIpvyq3IhMLc1xa17VzB3hs6ovc0cUBHs9
         qVog==
X-Forwarded-Encrypted: i=1; AKwUvBz4EuJSEAYCu7h+arZFos/8jfx5lR4PQ0BqpzfjunW5xBm09zQ3/5wA+e4Brb+fAb57iTXGxr6fbLCHjyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLewbOLR9GgBkojmIgn/W04BwO2zs/EYtJBuhiPPEj4tpRjukVf
	TZj1+S711boAbDoiAT1Ia2C75wpgVWQUZEIj8R0heJhuJYwfhEUWpT43IDz6jjBVXKsAhrOlLtU
	sdLfH6hVspk+O7qcxy6ScJ2qDqLShj9I=
X-Gm-Gg: AYBFou1v+qUlNuaQC0AawpfQCMpquJ5Eujg4a7Q4bxP1CstFqNcjRbq/O+oullPNFvj
	PK1yQ9wm3igRaG8/fYHwd9Kq2xQd97EPPD/q/oKYuPrwlSo9xkk+rUQLxU6LiierUGgOgcWAOlf
	rvhykBoV7DD2Ywhcb+8UpRpFahMwtaUN0kB00YTjG0rpdvW7fqRLs2ODVxqdr1ClYDgjhYWPszW
	9QKhVCOUwe5Jr1018bNVF1alE+ToAeimbA+6KqI5P9yCmjyocJT68LEDqoPfpEfjwdLsiyxJpfc
	mkfTK53qUVRNLbR9xa8tIgV6vvFx+IOLjQVCHJ0EDA7zC639YlQhU0DovSj2e84f/dQ=
X-Received: by 2002:a05:6000:268a:b0:486:f9d9:fe0d with SMTP id
 ffacd0b85a97d-48872abc48emr28274596f8f.29.1790648487350; Mon, 28 Sep 2026
 19:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-4-jiangwen6@xiaomi.com>
 <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 29 Sep 2026 10:21:16 +0800
X-Gm-Features: AclHuK8No2tft3nV17h4GBsP_bu8Pg3JxoSCR-9ncascs6inJDmmsjStzCiYUMU
Message-ID: <CAHKocdGWbEukM6y5iYDR3u-9jJrqr=zDxqAkR1smR+o+TFKGug@mail.gmail.com>
Subject: Re: [PATCH v9 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Sept 2026 at 05:38, Barry Song <baohua@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 2:28=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.c=
om> wrote:
> >
> > vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> > huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> > the feature silently unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and
> > couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> >
> > Now that arm64 and powerpc/8xx provide pte_set_huge() and
> > pte_clear_huge(), add the generic fallbacks next to the existing
> > pmd/pud_set_huge() family and convert vmap_pte_range() and
> > vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> > around the block-mapping paths are dropped, so PTE-level block mappings
> > now also work on CONFIG_HUGETLB_PAGE=3Dn kernels, and mm/vmalloc.c no
> > longer includes <linux/hugetlb.h>.
> >
> > The fallbacks exist only to keep the build working on architectures
> > without PTE-level block mapping support. They are unreachable there:
>
> Since this is a `BUILD_BUG`, can the compiler simply eliminate the call?
> I guess the build would still pass even without the fallbacks, so this is
> more of a build-time check than something needed to keep the build passin=
g?
>
> Am I missing something?
>

Hi Barry,

The generic fallbacks are actually needed to keep the build passing.
Without them, x86 defconfig fails with "implicit declaration of
function 'pte_set_huge'" =E2=80=94 the compiler requires a declaration at t=
he
call site before dead code elimination can kick in. So "keep the build
working" in the changelog is accurate.

Thanks,
Wen

> > the callers only run when arch_vmap_pte_range_map_size() or
> > arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> > which requires an arch implementation. BUILD_BUG() makes that
> > explicit rather than silently doing nothing.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>
> Nice to see that `#ifdef CONFIG_HUGETLB_PAGE` and
> `#include <linux/hugetlb.h>` are no longer needed in `vmalloc`.
>
> Nothing concerns me except for the changelog issue mentioned above.
> Please double-check whether the changelog needs to be corrected.
>
> Reviewed-by: Barry Song <baohua@kernel.org>

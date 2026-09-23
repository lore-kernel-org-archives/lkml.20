Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B576F3AC0CB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199014; cv=none; b=uA7N2NdlmPn4X5O2oVIOoAzWXZldNZKX1G0fbMM4sBuKiulopzIe/gSN3rGENI/4tXxkUzXK8949xh80nEn3DqxlTjLvL+CMKyszR81QcNs3LncPu3IdnsNRX1+Zge2hmwG7qMFzuuOPrTSL5DsjJkM0F+WN5S5qZPPHAR14xas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199014; c=relaxed/simple;
	bh=s3YrED/DYjJkCOhQVuSmfXRnSvlNAGPbMWfjGtNDWeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkXjKPVLNE7TjvlRmQRXrVV76RqUPeGFHmClRgnChhEjBWoPeg3TNZ92APghIXUg9Nqx643/Uj5k4O8+Oh/mQ70QORkL443rtkVxYZg9alt4Wi/Xv6tWFoFx37s87qPkGa2d3JY3e+Uy8ZAoRo+DaoKYrcG+ISHY0rdVcQSJIVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKAxKVtM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKAxKVtM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433741F0089C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790199013;
	bh=d3tq9N0LJ4r7VJ+9wdwqQQlbn4k6qzBMuLB5kE1baa4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JKAxKVtMZbF3TD2Yn2zgDD4fLtybBqJ/igLQzq3NUT4r9bDACuqKvXjvgz60TR+JA
	 BIFmfFeaS555lQfbIUJsxtX1zQkAUve6IUQqNm7nLfx6uf7seZiMIvm9RK03R3nD3X
	 yIqwdSH/bmBuXrza+VBpZYbApAWVCksy8bFBjD49DyaS1W6AQq+JhF2QihqME55VXB
	 IJ8+SeI/dKeiSzaW7jniNvqm6j5i8qbdAiZMMHyUhEOvu3CyESGyLW7HUG4hOhAWJf
	 +n7NPspRkMseNo+3GfhH9oIjsO6FjECoNDaxM6ZpMUq4024vg6/mylbECDTlTHtIO7
	 kd3RiEuWZgBSg==
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93910ad2273so151265785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:30:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQGeymSonefemHnHw//lQBobP4/TaRcN917GKebj4BWcKSuZhrn9sAVxMSiLe8H7dcY3A15Rjsk4gKZw4=@vger.kernel.org
X-Gm-Message-State: AFuF++mHnARVDaB+p5dXIb17sHMOlAB6iXt7dJLMvqQY4F99V1YpgtXC
	BLM5fzH8RR8HK4G8TH7KI2m7f3gpvs/W6XiCf53BIS2t3YQOxWAPG8T71QgxL0azyhXycieeNpG
	nhmRsDPbAbdtidnv63SP3jDdo0LEf1HY=
X-Received: by 2002:a05:620a:4707:b0:937:50b6:4a5b with SMTP id
 af79cd13be357-93c345836d2mr78355685a.23.1790199012523; Wed, 23 Sep 2026
 14:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-2-jiangwen6@xiaomi.com>
In-Reply-To: <20260923062832.479455-2-jiangwen6@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 24 Sep 2026 05:30:00 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xQhmRigaV_2G3pdOgk5mvC6HNzqCyUdRY3RSG8-QNC-Q@mail.gmail.com>
X-Gm-Features: AcwNN1UaTtV0wPc3IJY9Sx6rnYvw9-CPwWOiah8w0K1fH7hCcF4lT-foCe1dQ8M
Message-ID: <CAGsJ_4xQhmRigaV_2G3pdOgk5mvC6HNzqCyUdRY3RSG8-QNC-Q@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:28=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com=
> wrote:
>
> vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c t=
o
> HugeTLB internals it does not otherwise need.
>
> Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> depend on CONFIG_HUGETLB_PAGE.
>
> There is no caller yet: mm/vmalloc.c is converted later in this series,
> once the generic fallbacks are in place.
>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>

LGTM. Please see the comment below.

Reviewed-by: Barry Song <baohua@kernel.org>

[...]

> +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> +                 pgprot_t prot, unsigned long size)
> +{
> +       unsigned long pfn =3D __phys_to_pfn(phys);
> +       pte_t pte =3D pte_mkcont(pfn_pte(pfn, prot));
> +       unsigned int nr =3D size >> PAGE_SHIFT;
> +
> +       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
> +       VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
> +       VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> +
> +       __set_ptes(&init_mm, addr, ptep, pte, nr);

You have patch 4 to revert the `clear_flush()` modification from
06fc959fcff ("arm64/mm: Support huge pte-mapped pages in vmap").

I guess you may still need to guard against the case I mentioned in my
reply to patch 4:
https://lore.kernel.org/linux-mm/CAGsJ_4xiLScr2PrPu7Eem73GvPCtsuYd3J05kW3SC=
4QSs5Q4aQ@mail.gmail.com/

Something like this:
VM_WARN_ON (pte_valid(__ptep_get(ptep)));

Best Regards
Barry

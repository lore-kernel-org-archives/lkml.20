Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E904A4EF7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717711; cv=pass; b=KesfWKVQgkYGM1zHiONLYKXleQyPkKnMLX8fsNTYi06FaXAN8Y7/NOrOJPV4VMmuiK5tQVKE4JGuIpZa39QLbF7idbVuTEd8sei7LnAOwMxjVdLv7MPlNL7yjdSts5nolO30R8lHUp+Guf6vWkG4wfwctFITpCyYir5NZCHco+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717711; c=relaxed/simple;
	bh=DVFuK+9yCAfZ7sQxlxzw7lKhJ/hsXgq7ham+jQ2m08k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvXu6lyAERI0W/Y3dwdnEO2uz8CRrKVAN7hjq0m9A21JWbXWhTjOneJUQkg7/Vo4KFog/tw4VmKIJGzrF8/PG3XY8/OYdXOx4gUE/uUdDB2Qm9eNoHYjJOoPIUJvlfcrUCCofHjwS6Jyp+7MIyWmVJy59q3pHbgmiGkUykE9ZOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ca+Df6gj; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ca+Df6gj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so284603f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789717705; cv=none;
        d=google.com; s=arc-20260327;
        b=TKUY/ocqkuymCXa2/vWB943PIoxELGIImpZaP1bIgIWNy8gOahSdtmky04RpI2PayS
         pQonB3zjI6Xn4bEugvvU/tpy6YZmNycLQO1Ze2vEP76N+jAqJuiBxrt4XD9dw+bTUKk0
         nEXpHPYwu9yq26CqaehgMBvFD1Qfs4hQMBN+0AxA3he/Gssnha7EiVJ3/EiaXwVRMGqV
         Kbz+oCvPo5ymOZCc84gPRc6E3aX3vZhrA+yHnaQwLlxiUkuFEk4WXpwyFLmDVdTzO9w3
         3hKnCift31D6/flmTKu6e7PhA5SKd4wTJWgRgMul+pOPMKatN6gfbn9zdRNOCAXdw/96
         SV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MXqdDZMk2n2ZA2FZuhNJE90D+Z4Rs/KppQMaR2DzMcs=;
        fh=AvqmHhBTuKLTlcq5lG5d/i0/ABsdsWePcUjhbrOa0DE=;
        b=CXwIIs/W6OTNybsmKC68/NRrN4oeFhgEj7L5lhvcJWqbBK+08ZqJPzVkgRCWrjTrFT
         UbMeOXuGD/gtf2DDom+roQ0Vhn6x3TW+2ognqmo3KDER3S70jYVGk3Fqr1f1zPDPk5J7
         zblpEFbXI/U1ifCz5e4ShmdsuV5oW7Z/WPUiNaayosCEJRFN+BPscKDlqy4te3KrSnkA
         lODsEBmz2PoC6BF0OrZ/XbZt0YQ2bd+tiqpUdI1/A58Fay9AatIqFIJ6exfsYq6DdSu/
         0d6Se+7ewhMiYFy9I+YV2L4Rm12PzcO64IxAniWE0aoF5OBSM4c7iTiZokPCv/MBZnpe
         npWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789717705; x=1790322505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXqdDZMk2n2ZA2FZuhNJE90D+Z4Rs/KppQMaR2DzMcs=;
        b=ca+Df6gjz6B6H1OzKiHW7spOKnm/8JTMs2lA8XxPKpvCp84g1z0v+yMoOUjJZgSPwn
         OtaHMBYmNpJ3Fk+2RitE+M6a4nXBUq+mVf2gWwg60g1ZLUNtflB5IIOp2PBhE7Y+A3yv
         +Gh7CRYzWGd5OpMS4n1y9EKg8AEh3w+ejMInon3EnYTtm2mxlhDBXG12fjB1hj27lhKH
         +4jGihMLEDEPsdcrtJUGVxRjdjnxju9npVm981Lzb8HDYD7fIXcCaqAfuGog/HM39jv5
         UNfpaL5j/nQs7gxD5yQgbA70ZRgHHgZdIWxsJhG/fntsj+EhyigAKMbH5QK8oYbsFTyQ
         NEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717705; x=1790322505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXqdDZMk2n2ZA2FZuhNJE90D+Z4Rs/KppQMaR2DzMcs=;
        b=ya4BquTXJ5oMlEgID0xcBt+CQkaD6VMgAl3P0g5N59m0vxB69CpYixe45tTzv+c2pD
         pjz3ryMhTTZYeRr6p1m0M5g87Hn+PLN6d/b/bb5sz/ErmS9e9vYGXctL7b4NsVO4M1+J
         qd9XW5m3KrZq1yufqgvFdxcJ3iwF/yRvtEIDJSUOnI+rE7RQM1nLVzo4yrOaagVgS9gj
         il6/EBZ6hVnp1wnNftxsVvtBVzeUuAknZejIZCqsp7u+8fx2o6avdB9EMSMBnAeN+nQl
         9Njhkx2ajK9l7Xm/xC0VtkJTQl09aHuElOkriE2JzctWALT5uK6xe1AMQsENS1pFsbHH
         NXZA==
X-Forwarded-Encrypted: i=1; AKwUvByA637k9qqUNSKyQUVLcpFvMmuPsmAZgp5BSSJYYuuY/dt0CcSQWXO6DcWqZQ4tlXUVENHUbEEkQlXKz6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kdAISbLhYXSUnDwwoy8g/ZiBttV3SudNpcoWCWUBZ7BacXOc9d
	DqlCJCA0CTZvOR8wKDT++YbMsUYlS9pmQapUL027BVJPZ1NVsjmoKrk1ZtHtJkatbfok2HMWo9F
	/pbeP09u+TtWnayfZCzM32n/C+NUbKBo=
X-Gm-Gg: AYBFou0r4hwNuc1i0TuwQo/vBZx8zls7UXg/7GPGYxMLISu53OFTSZFnxYZ85oyaBBW
	1i+T0eQxt3fkxhytSaLvzA6yOcIqNEGryd7O8CllkTAEz1qTOr+xmDMNQu3br6NE1VwlZhRDgHS
	blIDp8Ax8UIik86+FP26uOJr8QZq+X0BzISO2wiuvitlGaHeYEYsdDSJUG/Y8zNRqk5EWXTvBjJ
	PWORX4loYIyYt1VTu+33nsdKD3Pjdjc3S6TRyssW+pqgLZhTIUfrMxooqmhl/ooszvn50GI0r8N
	ASULSRAWeSA5bvs5HoIZ/QBOJrOOEYi1hs7Z7dFtz0NJOzyR5p2Y6m1X6y3mrUWIsVY=
X-Received: by 2002:a05:6000:4b13:b0:487:1687:197d with SMTP id
 ffacd0b85a97d-4871e212458mr1713724f8f.6.1789717705281; Fri, 18 Sep 2026
 00:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-2-jiangwenxiaomi@gmail.com> <CAGsJ_4xujxpH6OuuUao2=TAjTMKhr77ufW6OoZuk-VB=YPd6fw@mail.gmail.com>
In-Reply-To: <CAGsJ_4xujxpH6OuuUao2=TAjTMKhr77ufW6OoZuk-VB=YPd6fw@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Fri, 18 Sep 2026 15:48:13 +0800
X-Gm-Features: AcwNN1U7w_zpIxImLoNROHRiindh6mTvUu1jbd9liF3b4JQySYxKRKgU7ZyE2AY
Message-ID: <CAHKocdHS-D7Gg_n3razCrp-QT5seT4KWz9r1TSWVVwLFsZmU7Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
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

On Fri, 18 Sept 2026 at 07:22, Barry Song <baohua@kernel.org> wrote:
>
> On Thu, Sep 17, 2026 at 1:29=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.c=
om> wrote:
> >
> > From: Wen Jiang <jiangwen6@xiaomi.com>
> >
> > vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> > set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> > helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> > unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c=
 to
> > HugeTLB internals it does not otherwise need.
> >
> > Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> > pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> > __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> > depend on CONFIG_HUGETLB_PAGE.
> >
> > There is no caller yet: mm/vmalloc.c is converted later in this series,
> > once the generic fallbacks are in place.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>
> I tried to apply the patch to mm-new, but it doesn't apply.
>
> % git am raw
> Applying: arm64/mm: add pte_set_huge() and pte_clear_huge()
> error: patch failed: arch/arm64/mm/mmu.c:1872
> error: arch/arm64/mm/mmu.c: patch does not apply
> Patch failed at 0001 arm64/mm: add pte_set_huge() and pte_clear_huge()
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> % patch -p1 < raw
> patching file 'arch/arm64/include/asm/pgtable.h'
> patching file 'arch/arm64/mm/mmu.c'
> 1 out of 1 hunks failed--saving rejects to 'arch/arm64/mm/mmu.c.rej'
>
>
> [...]
>
> > +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> > +                 pgprot_t prot, unsigned long size)
> > +{
> > +       unsigned long pfn =3D __phys_to_pfn(phys);
> > +       pte_t new_pte =3D pte_mkcont(pfn_pte(pfn, prot));
>
> Maybe we can drop the `new_` prefix.
>

Will do.

> > +       unsigned int nr =3D size >> PAGE_SHIFT;
> > +
> > +       VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> > +       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
>
> Do we also need to check that `addr` is aligned?
>

Yes. arch_vmap_pte_range_map_size() already guarantees all three,
since we are already checking two of them here, we should complete the
set. I'll add it in v9.

Thanks,
Wen

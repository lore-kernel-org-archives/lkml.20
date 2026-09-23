Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEFE334C3D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198617; cv=none; b=A1+e7eAiWEeXNGqfJVymeKavjX3MmGKYVY42yo5odP/Tw7VP70zBBjRSqkwhcbAlrjPI1G34SrDz9Rs1jE0RFIL9AEwfzIdt4PXcpbmP170dYLvnBC9hDFGXCQF7mPZR+75jm4hxGYWD3qcaaG1Q0Q2BDgl38c/x+iSCqjQFiy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198617; c=relaxed/simple;
	bh=/6L60FbOqzRAGaCDnJZNaHZJU5qf0rHWaRXMgdyPS3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSmgRI8svGdx6BuJerNGd64jt3F9GaqkIYO0BIEnTz0j+/KvpDD3VzMqBXa/COHZlaODxW75U1bJ4lnGg2YxVevFkHYxilzAlq1SWamhJGKOoU83ZUQkTGjOAypHUM52zbOO4IETJtssGxaY1FbfA2RNiGvS15vT16KGfC53wSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2NXnhWk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2NXnhWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA251F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790198613;
	bh=pFOUdSvHwil/K0FhFzOket4pw49ZzFhiG+QLBkwjfts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l2NXnhWk5v24WehMq4tSpmYi+d5xm5L5yI8aFPMPz4HayjF3RJ4ct2hxFlSr6eGvJ
	 0Dtw3flW+pOGjBESMhPfV/DI6fLstSCno88OFAUOcih9X39nhGNIm+VpXZpUCynB5X
	 +D7okYDBr1ytqcLJCoruXi0yL6W3PylDaJ4luGmUZJF5UlIpJep2khrcvpacTDYim7
	 IT05Utcze2c06jhGz6rpyFOWDLNJd1LCpKETbFh+ZE4BggMJqtOZYAweaXhTF8C/pj
	 MBU8+1dE75n0Jan3UlAQY4zyyjUWmsOME/jxXvmE57pTuE7aDqGqKM9u4ELTtwB8wP
	 qgVVtkJxP0phQ==
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfd70b08cso134376085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:23:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRqRfmOuJ/1gLZv8puB9cLOyXDfz9U74TEXCGxHtH4VQPXMS4AgNdzIjYLzww0ja35qpGGZAkZm68yufU=@vger.kernel.org
X-Gm-Message-State: AFuF++lnQPa2bBv/MqGRNkbBOQP0+s9EzV54+KbB5OHBOdeZ0zyD7jwq
	v8ppREbAzmv6wSByBM/B4ra2UgXnXE5Fm6rH5xXQOXVfJo8418GY4xkgpUSrK0b87mjbqMhfWBd
	/8MjthAyhVUNwFOTTzUCD2K0j7mWnt/s=
X-Received: by 2002:a05:620a:2a04:b0:93b:d7a1:ba0d with SMTP id
 af79cd13be357-93c346ca45amr66989285a.56.1790198612443; Wed, 23 Sep 2026
 14:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-5-jiangwen6@xiaomi.com>
In-Reply-To: <20260923062832.479455-5-jiangwen6@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 24 Sep 2026 05:23:20 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xiLScr2PrPu7Eem73GvPCtsuYd3J05kW3SC4QSs5Q4aQ@mail.gmail.com>
X-Gm-Features: AcwNN1U6u4upYBVse70ygcbBam77nB0znlsjMQqKiWEExUFJn-qljmWnP0sSc0Y
Message-ID: <CAGsJ_4xiLScr2PrPu7Eem73GvPCtsuYd3J05kW3SC4QSs5Q4aQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
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

On Wed, Sep 23, 2026 at 2:29=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com=
> wrote:
>
> clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
> was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
> pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).
>
> Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
> longer a caller of set_huge_pte_at() on arm64. The only remaining
> callers passing &init_mm are in arch/powerpc, which uses its own
> implementation. Remove the dead branch.
>
> No functional change.
>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>

LGTM. Please see the comments below.

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  arch/arm64/mm/hugetlbpage.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa6..ce247b06fe03d 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
>         for (i =3D 0; i < ncontig; i++, addr +=3D pgsize, ptep++)
>                 __ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
>
> -       if (mm =3D=3D &init_mm)
> -               flush_tlb_kernel_range(saddr, addr);
> -       else
> -               __flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF=
_NOWALKCACHE);
> +       __flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKC=
ACHE);


For the vmap case, we are not mapping over a valid mapping, so there is no
case where `pte_present()` can be true. But I guess we can strengthen the
check in patch 1 by adding a `VM_WARN_ON()` for `pte_valid()` and some
comments.

/* For vmap, there is no valid -> valid transition */
VM_WARN_ON (pte_valid(__ptep_get(ptep)));

Best Regards
Barry

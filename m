Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794521724;
	b=DERZ9NeIVinmv1vyxzh7z4WChjQbzCxM/3C/Oa8SNhsjcQ28FmD2SG/tcpN8O7kQ2U+z
	 2T0TdUbkTawdO/6sFhWUruDa3t306dQi0bMarYvhEwgSC+65v6+1Y2IYBDQUiIclhaWoE
	 j7eezwbSKDM2q18VEHV2zh5vg95J7C8l2T+hDW2Guv74c3zQXe05HGAIR9I9NOQsMhZCK
	 isbncfjb6YN2WuwrLYhO0rmdlQ0IT22fynwTFX4bEvsMefuQfwl2UuscpwDK/iKkStj9r
	 Agt5UETuLn1fQYvVld6U6oYW3msPbyTU+c2cqzDZJswIRpCtFNuywAhqSb3ZpGAaLlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x4QNJEvzAlMIXBGcKmxpv9rSZn0KBUFpxlms+bXqEbk=;
	b=IYt5GzTMD+o/WBN+IbetqHNvEF3gK0KIuAMG/lv/Ak5EfIxjHOHaYf+T5uu2VUWAH681
	 tHJ6Qrs3bdQWqvjOcyJxDuLs2Gh8JsG6HT71ST9G8ql2rdudM5gXtfOQd3un3NdZkXrxG
	 NMLApwMZOH4FofmHXZkK9K01UdfXYibIdEQ1TIO7It4Ou+dxZCv6ypY795EE/SM9XbSSu
	 /5nDGLP3wldnUQY/SsaHEGX98IEWtVM6suo4jhQGS/4Jm2Nw/r5OfHZOsfMZR+VQvzl4E
	 0R0oztvNeTuAeh/zdvOleg/D88cBQIZ0W2xtBUY1is7/ZjaFnOsuiSeAMxR5uw2bOSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k58G8NKk;
	arc=fail smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42671606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42671606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k58G8NKk
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so1592a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794521723; cv=none;
        d=google.com; s=arc-20260327;
        b=i0Yp22YZvLQ9wYPpnbNtXA0YzEDbjUS+bK4sAk1FC7yoW+F5XAnrCEvzKDHPA2wojC
         k3ndfaCt1zvsejUGHGdZs08JYOQZDvOTkErE4PWmm2oJ/VNPbEg7aEF5ltJ3XTgYqvp7
         qshOWmvArMmhAaibXczmLfkvdFwrqxqhqPKg9MJc+wZllMMqc1KdVIqYyak9XQtvB4fW
         ZOyePgMLaCug98ap1o20+2pn58bYfbly3h0bKipuViA6kQ1iMxODotSFCVKQrmj4xCxS
         hqVCJu9WVLNSqbMjbXZVKDK2frYw0o7KB204J0LUNOayjEIStKx/iScMnZyFbMEuGHYo
         iSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x4QNJEvzAlMIXBGcKmxpv9rSZn0KBUFpxlms+bXqEbk=;
        fh=aHCM8Ypg+MGE7uoM1nS4YfB8BkLTohav/t6eHzZERzo=;
        b=fAvK07cNMwGwEOx9Bzu6Tvt9HDFZwmk4+IZQR+io31UIuHTrMCk4Gsf39XfQu7CV1v
         QFPFxKodzVo8gq7gHNnRY79t2FvZN9Glk8hxvkeJsz7OiLOZTt6zdJ1Ek/yxgnkOSCXJ
         xIDtZxbZ+pJlzpduX4lWnYcrmBRIyIDSN2A9hAqBeIGNczR+uvbMzPQuwSe8dfrFB88+
         DUIxx7GvcBD01wydnx541lOzMEk6nkAWUAqOZTkVscPQGJ9ZPL6GFUr31thKxKJ5JTjx
         UFXG9IoSahIwUbcqg0jup2uQR2wb3jjVLnyOHSXPLZN225TaUNBKwlMXjYoJflThJafj
         MULg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794521723; x=1795126523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x4QNJEvzAlMIXBGcKmxpv9rSZn0KBUFpxlms+bXqEbk=;
        b=k58G8NKkh/WsO/aRn9zE+/XMKmaKwxlhXgHBSvCnvHbmNfDC55M7X2cJKW4lOKEx4x
         2XNA0hvefFg1GTOwg1l0gDcBeguG+3wlsYuA5Jlcj1ULA4bU4n5PTag1gNyIvKkqyct1
         EG/Y1U3CSzwHU9DtmRvprGNhPzCUsJHA9+l8c3OnyeJ6ByJagEMf7UVpb6eWtputS+1h
         PJCHxP6olqZSrD/Ave3Zs+DB88iVS6JTBYv/JGD0RK2zve8vysCXWssv80uB1hHK23A1
         fE49K2Io7dbCAALB7BBl9ArU+/VCaX5lbpZ1PP7vr49li/SAZwymMr+G39ZrTCVvNDYI
         fQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794521723; x=1795126523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4QNJEvzAlMIXBGcKmxpv9rSZn0KBUFpxlms+bXqEbk=;
        b=ujjRec/zfIaPbhkVu3/7X+obQ59f+fYpejGcBDgjl3rPeEO/ymBETOlX6Birah83/F
         XI2OYflTXW/SVXx+mFu23lrhtIEcq1iDPNWe+BZYDzSaO1IauXy9LAzcqlu9AXvnQ4O5
         ylwj9g/MLBQtgdwpqAWU55b7a2nNprvSEdAejeMntrI1zP4747XToXbQ+gSLZS5JlXrf
         WXVeP3P9zOwEpmSdGJv1L262JRa77V+8VYL62Vxb+9Q5Q7OlmT8yR3U0Wz6ckbAsoVGP
         UvakNvaBO0bojiQRSMb6PCl1exzXvGpbgqtobrgBet1AMXgRvIN+49xc1L7eWJ+Z6sMQ
         E/BA==
X-Forwarded-Encrypted: i=1; AL+hErF/FHFTaLyJlEZJ+WyZGhqXI0t+eOdnhcLVbeX2rX19mH7p6WATqPV3s/5QNpqPA7ODQQ8JqEt70cAUARI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rr0fGOI9Ds2MOVGgpPMCTY153zcFLDhqR5PzG1fR5u+eI/U9A
	NfszpgrhmlEAbmnWtdGDb5uBLaDkvcntHfjnYActLgdJQoXYBgXdm/H/DxWlFOY/x0sUkpc0cpP
	guW/WCFueiafZXAxItfz9i9pp/zYM3m+gppQXp4ng
X-Gm-Gg: AYBFou0voKguWTnp3zUecFpTcVlfma8iRvvUKzNOUFArt1gNpXHyjg0uIDYSxDui4GR
	DP4UCWgCiUUURyhIbxrNz6rO6jGibVIWGfPHZvlDDb85UWOlmjFqVlD374qPia9xDYG1zbD4YDa
	PeQ4j6kGNrW8YHXqTg+VkooXiDzusln2M8/NDNKQ2TwylODF9Uasec+qSb99fH5KpcWc9FG2tnR
	LDGJ+skZEdH9FYd3IFkvweyKlfNtwc4jMy+CpbokeliRmV+g2SIfN4HCddeq+5rbyMWcyEw1Hf2
	OQMDK/wgsUeCJIHVxvR2L7pmbHJJ1UNPIhg+tF2OPotxumRleTd8Bu+5mCNtSs2gqKYkabdbXBy
	EhQJP4qeQEhiMVblVfFkYrGLe+k4CL5xo64HAzGZXvm59gUYPB1FaaOqUjdX6pOES8X4=
X-Received: by 2002:a05:6402:c886:20b0:6b5:70a4:c77c with SMTP id
 4fb4d7f45d1cf-6b7c82e0d9amr8478a12.11.1794521722130; Thu, 12 Nov 2026
 14:15:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-pte_table_clamped_end-v1-0-2dbe339c487a@kernel.org> <20261111-pte_table_clamped_end-v1-1-2dbe339c487a@kernel.org>
In-Reply-To: <20261111-pte_table_clamped_end-v1-1-2dbe339c487a@kernel.org>
From: Lokesh Gidra <lokeshgidra@google.com>
Date: Thu, 12 Nov 2026 14:15:10 -0800
X-Gm-Features: AclHuK9pHXXgukY8FhNBnEmP3YKYpuBgy2MxKk9i4nfs4cjz8eUM4vjeaML0zRk
Message-ID: <CA+EESO5O7BjFx_bmsogzWBZ0gsDD17na-cGjtc8stwATaHpXeA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm/userfaultfd: fix PTE table overruns in UFFDIO_MOVE
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	Barry Song <baohua@kernel.org>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:00=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> With a folded PMD, pmd_addr_end() simply returns the supplied end.
> move_present_ptes() can therefore walk past the source or destination
> PTE table during UFFDIO_MOVE.
>
> pmd_addr_end() is only intended for page table traversal, in patterns
> like "next =3D pmd_addr_end(addr, end);". With folded PMDs, a higher leve=
l
> has already clamped the range to the PTE table.
>
> Folded PMDs are uncommon, but can occur even on arm64, for example
> with 64K pages and a 42-bit virtual address space.
>
> Extract the calculation from folio_pte_range() into
> pte_table_clamped_end() and use it to clamp both ranges. This preserves
> the wraparound handling from commit f681d4580d5c ("mm: fix address
> wraparound when scanning large folio PTEs").
>
> Fixes: 50944692052b ("userfaultfd: opportunistic TLB-flush batching for p=
resent pages in MOVE")
> Cc: stable@vger.kernel.org
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  include/linux/pgtable.h | 24 ++++++++++++++++++++++++
>  mm/memory.c             |  7 +------
>  mm/userfaultfd.c        |  4 ++--
>  3 files changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 780fe849ff8b7..66d369870a740 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -12,6 +12,7 @@
>  #ifdef CONFIG_MMU
>
>  #include <linux/mm_types.h>
> +#include <linux/minmax.h>
>  #include <linux/bug.h>
>  #include <linux/errno.h>
>  #include <asm-generic/pgtable_uffd.h>
> @@ -1518,6 +1519,29 @@ static inline void arch_swap_restore(swp_entry_t e=
ntry, struct folio *folio)
>  })
>  #endif
>
> +/**
> + * pte_table_clamped_end() - Limit a range to a single PTE table.
> + * @addr: Start address.
> + * @end: Exclusive end address.
> + *
> + * Only use pmd_addr_end() when traversing page tables, in a pattern lik=
e::
> + *
> + *     next =3D pmd_addr_end(addr, end);
> + *
> + * Higher levels already bound the range when PMDs are folded. Use this
> + * helper elsewhere to clamp the range regardless of PMD folding.
> + *
> + * Return: The exclusive end of the PTE table containing @addr, capped a=
t @end.
> + */
> +static inline unsigned long pte_table_clamped_end(unsigned long addr,
> +               unsigned long end)
> +{
> +       const unsigned long pmd_end =3D (addr & PMD_MASK) + PMD_SIZE;
> +
> +       /* Compare inclusive ends to avoid wraparounds. */
> +       return min(pmd_end - 1, end - 1) + 1;
> +}
> +
>  /*
>   * When walking page tables, we usually want to skip any p?d_none entrie=
s;
>   * and any p?d_bad entries - reporting the error before resetting to non=
e.
> diff --git a/mm/memory.c b/mm/memory.c
> index ec3d9d99ccee2..ee792a2c0ccea 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4959,13 +4959,8 @@ static void folio_pte_range(const struct folio *fo=
lio,
>  {
>         /* Stay within the page table and VMA boundaries. */
>         const unsigned long pmd_start =3D addr & PMD_MASK;
> -       const unsigned long pmd_end =3D pmd_start + PMD_SIZE;
>         const unsigned long lower =3D max(pmd_start, vma->vm_start);
> -       /*
> -        * We cannot use pmd_addr_end(), as it does not clamp reliably. T=
o
> -        * avoid wraparounds, compute using the inclusive end.
> -        */
> -       const unsigned long upper =3D min(pmd_end - 1, vma->vm_end - 1) +=
 1;
> +       const unsigned long upper =3D pte_table_clamped_end(addr, vma->vm=
_end);
>         const unsigned long offset =3D idx << PAGE_SHIFT;
>
>         /*
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 169f681f9849b..57650e6f040d1 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1266,8 +1266,8 @@ static long move_present_ptes(struct mm_struct *mm,
>         unsigned long src_start =3D src_addr;
>         unsigned long src_end;
>
> -       len =3D pmd_addr_end(dst_addr, dst_addr + len) - dst_addr;
> -       src_end =3D pmd_addr_end(src_addr, src_addr + len);
> +       len =3D pte_table_clamped_end(dst_addr, dst_addr + len) - dst_add=
r;
> +       src_end =3D pte_table_clamped_end(src_addr, src_addr + len);
>         flush_cache_range(src_vma, src_addr, src_end);
>         double_pt_lock(dst_ptl, src_ptl);
>
Thanks David!
Reviewed-by: Lokesh Gidra <lokeshgidra@google.com>
>
> --
> 2.43.0
>

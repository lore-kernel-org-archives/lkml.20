Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D9E457E58
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950686; cv=none; b=NH/ESYBElWz/HiBtzA7HREqGWUYWYbw4lImTGWf2xXH04u12aZJJTeHIKIXqi3x2gWc07A5BLZPiclf0SZ2h/U2FDcwSxJC7M/6XeVQxoGGjVonJaDPd5mNne3mHU8GC2ua4puU5Uh0JMAFdioX7x6xNTQWMKYVqL2gEbyQB3qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950686; c=relaxed/simple;
	bh=NenvuYZGdfGWmIY7YgQLfKZKlknQZ8chX/MutBqmwmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtklGtGGBm+SsJ1W8SFOnRUme5uUfZFVty5Wlk8l3FjcqaFsokXwLUNyFgggkHQoPUBGmmr4Id39bGiFgXMpsq5gR9o6WZiaM2GJf3RnH8V4EROX4BnhQPCd2GwOkCMtLKPuujlBPbr7Bxd1lkxF/YrvlNh3j7SDUgoPgRagDjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oappmKQy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oappmKQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FA41F00901
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790950684;
	bh=0uOM3jWz9hTdESdoL/7PR8IoiwAtC5PATol6n9clR1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oappmKQya7E9Zo7YvGbz225Wzyq9o2rw3IkqXrNEP986A+djebCRgzN1ysoUo49KR
	 Y3zwqRU23muhQZHXWWOUht7UDXXxDd97rIh5r0+f95SHYAGKsMQOS723ZGtMNlZ+hn
	 gPy9sQhFMULcctANzXMz394AQljzN89hPcRjnFBPJxGaKqtI7Q6qIImyjX1dP8qUdh
	 EeYxjSsVJWcgPp98mLiL0CzXPIlhCZdWBhTfAcLHiJeWFMIO/ma69M2wW+eBMQwxuj
	 4Rf5fU9EaLkITmAdsQNanXa9dv2jzoOIA4sq4JVVR142LtdxAZQVTbWVRYgBTJr/5z
	 MaKGZ0aqoUZ9Q==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so12178656a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:18:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBziwmbFBolKS3G6/h0Xu82fsgBELWBDoe0mrH3JvOjiYmszU3IhyI/9I76W35wTXEUQ2oNpUnUIsrMZjOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyuAvxA++BtBtsWCP96h4zMlalaJqoP6NhOtB2AIZelzFPWdmx
	IRtfeOcSaPyl/66j0noW8atEfNbPlINktxrBr0gwCD5qwcV1lYaMMxHXWt7B7dUnL+hUx8IJqsK
	dGUsDXvh0cAtx0SZlm313RA70pez9Hjo=
X-Received: by 2002:a05:6402:44d5:b0:6a9:ce42:e684 with SMTP id
 4fb4d7f45d1cf-6af9e022740mr1653386a12.4.1790950683375; Fri, 02 Oct 2026
 07:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002095503.3585565-1-usama.arif@linux.dev> <20261002095503.3585565-4-usama.arif@linux.dev>
In-Reply-To: <20261002095503.3585565-4-usama.arif@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 2 Oct 2026 22:17:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5yr0xqAUUKftz_RL-SCp02RdFB=aK0sP+uDDwXZPUmxA@mail.gmail.com>
X-Gm-Features: AclHuK_4yoHncqxrokiRpDq18m_ydAvkbPTMAsmKGSie1oxuSHyShV6peln57f8
Message-ID: <CAAhV-H5yr0xqAUUKftz_RL-SCp02RdFB=aK0sP+uDDwXZPUmxA@mail.gmail.com>
Subject: Re: [PATCH v8 03/30] loongarch: mm: add PMD swap-exclusive helpers
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, chrisl@kernel.org, 
	kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org, 
	ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>, willy@infradead.org, 
	youngjun.park@lge.com, hannes@cmpxchg.org, riel@surriel.com, 
	shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org, baohua@kernel.org, 
	dev.jain@arm.com, baolin.wang@linux.alibaba.com, 
	Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, 
	Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, linux-kernel@vger.kernel.org, 
	nphamcs@gmail.com, shikemeng@huaweicloud.com, yosry@kernel.org, 
	qi.zheng@linux.dev, luizcap@redhat.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Usama,

On Fri, Oct 2, 2026 at 5:55=E2=80=AFPM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> Prepare for keeping a PMD-mapped anonymous THP mapped by a PMD across the
> swap round-trip, which makes PG_anon_exclusive have to survive in a swap
> PMD and not just in a swap PTE.
>
> A LoongArch swap PMD is the swap PTE value plus _PAGE_HUGE, and
> _PAGE_SWP_EXCLUSIVE sits outside both the type and the offset field, so t=
he
> PMD helpers can use the same bit.
>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  arch/loongarch/include/asm/pgtable.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index cf29a4c8ac593..87fecc3a51001 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -351,6 +351,25 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pt=
e)
>         return pte;
>  }
>
> +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
> +static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
> +{
> +       pmd_val(pmd) |=3D _PAGE_SWP_EXCLUSIVE;
> +       return pmd;
> +}
> +
> +static inline bool pmd_swp_exclusive(pmd_t pmd)
> +{
> +       return pmd_val(pmd) & _PAGE_SWP_EXCLUSIVE;
> +}
> +
> +static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
> +{
> +       pmd_val(pmd) &=3D ~_PAGE_SWP_EXCLUSIVE;
> +       return pmd;
> +}
I think the order should be pmd_swp_exclusive, pmd_swp_mkexclusive and
pmd_swp_clear_exclusive. That looks more natural.

The riscv version is already like this, but others are not.


Huacai

> +#endif
> +
>  #define pte_none(pte)          (!(pte_val(pte) & ~_PAGE_GLOBAL))
>  #define pte_present(pte)       (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PR=
OTNONE))
>  #define pte_no_exec(pte)       (pte_val(pte) & _PAGE_NO_EXEC)
> --
> 2.53.0-Meta
>

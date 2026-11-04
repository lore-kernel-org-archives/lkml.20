Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779005;
	b=w4Jsvmnx8WRao/RL/70I5D50RTCxt6lp41DEYgV/RQ/eVHG/9SlnYU9yFPRAO+cyjRKS
	 UU1rQLW/n090QvBwqDo9xDiSG0bA5jQnrbmLdvH2xlnd7hNNGg6gAhaOetsR4U2w/RUAm
	 buQ92QltsCDjpD2VcH3XWQZuU16yI4KGeSUSfmngBlf6/yG6MNdth5tk5Ntco1uHCeLFy
	 8IRFmnE8yMw9+Zc/9zk1XlyT9yBaZ7CbTxgm+NHdRwSxbTj2zML3aGZGHO8Jg19urgDfK
	 hRmZWt8/+7FLJ41YyMcjykoAU9qMLlmdf2gd9lp/gjk/UwmJvIfKtUOrb2orQeBUgGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779005;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HNu4ods6c1120leIpzJBlK6eHIivapUdba0o3Dpccdc=;
	b=uW3+mloevSmSwvUeAQGnzIHmpRHtcDx03f1PSLUaEIJWNyzO8pbmeCzySuuFAQ1Dwch8
	 ss4pKImXsvo8NIYc1sPtb2gSbb6uwq/XV75Se8EoYdvxofBoGmmLMWub9Z/5aKBxz5x/e
	 OzBF5mOJtc9VgEm8eYMe+TKisfBACUsB15gjNEH1k5K3tR0GZux06Hns3TIR6AWCmZRcR
	 99iJs4c2K1IfkwuHzPQiyE5Cm7XZ+G81dmirr5kxcsO5X11zUJorSu0dBpJwXRmDcsggg
	 Gndl0FzfwhwebwQ20awr9eYCha6nNiy8OZ0oiFJpyIVNCOeeHdWG5s7f+Hy9M5/gfPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIJoeGEx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BF606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIJoeGEx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78081F0093A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779003;
	bh=HNu4ods6c1120leIpzJBlK6eHIivapUdba0o3Dpccdc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EIJoeGExgzZz1jBK0fbEdK0x0YUnVwYfC/LqbcFPSvjKhaUFrq2Naa2FnzUoL6xTF
	 IKMnljZKrx+GC74WRV9uv4ZXPZZPwfcqQrIXx/Lqegi6JdNQT6jFoNpmbK8mexTP+u
	 fw0ynpvCwbUP+mMpB8P0eBAzq7ZWI6sXmGQp8wAoD0hF0dOSo1q7T/vbpcOj0oMhjd
	 cVP/Y3KYlO6hDgTyaxBsxH2W/tOjDrbS53uFra842uTf2oc6XnAkxlgDOAKAvq/u7n
	 LRtNEd9cf0O/zufCsgMycNSO9un3rDfwSMwCDmUb7ujLOgUHTsjb/m3n3d0/jUZ3Xb
	 /i6HHgM6/6usQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so431464a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:56:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwf1AHazc86rmykx1ZWiFH0oK5weTzPymbGyrpGzDmBBexniDQMgDEX+Uunqrz2D6MlapJHGqJl4LBmN3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i6d90FsN2Oss4JTEHHL2PgpJqFNyt+zbSbdn0p7EN2usPkWQs
	qjJJjbpGQn6vj6zGZoGkuMIWHp8nCIO09s2DLb4qEVTC3AJZ91H8tuh+eLZwEHkEmbsrN5n0WIZ
	jVmI7Gdo4fyyqIYwcod9YfyolKJLB7W8=
X-Received: by 2002:aa7:d386:0:b0:6b3:c422:9257 with SMTP id
 4fb4d7f45d1cf-6b4d4d7c182mr7792710a12.25.1793779002538; Tue, 03 Nov 2026
 23:56:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104071858.757793-1-songmuchun@bytedance.com>
In-Reply-To: <20261104071858.757793-1-songmuchun@bytedance.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 4 Nov 2026 15:56:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5iiGZEqf_W2KmtfdqYaKY1HmeK+ZdSz1t+epAhY=X+0A@mail.gmail.com>
X-Gm-Features: AclHuK93_XxdZekUa7K7uSHByhrComWPKbTc4AurJlwH-qxA4RI5N514mVEKT4Y
Message-ID: <CAAhV-H5iiGZEqf_W2KmtfdqYaKY1HmeK+ZdSz1t+epAhY=X+0A@mail.gmail.com>
Subject: Re: [PATCH v2] mm/hugetlb: fix validation of unsupported HugeTLB orders
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Sashiko <sashiko-bot@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:19=E2=80=AFPM Muchun Song <songmuchun@bytedance.co=
m> wrote:
>
> Commit 7ce6048d3a7d ("loongarch: drop ranges for definition of
> ARCH_FORCE_MAX_ORDER") removed the ARCH_FORCE_MAX_ORDER ranges for
> LoongArch. Besides dropping unreasonable upper limits, this allowed
> values below the architecture defaults.
>
> With 16KB pages, LoongArch defaults ARCH_FORCE_MAX_ORDER to 11,
> matching HUGETLB_PAGE_ORDER. Forcing it to 10 while enabling HugeTLB
> permits order-11 HugeTLB folios even though MAX_FOLIO_ORDER is 10.
> LoongArch does not select ARCH_HAS_GIGANTIC_PAGE, so this violates the
> generic MM assumption that folios cannot exceed MAX_PAGE_ORDER.
>
> This invalid configuration is accepted by Kconfig.
> BUILD_BUG_ON_INVALID() does not reject it either because it only checks
> whether the expression is valid and never evaluates the comparison.
> Detection is left to the runtime warning in hugetlb_add_hstate(), after
> earlier boot paths may already have used the invalid configuration.
>
> When an invalid HugeTLB order can be identified at build time, reject it
> there. Otherwise, reject it at runtime before the mismatch propagates
> further. Use MAYBE_BUILD_BUG_ON() so constant violations fail the build
> while dynamically determined orders are checked at runtime.
>
> Fixes: 7ce6048d3a7d ("loongarch: drop ranges for definition of ARCH_FORCE=
_MAX_ORDER")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/sashiko-outbox-192874@kernel.org/
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Suggested-by: Huacai Chen <chenhuacai@kernel.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

> ---
> v2:
> - Move the order check after hugepages_supported() to avoid a false
>   PowerPC BUG_ON() (suggested by Sashiko)
> ---
>  mm/hugetlb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 779b1de33c78..b49130eb7ad8 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -4197,7 +4197,6 @@ static int __init hugetlb_init(void)
>
>         BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
>                         __NR_HPAGEFLAGS);
> -       BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>
>         if (!hugepages_supported()) {
>                 if (hugetlb_max_hstate || default_hstate_max_huge_pages)
> @@ -4205,6 +4204,8 @@ static int __init hugetlb_init(void)
>                 return 0;
>         }
>
> +       MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
> +
>         /*
>          * Make sure HPAGE_SIZE (HUGETLB_PAGE_ORDER) hstate exists.  Some
>          * architectures depend on setup being done here.
>
> base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
> --
> 2.54.0
>

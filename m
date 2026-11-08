Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171870;
	b=XUV4UWeSf3cED3S2XUd13Jz3TYtwZ/Jx79BsbaOOuAb/3fDtsQcx6iQ5njE0HjUHw4ek
	 FxdfH1H4jiii6dQ9mzgSlV/G4tBT0jp6vI7xSzjmYwtF8/gPx9NntirlRC6AuVxzA8o+n
	 kxqw8JKXGCjhI1tLm8lQ6N3/crIstEWYWAcHtKpc6ayUPdFWmGLO7pSKLvWGU9MCqaIk/
	 rpBcH8jAWGnyoOHOH02a/k3NTYA8BH9FN6CRbHv/yPdylb1169bem7zTSeGt5VOvq2GoD
	 38UjXO5+RmZdb6c4FqtB8DlC3wRtshDkCuLK66iz5zzB4BFpJvirFBo3zzJsVa9eHqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171870;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dA8BlSr4nW8M2tmghZ/qmNUjL9Vz8LO1wLh57I7CYw8=;
	b=wSvjwQXaTHaQn3T1/D9/yLwiyQLY7tGFq9fyMmzx/GEdUdQndKPLncm0yak0U3jqDBMj
	 7qu0vlZzv+1/ePNJSF940hwc1DLgyebEyJw+WVSq9fRLUsIcG3e1WGdJpw3oBMbulw0wu
	 ayuE9R+b2pW0nNB6MgAMWSxGL1dHgp4JMyy9/0vyXTq+3Tne0f3wv59te2WjAt0PmdA8O
	 LwX52h+H7KdabX9cApY2Xada+L1WzwogKnwhn9jT/3nFwfQnbh79lt91Hd0DWeuaenWUL
	 qJtAAXFZXLuQwzk8KysPw3O0L45EhXDv8estYlLxfBBXOLgYT7++8M6I+cjrcEd+a8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gm0vMsur;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A80606D818
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gm0vMsur
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FB01F0092B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794171869;
	bh=dA8BlSr4nW8M2tmghZ/qmNUjL9Vz8LO1wLh57I7CYw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gm0vMsur6Zp+NDkvE5MIcJ+lRVCZkjKGPWerSg0Ixxfn9AEbpAu/RLNKOqwe/ZTdo
	 qPph1jA31UrzXqTs+vyoemnUgI2gqnqO/vugay5bIG4wQdwTss9sreUHZHeUpgXCew
	 xT57TF/AzNCIVb5ptdoraysWsiWP9qiz+GAmeYe2ZaABkPz3HHL/YoH5zndZBhaInK
	 l1ZfJq9jygp4h8kT5Gh1IRgMOKCswVib34YlOmDx7ZDzDx5NL5V9adTpX+A20v/nD1
	 BvGjiE7CAPVWDb1+95/Ev5HtSHiPIok/91M5Lqq/9Iz2IAxMN30nyu4NE4pqAouu5k
	 JZwc0uwTnuukw==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9441591aa5cso38926985a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:04:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHgY1xu4XHCtWnh287UuHT7sQyOazowgGZ1s74usFETIdcSAJgRcwelfcbRyxFkVeQ1w4lkYSyPcsomda8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VJYQ+Z40L6Ly45t9PJAOv2BAZXTD8dhmnsEDQ5M6PFmBk6KhJ
	JutPgJYlQDqpqxnYcRY7Sf03JisxX9XtddrWYyMZ5z+R3ihB7bEdh8S6Fsn7F/5+ZFz5aN5cMtI
	8iCuWtMnLZeXWLLdZHBObdpcvBPURaEU=
X-Received: by 2002:a05:620a:4147:b0:945:d2f9:5c2e with SMTP id
 af79cd13be357-94784201be3mr321265885a.18.1794171868934; Sun, 08 Nov 2026
 13:04:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-mglru-fg-v4-0-2106750c0bfa@tencent.com> <20261016-mglru-fg-v4-7-2106750c0bfa@tencent.com>
In-Reply-To: <20261016-mglru-fg-v4-7-2106750c0bfa@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 9 Nov 2026 05:04:17 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wSDOgCC9AmLS-z670W-nkF3DXB_cNvNFnptX5F95fGMA@mail.gmail.com>
X-Gm-Features: AclHuK88cVk2cTHlbMRpEce2sAMWIV7FVPbAiXOdIHIxIsSaZ46UdtpCmeHh5_Y
Message-ID: <CAGsJ_4wSDOgCC9AmLS-z670W-nkF3DXB_cNvNFnptX5F95fGMA@mail.gmail.com>
Subject: Re: [PATCH v4 07/17] mm/mglru, gup: mark folios referenced via a fast helper
To: kasong@tencent.com
Cc: linux-mm@kvack.org, "Liam R. Howlett" <liam@infradead.org>, SJ Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 2:15=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> Introduce folio_inc_lru_refs_fast(): raise refs from 0 to
> LRU_REFS_REFERENCED via cmpxchg, or just set PG_referenced for the
> classical LRU as before. No counter update, promotion, and guarteens
> no other complex operations in following commits.
>
> Convert the gup fast-path sites. No behavior change for classical LRU.
>
> Tested-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 25 +++++++++++++++++++++++++
>  mm/gup.c                  |  6 +++---
>  2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 65415eeac802..effa13c63632 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -454,6 +454,31 @@ static inline bool lru_gen_del_folio(struct lruvec *=
lruvec, struct folio *folio,
>  }
>  #endif /* CONFIG_LRU_GEN */
>
> +/**
> + * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
> + * @folio: the folio
> + *
> + * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
> + * untouched. For the classical LRU, a plain PG_referenced set.
> + */
> +static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
> +{
> +       unsigned long new_flags, old_flags;
> +
> +       if (!lru_gen_enabled()) {
> +               folio_set_referenced(folio);
> +               return;
> +       }
> +
> +       old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> +       do {
> +               if (lru_get_refs_flags(old_flags))
> +                       break;
> +               new_flags =3D old_flags;
> +               lru_set_refs_flags(&new_flags, LRU_REFS_REFERENCED);
> +       } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
> +}

What is the actual purpose of this patch? Is it to skip
cmpxchg() when the folio already has non-zero refs for
better performance?

Thanks,
Barry

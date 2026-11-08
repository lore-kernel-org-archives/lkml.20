Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794176104;
	b=Bzy92nnWm2zg9/WWTEKV+d6BZagse5kgZStGJOIcjEUvYUiANyEu1CABA9osHzI6Czon
	 moUAMWWqUigiT2SKr9EHzwTSKYyL4YkXD9ZrrnmJBJmAiRkEhsQpHsnR2plM4LWZJ+Mmd
	 X53U1AAZloecsE9a90VaiYjDxARLepUXFH3xsG+P2EWGtlMmuS0iwTm+qjol2b1X6sp7L
	 T5sD98Nh0Mi+ti98+TSUNEn6aVLJoHFVJckx4WrOLLIz4pYgyeN3qexLf0sY5hq/5lHiU
	 uaYQ1l5PJPjHWXFtCbx1iI09CWVCJ6m3H1oRrPlQ1UV+59sPGgWQtYiGq9FPXISxrBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176104;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dYkSOS7lW77R25JXZ1I8J7Ye6eXp2ev/AWCnfjt0ivY=;
	b=SE4sSPzv2FGd51WlFDnA6N6RZxq8oqsrojL3JniseGjNxmlOQZPGFMIrI0xvLK0k3R7u
	 7TcuGoRaPNNzCPtV+2aMjE8H6FAzRvpx69+73jjilNxBrQDppFUdVyTqVEtW670JOKhQh
	 WVy2eYfMEDc1KGhhNzJ9dW2qlqn41nCPqIpXEr8WE62KXM9+vY6na6AdF+Ej2MqxnsMoR
	 vOi10X7VQUWuf3dY50DKDL3JqoE7SpmTi93zCwhv45ldX9TKagLtkr6IdHy/hUf74V1jH
	 HDuzyYkw2xChOypfKXIgWUBzZZfyVa2WD5Q65rFOyhpeZ+C0QaubjYJKe+2o0sWPlAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Seoha3uK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A25606A336
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Seoha3uK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117AC1F00901
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794176103;
	bh=dYkSOS7lW77R25JXZ1I8J7Ye6eXp2ev/AWCnfjt0ivY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Seoha3uKPql4BZU5E/gvx3ApauNKjMlQdmXgafOlqRifpOGUjoFVna+fCYfEgDf0u
	 AuGVcIRCxYBHa1jxsq/9SzkH5V/8KUbaZ5GufmPM1Wh0s0HpmUeJx6yCKNxtPIP215
	 uX4gOU8CfhJQ2+aTnK+BCdmy8xcgQ7HG3+ZcD3c2OFair5mB/+2VP1k+t+OoCtH1ZC
	 AaL0HnXeyj7IYzsQWWnUrLiGZWPHEDu94/OdLHpMFOqjaOoavuZUnUl2wMcw2L6hVd
	 N64soyzR6cX6xniPCCon+tdXqO443DwJw/01+Luw/MmS8PXyZALvxatYwvxCvCTaca
	 l082MbzBzvpNQ==
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91ecbdf5343so5005416d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:15:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHZHPBrz+eec9ICTO5WU6E3RLnD/78kzZPT/4k8Dyn6ZYqw2CrVv6GnyAx95utui7+aF9MDJhtvCgdS4xU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vGNnt9LvyqpvWiTjzHw9NHNx27TdOkrveZqH1dcjv2su9/CNp
	c2I9Ch9UdEfK1nuptzHgTqIngg0bDkbIr/A0lYNU4KdLi3MwlhblPKt4tWlYIQ3MbxXF3Zbr2Bq
	KUX4NTqWTnnSgFw6awk5P8zmPEHJz19w=
X-Received: by 2002:a05:620a:458b:b0:945:c3b8:62f2 with SMTP id
 af79cd13be357-94604df4c5emr848358685a.34.1794176102003; Sun, 08 Nov 2026
 14:15:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-mglru-fg-v4-0-2106750c0bfa@tencent.com> <20261016-mglru-fg-v4-12-2106750c0bfa@tencent.com>
In-Reply-To: <20261016-mglru-fg-v4-12-2106750c0bfa@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 9 Nov 2026 06:14:50 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y-7R07wFJTY2a8tMQ1xvG2kjuG0Q1rLjx8DOg4u3UwZA@mail.gmail.com>
X-Gm-Features: AclHuK8HmC-Mujf1pZixYM-Y1dMwxxenrB0ml0fO-vwqyERAvkVtIlGDnC9BHUE
Message-ID: <CAGsJ_4y-7R07wFJTY2a8tMQ1xvG2kjuG0Q1rLjx8DOg4u3UwZA@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] mm/huge_memory: mark folio as accessed more
 accurately on split
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

On Fri, Oct 16, 2026 at 2:16=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> The behavior of updating the folio's access info isn't consistent for
> huge mapping splitting or ordinary unmapping. The page table's young
> flag has to be translated into folio's access info.
>
> Right now it only check and set folio's referenced flag, which isn't
> enough since folio flags update on access have its rules. Ordinary
> unmapping (zapping) calls folio_mark_accessed(), and it also checks
> if the VMA has recency to avoid false updates.

This might be a bit off-topic, but I once proposed
recency fading for the zapping case in Android workloads:

https://lore.kernel.org/linux-mm/20250514070820.51793-1-21cnbao@gmail.com/

folio_mark_accessed() might not be ideal for Android
apps that are being killed, as we expect them to be
relaunched only after a long period of time.

But for the splitting case, I guess there is no doubt
that the accessed state should be set.

>
> So first just use the right helper here to be more consistent.
>
> Tested-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/huge_memory.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index bd44d58e8684..1e2b6448c010 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3093,8 +3093,8 @@ static void __split_huge_pud_locked(struct vm_area_=
struct *vma, pud_t *pud,
>
>         if (!folio_test_dirty(folio) && pud_dirty(old_pud))
>                 folio_mark_dirty(folio);
> -       if (!folio_test_referenced(folio) && pud_young(old_pud))
> -               folio_set_referenced(folio);
> +       if (pud_young(old_pud) && vma_has_recency(vma))
> +               folio_mark_accessed(folio);
>         folio_remove_rmap_pud(folio, page, vma);
>         add_mm_counter(vma->vm_mm, mm_counter_file(folio),
>                 -HPAGE_PUD_NR);
> @@ -3216,8 +3216,8 @@ static void __split_huge_pmd_locked(struct vm_area_=
struct *vma, pmd_t *pmd,
>                         folio =3D page_folio(page);
>                         if (!folio_test_dirty(folio) && pmd_dirty(old_pmd=
))
>                                 folio_mark_dirty(folio);
> -                       if (!folio_test_referenced(folio) && pmd_young(ol=
d_pmd))
> -                               folio_set_referenced(folio);
> +                       if (pmd_young(old_pmd) && vma_has_recency(vma))
> +                               folio_mark_accessed(folio);

We now have two inc_refs paths:

- folio_inc_lru_refs_walk() for mapped folios;
- folio_inc_lru_refs() for syscall accesses, or possibly
  mapped folios with the appropriate flags such as
  LRU_REF_MAPPED, LRU_REF_EXEC, LRU_REF_FORCE, etc.

The interface is:

void folio_inc_lru_refs(struct folio *folio, unsigned int flags);

Here we call folio_mark_accessed(folio), which is the
syscall path with flags =3D 0:

folio_inc_lru_refs(folio, 0);

Are we somehow applying the syscall access policy to
folios accessed through the page table?

This seems a bit strange to me, no?

>                         folio_remove_rmap_pmd(folio, page, vma);
>                         add_mm_counter(mm, mm_counter_file(folio), -HPAGE=
_PMD_NR);
>                         folio_put(folio);
>
> --
> 2.56.0

Thanks,
Barry

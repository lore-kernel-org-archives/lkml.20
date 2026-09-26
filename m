Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4280B49D5BD
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790454605; cv=pass; b=QJy7anR9x1QrMTq0Ns9Npxbf7quPx9rUbbNZJjHGVvv9FJ/yiDeYwjbn1ekT2Z/rLWVtGz/wWQqdwrvTdtFojTFNtuyK5jqWTPMlWzlGFbPwOBz6Xj2oSOXle5bF/XYLv7dl5s9f93p0URcxqhpUwEAeVq8u0/yogRNuNNlySiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790454605; c=relaxed/simple;
	bh=MIR68NLc6qTsq9S7KdeaGeKHR6X233FXyIVl7LlsU/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1mEttPQ+bJmYaszKi8NWG2DxkKiS9ZIf4FtZcLq0SKE/DRyN7sjaj0/tnosdEoi5cCDbz9gXNNAdWLwNnVOzp4a7tOaojIbPRhx9hLgbMp4yeeYfZjFquwXgkQqwFFH7wpXijAca73cafXYvE/QBm0iKAe2vzVvL83hOUBvBDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5itAmO9; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5itAmO9"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso252489066b.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790454601; cv=none;
        d=google.com; s=arc-20260327;
        b=VdI0GNTcbomAiCyptc768IJ9qR3QaWKFvsB7E8ihMP5QHx9v89ObBsecDrx2KT4CCc
         3GpvOlf/jf04fYY1uoNJRzFMIcJkr8KVqYM87YOGiclduTeZj1T+ESlhvKu7lQDiW08K
         4AXOkz+qCgeCnJ2w3eU5Q8dEgmalKqoNPbqlEbqMJKD9oOxx8N8OLb8CnbvPAWFYa6dY
         sFVukY+Q1S1HWTx+sLjWKklJmaQJ44jJmDcyVc58BHdsSI/zmkoN50WezjuUiLwqZKKU
         TwiY01ZPG3dGBydR3Ng9U08vImudUAB50iwxf3h3dAuP2uo4VUC/ZjztVRzn9qS5f197
         gSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LJ/PmwAD1gXfRgUIPquc0VEGnUEhKbmHbwXAzi7i4tY=;
        fh=Ll8otbHJcBm5s1ElLwNUIfkY+qMlYOxAA3ITywC6hXk=;
        b=AT7zUBaiUDTIHgtocVN6Redp+RNOLcdDCpAxUacvY330A+HUJJ9HJ1aMkfcxHnFQU8
         eMMxWhK1QLpcF4Qda3tRbSOW+kjda352cNc0tg+s7YcnJPlWY0RMhReq5U2rmhkC66fV
         u3l1AfbCXLtWaNnZWu0NiKa1wZMujoyBhzjQwNF3K/uM2sv8Sv2L9EEjmF9lPc+tik8k
         x2X9b4OqCRX6C1wHXixyj7V8B8eVlK+f1L2MkHuuV4omX5gx5Y5gDq/cHvVUIB9SJgTQ
         QyHW1mgttNju6aCDV+DFuHMWw8OXq3X4E/H2Jcf9oPuJ09kky6O5LVHwkd3X5kknwJfr
         5JuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790454601; x=1791059401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LJ/PmwAD1gXfRgUIPquc0VEGnUEhKbmHbwXAzi7i4tY=;
        b=p5itAmO9px4mSz1Lf6XBVKF+tWk5jEiMgirp4C0qxBtAE4vJg1HSpzrOTILBWbXSNS
         G99U5WINZUKn5ZaE2WKc9FsOCnhf67ArKByJKYIvL4M1+KMb/1Gmo7go9TIsoXXnZ8Fk
         aPrMbQFOGKdX+XF4xaQaYE0alwd39u+qCOq4S+JUD78VLRHG1wRi7Jt458WuG++F5tub
         h1we3VOEP97+w4e+fcv4iomLlM/t9ONfODCAVleLmcJDREXBSTYWTcqRwGXvg9f0JCOh
         UcOb8AyUWoFrHNGAz6HrEDzCWTCD35p3pKVeS1kIHgNbNf/zn+gBv3D+PbbN2COcaYQq
         nIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790454601; x=1791059401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LJ/PmwAD1gXfRgUIPquc0VEGnUEhKbmHbwXAzi7i4tY=;
        b=1oTmftLv1YIMhHFieeETF4k2+6lg6cxqI1yinqv7vRwlI/8Nz5cFKssZsTTKnuB0Z1
         btVXZXw0HuCEPYsoLePFzGaFyUG+ps3zeTFTXyllPVePjIkjBOT2rujxLNdRGtec5O4B
         OvJpNwmFzs91Ob+OqPhm7C9xRmn58UTtwGS9kRYhGaF800iwMW1S+kvamELDIFyaHOH9
         3siVxG725q2x/F9mQ1w/CscFYVdbUCfRKWzQur5XjP2nK0nzA4LNS6PMq11MJ0AixI+M
         SLhjA09j5tpqwaO7MRSC1q4KUMqCawIPQ+nWOT+GV85ywWPTznhJtzfqd+PqfTiTpZwu
         j2rw==
X-Forwarded-Encrypted: i=1; AKwUvBxOfsSZqN9BjScToicdosifEFzOwwpCFTMTsKpJ3H69xzQ8v9LLqWdL92Vvaas06gaOpU7aAv0oVrfvChs=@vger.kernel.org
X-Gm-Message-State: AFuF++nOgWvGUwWLLstR8yxvjcz5Jt2J/aUDF++Fzg+SSuUJTPkvM2pn
	x50nTxI5OVSmeASqg6ow9crI4QIbsmTq6xI6Uqpsm4QxVSSRk/3wANVuUu9YPmMku+4oCVCYZ79
	bwL2A9gsQwhy671L/fbSTagz54FuZWBY=
X-Gm-Gg: AYBFou2j//3l0yP6ZnqZgbBMiH7UfB/sB3nev+MhXBmVOP8uyJ8rdWaWCyAKblwLVgs
	wEid5004E9U+mJ95lwrW9ec/zrmr/3qsDhmk7joRTGbnOUQ7zbrpuCjfzXBD00EHVbNuBFlVeA0
	50h2oDgrq7O3B/uGI72htL8xIqzpEJudvVehVhndqFYKGudytM6qon41wuyF//S/n6gq7a2TzFi
	J7fcinXpd44HTNyJACZKKqO4/Rhz/HrM9wUlmuOv2G18tBaWJ2QD9OGdv3NBuJ58OjbB1mmF+fA
	6MNs7krUY9W3Bq6HUwEdc5j9zJcUIx3j2jdcgPMV8zOWu3cF3wr+roPl/6egyYUevgszBtUs4Ru
	v0PGaZMN/79wT
X-Received: by 2002:a17:907:d789:b0:c29:609a:be6 with SMTP id
 a640c23a62f3a-c2ac2525b6emr763887166b.40.1790454601226; Sat, 26 Sep 2026
 13:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910080722.3961351-1-qinyuntan@linux.alibaba.com> <20260910080722.3961351-2-qinyuntan@linux.alibaba.com>
In-Reply-To: <20260910080722.3961351-2-qinyuntan@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 27 Sep 2026 04:29:24 +0800
X-Gm-Features: AclHuK_HLsSdldIrlBbtvCnGgQdp91BDp7hfEaJjYM4zx10m9_fHT-4QsHIpQGQ
Message-ID: <CAMgjq7DkLi7aPLRyGv__f6NLPkRHY=0Fw0kLEdevnoTFpqsbzw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm: memcontrol: drop kmemcg_id and use
 mem_cgroup_id() for list_lru indexing
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Usama Arif <usama.arif@linux.dev>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Xunlei Pang <xlpang@linux.alibaba.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 4:18=E2=80=AFPM Qinyun Tan <qinyuntan@linux.alibaba=
.com> wrote:
>
> kmemcg_id is a copy of the private memcg ID and serves no purpose
> other than indexing the per-memcg list_lru xarray.  It is assigned
> when kmem accounting goes online, which never happens with
> cgroup.memory=3Dnokmem, and the memcgs then all resolve to the
> per-node lists.  The next patch needs the index to work under nokmem
> as well.
>
> Index the lists with mem_cgroup_id().  The cgroup ID is unique per
> memcg and is only recycled once the cgroup is destroyed, long after
> offlining has erased the xarray entries, so a recycled ID cannot
> resurrect a stale entry.  The lookup now takes memcg pointers and
> routes root and NULL to the per-node lists itself.
>
> Also drop the nokmem early return from the offline path, so that the
> reparenting covers lrus that stay memcg aware without kmem
> accounting.  memcg_online_kmem() and memcg_offline_kmem() are each
> down to a single statement now; inline them into the css online and
> offline hooks, dropping the root check, as css_offline() is never
> called for the root and a memcg that failed css_online() cannot have
> list_lru entries.
>
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> ---
>  include/linux/memcontrol.h | 15 -------------
>  mm/list_lru.c              | 27 ++++++++++++------------
>  mm/memcontrol.c            | 43 +++++++-------------------------------
>  3 files changed, 22 insertions(+), 63 deletions(-)
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index fdf4812e1d818..821dc0e32603a 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -254,7 +254,6 @@ struct mem_cgroup {
>  #if BITS_PER_LONG < 64
>         seqlock_t               socket_pressure_seqlock;
>  #endif
> -       int kmemcg_id;
>
>  #ifdef CONFIG_CGROUP_WRITEBACK
>         struct list_head cgwb_list;
> @@ -1774,15 +1773,6 @@ static inline void memcg_kmem_uncharge_page(struct=
 page *page, int order)
>                 __memcg_kmem_uncharge_page(page, order);
>  }
>
> -/*
> - * A helper for accessing memcg's kmem_id, used for getting
> - * corresponding LRU lists.
> - */
> -static inline int memcg_kmem_id(struct mem_cgroup *memcg)
> -{
> -       return memcg ? memcg->kmemcg_id : -1;
> -}
> -
>  struct mem_cgroup *mem_cgroup_from_virt(void *p);
>
>  static inline void count_objcg_events(struct obj_cgroup *objcg,
> @@ -1850,11 +1840,6 @@ static inline bool memcg_kmem_online(void)
>         return false;
>  }
>
> -static inline int memcg_kmem_id(struct mem_cgroup *memcg)
> -{
> -       return -1;
> -}
> -
>  static inline struct mem_cgroup *mem_cgroup_from_virt(void *p)
>  {
>         return NULL;
> diff --git a/mm/list_lru.c b/mm/list_lru.c
> index a4522ca93ebcb..9241d17de4388 100644
> --- a/mm/list_lru.c
> +++ b/mm/list_lru.c
> @@ -72,10 +72,11 @@ static int lru_shrinker_id(struct list_lru *lru)
>  }
>
>  static inline struct list_lru_one *
> -list_lru_from_memcg_idx(struct list_lru *lru, int nid, int idx)
> +list_lru_from_memcg(struct list_lru *lru, int nid, struct mem_cgroup *me=
mcg)
>  {
> -       if (list_lru_memcg_aware(lru) && idx >=3D 0) {
> -               struct list_lru_memcg *mlru =3D xa_load(&lru->xa, idx);
> +       if (list_lru_memcg_aware(lru) && memcg && !mem_cgroup_is_root(mem=
cg)) {
> +               struct list_lru_memcg *mlru =3D
> +                       xa_load(&lru->xa, mem_cgroup_id(memcg));
>
>                 return mlru ? &mlru->node[nid] : NULL;
>         }
> @@ -91,7 +92,7 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid,
>
>         rcu_read_lock();
>  again:
> -       l =3D list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(*memcg));
> +       l =3D list_lru_from_memcg(lru, nid, *memcg);
>         if (likely(l)) {
>                 lock_list_lru(l, irq, irq_flags);
>                 if (likely(READ_ONCE(l->nr_items) !=3D LONG_MIN)) {
> @@ -132,7 +133,7 @@ static inline bool list_lru_memcg_aware(struct list_l=
ru *lru)
>  }
>
>  static inline struct list_lru_one *
> -list_lru_from_memcg_idx(struct list_lru *lru, int nid, int idx)
> +list_lru_from_memcg(struct list_lru *lru, int nid, struct mem_cgroup *me=
mcg)
>  {
>         return &lru->node[nid].lru;
>  }
> @@ -313,7 +314,7 @@ unsigned long list_lru_count_one(struct list_lru *lru=
,
>         long count;
>
>         rcu_read_lock();
> -       l =3D list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
> +       l =3D list_lru_from_memcg(lru, nid, memcg);
>         count =3D l ? READ_ONCE(l->nr_items) : 0;
>         rcu_read_unlock();
>
> @@ -502,11 +503,10 @@ static void memcg_reparent_list_lru_one(struct list=
_lru *lru, int nid,
>                                         struct list_lru_one *src,
>                                         struct mem_cgroup *dst_memcg)
>  {
> -       int dst_idx =3D dst_memcg->kmemcg_id;
>         struct list_lru_one *dst;
>
>         spin_lock_irq(&src->lock);
> -       dst =3D list_lru_from_memcg_idx(lru, nid, dst_idx);
> +       dst =3D list_lru_from_memcg(lru, nid, dst_memcg);
>         spin_lock_nested(&dst->lock, SINGLE_DEPTH_NESTING);
>
>         list_splice_init(&src->list, &dst->list);
> @@ -536,7 +536,7 @@ void memcg_reparent_list_lrus(struct mem_cgroup *memc=
g, struct mem_cgroup *paren
>                  * allocating a new mlru since CSS_DYING is already set f=
or this
>                  * memcg a rcu grace period ago.
>                  */
> -               mlru =3D xa_load(&lru->xa, memcg->kmemcg_id);
> +               mlru =3D xa_load(&lru->xa, mem_cgroup_id(memcg));
>                 if (!mlru)
>                         continue;
>
> @@ -551,7 +551,7 @@ void memcg_reparent_list_lrus(struct mem_cgroup *memc=
g, struct mem_cgroup *paren
>                 for_each_node(i)
>                         memcg_reparent_list_lru_one(lru, i, &mlru->node[i=
], parent);
>
> -               xa_erase_irq(&lru->xa, memcg->kmemcg_id);
> +               xa_erase_irq(&lru->xa, mem_cgroup_id(memcg));
>
>                 /*
>                  * Here all list_lrus corresponding to the cgroup are gua=
ranteed
> @@ -566,9 +566,10 @@ void memcg_reparent_list_lrus(struct mem_cgroup *mem=
cg, struct mem_cgroup *paren
>  static inline bool memcg_list_lru_allocated(struct mem_cgroup *memcg,
>                                             struct list_lru *lru)
>  {
> -       int idx =3D memcg->kmemcg_id;
> +       if (!memcg || mem_cgroup_is_root(memcg))
> +               return true;
>
> -       return idx < 0 || xa_load(&lru->xa, idx);
> +       return xa_load(&lru->xa, mem_cgroup_id(memcg));
>  }
>
>  static int __memcg_list_lru_alloc(struct mem_cgroup *memcg,
> @@ -602,7 +603,7 @@ static int __memcg_list_lru_alloc(struct mem_cgroup *=
memcg,
>                         if (!mlru)
>                                 return -ENOMEM;
>                 }
> -               xas_set(&xas, pos->kmemcg_id);
> +               xas_set(&xas, mem_cgroup_id(pos));
>                 do {
>                         xas_lock_irqsave(&xas, flags);
>                         if (!xas_load(&xas) && !css_is_dying(&pos->css)) =
{
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 7ce50bccf1264..aa010608fbff8 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -3771,33 +3771,6 @@ void folio_split_memcg_refs(struct folio *folio, u=
nsigned old_order,
>         obj_cgroup_get_many(folio_objcg(folio), new_refs);
>  }
>
> -static void memcg_online_kmem(struct mem_cgroup *memcg)
> -{
> -       if (mem_cgroup_kmem_disabled())
> -               return;
> -
> -       if (unlikely(mem_cgroup_is_root(memcg)))
> -               return;
> -
> -       static_branch_enable(&memcg_kmem_online_key);
> -
> -       memcg->kmemcg_id =3D memcg->id.id;
> -}
> -
> -static void memcg_offline_kmem(struct mem_cgroup *memcg)
> -{
> -       struct mem_cgroup *parent;
> -
> -       if (mem_cgroup_kmem_disabled())
> -               return;
> -
> -       if (unlikely(mem_cgroup_is_root(memcg)))
> -               return;
> -
> -       parent =3D parent_mem_cgroup(memcg);
> -       memcg_reparent_list_lrus(memcg, parent);
> -}
> -
>  #ifdef CONFIG_CGROUP_WRITEBACK
>
>  #include <trace/events/writeback.h>
> @@ -4225,7 +4198,6 @@ static struct mem_cgroup *mem_cgroup_alloc(struct m=
em_cgroup *parent)
>         seqlock_init(&memcg->socket_pressure_seqlock);
>  #endif
>         memcg1_memcg_init(memcg);
> -       memcg->kmemcg_id =3D -1;
>  #ifdef CONFIG_CGROUP_WRITEBACK
>         INIT_LIST_HEAD(&memcg->cgwb_list);
>         for (i =3D 0; i < MEMCG_CGWB_FRN_CNT; i++)
> @@ -4299,7 +4271,8 @@ static int mem_cgroup_css_online(struct cgroup_subs=
ys_state *css)
>         struct obj_cgroup *objcg;
>         int nid;
>
> -       memcg_online_kmem(memcg);
> +       if (!mem_cgroup_kmem_disabled() && likely(!mem_cgroup_is_root(mem=
cg)))
> +               static_branch_enable(&memcg_kmem_online_key);
>
>         /*
>          * A memcg must be visible for expand_shrinker_info()
> @@ -4307,7 +4280,7 @@ static int mem_cgroup_css_online(struct cgroup_subs=
ys_state *css)
>          * here, when mem_cgroup_iter() can't skip it.
>          */
>         if (alloc_shrinker_info(memcg))
> -               goto offline_kmem;
> +               goto reparent_lrus;
>
>         for_each_node(nid) {
>                 objcg =3D obj_cgroup_alloc();
> @@ -4364,8 +4337,8 @@ static int mem_cgroup_css_online(struct cgroup_subs=
ys_state *css)
>                 }
>         }
>         free_shrinker_info(memcg);
> -offline_kmem:
> -       memcg_offline_kmem(memcg);
> +reparent_lrus:
> +       memcg_reparent_list_lrus(memcg, parent_mem_cgroup(memcg));
>         mem_cgroup_private_id_remove(memcg);
>         return -ENOMEM;
>  }
> @@ -4381,11 +4354,11 @@ static void mem_cgroup_css_offline(struct cgroup_=
subsys_state *css)
>
>         zswap_memcg_offline_cleanup(memcg);
>
> -       memcg_offline_kmem(memcg);
> +       memcg_reparent_list_lrus(memcg, parent_mem_cgroup(memcg));
>         /*
>          * The reparenting of objcg must be after the reparenting of
> -        * the list_lru in memcg_offline_kmem(), which ensures that
> -        * they will not mistakenly get the parent list_lru.
> +        * the list_lru above, which ensures that they will not
> +        * mistakenly get the parent list_lru.
>          */
>         memcg_reparent_objcgs(memcg);
>         reparent_shrinker_deferred(memcg);
> --
> 2.43.7
>

Hi Qinyun

With this commit, my arm64 VM hangs at every boot with a
100%-reproducible infinite loop in xas_find(), driven by
the dcache shrinker during the first remount of the root filesystem.
Reverting this fixes the issue:

   CPU: 2 UID: 0 PID: 579 Comm: mount Not tainted
7.3.0-rc4.orig-00725-g09d9672a5d4f #33 PREEMPT(full)
   pc : xas_find+0x184/0x1c8
   lr : xas_find+0x6c/0x1c8
   Call trace:
    xas_find+0x184/0x1c8
    xa_find_after+0x88/0x120
    list_lru_walk_node+0xc0/0x2a0
    shrink_dcache_sb+0x80/0x130
    reconfigure_super+0xc0/0x1f8
    vfs_fsconfig_locked+0xa8/0x120
    __arm64_sys_fsconfig+0x280/0x33c

Just for reference, this also fixed it:

diff --git a/mm/list_lru.c b/mm/list_lru.c
index 7dbb6125cb1d..42c48c3b9235 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -427,13 +427,13 @@ unsigned long list_lru_walk_node(struct list_lru
*lru, int nid,
  unsigned long index;

  xa_for_each(&lru->xa, index, mlru) {
- rcu_read_lock();
- memcg =3D mem_cgroup_from_private_id(index);
- if (!memcg || !mem_cgroup_tryget(memcg)) {
- rcu_read_unlock();
+ memcg =3D mem_cgroup_get_from_id(index);
+ if (!memcg)
  continue;
- }
- rcu_read_unlock();
  isolated +=3D __list_lru_walk_one(lru, nid, memcg,
  isolate, cb_arg,
  nr_to_walk, false);

=3D=3D=3D

And BTW cgroup ID lookups seem much heavier, not sure about the
performance impact.

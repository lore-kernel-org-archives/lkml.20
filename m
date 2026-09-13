Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A977361977
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789299197; cv=none; b=Vty4U1KVSjP21AFZW7ZvVHecRahJTdrPxlxQWKpYulQpVnDA7TKw0hR4iC/yJQrxYijidWf8XgXa1Cc1aJVhaJeI97EuDFZpIbMu4l/uMHRWhhl5Wq7bxCI6UQfOTztjmUjtdu6UjmraCnk2KsyUWCqtNSwqkRoARiD94WpuYnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789299197; c=relaxed/simple;
	bh=tWlyPk3LJ5lfXMMVV9KlM3fJQCZFz891i3jWJGZkSgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQ0e9x0rJuvx+rNr+2a6bRfB5EPFvmJfhrIj7F9N92iSXvnqkosz5UT4NXad3iPjiGRWHg03748NkewT0/k8RkHUc6jhf15/ROdYb6bR9WQwK8LoP1pnxps3EpfyA6AJfW0TWOHVpniqxSFshzVqJfXDKdoxn+BeqP1WhcQ7RAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzDe1d+5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzDe1d+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7DD1F0089B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789299196;
	bh=OKNiS0G+VfR7DI/pz6s3DVVQAdEY8q1vPLowJQfTB1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hzDe1d+5XZTYIZ/9D7+J/ajrGMNOTEl6r2zmaCpAg8bKNfZYDSbToJMEmfT5U/OKQ
	 GUD9aAQdCpyl5RLdvQCu4Y2inuYvfPMoboEmzYnaH0DG7fljgmIuUp+It01GW3XLBE
	 2Bmnzu3b28xd+JH3/nXtNSukxZ18Bk+A7B8Z/hQ6RAY/FqMvHw5i2RQpmHCGgntTBH
	 23rGujW1OBIK7Yby+hdm2xZQgnF9U4GrMZY28UzioB1ATIi8tsBgS/bjYCaE50mSuN
	 M21iEI7ts1qSscCD6/YytdMrd8UUcxv7/VcC2fgj7DPT5E88QceLkweBPBRAIpozeH
	 +AIr/f7TjgKug==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939656ff6d9so140055285a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:33:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzunId1SEsfCNl/8ZpTxawSy6wlVG1H4a/emXcGhkIuui00opbQxnszZrDCILu2o+t1mtD1iRzihAKPHhs=@vger.kernel.org
X-Gm-Message-State: AFuF++kqf1WYGbXoigJSykz7S0lWYQjJYa3uEfI4+52yqprOl9BdQ5qN
	ocq8K4JMqooNuv39YmBFCJcMWgalK4qfWN/A4y33s8K75Z1ERvR9hdCIEh+eQeOF1MebJlFN3JU
	ushWHkNnK8vgDw79eqCeCiIPu40RUSZE=
X-Received: by 2002:a05:620a:7087:b0:939:6516:7128 with SMTP id
 af79cd13be357-93a0357e45dmr975245285a.3.1789299195111; Sun, 13 Sep 2026
 04:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913100013.3603815-1-ridong.chen@linux.dev>
In-Reply-To: <20260913100013.3603815-1-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Sun, 13 Sep 2026 19:33:03 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xEAS5Bacn8dUxDPoMKwD054zUsfUB3MSGYxGYwicPyWQ@mail.gmail.com>
X-Gm-Features: AcwNN1VjT3ePuFRlXNHX4QCzONR82HSxBT7DetfUPd5PYSqYB8und2MAFxb1FgM
Message-ID: <CAGsJ_4xEAS5Bacn8dUxDPoMKwD054zUsfUB3MSGYxGYwicPyWQ@mail.gmail.com>
Subject: Re: [PATCH v8] mm: vmscan: retry folios written back while isolated
 for traditional LRU
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"open list:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)" <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 6:00=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> As commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back
> while isolated") mentioned:
>
>   The page reclaim isolates a batch of folios from the tail of one of the
>   LRU lists and works on those folios one by one.  For a suitable
>   swap-backed folio, if the swap device is async, it queues that folio fo=
r
>   writeback.  After the page reclaim finishes an entire batch, it puts ba=
ck
>   the folios it queued for writeback to the head of the original LRU list=
.
>
>   In the meantime, the page writeback flushes the queued folios also by
>   batches.  Its batching logic is independent from that of the page
>   reclaim. For each of the folios it writes back, the page writeback call=
s
>   folio_rotate_reclaimable() which tries to rotate a folio to the tail.
>
>   folio_rotate_reclaimable() only works for a folio after the page reclai=
m
>   has put it back.  If an async swap device is fast enough, the page
>   writeback can finish with that folio while the page reclaim is still
>   working on the rest of the batch containing it.  In this case, that fol=
io
>   will remain at the head and the page reclaim will not retry it before
>   reaching there".
>
> The commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back
> while isolated") only fixed the issue for mglru. However, this issue
> also exists in the traditional active/inactive LRU and was found at [1].
>
> It can be reproduced with below steps:
>
> 1. Compile with CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> 2. Mount memcg v1, and create memcg named test_memcg and set
>    limit_in_bytes=3D1G, memsw.limit_in_bytes=3D2G.
> 3. Create a 1G swap file, and allocate 1.35G anon memory in test_memcg.
>
> It was found that:
>
>   cat memory.usage_in_bytes
>   1073700864
>   cat memory.memsw.usage_in_bytes
>   1413124096
>
>   free -h
>                 total        used        free
>   Mem:           1.6Gi       1.2Gi       299Mi
>   Swap:          1.0Gi       678Mi       346Mi
>
> As shown above, the test_memcg charged about 324M swap (memsw.usage minus
> usage), but almost 678M swap memory was used, which means that 350M+ may
> be wasted because other memcgs can not use these swap memory.
>
> This issue should be fixed in the same way as mglru. Therefore, the commo=
n
> logic was extracted to the 'find_folios_written_back' function firstly,
> which is then reused in the 'shrink_inactive_list' function. Finally,
> retry reclaiming those folios that may have missed the rotation for
> traditional LRU.
>
> After change, the same test case only wasted about 2M swap. The swap
> device usage matches what the memcg actually charged.
>
>   cat memory.usage_in_bytes
>   1070301184
>   cat memory.memsw.usage_in_bytes
>   1412448256
>
>   free -h
>                 total        used        free
>   Mem:           1.6Gi       1.2Gi       299Mi
>   Swap:          1.0Gi       327Mi       696Mi
>
> [1] https://lore.kernel.org/linux-kernel/20241010081802.290893-1-chenrido=
ng@huaweicloud.com/
> [2] https://lore.kernel.org/linux-kernel/CAGsJ_4zqL8ZHNRZ44o_CC69kE7DBVXv=
bZfvmQxMGiFqRxqHQdA@mail.gmail.com/
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
> v8: Rebase to the -next tree, adapt to the current reclaim API, and retes=
t.
>
> [v7]: https://lore.kernel.org/linux-mm/20250111091504.1363075-1-chenridon=
g@huaweicloud.com/
>
>  mm/vmscan.c | 104 ++++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 73 insertions(+), 31 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index d1495a7d469d..6e13e570aab8 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -181,6 +181,10 @@ struct scan_control {
>         struct reclaim_state reclaim_state;
>  };
>
> +static void find_folios_written_back(struct list_head *list,
> +                                    struct list_head *clean, struct lruv=
ec *lruvec,
> +                                    int type, bool skip_retry);
> +
>  #ifdef ARCH_HAS_PREFETCHW
>  static inline void prefetchw_prev_lru_folio(struct folio *folio,
>                 struct list_head *base)
> @@ -2013,14 +2017,16 @@ static unsigned long shrink_inactive_list(unsigne=
d long nr_to_scan,
>                 enum lru_list lru)
>  {
>         LIST_HEAD(folio_list);
> +       LIST_HEAD(clean_list);
>         unsigned long nr_scanned;
> -       unsigned int nr_reclaimed =3D 0;
> -       unsigned long nr_taken;
> +       unsigned int nr_reclaimed, total_reclaimed =3D 0;
> +       unsigned long nr_taken, isolated;
>         struct reclaim_stat stat;
>         bool file =3D is_file_lru(lru);
>         enum node_stat_item item;
>         struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
>         bool stalled =3D false;
> +       bool skip_retry =3D false;
>
>         while (unlikely(too_many_isolated(pgdat, file, sc))) {
>                 if (stalled)
> @@ -2052,25 +2058,42 @@ static unsigned long shrink_inactive_list(unsigne=
d long nr_to_scan,
>         if (nr_taken =3D=3D 0)
>                 return 0;
>
> +       isolated =3D nr_taken;
> +retry:
>         nr_reclaimed =3D shrink_folio_list(&folio_list, pgdat, sc, &stat,=
 false,
>                                          lruvec_memcg(lruvec));
> +       total_reclaimed +=3D nr_reclaimed;
> +
> +       /* Retry pass is only meant for clean folios without new isolatio=
n */
> +       if (isolated)
> +               handle_reclaim_writeback(isolated, pgdat, sc, &stat);
> +       trace_mm_vmscan_lru_shrink_inactive(pgdat->node_id,
> +                       nr_scanned, nr_reclaimed, &stat, sc->priority, fi=
le);
> +
> +       find_folios_written_back(&folio_list, &clean_list, lruvec, file, =
skip_retry);
>
>         move_folios_to_lru(&folio_list);
>
>         mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
>                                         stat.nr_demoted);
> -       mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, -nr_taken);
>         item =3D PGSTEAL_KSWAPD + reclaimer_offset(sc);
>         mod_lruvec_state(lruvec, item, nr_reclaimed);
>         mod_lruvec_state(lruvec, PGSTEAL_ANON + file, nr_reclaimed);
> -       if (nr_scanned > nr_reclaimed)
> +
> +       if (!list_empty(&clean_list)) {
> +               list_splice_init(&clean_list, &folio_list);
> +               skip_retry =3D true;
> +               /* Retry folios were already isolated and accounted above=
 */
> +               isolated =3D 0;
> +               goto retry;
> +       }
> +
> +       mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, -nr_taken);
> +       if (nr_scanned > total_reclaimed)
>                 mod_lruvec_state(lruvec, PGROTATE_ANON + file,
> -                                nr_scanned - nr_reclaimed);
> +                                nr_scanned - total_reclaimed);
>
> -       handle_reclaim_writeback(nr_taken, pgdat, sc, &stat);
> -       trace_mm_vmscan_lru_shrink_inactive(pgdat->node_id,
> -                       nr_scanned, nr_reclaimed, &stat, sc->priority, fi=
le);
> -       return nr_reclaimed;

this is a bit weird to move the tracepoint, shouldn't it just trace the tot=
al
number of twice reclamation?

> +       return total_reclaimed;
>  }
>
>  /*
> @@ -5006,8 +5029,6 @@ static int evict_folios(unsigned long nr_to_scan, s=
truct lruvec *lruvec,
>  {
>         LIST_HEAD(list);
>         LIST_HEAD(clean);
> -       struct folio *folio;
> -       struct folio *next;
>         enum node_stat_item item;
>         struct reclaim_stat stat;
>         struct lru_gen_mm_walk *walk;
> @@ -5046,26 +5067,7 @@ static int evict_folios(unsigned long nr_to_scan, =
struct lruvec *lruvec,
>                         type_scanned, reclaimed, &stat, sc->priority,
>                         type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON);
>
> -       list_for_each_entry_safe_reverse(folio, next, &list, lru) {
> -               DEFINE_MIN_SEQ(lruvec);
> -
> -               /* move_folios_to_lru() culls unevictable folios via foli=
o_putback_lru() */
> -               if (!folio_evictable(folio))
> -                       continue;
> -
> -               /* retry folios that may have missed folio_rotate_reclaim=
able() */
> -               if (!skip_retry && !folio_test_active(folio) && !folio_ma=
pped(folio) &&
> -                   !folio_test_dirty(folio) && !folio_test_writeback(fol=
io)) {
> -                       list_move(&folio->lru, &clean);
> -                       continue;
> -               }
> -
> -               /* don't add rejected folios to the oldest generation */
> -               if (lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type]) {
> -                       folio_set_lru_refs(folio, 0);
> -                       folio_set_active(folio);
> -               }

Baolin has a patch which modifies this.
so probably you are not based on the mm-new?

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=3D51=
9f7768585e372b97e568baf9d4648e6beb6863

> -       }
> +       find_folios_written_back(&list, &clean, lruvec, type, skip_retry)=
;
>
>         move_folios_to_lru(&list);
>
> @@ -6108,6 +6110,46 @@ static void lru_gen_shrink_node(struct pglist_data=
 *pgdat, struct scan_control *
>
>  #endif /* CONFIG_LRU_GEN */
>
> +/**
> + * find_folios_written_back - Find and move the written back folios to a=
 new list.
> + * @list: folios list
> + * @clean: the written back folios list
> + * @lruvec: the lruvec
> + * @type: LRU type (only used for CONFIG_LRU_GEN)
> + * @skip_retry: whether skip retry.
> + */
> +static void find_folios_written_back(struct list_head *list,
> +                                    struct list_head *clean, struct lruv=
ec *lruvec,
> +                                    int type, bool skip_retry)
> +{
> +       struct folio *folio;
> +       struct folio *next;
> +
> +       list_for_each_entry_safe_reverse(folio, next, list, lru) {
> +#ifdef CONFIG_LRU_GEN
> +               DEFINE_MIN_SEQ(lruvec);
> +#endif
> +               /* move_folios_to_lru() culls unevictable folios via foli=
o_putback_lru() */
> +               if (!folio_evictable(folio))
> +                       continue;
> +
> +               /* retry folios that may have missed folio_rotate_reclaim=
able() */
> +               if (!skip_retry && !folio_test_active(folio) && !folio_ma=
pped(folio) &&
> +                   !folio_test_dirty(folio) && !folio_test_writeback(fol=
io)) {
> +                       list_move(&folio->lru, clean);
> +                       continue;
> +               }
> +#ifdef CONFIG_LRU_GEN
> +               /* don't add rejected folios to the oldest generation */
> +               if (lruvec->lrugen.enabled &&
> +                   lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type]) {
> +                       folio_set_lru_refs(folio, 0);
> +                       folio_set_active(folio);
> +               }

as above. please take a look at Baolin's patch:
https://lore.kernel.org/9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714=
.git.baolin.wang@linux.alibaba.com


Best Regards
Barry

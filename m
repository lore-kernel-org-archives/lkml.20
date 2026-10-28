Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793160884;
	b=EZzJgdk2sCVagrh5M8hD4rwnMRb8m8qPKOboGQoR3POhGqEVEwQS3O/YG3McfR9BjAJo
	 7pQA4RxgDhL8A2DsxArLpkE1kmSkQ3vagVY3gdomdJqS0wqcmjZ08f2eLzLI/7o2KsWcB
	 uZ5wBO0nNUSTHRuKf9VXaW29VUfkJ2sRZuny6ZSd1RBpxYhlC1gk+18l/U+COD3aTfSsq
	 vgWQvt4HBJ0AxjLSofl6+A3a5o8v7bIj5zq0yLYIZql15cHmo8d9JbpYUxV+OMCpgw5fn
	 02AMWPz/ODlSwHF4N8q4v5asAgNknNEDOyPQuG3aIerjSCJDU5ZtwLSD36EZpKb64nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xy0VWwyzp+vpTOIBzIkzfVFw9LGMzZjvLAPkrrf1Zcs=;
	b=kvWivmy7ZJk5qd3dsnEDBKyxguHQBb1lfcF/CrNkED5aNYJkUD3NjzZURz6xEsm2P50b
	 76nhxRSZl582s+0LPjk5dhGUhEMgeDEe4sCShslc6A9DLRd0ivsatMV2/v8NsAYhku9jx
	 oNvZfwYuJOnYbs1NX8YwyPFTwwS9JXzy1fBWfErwrpvaf2eX1vYoVRjMzJ0F3BkPVAWr5
	 W7mz/GTN81BI1MIGt1hi7ehQU4VIWRZGiGlararG8I3LQwTBPXnBR7pzIlMIW6Ktc50W8
	 ZzZ59TAv7lPzgJJ86OxdRicdBwz5Ahk9zTOZHs/iDRJoZH6jOuZIsjfRF+DgaYPmJuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRXegTV0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRXegTV0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso5089375e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793160882; cv=none;
        d=google.com; s=arc-20260327;
        b=EWjVveQlcGfHlHpwj4VIFs2MBC6jlZNrmyHAUgaw0t1ORlgDhK2IWv5qPoz31OwmWZ
         EINcz4jb+TjPtdaeYu9+2ItJEZmCFiq9eNqJh02LVDaNPdFv1m/Eg5suUflUtwpnOa1T
         GUYhCUNJY5rhmnUKV49TRFKPmXptozJbFdUs0yjVTfoP3HMNHhcwtBjbsnJfQsKK/ADL
         hztTn0k2Oa8FoAOFifECZru3pU+2K0vdpA7567xrRp3ygCTfsuzLDGICnmQgiafI2CBq
         D/yt/SuTr3zgIZ19J8o5kG82hresjJZ07beYVvyxkgtSqw1Q25gum1J4mujs54W3ZOIu
         xLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy0VWwyzp+vpTOIBzIkzfVFw9LGMzZjvLAPkrrf1Zcs=;
        fh=ya6zkmSG0H/9yy5aP4VkfcbtTt6cfptwPrvEYeFXeVQ=;
        b=sT+ES9jlMIgiws5gyBchRkJZPTNQirGoGgkwXg+AcWyV7yR+8TPeQQVAiN152Z4p6H
         Zzs6Pla69O9WIxLpu3+DU/4IfqJMlKPuNPOY8lW0zBw1i1wtfZYTRwO2c6g4G5UegF7x
         XjCiXmflPa1cGzDhuBd4RVe+xKR2QnUFfSIIHXc5SKmnRI6lCHrC1Ty0nZX6HYFrUdiT
         6fY+/WzBwm0tdr0pERVquMPT1c0+BwwVkbNXe7nQviEWcA+AlOLo5w5mZ0F/UWPcZdlq
         K7z9Jn/2N4TAo4NFf0XErZ7XtWHFfLTebMJS6bpSyNn702O2gcxR2nP1RHPe2LEE5F7p
         VYVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793160882; x=1793765682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xy0VWwyzp+vpTOIBzIkzfVFw9LGMzZjvLAPkrrf1Zcs=;
        b=DRXegTV0SXzH+SnC7QulPgxAHPlw+borHMH790uJ/sxxqQA2woqcNJ18yu+GgTMPpm
         86v/mGAO3a8K6jMjg0R0gGfK4wDlskYvuDQn1LKp1Wi7mXg5k96WgPF2c1X1V5Gi/+IS
         4ycqUr1qSExlML8CsNaMmZKbKBGdfGAoJy+I7PAM1xMUeEa1jExzQoT6EeLQleO7sJd2
         2yY0xj15ukMdBEqsDuZ8a4pymKFiE1+4WmFnDHlIuL/It4X1gyhizosD6C025e13YOP6
         CWq2JWDeWJ8oxze7ZGyt95fN7gmTj/u/SDRmyOAOkma9oHlKjhLmMFbGBJNPQO2p5418
         wztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793160882; x=1793765682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xy0VWwyzp+vpTOIBzIkzfVFw9LGMzZjvLAPkrrf1Zcs=;
        b=Q4mwkTtHFe7BrqXFwaW9FFQ5rvXo2etKBbKQiy9GtJnW0u/od7Mawt0doMZ3Im4lb1
         nJdalXD4LFKzACnL1TuaxMdT9z0jHr8pZ4I8R2KQwUx4CiQ6xVJmZdYPhbTaSNGB0qOK
         cfdy6GufK9b7v1mng9bgvu16UAQx9gnEnNIGZE+FZRlffq7QjchxHh7rOVxpSC/Azz/I
         MCISHDUVoavxsWnNhYy9B5FTLSz8NCRl/5bi22QdQMycbDOcAWKEt8hviuySzjsEfcF9
         nauJG+3BCP59pjZdIDe2pjAeQ3qgDECUnPiGrfh91a31YzUuicHfMj8wJg3Tnb/7xzC4
         Tqug==
X-Forwarded-Encrypted: i=1; AKwUvByEbWurulIJOXg3XtM7PL0VK3F+jlr3wsMQ9yqL82XBA3vNKkouWpHEk0a5Kghmao3o4ejrhltFmnbXiek=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUct1Xq7pgcMvcr4LK1t0K/g9qeT7+ba4QVg1yiI7KDXJCYJq+
	RKfWX2FvV9UuyC3cgju4u/Z9RZPHoqL1NOm5jrSGGXX52dg7oct3g7aTb3KnOakjM7kbPkS8Yfl
	geuDJYBFvj1ePGEpN/gVKpgb+JZo8tUU=
X-Gm-Gg: AYBFou3jIKaI4iSYu2vybCwu1UEX/J0Y0bqBxdSZvHxD/2QMBwWajnzCkCUXbRAJf8D
	c8oWWx5VZqmdXv+l5JSGmhJa0kaycV6HqYUSFOa62VF/Wy55aP5wMDVmRB6ncRtjTqpt6jRtQxu
	O6hNS3YNFWAYPRaj6BP1HOZWnsP5A5FMnFP3goU20A56KlQHS4WzKXyR72qwDVLmBTerGG5uQDH
	UTJDqdfnU+6lsF3570P6tShN78BWaMHMV3zR1D4UIBbBiTmWvso0pbRGUbC5a2UDa+nYQ/gvg36
	Fw30qHNZc/ExAEqIeC+S93XUQnp67C0EpbCSCRXAyBqB6lwGwEYAllAKa38jqi0fzhT6IGjRBfp
	AwKzNOFoA4wkeR4ehKRxLX0QUm/u2J/73SBxALH6b3pyQ/aoPeakJPIGtGJbUWgWT77IZ
X-Received: by 2002:a05:600c:811b:b0:4a1:f625:2108 with SMTP id
 5b1f17b1804b1-4a967e8c045mr18383165e9.33.1793160881597; Tue, 27 Oct 2026
 21:14:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-5-baohua@kernel.org>
In-Reply-To: <20261022220203.91911-5-baohua@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 28 Oct 2026 12:14:28 +0800
X-Gm-Features: AclHuK_O568tS_hpoQdHxuabg70CVmUWc9FvgfE5clXj_iASH0laiWXtqK5hoVU
Message-ID: <CAN_Opa-5jikDWQs_adgZ6UHLv-FVNKwpKpOZJU5F7zhWQ-FeXw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 04/14] mm/mglru: lift the forced protection of reclaimer
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, hui.zhu@linux.dev, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, david@kernel.org, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, ljs@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, ryncsn@gmail.com, 
	shakeel.butt@linux.dev, weixugc@google.com, yuanchu@google.com, 
	zhuhui@kylinos.cn, baoquan.he@linux.dev, liuxiang.277@bytedance.com, 
	wangzicheng@honor.com, lianux.mm@gmail.com, kasong@tencent.com, 
	liam@infradead.org, surenb@google.com, mhocko@suse.com, rppt@kernel.org, 
	zhangbo56@xiaomi.com, lyugaofei@xiaomi.com, ridong.chen@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 6:02=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> When a type is drained down to MIN_NR_GENS gens, the reclaimer will
> fail to make any progress on that type without aging.
>
> However aging comes with a cost, and it will take time to finish. Even
> if we do aging more proactively, when under great pressure, gens will
> still be drained very fast so the new gens produced by aging can't catch
> up with the consumption. With MIN_NR_GENS setting blocking the reclaim,
> we will run into OOM. This OOM can be reproduced by the previous test
> program [1] used for fixing another aging problem [2]. When running in
> great pressure, certain workloads will keep seeing premature OOM with
> MGLRU, and never see any OOM with classical LRU.
>
> This might get worse if we implement async aging, or avoid hotness
> inversion in aging, as they will slow down the aging process even more.
>
> To fix this, let's first drop the get_nr_gens() =3D=3D MIN_NR_GENS early
> return and let the raised-priority scan bound cover max_seq itself.
>
> Mapped folios will still survive as the rmap PTE check will keep them.
> Unmapped cache folios may thrashing more when under great pressure,
> which is really a problem that should be fixed with refault distance
> and frequecy aware promotoin instead [3].
>
> Link: https://github.com/ryncsn/emm-test-project/tree/master/file-anon-mi=
x-pressure [1]
> Link: https://lore.kernel.org/linux-mm/20260428-mglru-reclaim-v7-0-02fabb=
92dc43@tencent.com/ [2]
> Link: https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-0-913619b014d=
9@tencent.com/ [3]
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index d7eb15533de1..2cccaa5dd4e7 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4834,7 +4834,7 @@ void lru_gen_reparent_memcg(struct mem_cgroup *memc=
g, struct mem_cgroup *parent,
>   ***********************************************************************=
*******/
>
>  static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struc=
t scan_control *sc,
> -                      int min_gen, int tier_idx)
> +                      int min_gen, int max_gen, int tier_idx)
>  {
>         int gen =3D folio_lru_gen(folio);
>         int type =3D folio_is_file_lru(folio);
> @@ -4851,12 +4851,22 @@ static bool sort_folio(struct lruvec *lruvec, str=
uct folio *folio, struct scan_c
>         if (!folio_evictable(folio))
>                 return false;
>
> -       /* promoted */
> +       /* promoted, or moved due to reparenting. */
>         if (gen !=3D min_gen) {
>                 list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
>                 return true;
>         }
>
> +       /*
> +        * We are reclaiming the last gen left. Folios in this gen can no
> +        * longer be promoted or protected, so just isolate them. The one
> +        * exception is lru_gen_reparent_memcg(), which is handled above.
> +        */
> +       if (min_gen =3D=3D max_gen) {
> +               VM_WARN_ON_ONCE(zone > sc->reclaim_idx);
> +               return false;
> +       }
> +
>         /* protected */
>         if (tier > tier_idx || refs + workingset =3D=3D BIT(LRU_REFS_WIDT=
H) + 1) {
>                 gen =3D folio_inc_gen(lruvec, folio, min_gen);
> @@ -4911,15 +4921,16 @@ static int scan_folios(unsigned long nr_to_scan, =
struct lruvec *lruvec,
>                        struct list_head *list, int *isolatedp)
>  {
>         int i;
> -       int gen;
>         enum node_stat_item item;
>         int sorted =3D 0;
>         int scanned =3D 0;
>         int isolated =3D 0;
>         int skipped =3D 0;
> +       int gen, max_gen;
>         unsigned long min_seq;
>         unsigned long remaining =3D nr_to_scan;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> +       DEFINE_MAX_SEQ(lruvec);
>
>         VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
>         VM_WARN_ON_ONCE(!list_empty(list));
> @@ -4932,18 +4943,24 @@ static int scan_folios(unsigned long nr_to_scan, =
struct lruvec *lruvec,
>         if (sc->priority =3D=3D DEF_PRIORITY)
>                 min_seq =3D lrugen->min_seq[type];
>         else
> -               min_seq =3D lruvec_populated_min_seq(lruvec, type, lrugen=
->max_seq - MIN_NR_GENS + 1);
> -
> -       if (get_nr_gens(lruvec, type) =3D=3D MIN_NR_GENS)
> -               return 0;
> +               min_seq =3D lruvec_populated_min_seq(lruvec, type, lrugen=
->max_seq);
>
>         gen =3D lru_gen_from_seq(min_seq);
> +       max_gen =3D lru_gen_from_seq(max_seq);
> +
>         for (i =3D MAX_NR_ZONES; i > 0; i--) {
>                 LIST_HEAD(moved);
>                 int skipped_zone =3D 0;
>                 int zone =3D (sc->reclaim_idx + i) % MAX_NR_ZONES;
>                 struct list_head *head =3D &lrugen->folios[gen][type][zon=
e];
>
> +               /*
> +                * If there is only one gen left, rotating the unreclaima=
ble
> +                * zone become meaningless, just skip them.
> +                */
> +               if (gen =3D=3D max_gen && zone > sc->reclaim_idx)
> +                       continue;
> +
>                 while (!list_empty(head)) {
>                         struct folio *folio =3D lru_to_folio(head);
>                         int delta =3D folio_nr_pages(folio);
> @@ -4954,8 +4971,7 @@ static int scan_folios(unsigned long nr_to_scan, st=
ruct lruvec *lruvec,
>                         VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) !=3D z=
one, folio);
>
>                         scanned +=3D delta;
> -
> -                       if (sort_folio(lruvec, folio, sc, gen, tier))
> +                       if (sort_folio(lruvec, folio, sc, gen, max_gen, t=
ier))
>                                 sorted +=3D delta;
>                         else if (isolate_folio(lruvec, folio, sc)) {
>                                 list_add(&folio->lru, list);
> --
> 2.34.1
>

Removing the MIN_NR_GENS early return allows reclaim to make progress
when only one generation remains. Bypassing promotion and protection
in that case lets reclaim attempt to isolate those folios, while
scan_folios() skips zones outside reclaim_idx.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

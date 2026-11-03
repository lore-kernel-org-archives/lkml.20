Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699725;
	b=1twvFoIz16USVIxMGdGcfQm1Iut2Vj1MDWCO9aQDmWIVC360B2Bz0u40cm9L2kW1j1mA
	 9oX3d9MACb28ifSeoG+ClpUYsMmrU3silB7EyBhiQKI9O4lnk9OV3K4luzzdsmgtJVpOB
	 JQkCbvd9niohzly53QtzTHCPZ2BFP8C0WDMKcBRjq+vwNfMUQpdR/gLoAhPa9EcFgmDdr
	 X/REAk0vd2ogAe+jvY32SOLASOBhNsxFLwhbbDarAL0o/Tz8rUtBxC8Y8Pta7gARD6O3a
	 meMe6Aq+6JBN2tkA6Ey5Skp6LwanfzCFVwKuYv5l/OWXf7kqAVoTX3ewQQvk+Uo2Hjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aKxZ1A1j5PkyV/iA+/kwIGbenh4oNStIZE9tQOwmG6E=;
	b=PsvdC9+uhE0y+Ui6e7WjrlH2A6dbxixi5THtMKQTSpdSo4fwemY9/G9/SFgIF2+BMdp5
	 iADu5TzesgrJ3siNG27dbNhz8wJwBUqMPye+fmRmsCdzqf8Wjq/l+kc+LvOwuloHiN+Jo
	 +SZ+mYMpGFl9BYUhW1gBCfShJrCAYhjMNcpIZULFLPBTjiyFXaXKZFFOLe5FDXU1986nu
	 chaKOWhA8P+bVz7NSYpNuxa1WqPqftT28fwBn0j2jQYtJ9LORy4/A0QuCChOm1W6enYlD
	 ByFhvP5T/mh9Ya4CoVMX80bNHL9fG5MWyrs3VvLXLqkSq4KGYaxdwEM3hF5UMVoWm5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xT7+TBaN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33593606EEBD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33593606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xT7+TBaN
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so31701555e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:55:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699723; cv=none;
        d=google.com; s=arc-20260327;
        b=IxNFtF4N9C/0Hx9RFGORO50uMFbacXNQCF+/1EXQoH63UTptvkKdAA/qwuiIwL95Ib
         vR0JyPM/bR0n1xs+9x0bvkqf9m0r7TRBDe6e6K8x/0UM1ygaAjzN9T8JZZ9G8xz+f2P+
         BbEhpyDSQYuIj3Q7vDXBUSAZ8Xy+tjeeVbphtwUOuG3+Uu9HG0p23TJ6qQ6AtWAYrmDw
         IxvtjTAhqKXYpiky5fMceKjlbxY2an5hk+gdAVPuRjeBDe0f4mHgWCLYkKjDVay+s7AQ
         2fCEhUnhIi3LedBuUKrCitL7uDOPpkqW6C8W/99mPCacSpxPkrPGUvKzqp0hrNaSRqQT
         x3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKxZ1A1j5PkyV/iA+/kwIGbenh4oNStIZE9tQOwmG6E=;
        fh=BI/mybnHQVZzNbFpgIFM0waNSUf2YjP06lnGpg2jYxM=;
        b=n/xF9r3wHuccTNttcpp4a8pZFlXaep6edD3KJG0Fqh1scoii92sXXT0U3NKcDDbXHy
         ad8rWwrL0437vu+5G1EwEUh6WyOzKJRZKcsctOuwVyCm0sbOwWLAD9Ydmxt+3To2kWkR
         5xrsmlc4HrZjsuFphps8yFMrQwWiUd/sP46EUvcn1/eVYTuAbTKvf2GBUBdsZw8hEckf
         5sl5t8c7dwhrIuxfIM6H4x9n25V3EdUf4GDTXOlK6PL1ZgynH/n9blidH/pRzHG4Fswm
         4XeYBCUltXeCTLPxyRA6xwAOm7ltSRkB8MLs0tJz63OLX4j7k6R6vmmR53xlOF+/kJd1
         XYCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699723; x=1794304523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKxZ1A1j5PkyV/iA+/kwIGbenh4oNStIZE9tQOwmG6E=;
        b=xT7+TBaN4AMJwEPwcHeUB6Lu7pspYfL9uAZjo+cSXeLbRtgSnCyjosJ3o48ISBMn9a
         GtLYUQx9HQZX12C8OxNeHg2EoiPKJd/njJUYW93HwAv3WEvPpajTp/lVZkHocIBG7IDb
         sPkKOQiDl+AWGXUQ333djDqfHGkgimjoCSy9t1gbUuTQgIKoArBqMg/sqJbEyEJ4mlps
         GkGDXJ8l8Ta2ccJfRDAOoEU8Taa5ab+jFo0qsnMcMFTcryedjg4b9jlHDcn00toHoJge
         RfZ1+vKy1DVIffw9zt1iGUMk1KyC2tWzYbVury4ApDITFd+loSL8SfDLv928LHRDHhPZ
         K0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699723; x=1794304523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKxZ1A1j5PkyV/iA+/kwIGbenh4oNStIZE9tQOwmG6E=;
        b=ZYhJC4pe03PwG9cXXCMS9IfNPBkD/SxSjaMwliENuBRKZhYZNVqaNydyuzAYi6BW5l
         feX/jXu8oCePpmlLnrr6SwDAIimDTiN+rSsEx7xB0/GPyNVf0+SM1JwtdRVTGmwKlSOh
         +ywWBX8RmJSP+jm7nXOR0bs5Dc9v+ksmwSeeJpgUDs34TFT8JNaoXda0fq/lCHryJ/Rx
         YYXV9dDlZLdHCaBQ28KQMCeuWGROqOv+N0JF5PGsnkLIS+XegQXeNXIakG07zTrBhUw9
         rI0vMTlwrWEeXSKnNufzgsYaJD98cCZ4MDQr61nC+7NXxZD7a0SvlEQRoFLae0IYCOxH
         id4g==
X-Forwarded-Encrypted: i=1; AKwUvBwfkCfQzeWgEbC8OTI2cWRoRPhtj5Oasd9cJW+9+CQUxlo7fxgO8LBaJoaldT6kBeiW0Fl51L1uOqFHMIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WmvTnIRyilU0h8Oh+6dG6BVlCdzXUuSUxp9dkR686MlXzNCcF
	vU0wDhJEP4h+allL9nI3jbOkyShOs5/wF+kERyDsSGdfF3LCNVO/DYgUPQqbhISv3RbFPa5GWX2
	Lx23KRgdwBXpqTUaBRCLkvtvIgTEgscY=
X-Gm-Gg: AYBFou2lfiDXfJox7TL5qOQAfVLHC0yht5n5v+fMp0p72N+KpQ08Mtp6SZL1li72Eh7
	qcw9q8GEJ2VhXGnO7vmxXFsDKuclb91f5ULwIgoLP74ycRRvMpFk0OBWyp3/DveoOa8vNVNDLaf
	yKeCoVJrcgX574uKI30QPClcqExzw2H1AFoW7z4pwG9xLuisJ/mTtxMNSM3I1NWQg0ZpwLBXBuA
	x2QeN/48VjjofnlZqgPIKeXHUxyyUT5FZk8oGdLiVBJ9zoL/r3Jr6vYEutRc10UhJJUSpnlLh3n
	s2P1eLdetAWTCjnZKfSI4oOiwGwVDl6xUHxg+N6XiF4x87Ak9EwCPNnndv6CD2t5BTvjz5aXtKq
	kHKtSVhMqPJZMlokvfwGu8CeULIl5k6hG0iV3CpExU8AjzkjtSK/9wnIz9soltWAybXlvsFQ=
X-Received: by 2002:a05:600c:1d23:b0:4a2:167a:c946 with SMTP id
 5b1f17b1804b1-4ac185bccfbmr287062505e9.13.1793699723045; Tue, 03 Nov 2026
 01:55:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-10-baohua@kernel.org>
In-Reply-To: <20261022220203.91911-10-baohua@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 3 Nov 2026 17:55:11 +0800
X-Gm-Features: AclHuK_nvUMoVLkjwOljmlj7612c9xcGHLHJRZ07_eMI0YGDtIC6c9eYytDVpYo
Message-ID: <CAN_Opa_NKPsZkyHAinuFYcXpH26V7JDQ9K_WvoOK4n6Nf3noEA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 09/14] mm/mglru: Avoid placing rejected folios
 below populated gen
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

On Fri, Oct 23, 2026 at 6:03=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> We used to scan only the oldest generation in scan_folios(). In
> evict_folios(), we checked whether
> lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_seq[type]. If so, the
> folio was marked active and moved to younger generations.
>
> This was itself buggy, as folios in generation min_seq[type] - 1
> would not be marked active by folio_set_active(), potentially causing
> a cold/hot inversion.
>
> Besides this issue, the old approach also differs from the current
> behavior, where we can scan fewer than two generations.
> Now that we can scan younger generations, including the youngest
> generation, this no longer prevents rejected folios from being placed
> in a generation below or at the populated generation. Such rejected
> folios would then be scanned again and again, resulting in extremely
> low `pg_steal/pg_scan` ratios. For example:
>   pgsteal_file: 2312605
>   pgscan_file:  36465693
>   reclamation efficiency: 6.34%
>
> We pass `scanned_seq` to `move_folios_to_lru()` and make sure we either
> promote the folio or place it in the youngest generation when the
> populated generation is already the youngest one.
> Also, folio_set_active() is no longer needed.
>
> With this change, the results become:
>   pgsteal_file: 2683815
>   pgscan_file:  4224244
>   reclamation efficiency: 63.53%
>
> The sys time for building the kernel also decreased from 4m30.532s to
> 3m50.188s while swappiness=3D=3D1.
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  include/linux/mm_inline.h | 22 +++++++++++++++++++++-
>  mm/vmscan.c               | 24 ++++++++++++------------
>  2 files changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index ab69b9930893..f6f4bc9a704f 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -332,7 +332,8 @@ static inline unsigned long lru_gen_folio_seq(const s=
truct lruvec *lruvec,
>         return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen=
->min_seq[type]));
>  }
>
> -static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio=
 *folio, bool reclaiming)
> +static inline bool __lru_gen_add_folio(struct lruvec *lruvec, struct fol=
io *folio,
> +               unsigned long scanned_seq, bool reclaiming)
>  {
>         unsigned long seq;
>         unsigned long flags;
> @@ -347,6 +348,8 @@ static inline bool lru_gen_add_folio(struct lruvec *l=
ruvec, struct folio *folio,
>                 return false;
>
>         seq =3D lru_gen_folio_seq(lruvec, folio, reclaiming);
> +       if (scanned_seq !=3D -1UL)
> +               seq =3D max(seq, min(scanned_seq + 1, lrugen->max_seq));
>         gen =3D lru_gen_from_seq(seq);
>         flags =3D (gen + 1UL) << LRU_GEN_PGOFF;
>         /* see the comment on MIN_NR_GENS about PG_active */
> @@ -362,6 +365,17 @@ static inline bool lru_gen_add_folio(struct lruvec *=
lruvec, struct folio *folio,
>         return true;
>  }
>
> +static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio=
 *folio, bool reclaiming)
> +{
> +       return __lru_gen_add_folio(lruvec, folio, -1UL, reclaiming);
> +}
> +
> +static inline bool lru_gen_add_rejected_folio(struct lruvec *lruvec, str=
uct folio *folio,
> +               unsigned long scanned_seq)
> +{
> +       return __lru_gen_add_folio(lruvec, folio, scanned_seq, false);
> +}
> +
>  static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio=
 *folio, bool reclaiming)
>  {
>         unsigned long flags;
> @@ -420,6 +434,12 @@ static inline bool lru_gen_add_folio(struct lruvec *=
lruvec, struct folio *folio,
>         return false;
>  }
>
> +static inline bool lru_gen_add_rejected_folio(struct lruvec *lruvec, str=
uct folio *folio,
> +               unsigned long scanned_seq)
> +{
> +       return false;
> +}
> +
>  static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio=
 *folio, bool reclaiming)
>  {
>         return false;
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 12aca97be56b..39f77a68be37 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1971,7 +1971,8 @@ static bool too_many_isolated(struct pglist_data *p=
gdat, int file,
>   *
>   * Note: The caller must not hold any lruvec lock.
>   */
> -static unsigned int move_folios_to_lru(struct list_head *list, bool do_r=
otate)
> +static unsigned int move_folios_to_lru(struct list_head *list, unsigned =
long seq,
> +               bool do_rotate)
>  {
>         int nr_pages, nr_moved =3D 0;
>         struct lruvec *lruvec =3D NULL;
> @@ -2028,7 +2029,7 @@ static unsigned int move_folios_to_lru(struct list_=
head *list, bool do_rotate)
>                     !folio_test_referenced(folio) &&
>                     folio_ref_count(folio) =3D=3D folio_expected_ref_coun=
t(folio))
>                         lruvec_add_folio_tail(lruvec, folio);
> -               else
> +               else if (seq =3D=3D -1UL || !lru_gen_add_rejected_folio(l=
ruvec, folio, seq))
>                         lruvec_add_folio(lruvec, folio);
>
>                 nr_pages =3D folio_nr_pages(folio);
> @@ -2147,7 +2148,7 @@ static unsigned long shrink_inactive_list(unsigned =
long nr_to_scan,
>         nr_reclaimed =3D shrink_folio_list(&folio_list, pgdat, sc, &stat,=
 false,
>                                          lruvec_memcg(lruvec));
>
> -       move_folios_to_lru(&folio_list, true);
> +       move_folios_to_lru(&folio_list, -1UL, true);
>
>         mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
>                                         stat.nr_demoted);
> @@ -2258,8 +2259,8 @@ static void shrink_active_list(unsigned long nr_to_=
scan,
>         /*
>          * Move folios back to the lru list.
>          */
> -       nr_activate =3D move_folios_to_lru(&l_active, false);
> -       nr_deactivate =3D move_folios_to_lru(&l_inactive, false);
> +       nr_activate =3D move_folios_to_lru(&l_active, -1UL, false);
> +       nr_deactivate =3D move_folios_to_lru(&l_inactive, -1UL, false);
>
>         count_vm_events(PGDEACTIVATE, nr_deactivate);
>         count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE, nr_deactiv=
ate);
> @@ -4910,7 +4911,8 @@ static bool isolate_folio(struct lruvec *lruvec, st=
ruct folio *folio, struct sca
>
>  static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>                        struct scan_control *sc, int type, int tier,
> -                      struct list_head *list, int *isolatedp)
> +                      struct list_head *list, int *isolatedp,
> +                      unsigned long *scanned_seq)
>  {
>         enum node_stat_item item;
>         int zone_idx;
> @@ -4941,6 +4943,7 @@ static int scan_folios(unsigned long nr_to_scan, st=
ruct lruvec *lruvec,
>                 seq =3D lrugen->max_seq;
>
>         seq =3D lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx + =
1, seq);
> +       *scanned_seq =3D seq;
>         gen =3D lru_gen_from_seq(seq);
>         max_gen =3D lru_gen_from_seq(max_seq);
>
> @@ -5135,6 +5138,7 @@ static int evict_folios(unsigned long nr_to_scan, s=
truct lruvec *lruvec,
>         int tier, scanned, reclaimed;
>         int isolated =3D 0, nr_isolated =3D 0;
>         unsigned long total_reclaimed =3D 0;
> +       unsigned long scanned_seq;
>         bool skip_retry =3D false;
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>         struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> @@ -5146,7 +5150,7 @@ static int evict_folios(unsigned long nr_to_scan, s=
truct lruvec *lruvec,
>
>         tier =3D get_tier_idx(lruvec, type);
>         scanned =3D scan_folios(nr_to_scan, lruvec, sc,
> -                             type, tier, &list, &isolated);
> +                             type, tier, &list, &isolated, &scanned_seq)=
;
>         nr_isolated =3D isolated;
>         if (nr_isolated)
>                 __mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
> @@ -5172,8 +5176,6 @@ static int evict_folios(unsigned long nr_to_scan, s=
truct lruvec *lruvec,
>                         type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON);
>
>         list_for_each_entry_safe_reverse(folio, next, &list, lru) {
> -               DEFINE_MIN_SEQ(lruvec);
> -
>                 /* move_folios_to_lru() culls unevictable folios via foli=
o_putback_lru() */
>                 if (!folio_evictable(folio))
>                         continue;
> @@ -5192,11 +5194,9 @@ static int evict_folios(unsigned long nr_to_scan, =
struct lruvec *lruvec,
>                  * so this effectively promotes them by at least one gene=
ration.
>                  */
>                 folio_set_lru_refs(folio, 0);
> -               if (lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type])
> -                       folio_set_active(folio);
>         }
>
> -       move_folios_to_lru(&list, false);
> +       move_folios_to_lru(&list, scanned_seq, false);
>
>         walk =3D current->reclaim_state->mm_walk;
>         if (walk && walk->batched) {
> --
> 2.34.1
>

Passing `scanned_seq` to `__lru_gen_add_folio()` ensures
that rejected folios are placed at least one generation
younger than the scanned generation, capped at `max_seq`.
This prevents them from being repeatedly scanned at the
same or older generation.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

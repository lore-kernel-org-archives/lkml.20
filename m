Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793094981;
	b=XcuJWtQ7qf+zNilBMLxmwBkBPAWLNDr+u7F8CxLOgT+IKFlZbeiL2+dtN0w5MIfMqG2W
	 m6x7hhqYLkTHLJyBUi4+0xMvq+xMGOFHg8suO0OqxRzVV0pXLDrZTW9LoLXabiikq8Anh
	 1DxbnsL0WdMiYcxcLat3Q68d+ZZ6XZ/AorShzSqb13go4418LEork4Neqqy3Kpr39YQJe
	 jHN4gW63uvvwY0HYY4LC70/Xu5pfe/nH0iFzcyUmnpEYd+yOIcjIWOXWaKVBWbMc/BLYB
	 WTKWauB1sK8OKtWc2XbEMMlBxBAZ4qV/Axiqys4hcmc89sjXwYbAbY071k7G7BcM2AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bm9jOSKbHeFb5Ll3Ot50G1jHQC3KYW8p/DmkltzWt7M=;
	b=QDUCoo5wZE6S/8RokqAxZcUEekPEU3tuWY2pclgN/hB4WUhqAMNtmbVxGH7eHmhuY8fF
	 fdE2HwWzG1dPxDzDS3Ob2QY3AgHi0QoJqu//U6c/KroV8ebmM0mxPqvZ76mCH95p9thIp
	 76at7RY8/+PV67AJv5B8zd9XbySRDZyZ3IeZdMsVz8QRMv2kJtX+tU8VAMjXYcW6DjrZ9
	 gIKH47v5c8+yN1G2J3HgV68ngcSBNyn22f+Q1fMVY1nUwjVk4uDEQRHukpIQ0hbqxZQh6
	 Ka9hR7m+FbeArLj/khhtjceSoRl19I+2urns5RLq0ZYbn44nEXKSaE3b6kNQFNlccBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qA8d4yKm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D5606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qA8d4yKm
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so26260155e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793094980; cv=none;
        d=google.com; s=arc-20260327;
        b=LRCb3UJev5vHnk8ULWfWbmewjRbenL54ctDMSXBAkM11PJ6Cka6BXPjzhNr9zPm7Wy
         oae5OmKZOgntCK3yNDMRvSBETDObmySfnQ3uZGgwgkHp9ACk4F9vO357sRLMz5JYAEsq
         xjgScnSCDhS7VeKIVVAeSc2WW+mDoaZSdTt9hkWjJSLhbQMS1TZN13sc9HVBTZOjxS0m
         IhCEj28h06WL9Xrf8geuZkA76zP6tkGkKJDiwiKpPEKTYcpi1Mh5JKRdLDBBTYm6bKkb
         fxjLIzm5+Vbw1mLJDBYH/wyppP9BhuL9bIBq+vCLqbH2KEovg0gyQ6+QQcDswaIieekS
         t46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bm9jOSKbHeFb5Ll3Ot50G1jHQC3KYW8p/DmkltzWt7M=;
        fh=edOJfvUeYGxKPfaINp+/KkLOXUcyaX8RkYA/zX6cdks=;
        b=iAoB8aqQB2iG7g++8Gkglco+n3Q0YtgF8Ose8nkFWA2NsDftVHifFEyqjwk+Ejv04J
         0ZtGJub1WlugkD9P7Q+uTQhpbqM1pB6Lnljb7QCsmMBjuUOSBUVqypzabB9DkiwYQb7C
         pj3AUOK4vi1lyPKLwexNaTuj3ksHtV//uyBNUBu80FQVYKvUG+BYEaM4pD8WnpzbZIcw
         u9Of2iHfq5xMGuhimcaD8talCSdg4grBDq/DhOX1xmATB6QuXSzM4tln1hxJk+bG3oJd
         GTBSt3renCckDqS2qTXlkZDMhQSP6f1k5SmvOsbG+PA1oC9E3zNm+37YacsaxmSHdqQZ
         vvew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793094980; x=1793699780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bm9jOSKbHeFb5Ll3Ot50G1jHQC3KYW8p/DmkltzWt7M=;
        b=qA8d4yKmqRW1aCpZVgYZUf8binEPPlBwLhL1GabiTNPgzPs6SSW7aI+njqjnY/AKNA
         x0BJ0lZvImG476wkDljNKMvkGRo5KrEJNvkA0UkHytBS0kcEptaTF006XDSJRcnPn0C5
         oC0vbZbMdV8mdLAE7KjPrK1u52qXYH14JmAQrn/wYvHmbPzpVon3HZuIyAS40YyF1LQ+
         JDgCL2kHB6jtcFPW2Q0AbIjQSyhGgcL+riH+xsF7x8MPgUVickc3mzP13z7OGbXRqDvm
         UIXqgaLE0hsWR8StoolZTnCCwAAjSsh0INgrfW5+aF2jd9svMg/4AwEfG6G7pfYsgq9d
         L9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094980; x=1793699780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bm9jOSKbHeFb5Ll3Ot50G1jHQC3KYW8p/DmkltzWt7M=;
        b=I+NLT+N8CThrzGfwRklYMRfK8dp6vEIrlial7+JaesuO/q2+i6q/o+Gi3ePwxudJS2
         B3YlMvpHc/t2ZwV11fetV1O45xdzlynRQ8G+o11EH+uwDVXsFgs11dAHVP1/CcreQPmP
         R79Ds79UHsstaLnVHet7BJT9kLRRpEEofXnFAljmo0CGxzFnSCcQRWJ2gHrTtOTAES9u
         i/9AMPbFLYSohBm803fFwYVKPhnGQ+dE0eOZSLGg+7UKqXKTrzSxAReyjFxvg4BjYCwU
         9n0RUWhS+e1TpgTBy8Tm7Q4K6p6iEoUJrN0Df+S3uOGyd3EWDWik+6GufVbw2xhZZaPP
         iz4g==
X-Forwarded-Encrypted: i=1; AKwUvBxMt9LIcJud20DM/CcgBu2mjm0C9Z2PA98YijDIBLOjUrBqosBgKdeREQRJJ+z/UBW+PZ3gvAromA5xJMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGtsHonpOhZHXB9xDmhH5QzkXhzfWl3BfrAbo8/ISefTFqvYzX
	GYzf7IuxSCADiXug3m9AbyOUSBXaOWTkCDero9i2idZ8bdJ1eo78KCpGjbr61iZpJBiENV9rNYu
	t4s1lyQ4zlIhdVbI9BC4cQiMt9Mm5bro=
X-Gm-Gg: AYBFou1F4cTMETEZ0Makc3PZe9NrIngbVUzMM0460E/0/9C8lMtGbhuoLokSgzGxpfX
	8Z0O7WhHUJ3c5Qi/8s7HKz6AH/ERZRGx9HxTUqeKQ22I3t6WmUU4l5DBFlGi9TrLJo2uyTt7V+2
	fQiDQ/t1HpjlMpPjVQBYViBs+oMu8xMqOjAaFVAQExvQklnLeBhJJ8uOfkL/3ZnWoFp23QT7wPg
	WX0oNXefEm9XHMSR9/he9PjbDUl1fwlWvC6b59JvDhl6+PY5vWb6XZKARbDvgdPtSwC0mJGJIDz
	3ViKkAxPksnwr1Rgc+QcV+GoW4tlFQrPiDUaI+vfwv+UBvEh9OA5Z0NRvF6kIOJAtq55BmSm6XM
	IYdGs2u+iW5Q0z9lCKMxOkL7KS7AchXrVuveaXEjUbvLhp587JoJ/1BulKV/hXaQg65T88+c=
X-Received: by 2002:a05:600c:3f0d:b0:4a1:9663:7639 with SMTP id
 5b1f17b1804b1-4a35accbcbcmr174565425e9.34.1793094979168; Tue, 27 Oct 2026
 02:56:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-4-baohua@kernel.org>
In-Reply-To: <20261022220203.91911-4-baohua@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 27 Oct 2026 17:56:06 +0800
X-Gm-Features: AclHuK_kakz01byG3bVjUGAzouFDztXZLeqCiwVm50JfGRxN9K2TCJfc75PXcc4
Message-ID: <CAN_Opa_QB7Mwppa72f_UXP1k2FZFGxgLKf7FtzH-KyabebLWhw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 03/14] mm/mglru: reclaim from the oldest populated gen
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
> Currently MGLRU tries to keep the gen numbers of the two types in sync,
> avoiding reducing the gen number of one type when the other type has
> more gens, as described in the comment in try_to_inc_min_seq().
>
> This makes scan_folios() stuck reclaiming the type with fewer gens: it
> always scanned the oldest gen of the type, even when that gen was
> empty, so reclaim made no progress on that type unless forced aging
> created a new gen and eliminated the dead empty gen.
>
> There are other approaches, like lifting the gen number
> synchronization [1]. However, that would break the gen layout used by
> lru_gen_folio_seq(): newly added folios would no longer have a
> well-defined hotness according to their gen number, which reduces
> accuracy. It is also not pressure-aware, since with gentle reclaim we
> still want to respect the gen layout (hotness).
>
> Instead, reclaim from whichever populated oldest gen is left, but only
> when the default reclaim priority can't satisfy the reclaimer's
> requirement. This is typical for swappiness limitations: e.g., low
> swappiness asks the reclaimer to reclaim from file, but file gens are
> drained, so the reclaim cycle fails and priority is raised.
>
> At the default priority the scan quota is 1/4096 of the evictable
> size, and the old behavior is kept there to respect the hotness
> distribution. Once priority is raised, the quota is at least 1/2048,
> so the hotness bias introduced by reclaiming from a younger gen is
> bounded by that quota, which seems fair. Global reclaim for MGLRU may
> start with DEF_PRIORITY / 2 (1/64); the ratio is still reasonable at
> that point, and when global pressure is more critical, we should
> reclaim harder.
>
> Note that scan_folios() still refuses to reclaim a type left with only
> MIN_NR_GENS gens, so a completely drained type still requires aging.
> This change only avoids scanning empty gens when populated reclaimable
> gens remain.
>
> Link: https://lore.kernel.org/linux-mm/20260726122123.7614-4-baohua@kerne=
l.org/ [1]
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  mm/vmscan.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 500ef23949fd..d7eb15533de1 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3451,11 +3451,9 @@ static int __folio_inc_gen(struct folio *folio, in=
t old_gen, bool *increased)
>  }
>
>  /* protect pages accessed multiple times through file descriptors */
> -static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
> +static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio, int=
 old_gen)
>  {
> -       int type =3D folio_is_file_lru(folio);
> -       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> -       int new_gen, old_gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
> +       int new_gen;
>         bool gen_increased;
>
>         new_gen =3D __folio_inc_gen(folio, old_gen, &gen_increased);
> @@ -4836,7 +4834,7 @@ void lru_gen_reparent_memcg(struct mem_cgroup *memc=
g, struct mem_cgroup *parent,
>   ***********************************************************************=
*******/
>
>  static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struc=
t scan_control *sc,
> -                      int tier_idx)
> +                      int min_gen, int tier_idx)
>  {
>         int gen =3D folio_lru_gen(folio);
>         int type =3D folio_is_file_lru(folio);
> @@ -4854,14 +4852,14 @@ static bool sort_folio(struct lruvec *lruvec, str=
uct folio *folio, struct scan_c
>                 return false;
>
>         /* promoted */
> -       if (gen !=3D lru_gen_from_seq(lrugen->min_seq[type])) {
> +       if (gen !=3D min_gen) {
>                 list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
>                 return true;
>         }
>
>         /* protected */
>         if (tier > tier_idx || refs + workingset =3D=3D BIT(LRU_REFS_WIDT=
H) + 1) {
> -               gen =3D folio_inc_gen(lruvec, folio);
> +               gen =3D folio_inc_gen(lruvec, folio, min_gen);
>                 list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
>
>                 /* don't count the workingset being lazily promoted */
> @@ -4876,7 +4874,7 @@ static bool sort_folio(struct lruvec *lruvec, struc=
t folio *folio, struct scan_c
>
>         /* ineligible */
>         if (zone > sc->reclaim_idx) {
> -               gen =3D folio_inc_gen(lruvec, folio);
> +               gen =3D folio_inc_gen(lruvec, folio, min_gen);
>                 list_move_tail(&folio->lru, &lrugen->folios[gen][type][zo=
ne]);
>                 return true;
>         }
> @@ -4919,17 +4917,27 @@ static int scan_folios(unsigned long nr_to_scan, =
struct lruvec *lruvec,
>         int scanned =3D 0;
>         int isolated =3D 0;
>         int skipped =3D 0;
> +       unsigned long min_seq;
>         unsigned long remaining =3D nr_to_scan;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>
>         VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
>         VM_WARN_ON_ONCE(!list_empty(list));
>
> +       /*
> +        * Respect the gen hotness distribution at low priority to avoid
> +        * aging and scan cost, but prefer to satisfy the reclaimers requ=
est
> +        * when under pressure to respect swappiness more and reduce IO c=
ost.
> +        */
> +       if (sc->priority =3D=3D DEF_PRIORITY)
> +               min_seq =3D lrugen->min_seq[type];
> +       else
> +               min_seq =3D lruvec_populated_min_seq(lruvec, type, lrugen=
->max_seq - MIN_NR_GENS + 1);
> +
>         if (get_nr_gens(lruvec, type) =3D=3D MIN_NR_GENS)
>                 return 0;
>
> -       gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
> -
> +       gen =3D lru_gen_from_seq(min_seq);
>         for (i =3D MAX_NR_ZONES; i > 0; i--) {
>                 LIST_HEAD(moved);
>                 int skipped_zone =3D 0;
> @@ -4947,7 +4955,7 @@ static int scan_folios(unsigned long nr_to_scan, st=
ruct lruvec *lruvec,
>
>                         scanned +=3D delta;
>
> -                       if (sort_folio(lruvec, folio, sc, tier))
> +                       if (sort_folio(lruvec, folio, sc, gen, tier))
>                                 sorted +=3D delta;
>                         else if (isolate_folio(lruvec, folio, sc)) {
>                                 list_add(&folio->lru, list);
> --
> 2.34.1
>

At raised priority, scanning from the oldest populated gen avoids
wasted work on empty generations. The change to pass min_gen through
sort_folio() and folio_inc_gen() keeps promotion semantics correct
when the scanned gen is above min_seq[type].

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

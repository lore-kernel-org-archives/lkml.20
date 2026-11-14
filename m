Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794668582;
	b=b1bwd+s6tDUhppoEf0ZRLZjv44pnTVXJxKXNp68C1RKYdAsDA4NLr8m3YJyS8ePGvnqN
	 rmEufpvvs5SFaEeiGHKB6enGe9KZUJH6BzhyRIjqPXemFqURykDsCPQXIBwY4WN94S/ng
	 4uFQAEyr17Ej3C/oP2ex/mNbH8EenrJKolPsLizx1RbLm3vRZWGDFBQy2Q0/wf9YmzLSF
	 jyedA146NFWKG/2ZDw34eaH1esgCDD2OPUEG7DUosxA7zluZ9MrtdchWxqEBKjOpoqEkO
	 Jv0LKujC+6tH23BwuVewLBzXspXJprFCpY7oS7m2u51uZLR0R890cQJEw4B+Ngg+yOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C1lCCVtf/MPYj7pNIU76GaLtqiwfvOf2pe2XTu7js8E=;
	b=WBwQYiCmY9/QZ6a58oK5UMp8mHd74pDoGuiRSzE6S/CcdvyrV4VNFDI+AQCjQ4R318BI
	 ZLOOSxls2q87ZUr4/V755Wx40EvSZjtxlao2oXrsKmnt0ZtW6O9Di4mphAbT3i8Wd3uCg
	 30RvrSg0oFbQ7JUDZy3koqFFxnjvOXmEm6q8NN8No3lAPp3VMigyViVDP7AV3yu0Ze//J
	 suRCn/FUd8eqk0Jp2qoYc8SmxYsmWWXWFu0As6TTmeYFB9u46sSXC+2p/6DGmqJu2p2GW
	 IvOZZAdLWmX7jJPg/54FrNSoYH9vwk82sBBmBTsaKscE2Ca/e1t3XF2CziGdr2eeoFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxDScQ0x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBDE606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBDE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxDScQ0x
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so998436b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:03:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794668581; cv=none;
        d=google.com; s=arc-20260327;
        b=d0E4UgWZOYty6stP54xFcLT6N3KTb9/Ei/kB9sQ5fJKPVo3U19lowlgSrqHskvlWyS
         Xb4EMUD13fetAICVPxytTXfArcmrNTh/yY+DB4F1x73+lPgSWiY2CSiTppSoMnUUOzev
         6yPPyz+tv++Fdu4AXMcsRzkdlVPQ0AOpDm3yJ37mAUFLrI0Z1MynDw9gXvo6IpLJn649
         Hd9Bcj8x0/U2MdqzBmD89sFktwKST2IikxgeStBMvVi+yzGnN/a8HHjyiFeBOXm+wPrx
         mXJ6BFh+pbCxYcQubN75mlDUonVFu2U5OEL7m3tSx/nn9b8liFhdXcQFaaGA0U9I1L2X
         s6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C1lCCVtf/MPYj7pNIU76GaLtqiwfvOf2pe2XTu7js8E=;
        fh=NXV0WVF8MNAbT4QJ1CkUu25RG2Vwm7hjdJV/A25dMwk=;
        b=faF1RGEX6vDrl9vICTXXMdZacc59nAN09cDa19ew/3Fj82ptqe66Hsu9rC6s39ofxK
         yjJNho3oTauhZvqyDbA2cVN5nHCc9/rfO3l4KycdRIATuicMVMkkwpNtOgBPm4IV/9Ta
         zFm8ULYGIW/2GU11kKUuKEpyg832gbcH/A2qbTq41D9RDQcZrKdDUN9v2sEdh6+28Gaq
         Yn2++OO4GZuo1AbjSp7TuZ66w1J8+EL4oFbjOGiXXU36h+aRr5Ux7CR/uB2Upy/B510l
         tIWlMAwEniAxPRcIfgkD0/HWXMwQMVTqrRqmGWsvfcSmNIpqJzYUXAt5dCerK84Xorzh
         GcjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794668581; x=1795273381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C1lCCVtf/MPYj7pNIU76GaLtqiwfvOf2pe2XTu7js8E=;
        b=WxDScQ0xoaG4i1Gpi+rXe2xFkOkC/5pW7W9g6xmh9GOaJHdVNOQcva7t6dcPt1b99I
         n+i+hu7w1iu9yFNYam/pUK97kgq1SdXnG4mwH3uqe7Vzhk6oAvW77i2gwwkl+bWtWB75
         229Gu5mjW7ETCthViwXSg9JlY6ruf+kHf4IXNQksGzSdlTH1XQCHJQP1M41ev5eIfgDl
         s/Q8mjOx2pxuXqbTF0fpL14rGN6IDHvVKhlrWQsXk3pWq+kdhcWKEgUg4qQmyjMVTL9g
         IiCyYWmc/gMFKlkvOgbgkyvEarwZaNYTCKsNQdw3Vi0BifSPGbZcracthjht+b2syMrL
         CP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794668581; x=1795273381;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1lCCVtf/MPYj7pNIU76GaLtqiwfvOf2pe2XTu7js8E=;
        b=s04QVN/FSE+nStusv1TC/37/ko9nHPRoBIhS4HsXebNNBGznAn+IjJVJsIpUZmYIC7
         kvO/03uZW21BlOG7S8P0VfRtFS9aS0ETRdUmGommfq5L9ZIOKb60KNAtEoJ+L5By9mhE
         xZkNnjJyi7M+LuNh0eqKcGqF1+ipjb6OTDccUj3aFALNAfxRQdHZ0uKzQ7fHpBqsv49W
         3Xm2QgGpnskWmeMjmf+HELIOcjLb0xcABgwreGxjrVC9ZKNn9oyMQ+G8h6rx5xuJmHdk
         If+o3+1QF+oz6ucZK/oOyyOwNpSvVMKnPDc/T+q+3L9E/t7bt3cjx4CE45Q3UK23jMha
         eZ7w==
X-Forwarded-Encrypted: i=1; AL+hErFEtUXIU4S786D+9i8bfYFv963dme3+3KBFeqpfM+cJehnkSRubdu8mc9t/vItYuOnGGdrku6DyQwhE9zI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pl8bBx97zG6/mP0vTUH/RRQRhIbWxTmxu5kEp9vkPWtT9qPif
	YxQTX9IhdkAo1Y6KsftD3rO2+tiyfShUxxtK6ToGe4IJDr5qNoEP4XHPGT5RJA8vTrcq56GlwrX
	Kd2dXWFCLo2MEpXW+ByrRI+KrNxiJEWc=
X-Gm-Gg: AYBFou2V0GTqde6EoDnlxcfkIioJV3dI9WCIrv6P5SfFFhp07YUpIFZdFT3Re75D4op
	LaD2Ux8V0qTpKglFZo/HRJj5bahA/rBi7qUU/Mzrcdq6N/yVDr04qMCgfhpTpslMyNGzEbHOE0o
	fLuC2HEoaI+2rUGj4fMonq12TSM3i73aLA2EXNkpQ/VCl5u4+Wegs7qNQaMxSvOf65H0v4IbuZK
	xGkXA9jsjaGg+2SoTbsa+VezdYl88Wa/BVQR+SNoOpOIMTejjl7E1Br0NymTBAfsV30R12r1R3S
	91tGoVqWl7KvTLRU6Xv8ucFlPAuigoEz7Z4SE46F/IS7YQ6AMm1HV0BmFhRIKoNtk/sjlQqgpjT
	O6EvxtJh4E6II9/NBbPz1HJb7bWClSpWv4wIkh9FScOoF7nqwpPHLo04/fK6VdBJ9OvM/Eg==
X-Received: by 2002:a05:6a00:1acf:b0:880:f278:6b0b with SMTP id
 d2e1a72fcca58-8beb1fd2ff7mr4883548b3a.4.1794668581197; Sat, 14 Nov 2026
 07:03:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113185541.70203-1-baohua@kernel.org> <20261113185541.70203-12-baohua@kernel.org>
In-Reply-To: <20261113185541.70203-12-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 14 Nov 2026 23:02:19 +0800
X-Gm-Features: AclHuK9gCJV8MFA9iUFu3CwHsXGh1an-enxfVWTT7zznIrP-Np1lV34GtN_mM4U
Message-ID: <CAMgjq7AXT7u3jMaJ5gU3p+Wnwt5maVAUygMXgv=wLDS6BSyR-Q@mail.gmail.com>
Subject: Re: [PATCH v8 11/16] mm/mglru: Run aging when one type has no
 populatable folios
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kunwu.chan@gmail.com, liam@infradead.org, 
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, liuxiang.277@bytedance.com, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, shakeel.butt@linux.dev, 
	surenb@google.com, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com, zhuhui@kylinos.cn, 
	sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:56=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> We may have scan budget remaining for anon or file but no
> folios in populatable generations to scan. In this case,
> `scan_folios()` may waste time scanning that type while
> the other type still has populatable folios.
>
> Run aging in this case to make more folios populatable.
> This also helps respect the scan budget distribution
> determined by swappiness.
>
> To avoid excessive aging, allow no-populatable aging only once per
> `try_to_shrink_lruvec()` invocation.
>
> With extreme swappiness values such as 1 and 200, reclaim initially
> focuses exclusively on the preferred type. In this case, defer aging
> the lagging type until `sc->priority` reaches `DEF_PRIORITY / 2`.
> This avoids unnecessary aging and has shown better performance in
> testing.
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 49 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 11 deletions(-)

Hi Barry

Thanks for the idea on solving the aging problem.

>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 59957fab915b..9071f8889b5c 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5109,7 +5109,8 @@ static bool lru_gen_imbalanced(struct lruvec *lruve=
c, struct scan_control *sc,
>  }
>
>  static bool should_run_aging(struct lruvec *lruvec, unsigned long max_se=
q,
> -                            struct scan_control *sc, int swappiness)
> +                            struct scan_control *sc, int swappiness,
> +                            bool no_populatable)
>  {
>         DEFINE_MIN_SEQ(lruvec);
>
> @@ -5121,6 +5122,13 @@ static bool should_run_aging(struct lruvec *lruvec=
, unsigned long max_seq,
>         if (sc->priority =3D=3D DEF_PRIORITY)
>                 return false;
>
> +       /*
> +        * Run aging if scan budget remains but no folios
> +        * in populatable generations are available to scan.
> +        */
> +       if (no_populatable)
> +               return true;

Usually we don't prefer negative naming, maybe something like
`drained` is better? Also can makes the comment easier.

> +
>         /* better to run aging even though eviction is still possible */
>         if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=3D m=
ax_seq)
>                 return true;
> @@ -5208,6 +5216,13 @@ static bool try_to_shrink_lruvec(struct lruvec *lr=
uvec, struct scan_control *sc)
>         bool need_rotate =3D false, should_age =3D false;
>         int swappiness =3D get_swappiness(lruvec, sc);
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> +       /*
> +        * Avoid aging the lagging type under extreme swappiness,
> +        * as reclaim of the unpreferred type is disabled until
> +        * DEF_PRIORITY / 2.
> +        */
> +       bool allow_no_populatable_age =3D (sc->priority <=3D DEF_PRIORITY=
 / 2) ||
> +               (swappiness > MIN_SWAPPINESS + 1 && swappiness < MAX_SWAP=
PINESS);

This part is a bit counterintuitive, as we usually prefer to age when
priority is high, not the opposite. I think what it is really trying
to catch is then the eviction reclaim loop can't reach a higher gen
for eviction, and when priority is high, that limitation is lifted so
it can always reach the right gen for eviction, right? See below....

>
>         /*
>          * Proactive reclaim initiated by userspace for anonymous memory =
only.
> @@ -5225,22 +5240,19 @@ static bool try_to_shrink_lruvec(struct lruvec *l=
ruvec, struct scan_control *sc)
>         lru_gen_prepare_scan(lruvec, sc, memcg, swappiness, nr);
>
>         while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
> -               DEFINE_MAX_SEQ(lruvec);
> +               unsigned long orig_file, orig_anon;
> +               unsigned long max_seq;
> +               bool no_populatable;
> +               long scanned;
>
>                 if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
>                         need_rotate =3D true;
>                         break;
>                 }
>
> -               if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
> -                       trace_mm_mglru_aging(lruvec, sc, swappiness);
> -                       if (try_to_inc_max_seq(lruvec, max_seq, swappines=
s, false))
> -                               need_rotate =3D true;
> -                       should_age =3D true;
> -               }
> -
> -               if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LR=
U_BATCH))
> -                       break;
> +               orig_anon =3D nr[LRU_GEN_ANON];
> +               orig_file =3D nr[LRU_GEN_FILE];

So maybe what we need here is evict_folio_lists return something like
`drained`, meaning it still have budget, but can't reach the protected
gens.

> +               scanned =3D evict_folio_lists(nr, lruvec, sc, swappiness,=
 MIN_LRU_BATCH);
>
>                 if (should_abort_scan(lruvec, sc))
>                         break;
> @@ -5252,6 +5264,21 @@ static bool try_to_shrink_lruvec(struct lruvec *lr=
uvec, struct scan_control *sc)
>                 if (root_reclaim(sc) && should_age)
>                         break;
>
> +               /* Limit no_populatable aging to once per try_to_shrink_l=
ruvec() */
> +               no_populatable =3D allow_no_populatable_age &&
> +                       ((nr[LRU_GEN_ANON] && nr[LRU_GEN_ANON] =3D=3D ori=
g_anon) ||
> +                       (nr[LRU_GEN_FILE] && nr[LRU_GEN_FILE] =3D=3D orig=
_file));
> +               allow_no_populatable_age &=3D !no_populatable;
> +               max_seq =3D READ_ONCE((lruvec)->lrugen.max_seq);

Maybe we can drop this READ_ONCE here and just let should_run_aging
read it from lruvec?

> +               if (should_run_aging(lruvec, max_seq, sc, swappiness, no_=
populatable)) {

And the `drained` signal, aging policy (allow_no_populatable_age) both
goes into should_run_aging for a cleaner logical divide?

> +                       trace_mm_mglru_aging(lruvec, sc, swappiness);
> +                       if (try_to_inc_max_seq(lruvec, max_seq, swappines=
s, false))
> +                               need_rotate =3D true;
> +                       should_age =3D true;
> +               }
> +               if (!scanned)
> +                       break;
> +
>                 cond_resched();
>         }
>
> --
> 2.39.3 (Apple Git-146)
>

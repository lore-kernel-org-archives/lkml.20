Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091102;
	b=sGdCdKk1ckJ5qINsnrsDNfQnc7bujMi6OeSL3UbEs7ocnZy4/LiEQmbxuiy/+pK5n9BD
	 cIqnldAUY9gfzoDKe8jfafQcZoSt65DWNGdSjSFR0j+xJ5dtZv82FChqnRwINhgOm1T3W
	 /+akDhrRM//LzPIFY9VrqmO7dyi/QWyCQny89f704Dx8EcrtrXQxwywKKdganF2PGjRLs
	 tdROAHxj98f20ie0acmeyrCHYeD7jBMTWCWHeoQwreNqMVSMsCBRvmLSuasaodU1KazQC
	 ekEYHA8EN/X+8rG42q0zjKtN8CyELXdFec3hlbmhColuMI7xQf6pTPYCRBTHkXetbxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r58oMkE78kPQyjCod0p5GrWGFsnrgrLSQzJIPre6p7E=;
	b=RLpsr1GZSO8u/TyEGXgHaQQ92iH2BUZ3EKxfI/CQgitF/yhxL9+0bzYJEb2ZobSnt9nk
	 VwiKTANxTRWErhIJD14GqJggh6rcTlk1WwGvedTE41WuZROtnzcQ7NcYomowO1PwrhElT
	 pYse6gwKK3c4g3tneycaGmw60UnCG92bjD74SsLHYntFQUyKDGVUon3MOWBIyJ0/LARLp
	 p+yQOFxiRIIc9+zB3HOmIojrdlO149vxx0rbyBJdB5XyYTMZyJTpPlcatmcDEYvlKpqZc
	 QO5qqbTPGB2ujFz+VsDWx+A7TqeDrPiKzfClHDsOSbG4raRgV5KRJHGgaD9i9dPNZPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OlqxzPYC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A6606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D1A6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OlqxzPYC
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4046755e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793091101; cv=none;
        d=google.com; s=arc-20260327;
        b=Z4KZ9zxc1FRxdK21OQFNqQ5OyS5NzqcyTB8lXoexo3mhDYEmdOt4O9o4ZS2nTV/4eH
         cv2bEumBZnddXkwliomvFAP9s+VuyxnJjCwuWh9afDHRx/CIOgOJfyCX41mP483eurAR
         OqWNN15LsriOQ5nng9XwaKC/NNH2TS5F2nVphEAAwa9nqqIZinWWTOYZmnEyyG5m+1bP
         LoyV44O1TUk0w7m2khdraTfkIynlXM8UmO1EmqjqR/x41bi4S0524XOj+7s7IepJe0P3
         wggmSXxCd+EQLPPJCUrLS+C7tusXr3n5uoeENc1oELRcS3PZfGzr2TrY7hU/o2ZHvxIq
         ek5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r58oMkE78kPQyjCod0p5GrWGFsnrgrLSQzJIPre6p7E=;
        fh=gDbsUPVjward92EbES4jsR9FALGKJsXdl3MJ9Fkm9os=;
        b=PmbS6LL1DqsVhsOGD/8Vnn6KEPSN6ZrA7gR6gfIbf/9y4zCdvYQn1FnqeV0vY1dGLT
         RmlCKLx+lSs0xs5x0ScaJDPA2h49zp4LiOyWmZoO2QhEC9sd43iu5l9YuRkuWvOERoky
         wrDHFnYkzwgoFmCDhRUc0DUSa5e58ohUPE6ltErD0WhF5dVE5MFeSb3qMGgF377eXqAe
         ZaFV+gBiVEoiFGq0C9d8uX+6l1FabTqSmE8phJ8wBSt9NPLkt6YtEQBtFn9t8fUOoprr
         cX+pdto+EGlV1cax/QqmYw2gDxq1Kj4hT+5LvXj8JM9JrFVcgPr2wCT4lwjBYUSuUFHK
         80FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091101; x=1793695901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r58oMkE78kPQyjCod0p5GrWGFsnrgrLSQzJIPre6p7E=;
        b=OlqxzPYCw1fxdXBA5tgIcc6yvokA+nWetJ9ir2CiS+ocg5oXvCsfXUNMLTwNQEmyqL
         i8CJ5vFOt/okVXqQ889q18amxG3n2aUq6QLVNhOhKV+7dQ84sRzSqDylabXX6rmWhyG+
         Fvq2OU9kJKsUnlfbG+vuwfQQjIU8pbtnAXfMS6D9POb670s39FYBfXX6HfNvoM/EkdHJ
         2NsqSie88kgHkj9SvdV6JIUc9mQ6szGZmuet9nOH4fzR8bv8/jCxcHJQiSH0xLJFulx9
         YRjWSbh0rmoPtb4ZszjQUNIQSWHa4/8o6fnUFkDMuziM4nGCQd/7ct/9oWLcOIsaJuSD
         Niig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091101; x=1793695901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r58oMkE78kPQyjCod0p5GrWGFsnrgrLSQzJIPre6p7E=;
        b=Ohy017rU0w8u/CVtIAZtP5njUSqyOiXUPY4uC65eeTin8HLkplQ/zZEgjeZvx/Jzwl
         JaHedE2VS5KXSyD7ZE+0gDlT7VCLYcGoGPW88DJ2kG0g5V/JLgRX65oI1lpKseLghGJp
         PI01NsEF8EipDa9QIlxRyRtW7nCzVSrvbWTU9rq1k24DNalzBud9ZFA0O7AZscURSPYh
         oqnN/9WUQ7aKIZhTabtHSGHVKNQf3FBPGGtKpvqC80NkmQ5J3btqhgUb5N+Lyust/pd5
         iwRRi4IJncofFuDM8pCzEAX/ttam/6vsVkmpKQzSYFlXTJdWNcAZDPhxaysOaHJ71k6q
         7bog==
X-Forwarded-Encrypted: i=1; AKwUvByc4B95tJ9IHCe+6q4Q9UZnIB7BUIGGLZNUy7kCjnDzUpc4Ym8sioPiYkfCNMW09IsdwTPbC6i6dFecD+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMamWOCHAJWTFvxmSlCmT6fUkeNCDhoVh58o5mQUnbSJ8LErNX
	kaJuf9tiYk3XxL/5xw60hVO1CFmM52HMFU6xu1CyhmikXujDLR640Hob9BteaP6j9+vjkXzR/a5
	nZmPQvV2Yc6Naq5H+KaLIaUA7RYnmIuw=
X-Gm-Gg: AYBFou1uyXmC6tOI/oNKOqj/Wrrh8SXaiJ4MAqenq79XxF/ilJjlKsJClzMXR7uXTxa
	FZVxmy5Le7yNIGGnA3VazRmLNlCdhgh/VzSwiOVt2dKbSEf23uZpARUWRVhEQ5lSsxHSVewUGc7
	hxLMkKhdc9lAAhYogADVjKUpNQn44avFP/qhYVmuE3+w6rdvGoCvMbGaj8ZVz0aLhV8YhTUl/sz
	Ri2RvZjN5mdd9E71UCbzQwVS/jIF8ZXVKgDZixvB2FjBHU/2EiBKhg07DBfgrxEty5Ll2ndTNJ0
	ZmTsYU8NHpfpvEiHdEPSGl7D7BsNhgFkG0MZI8hdJXHZD9SdI1ETDBlE40z69vbyJ7lht4idqRP
	RuIsxQIqm9CwkP/LXwdaNQJ/dcMsX5x9oh27s9DqvkSykW6Ia23cC73+fZn1QbZMTgF52alA=
X-Received: by 2002:a05:600c:4e01:b0:4a1:efbe:529c with SMTP id
 5b1f17b1804b1-4a7c16c4554mr41674425e9.12.1793091100366; Tue, 27 Oct 2026
 01:51:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-2-baohua@kernel.org>
In-Reply-To: <20261022220203.91911-2-baohua@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 27 Oct 2026 16:51:28 +0800
X-Gm-Features: AclHuK_XGFItBjUoPfKvzZXGlr4oYRBiB3ixEErCXGNTkn-Nl7xjhLO4lyP7yXY
Message-ID: <CAN_Opa-C=i047acYe6eMau_97-5GEaa5qii_fioLeWQYpsRRyA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 01/14] mm/mglru: report evictable sizes per type
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
> Change lruvec_evictable_size() to return the number of evictable
> anonymous and file pages separately instead of a single total, so
> that callers can weigh the two types independently.
>
> Update lruvec_is_sizable() and get_nr_to_scan() accordingly; the
> summed totals are unchanged, so there is no functional change.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index fc823fe3bd1f..3be0d6c04a82 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4332,32 +4332,35 @@ static void set_initial_priority(struct pglist_da=
ta *pgdat, struct scan_control
>         sc->priority =3D clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
>  }
>
> -static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int sw=
appiness)
> +static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
> +                                 unsigned long nr[])
>  {
>         int gen, type, zone;
> -       unsigned long seq, total =3D 0;
> +       unsigned long seq;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>         DEFINE_MAX_SEQ(lruvec);
>         DEFINE_MIN_SEQ(lruvec);
>
> +       nr[LRU_GEN_ANON] =3D 0;
> +       nr[LRU_GEN_FILE] =3D 0;
> +
>         for_each_evictable_type(type, swappiness) {
>                 for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
>                         gen =3D lru_gen_from_seq(seq);
>                         for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
> -                               total +=3D max(READ_ONCE(lrugen->nr_pages=
[gen][type][zone]), 0L);
> +                               nr[type] +=3D max(READ_ONCE(lrugen->nr_pa=
ges[gen][type][zone]), 0L);
>                 }
>         }
> -
> -       return total;
>  }
>
>  static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control=
 *sc)
>  {
> -       unsigned long total;
> +       unsigned long total, sizes[ANON_AND_FILE];
>         int swappiness =3D get_swappiness(lruvec, sc);
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>
> -       total =3D lruvec_evictable_size(lruvec, swappiness);
> +       lruvec_evictable_size(lruvec, swappiness, sizes);
> +       total =3D sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
>
>         /* whether the size is big enough to be helpful */
>         return mem_cgroup_online(memcg) ? (total >> sc->priority) : total=
;
> @@ -5181,7 +5184,7 @@ static bool should_run_aging(struct lruvec *lruvec,=
 unsigned long max_seq,
>  static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *s=
c,
>                            struct mem_cgroup *memcg, int swappiness)
>  {
> -       unsigned long nr_to_scan, evictable;
> +       unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
>         struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
>
>         /*
> @@ -5197,7 +5200,8 @@ static long get_nr_to_scan(struct lruvec *lruvec, s=
truct scan_control *sc,
>                         return 0;
>         }
>
> -       evictable =3D lruvec_evictable_size(lruvec, swappiness);
> +       lruvec_evictable_size(lruvec, swappiness, sizes);
> +       evictable =3D sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
>
>         /* try to scrape all its memory if this memcg was deleted */
>         if (!mem_cgroup_online(memcg))
> --
> 2.34.1
>

Both call sites preserve the previous total by summing the
anon and file sizes.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

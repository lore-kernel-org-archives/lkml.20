Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703958;
	b=waeq0XVyTo04asvCYEP33KJr77eix7vNSpSGaeitUO4aaiG0rkJT3kUanKv2PUmYAy05
	 xcm6cGGUMppHkvpPNWXHi46fY7KKwi5I4s87PGkhtMbnmwLuH+K5US53HexX3+PU9FYXC
	 Fxcy6hhXOj/tylHHeqmFOhmyWTdxxtBygEtxpOfFd/rL+Tq5Qp1c22IvxaG/v1FRgn2uY
	 CVE5IGW7mN99dJtpqS6QvEaNi4fgeXK0xoFE9sYU0nPEX0jEpQjltyAb4doTVcZWjEBbd
	 xSMfV9xAovBoDyKVCSl1ig9BcPr44FIXfVz8Q11cT8uEzab5+G1wNkxHwTs2en6tBxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703958;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T3k78ZLZiyk9GODqNKVNMBZwgmj6EtW4p2/GpEyhS5k=;
	b=FaYPssEvORd8VoRC6wJDgiYXvcTtZwkcGFyHeABZogk1Wcf5pjjluke0khaBrhHXkvkM
	 XY4JZ/eXHf3woPgHHCvHoPV6xTB23RFcWEaYcyei4dUbeQs2gbdS/x11rBqPPUsY2RfzB
	 issZ+xQFGbccmL9w2MfxCHKkeDACIhnmXTsIk7s3unFoBVt2aarWX+YPRQ5KgzrOeDHpx
	 /nmr/Pl+NALxp48vCTIKEKOtHnhBZSnS90hA8ZdMIGOCcN1TQ27IbZaqIP/eQM7OXOHsv
	 9zoh/s6lYrTXT+k8GvXqhdU4Yf5euXrplVsUwX54HlmrAdrTuO3TSmSAt/2+TwNEK3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMy3VULZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4464606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMy3VULZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9631F031E6
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792703957;
	bh=T3k78ZLZiyk9GODqNKVNMBZwgmj6EtW4p2/GpEyhS5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kMy3VULZbphqL7iPhLqeTx9EzvhqrBamiLgDgRxnDyd6zjcCmSD9pbrfkXI30xug3
	 aCGhfOcfgFaDoQ6WVYtWXX0rdejPMfarVCwB2wITskPzS9ThqjLh/3CI8NykivzDCP
	 A7orY7/cfqZ8kTH+mso+HLDF5MZsbeVumfXf7meGF+HszLtws0513mMHeKJTEmqPWX
	 mhfE0Tw0OsoHfnbqIrefqYGyvgrq6oPbxjw+IVXJigzhN/IR55sFskm9YEQsKI7djl
	 gc4DGyskOK9x4ZS0zOP2Ez5tQb0TiA53xVl21dGFGUpvn2YsIjmau+9xxwz750TaV2
	 bl0ezCUwbd8qA==
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e503815adso22167885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwm+hUBPhZ1L4pyBsESkAaSYanMSgwIlu1AiTGlpUDMOZ0uGBf/mPpNRGG0klcABL4JrwtKH5jaE42zxWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlsBI6/L2vudIoUGuDtaNnTIvnIrLXJMK66+L9kCTdLhyy1PTx
	daEUmJkTV0EumsNaF0rea2Q4P0TeGFYo7G95vdecoXGBXC2zv4XI3Uj7Yf2l9yyeQcaxYq9BYyQ
	9V2NipuUJznYStWHSRXWmhfrnO4hVE18=
X-Received: by 2002:a05:620a:261e:b0:93f:2658:7e54 with SMTP id
 af79cd13be357-93f6f54d44emr122297585a.3.1792703956938; Thu, 22 Oct 2026
 14:19:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <0cbd219d-f69d-4f72-aec5-43e1f2d978de@linux.alibaba.com>
 <20261022102726.56682-1-baohua@kernel.org> <fc302ca3-6bf6-4bde-b3e8-8d2e93a4e4ac@linux.alibaba.com>
In-Reply-To: <fc302ca3-6bf6-4bde-b3e8-8d2e93a4e4ac@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 23 Oct 2026 05:19:05 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z9GZkpV+mpoGogma4oSX4cHy+2UDzyUQSjjOLOfekEPg@mail.gmail.com>
X-Gm-Features: AclHuK9j6Sq7bDCxc6TVPv0MaH-O7v3jJE353lVb3gr4xcVRJVBmmqL18xwlDFw
Message-ID: <CAGsJ_4z9GZkpV+mpoGogma4oSX4cHy+2UDzyUQSjjOLOfekEPg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache in MGLRU
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, baoquan.he@linux.dev, 
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, liuxiang.277@bytedance.com, 
	ljs@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 7:26=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
[...]

> >>                   }
> >>
> >>                   if (should_run_aging(lruvec, max_seq, sc, swappiness=
)) {
> >> -                       if (try_to_inc_max_seq(lruvec, max_seq,
> >> swappiness, false))
> >
> > This is quite tricky. If we pass swappiness=3D0, anon aging will be
> > skipped. Do we want that for GFP_NOIO cases? I mean, these are not
> > real cases where anon aging should be disabled.
>
> No, we have real use cases where 'vm_swappiness' is set to 0, which
> means the workload never reclaims anon folios. So in this case we don't
> need to age anon folios.

My concern is that setting swappiness to 0 for GFP_NOIO also skips
anon aging, making it behave the same as a real swappiness=3D0.
However, GFP_NOIO is only a temporary state, and subsequent
allocations may not use GFP_NOIO.

> > static int should_skip_vma(unsigned long start, unsigned long end, stru=
ct mm_walk *args)
> > {
> >          ...
> >          if (vma =3D=3D get_gate_vma(vma->vm_mm))
> >                  return true;
> >          ...
> > }
> >
> >> +                       bool force_anon_aging =3D is_force_anon_aging(=
sc,
> >> lruvec, swappiness);
> >
> > Adding a force_anon_aging argument to inc_max_seq() seems like
> > quite a burden. Maybe a cleaner approach is to pass sc all the
> > way to inc_max_seq() and let it detect GFP_NOIO cases itself?
>
> OK, still look good to me.
>
> > BTW, I guess we don't need to worry about swappiness at all. We can
> > simply bypass anon reclaim?
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index fc823fe3bd1f..fa6d9860156d 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4903,6 +4903,8 @@ static int scan_folios(unsigned long nr_to_scan, =
struct lruvec *lruvec,
> >       int skipped =3D 0;
> >       unsigned long remaining =3D nr_to_scan;
> >       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > +     struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> > +     struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> >
> >       VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
> >       VM_WARN_ON_ONCE(!list_empty(list));
> > @@ -4910,6 +4912,9 @@ static int scan_folios(unsigned long nr_to_scan, =
struct lruvec *lruvec,
> >       if (get_nr_gens(lruvec, type) =3D=3D MIN_NR_GENS)
> >               return 0;
> >
> > +     if (!type && reclaimable_anon_is_low(memcg, pgdat->node_id, sc))
> > +             return 0;
> > +
> >       gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
> >
> >       for (i =3D MAX_NR_ZONES; i > 0; i--) {
> > @@ -5164,12 +5169,19 @@ static int evict_folios(unsigned long nr_to_sca=
n, struct lruvec *lruvec,
> >   static bool should_run_aging(struct lruvec *lruvec, unsigned long max=
_seq,
> >                            struct scan_control *sc, int swappiness)
> >   {
> > +     struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> > +     struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> >       DEFINE_MIN_SEQ(lruvec);
> >
> >       /* have to run aging, since eviction is not possible anymore */
> >       if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS > max_se=
q)
> >               return true;
> >
> > +     /* run aging when GFP_NOIO limits anon reclaim with few swapcache=
 folios */
> > +     if (swappiness && min_seq[LRU_GEN_FILE] + MIN_NR_GENS > max_seq &=
&
> > +         reclaimable_anon_is_low(memcg, pgdat->node_id, sc))
> > +             return true;
>
> I've considered this, but we'd still need to add some code in
> get_nr_to_scan()/lruvec_is_sizable() to filter out the anon folios for
> GFP_NOIO case. Rather than spreading the logic across multiple places,
> I'd prefer adding a helper with proper comments to handle the aging
> issue, like the sample code I showed.
>

I'd rather we avoid hacking get_swappiness() any further, TBH.
MGLRU's get_swappiness() is quite weird, and CLRU doesn't have it.
I hope we can remove it someday and use the real swappiness
everywhere, while handling special cases based on system state,
just like CLRU does.

Best Regards
Barry

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E7B286881
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787807363; cv=none; b=i/WowE+8kwk38hiMu+AZw4t8qBefPhKpvSOya9zILEvMU1DQs33ZBAybeVA+0Ay7TDekmI2/S4OjKYkmJGfb+Qh3DmQOucccNUqMg4mbmggMgPfUeOPnLZ4hnFj0l1C3j9JPRWh/X+CYSs0OcFmxjGUMFNflqUXHpgk2CWx4Y0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787807363; c=relaxed/simple;
	bh=R36fq6dNcD/k8CYK5KPNMo9C7f+oqNyw42JvxcahlJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXCs/D2wWyrSErxSjdv0vHz9UGeDo+b0mK3Bs/Qu0F+CG0MMFynOs/7tICShbmzKdHLrBo14VvZXPRzyL//ft5NuY4oz/afxLHQq4A30nuQ6pqmwU11tV3Z5Was0Cx5M18t7CEAWG1wXqAzzWJxABhsfCwEoX36yo/KJq/xtlLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbDosI2g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbDosI2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D041F00ACA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787807361;
	bh=OIemAInrSQAqRGk6VU9YhZnzgdSHJsdHYZKk+J1gQ1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WbDosI2gb8m/mz5SS50+NCKseZM1oVAnz3JxUAH6CCRz7ue80sUB9wt6+rrFOKzSo
	 VqrgFcnGjnrXu5+wj2CxDo/vCHXUfhtPtDQjc4DJNI6+210+FCFMN1gnE/qUDI6GWe
	 SWto3HZqTlKQfuAevEf2YupkAbCp9oThy4y3F3UTiKqhYYpOC0ItKmU+7OVL8CbLKA
	 WSfzOSBDvo2aSTnBOVv0MGr1efxVhUXjzRtmgiSXtuALdOcevcs2AXimjY+1uDAm96
	 5MZOKE/rd8lktMKSatPzA7UuCERdYmVNEUTV/G6SIEPu6GMbCaPag6CwsqjPqGIon7
	 q7ENaKWyxrHBQ==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-930f618435cso112894785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:09:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rryhkdw+F1KuQ9ZKvnGcp2IfzVcMIpWo5iSFCGZfMInZ/6s6NqWF/+9XyP4Fcfn8cZdzWcbm3TtLbfaK2s=@vger.kernel.org
X-Gm-Message-State: AFuF++kxsk69d35PA9HSLvSACPpjj4KafCrvnqNsGSngVjoyKArTXM8h
	4lfBRt7+c0o4y/0G2Unvn6mKWqpN87P6hcZc/5imzVPUKDPh6qnPg0Fw3mVV/Pz6cLqjrchgz0u
	lBHahF2VXNm5LtHKgZzJeucxejXfYNY8=
X-Received: by 2002:a05:620a:5805:b0:936:bc78:791b with SMTP id
 af79cd13be357-9378016fc29mr1040773985a.15.1787807360659; Wed, 26 Aug 2026
 22:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821102538.22642-1-baohua@kernel.org> <20260821102538.22642-3-baohua@kernel.org>
 <ao6tlwWNN1MH29w7@fedora>
In-Reply-To: <ao6tlwWNN1MH29w7@fedora>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 13:09:09 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zFRy8qMCSnxy7PnagBnh6eXCPXnaJs0=yT1Q2t-6w+gg@mail.gmail.com>
X-Gm-Features: AcwNN1UnPSDJP9kKhtNpolLcjcslgDDP1kSy4F-YbS4025-D83rNQERov2iLCrA
Message-ID: <CAGsJ_4zFRy8qMCSnxy7PnagBnh6eXCPXnaJs0=yT1Q2t-6w+gg@mail.gmail.com>
Subject: Re: [PATCH 2/6] mm/mglru: batch update lrugen->protected in inc_min_seq()
To: Baoquan He <baoquan.he@linux.dev>, Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 5:10=E2=80=AFPM Baoquan He <baoquan.he@linux.dev> w=
rote:
>
> On 08/21/26 at 06:25pm, Barry Song (Xiaomi) wrote:
> > Avoid updating lrugen->protected with WRITE_ONCE() for each folio,
> > which may prevent potential compiler optimizations. Accumulate the
> > updates locally and apply them in a batch instead.
>
> Wondering how much efficiency this can bring, is there a number for this
> standalone patch?

This is a good question. I reverted the protection batching to check its
impact:

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 996b48344ed0..c9a2fd9ad844 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3957,7 +3957,7 @@ static bool inc_min_seq(struct lruvec *lruvec,
int type, int swappiness)
        for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
                struct list_head *target_list =3D
&lrugen->folios[target_gen][type][zone];
                struct list_head *head =3D &lrugen->folios[old_gen][type][z=
one];
-               unsigned long protected[MAX_NR_TIERS] =3D {}, delta =3D 0;
+               unsigned long delta =3D 0;
                struct list_head *pos =3D head->next;
                struct list_head *batch_end =3D NULL;

@@ -3984,7 +3984,8 @@ static bool inc_min_seq(struct lruvec *lruvec,
int type, int swappiness)
                                if (refs + workingset !=3D
BIT(LRU_REFS_WIDTH) + 1) {
                                        int tier =3D
lru_tier_from_refs(refs, workingset);

-                                       protected[tier] +=3D nr_pages;
+
WRITE_ONCE(lrugen->protected[hist][type][tier],
+
lrugen->protected[hist][type][tier] + nr_pages);
                                }
                        } else {
                                flush_lru_batch(head, &batch_end, target_li=
st);
@@ -3999,9 +4000,6 @@ static bool inc_min_seq(struct lruvec *lruvec,
int type, int swappiness)
                           lrugen->nr_pages[old_gen][type][zone] - delta);
                WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
                           lrugen->nr_pages[target_gen][type][zone] + delta=
);
-               for (int tier =3D 0; tier < MAX_NR_TIERS; tier++)
-                       WRITE_ONCE(lrugen->protected[hist][type][tier],
-                                  lrugen->protected[hist][type][tier]
+ protected[tier]);
                if (!remaining)
                        return false;
        }


And I see:

With protection batching:

Running scope as unit: agetest.scope
mmap: 0x7c4b1d200000, size: 512 MB
memcg: 12893 (/system.slice/agetest.scope)
aging generation 3 -> 103
gen   3:    7.538 ms
gen   4:    0.937 ms
gen   5:    2.348 ms
gen   6:    2.300 ms
gen   7:    2.302 ms
gen   8:    2.294 ms
gen   9:    2.296 ms
...
gen 100:    2.292 ms
gen 101:    2.307 ms
gen 102:    2.293 ms
gen 103:    2.293 ms

Total:   235.718 ms
Average: 2.334 ms

Without protection batching:

Running scope as unit: agetest.scope
mmap: 0x775682e00000, size: 512 MB
memcg: 12823 (/system.slice/agetest.scope)
aging generation 3 -> 103
gen   3:    7.542 ms
gen   4:    0.948 ms
gen   5:    2.338 ms
...
gen 101:    2.340 ms
gen 102:    2.342 ms
gen 103:    2.347 ms

Total:   240.505 ms
Average: 2.381 ms

It=E2=80=99s 2.334 vs. 2.381, which is really minor.

I=E2=80=99m curious to see what the data looks like on ARM. If there=E2=80=
=99s no
significant difference, we may drop this patch in v2 to reduce the amount
of code change.

Xueyuan, since you=E2=80=99ve been testing this patchset on ARM[1], would y=
ou mind
checking this on ARM as well?

[1] https://lore.kernel.org/linux-mm/20260827035416.3012015-1-xueyuan.chen2=
1@gmail.com/

>
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  mm/vmscan.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 0d74fc00abd3..99ee3c833d54 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3931,7 +3931,7 @@ static bool inc_min_seq(struct lruvec *lruvec, in=
t type, int swappiness)
> >       /* prevent cold/hot inversion if the type is evictable */
> >       for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> >               struct list_head *head =3D &lrugen->folios[old_gen][type]=
[zone];
> > -             unsigned long delta =3D 0;
> > +             unsigned long protected[MAX_NR_TIERS] =3D {}, delta =3D 0=
;
> >
> >               while (!list_empty(head)) {
> >                       struct folio *folio =3D lru_to_folio(head);
> > @@ -3953,8 +3953,7 @@ static bool inc_min_seq(struct lruvec *lruvec, in=
t type, int swappiness)
> >                       if (refs + workingset !=3D BIT(LRU_REFS_WIDTH) + =
1) {
> >                               int tier =3D lru_tier_from_refs(refs, wor=
kingset);
> >
> > -                             WRITE_ONCE(lrugen->protected[hist][type][=
tier],
> > -                                        lrugen->protected[hist][type][=
tier] + nr_pages);
> > +                             protected[tier] +=3D nr_pages;
> >                       }
> >
> >                       if (!--remaining)
> > @@ -3964,6 +3963,9 @@ static bool inc_min_seq(struct lruvec *lruvec, in=
t type, int swappiness)
> >                          lrugen->nr_pages[old_gen][type][zone] - delta)=
;
> >               WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
> >                          lrugen->nr_pages[target_gen][type][zone] + del=
ta);
> > +             for (int tier =3D 0; tier < MAX_NR_TIERS; tier++)
> > +                     WRITE_ONCE(lrugen->protected[hist][type][tier],
> > +                                lrugen->protected[hist][type][tier] + =
protected[tier]);
> >               if (!remaining)
> >                       return false;
> >       }
> > --
> > 2.34.1
> >

Thanks
Barry

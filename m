Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB084483A0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832886; cv=pass; b=Qs9hB2DfmNVOE+yy8h3E955PFPrF/egP3o8mX/sMjMQ0ZE7DVEuogOlDs1QPboa8IlOx7BEHHBdcEXMnTM0YUhQ7hHPcoJZlKOHPNEsTVbZwHBXQhSFqiF0HTkHrYQ1Phmum1LfYJJTiS1ip63TFisBe4NOkhU5/AZNk5m9ff34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832886; c=relaxed/simple;
	bh=JPOmQzptiv2r8Gwtr2vS36y8xBGe+JnQRVsOz7zKDFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBcbcVDYS5oC7ZbziY8/Fbjk8wueEvEqnumH7k0Q06fuoOSggCwPOJLrd1k70M0flB+CWwmXRv+fmtPX/e0kw0b34VXC7hF7xDleS+jhOnlse4EKfyV+4BqBrNRefSg6dzXY7G+erX7Cc3XPmXWs8eDxAbWWbY3KNKsV0zX7AhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFGWSPFU; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFGWSPFU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46f88060e8dso213438f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787832882; cv=none;
        d=google.com; s=arc-20260327;
        b=CZkel7AnreeQtHFnm/gZ+LlREBxWlsA0+AR0UK0RqbRLIiEExQFW0/JaOuLKBN/rhr
         lXfVKwAp6boyr+aTVgCxKdTx2VcK+FRUMcONHzKftp+HHvWLg0cx68JyhEbLv8dclC3V
         eRLgPgm9uti0v17rzn69tZG7X6oYKygtjhZ/lCgwYgIq4ZLvc2ProHTlZhG2oMWCLCd8
         WDWDaEPodrP315S7QpV/kwueADRyESeiwt0gy2R0KN7aP81VOceRFClPB8vUz9nL1bsO
         EvAWStHqiRDHHOHQ/h5ZZL1OctlzD4lSQGzZK6C+kepFfj63ypDsH53Rz5FIrUVUNAES
         Y/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kSHnkXRfsNN4v3AaspGwGv41RH5tRYCNnIdkFoLAWqM=;
        fh=dNcVhROcv3XfxFwWmu6WKqOQve0uAhSnBEkLOCs8c5A=;
        b=WQnRsCQOnHGxKJVLu/ZzdOcQL/Ly52PIEbD5VhSed+u3uPM1hYlZToI8ZstQsGTELQ
         pJTYYrLtMcM+bakAxdub3VmbTgx/0FCfOo4weEIoAZvteVH37OKLh31n0k3I1FriztbV
         I9PuiDSJhcaIHZzAfwnNGqAeYWCbDSD1q+rqFnNcxrnxgRD+hnUGWpFt7TtGzY2FbS9r
         cqw6DnPugGthkW3aoP7Un7YwGeooJmauUQvMdmgyQFqjYa/MN5VlK0oZTo/699xaeGOp
         EfyNftG5rL23QYd+a2PxllMTUjjUy0jUT1amfgS3FSBGyF5hh2QqyBLcPeeBygylyiId
         8gRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787832882; x=1788437682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kSHnkXRfsNN4v3AaspGwGv41RH5tRYCNnIdkFoLAWqM=;
        b=CFGWSPFUtNpX9qlvbuP+slAXt2AnP/pwhMII/hCDEXe4iNoORB1RQPZ6k/bvx8AUzu
         I8wM3Bj3OXwIGeMD1m672V589MZgIelC0KOIvH1HnI7ltStp572idg2Nk4FNUCoJrB2y
         W9BOdsKMvhpMmoz2bIoJ6nQYcjDEOtR5DjjrNqKwx7jYFK0aOQpFZrrB0Y9cFDpNZkUh
         PPdG4Yy8ynnBNF5rR+whmuNGT/0pcLaXUhc6pk8ykmrYTlqvXTKGBVFrXXuuRxK5r8h2
         3IYO+RFrWTFaRoaZQmcFTtcmDgPrIXDvdW67h+/fkBIuOJIpt5+OlZv334Bdxwm688zr
         NMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787832882; x=1788437682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSHnkXRfsNN4v3AaspGwGv41RH5tRYCNnIdkFoLAWqM=;
        b=BBwOU/ouIPRaeOkB+er4ZaIAVFfVasAk1eBLC0tiMilZWB2Y0rc7zYQczHKf/UVdra
         /A2tNzwBGzyKBV8bWHNOEtK9IJiu/yoXuSfsE6e2DP3v5hWrggguznqokwHFOrEa8aVE
         ddWohXU6+Bja+zaoIEtyQiBVFDtA8tr5WHynDFGFAMmoEC27ECH6Q3Sdq9KoYaxdqZg+
         cjTRcXcDHkqHHGeGBlBf7jnXUuB3zzdKOGyzpxeJcitjqTnSujKUbK547140kCaL4S/o
         JS1QPDUeIaMVh03YuYtZPMhzpc0xSYuU9i3/kWvcbHEL6x8o5WhU8Qc9/BFJS3I0lo91
         SmtA==
X-Forwarded-Encrypted: i=1; AHgh+RqsU63/VmahPLm78xpj+yE05weq5dwExLzJYIc9pvdUYxsyw19o41dfrGc0z4lPtWcDSC3CHh+vbtquxEI=@vger.kernel.org
X-Gm-Message-State: AFuF++nkVFXuUHUCCEcOJPsy9dVOwnsWD4jbqHoUVZe3LnQFDYZdPXtP
	2WDiBNe/J2goZSgyKivStZOAfocc0axGYifNtc/ullqd8GUa0c2xGQrUh2i+8djAJyAlrJQDUt7
	9fjfRJG1Vb+kAre8D+1iBrBLIqHq/3wQ=
X-Gm-Gg: AR+sD12+8oOO0Q20nTiGlRgEyUAwt0/5NoYOIr22m2yM14N1Dp4e70Sel9zDyJqr4UT
	Q/c9F1Cn9bxgiUqMmpIsQ2t5Tvvcg14kkt8L55il88GpkPRyyw1t8x7gX0PPZ7bY8IkwTUanLTn
	vvLoiY7bRre2Tysww7gjnK9UW8PrrGCskUawkwMqXxvQA5nNFoXGDkoVzg1/kxOAOgIjFP02q3N
	/1tVxCN5Vt/HkNONYPsAtuL/6nu4KEoTTylPsBkQWtBbScNsUl2nETailY/ichNLGBBrGIFtigk
	som5AiQEwrDZXmMndU/KBqrer68cRABSbvArU4Uio6OB5rd+XrpK+IT2v6EDGpaiOepy2X6IGyx
	4hZgpA2vQiNpXm7Qw49u/7qSGAUQIuw==
X-Received: by 2002:a05:6000:2886:b0:482:e0f3:462c with SMTP id
 ffacd0b85a97d-482ea41019amr5782070f8f.0.1787832881912; Thu, 27 Aug 2026
 05:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821102538.22642-1-baohua@kernel.org> <20260821102538.22642-3-baohua@kernel.org>
 <ao6tlwWNN1MH29w7@fedora> <CAGsJ_4zFRy8qMCSnxy7PnagBnh6eXCPXnaJs0=yT1Q2t-6w+gg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zFRy8qMCSnxy7PnagBnh6eXCPXnaJs0=yT1Q2t-6w+gg@mail.gmail.com>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Thu, 27 Aug 2026 20:14:30 +0800
X-Gm-Features: AcwNN1VRDxQaMXGFlxpnlAsgE-z-Y_QLiiw6wTyrR2PnAK37aHbhASYXKu3N9ng
Message-ID: <CA+qSx6xY5cym5oSLrvmHyc9zuUB2TToFbDRgSOM8gXUG=1HWxw@mail.gmail.com>
Subject: Re: [PATCH 2/6] mm/mglru: batch update lrugen->protected in inc_min_seq()
To: Barry Song <baohua@kernel.org>
Cc: Baoquan He <baoquan.he@linux.dev>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, 
	chenridong@xiaomi.com, david@kernel.org, hannes@cmpxchg.org, 
	kasong@tencent.com, lianux.mm@gmail.com, linux-kernel@vger.kernel.org, 
	ljs@kernel.org, lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 1:09=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Wed, Aug 26, 2026 at 5:10=E2=80=AFPM Baoquan He <baoquan.he@linux.dev>=
 wrote:
> >
> > On 08/21/26 at 06:25pm, Barry Song (Xiaomi) wrote:
> > > Avoid updating lrugen->protected with WRITE_ONCE() for each folio,
> > > which may prevent potential compiler optimizations. Accumulate the
> > > updates locally and apply them in a batch instead.
> >
> > Wondering how much efficiency this can bring, is there a number for thi=
s
> > standalone patch?
>
> This is a good question. I reverted the protection batching to check its
> impact:
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 996b48344ed0..c9a2fd9ad844 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3957,7 +3957,7 @@ static bool inc_min_seq(struct lruvec *lruvec,
> int type, int swappiness)
>         for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
>                 struct list_head *target_list =3D
> &lrugen->folios[target_gen][type][zone];
>                 struct list_head *head =3D &lrugen->folios[old_gen][type]=
[zone];
> -               unsigned long protected[MAX_NR_TIERS] =3D {}, delta =3D 0=
;
> +               unsigned long delta =3D 0;
>                 struct list_head *pos =3D head->next;
>                 struct list_head *batch_end =3D NULL;
>
> @@ -3984,7 +3984,8 @@ static bool inc_min_seq(struct lruvec *lruvec,
> int type, int swappiness)
>                                 if (refs + workingset !=3D
> BIT(LRU_REFS_WIDTH) + 1) {
>                                         int tier =3D
> lru_tier_from_refs(refs, workingset);
>
> -                                       protected[tier] +=3D nr_pages;
> +
> WRITE_ONCE(lrugen->protected[hist][type][tier],
> +
> lrugen->protected[hist][type][tier] + nr_pages);
>                                 }
>                         } else {
>                                 flush_lru_batch(head, &batch_end, target_=
list);
> @@ -3999,9 +4000,6 @@ static bool inc_min_seq(struct lruvec *lruvec,
> int type, int swappiness)
>                            lrugen->nr_pages[old_gen][type][zone] - delta)=
;
>                 WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
>                            lrugen->nr_pages[target_gen][type][zone] + del=
ta);
> -               for (int tier =3D 0; tier < MAX_NR_TIERS; tier++)
> -                       WRITE_ONCE(lrugen->protected[hist][type][tier],
> -                                  lrugen->protected[hist][type][tier]
> + protected[tier]);
>                 if (!remaining)
>                         return false;
>         }
>
>
> And I see:
>
> With protection batching:
>
> Running scope as unit: agetest.scope
> mmap: 0x7c4b1d200000, size: 512 MB
> memcg: 12893 (/system.slice/agetest.scope)
> aging generation 3 -> 103
> gen   3:    7.538 ms
> gen   4:    0.937 ms
> gen   5:    2.348 ms
> gen   6:    2.300 ms
> gen   7:    2.302 ms
> gen   8:    2.294 ms
> gen   9:    2.296 ms
> ...
> gen 100:    2.292 ms
> gen 101:    2.307 ms
> gen 102:    2.293 ms
> gen 103:    2.293 ms
>
> Total:   235.718 ms
> Average: 2.334 ms
>
> Without protection batching:
>
> Running scope as unit: agetest.scope
> mmap: 0x775682e00000, size: 512 MB
> memcg: 12823 (/system.slice/agetest.scope)
> aging generation 3 -> 103
> gen   3:    7.542 ms
> gen   4:    0.948 ms
> gen   5:    2.338 ms
> ...
> gen 101:    2.340 ms
> gen 102:    2.342 ms
> gen 103:    2.347 ms
>
> Total:   240.505 ms
> Average: 2.381 ms
>
> It=E2=80=99s 2.334 vs. 2.381, which is really minor.
>
> I=E2=80=99m curious to see what the data looks like on ARM. If there=E2=
=80=99s no
> significant difference, we may drop this patch in v2 to reduce the amount
> of code change.
>
> Xueyuan, since you=E2=80=99ve been testing this patchset on ARM[1], would=
 you mind
> checking this on ARM as well?
>

Hi Barry,

I reverted patch 2 and ran the test again on arm64, with THP=3Dnever
like yours:

  full series:  2.964 ms
  w/o patch 2:  2.996 ms

So it's 2.964 vs. 2.996, about 1.1% here too. Consistent with your
x86 data.

Thanks,
Xueyuan

> [1] https://lore.kernel.org/linux-mm/20260827035416.3012015-1-xueyuan.che=
n21@gmail.com/
>
> >
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > ---
> > >  mm/vmscan.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index 0d74fc00abd3..99ee3c833d54 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -3931,7 +3931,7 @@ static bool inc_min_seq(struct lruvec *lruvec, =
int type, int swappiness)
> > >       /* prevent cold/hot inversion if the type is evictable */
> > >       for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> > >               struct list_head *head =3D &lrugen->folios[old_gen][typ=
e][zone];
> > > -             unsigned long delta =3D 0;
> > > +             unsigned long protected[MAX_NR_TIERS] =3D {}, delta =3D=
 0;
> > >
> > >               while (!list_empty(head)) {
> > >                       struct folio *folio =3D lru_to_folio(head);
> > > @@ -3953,8 +3953,7 @@ static bool inc_min_seq(struct lruvec *lruvec, =
int type, int swappiness)
> > >                       if (refs + workingset !=3D BIT(LRU_REFS_WIDTH) =
+ 1) {
> > >                               int tier =3D lru_tier_from_refs(refs, w=
orkingset);
> > >
> > > -                             WRITE_ONCE(lrugen->protected[hist][type=
][tier],
> > > -                                        lrugen->protected[hist][type=
][tier] + nr_pages);
> > > +                             protected[tier] +=3D nr_pages;
> > >                       }
> > >
> > >                       if (!--remaining)
> > > @@ -3964,6 +3963,9 @@ static bool inc_min_seq(struct lruvec *lruvec, =
int type, int swappiness)
> > >                          lrugen->nr_pages[old_gen][type][zone] - delt=
a);
> > >               WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
> > >                          lrugen->nr_pages[target_gen][type][zone] + d=
elta);
> > > +             for (int tier =3D 0; tier < MAX_NR_TIERS; tier++)
> > > +                     WRITE_ONCE(lrugen->protected[hist][type][tier],
> > > +                                lrugen->protected[hist][type][tier] =
+ protected[tier]);
> > >               if (!remaining)
> > >                       return false;
> > >       }
> > > --
> > > 2.34.1
> > >
>
> Thanks
> Barry

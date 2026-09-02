Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81C412BEF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340852; cv=none; b=LvNoNHXjN7QFhnJHfk5JPF6D6c/aVG4aDGG/C75qY02+zMt+ACzEJU1skfYaSWZQtDSm1r1FRuD6nXaSKCiI0QMqZwNPSt6yKY091ZGcoA4xkerxpBVmuoRCYOPTF981e5hR621PxBOw3yyQuNOeyhyT+BkyY6gWILGI9sfzek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340852; c=relaxed/simple;
	bh=/P1WQTkNhVN0plDpUn49dAdB7JFE1Q5DIvi3Eh6uQb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UO3ETocrR8Au2FWDIoPAB8XHBITpKiHGp8JRJWaFzrF9XSOfbDuGz6CDMr29icZ5epSOlRlrg/KytthvtazNTo/eKMDUdX6N4Xs5sKz52N79lt+T8FLrNLZXfexQMqH/KUN1+taZpOP7Hct/VeOiTUVts/mOjM6zxa5sk8bxCNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwV5QY27; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwV5QY27"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908021F000E9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788340850;
	bh=0GXUAHFg7dowH6ZuhPVHAPwiDJHgaYFq0oMVg2SQ370=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lwV5QY27UhR/tSkb5eGWMr0ToHrmUSSxFjNOPCr25W2O6D7VUYDsjvy5ZctApjFzn
	 Cl9BizU9aN/fsS3sDgrHut+ZR7nuQX15LQc+vmdd51Vn+Mg1ne+P0VuhMI4fUKuQN3
	 O13A6z5zsKgOVNrhlYAHPND3C0MOdwPkXic/fAQUPHEo74I5T0/mryCFnNyblrr2GI
	 h7beybzYBqXpBNHcvBlZNTaUCxXxNAFEjTV4pct4OMU2DYdrSNrClRzusY0eiFPw6Z
	 VCU5lZH79KFZBYYi0IyJlFVgOhBbsK0cycjOO0di2txzLnFP5jXrkgkDCWAF+7Q58z
	 by94WptVImw7Q==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92edb12cdf2so76126185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:20:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rog7SfmE/vsf+aCeqjsN+2U5e25bEXncGIcldmG8XYstIIbUtUqJxTa6ZcpXh3Lgu5GmFX6xO3f/WdmLr4=@vger.kernel.org
X-Gm-Message-State: AFuF++m6MXSbGY3j+yuagqJWbtmCbKrSW3qIn+tYRP51M3cN0cNNrGD/
	yRQhJWPTa77DbA7+yuT+P9ZyJAZ0A3nYomuQkL2MRMtxsl0xoe0I/OAw4BetlQETf7T67qQkpXF
	ZP/9KU/mjKNw55kJGnDiY7POMpOd+urs=
X-Received: by 2002:a05:620a:6a87:b0:92e:6637:da3 with SMTP id
 af79cd13be357-93960fd096cmr375837085a.38.1788340849834; Wed, 02 Sep 2026
 02:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829074204.45304-1-baohua@kernel.org> <20260829074204.45304-3-baohua@kernel.org>
 <apfZQE1X6zGAsBb_@fedora>
In-Reply-To: <apfZQE1X6zGAsBb_@fedora>
From: Barry Song <baohua@kernel.org>
Date: Wed, 2 Sep 2026 17:20:38 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z=A3EGajzL8F5H+0fwyzh3qqMNACEzo20J83m+T8bbZw@mail.gmail.com>
X-Gm-Features: AcwNN1Uu2xlu8wqm8VQe819Z992ew7Xryu4VEWNd4-KDRJbEJpXorv82ZqYnFI4
Message-ID: <CAGsJ_4z=A3EGajzL8F5H+0fwyzh3qqMNACEzo20J83m+T8bbZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/mglru: make retry logic explicit in isolate_folios()
To: Baoquan He <baoquan.he@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 4:07=E2=80=AFPM Baoquan He <baoquan.he@linux.dev> wr=
ote:
>
> Hi Barry,
>
> On 08/29/26 at 03:42pm, Barry Song (Xiaomi) wrote:
> > The existing mainline code retries the same type once in a rather
> > subtle way. `for_each_evictable_type()` may provide one more iteration,
> > allowing the same type to be retried if we scanned some folios but
> > failed to isolate any due to protections, promotions, or races. This
> > patch makes the retry behavior explicit.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  mm/vmscan.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 35a233623368..718f59ffc688 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4852,6 +4852,7 @@ static int isolate_folios(unsigned long nr_to_sca=
n, struct lruvec *lruvec,
> >       bool type_fallback_allowed =3D !is_single_type_reclaim(swappiness=
);
> >       int type =3D get_type_to_scan(lruvec, swappiness);
> >       int total_scanned =3D 0, scanned, tier;
> > +     bool tried =3D false;
> >
> >  retry:
> >       tier =3D get_tier_idx(lruvec, type);
> > @@ -4871,9 +4872,18 @@ static int isolate_folios(unsigned long nr_to_sc=
an, struct lruvec *lruvec,
> >        */
> >       if (!scanned && type_fallback_allowed) {
> >               type =3D !type;
> > +             tried =3D true;
> >               type_fallback_allowed =3D false;
> >               goto retry;
> >       }
> > +     /*
> > +      * We scanned some folios but failed to isolate any due to promot=
ions,
> > +      * protections, or races. Retry once to avoid a larger loop.
> > +      */
> > +     if (scanned && !tried) {
> > +             tried =3D true;
> > +             goto retry;
>
> Seems patch 1 and 2 makes not minor difference than mainline kernel on
> behaviour.
>
> 1, if swappiness is 0 because no swap, it will run two times if
> (scanned !=3D 0). This is not corner case, but usually seen on some
> systems w/o swap device. The 2nd no gain run could decrease efficiency.
>
> static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
> {
>         ...
>
>         if (!sc->may_swap)
>                 return 0;
>         ...
> }

Yep. For swappiness 0 and 201, this patch slightly changes the
behavior, as I mentioned in the cover letter:
"
 There is a slight functional change for 0 and 201: with the existing
 code, there is no chance to retry for these values because
 `for_each_evictable_type()` only iterates once. After this patch, 0 and
 201 have behavior that is more consistent with the 1-200 range.
"
I did this intentionally, as it makes the behavior more consistent with
the 1-200 range, where we retry the same type once to avoid having a
larger outer loop.

>
> 2, for swappiness (0, 200), the behavious is minor changed.

I guess you actually mean swappiness (1, 200)?

>
> Mark one scan_folios() result as one of:
>       iso     *isolated > 0
>       empty   scanned =3D=3D 0 && !*isolated
>       busy    scanned > 0  && !*isolated
>
> mainline:  T(busy) -> T(empty)         -> return   (2 scans, no fallback)
> v2:        T(busy) -> T(empty) -> !T(...)        (a 3rd scan_folios())
>
> Maybe we can go like below:

Yes, you're right. For swappiness (1, 200), I didn't realize there was
this slight change.

>
> static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec=
,
>                           struct scan_control *sc, int swappiness,
>                           struct list_head *list, int *isolated,
>                           int *isolate_type, int *isolate_scanned)
>         ...
>
>       for (attempt =3D 0; attempt < 2; attempt++) {
>               int scanned =3D scan_folios(nr_to_scan, lruvec, sc, type,
>                                         get_tier_idx(lruvec, type), list,=
 isolated);
>
>               total_scanned +=3D scanned;
>               if (*isolated) {
>                       *isolate_type =3D type;
>                       *isolate_scanned =3D scanned;
>                       return total_scanned;
>               }
>               if (attempt)                /* already retried / fell back =
once */
>                       break;

This `if (attempt) break` makes the loop look rather strange,
especially for a loop with a maximum of 2 iterations, where we break
when `attempt` reaches 1 :-)

What about just changing one line?

diff --git a/mm/vmscan.c b/mm/vmscan.c
index bf2786c7247d..ba7adf36e69f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4939,7 +4939,7 @@ static int isolate_folios(unsigned long
nr_to_scan, struct lruvec *lruvec,
         * We are running out of the current reclaim type. Fall back to
         * the other type if allowed.
         */
-       if (!scanned && type_fallback_allowed) {
+       if (!scanned && !tried && type_fallback_allowed) {
                type =3D !type;
                tried =3D true;
                type_fallback_allowed =3D false;

>               if (scanned)
>                       continue;           /* retry the same type once */
>               if (single_type)
>                       break;              /* no fallback for 0 / anon-onl=
y */
>               type =3D !type;               /* empty: fall back to the ot=
her type */
>       }
>
>       return total_scanned;
> }
>
> This preserves mainline for 1..200 exactly, keeps the intended 0/201

I guess you mean removing the same-type retry for swappiness 0/201,
rather than keeping it?

Thanks
Barry

Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AB449F13A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143470; cv=pass; b=bdfGnuiyM/AmUtFo5ZxmGt1RAXRKhCjsT80epad2I1tm/1tq0WHXGvNJ67zb9vp1Cey8KTowJZHjbnpwB0dQkmWBwR0e1y0F+RMN3e1mpiK9qMzCFn6wNdDpifsYqFseygf15Kky5rIIQBIm0D3BhsyisZmDc+cDt/uY/U3I9/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143470; c=relaxed/simple;
	bh=d2NARwSM5CujWWz4RVSNUlwfPrsmtXGPc2+2aQs4Q6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PbjOWG5zt1nxamrtvjZ8nlq8uQU9OzYw+54KHWKdYBYhO8uJ12hWkr+8uy3L6WHa9lwJbRIf5PPHx5MV6iFaFAKsMw3fFaxKSbPiOAFPIEbPcSDMNhJ8OplKEq0piJz0uRuUTSnVURDMzL7IWgQqtSaeMat5sp93w6Q16b/GYGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQk7VRtF; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQk7VRtF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b965570d7so13721805e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789143466; cv=none;
        d=google.com; s=arc-20260327;
        b=l6Q2pvB+roZtayF9B7mzD+ijdDR0XysVH2L+DVs9U+6sI+OcHM07j+iSjeH31QfazC
         LRolAWdK8uqZylAT68xOLQO1im7oSkk21G4+juQsf1nfSOTz75dIvYH80KoGHLmVQbMC
         ahLOAdZPY2MwDmpPtIH6MzNrKT5q6OUCFsLB8vEZOt2inec9mxrRRWfBbR7KrV5j1dCJ
         2ynvdpdQIr4FPvmdU79Lyao5q+R+TVNXS18ukCkm6is3GxmF6hW3bnw+9Dg97QoCQMsk
         HRbaYBEhGdll/MzxdNQ2yUexdmddRyMdArCqXu73QEsCGdp+0A/ilRKBoRY8irkF3hXT
         w56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u3B3jIY9BMAO73EjPySXApoH4dZwYFyO5LCD/ae6l1A=;
        fh=tJJDedOyMq1PK/Pm8X6mWy3iBGRXVXoJogQjr0+/cnk=;
        b=H9SUGlFkcQZ6YmIFxCkNvEl10Uq75cedwqp5I7td8BYXRt3Ho/4FdhKKjVxLW23qN6
         mtCGPgiB1y1lu1pEUc9273S5o7g3KeY9hSU7MSXltTrf7q4l8yi8qng78V8FrLY8gF96
         LtJO6BgSt2Kc304Z5q16icBB6vUNkVAuuZGk0VtiqbG1cDqphOOvz52DtbyOCrnP/m3J
         SjA1PV1yO6UaqegBnTYn/9xNNpB70Fyi6I6gxCvmfFaoN25MpxTO/N6dzJ1DkJ0pPAuY
         sluxoOK7CqDgwZPF0SaNHrk7uibubvh3hfqq9J51yCxQggpa0DliRI9skFHGxM8Q7yws
         A3cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789143466; x=1789748266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3B3jIY9BMAO73EjPySXApoH4dZwYFyO5LCD/ae6l1A=;
        b=MQk7VRtFSeHrBIkGZpWkjvrncaTVZvzN0RWJuZdifI2K3Y5NtnPd5Jd3nRWbOKW1ow
         9/GdIdiRKzBY3VgUUFIAeDEatuYu7MOQ/YOPaMICts7llPmLU3N9I8zz7s3Sla9iiJoy
         hFXk5c2VWdwnTbD+C2xCQKOLw31NvKZWIPbZZxcpl0OnWqaba9eob6SZjRqL9vg97uKG
         n3vNrF4vw0YbdgGFBROwczLcrZQSkCq5ljvZl1Vk3SdKBHzy07D7SLdmykNWQrbDW/NH
         HXukQtX+s5PHkfGTCIOorLUAK1/SgO2jw9WAjFm+KVCLbVZUAfs3KggQV1zi5LCkpF2n
         61DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143466; x=1789748266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3B3jIY9BMAO73EjPySXApoH4dZwYFyO5LCD/ae6l1A=;
        b=kNMh18DgvltmcVsRC+9pakEqBlkcCpK3/VSWPkh/14i1Rh5j2fs5y3Xastod70H1iC
         GVOyGTikRvGcK/0PVrDEPgsK77aPEGgUjNeS3zN3j15uS6lCWM9Opx3eg7oA8kVWvbE7
         opgLcAHSSAVtrJLbnLyfi3YzgIJ681H/OHmH4X/6tym44cajCMh4qslkPGKYx/Teyp+G
         Ec2vXDKIyajtMK8X9s1l1xpj+3Ywa6u+SeIn3zq6Ray1lbUMDVNrRXM0GrSKBUHaGt8n
         HlqtvDjyqvNznhPq8bJBTFfq7oU8hxQCnEwGTAhXpvvFjAkP+edl5lpSUpLFsrihHb9z
         qDoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCxinKU/7Z7q2TEYSHIk59q2gSkEvak7LeD4Ajly/zIdsCyPBrlvzAx72JRdyX1FAmWEi6RD9IYcCWNA4=@vger.kernel.org
X-Gm-Message-State: AFuF++kC4NGtHKTmED5Q1rfrYLSvLSoJJJFxnsXjFnvmO78v4lksQ8Hw
	gwWP9QveqJYS+Aact4yV2K5z00uA03MzBcBJQCrSVDn1uwthIPqcFRqJAcGo9pxrU8cpmTnZRFe
	98qXZb/eiOE9I5QJdOZeUykN0m/pJemQ=
X-Gm-Gg: AYBFou12QkA2kw5vRRrhcZcYBjA3wmR3CTUQGZujVaTlxNQ4GPN/r8smSbQlB9OZy5V
	A3KigIxPD3oPHjyAdncMOZDwommllDwbGOce/AcT2rWSyXmSd2HkPHEyzbkypZLc0QA6qaw2+ls
	qvhlgrIvwHBNc7DBlg0z5EbVZp6qxSS501EExb//XEE8PU29/rHckf5Ojx1KnOAJ8blHugGZ/4o
	CbVAXL6CWf4dM+1nexeOyIpRIigefv2k2AfNaM5+WnNZDQF2ROvH2mlvWwynKkG9elDcmXiIkO0
	v9UKv/gqom6gg4EelHcVKOnDJlThX7T2Ykvt3ZdlOaFCOlhaulL4WPpGi7AeCSiId+v6G8aIsOx
	wF1KDjpPljeAn
X-Received: by 2002:a05:600c:4fd4:b0:49d:462:6eda with SMTP id
 5b1f17b1804b1-49e619d1ff0mr51367345e9.28.1789143465554; Fri, 11 Sep 2026
 09:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <35d6d803-41d9-48d6-a8d0-b8d0f6f67efd@paulmck-laptop>
 <20260909030253.2430897-1-kunwu.chan@gmail.com> <e5b02d91-feb6-4dd7-b67e-8faaa662a610@paulmck-laptop>
In-Reply-To: <e5b02d91-feb6-4dd7-b67e-8faaa662a610@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 12 Sep 2026 00:17:31 +0800
X-Gm-Features: AcwNN1UivAboB_X_FFkAi7v_7v2lCZi4Gop_-JJ3SFIKGoWYCFPJMHz09G1Rd2c
Message-ID: <CAN_Opa-nwU8TWLmGTLuOH0zYnxGVsWdTUrK29M9MfVhxJBYL4Q@mail.gmail.com>
Subject: Re: [PATCH 01/13] litmus: Add SRCU fastpath anchor-before-scan test
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 11:51=E2=80=AFPM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> On Wed, Sep 09, 2026 at 11:02:51AM +0800, Kunwu Chan wrote:
> > On Tue, 8 Sep 2026 16:58:31 -0700 "Paul E. McKenney" <paulmck@kernel.or=
g> wrote:
> >
> > > On Mon, Sep 07, 2026 at 03:58:17PM +0800, Kunwu Chan wrote:
> > > > From: Kunwu Chan <kunwu.chan@gmail.com>
> > > >
> > > > synchronize_srcu_atomic() may end its grace period immediately when
> > > > its scan of the per-CPU lock counters finds no readers.  Correctnes=
s
> > > > requires the grace-period anchor written by srcu_gp_start() to prec=
ede
> > > > the smp_mb() ordering the lock scan.  This ordering ensures that an=
y
> > > > reader whose lock increment is missed by the scan cannot have
> > > > incremented its lock counter before the grace-period anchor, and
> > > > therefore cannot be a pre-existing reader of this grace period.
> > > >
> > > > This litmus test models the key ordering between the grace-period
> > > > anchor and the lock counter scan, where "seq" models the
> > > > grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> > > > ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> > > > smp_mb() and the lock scan.  P1 models the reader-side counter
> > > > increment, with the smp_mb() of __srcu_read_lock() following the
> > > > increment.  P2 models an observer that sees the reader's increment
> > > > before seeing the anchor.
> > > >
> > > > The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> > > > SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> > > > which permits this outcome.
> > > >
> > > > Tested with herd7 7.58 using linux-kernel.cfg.
> > > >
> > > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > >
> > > Litmus tests!  Very nice!!!
> > >
> > > Could you please put both of these in Documentation/litmus-tests, in =
a
> > > new "srcu" subdirectory?
> > >
> > > One thing for your consideration is use of the "filter" clause for th=
e
> > > first term of your "exists" clause.  Not a big deal at all for this s=
mall
> > > of a litmus test, but the idea is that this litmus test only cares ab=
out
> > > the 0:r2=3D0 case:  If that condition does not hold, then P0() and P1=
()
> > > aren't the beginning and end of a valid SRCU read-side critical secti=
on.
> > >
> > > Use of the "filter" allows herd7 to abandon a given execution early,
> > > so it is a big deal for larger litmus tests.
> > >
> > > Again, what you have is fine (or will be when moved to the other
> > > directory), just pointing out the additional feature.
> > >
> > > If you would like to see a use case, please see:
> > >
> > > Documentation/litmus-tests/locking/RM-fixed.litmus
> >
> > Thanks, Paul.
> > I=E2=80=99ll move both tests to Documentation/litmus-tests/srcu/ and us=
e a "filter"
> > clause for the first test as suggested.
> >
> > I=E2=80=99ll send the two litmus tests as a separate follow-up series, =
so this won=E2=80=99t
> > hold up the current atomic SRCU series.
>
> That sounds good, thank you!
>
> > I=E2=80=99d also like to continue maintaining the SRCU litmus tests as =
they evolve.
> > If you think a MAINTAINERS entry for the SRCU litmus tests would be app=
ropriate,
> > I=E2=80=99d be happy to prepare that as well.
>
> Why don't we take a longer-term approach and work to get you up to speed
> for maintainership of SRCU, rather than just for a couple of litmus tests=
?
>

Thanks, Paul. I really appreciate the support.

I agree that taking a longer-term approach toward SRCU maintainership
makes much more sense. I=E2=80=99d be glad to work toward that and take on
more SRCU development, review, testing, and LKMM work as I get up to
speed.
I=E2=80=99ll keep building on the atomic SRCU work and look for opportuniti=
es
to contribute more broadly to SRCU.

Thanks for the guidance.

Thanks,
KunWu

>                                                         Thanx, Paul
>
> > Thanks,
> > KunWu
> >
> > >
> > >                                                     Thanx, Paul
> > >
> > > > ---
> > > >  .../SRCU-fastpath-anchor-before-scan.litmus   | 56 +++++++++++++++=
++++
> > > >  1 file changed, 56 insertions(+)
> > > >  create mode 100644 tools/memory-model/litmus-tests/SRCU-fastpath-a=
nchor-before-scan.litmus
> > > >
> > > > diff --git a/tools/memory-model/litmus-tests/SRCU-fastpath-anchor-b=
efore-scan.litmus b/tools/memory-model/litmus-tests/SRCU-fastpath-anchor-be=
fore-scan.litmus
> > > > new file mode 100644
> > > > index 000000000000..8200a75e15ef
> > > > --- /dev/null
> > > > +++ b/tools/memory-model/litmus-tests/SRCU-fastpath-anchor-before-s=
can.litmus
> > > > @@ -0,0 +1,56 @@
> > > > +C SRCU-fastpath-anchor-before-scan
> > > > +
> > > > +(*
> > > > + * Result: Never
> > > > + *
> > > > + * The synchronize_srcu_atomic() fastpath may end its grace period
> > > > + * immediately when its scan of the per-CPU lock counters finds no
> > > > + * readers.  Correctness requires the grace-period anchor written =
by
> > > > + * srcu_gp_start() to precede the smp_mb() ordering the lock scan.
> > > > + * This ordering ensures that any reader whose lock increment is m=
issed
> > > > + * by the scan cannot have incremented its lock counter before the
> > > > + * grace-period anchor, and therefore cannot be a pre-existing rea=
der
> > > > + * of this grace period.
> > > > + *
> > > > + * This litmus test models the key ordering between the grace-peri=
od
> > > > + * anchor and the lock counter scan, where "seq" models the
> > > > + * grace-period anchor in ->srcu_gp_seq and "ctr" models the per-C=
PU
> > > > + * ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before =
the
> > > > + * smp_mb() and the lock scan.  P1 models the reader-side counter
> > > > + * increment, with the smp_mb() of __srcu_read_lock() following th=
e
> > > > + * increment.  P2 models an observer that sees the reader's increm=
ent
> > > > + * before seeing the anchor.
> > > > + *
> > > > + * The outcome is forbidden by LKMM, and herd7 reports "Never".  S=
ee
> > > > + * SRCU-fastpath-scan-before-anchor.litmus for the reversed orderi=
ng,
> > > > + * which permits this outcome.
> > > > + *)
> > > > +
> > > > +{}
> > > > +
> > > > +P0(int *seq, int *ctr)
> > > > +{
> > > > + int r2;
> > > > +
> > > > + WRITE_ONCE(*seq, 1);
> > > > + smp_mb();
> > > > + r2 =3D READ_ONCE(*ctr);
> > > > +}
> > > > +
> > > > +P1(int *ctr)
> > > > +{
> > > > + WRITE_ONCE(*ctr, 1);
> > > > + smp_mb();
> > > > +}
> > > > +
> > > > +P2(int *seq, int *ctr)
> > > > +{
> > > > + int r3;
> > > > + int r4;
> > > > +
> > > > + r3 =3D READ_ONCE(*ctr);
> > > > + smp_mb();
> > > > + r4 =3D READ_ONCE(*seq);
> > > > +}
> > > > +
> > > > +exists (0:r2 =3D 0 /\ 2:r3 =3D 1 /\ 2:r4 =3D 0)
> > > > --
> > > > 2.43.0
> > > >
> > >
> >
> > Sent using hkml (https://github.com/sjp38/hackermail)

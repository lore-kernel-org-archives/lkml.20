Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A613B14CE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014684; cv=pass; b=Vfh4yPvuq8q9ZwN9kcbKv59X8eklOVUyyrZSqrPYpaYt5C/Ry79UspXSPvz6uqBjllSV4Lbi4foVdGXJlwRdq7A2HtwGiSSpJjONq1c6tElOhym9MNKZHEsO2MrEH220iQ6Xlrjke7kINZ702Ij/mog5aNFEmBblHFzf8aWeTIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014684; c=relaxed/simple;
	bh=nGWKaqyr24Wy2YZw8DdG/uOhViINSSIsWNtLN5gDkYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHj5EqDBNJVjwb2L4oyQAhtErPL18SVSm/BucW1KfoXzK/WhQxi/InHfqrcWUnnlcoU9YtaC86Q9+3U5qJPWQdyBOOSmO2SQ333rDueBwiLPO1A+/2kWQcOryE0dCFzOiQdSZOMMhsEBMAOjmM/LWXk+tK7QOraPEaB5QxvUS10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3SODCeV; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3SODCeV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso80763575e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789014680; cv=none;
        d=google.com; s=arc-20260327;
        b=aGfHEP9JBOjhNQo2JB8KsdXPlPSJwJnMPscx7cB8aPUb05aL9Ptc4zOkb0naPp1A0v
         jVmWQMgF9a0CxxLkssNWaiJ/oJnDt2pqYUiW9gEM65BItp8hHfEGiyUsT2oDpXFAaG14
         sQfOFZJwxcw+tpMqQfO9AITSQWwGKlLSWBqtwkBMouHdl62wVpSwFwXbiEYU9m0s+TaI
         KjVOcUCaBfSRAqreHG7PjelvZw4492E0+EWXQ050BXmrUnt2N1hh3JsSfRSOTVvi+5mz
         +L08GpKtO02AjCNYBsVUVh5BMcmveLFnarjLjpgVkANYiOgdBDOwpNC3qQVZj9hEHBEc
         l7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ogeS1d1lUjwpzULBQnx1xn71a+aSrJ9QM6Mrgrln7po=;
        fh=AZe0KY8eu1prQt534Hz2RQZDJkYbqGjzWu6HxAbJ5c0=;
        b=VqFfAxZgrQzdkxy6KiIVUb3fTG7JzrzKM87iKjql9aMXfo2qXcGFlCG7RA2yXwreMl
         x8IQ+n899RySMtErk6wm2YNZdFvwwexsMcIzE+OhfVoI2mLiwBAOuqFxcns4HI5ZxWtp
         GAQdWqxOM/OlRj4GrTAAQaWyctQOFBBaqxMZs2Eb2bGKn13CzFrWkunlRi888I6Nj79v
         Q8s3RFvcgEqgNAuL734zDww5pmQF8WFEgIkd5tIfCN6LkXtUse/Bn5b3ndfqB4hIUau8
         hVmPfyDGi/Gr7/UeiWmiqL29Y92q/2cSZKJMGgWaLXXsY3E8pv7KDO4p5qRie77rTjcw
         amoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789014680; x=1789619480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogeS1d1lUjwpzULBQnx1xn71a+aSrJ9QM6Mrgrln7po=;
        b=l3SODCeVhF2OXWYpnGgog9bWquVvBQh3oK8QsdseMroxMuwi/lExmnvfAHKqj74Fqt
         mAuNcwnhS5on3gjlHRDr0H4R9MUh29ieJ/YbqCR1ay6MSWJnRCzLMkMioMOtCO9DVzFQ
         OK9fsdMZCKT+RocQApMDrnqWR7b5or5wA+yQBWygD6MgcLno8sHXjhN9uQMiJPLk3Hkl
         /LHK5F3F/vfI/jJEYmTSYQYzLoo5FUWLqbBcUeNjOlX9va/erg51o1Fzdj3WDDY8ylTm
         JrPwEfXFo6U4owmLnEQTzkdwoxSD8qJmvPk+9t2HKDS2pVNOhKFvSJkCXg1/4TuYnTVc
         Uu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789014680; x=1789619480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogeS1d1lUjwpzULBQnx1xn71a+aSrJ9QM6Mrgrln7po=;
        b=QSEaTlJnsoLeTCQI8bDYoNu8jMZEIjVhOW1aNb2i0KrJzaVGlPzc6kMkSq/AEGNIG6
         FVHHswH0srhAiGu8hFgYHuBH31DmLK2S8u95UjsShinMYGh6xFRwBbOK2YQleOytDwqb
         iiBhfsHVH/hcmLViTSnp+gosbYiaNLVAduQVPwNxMkD50ZCNtFMrSBhSHKtO3obCCO+3
         EamLj32//9i59OmiGs/ewLEH+RAYQDvCnS/rGriyEAP58PU0IVBpGFk9smkMHj3X2o5H
         b25AfAAA7u6T/FEwPrefIMBPAUZGSFmp+I/ISslsylzMq9lrKIDnLN6bQh4d8D+xXAOn
         9uJw==
X-Forwarded-Encrypted: i=1; AKwUvBzujmk5+KhQMK52CkGf2docrBxtnR9NE6TWdLHDNBPZ9x/cg8VWROQzatKGkfbfNmIv10O2XOrTA/+GPpY=@vger.kernel.org
X-Gm-Message-State: AFuF++mE6FqZFYUk9/HIfs23BAUr7QdhvGH5H4s81E6wIKqq2nqFGotK
	ac+IbLLpabbjYoKmFgc9LgmN/nCEGY5YM5XnhF2xmiuUtuctxPtU/2/Rcub07FBxsx8ilDr2TFw
	48Jwdy0H0w19aX9hqdBLPimC+eatlqaE=
X-Gm-Gg: AYBFou1vzQ8HIvU22pT5VsIz3aAMCqdNkPpqCO4hCBkX4J99TCxEEP0mQbBaGGLz1ko
	GQ0fQoTrLW/wt9BW0xw6PsRI16tiE4DNO3TcfZWT4iclYWSOASmfqMnj9LoIaTqqklQj4jNRwX8
	y2Gxg6lUnmsiNiZLvYDmAHxyvfF/Zck/SIHUq/tjh4hXzRP+UdwDftu4J3OMPMnjhi1DzyLRUcv
	huW9M2cLq6tQesZ0DrACExSBl59ueSOC12N9Lk7d8UKLU7ZZccZCPev5cq8uLlKti6HxgtzPooX
	gXGX2Qn/TJqEZszpm4ihmH074wRFQSPZ1j/Hy+12xImBimhJ0jJtMQewpJ6nH8yh+f5NVqalyTV
	AZew6Sihb9r7cWA==
X-Received: by 2002:a05:600c:3495:b0:499:726b:7375 with SMTP id
 5b1f17b1804b1-49cf8279f41mr341820965e9.14.1789014678976; Wed, 09 Sep 2026
 21:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
 <20260907075829.2073224-5-kunwu.chan@linux.dev> <fc49190e-6cec-435d-b853-db906a1e33e3@paulmck-laptop>
 <26b68ec0-2f21-4dc2-bfcf-20cbc38f4ceb@paulmck-laptop> <CAN_Opa-M=qs=ofqdQWikkVRh2mNzKMO5qrtOSn_jMyF+TkMKNQ@mail.gmail.com>
 <9b0ac5fa-98ef-4ff0-9f96-9194f1eda442@paulmck-laptop>
In-Reply-To: <9b0ac5fa-98ef-4ff0-9f96-9194f1eda442@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 10 Sep 2026 12:31:06 +0800
X-Gm-Features: AcwNN1U5qVrUjk9gb4KVFN6vmzZjDt3Kofz7nE6PKHWOW0MsHwSNHKCgtQc9pws
Message-ID: <CAN_Opa-gc=hUpiTSgKpSepzTaUNnHaWaw+CcH5WiBbzHTpf3UA@mail.gmail.com>
Subject: Re: [PATCH 04/13] rcutorture: Add atomic-SRCU support to torture.sh
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:47=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> On Thu, Sep 10, 2026 at 09:30:48AM +0800, KunWu Chan wrote:
> > On Thu, Sep 10, 2026 at 6:35=E2=80=AFAM Paul E. McKenney <paulmck@kerne=
l.org> wrote:
> > >
> > > On Tue, Sep 08, 2026 at 04:34:41PM -0700, Paul E. McKenney wrote:
> > > > On Mon, Sep 07, 2026 at 03:58:20PM +0800, Kunwu Chan wrote:
> > > > > From: Kunwu Chan <kunwu.chan@gmail.com>
> > > > >
> > > > > Add the --do-atomic-srcu argument to torture.sh, which runs the
> > > > > SRCU-N, SRCU-P, and SRCU-T scenarios, thus covering both Tree SRC=
U
> > > > > (SRCU-N and SRCU-P) and Tiny SRCU (SRCU-T), with
> > > > > rcutorture.reader_flavor=3D0x10 appended to the boot parameters s=
o
> > > > > that it takes precedence over each scenario's own reader-flavor
> > > > > setting.  This exercises srcu_read_lock_atomic(),
> > > > > srcu_read_unlock_atomic(), and synchronize_srcu_atomic().
> > > > >
> > > > > As with other torture.sh tests, the --do-kcsan argument runs a
> > > > > KCSAN+PROVE_LOCKING variant of this test.
> > > > >
> > > > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > > >
> > > > Queued for testing and review, thank you!
> > >
> > > I did take the liberty of changing "do_atomic_srcu=3Dno" to
> > > "do_atomic_srcu=3Dyes" in order to increase test coverage.
> > >
> >
> > Thanks, no problem.
> >
> > I also found a couple of data races in other subsystems while running
> > the tests. I=E2=80=99m still validating the fixes locally and will Cc y=
ou if I
> > send patches for them.
>
> Sounds good!  Note that some maintainers are more friendly to such
> patches than others.  But it shouldn't hurt to send them.  ;-)
>
> Just please carefully check the design.  For example, blindly applying
> READ_ONCE() and WRITE_ONCE() is not a strategy to win.
>

Thanks for the reminder, Paul. I=E2=80=99ll keep that in mind and make sure=
 to
check the design carefully.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > Thanks,
> > KunWu
> >
> > >                                                         Thanx, Paul
> > >
> > > > > ---
> > > > >  .../selftests/rcutorture/bin/torture.sh       | 24 +++++++++++++=
++++++
> > > > >  1 file changed, 24 insertions(+)
> > > > >
> > > > > diff --git a/tools/testing/selftests/rcutorture/bin/torture.sh b/=
tools/testing/selftests/rcutorture/bin/torture.sh
> > > > > index f0083891ee81..8885812d866a 100755
> > > > > --- a/tools/testing/selftests/rcutorture/bin/torture.sh
> > > > > +++ b/tools/testing/selftests/rcutorture/bin/torture.sh
> > > > > @@ -68,6 +68,7 @@ do_clocksourcewd=3D"${ifnotaarch64}"
> > > > >  do_rt=3Dyes
> > > > >  do_rcutasksflavors=3D"${ifnotaarch64}" # FIXME: Back to "yes" wh=
en SMP=3Dn auto-avoided
> > > > >  do_srcu_lockdep=3Dyes
> > > > > +do_atomic_srcu=3Dno
> > > > >  do_rcu_rust=3Dno
> > > > >
> > > > >  # doyesno - Helper function for yes/no arguments
> > > > > @@ -103,6 +104,7 @@ usage () {
> > > > >     echo "       --do-rcu-rust / --do-no-rcu-rust / --no-rcu-rust=
"
> > > > >     echo "       --do-scftorture / --do-no-scftorture / --no-scft=
orture"
> > > > >     echo "       --do-srcu-lockdep / --do-no-srcu-lockdep / --no-=
srcu-lockdep"
> > > > > +   echo "       --do-atomic-srcu / --do-no-atomic-srcu / --no-at=
omic-srcu"
> > > > >     echo "       --duration [ <minutes> | <hours>h | <days>d ]"
> > > > >     echo "       --guest-cpu-limit N"
> > > > >     echo "       --kcsan-kmake-arg kernel-make-arguments"
> > > > > @@ -148,6 +150,7 @@ do
> > > > >             do_kcsan=3Dyes
> > > > >             do_clocksourcewd=3D"${ifnotaarch64}"
> > > > >             do_srcu_lockdep=3Dyes
> > > > > +           do_atomic_srcu=3Dyes
> > > > >             ;;
> > > > >     --do-allmodconfig|--do-no-allmodconfig|--no-allmodconfig)
> > > > >             do_allmodconfig=3D`doyesno "$1" --do-allmodconfig`
> > > > > @@ -183,6 +186,7 @@ do
> > > > >             do_kcsan=3Dno
> > > > >             do_clocksourcewd=3Dno
> > > > >             do_srcu_lockdep=3Dno
> > > > > +           do_atomic_srcu=3Dno
> > > > >             ;;
> > > > >     --do-normal|--do-norm|--do-no-normal|--do-no-norm|--no-normal=
|--no-norm)
> > > > >             do_normal=3D`doyesno "$1" --do-normal`
> > > > > @@ -212,6 +216,9 @@ do
> > > > >     --do-srcu-lockdep|--do-no-srcu-lockdep|--no-srcu-lockdep)
> > > > >             do_srcu_lockdep=3D`doyesno "$1" --do-srcu-lockdep`
> > > > >             ;;
> > > > > +   --do-atomic-srcu|--do-no-atomic-srcu|--no-atomic-srcu)
> > > > > +           do_atomic_srcu=3D`doyesno "$1" --do-atomic-srcu`
> > > > > +           ;;
> > > > >     --duration)
> > > > >             checkarg --duration "(minutes)" $# "$2" '^[0-9][0-9]*=
\(m\|h\|d\|\)$' '^error'
> > > > >             mult=3D1
> > > > > @@ -497,6 +504,23 @@ then
> > > > >     torture_set "rcutorture" tools/testing/selftests/rcutorture/b=
in/kvm.sh --allcpus --duration "$duration_rcutorture" --configs "$configs_r=
cutorture" --trust-make
> > > > >  fi
> > > > >
> > > > > +# Test atomic SRCU across Tree SRCU (SRCU-N and SRCU-P) and Tiny=
 SRCU
> > > > > +# (SRCU-T).  The reader flavor selects srcu_read_lock_atomic() a=
nd
> > > > > +# synchronize_srcu_atomic().  Tiny SRCU requires SMP=3Dn, which =
aarch64
> > > > > +# does not support.
> > > > > +if test "$do_atomic_srcu" =3D "yes"
> > > > > +then
> > > > > +   torture_bootargs=3D"rcutorture.reader_flavor=3D0x10"
> > > > > +   configs_atomic_srcu=3D"SRCU-N SRCU-P"
> > > > > +   if test "$ifnotaarch64" =3D yes
> > > > > +   then
> > > > > +           configs_atomic_srcu=3D"$configs_atomic_srcu SRCU-T"
> > > > > +   fi
> > > > > +   torture_set "atomic-srcu" tools/testing/selftests/rcutorture/=
bin/kvm.sh \
> > > > > +           --allcpus --duration "$duration_rcutorture" \
> > > > > +           --configs "$configs_atomic_srcu" --trust-make
> > > > > +fi
> > > > > +
> > > > >  if test "$do_locktorture" =3D "yes"
> > > > >  then
> > > > >     torture_bootargs=3D"torture.disable_onoff_at_boot"
> > > > > --
> > > > > 2.43.0
> > > > >

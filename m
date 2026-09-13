Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478C3CA4AD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294998; cv=pass; b=OVuosl6+PNIxb0p2X8xzy6W4b27dwjje/Z7Cwmbfpprowf4tv5cjJgaz0rHkf62DKXtTDqDaTCuFGOp3QXppyo9cn2V8/CRgBwEZr/UPTV81rjrxevuRzpVq9U1drtJ2uMxciaSuTqDkojYr9h+0EKIIRjhay4oQYdncv/hkwYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294998; c=relaxed/simple;
	bh=/da4xkkbWlUHDywNO7yl9JugHyvKv1izVJBOYQ0OiJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bm3koIxu2GMntKNTcH4L9143XWW78eX337/0Zuy30FsMqpGONsoLEkejRb8RjA6JldtXzwClRSDX+VlJPL+UzYQA+AtOcQcaQj1SZuo6uFyOujHaT6JQaT/rCI5a1v1zrk/TO0NItU0RujMsbqYRKf1BF9wEj9np9MEY/5OyduQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skQSwERv; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skQSwERv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so5524435e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789294994; cv=none;
        d=google.com; s=arc-20260327;
        b=eOV6ckwokVDMI/Hog273shBWsRH+APSBKzO3uUgInQzNd/vAITUl/bu/s4fb692o/I
         JY9gKmBdyY0zyuA8daAs2580Ur1j1eg99gw70cuKqx/CG5jylti55yo/SCgvJBbP25up
         +Mr7e4KNTdFcir+XAdWSQQ6I4EIx8C9Uyuo2cGSz4CiaC7wUPx6Y6KHmVDZbdoj4mtiX
         DS5i1IjaNy9nG65xrclBqUOIpgs2lAtjyyEN2rJ79SB2TSsM5Vv8M/nZV9PTMnlmNA3E
         cJaU+k9HGlCilTCSPRdswDiNbBcm9RSrA1Wk2FCDaZeTbCK0ltcWLODcluFViD+Ho1gF
         iVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VeM8lzHtsZzkcva1GsyD3J3hMDsbPZApqdfMt/qqPl0=;
        fh=g0lJ0PVWsPaA7xVXXd+z5e0t/An9Q/pcJvMLdBHPQew=;
        b=qShSee4guRAtUbgEl/l3UYeCd83RvqlcBrACkr5BWC/t1rLO1FohydgWV2sWcpnhu8
         bePcDp+7d/n8QvOIr8FNxdUKOAn7YS5ekyqvJzwhvYYWi/2sFgKwhzUMRnZiPUwA4DRZ
         7ukmI1JSYDFh4jkq76tG8F4dY5cv9aCjJlV7j6JAkv4TQazSkTklLdhknDLRv6TuAU10
         XjygXQXAjar4gn4emhWT0PR7QSfB0yzZyRufamZjh5bOGPZ4JuOh3tsDkzTTAQjmMBnC
         ABBCUQ+vLEVSyqP9+FTc4oj1BW6oKjYZu6qYe3cATpd+STXREw0DafRMUdWzAOpu/mbn
         X7nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789294994; x=1789899794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VeM8lzHtsZzkcva1GsyD3J3hMDsbPZApqdfMt/qqPl0=;
        b=skQSwERvYlWccqJGkZx6nj/wjIhO4THnr2OGkrGl9cq+PiSVo++5k3ISUoDiPPTk1E
         6dy7lOXqMFsKSUQYEM01dp21F5lJ+Y1pXBhhld1LDyIslRK6ZGbEofZHnQ2y3dtQ9W7w
         RJbc6zj8uVg52cUe9fkIeOVwKCNYN+9Db4xEss6/eSpztrvfeusF4PqmOLhGQfdxyDFe
         jg7RuW0iy1BTFwMfBEjPKRjUD8pfbAhqCmECKq8Jt54/zfWLK885l5y1i2SLH4deH4nu
         Ys5my4AXgysGNf30YSqUUE201RZr43AjTHo9OzjmelaijGQlHDvVZhQztn0SmIHcmisd
         YJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789294994; x=1789899794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeM8lzHtsZzkcva1GsyD3J3hMDsbPZApqdfMt/qqPl0=;
        b=aEy8E4XI4HK2V87NAZHZdIiNqViELEEUtl/tjKRWg3oIN03+xWH1NbIrssXW7BvM3w
         a87cqqlSoBwYYapC1TqCHRwrQnfLbVnKn2Tf4q546uDa5AeX2XYbNP1XPcQqhp9La8jm
         M6Y1H9lGEa3MKbGzfFb5/Kuv4RCY/3r+RAvlTWvPkD0KLzUUHE3q7mfGbAoeYx/jFXG5
         g0JecTQoNl09Hq3Dz1rAfbT5oVOlOjAGPYQm2LbjeEnfgarfGr/McERGJCWZt65ndwi/
         i/7tnmQ9Pb3RZEdD58jIEi44SC/oE0P8dJVbvaS3AhQMVqMRlfN1GUduVtS/zdxjotO5
         RL8w==
X-Forwarded-Encrypted: i=1; AKwUvBwOuVUrJnd7tuCK1yE08926As0nCLdLaL5pnXgAuKuP8otLXt8TTqTYnmq75uOmzHRM6jh1kTEY/xZ6AYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nrAadmF0y0GxTW4ygjvGnmd+7u8RW9Zmt3n08sgxg7STdkOGjY
	3W4i4kdTKm/Eh45chCffllKX/yhOQqt5b5a0MsLNEslVGfikMPcVUru0aseN6Kem9AnIJ5a1F5w
	C+Kw4SGIrMq4FYtirW82ScHaOovwVqN4=
X-Gm-Gg: AYBFou35K2lSaea4QeeCBnPZe9hvz/eVoxkHrmTZqmqHLag3myk4WijDU+ZYN4ZkLks
	LbFobpcjkC+I0ZakKkGLuC2kKoZLKhvdX5a0yHLM+a3veHgkuJ8DYWwVXdl1tttfLcl7xpVgWlo
	8jQStdBL1ySTv2o3BTwCXXVymV8Yl5nEg9IkLYA0uiq3k7dVhQ3W8qmSeiWRtGwZL18pxNDG+UD
	kjySgjD08YRz2TRmep6CoEGMoZTt9Ce39WNODAbU5OVreCCL6yFLpytTcA9qxn+dPOvptEiqjWw
	P4BYJ/Pj77YQjtuAZxaUsX++7izyvVgdCTqX4FRLYQoDvSDywjIoqgFvsSauDbQlOwpvamFzJQ3
	J6ly4HjKpHkz/gQ==
X-Received: by 2002:a05:600c:540e:b0:49e:6692:27fd with SMTP id
 5b1f17b1804b1-49e66922810mr204293965e9.2.1789294994225; Sun, 13 Sep 2026
 03:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911093515.2802551-1-kunwu.chan@gmail.com>
 <0cf7b133-d2fd-4298-adba-70a2b86d1892@paulmck-laptop> <CAN_Opa-uuim=aiOuAmHYUoD5S=vBREemj-dCvcunF-4zNdp1=A@mail.gmail.com>
 <e6be6641-731c-4b21-ad4e-c05bedc388d6@paulmck-laptop>
In-Reply-To: <e6be6641-731c-4b21-ad4e-c05bedc388d6@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sun, 13 Sep 2026 18:23:01 +0800
X-Gm-Features: AcwNN1WLPFwN4p6tzjGquIodVYiq-ve1ku2FdgLQ3j_nNSAf-QvPE_xuEryTmjk
Message-ID: <CAN_Opa88oCHV+TGUmAzDLdfnmZ78oT+_vFttkMQEQ8uHuW8-ZQ@mail.gmail.com>
Subject: Re: [PATCH] srcutree: Add lockdep and early-boot checks to synchronize_srcu_atomic()
To: paulmck@kernel.org, Zqiang <qiang.zhang@linux.dev>
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 2:50=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Sat, Sep 12, 2026 at 08:37:33PM +0800, KunWu Chan wrote:
> > On Sat, Sep 12, 2026 at 12:47=E2=80=AFAM Paul E. McKenney <paulmck@kern=
el.org> wrote:
> > >
> > > On Fri, Sep 11, 2026 at 05:35:15PM +0800, Kunwu Chan wrote:
> > > > Add the lockdep annotation, same-type SRCU nesting warning, and
> > > > early-boot check used by __synchronize_srcu().
> > > >
> > > > Suggested-by: Zqiang <qiang.zhang@linux.dev>
> > > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > >
> > > Queued for review and testing, thank you both!
> > >
> > > Interestingly enough, it is now the case that there is a grace-period
> > > wait that can be placed in a normal RCU read-side critical section.
> > > Does this mean that we should also adjust the --do-srcu-lockdep testi=
ng
> > > in tools/testing/selftests/rcutorture/bin/torture.sh?
> >
> > Thanks, Paul. Good point.
> >
> > I=E2=80=99ll check the current `--do-srcu-lockdep` coverage, including =
the
> > case where `synchronize_srcu_atomic()` is called from a normal RCU
> > read-side critical section, and follow up with the necessary torture
> > testing changes.
>
> Sounds good!
>
> Perhaps you and Zqiang can work together on this.  Co-developed-by,
> for example.

Thanks, Paul. I'am happy to do that.

@Zqiang, your suggestions on the additional lockdep cases got me
started, and these are now incorporated as testtypes 4 and 5.
Paul's observation that synchronize_srcu_atomic() can legitimately
be called from a normal RCU read-side critical section led to an
additional regression test (testtype 6).

In particular, testtype 6 verifies that calling
synchronize_srcu_atomic() from within rcu_read_lock()/rcu_read_unlock()
does not produce a false-positive lockdep warning.

The atomic SRCU same-type nesting cases are covered by testtype 4
and are expected to trigger the RCU_LOCKDEP_WARN() in
synchronize_srcu_atomic().

The changes are in rcutorture.c and srcu_lockdep.sh; torture.sh
does not need to change. The testing changes are basically complete.

@Zqiang, I'm happy to add:
Co-developed-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Zqiang <qiang.zhang@linux.dev>

if you're OK with that.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > Thanks,
> > Kunwu
> >
> > >
> > >                                                         Thanx, Paul
> > >
> > > > ---
> > > >  kernel/rcu/srcutree.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > > > index 6a9c432a3bd0..6c729e805fb3 100644
> > > > --- a/kernel/rcu/srcutree.c
> > > > +++ b/kernel/rcu/srcutree.c
> > > > @@ -2123,6 +2123,14 @@ void synchronize_srcu_atomic(struct srcu_str=
uct *ssp)
> > > >       unsigned long rdm0, rdm1;
> > > >       unsigned long unlocks0, unlocks1;
> > > >
> > > > +     srcu_lock_sync(&ssp->dep_map);
> > > > +
> > > > +     RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
> > > > +                      "Illegal synchronize_srcu_atomic() in same-t=
ype SRCU read-side critical section");
> > > > +
> > > > +     if (rcu_scheduler_active =3D=3D RCU_SCHEDULER_INACTIVE)
> > > > +             return;
> > > > +
> > > >       // Initialize.  Either init_srcu_struct() was invoked or
> > > >       // DEFINE_SRCU() or similar was used.  Therefore, no allocati=
on
> > > >       // will be done here.
> > > > --
> > > > 2.43.0
> > > >

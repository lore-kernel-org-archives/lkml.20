Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230C3E49ED
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228057; cv=pass; b=QfyMV+h964XP1TR4Yi4cvsglg+s888w7vMhAixvDxIHzveboZ86RQ9f6gymkhzZ6yZv58CWEJ43FMuMQTID1F8tBPrKaEv2UBTRvzp0v6sdR6y7G65FzxNT0HYWPVfaJDKtKFGmK+JVglZA9OBBLdrUCYyv1uNMkBPrmK3+3mcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228057; c=relaxed/simple;
	bh=CQQWiaaK3VZG5SIKWhlGIf/hiXPva8fyQeQkJCDkw14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgSyxiBUWUd4VRFnkIaX65X2kKMAGPLPr9ijN8/AQH6UeUgs2SUJbg/NzmKAa47bewzHnThdFxYE2FMN2i5OPKJLP+ogFye4NzCTCyq3rQcAHShX/Zf/6nMZmu30Tci0Uvstf6vcdSOqqgokQXm4sDAKqbpkkpajYD9PKvsrLTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihOo7XUG; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihOo7XUG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so2761695e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788228037; cv=none;
        d=google.com; s=arc-20260327;
        b=iPWN5NZ0hOt9ESSpWkTlnpnWFMoWnFHNx9MK+B7Xs4bJmMvlygu+DkE0cwih/b01/h
         3TUoyIgjXwqwSwtJxSP6xbyrAz3lsEtQozXacVdwtWyINixqZnGwV1cMvMLLN1qgl8fB
         OQO94yOcoJiBBkp574xgXadXGJHZy7TRRHPuELDLdyL3Z6R02uHYHI6KJx/OxJNH1iGs
         ryctYmZa15sL2uzAByydAEs4Si2l2I4melFVENRgOigkuJnZ60B4oU73pmRhgztYfoRL
         pX4Ca2wm85f10KaQjQORhIbpjX3LvdTbOuAwO0OX5hRL+QD+nAWE0PgCk9YTbl3JuTg+
         OUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pO/folBnV5/GMkSd1hxgT/7e0hMo94czuPGpwnyLjCc=;
        fh=rxX5DHvMvGGWkby0TsKS+8LnvbsEoBNDmJ8PA1dFSDI=;
        b=qABZ/sG2SyS5+M0ea5V7WFFPNOChEvZ9jZEd86cg0gRYjPhkLFyoka14e1wDmQeXB7
         G4snI01X/KSX807oH6hpNMRaL22EeyWENGLCWQxYCduluooZs7LOMl+ahhxz8DlLLYtt
         XbjukC+TvXZCIeddstf8gwtS5V5nJ3FNyGEqSjomJ2kgbDZ41guhO6k0bg9wmWcVgZXd
         qckwqEWY5iEnfQ2baOy3y01qZCSpTu2M/ewtc5ljr7dpCJV4BnQqt0V/O/jPIqcizW+v
         E5j3SKx7amBkQR1JT226ZX30wpdM0Sa250+9TEdUoDjT4/5jyhJAPYsMLBlY6agh2CWi
         3WTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228037; x=1788832837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pO/folBnV5/GMkSd1hxgT/7e0hMo94czuPGpwnyLjCc=;
        b=ihOo7XUGawuzhrmCi0eDrS2Ph4bcWZ7N7GLCG4fF/SBzp8RlziWQV3zEmxXYhv3khB
         re9mTptRlLofujYcre6afqjc2ZPw1g4/YWEZdDKCqAnB6azzz0BrZzRpa27LU7LAKff6
         G1G7gh1iw5eFA9CuOyDIVjHNUO3jyDmZubqtkjMhkEuk4yhcJjVHOadpnkgOPMuZvwIR
         W1j2LhOX7LGp4AI45DJKLVzT7TGuw7sreeutQskOJmVrdXfum1MlyihwHyeQNoJf3zA4
         gnfiTfx9H4bI4B3put0NVsxIA5ni/QDHGzS9x3VY6/MZHE2Sly/k08LJxPsOybIFZMgL
         bBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228037; x=1788832837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO/folBnV5/GMkSd1hxgT/7e0hMo94czuPGpwnyLjCc=;
        b=VyxNkUZYAVASd/jC/GQPUQGKJaC9OogyoDaG3GmwOuS47+ZuLa9PEuYzmBMEqJ7FX2
         9/3ETUskmo7+E9Zr8Dz6LOxEfClbniQlybmiehgzCvxGjFfSVhT8vLhazkwjt2UcOTsL
         yGNhSUEFp396H2o8FzZfBkKJKIxVWYE043ytgwtAU1qs5WZlwEVW3r3so2DSVOnX8ez8
         LNQNrPmvtvNeoCTbiS0TK7+zsur/rQdTqRNYcKRC/fBDvjzzfQE83vF8mAv0iiby6lVD
         tqTcIQz4LyvihzJXPqpVamJ75oWfzS+r5SVaac2GPgGbzkCI5iwF/ksMe7EZsgNrSFxr
         Qs4Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro7mRR80CJ1I8w2gbgm8MCfmJNF08WEqnVERDb6vTW1zVvvUC+7RHbUjV0gSaxrqIzHtNmuvj5T1lNE7Ws=@vger.kernel.org
X-Gm-Message-State: AFuF++lF0MBu7N/8gBnW4772ETPFy0gMW4cQRBNQayJ207a6TXbyiBiX
	/Ujle9MION8ynuKiycvvbEvrDNAxlQljqODM8Jdz8JXJJkxhifKMJC7iNUAOBEuszughNFjihEz
	nKM5BDd7yr6xMX2P1iLeLLMRgVZph/vQ=
X-Gm-Gg: AR+sD13blmgu9fQDr8g1VIN2JO/1oW3E07QDC+hiM9Aqu1uhwl/QKWCXPLEhx/QpNxT
	YEs8y/vg3dm8qFAs+u0KdYqiYIY3iDBp655YvyPjAaMAsmP1uV2mNRsAvSKtGXbJB64pp9+ksrj
	VejXXojDqA8HK6gJJ6cVyoEB8QgbWAvszckN9QcSPFI4vZSgg643XAAeAwv4lMqOmfyqbH3Ty5/
	hQtrri4foJWuuGYV+5kVv6KEjXdHl0c9pc9/dDEJ4M+xVnaK3a3FZUBDqCYJwfosLfm97PGsOZg
	SGaJY1gVFOgWap/b7uVKQPK6W1F753clp0o5GMAzcPEPqVKz7/1LxNNy1Eqq14wQdx1I1oUe2HQ
	+3Vk=
X-Received: by 2002:a05:600c:1c0a:b0:493:bd2a:93be with SMTP id
 5b1f17b1804b1-49b91c276efmr490001255e9.6.1788228035959; Mon, 31 Aug 2026
 19:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831074937.2380914-1-kunwu.chan@linux.dev> <0eac36c5-acd2-4d8d-a498-f56a57cc3d6a@paulmck-laptop>
In-Reply-To: <0eac36c5-acd2-4d8d-a498-f56a57cc3d6a@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 1 Sep 2026 10:00:24 +0800
X-Gm-Features: AcwNN1VlRz612JSdd2q2k981jRzkyP1IJqbw6xTF6MxL1_nMg6jtz7DSvFJWt1k
Message-ID: <CAN_Opa_z4e8fLM0=+QV82r4oveKKUWitvNrBnsfJhXd+2-QQLQ@mail.gmail.com>
Subject: Re: [PATCH] srcutiny: Add atomic SRCU operation checks and state
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 9:04=E2=80=AFAM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Mon, Aug 31, 2026 at 03:49:37PM +0800, Kunwu Chan wrote:
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > Add atomic SRCU operation checks and the associated state to Tiny
> > SRCU.
> >
> > An atomic SRCU domain does not use the normal SRCU callback and
> > grace-period machinery.  In particular, a callback queued with
> > call_srcu() would never be processed.  Use WARN_ON_ONCE() to reject
> > call_srcu() and srcu_barrier() on atomic SRCU domains.
> >
> > For synchronize_srcu(), redirect atomic SRCU domains to
> > synchronize_srcu_atomic().
> >
> > Add srcu_reader_flavor to the Tiny SRCU state for these checks.
> > Tiny SRCU does not currently set the flavor for atomic SRCU domains,
> > but keeping the flavor in the common state allows the operation
> > checks to enforce the restriction once atomic flavor tracking is
> > enabled.
> >
> > Also initialize srcu_atomic_gp_flag, which was previously left
> > uninitialized.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  include/linux/srcutiny.h |  1 +
> >  kernel/rcu/srcutiny.c    | 12 ++++++++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/include/linux/srcutiny.h b/include/linux/srcutiny.h
> > index 47a368f945e3..2b293336525a 100644
> > --- a/include/linux/srcutiny.h
> > +++ b/include/linux/srcutiny.h
> > @@ -20,6 +20,7 @@ struct srcu_struct {
> >       u8 srcu_gp_running;             /* GP workqueue running? */
> >       u8 srcu_gp_waiting;             /* GP waiting for readers? */
> >       u8 srcu_atomic_gp_flag;         /* Serialize atomic GP work.*/
> > +     u8 srcu_reader_flavor;          /* Values: SRCU_READ_FLAVOR_.*  *=
/
> >       unsigned long srcu_idx;         /* Current reader array element i=
n bit 0x2. */
> >       unsigned long srcu_idx_max;     /* Furthest future srcu_idx reque=
st. */
> >       struct swait_queue_head srcu_wq;
> > diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
> > index 26ea4bfbeaf2..22f7716cbb0e 100644
> > --- a/kernel/rcu/srcutiny.c
> > +++ b/kernel/rcu/srcutiny.c
> > @@ -41,6 +41,7 @@ static int init_srcu_struct_fields(struct srcu_struct=
 *ssp)
> >       ssp->srcu_cb_tail =3D &ssp->srcu_cb_head;
> >       ssp->srcu_gp_running =3D false;
> >       ssp->srcu_gp_waiting =3D false;
> > +     ssp->srcu_atomic_gp_flag =3D 0;
>
> Good catch!  I will be folding this into the base commit with attribution
> on my next rebase:
>
> 9a2e9996ccec ("srcutiny: Add an atomic Tiny SRCU")
>
> >       ssp->srcu_idx =3D 0;
> >       ssp->srcu_idx_max =3D 0;
> >       INIT_WORK(&ssp->srcu_work, srcu_drive_gp);
> > @@ -289,6 +290,9 @@ EXPORT_SYMBOL_GPL(srcu_defer_drain);
> >  void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
> >              rcu_callback_t func)
> >  {
> > +     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_=
ATOMIC))
> > +             return;
> > +
> >       if (should_rcu_defer()) {
> >               /* A re-entrant call_srcu() during the drain would livelo=
ck it. */
> >               if (READ_ONCE(srcu_defer_draining) && !in_nmi()) {
> > @@ -319,6 +323,11 @@ void synchronize_srcu(struct srcu_struct *ssp)
> >  {
> >       struct rcu_synchronize rs;
> >
> > +     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_=
ATOMIC)) {
> > +             synchronize_srcu_atomic(ssp);
> > +             return;
> > +     }
> > +
> >       srcu_lock_sync(&ssp->dep_map);
> >
> >       RCU_LOCKDEP_WARN(lockdep_is_held(ssp) ||
> > @@ -415,6 +424,9 @@ EXPORT_SYMBOL_GPL(synchronize_srcu_atomic);
> >  /* Register any deferred callbacks, then wait for all in-flight ones. =
*/
> >  void srcu_barrier(struct srcu_struct *ssp)
> >  {
> > +     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_=
ATOMIC))
> > +             return;
> > +
> >       __srcu_defer_drain(ssp);
> >       synchronize_srcu(ssp);
> >  }
>
> The rest is good as far as it goes, but don't we need to set the value
> of ssp->srcu_reader_flavor somewhere for atomic srcu_struct structures?
>

Hi Paul,

Yes, agreed. I have the flavor tracking changes implemented locally
and am testing them now.
I=E2=80=99ll send the updated patch shortly.

I also have draft patches for the documentation and the fast path, as
well as rcutorture testing for
tiny atomic srcu , which I=E2=80=99ll send separately.

Thanks,
Kunwu

>                                                         Thanx, Paul

Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1988E471D1F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251362; cv=pass; b=FJW8KDFjvHj4nuEP/Tg5xncXHe+2Zmndz7XqtVvc8w3vpzpIER8CJWd2eDkxBfUOmXMQrJW0Cr4Igrl8NDyVSxkAzVJuoyZbQK3tmrVNEJ80MLecb3o3ehVWyvOmcpTepGxdO+ZEGaiBoP2MYZAel1h0VKvOKyv+yo5Y9DuWfbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251362; c=relaxed/simple;
	bh=Dw1WCSdMlVWA5FX+Tc8utCGI5RTAkl1tSrbLAaJ6h9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gr4t7Ino7VXxcdITPuygE7sQutz58aoaM79WXf40O0m3EtLKJQWVXJ1mxMnZIzjoAlKbugU/DuOaruIAo0shue3t9Fo2XMUFYSeDm/gkJrZMwxA0p9w8toYC+JsAoFsqUTa2W9/aeID9ulWyyrcju+fogi/4TTppKwRKxanFVXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=an608UNb; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="an608UNb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso3346345a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788251359; cv=none;
        d=google.com; s=arc-20260327;
        b=FELEm0TwuorrV2U8KQlJcpq0tbkIN1vDf+T9Xy8MIcM6pxGTUohy9T6IOCzshUQNkR
         CUjQc9mvWV0X/w3pL1Z69Pv77BxyA4XO30nn4yfiaExdCX/dUDX+8w87JtwpUZtnUsUh
         rwO7Fts+UBSl3WsEZNEqsVG7GaoVJEmFlw0TIB5/Ih67ZMNqQOiCWP1yTTZuKsADpwn2
         ZeJg4AGMLcXdKNfdwGPzibxJm5BTck3TTCEaDSww3HHtwxnJ7sszrnOXk7os9U/qMG6b
         Q1DGPqMtVIwcjWSUs9pZqRRGNm4TP9/Yr6IWKDxcqAWxaPcP6lRAfpUfcWtWP5SUpVoY
         2Ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H6/Yg/WkPmgRF1gkrPpWIlMqFfJVb3rJl5dVlHdleUQ=;
        fh=BQDRdpWa6Y595kEdTnGVd5vLqF7K5c7GV11r0K6qB1M=;
        b=HVd0yC/lhJ96vYB1YBll7SytQuPq51eqlGE5HdlZ9vz2Ml3/dv8lMv29e21HnkF12j
         x4mCXNv5vwdWhAT3YtUdBDaVoY6Xli4OcYFF2koZ+bIhKob9V61YZkoWljqSEGmVYGlS
         jpeOPzZVFojvjDuvlBbcB1uw32IKOKZvEGPepfiiAzDJtp7viLp5+xmsICVG5yls/eMv
         fheJONXcyJcPVNJynxT6ytcOg2BDVgWB1ZnzHJZXpXHH+zh8yKd2ZYApuVx3IkTQzLkN
         QkzCXs1ePQf1aEOugzqIq58L+XEUUmlN1wt4HWfK3d4A9WCRO9PgPSb8mEAJza/L+zRP
         rE4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251359; x=1788856159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H6/Yg/WkPmgRF1gkrPpWIlMqFfJVb3rJl5dVlHdleUQ=;
        b=an608UNbnN+brym2SBfOmOrPnwMYTqy4YM624SneEKXdOFKpQGzYzrQY2rCJrN7lVe
         LGKnDCtgDDQi+PYiYAU2JXr5E57rLfOrQECFfgMXiQH5ZdFF2bTol2PXcsOXyuEkHBnG
         uGwJ01GZEOqKWsLHlUEdK4mHygqtYv+DzMl1e6ugkRs6+RcvZpzCqdzYBehwA2JQkr4B
         tPJ7L4oHA4Q38HHFA/I2907FaAzh/NBTEq6wUNteuNLZ3gohBrInPuI0Rv8yiUnCKZaj
         2phdPndQcoJ03nDjb6qfpJb3uysDSWuxCv/dJUkKdT/LhVu9rEofF4egumWUAa8AxJnD
         OxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251359; x=1788856159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6/Yg/WkPmgRF1gkrPpWIlMqFfJVb3rJl5dVlHdleUQ=;
        b=nP5Kjcl8ViO02x5RXjRNlnGqke7XoWILkVL5DRoEIVNvydmEQzA8noiXtLCqt6XEYx
         ha4hDoLnBEQYgc72incejjuMCt7P3bPY/s/1ZCdgpgHxmrLMjddOk2mmoH66jGk/K++B
         nkqvbFaqgC3sBI8yTZWjDn0dxY2AxoUveNuSxEqScGMagc0YlkxpB2v358MGq15pATsZ
         VF986kW2PWLNhDRABfVhkrOrlSC24kbq136hVZ4O8RpZeksZvwx8A2bKz7dTMZ5vRaPk
         6d9XH1n42rK6hsf/Hi4F5GCvrDcxYLrLL3kAqeBASW1IJo5NDguEDHeeFJEZE5A0FMH5
         6OBw==
X-Forwarded-Encrypted: i=1; AKwUvBzwJS0oZiPNtOr+2EkGxi5HE17XnM8HVMmvOZLev9uhOmdfJkyo+uwX/+QqffwtckEsbEe4CBM2emAExlc=@vger.kernel.org
X-Gm-Message-State: AFuF++lk8I1VUIxYHPs1AD4qpzEEuJkovA+ffGsDdSeOR/YijB4uuTb6
	KDSdG5eWjS+1eHo9DRQ3rUho5pUH0A5NCcCrMdmTLtJgMtz+5YBSR5BPRGlqR8Ngx1VYa7bVfSH
	2mU5bcZM5TSsNO6R4/tQ7MBS92DtV2VA=
X-Gm-Gg: AYBFou14UOxGBJIfCKz/6bGW7UXzDdcY70Au+3SwRrTS57jtP181gzc75jEOp9xxIx7
	e2fYiv687H8x1ztUjY1m84IDAgd2o/izi2Hq9BX4atasAaFO/fRjdfwLgbflu5MIME7nscPtDYh
	18hBTaTqdQII1FODPZYQuJrFAg7Ait6WskEWCAwDYTl9ntfK0gWNkOInhddtgkCjVqhxqcQrQaD
	CwrnG9pO+gHK6DFnvTV8A0AZk+YmU6WpKwTLYWF7PKNG1mbUId2j5RiQ+55HF1NLL9w4l+8lb4P
	qUflJJ6FQ3f4NvDAwZ6/ZpXgFSx3wURHiBVjH1bgbiKNBlsdRiIGacd8JhtvBfVWlBNP9Q863Yh
	G51M=
X-Received: by 2002:a05:6402:1d49:b0:6a6:4783:b6ff with SMTP id
 4fb4d7f45d1cf-6a663a0c7cfmr4159722a12.4.1788251358491; Tue, 01 Sep 2026
 01:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831074937.2380914-1-kunwu.chan@linux.dev>
 <0eac36c5-acd2-4d8d-a498-f56a57cc3d6a@paulmck-laptop> <CAN_Opa_z4e8fLM0=+QV82r4oveKKUWitvNrBnsfJhXd+2-QQLQ@mail.gmail.com>
 <ce1789d4-7a78-456c-9e6e-e9af824e5285@paulmck-laptop>
In-Reply-To: <ce1789d4-7a78-456c-9e6e-e9af824e5285@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 1 Sep 2026 16:29:05 +0800
X-Gm-Features: AcwNN1UX9qFts8aw38XxscSqvVL6yRKx4puULXSDGn6UyyeqsNPuBpayr_EIJYc
Message-ID: <CAN_Opa_AYw-KSA-u5=fjGLOP9z-Cf1Dk2Fba==MSLAX7TZSYWQ@mail.gmail.com>
Subject: Re: [PATCH] srcutiny: Add atomic SRCU operation checks and state
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 11:10=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Tue, Sep 01, 2026 at 10:00:24AM +0800, KunWu Chan wrote:
> > On Tue, Sep 1, 2026 at 9:04=E2=80=AFAM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> > >
> > > On Mon, Aug 31, 2026 at 03:49:37PM +0800, Kunwu Chan wrote:
> > > > From: Kunwu Chan <kunwu.chan@gmail.com>
> > > >
> > > > Add atomic SRCU operation checks and the associated state to Tiny
> > > > SRCU.
> > > >
> > > > An atomic SRCU domain does not use the normal SRCU callback and
> > > > grace-period machinery.  In particular, a callback queued with
> > > > call_srcu() would never be processed.  Use WARN_ON_ONCE() to reject
> > > > call_srcu() and srcu_barrier() on atomic SRCU domains.
> > > >
> > > > For synchronize_srcu(), redirect atomic SRCU domains to
> > > > synchronize_srcu_atomic().
> > > >
> > > > Add srcu_reader_flavor to the Tiny SRCU state for these checks.
> > > > Tiny SRCU does not currently set the flavor for atomic SRCU domains=
,
> > > > but keeping the flavor in the common state allows the operation
> > > > checks to enforce the restriction once atomic flavor tracking is
> > > > enabled.
> > > >
> > > > Also initialize srcu_atomic_gp_flag, which was previously left
> > > > uninitialized.
> > > >
> > > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > > > ---
> > > >  include/linux/srcutiny.h |  1 +
> > > >  kernel/rcu/srcutiny.c    | 12 ++++++++++++
> > > >  2 files changed, 13 insertions(+)
> > > >
> > > > diff --git a/include/linux/srcutiny.h b/include/linux/srcutiny.h
> > > > index 47a368f945e3..2b293336525a 100644
> > > > --- a/include/linux/srcutiny.h
> > > > +++ b/include/linux/srcutiny.h
> > > > @@ -20,6 +20,7 @@ struct srcu_struct {
> > > >       u8 srcu_gp_running;             /* GP workqueue running? */
> > > >       u8 srcu_gp_waiting;             /* GP waiting for readers? */
> > > >       u8 srcu_atomic_gp_flag;         /* Serialize atomic GP work.*=
/
> > > > +     u8 srcu_reader_flavor;          /* Values: SRCU_READ_FLAVOR_.=
*  */
> > > >       unsigned long srcu_idx;         /* Current reader array eleme=
nt in bit 0x2. */
> > > >       unsigned long srcu_idx_max;     /* Furthest future srcu_idx r=
equest. */
> > > >       struct swait_queue_head srcu_wq;
> > > > diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
> > > > index 26ea4bfbeaf2..22f7716cbb0e 100644
> > > > --- a/kernel/rcu/srcutiny.c
> > > > +++ b/kernel/rcu/srcutiny.c
> > > > @@ -41,6 +41,7 @@ static int init_srcu_struct_fields(struct srcu_st=
ruct *ssp)
> > > >       ssp->srcu_cb_tail =3D &ssp->srcu_cb_head;
> > > >       ssp->srcu_gp_running =3D false;
> > > >       ssp->srcu_gp_waiting =3D false;
> > > > +     ssp->srcu_atomic_gp_flag =3D 0;
> > >
> > > Good catch!  I will be folding this into the base commit with attribu=
tion
> > > on my next rebase:
> > >
> > > 9a2e9996ccec ("srcutiny: Add an atomic Tiny SRCU")
> > >
> > > >       ssp->srcu_idx =3D 0;
> > > >       ssp->srcu_idx_max =3D 0;
> > > >       INIT_WORK(&ssp->srcu_work, srcu_drive_gp);
> > > > @@ -289,6 +290,9 @@ EXPORT_SYMBOL_GPL(srcu_defer_drain);
> > > >  void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
> > > >              rcu_callback_t func)
> > > >  {
> > > > +     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLA=
VOR_ATOMIC))
> > > > +             return;
> > > > +
> > > >       if (should_rcu_defer()) {
> > > >               /* A re-entrant call_srcu() during the drain would li=
velock it. */
> > > >               if (READ_ONCE(srcu_defer_draining) && !in_nmi()) {
> > > > @@ -319,6 +323,11 @@ void synchronize_srcu(struct srcu_struct *ssp)
> > > >  {
> > > >       struct rcu_synchronize rs;
> > > >
> > > > +     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLA=
VOR_ATOMIC)) {
> > > > +             synchronize_srcu_atomic(ssp);
> > > > +             return;
> > > > +     }
> > > > +
> > > >       srcu_lock_sync(&ssp->dep_map);
> > > >
> > > >       RCU_LOCKDEP_WARN(lockdep_is_held(ssp) ||
> > > > @@ -415,6 +424,9 @@ EXPORT_SYMBOL_GPL(synchronize_srcu_atomic);
> > > >  /* Register any deferred callbacks, then wait for all in-flight on=
es. */
> > > >  void srcu_barrier(struct srcu_struct *ssp)
> > > >  {
> > > > +     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLA=
VOR_ATOMIC))
> > > > +             return;
> > > > +
> > > >       __srcu_defer_drain(ssp);
> > > >       synchronize_srcu(ssp);
> > > >  }
> > >
> > > The rest is good as far as it goes, but don't we need to set the valu=
e
> > > of ssp->srcu_reader_flavor somewhere for atomic srcu_struct structure=
s?
> > >
> >
> > Hi Paul,
> >
> > Yes, agreed. I have the flavor tracking changes implemented locally
> > and am testing them now.
> > I=E2=80=99ll send the updated patch shortly.
> >
> > I also have draft patches for the documentation and the fast path, as
> > well as rcutorture testing for
> > tiny atomic srcu , which I=E2=80=99ll send separately.
>
> Sounds good, and I am looking forward to seeing them.

Hi Paul,
I=E2=80=99ve sent the flavor tracking changes as [1].
[1] https://lore.kernel.org/all/20260901074815.3145037-1-kunwu.chan@linux.d=
ev/

>
> I will admit that I am curious as to why Tiny Atomic SRCU needs different
> rcutorture testing than does Tree Atomic SRCU, but I will ask myself
> that question again when I see your patches.  ;-)

You=E2=80=99re right that the existing SRCU torture configuration can exerc=
ise
the atomic path with rcutorture.reader_flavor=3D0x10. I had prepared
the Tiny atomic torture test as a separate draft, mainly adding local
configurations for convenience while validating the Tiny and Tree
atomic paths. There is no Tiny-specific torture model here.

I can adjust the final rcutorture configuration and naming based on your
preference.

Thanks,
KunWu

>
>                                                         Thanx, Paul

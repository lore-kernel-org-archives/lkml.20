Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F393955D6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014469; cv=pass; b=FQIDFWL2LnfApA/4W/fbYC8NPQQSTdXCC9i1IuaVy0zg9fh0ltjFnxsOdkKWbAa5kiiV3OM8oPg7nklf+BhgFu7yGZNJ5JntpHb/PC/2jXcgRtaQf3v+G034xISndi4tiCv3Z6ZtFV/JZAhChYZTgsu5YqvV96wtJosVW34AlMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014469; c=relaxed/simple;
	bh=MYU9OpzBZLsQzkXTlej2bdd+H+Auq3i+G/TlNIgBvxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaOyCC/fBvSo1YyrKs4ziLYJd18kOm+TF3g95qmTN5vCFsJ1CeAK1mlnrbugJpPW2aM2kvf8Vbo+0CxiMdPvJ4bG1R4+1W/YmAVjESjKAx1/HJXVvrTy5J44KcEffnrFqgxkplWKxZ8BhtPcy1vnI+0UOEKm85eKIc2cfXp+5AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiWlEfyW; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiWlEfyW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso10706185e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789014464; cv=none;
        d=google.com; s=arc-20260327;
        b=fj9nEgi6jrirnFKr9XAok0XHJqdkDFpv4ywrx9BDcVefWSiG9wZkJkV/d3aYmNoWyj
         7WV/nfkwfsqYpbfGqn9AGkyoJfLn5Mg720dYCWKO9BitHY/oHwvd7DAahiypqsZUd0OB
         rcW6LqWLWzm19ej1mmMhqo9HWH6gM1nVgyAzi0wfoDCoLZKo/L64IizFLnt49Vr532qD
         lX+g1aHthAJ0HOGXydRvuT60k76rbJicBZeznBj3Svyq93gK8QtXS13aQcgFbNG9BnnA
         qF/wK8MBsuPnadbZfyymqsWeuUq9yOc6MGD+7ByM9MFG9A/J3yBrceGRZqZw+Bu2A/8x
         npsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tmt580Wcn8Bj1vHX81UjDGhgKre8nawir61F+yXmA4Y=;
        fh=q2sn3OpacaCtN0YuQ9IWmbhZgO1qPjGRt1h6peujIws=;
        b=D9iqC6YpVt9XFh8NYHjIWx7NLVT5HXyEHLa6gikOWDalL7NT/wniKkHLqwuusdWChc
         R1VS1mzfNvzhzXWe1Qe/XBKSwXSV2TC4BLgCtoEOaTvbbNMsAfeRBcGVvEmUBVL6nD5i
         lvXi7jY8ewzwGdT4Rc4JjXDbAgAGph2R734K6U6lt5srTTIYzs0ru88RLVuio2+5/3l8
         zecEt7/xzzielv2psHFQZihumLuwYp5TX0MBf8Cb27PS1X+2pG3NQsbAXM1Rs5ymUl28
         Z696VcZJs206Z51gdr81zNgA5+fjj36d+HlCqYw102XdIIhqioBnsf7+uVGmQMYQud6q
         NKjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789014464; x=1789619264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tmt580Wcn8Bj1vHX81UjDGhgKre8nawir61F+yXmA4Y=;
        b=WiWlEfyWxuGErSH0HUXX/lBKE7MB+JX2SBCZu+ONUddVoT6VNGNPOqNIa09ov8r/oT
         CYwTtXr5jqGjNaL1zAx16s92F3bikzeTsQ4PrMvKdV86sgliO6zBvUa0+a89kY94alIq
         SawSehRpz9mFgBfwGTT6l3pdfnBu7l33lX7ImT90+XRensBJiMgG15KP5nB5u85f/AyD
         tglY1/2l4q6gleVUK6N62qZszGTeeYp+ATqvmHYH030KIomwg9ToU489h06Zd95gftiy
         RLbdPZivkuXvaUCaiFeydCLpIOJmkaDVfR1vBSX5TyIMjugPqCVulA2UMX1GC4PcCM54
         VTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789014464; x=1789619264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tmt580Wcn8Bj1vHX81UjDGhgKre8nawir61F+yXmA4Y=;
        b=NtvAkQpMI+XvBBjHAMlCY4my/tfRJL7/3XueuTw9D04J83ttxp6NUyyIgML/tqExo4
         bz1xgAW2e7eon1YWNdFrFeDIKdthD2MRPP3/3cpd1iD7j1RwM46RQzQgC8kWnaMRQIto
         xmAK2qDLWEUeGF7EkrwloPM4o8wPKPvxEWRZLElBln946juRP/DcYBOmQrTuycWJCa9U
         QZaCRQoByqiPM6+Ky5pXYMcOkUq8Zhs2q+YDexvPt+1ur1jQwNtB4t5TSwt1BwPiG2mE
         Ig+umxjyGfY8KBDs9OUB++itUuV+QpjinWeNLMm0zR8AIehO8eKCVmE/XECfSn1L3ejy
         ivEQ==
X-Forwarded-Encrypted: i=1; AKwUvByObXLimhxrMTy7+evLRVHwf5U9ZaSz9JGSRNCJTstRQ+yH75VCufyAgkfxxRk9V31dJDRNmugFXvNwCBY=@vger.kernel.org
X-Gm-Message-State: AFuF++mG+vm3WJfUSfjTwFFRwSMRWPWVCPAPTRWWkgirdGXJCnLFnvKH
	H+7pK/AVjqaXIuVM/XDh3myaaFIuBWHHLEb28DF9pWId/xvvLMU2DbXuZ4880ZqTGNsLXVBj9zz
	XfbfJk//pNq2YykvE/OKFNg6OLuQYYP1lb8pOBvGK8g==
X-Gm-Gg: AYBFou0HKR3YHa2rpkZFtJa6AGAUfDtTQibKfuI9Jqz1mep6HyiAF/MfSEkZpqO+dFJ
	sNDyEoJRgSCdFSV/mLa4t63qimam4JqsxoSP/KFHaMJP5SeUwvP9vpQ26s9KpcUg7qiHy2zwdtx
	L2Fmlgtl3nEaXDVRrxfn9uf6ymE4EqyzIJiJgfODDs31g/GL4isHRkUwRt8k82vPJhXgMhjdCsf
	iGKzRm7SZ4zn6xU5XKJFMF7BVe6eCrmN2dE/ws+MKX4R3cpjXaQwQ0Uy7k0u50HpZy3djooHm6A
	7hRY1nABgUhKekdwpo53IFf6lwV6PeMaD6nVIzCzVd6xvCJPIY8yF/JT/iiVf+u7jmRVfZjbcSc
	py9vVwPtVWo5S1g==
X-Received: by 2002:a05:600c:5307:b0:49c:f617:7cf with SMTP id
 5b1f17b1804b1-49d25871d73mr98713615e9.0.1789014463535; Wed, 09 Sep 2026
 21:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cb71412b-a688-4c70-9365-3f6bd40c9244@paulmck-laptop>
 <20260909024515.2429893-1-kunwu.chan@gmail.com> <8d5c8d6f-6788-43bc-b5e3-c8bca8e984be@paulmck-laptop>
 <CAN_Opa-FsrNsQM5WPCGBkQ43ECps36e_KyTzG9niEnm6KpdBEw@mail.gmail.com> <f093346c-4eaa-4faf-9a18-f1ec43247290@paulmck-laptop>
In-Reply-To: <f093346c-4eaa-4faf-9a18-f1ec43247290@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 10 Sep 2026 12:27:31 +0800
X-Gm-Features: AcwNN1XhvE57L4UNELOYOl-j5GVVFtVed7RTvIvW9yPwvKk4l63MZgA59RSJkHY
Message-ID: <CAN_Opa8OybZ6Ea9LCKPGN3Ntx-ObJ+owTawnP_vvgFzqQe=s8Q@mail.gmail.com>
Subject: Re: [PATCH 07/13] srcutree: Don't transition atomic SRCU to big in srcu_gp_end()
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:46=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> On Thu, Sep 10, 2026 at 11:18:20AM +0800, KunWu Chan wrote:
> > On Thu, Sep 10, 2026 at 8:13=E2=80=AFAM Paul E. McKenney <paulmck@kerne=
l.org> wrote:
> > >
> > > On Wed, Sep 09, 2026 at 10:45:14AM +0800, Kunwu Chan wrote:
> > > > On Tue, 8 Sep 2026 16:38:19 -0700 "Paul E. McKenney" <paulmck@kerne=
l.org> wrote:
> > > >
> > > > > On Mon, Sep 07, 2026 at 03:58:23PM +0800, Kunwu Chan wrote:
> > > > > > From: Kunwu Chan <kunwu.chan@gmail.com>
> > > > > >
> > > > > > The transition-to-big code path in srcu_gp_end() calls
> > > > > > init_srcu_struct_nodes() with GFP_KERNEL, which is illegal in t=
he
> > > > > > atomic context reachable from synchronize_srcu_atomic().  Atomi=
c SRCU
> > > > > > has no use for the srcu_node combining tree: it has neither cal=
lbacks
> > > > > > nor srcu_barrier() operations, and its grace periods are serial=
ized
> > > > > > by ->srcu_atomic_gp_flag instead.
> > > > > >
> > > > > > Skip this transition entirely for atomic SRCU, which is also de=
fense
> > > > > > in depth against any path that might wrongly set ->srcu_size_st=
ate for
> > > > > > an atomic srcu_struct.
> > > > > >
> > > > > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > > > >
> > > > > Again, given that we have this commit, is this patch needed?
> > > > >
> > > > > 4e01d5320a2f ("srcutree: Suppress to-big transition for atomic SR=
CU")
> > > > >
> > > > > And again, if so, please tell me what I am missing.
> > > >
> > > > Yes, this is a separate transition path. That commit suppresses the
> > > > initialization-time transition, while this patch prevents the trans=
ition
> > > > from srcu_gp_end(), which can otherwise call
> > > > init_srcu_struct_nodes(..., GFP_KERNEL) for an atomic SRCU.
> > > >
> > > > So this is defense in depth for the atomic path.
> > >
> > > Fair point.  But is there any additional pathway other than the
> > > SRCU_SIZING_IS_TORTURE() check at the end of srcu_torture_stats_print=
()?
> >
> > I checked all transition-to-big pathways for atomic SRCU.
> > Atomic SRCU can reach srcu_gp_end(), but its srcu_size_state remains
> > SRCU_SIZE_SMALL,
> > so the transition condition there cannot be satisfied.
> >
> > The contention path is also unreachable:
> > synchronize_srcu_atomic() calls srcu_gp_start() directly and never
> > goes through srcu_gp_start_if_needed().
> > The other callers of that path reject atomic SRCU.
> >
> > The only remaining explicit transition is SRCU_SIZING_IS_TORTURE() in
> > srcu_torture_stats_print(),
> > which currently lacks an atomic exclusion. I'll send a follow-up patch
> > to add a srcu_reader_flavor check there.
>
> Very good!
>
> > So I agree the srcu_gp_end() patch can be dropped.
>
> It might not hurt to have a WARN_ON_ONCE() there, just in case someone
> implements another pathway.

Thanks, Paul. I'll send a v2 of this patch separately, dropping
this patch change and adding the WARN_ON_ONCE() before the
transition check:
+ WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_ATOMIC &&
    ss_state !=3D SRCU_SIZE_SMALL);

if (ss_state !=3D SRCU_SIZE_SMALL &&
   ss_state !=3D SRCU_SIZE_BIG) { ... ....

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
> > > > Thanks,
> > > > KunWu
> > > >
> > > > >
> > > > >                                                     Thanx, Paul
> > > > >
> > > > > > ---
> > > > > >  kernel/rcu/srcutree.c | 5 +++--
> > > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > > > > > index 01f224a56b41..74acd5645d4c 100644
> > > > > > --- a/kernel/rcu/srcutree.c
> > > > > > +++ b/kernel/rcu/srcutree.c
> > > > > > @@ -1074,8 +1074,9 @@ static void srcu_gp_end(struct srcu_struc=
t *ssp, bool is_atomic)
> > > > > >           raw_spin_unlock_irq_rcu_node(sup);
> > > > > >   }
> > > > > >
> > > > > > - /* Transition to big if needed. */
> > > > > > - if (ss_state !=3D SRCU_SIZE_SMALL && ss_state !=3D SRCU_SIZE_=
BIG) {
> > > > > > + /* Transition to big if needed, but never for atomic SRCU. */
> > > > > > + if (!is_atomic && ss_state !=3D SRCU_SIZE_SMALL &&
> > > > > > +     ss_state !=3D SRCU_SIZE_BIG) {
> > > > > >           if (ss_state =3D=3D SRCU_SIZE_ALLOC)
> > > > > >                   init_srcu_struct_nodes(ssp, GFP_KERNEL);
> > > > > >           else
> > > > > > --
> > > > > > 2.43.0
> > > > > >
> > > > >
> > > >
> > > > Sent using hkml (https://github.com/sjp38/hackermail)

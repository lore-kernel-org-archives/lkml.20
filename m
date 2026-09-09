Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BC545D919
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788995307; cv=pass; b=LAW0Hduc1ZeRDmEpcYuiON8Ifaj73jlJEOikgFKYlN2jXvtDk0nXEnxKc6VBwBQ5TksmoLwWRIUdJYCPSuSdb6OJNf3/YZgqxgwK7Tn3KyAya4LVxJf6C3lguQycJp0dir/b4JQOysGuksaxS/aCJGHjugOmZy+O2ujReCwjv+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788995307; c=relaxed/simple;
	bh=PXCiYUIUDFbcVYjS13LmGtnLqgKi8EElaJmcYhZhgTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3ypf2/VfqLU20NoHnoExwH0iPSpacBC1uwY/EDm1qdor9jQi4Y275XIbUGJnpnKSKHT8RexwqzeQ0dUg3DEjQRfaNPYxzwkIVNLExrZMvr38zeAPfgF2BIWtoQEEEfuLYu69b3aSTAEjY+K4rWpj50zu0MF2wlRV0soXEHKXFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=V9+arPla; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="V9+arPla"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso9531113a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788995304; cv=none;
        d=google.com; s=arc-20260327;
        b=qkXCTMhx+bwyW2Ft8Gp87AwdY5bsg4wMPaddtzG842Gvm0Kw99sJ43xsMSbjOE/Nxw
         ka60kljz4GA6RV2afhFTKTzJxXTbHXRrBOdYJeJB0goQxb786qW0tVgfCDFG165McLuF
         bUoILK/keVZyF/CaeMOXpNe/zrxL6+KHs9/gXuV1KO0j0DcS8larDVFg7uI+IBH/RTkZ
         tFu8S6AY9zHljexN3+99bJ7hgVcf/Ci287pG+/7zTScSvTj/OasHcaVngh+Kr0Mscm5i
         bna6olU0aXFOqRCwtmKn980aYD8mlazAWvRhSCol5JKg8dYqeXe03k81Xua6w+gPs9ZO
         01DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3HeYunSbblpdsvV1s5ghuqQTniP2lHfFC4mJtus2dow=;
        fh=CuU2ZepijStF2NjOnHjxoIAkK76DDq+FASWMsabR+RQ=;
        b=dWrMxWz3P8dIkdeZYdi6JEstwr2uapotKbQjwR8DfWDT227uk+c2x29XtHHWUyTxcO
         FwwuwaJT+BePdI2jZhjxFIoIIFuYbAJA1GZvfJJejUDhlhfgyrGhjmLQ3pXMnMY2Ctom
         7rf7BsgN5B32dE9831rfmP42bUAcPYsdDbBSFfD9sbo4rdB+lB2fJR5jNjnGv/7MbZvg
         5mFYDXj3wpTv+DuT0gsCX1GbxaKMiI9h0wvF49/mCmaq4SFMROYs2771uNuB8yMdZDG1
         n4tNQj5l0shaa3J35Z09/6+iVrfLImDFgw4eRp/GkOQFBEHxxnZehPhTX3v2Qny3PcnT
         wO+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788995304; x=1789600104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3HeYunSbblpdsvV1s5ghuqQTniP2lHfFC4mJtus2dow=;
        b=V9+arPla0SL8qTc6bDoEa0KlmBKTUybqYAio8v07RTbEGg4p7JUSbkOyCeQlbQiKdm
         aNUIVrOuFwEvRQHmNAaaPyZQ5ZDpvbVVdAReB7FFGb5oSZGkSuB5h4N8cEhDxeX7Mve6
         MicGEG/4nRHuFOn9V9UOO1dsrAV6lrA38D0HmFtlV/GGyZh56NYoY7uHUogErRIExnvB
         rc/6q/KcbCwefGlgkrn2KoD/b12fmj9w+ia7aeqjRwthBCxmkIJYm5R4dgfpAIis38MK
         7g+8ILGrl9gyjr0XhnF+vN7pjldKPWRTMoh/BxpNZEqe8fs0vmbDxTBowkmMZUt1nmjO
         Av1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788995304; x=1789600104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HeYunSbblpdsvV1s5ghuqQTniP2lHfFC4mJtus2dow=;
        b=mCGjCHCh3BAsnqqVbCoPEFpYX/S2NZD31EevzXXb1d+6p4NZEtOG5G+pqOli8jrxyx
         AV5Mn1dmG5JO0/J0hpqwD9IN3HDzTraJfW3ilKz/kGlmPq/s6U+Z2IX6DgiszTgX2CcZ
         VNGBek7p9QjcAVrwNoXXxqApCAp8OSJdmY9Ba8i0+C+96F3/8qwW0eWDKKvUQl83NtIn
         +Y95yuk2EEAlpGlzTOAknfweDyHlLr7p21H8FSI1oSuwAkrCpM7t+66ES2Do+KqoStRu
         3uTY1ZnCy9fKh/kMBD1yInKoy/LPrgK0j98VXukx7SiGIxqsZcHYNG6DsyBr0qlHsChG
         zxKA==
X-Forwarded-Encrypted: i=1; AKwUvBxYrX2EGlP8O1pkhqflc8qxzTC34i0TuwlttLU0jBYeNsTd4E18FBp/c8FOBhpWN9TX8zyIvMPQizaG9O4=@vger.kernel.org
X-Gm-Message-State: AFuF++nze3GYQXcZ2PdStWdLb8QVm7JPdREqSEtZVBFxQ+nGy/C7DuLI
	j1Y3aRJQ/fEXOHD4Gpm+cvhec+UX3YqBfDEKJZimDCUVWCq4vaq1J5MArAI9bGmeoeqJQflW1s4
	EpCD2aCDcvevuxNUOmveDxIDAKNWQpP3tMOj2hwk4
X-Gm-Gg: AYBFou0YBOzEP7FtcRb9R7eUMqe74YHidQ0wqY96HjFzkONoldHbde0RSk+brRjEIKn
	oTjhMCPiuA6B2N9AddoaUIKllqYc4Lpz2IBJJkfTu2tSna8EVrrKQq2AyERYa6SwJRlzT62Df1c
	yM21eUPxfdojMwyPFVd0DgLf4HAnlRy6uHL0AdGYo3cCbzYfe4555sMP9xGSKANK1zW4UlmQ+AU
	NXsSLMqOaXPJRGccxS4JlZrP+EyuoH7l3t9ATaFrVJ1ej9S6yl1PfkbHJ5qnRiT5imPZq54KoI8
	SuQ27p7J/gKGJKZV/semR+u/Bf4OUkVhnBZx3cChnBe/gw5Av1r5xS7AT3KKZ1WhQrpgEI5HH1F
	w27sDQHokwD4=
X-Received: by 2002:a05:6402:51d3:b0:6a7:f25e:31c7 with SMTP id
 4fb4d7f45d1cf-6a7f25e3481mr12004386a12.19.1788995303609; Wed, 09 Sep 2026
 16:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909193719.518517-1-utilityemal77@gmail.com>
 <20260909193719.518517-5-utilityemal77@gmail.com> <CAHC9VhQHZ+ngFdzKqmnzBh341CGEg-jexu+QYU8=1qXK=u-x-Q@mail.gmail.com>
 <aqHUw6k0Mf83CGFT@zenbox>
In-Reply-To: <aqHUw6k0Mf83CGFT@zenbox>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 9 Sep 2026 19:08:05 -0400
X-Gm-Features: AcwNN1VWtmI7TVPKE3LPkQppsWuLJXnoUTUb0EBC2ejua9Hn27X6xeBhQULdxgQ
Message-ID: <CAHC9VhTM7emi9vxs+5Za8Hrc_e9dg7fZx+Z6BGUc4VQ1qhEAUA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 04/15] lsm: Add the bpf_lsm_policy_release
 kfunc and policy object destructor
To: Justin Suess <utilityemal77@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	kpsingh@kernel.org, matt@bobrowski.net, mic@digikod.net, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, kees@kernel.org, 
	casey@schaufler-ca.com, gnoack@google.com, jack@suse.cz, song@kernel.org, 
	yonghong.song@linux.dev, martin.lau@linux.dev, eddyz87@gmail.com, 
	memxor@gmail.com, jolsa@kernel.org, m@maowtm.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 6:21=E2=80=AFPM Justin Suess <utilityemal77@gmail.co=
m> wrote:
> On Wed, Sep 09, 2026 at 05:34:31PM -0400, Paul Moore wrote:
> > On Wed, Sep 9, 2026 at 3:37=E2=80=AFPM Justin Suess <utilityemal77@gmai=
l.com> wrote:
> > >
> > > Add security/bpf_lsm_kfuncs.c, the home of the kfuncs exposing LSM
> > > policy objects to BPF programs, with the first of them:
> > >
> > >   bpf_lsm_policy_release(object)                KF_RELEASE
> > >
> > > The kfuncs are the LSM framework's own BPF interface: there is no
> > > per-LSM kfunc and no intermediate security_*() layer.  Each kfunc
> > > walks the matching hook's implementation list and calls the one
> > > registered by the LSM whose lsmid the policy object carries.  Calling
> > > a kfunc for an LSM that is not active or has no policy object support
> > > fails at runtime rather than hiding the kfunc at verification time,
> > > so BPF program loading is independent of the boot-time LSM
> > > configuration.
> > >
> > > A policy object reference is meant to be handed over through a map
> > > kptr field, so also register a destructor for struct
> > > lsm_policy_object: map-held references are dropped on map teardown,
> > > possibly from a context that cannot sleep, which the
> > > policy_object_put() hook contract accounts for.  For the same reason
> > > the kfunc is not KF_SLEEPABLE, and the filter adds no per-kfunc rule:
> > > releasing a reference must be allowed wherever one can be held.  The
> > > filter itself is needed because BPF_PROG_TYPE_LSM and
> > > BPF_PROG_TYPE_SYSCALL, the two registered program types, share their
> > > kfunc lookup buckets with other program types.
> > >
> > > Cc: Paul Moore <paul@paul-moore.com>
> > > Cc: KP Singh <kpsingh@kernel.org>
> > > Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> > > ---
> > >
> > > Notes:
> > >     v2->v3:
> > >         - No change.
> > >
> > >  MAINTAINERS               |  1 +
> > >  security/Makefile         |  2 +-
> > >  security/bpf_lsm_kfuncs.c | 98 +++++++++++++++++++++++++++++++++++++=
++
> > >  3 files changed, 100 insertions(+), 1 deletion(-)
> > >  create mode 100644 security/bpf_lsm_kfuncs.c
> >
> > While not a new concern, it has been a few months so I want to mention
> > it again to see where things stand with the BPF crowd: are the BPF
> > folks still opposed to BPF kfuncs in security/bpf_lsm_kfuncs.c,
> > similar to fs/bpf_fs_kfuncs.c?
> >
> > If the answer remains yes, the BPF devs are not able to tolerate
> > kfuncs under security/, then I'm afraid this patchset is stuck.
> > However, if the BPF devs are willing to ACK kfuncs in
> > security/bpf_lsm_kfuncs.c, I'll add this patchset to the review queue
> > for the LSM tree.
> >
> To avocate for the current placement:
>
> Placing these kfuncs outside where it is in security/ would
> be very awkward, the kfuncs use lsm internal APIs
> (lsm_for_each_hook, active static keys, lsm dispatch table) that
> have no buisness outside the LSM framework.
>
> And logically, the kfuncs operate entirely on in-tree lsm objects.
>
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 6215fcb07770..ba816d7ee127 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -5081,6 +5081,7 @@ F:        kernel/bpf/bpf_lsm.c
> > >  F:     kernel/bpf/bpf_lsm_proto.c
> > >  F:     kernel/trace/bpf_trace.c
> > >  F:     security/bpf/
> > > +F:     security/bpf_lsm_kfuncs.c
> >
> > We would need the maintenence of security/bpf_lsm_kfuncs.c to fall to
> > the LSM framework, just as the maintenence of bpf_fs_funcs.c falls to
> > the VFS.
>
> Agreed.
>
> I intend that any security/ kfuncs go through both LSM and BPF
> review at a minimum. As a bug in any of these kfuncs or their permitted
> calling context / signatures could cause regressions in either subsystem.

While some other subsystems are lax on this, it's general practice in
the LSM space to *really* try to get ACK's from other affected
subsystems before merging.  Sometimes we move forward anyway, e.g.
patches being ignored for almost a year, but those are exceptions
rather than the rule.

I only bring this up because the MAINTAINERS entry was pointed at the
BPF devs, not the LSM devs.  I would expect that patches going into
security/bpf_lsm_kfuncs.c would need to be ACK'd both the LSM
framework and BPF LSM maintainers.

--=20
paul-moore.com

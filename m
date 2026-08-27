Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D673451CC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851799; cv=none; b=nMfHS8RUbM7xs0e147pdu7yBNPIxlwCkqU1N4ln/8Lq6+YcjYx0Dbeck8kuqcw1WWlKlOchQI4v8bd4DfRnwjFloKC2iauvYshIdog0GVZkek8W6s2LzI+5KePIhnwAHJJvB3uhttirxCoM7FETaZ/DbjUpp4TGjjvBKfaKeoXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851799; c=relaxed/simple;
	bh=3zPkyPTXDnyL5egsn3MZ/cotncHlbWkVNMLXPqhUr6I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m+hELJpNTSdIwO6tOblrnBQ6+q/r2YJMH3UjxbOV2cAm8wvRa/zN/FrTHGFtUS1ERR0+RNYS0t1wxqOE5wOBsXZuEAErwDDkjTBvG1/3FuHxtcb0eBfCfCbZytlfKtcqm82aEdukKwkOtW+/lQOXFXiCpI6PLGjMl0QUTpu5Qg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M7oZZoFk; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M7oZZoFk"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso302189a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787851797; x=1788456597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SkajVKfsWoP3QSoYBM62ZOQdeaSxYKJsxo5u0waN6kU=;
        b=M7oZZoFkI7UJ0htFY9pyuyZCgzMPrl2Cutdu9ibKfrOcfxgrJ+5LSN8BpAOR36oSWV
         xu3ho842nYLjNs69+a/Gfb/F7TABA06KOyqOYwkW9hocvYiZyZR7hFCRs2FJHU+VUMnj
         ramYSJLrCraj4FYMzke9CY5dkoFLFcQ7IMIW++oApJBGyDFjYqJw7GWDSmfr9HMk0pH+
         xZGgbfg4wdVI83JZfLOqfZy+xm7NyLE7Rc/HhrrIJ9lQojglSWX30ZE/X4hKVQpGxz+7
         nUQASuC92RuBPEh+JqLarPTMijq/4SJfdWlMHaMwk0697sWnNJ+SdpJK+K0uMoAFLyxw
         2PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851797; x=1788456597;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkajVKfsWoP3QSoYBM62ZOQdeaSxYKJsxo5u0waN6kU=;
        b=JE3KmMnZlYmCuWYXTn6mMVhsfU8HjJxiUaIje7Idix4G5FJeVRN4zfaNGHUL/psjtp
         gHsn1tfe/a52yOCZnteR0EezOQAEGOBGJjC5kqNKxVQi2cw9W07C8DgQLPhSfMls2EKK
         CtZ9h/ekRrCxRBNwVdo9+R9GxQhBhkB2Lq8QYoC4Ffg8tqcDv5+YXDAJ/jruKoOFY+By
         WtA3poXY0HjbslDLZT0gGyYHHJYgZTdsR28/NdDxr1wOlyzcuRUVIj6kWHCRoe2c3zLa
         D+MDLflqX0q1fcywieWy6I8gsRm9/dyYIh5oI7CyBMYzYWUy2iaqa/jNgz0r3IYPPU7j
         C+kg==
X-Forwarded-Encrypted: i=1; AHgh+RpJ6QlH4oimofVnSQQ4PMonyHp9LecByE8hH+muZzkIsoCwZzKVagm36SOF/T/lSNU+4L92Tea1oAY8x+k=@vger.kernel.org
X-Gm-Message-State: AFuF++mrvf1R1z5S9FxeWVm6HqRYAahcFEb+BGKKIQOFp/okpdKMq3Qt
	Guy9bVNsJJZxHSZh1L9zVUzFc8ALgyLDFI24SwJ1/i6RIzpYvQvK0XwC1UB58sHDg7dnEKCekzD
	TpnVI/Q==
X-Received: from pgww17.prod.google.com ([2002:a05:6a02:2c91:b0:cc1:bf1b:abfd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2583:b0:3cc:c7cf:5a44
 with SMTP id adf61e73a8af0-3d26658009cmr889974637.2.1787851797099; Thu, 27
 Aug 2026 10:29:57 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:29:56 -0700
In-Reply-To: <CAO9r8zOiPc=AdSZov9w5EN-WogpSTR54z8UuTd3oqKHiWCfNmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826211844.884951-1-seanjc@google.com> <20260826211844.884951-4-seanjc@google.com>
 <CAO9r8zM7KSRX5r-PazJ87QaZze3wkB5WmJL4e6az5akmJLterQ@mail.gmail.com>
 <apBQYmmBC8lE-KiQ@google.com> <CAO9r8zOiPc=AdSZov9w5EN-WogpSTR54z8UuTd3oqKHiWCfNmA@mail.gmail.com>
Message-ID: <apB0FLZGZPmAEk8o@google.com>
Subject: Re: [PATCH 3/4] KVM: x86/mmu: Bug the VM if KVM calcs a CPU role with
 EFER.LMA=1 && CR4.PAE=0
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026, Yosry Ahmed wrote:
> On Thu, Aug 27, 2026 at 7:57=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > > Can we shove this into the existing if (____is_efer_lma(regs)) below?
> >
> > No, because there are three more checks on EFER.LMA:
> >
> >         role.ext.cr4_pke =3D ____is_efer_lma(regs) && ____is_cr4_pke(re=
gs);
> >         role.ext.cr4_la57 =3D ____is_efer_lma(regs) && ____is_cr4_la57(=
regs);
> >         role.ext.efer_lma =3D ____is_efer_lma(regs);
> >
> > and I don't want to have to condition them all on something that should=
n't happen.
>=20
> Yeah I assumed that we don't care about the state anymore if we'll
> KVM_BUG_ON(), but apparently that's not the case based on your comment be=
low.

Ya, it's not an immediate "jump all the way back to userspace", though that=
 would
be kinda cool/terrifying.

> > OMG, I hate SVM.  I resurrected the selftest hack I used to verify this=
 bug, to
> > demonstrate that Sashiko's "technically that's undefined behavior and t=
his is
> > useless" complaint is wrong, because even though it's undefined behavio=
r and the
> > compiler *could* ignore the change, in practice the compiler probably w=
on't ignore
> > the change.  And since this is defense-in-depth, it's "fine" if the par=
anoid
> > hardening only isn't guaranteed to kick in.
> >
> > And in doing so managed to trip this KVM_BUG_ON() in *L0* when running =
the test
> > in L1, because as you kinda sorta noted in patch 1, KVM doesn't ignore =
EFER.LMA
> > when loading L2 state.
> >
> > I had actually tried to do exactly that, by having nested_vmcb_check_sa=
ve() clear
> > EFER.LMA if EFER.LME=3D0, but that doesn't work because svm_set_nested_=
state() uses
> > the "cache" only for the checks, not for the actual loading of state.  =
*sigh*
> >
> > So in addition to patch 1, we also need this to guard against configuri=
ng L2's
> > walk_mmu with bad state.
>=20
> Hmm wouldn't it be simpler at this point to let KVM_SET_NESTED_STATE
> and nested VMRUN have the invalid LMA/LME combination and just ignore
> EFER.LMA if EFER.LME

Definitely not a straight "ignore", because that would end up being an even=
 worse
game of whack-a-mole, because very path that checks vcpu->arch.efer would h=
ave to
account for that possibility.

We could forcefully sanitize EFER in flows that write EFER, but (a) that's =
still
a (must smaller) game of whack-a-mole and (b) it would actively hide KVM bu=
gs for
flows that are supposed to reject the invalid state.  And if we WARNed to a=
ddress
(b), we'll be right back where we are today: playing whack-a-mole to preven=
t the
WARN from being triggered.

> (or just always check EFER.LMA && EFER.LME)?

No can do, because we can't disallow the combination for L2 on VMRUN withou=
t
violating AMD's architecture.  And practically speaking, we *are* doing tha=
t,
just in a bunch of places because there's no one rule to rule them all.

> > Because there's a lot of code between here and checking KVM_VM_DEAD in
> > vcpu_enter_guest().  And has been proven far too many times this year, =
detecting
> > a flaw doesn't automagically mitigate true badness.
>=20
> Interesting, I always assumed we can do whatever we want after KVM_BUG_ON=
() :P

Nope.  In addition to KVM_VM_DEAD not being checked until vcpu_enter_guest(=
),
more broadly it only kicks in for cross-task behaviors on the next ioctl.  =
E.g.
if KVM_BUG_ON() guards against bad VM state, as opposed to bad vCPU state, =
i.e.
if *other* vCPUs could consume the bad state, then it's especially importan=
t to
take evasive action.

KVM_BUG_ON() is as much about protecting the guest as it is about protectin=
g the
host.  E.g. if KVM *knows* it fatally screwed up, then continuing to run th=
e
guest risks corrupting guest state and thus causing far worse problems than=
 DoSing
the guest.

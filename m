Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DD34432FD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852038; cv=none; b=mCvsbjRRzin0Ei01JIka1MvEfru16eyDJg/9v4whO3hbxIHsr8FKaClKFSrQJPxGYPBdjH3uNLYZyzsLmDIjL3qY+lOhEntasUhhgDxmXovc0HTuEswNHLwrMI2QK66nRRm7hD8P0zx/g64BYMdM4TTrio1SvVFCYAnlzM4qhZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852038; c=relaxed/simple;
	bh=B8tgK8pW4r+11XaPxDXT2PpkDA4xldoq70JN/X+J/kQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L82SV117H+BTGCtfL+8QqHEhi04pCynnIqhC2YZn2mnZp7LzoPbEJnslQTMQs8dAovCb+8eyzxufqraLim1zqQyaJn/rrnpziR+eVvXgu+A2/qN2Qk9cMXb5mpM4MuFTNFGk1r1hmFj9Ctyz/NYZJ/sAGc8ecNWsT0JNOccR93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gqau8kh+; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gqau8kh+"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so288574a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787852036; x=1788456836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nG/GCR2tvryuqPdn4NNkujP4GKHt43eWJXqaBb3AB30=;
        b=Gqau8kh+g2dHvcYIK8wWFg3UAPM/nfqUK/Ybz6RpaHkWPv8enGm1uSx/bIlZBkPqrD
         QVAR9JjsZFuOR2h3GDZCNz/oqxOG/S24vFhmc+fnpgvHZBk/KBywutZUoW60Wg16fYB3
         OZcoy7kD/cHnDgbO5jDGz3PhSYcqk4KhXzfzj0K75yHFWQofvT00ww3cr9pg8DG5kWSP
         y/Fm7sCEJ/mALh2NDefB4UyQJ5vxQCVSVAAKZhrqqi82bV6/R3lFl3iVIN8KDieBM55G
         S4DHUwn1xExwBrlhMjB724tXKsxX2y2qUk/NDvxaFZiF2U4RkIKdtI9/4ly41g3OBhGS
         rvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852036; x=1788456836;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG/GCR2tvryuqPdn4NNkujP4GKHt43eWJXqaBb3AB30=;
        b=V0xeJBAIcLmjIBBFh2zwYzebm9I9LUFkk3cmPYRZ46p+7DzEvTtHKvT5JCQKu+Wf6q
         xHliQSFYAH2OalRHGduGtG9YKosXs3tMB4UH8qDz3NIEhzXLuv0cUTAbY0+lUPOuPpNt
         eIys0QQWi2xXqw5/RPYy1tZYCO3WVq3+V9f7Az3aJub0sQUbm9HwWTW6WZ3PTf/kEakA
         6RNpiWtpzJl5jcay8QFGEJ5yHJWgE4kp+fHQThsyvElFVX+bkPt79RJsd1zRQ2xor151
         uA8l0NlUzrWEcvSsAtcA0BXJ0ZLq2+VWpyyJ0qfT9pXOC95mIfISQT4kgFG/pjwPmFYV
         zYoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYvWCAewBwo3rfIZbthN1AAjX/9ODY+hxqudriqpdcyyiPi7XUCoaQolcUluMA44u2CBBuR++fu/rAyYI=@vger.kernel.org
X-Gm-Message-State: AFuF++nnj4uN77EorSED5mod97D2YFjDvIa4A04dJlzdYd8cZ8sQ9CVc
	4XypU8pyiXk0/MoZFw8VSVe6lafinEJt3ak7lqYCnhTZuvQyx2wQ345rLrdw2CMAWepkWPTXgoS
	qN+LdNA==
X-Received: from pjj14.prod.google.com ([2002:a17:90b:554e:b0:38d:7b07:893c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e710:b0:381:528a:808c
 with SMTP id 98e67ed59e1d1-396d10085b8mr1544475a91.12.1787852036083; Thu, 27
 Aug 2026 10:33:56 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:33:55 -0700
In-Reply-To: <CAO9r8zNm1QcVh29rTCzAFnYdUCS4y8ZSQOvrs2DD18XASuktoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826211844.884951-1-seanjc@google.com> <20260826211844.884951-2-seanjc@google.com>
 <CAO9r8zMnPwXVf6wx_gDMzv4j47xWa7idLD+vVm9DUiB=huiLaw@mail.gmail.com>
 <apA9eLuaMxCLdCmn@google.com> <CAO9r8zNm1QcVh29rTCzAFnYdUCS4y8ZSQOvrs2DD18XASuktoQ@mail.gmail.com>
Message-ID: <apB1A5Ln_lGTI4oy@google.com>
Subject: Re: [PATCH 1/4] KVM: nSVM: Reject KVM_SET_NESTED_STATE if L1 has
 EFER.LMA=1 && EFER.LME=0
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026, Yosry Ahmed wrote:
> On Thu, Aug 27, 2026 at 6:37=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Thu, Aug 27, 2026, Yosry Ahmed wrote:
> > > On Wed, Aug 26, 2026 at 2:18=E2=80=AFPM Sean Christopherson <seanjc@g=
oogle.com> wrote:
> > > >
> > > > Reject KVM_SET_NESTED_STATE if the incoming L1 host state has what =
is
> > > > effectively an impossible EFER combination of LMA=3D1 but LME=3D0, =
i.e. if the
> > > > state says long mode is active but not enabled.  Unlike VMX, SVM do=
esn't
> > > > have an explicit consistent check for the illegal combination; pres=
umably
> > > > hardware simply ignores EFER.LMA if EFER.LME=3D0.
> > > >
> > > > Unfortunately, KVM doesn't ignore EFER.LMA in this case and consume=
s the
> > > > illegal state when constructing the shadow MMU for L2.  E.g. if use=
rspace
> > > > also clears CR4.PAE, then kvm_calc_cpu_role() will compute a role w=
ith 4 or
> > > > 5 levels of paging, but shadow_mmu_init_context() will wire up the =
MMU to
> > > > use the paging32 template, which maxes out its levels at 2.
> > >
> > > Isn't the "right" thing to do what hardware (presumably) does and
> > > ignore EFER.LMA if EFER.LME=3D0?
> >
> > No, because (a) this is KVM uAPI, not emulation of hardware, and (b) it=
's a check
> > on L1 state, not L2 state.  It should be impossible for L1 state to hav=
e this
> > combination through "natural" means, and so a snapshot provided by KVM =
should
> > never have this combo either, which there's zero reason to allow usersp=
ace to
> > provide garbage.
>=20
> Right, I understand that KVM can do whatever it wants here. I was wonderi=
ng
> if we wanted to make the uAPI behavior match the  VMRUN behavior, but I g=
uess
> we're free to make it more strict.

But again, this *does* match VMRUN behavior, because it's impossible for L1=
 to
have EFER.LMA=3D1, EFER.LME=3D0, and EFER.PAE=3D0 at the time of VMRUN.

> > > > Note, the "real badness" is effectively the same as what happened w=
ith the
> > > > nVMX bug fixed by commit 112e66017bff ("KVM: nVMX: add missing cons=
istency
> > > > checks for CR0 and CR4").  Unfortunately, the sanity check added by=
 commit
> > > > 72e2fb24a0b0 ("KVM: x86/mmu: Bug the VM if a vCPU ends up in long m=
ode
> > > > without PAE enabled") doesn't work for this case, since L2 state is=
 active
> > > > at the time of the page fault, but it's L1 that has the bad state.
> > > >
> > > > Fixes: cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE and=
 KVM_SET_NESTED_STATE")
> > > > Cc: stable@vger.kernel.org
> > > > Cc: Yosry Ahmed <yosry@kernel.org>
> > > > Reported-by: Stefan Teodorescu <fane@google.com>
> > > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > > ---
> > > >  arch/x86/kvm/svm/nested.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > > > index 73f37b050d0a..49fb10ad1f9f 100644
> > > > --- a/arch/x86/kvm/svm/nested.c
> > > > +++ b/arch/x86/kvm/svm/nested.c
> > > > @@ -2028,6 +2028,7 @@ static int svm_set_nested_state(struct kvm_vc=
pu *vcpu,
> > > >         if (!(save->cr0 & X86_CR0_PG) ||
> > > >             !(save->cr0 & X86_CR0_PE) ||
> > > >             (save->rflags & X86_EFLAGS_VM) ||
> > > > +           ((save->efer & EFER_LMA) && !(save->efer & EFER_LME)) |=
|
> > >
> > > I just realized I have no idea why we check X86_CR0_PE and
> > > X86_EFLAGS_VM here. Commit 6906e06db9b04 ("KVM: nSVM: Add missing
> > > checks for reserved bits to svm_set_nested_state()") says it's to do
> > > the same checks as VMRUN, but I don't think that's actually the case?
> > > The checks here seem arbitrary to me?
> >
> > Again, this is L1 state when L2 is active (the !KVM_STATE_NESTED_GUEST_=
MODE path
> > has already bailed), and VMRUN "can only be executed in protected mode =
with SVM
> > enabled".  Amusingly, the APM says #VMEXIT "Forces CR0.PE =3D 1, RFLAGS=
.VM =3D 0.",
> > so I guess it means business.
> >
> > If anything is wrong, it's the CR0.PG check.  Presumably that got carri=
ed forward
> > from commit c0725420cfdc ("KVM: SVM: Add helper functions for nested SV=
M").  I
> > don't see anything in the APM that requires paging to be enabled, and n=
othing in
> > that ancient series points at concrete documentation either.
>=20
> Oh yeah you're right, for some reason I thought it was paging not
> protected mode. Well then, it seems like
> nested_svm_check_permissions() is also incorrectly checking paging as
> well, seems like both checks are incorrect? Also, I don't see anything
> in the APM about checking RFLAGS.VM before VMRUN.

Presumably it's covered by the !PROTECTED_MODE clause.

  IF ((MSR_EFER.SVME =3D=3D 0) || (!PROTECTED_MODE))  // This instruction c=
an only be executed in protected
    EXCEPTION [#UD]                               // mode with SVM enabled

Section "1.3.4 Legacy Modes" describes "Protected Mode" and "Virtual-8086 M=
ode"
as separate submodes.  And the tables for most instructions differentiate b=
etween
Real, Virtual 8086, and Protected modes when enumerating exceptions.

The APM weasels around 64-bit mode by also saying "Before enabling and acti=
vating
long mode, system software must first enable protected mode".  E.g. the tab=
le for
SYSENTER describes the #UD due to "This instruction is not recognized in lo=
ng mode"
as scenario that's unique to Protected Mode.

Stating the obvious, it would be lovely if the APM explicitly stated what t=
he
exact checks are, though that's about as likely as AMD gifting me a pony.

FWIW, if that reading is wrong (though I'm pretty sure it's not), then the =
only
issue is that KVM is synthesizing #UD instead of #GP, because Virtual 8086 =
always
runs at CPL=3D3.

  IF (CPL !=3D 0)                                   // This instruction is =
only allowed at CPL 0
    EXCEPTION [#GP]


> If the goal here is to keep the checks here consistent with
> nested_svm_check_permissions(), aside from the new EFER check, then
> maybe we should also check CPL here?

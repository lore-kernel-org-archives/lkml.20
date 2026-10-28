Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198881;
	b=vZiu2O/vIsXxUjogzREPMNYASAi6SzNfgeGEOeG0L9WlZCeiWiAe0OTrTFzMsLwhToES
	 p3pjRyWyAy0BshTp8+EVCiBl9kW8FuI40nJUYePrrAtSydg2bCCXuJnQ9s6UmvvCsCh6d
	 xr8xgNFClogea6tmgJveCLzhXV5EJ9W0MgGeU7nsy1uHcS8eSTZ5LJ8yT5XaQ+SPqvFAv
	 zjfMsq3qByy9NigVJbTks6ACGxX5EdGky2JsDRW2VuHxRvZXA/0Bu0JXcB63q/b6B1E+k
	 0WFgMaTHwbfFVTkR8D+UOOvgkRqARCpRoHRS+b8zOI66aedD6NurQG/6EZhx3TYMzQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198881;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D38M57GKuL/jp5GNmYBTO2WQS2u92UEQcPd4vxDW/uk=;
	b=v2WIl3y1cr4n+/OmnSjIS11wLh4jBJDU3tfJtwZ7U0S50NKOd2d6JadbmkVpCKoHwr0f
	 cXqdd0Sg3y0dRqanS3491hqowHKDYuyt9A1EkX14sxlo592YkUZIPE1Grndek75Z4UdYA
	 vrI8EYAQLqvoBuQxMRDDPqamHw0qbYiA8aNR7JuDdo66uKdTBTUSmSDErgBUz7+RrsxYH
	 /VVTVtRuGQSniI0IlYACMSy4/FIBcWD00hfeBhe9pYeKOdJxOKb2pPa1EgajjbsBk3tQ2
	 J4mnXZ9EnaZBUHNNpvg9dcdYhRbqtjCsv/+WXhWJcmtWJf5FgQgis1mJe+w0rbSe8WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbVMd6cR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB790606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbVMd6cR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0461F031E7
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198880;
	bh=D38M57GKuL/jp5GNmYBTO2WQS2u92UEQcPd4vxDW/uk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hbVMd6cRXBxVQfRssFMfQ9/2juS/r/ee/W2fgW4iqpMmmNdrzGS+0DayjrgkxuwlW
	 VdKDQZobfbDml5Ov//LI/mjJ2FqI+UMn8kpJuaeOkx7JiYlwUca8A353QGl8nb3BPK
	 BSF55LZjXZ8WuXExq3sPt/go+cSA0EV6KH7WwoybLQ+6epPM6hNThZlrAAAQVz8qOU
	 I2aMfxY5WooS2sxchBg3wxq4bjNMXPglv6JM/owcfFsJsFN1yaX5L0GDyee208drXU
	 HKN9UehVMWATYX4sBk6Z/33bE93uN6W92pvR7qYhOnsfEQGYdmPJc2Tx+nMq9URtMb
	 ecj8EA9eqMTPw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso162801166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxKuccVgjBASVamv1gSSIWmdB9TSCEE+bzYi8se2be9X6vaFIylyRdpfbQqh4nK2UJgh9dT1lFFqsp8Wb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwrKzUtQE+yHMaV8g7h73aoCDaXQK6splBxXXS+RwBssbCNB1l
	nGqtVOzWg3rKV0EJCoaiYVzrrbrT6hDROMkIMN2xBqRRpjtFwBNqb2vKvmMv57KJTWL6HNF8xUr
	ncabJeQGA3QRyVDF39V/6MSjs5lWWoCo=
X-Received: by 2002:a17:907:3ccb:b0:c41:30be:4f82 with SMTP id
 a640c23a62f3a-c49bdf82147mr185462166b.39.1793198879205; Wed, 28 Oct 2026
 07:47:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027224914.1574319-1-seanjc@google.com> <20261027224914.1574319-3-seanjc@google.com>
 <CAO9r8zOnf_AiBJfTJTO9jS6cYj6bUxhDoBsNdmbeP_jaQnLCkw@mail.gmail.com> <auH6RzFLvSmCKbXY@google.com>
In-Reply-To: <auH6RzFLvSmCKbXY@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 28 Oct 2026 07:47:47 -0700
X-Gmail-Original-Message-ID: <CAO9r8zObGdNrYn5QAR6R-0iab7fGBs+Gj4KKngs6Rkvxa0Dykw@mail.gmail.com>
X-Gm-Features: AclHuK9PjeGaiyVu3Dea5LPVJISbqim8XHeo7PGVFUe34HEfkPXK3_99F8wyj4Q
Message-ID: <CAO9r8zObGdNrYn5QAR6R-0iab7fGBs+Gj4KKngs6Rkvxa0Dykw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] KVM: x86: Reject clearing EFER.SVME via
 KVM_SYNC_X86_SREGS if L2 is active
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 6:36=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Oct 27, 2026, Yosry Ahmed wrote:
> > On Tue, Oct 27, 2026 at 3:49=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > Disallow clearing EFER.SVME via KVM_SYNC_X86_SREGS if L2 is active so=
 that
> > > svm_set_efer() can treat yanking the vCPU out of L2 during KVM_RUN as=
 a KVM
> > > bug.  Ideally, kvm_is_valid_sregs() itself would reject attempts to c=
lear
> > > SVME while L2 is active, but the risk of breaking userspace, e.g. acr=
oss
> > > save/restore, is too high.
> >
> > I am confused. This says we shouldn't disallow clearing SVME while L2
> > is active because we may break userspace..
> >
> > > On the other hand, yanking the vCPU out of L2
> > > during save/restore is already "broken" as doing so would queue a tri=
ple
> > > fault for L1.
> >
> > ..and this says it's already broken.
>
> Gah, the "save/restore" part is a goof.  KVM_SYNC_X86_SREGS is already br=
oken.
> That should read:
>
>   On the other hand, yanking the vCPU out of L2 via KVM_SYNC_X86_SREGS is
>   already "broken" as doing so would queue a triple fault for L1 (because
>   "wants_to_run" will be true).

Much clearer :)

>
> > I suspect you in the first paragraph were referring to userspace
> > restoring a vCPU not in guest mode on top of a vCPU in guest mode or
> > similar? Might be worth clarifying what exactly we don't wanna break.
> >
> > >
> > > Link: https://lore.kernel.org/all/sashiko-outbox-182127@kernel.org
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  arch/x86/kvm/regs.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
> > > index 3621f1a47d37..e53496fdeb82 100644
> > > --- a/arch/x86/kvm/regs.c
> > > +++ b/arch/x86/kvm/regs.c
> > > @@ -738,6 +738,10 @@ int kvm_run_sync_regs_from_user(struct kvm_vcpu =
*vcpu)
> > >         if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_SREGS) {
> > >                 struct kvm_sregs sregs =3D vcpu->run->s.regs.sregs;
> > >
> > > +               if (is_guest_mode(vcpu) &&
> > > +                   (vcpu->arch.efer & EFER_SVME) && !(sregs.efer & E=
FER_SVME))
> > > +                       return -EINVAL;
> >
> > Do we need to check (vcpu->arch.efer & EFER_SVME)?
> >
> > If that's not set, we already lost, right?
>
> This is common code, i.e. runs for both VMX and SVM.  The vCPU could be i=
n L2
> via nVMX.  This could check guest_cpu_cap_has(vcpu, X86_FEATURE_SVM), but=
 I worry
> that would be more confusing overall.

Duh, I missed this, sorry for the noise.

> > IIUC, we can't be in the middle of save/restore here. Is this intended
> > to check for the situation where userspace cleared SVME while L2 is
> > running? Or maybe L1 cleared EFER_SVME from under L2 but the shutdown
> > didn't happen yet?
>
> It's intended to prevent syzkaller from abusing KVM_SYNC_X86_SREGS to tri=
p the
> KVM_BUG_ON() I want to add in the next patch.

lol

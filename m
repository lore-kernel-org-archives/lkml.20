Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13673AA1BA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102231; cv=none; b=qmMH//zkYNZd1bl3rjRS32GCaipxEifNn1h5zcoYjr9gAtEWSDQJgYj1q/b+cYIi76sJfPSTEQHmPGdIaI7Kvu0D8ZiVmudhhyO8KQhhWA1sKXlySRRAJT/0gkgESzNh9wZAH0O3IvJEMUefOsOOFJhy7KyUDz0eFeB19kj/1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102231; c=relaxed/simple;
	bh=CAmeRQqr2ehIySvprs6XS0W+CLmdeH6bKf4Q6WeLvIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpjDqF3lza3q/vRPyoRE6Xl3tFlEWe2kfT30nj6clsJyBHqLcPUbqvHJLyMEMtQ60n/8eyVMKlfOHjjMA9/8zWiPk1b6lxWPHjgz4bPC05XsOeD/hqF0nE4LHzqHdow26DAbHWzrNMLpEaVoMTvCzFuScdsg9t+3/nNZRnAlQxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRglJZlB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRglJZlB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2641F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102228;
	bh=psQhQ8EwJHNGoguVF5jOeNJoraC3k59ghxF9JaZiV8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LRglJZlBKJiElTwL7rL4pC3UQ9MQuWewHpXgZeMkDFs9i+lDnRIzMizmyzRZze4mE
	 SxJRRW30QxKCE+ZNrDbRKUoDmlEVSp3rpgtSMnIvXXSpGR4D/eZxPdfvE6txTbntaS
	 9g6cdZOqI082NMiGENl/bp5NJv+Qawa2kJRWgt4rhbGg+5zhTEYCHO1ctNd9+6eQ00
	 wQWY9J46QY1MNJS8hOsptEAGnqG5mTpgZ6TGFYvl/LIkwIjGo+b9WInSmJrFbB41w3
	 +I8T4Cv3RFEfAYd1tIM1nyPRsr7rrQc8Zsc5T92FImph1G4+pO8QZ+Atj7f8A3bY5T
	 x+sR3UBKvxNDg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso391145766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:10:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw/jny5S09C7ijrjt7AzM1Fg0bR31sggdDQ0Uq8SWbiVTr7WUTFpah5Y/k2QqIuhrJ+pAlFQzlsnC2gLhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9VpSXZLrh/aSpbnHbfSshDuTnvluOEsa3ATBslsZ4LGpwghe6
	fCRhgdsgqzV7IYecKO7bHzpXZ5+CliHmsXpWBe1IwazWp4IL6cr1Y4pDiIb2Gy49H4AKdwfpNvB
	sDw1txIAr8QIeHB5B2t3/SYmyH1YZ6ic=
X-Received: by 2002:a17:907:72ca:b0:c29:462b:f908 with SMTP id
 a640c23a62f3a-c31a9fec198mr2452268666b.10.1792102227307; Thu, 15 Oct 2026
 15:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-14-yosry@kernel.org>
 <CALMp9eSV0ikZ8CDoah_vCKYFXEm5syYh_sCMQ8wXhGB0+E=vcg@mail.gmail.com>
In-Reply-To: <CALMp9eSV0ikZ8CDoah_vCKYFXEm5syYh_sCMQ8wXhGB0+E=vcg@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 15 Oct 2026 15:10:16 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOUjXMvhmK7TBmgKkbs+JjFMEmcLgW589_N_smC6k-hrw@mail.gmail.com>
X-Gm-Features: AclHuK-yXtx1SELcMf4D6muUlqCrJg5Av0CZPjgGNyXcTtPDTqfrhupHx3-TWJs
Message-ID: <CAO9r8zOUjXMvhmK7TBmgKkbs+JjFMEmcLgW589_N_smC6k-hrw@mail.gmail.com>
Subject: Re: [PATCH v3 13/27] KVM: nSVM: Add a placeholder ASID for L2
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 2:55=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> >
> > In preparation for introducing a separate ASID for L2, introduce a
> > 'placeholder' ASID that is still the same as L1's ASID. This will
> > facilitate future changes that need to distinguish L1 and L2's ASIDs,
> > before actually using a different ASID for L1 and L2.
> >
> > On SEV VM migration, copy the new SEV ASID into asid02 and vmcb02, in
> > case nested was already initialized on the destination vCPU before
> > migration.
> >
> > No functional change intended.
> >
> > Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> > ---
> >  arch/x86/kvm/svm/nested.c | 5 +++--
> >  arch/x86/kvm/svm/sev.c    | 9 +++++++++
> >  arch/x86/kvm/svm/svm.h    | 2 ++
> >  3 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index bfb297b7d71ab..780132725bb79 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -701,7 +701,6 @@ static void nested_svm_transition_tlb_flush(struct =
kvm_vcpu *vcpu)
> >          *  - Honor L1's request to flush an ASID on nested VMRUN
> >          *  - Sync nested NPT MMU on VMRUN that flushes L2's ASID[*]
> >          *  - Don't crush a pending TLB flush in vmcb02 on nested VMRUN
> > -        *  - Flush L1's ASID on KVM_REQ_TLB_FLUSH_GUEST
>
> Um...How does this patch either do this TODO or render it moot?

L1 now has a separate ASID from L2, and it's the one we're already
flushing with KVM_REQ_TLB_FLUSH_GUEST. It's kinda already moot because
we already flush L1's ASID on KVM_REQ_TLB_FLUSH_GUEST.. or maybe it's
actually *wrong* because KVM_REQ_TLB_FLUSH_GUEST needs to flush the
current ASID, not always L1's ASID.

I can drop it separately if that helps.

>
> >          *
> >          * [*] Unlike nested EPT, SVM's ASID management can invalidate =
nested
> >          *     NPT guest-physical mappings on VMRUN.
>
> [ ... ]
>
> > +       /*
> > +        * If nested is already initialized on the destination vCPU, al=
so update
> > +        * the nested ASID to match the new SEV ASID.
> > +        */
> > +       if (dst_svm->nested.vmcb02.ptr) {
> > +               dst_svm->nested.asid02 =3D asid;
> > +               dst_svm->nested.vmcb02.ptr->control.asid =3D asid;
>
> +1 to Sashiko.

Will do in the next version.

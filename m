Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1025393E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179567; cv=pass; b=Ds8KLtLbQCHi6FCmJwnN0KH0imLoOWPacROAE3w0TKk9lYl5t5CFbFjgjUeCUTz2zo+pGj67BdS/ntBX84vWrq5G9st9erFd69eivD95DYi0ko83I/igCpvQ8lSOBwCzn/tQquV/dK052rQ7lpdCarOTK+yamKCn5llPNeCcFp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179567; c=relaxed/simple;
	bh=5HperhJ6ndHDYOECzEf0f7rRkNIZtGc1zoTN7qOyyzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATNcf54SLelNL+9dynFgCNcIP0tx/LcgFh9dKVAwCWujWQA4ylR5VWT8m+fomA8wb3Y4geqgc0vicPhkTZP2hyG0VqxV2iFDl1brnUCmSm9CHwGzbx86pmKgYYX27DAPVpQwOvjRPfRm1HLn4Y/z6cXEsvUXlkdLhwBUYABVm40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y9kBYsU5; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y9kBYsU5"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so60891cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792179561; cv=none;
        d=google.com; s=arc-20260327;
        b=lNe8h50//Zx9Ev2O2/QsoaeFo/U1XiD/g4dI0WnhLynikknm0mBSoV4y13+DUswH9K
         QSPo1NIx/gML528oAz/hhZFBCfpHM6i1XGqFLVxx2B+WGLy/eeBImwJiKZYxMvnMOl4W
         E+MrSz9RnV3bdewfdKvYXWABU2SvlZU6SxDkpps2XFrN5vSt3llhTomEZz8ow5F0rttx
         TFxfISPukKQZt7t6Gol370+mcgnjgAhh3QqL+E6qibS0tWqQEKycCmWMKACZf8jD/8AN
         lyjDVlKV9qZiuAb7O/Mze9KDf7AIaNvbyfBcR38S2G5GqGzVQjCX4mne4UFd/z9NCExz
         LZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYB+24gRvl6A6xyv52LeRn+X+82XyzZtyhvPLO+Wm1o=;
        fh=a8GLxtGILCHlg8z7MkPQ6mJouiCKuF0uSvBZvSBYbYo=;
        b=O6ce7jUPqvyk2/z6QxwWRwjMLc2BPcuz4FlX9RlnGh1ct+aBN0xpyw2wShwk/mS+VF
         NY4ReJy4zp26GBrcrpz2Nz+ElazV9Iq1wRIpvXF4dj298tbroa+XBjM7Ah1QfItmJ195
         8IEaLVrZZ5FKffj83NXjCuRm+YJTyPfbDeB50M0qtSolUXxHlvJAwMr+bohctibb6lDf
         bSlSCERRo8CyJvMl5WN8LdKOrS2w1xUOCbYX77mLg31+JyKfOKu9jESRjZqB161lZHj7
         MJiQNBn0xorGT2hn04HivgQH5utDEO3tVbLbbTWSlVIs6LV9Q5y/C81+wXbvmMem0bHW
         h1iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792179561; x=1792784361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tYB+24gRvl6A6xyv52LeRn+X+82XyzZtyhvPLO+Wm1o=;
        b=Y9kBYsU5Ao5BiZpIW1bl0/pd6l/eLwUWjJCKlt3M2Z+1vK07KwwP/xZJLQ1SgbwQmX
         KqLu0chArQbVb5I6txnRFAU//FUb8qI9TAq1EDfoozKDPcS+7ZivBTNSkFNoBozodrCJ
         5zUZSisDc/O15DAS6dbDNx0Ue6kiHC3tPn6CjFaslCOfpMQpFH8OvwqcslpyKpQj52sA
         sPK197hAUI/W58nbKO3/w9UZEnXLJpFEKXOrGk0Ia6TPEhprDq5UUExS/JupKP8njSXm
         DWww7NXKerGoro+yu/qKsaCbQmjK/IRVEUoh6lmGaQJ7GHiJVW3ctCdQ4641A3M8ZZFM
         mr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179561; x=1792784361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYB+24gRvl6A6xyv52LeRn+X+82XyzZtyhvPLO+Wm1o=;
        b=WuExYjwYARCWpoRDFIk0refHr9wBQjdkLQtHj5XAmJKHyIwA8rc3YysxmJUVhVlEYT
         t7KXPL9gRd/0UibeXrgwlEFo061rSJq88vnhWUoRhPyqc9eevC+cz6thZFS+Y2kmYoOB
         +pe08L03OmtsjCsP+9Xv28Ijj8aMFXp5eUMellT5bMuNgd9ZXAsqQHs3Xbwm5SOfviOX
         YKteNSWv6khRavLwA7lW4SGQHWM60DB6RC9/53Ve34zpOdb0PqvMtuGkPtkYSf8g4mG6
         nYdq5dN4uodjWp+bvVGeOi6d0PphWxzOqkSyPsPTVAzyEAi9s+/aEtOYMYNjt9/y6US3
         neFg==
X-Forwarded-Encrypted: i=1; AKwUvByJFeiL4BLBDISw/WxNHUlvxsom/sUm4pBSa6YjOrOKlcSEDkJjf35eGoiAhdPKgfoVZ53YbSO7WAsmkEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3f4vluTq/Rbb5PKS6T/N4k/IjlqCCMx2pxlwwS8zqIoL/KlWf
	U2yFn9Q+JrOyK11NLTlwsQCmSImy9nya2u8l7IsdLroswA5J4HNr1U39ygos/G0jQveEqUh1ZiI
	1p9UpYX0qlhISlxcpjUOnHGy76hR8ZCMIND/G46L/
X-Gm-Gg: AYBFou12XvO+YZ/n+MlBcPGuWitQtAb1VZg+9NSRezLiTo/S7bjGjIiySMeH9Vw0y6i
	4gCBGoh2tgZ64vqFqpZIXf1AYYNq3H2/8xdYvu5eLvmJc7qaLK6sxj7IsBAOq6UEekNaDA7K5/s
	lYzUXYAWnUKnvaMi4VWJipy3SbsOHxdY5Vd7rx5uDJEuRP3PPtrP/L7HfgRHk6KqIZhIQDo5G40
	YR8fJ5KSFBMZpBeDFXlyRuafWjfNMsa4okWRk4bQwZhK8ws2QqINuv+/AA5WyBPcYh+9YO+0ssv
	m8oZNGHDvUSSEmOtqsGvxUjsRq3FCaeoVtpGcEd99jhKzAOFeId0DYaH8xQ41tYokg==
X-Received: by 2002:a05:622a:1cc4:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-53649add080mr31861cf.0.1792179560138; Fri, 16 Oct 2026 12:39:20
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-20-yosry@kernel.org>
 <CALMp9eRd3COQijFU8AdcJKo+usr4A7dC6GOYT3YS93UBZ0yHRA@mail.gmail.com> <CAO9r8zNvcoXxDHxxZEWZM-Effav-Yb8piVuN5BsGanhR5dJmFw@mail.gmail.com>
In-Reply-To: <CAO9r8zNvcoXxDHxxZEWZM-Effav-Yb8piVuN5BsGanhR5dJmFw@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 16 Oct 2026 12:39:05 -0700
X-Gm-Features: AclHuK9GXq5IvU0yurc3OGJJuMNaC-vtMWVfUvmlQbKcygeI63kT7JK3WCbyRgg
Message-ID: <CALMp9eSQD0XJ_0y0ovdiHYXoRi-_FNHtrsraJOWSNafnWCm9sQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/27] KVM: nSVM: Service local TLB flushes before
 nested transitions
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:35=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Oct 15, 2026 at 3:20=E2=80=AFPM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > Service pending TLB flushes for a specific context (L1 vs. L2) before
> > > entering/leaving guest mode, as KVM does not track TLB flush requests
> > > for L1 vs. L2. This is not currently required as KVM always flushes t=
he
> > > TLB on nested transitions, but it is a requirement to drop the
> > > unconditional flushes.
> > >
> > > TLB flushes are performed through the VMCB's TLB_CONTROL field, so
> > > service the flushes before every VMCB switch (except the precautionar=
y
> > > switch in svm_free_nested()). Servicing flushes may end up purging th=
e
> > > relevant HV TLB flush FIFO, which is based on guest_mode, so make sur=
e
> > > local TLB flushes are handled before calling {enter/leave}_guest_mode=
().
> > >
> > > This is conceptually similar to how nVMX calls
> > > kvm_service_local_tlb_flush_requests(), except that the VMX calls onl=
y
> > > have ordering requirements on {enter/leave}_guest_mode(), and not
> > > switching the VMCS, because VPID used for TLB flushes depends on
> > > guest_mode, and flushes are not VMCS-based.
> > >
> > > Note that nested_svm_{entry/exit}_tlb_flush() must be called after
> > > kvm_service_local_tlb_flush_requests(), otherwise the TLB flushes wil=
l
> > > be immediately applied on the outgoing VMCB rather than the incoming
> > > one.
> > >
> > > Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> > > ---
> > >  arch/x86/kvm/svm/nested.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> >
> > [ ... ]
> >
> > > @@ -1549,6 +1567,8 @@ void svm_leave_nested(struct kvm_vcpu *vcpu)
> > >                 vcpu->arch.nested_run_pending =3D 0;
> > >                 svm->nested.vmcb12_gpa =3D INVALID_GPA;
> > >
> > > +               nested_svm_service_local_tlb_flushes(vcpu);
> > > +
> >
> > When called from svm_vcpu_free() during teardown,
> > kvm_service_local_tlb_flush_requests() will be called for a vCPU that
> > is being destroyed--and isn't loaded. By that point, the MMU has
> > already been unloaded. Is that safe?
>
> It should be, VMX already does it.
>
> I am assuming you are specifically asking about
> kvm_vcpu_flush_tlb_guest(), as it could end up syncing roots with TDP
> off. kvm_mmu_unload() should set all roots to INVALID_PAGE. Both
> kvm_mmu_sync_roots() and kvm_mmu_sync_prev_roots() will then
> gracefully skip.

I'm just paranoid about process teardown and borrowed MMs.

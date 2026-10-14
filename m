Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614554E4323
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020439; cv=pass; b=tl9J+yFkmP/JyxdsgDXIbEOd9V6kV6EkXomzXgbkGSUENpetMCzIq1OrbeKx6tB4Df5z0iwVbb3Y/r0jC5Qs6LQeo0edDN4HUoemA0TnJ5Lwo+9lVkLiJ346zSYyql2/2f0oxoPc3IBAqO+/jg1H2fSb0lFeexbExddI+B5u/qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020439; c=relaxed/simple;
	bh=9GxvBK6zvUPUZUZqhB/gyYS3RQbrNlmmcifHIjpdWI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca37Ur1tNtjp+zrOr0E0DhEmgAaBIeLRmzMop36J2cArgkkixTRwSH58VHvKVjVm4q2r6gWKi51PWGRaTIJjNC3TUZ9cXu44PYue/0K+8T01bQ3j0Vus9rkSpnSr8DiKhWXcjVe+yOchRkr1bg45zgBcHi4XsI71BCJfvE87Jx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wWSYIr0K; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wWSYIr0K"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso1112a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792020434; cv=none;
        d=google.com; s=arc-20260327;
        b=KX7Em//dhvJfRonSH8X5WAp5slcuiRsh/pAjLFdnS+c3Ca5TiOJ9ij8BcgdeqrLuRH
         r/1KtBCs1J+1okx0EnC599kPStzVE1uX/yVOyJeREpwnza7A7n7U0Ehw6WneY6EuDkVM
         /uKVXnKNGtaa79Xb0PnMr6mZB9DAuU0FSUEKE9EMo+F8MYTY6ejPplEX0oImW0X/9ymm
         oN9l4HHOzT8rAZX+6Nfhir0IARVdBy3c4TqbbVaUvJX9nqRGfeammUW+qbxg9O5h8FSL
         rAZ8RrliH9EBOVdYgNaVa6SSgkTAM2k0oxN+swoP4E3vD9FTThdj6B7H8aWo6koxyl5I
         CnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DEklSNtH9d9SVt0AkkIEXTWgUwY+8yErW9DKBFAT2iY=;
        fh=SThVzqBvlctR6unPIWQMaCPfXNX7XY7kWDKr3g6nhP0=;
        b=Qg6AqiyoWUhDS3F332ib9074Rawlt1deO0DScbwHCDONLht1yr+sXbqCpWlr0OcYAE
         n0l7PljJn9W84V1mTOje2unaDaE8JhV6WQvfZIJmtLOKHH8ZtfogfrD1mCfqQ+9llXxL
         Ndr+zuzBimka6j0iijFSy9UGVbvEL6mKFdrZahNi/74GTH7zm2yFeMhrXvkeYT3ijalF
         /uk9gOXjqlsU12U5huXm8yogWanwCMZKwyFOIyVFvVugX+qeyJYBUE4NNLT2jv75XMux
         JRVEtBb0dNmd2uymICl2QMBIJoAzptFdQcYiwCdakV+vEdmMgVyLB95Z5COT5ss1A1E0
         LHDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792020434; x=1792625234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DEklSNtH9d9SVt0AkkIEXTWgUwY+8yErW9DKBFAT2iY=;
        b=wWSYIr0KCGGjeQM53Oo7iFz/PuQi98Pzt3dPzx3Zw6UvLvzvNLt2Wd3EVymRnXSn2u
         +FCxc604iSGsNJpUZx4JOTjclOkdwlqZMfamu9pqChY3yLLaCAa+AEufnhOwyeZanplj
         qKajegcLGkHfKiNWk4PziaGbGFYnxIf35ucWCJY6TOwctvH4b7DJRiNUbVvqAAGh+pne
         RbCo7tXZvrjE2S8Zi1SD+ycFjx4MgPLnsebUAv6sQud/ribxl5M1eg+Yp+sZ5rlkdG6S
         oxtf43azuFb3NXZg/oOq/izTNYKueITKI7NooVUAPcolloy8zextQ7bgvTibfv9WL68i
         eeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792020434; x=1792625234;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEklSNtH9d9SVt0AkkIEXTWgUwY+8yErW9DKBFAT2iY=;
        b=GM4MgzvfEn1rBSVNYx6NgXvmgvS3OOC29MJavJED3kMxK16OPMz5qbOv+xtyj+81nG
         Vxp+3j9JKxOW4X1njReQri+wmMQMpRSPPugqgVGyKfh5wHJrkHN0WEOd6H60BBTRG9S2
         EQO9Y5lS1xvtC81l85l85UWdwS3uRSrsUI49LcWQEisG1uTOiB6dWrKDROgRbMdlKjpp
         gY71Bi6BJUW4AySp3Fs/Uy3H5Wd4EaJNvTDXZbJLFW/QDKvr+SirVHRwhTh+jD7aHUO7
         dyHjW7nyCUflITS1mwBaEpy56zVHgSuLKs6cvcP2/vngP/z5somZqbEf2fy26Gb996ja
         mGeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaqjSJp4OIvvj3bGE973gT1eD9yXAVZdExKwGEl8j9btW/v866Lo/HgtjPID3ew/ZrsQ190lBm3Pb2J7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/gaRxeWgg/22/tnuB6p+lYK7T7kbGOM9+I2IukCRlJmU+Dy2F
	CcIa5E69ZO/iPlieSXGewu5WRUhSvjKwZ4i0hv9lbPiexqewEnh0wSN9SJgA7gYluz7g0FYGDx5
	mTYmHl6KPNAkLAMwGxIzpnCCmHMpKKQVNBeevB28d
X-Gm-Gg: AYBFou03fmAURzS3FXyEEmXQx0iDSzjw0rI6KsG0ML/7A7GyJ0KoYfQvvZIPD9m2XQb
	zDgmcDK9OlnTs92BsphOZrGokt0ZeBM0e3vd6w21pZWUnpc8SDDIz1uynIDa4JDzVYw7jnDw7ld
	jegu1FEKw5J6V/PNT+utM+JZV6lMeT5SfTN0t53N5Yz7onfTuWG7RWt7e/aMlNlb4KcvZCblIYv
	j/fErpACrTg20Uj3CwxZPEEy/qR2EY8oKc5BxXb554ykwkDvKOG04OkOknGaCWUw73wR49eUZ1C
	1FhrWmtuXR3Y9TWS4IPFl2JBDPZ7iw1zXToDgh4HRDzSLNJTxkH3TQc=
X-Received: by 2002:aa7:c74f:0:b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b20ab1840amr71287a12.16.1792020434145; Wed, 14 Oct 2026
 16:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-7-yosry@kernel.org>
 <CALMp9eSZoXs8vAswymwdiX-0ge-EOef8TR2nZw814wa63LpR-A@mail.gmail.com> <CAO9r8zM8S=VFjpbA5c7vLdzkQPJPM=YBFJ4Or9QKrOd37xTWGg@mail.gmail.com>
In-Reply-To: <CAO9r8zM8S=VFjpbA5c7vLdzkQPJPM=YBFJ4Or9QKrOd37xTWGg@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 16:27:02 -0700
X-Gm-Features: AclHuK_nwkWa5bJjTcRY3_l2dMa6yFiqYVdR6Y3GTnqV1jmEabVzsUUvr59iETg
Message-ID: <CALMp9eT6UwpnqJUUXwXwAsJZZWmbyfNZ=FR5=FXTQFYMzENaNw@mail.gmail.com>
Subject: Re: [PATCH v3 06/27] KVM: SVM: Fallback to flush everything if
 FLUSHBYASID is not available
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 3:50=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Wed, Oct 14, 2026 at 3:45=E2=80=AFPM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > Currently, if FLUSHBYASID is not available when performing a TLB flus=
h,
> > > the fallback is decrementing the ASID generation to trigger allocatin=
g a
> > > new ASID. In preparation for using a static ASID per vCPU (like VMX),
> > > just fallback to flushing everything if FLUSHBYASID is not available.
> > > This is probably worse from a performance perspective, but FLUSHBYASI=
D
> > > has been around for ~15 years and it's not worth carrying the
> > > complexity.
> > >
> > > Move the fallback logic into vmcb_set_flush_asid(), as more callers w=
ill
> > > be added and will need the fallback as well. The only other current
> > > caller is from SEV code, and no CPUs support SEV but not FLUSHBYASID =
(at
> > > least according to AI).
> >
> > A more compelling argument is that sev_hardware_setup() requires FLUSHB=
YASID.
>
> Huh, I didn't realize this.
>
> >
> > > Suggested-by: Sean Christopherson <seanjc@google.com>
> > > Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> > > ---
> > >  arch/x86/kvm/svm/svm.c | 5 +----
> > >  arch/x86/kvm/svm/svm.h | 5 ++++-
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > > index ad4f172f170d9..0c3befd9bc850 100644
> > > --- a/arch/x86/kvm/svm/svm.c
> > > +++ b/arch/x86/kvm/svm/svm.c
> > > @@ -4326,10 +4326,7 @@ static void svm_flush_tlb_asid(struct kvm_vcpu=
 *vcpu)
> > >          * unconditionally does a TLB flush on both nested VM-Enter a=
nd nested
> > >          * VM-Exit (via kvm_mmu_reset_context()).
> > >          */
> > > -       if (cpu_feature_enabled(X86_FEATURE_FLUSHBYASID))
> > > -               vmcb_set_flush_asid(svm->vmcb);
> > > -       else
> > > -               svm->current_vmcb->asid_generation--;
> > > +       vmcb_set_flush_asid(svm->vmcb);
> > >  }
> > >
> > >  static void svm_flush_tlb_current(struct kvm_vcpu *vcpu)
> > > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > > index ba5077b9838c0..3b59561d6cc2c 100644
> > > --- a/arch/x86/kvm/svm/svm.h
> > > +++ b/arch/x86/kvm/svm/svm.h
> > > @@ -482,7 +482,10 @@ static inline void vmcb_set_gpat(struct vmcb *vm=
cb, u64 data)
> > >
> > >  static inline void vmcb_set_flush_asid(struct vmcb *vmcb)
> > >  {
> > > -       vmcb->control.tlb_ctl =3D TLB_CONTROL_FLUSH_ASID;
> > > +       if (cpu_feature_enabled(X86_FEATURE_FLUSHBYASID))
> > > +               vmcb->control.tlb_ctl =3D TLB_CONTROL_FLUSH_ASID;
> > > +       else
> > > +               vmcb->control.tlb_ctl =3D TLB_CONTROL_FLUSH_ALL_ASID;
> >
> > This is unnecessary. Hardware that doesn't have FLUSHBYASID only looks
> > at tlb_ctl bit 0 to decide whether or not to flush the entire TLB.
> > The other bits are ignored.
>
> I think it's clearer to do the fallback since the APM doesn't
> specifically call this out, or maybe it does but I can't find it.

Fair point. I dug up a copy of the SVM manual from 2005, and it
actually seems to indicate that there isn't a bit toggle, but rather
the entire field value is consulted:

> The TLB_CONTROL field in the VMCB currently has one command implemented. =
When the VMM sets the TLB_CONTROL field to 1, the VMRUN instruction flushes=
 the TLB for all ASIDs, for both global and non-global pages.

That isn't how the hardware works, though.

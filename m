Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6063BB673
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179697; cv=pass; b=Hm7FTqgAmvj9SCgkmxuDbPLEMI1iBQfARnybtDXBuMytiSfBk6ssljdDPw3seNzeukajomxFL1AlBUmz7oK9lx5iYLuJjEftoNmX+IK2g+WBbeAfLJsDI5akxpDQGho5ZZlOhowM/Y0GovGmBoMV3RisGa2UmkGPqdmRN8zxxmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179697; c=relaxed/simple;
	bh=S7u97F0mKuHEaXlleeG6ov/Y3VkqNsMCwMjqHsihwxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWjp1pd6BAjKEVaBkHx+Okn1M+gX+BPeiz4I4MgcIuSp6ujL1d0OwW4B3Qdu9k9TaV0SUcQeJWDdIsOMpInLNerf67dcQGbsR0MBoH22HLOQuG0kJwETzfgo2WhF7jQ20jS/ka9f0ysIiboK9a/NL96IFNz8nN7tTHHIs5ArUy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oQ4WZRH/; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oQ4WZRH/"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-535f598d126so2271cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792179695; cv=none;
        d=google.com; s=arc-20260327;
        b=R9HNLQHUdPiAuyimQO29oMS6ux8sC5oJJFOZabDE1hOfUuGVcA0S8CuTWE56kAs3W3
         2cBdIxb3/Oexl6/FIlEaRZ5pupfcFBHra6fhtyWFLyZyJ2LdBXtJ1Y9/LzYAlShOWDq2
         MWPF50/41XYNAlxs/Kf55usX596PHSiVFcvAaWuSD5YgoWAeooHRIa9xfDkNtA5vknUi
         DxXj1TNqBL9KcqIpy+tG7t8pE6rRJTeHYcB+7UQBToiAdeiIh+syolCbtIhqdHL0XXON
         ZyCIzDynQ3KN4F2ceLQ3lZT6I8E/XAipGtSG4B4DL187YHzNRAXwOQ7QwsistPTOS1HC
         4dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7I6WLMkKR2BgKIxGRcqSFhqIpV9v6f9mjoXxwWLiuPk=;
        fh=FnKohEiYH51FFZq5kxIt/iPUaO201UJKa4f1/uWq+qw=;
        b=OCXhH3WcxgFcRdvQOhYwxJrvpW8WipUhraTAxlh/zsvEDyslQTMxVgPAqcd+RmOcld
         v8axue5e6SqrGMaiBOjiA4HIws+M24qLRsy/Lvy5YT4NmmsMjJTpVYu9+icyZUILcxRo
         KPbZDJyXi2DxYxziQOfOZ98A311+vS8RnwI56AW3oYoiJIJhgOqyrEVT9XsJwtO3FRQZ
         70NstMxYgeKfOnPa/LazGJcl245K1EKVb5MXQZ8VYoxmluOjPZNzyPk78LjwA2/7a16X
         EKzP0KK7HSFuWZkDtOdf5+1Vxa8/NiZo06P+iknhMJKDdz4+OuRLNClGpqAkMnUKept7
         +uqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792179695; x=1792784495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7I6WLMkKR2BgKIxGRcqSFhqIpV9v6f9mjoXxwWLiuPk=;
        b=oQ4WZRH/s4OlqMsSt1YCy+GDPxLQD8NKDV3kNsjiU4D/ngxoJmU5b6qr2TuhbHxLh3
         KQcR1ogam8OZBBoG3NNM+ABOG6d4HWcms3gs5NHs5NFgySsjLxheDPE75gNHKGefi1sp
         Jc7oudV06kCUrL5iLnrxgGBAtGU2YqfMHZb1NHGIsdCmvgFnkhccnQMheDDgMjeJvypI
         XvBz3aI/05Xdaf6d2pgrydkbSAhEs79Rl/oLVwM1qo7379T38fGoBKRwq2LUXtYrOR8G
         Zza/PUdosEaWkeX6C8JXb1FPddosj+2fQCTPz4MFkRfE9+pDcTJt8CY/RBCCAnhFF08g
         N2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179695; x=1792784495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7I6WLMkKR2BgKIxGRcqSFhqIpV9v6f9mjoXxwWLiuPk=;
        b=uWUFGb6yX5MG6iZIy0otHCSIYHcD0hQX5g9VT+P++zTIEjRcv8MHju2zgIf+68K7p8
         U+8lZlYkBKjy3lBfW2lrfN3NQR/abOHaK7SsSDQcGylNBoC+YbZwuMFy9QblD9LpMsUT
         fYUaqHWNiGoXSBb+cibl6GWM3s+hLM49/vny98SS/RL0CE7GS9dIrzEMTikDTF2IbS5r
         nluhdQ0J+YzG0xDfmV1/6X0d6XjNeFszbxzHPdz+8E0J6AUXNOyiUkDjhtb4FD9wQtD/
         +cjpnBF/fIRSjuLyy9O0uUQQQI69jrEkO5xcWRoeAh0mhjjrnHY6pQBU97sv+kZ41tnt
         iEBg==
X-Forwarded-Encrypted: i=1; AKwUvByutDOH4JC9kVNcA3+80+hTJCDOO2dalEmmDm0DvT2Pd+NfV1JzzCxN9CnsXiz52jWm6o3i2Ykp9NuZxII=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEj93MEbao30dNdnVOSt9kC03/BguEwTRKxap3NRiQd8P1Cd36
	HkxFDNp4VfOA74v8HvMIM2mj3qkV/xlTTGl1N75TuyJPfCU9DNNN9/Ufk1dEy0DoUx0SicZHB/l
	gly0nIAn0GZ2vTtEnzL+oXN5D2T45C7qjKc7xuWsF
X-Gm-Gg: AYBFou2GANcmSmOUZyA4rghHrAFYTm8RBcTCh4GmLSquxe8k/jQBQ2//br14n+1TV0J
	gQNQX3gGShqK05RvvQrDjkheV/aLnnAh2BaiGuv2dPsFIZMAqJC4ZUXxQPZLXVCFW/SLyq8CB00
	oU/jtNhl19K8vQueEm84tQcvggA5aFWgkfamdMhsDw2I5y9q5VMgHlzwCsol/z5g7EuAdcoid4Q
	k1LGZmG5Jxe5LANIL1jX16Eq4NZiOmZAhRQF10lu31aHrnW28yI+pVexgQW1kY5uBVLQMHlTK/o
	9rBALWMYgV3u1MPn/MQb6eq87JB4D8j2HJk2y5H1SGDubHRzh4qMpqk=
X-Received: by 2002:ac8:5ace:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-53646227b1amr1807741cf.8.1792179694296; Fri, 16 Oct 2026
 12:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-25-yosry@kernel.org>
 <CALMp9eRb3ExsQ0g24YQyo85sV1fnHZadh33hBChUY=ZGUaT7jA@mail.gmail.com>
 <CAO9r8zMt5ZNwr3Y+NfFcAW5Cf4JaerCScSsLxcvsvHYR=DoYBw@mail.gmail.com> <atF1lByf9w3Pvzyt@google.com>
In-Reply-To: <atF1lByf9w3Pvzyt@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 16 Oct 2026 12:41:20 -0700
X-Gm-Features: AclHuK_lmx3knEDpq2O9cX91zu7wMSJRiSiXRo3aJT1GBy87KnfcOtvuGmB_cxE
Message-ID: <CALMp9eQ0j9mpaRFgGSgSzbpLZJL3hmQEY9Ey2VEMuqST0uRTsg@mail.gmail.com>
Subject: Re: [PATCH v3 24/27] KVM: nSVM: Flush L2's ASID when emulating INVLPGA
To: Sean Christopherson <seanjc@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 5:53=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Oct 15, 2026, Yosry Ahmed wrote:
> > On Thu, Oct 15, 2026 at 4:37=E2=80=AFPM Jim Mattson <jmattson@google.co=
m> wrote:
> > > > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > > > index 8f2542357e78d..436d13f106369 100644
> > > > --- a/arch/x86/kvm/svm/svm.c
> > > > +++ b/arch/x86/kvm/svm/svm.c
> > > > @@ -2468,17 +2468,61 @@ static int clgi_interception(struct kvm_vcp=
u *vcpu)
> > > >
> > > >  static int invlpga_interception(struct kvm_vcpu *vcpu)
> > > >  {
> > > > +       struct vcpu_svm *svm =3D to_svm(vcpu);
> > > >         /* FIXME: Handle an address size prefix. */
> > > >         gva_t gva =3D kvm_rax_read(vcpu);
> > > >         u32 asid =3D kvm_ecx_read(vcpu);
> > > > +       int cpu;
> > > >
> > > >         if (nested_svm_check_permissions(vcpu))
> > > >                 return 1;
> > > >
> > > >         trace_kvm_invlpga(to_svm(vcpu)->vmcb->save.rip, asid, gva);
> > > >
> > > > -       /* Let's treat INVLPGA the same as INVLPG (can be optimized=
!) */
> > > > -       kvm_mmu_invlpg(vcpu, gva);
> > > > +       /*
> > > > +        * INVLPG on a non-canonical address is a NOP according to =
the SDM,
> > > > +        * assume the same behavior from INVLPGA since the APM does=
n't specify.
> > > > +        */
> > > > +       if (is_noncanonical_invlpg_address(gva, vcpu))
> > > > +               return kvm_skip_emulated_instruction(vcpu);
> > >
> > > If L1 is in 32-bit mode with junk in RAX[63:32] (e.g. bits left over
> > > from long mode), the full 64-bit value may not be canonical. Should
> > > the kvm_rax_read(vcpu) above be kvm_register_read(vcpu,
> > > VCPU_REGS_RAX)?
> >
> > Doesn't kvm_rax_read() already use kvm_reg_mode_mask() as per
> > __BUILD_KVM_GPR_ACCESSORS()?
>
> Yes, Jim's probably thinking of older kernels before fc40b1254c32 ("KVM: =
x86: Add
> mode-aware versions of kvm_<reg>_{read,write}() helpers").

Doh! My bad.

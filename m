Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794338309;
	b=AjWfaeC0Fd6Ty6ah+d+ij/aobxYmT1tKKo1SX7p/GWjfO0vEaGngajWFkECTgCH5RrZc
	 eQChUsD3NdzC0Y4cSm1QeZnzRkLWANplMDICb/+L8nLtE6H85IU1MUARJFv16EvKBa6Nn
	 khkmV2h/tqxfvf9F1isZK2i2OjW/UQdqFKIm9QKXw+tZbDlhbgIiHKi5iZrPxnfuREklq
	 QFMc1DJSwsnJSsgwe+9B2VY3rQ5f/Q6vT2B9G5KYgXovxKAEttq+7swzfQp858c/19H9T
	 2UpGlBW2Rq5iTl98Y0dqj+tPcNd6PlDib82W09Nc5Ozq3AzsoCtlDyeIBEuRaEjUE6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bbKNwN70bb9RlNiCImh5gAr765/eNXsrDR4TFosl/go=;
	b=ZsyAVoh+sgAqmu5FYTrjcb4K3x2esISRwu4/MZe2JKU6k+x6PYcQ+xvE/zVExRLYdUlk
	 q070G1ldkXsClQRvFDAJkYhufM0cobmEanEbtyozyznEHZQ/SZJQhmEjhwSYGESkTl9uC
	 RO5KqjGBTZQtdLT/knf6rbs8d7rdJ3YmDAWPcdAvJTy+nNVMUmw1/znDEGUO+KZbVLCa6
	 fJn8GGk6VQ1Dnzg5YeqgHqU0gh65BW5BdxhefnhO7R8Lb2oFDeiVilrMue19+YHXG18Cs
	 DGZllqQMJm4aYO7k8kKWtUUnSnA8iqmiYsVtj0eVFZ/zM1Bl7drlymHdyNj8AE1wssg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fb5CkZn8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AB2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6AB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fb5CkZn8
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso1882a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794338307; cv=none;
        d=google.com; s=arc-20260327;
        b=ppK561wAUlabnpOc4k7A0sDYqwJx8YvkU44s706npREe4m/dRh5I2EOshfu6DMONTU
         t4haQvk1aPWPQpDqlaVHhs2xwmSfrZfwcIrDj15gQWmeq++6QzzyE/JqQnX8zsduhk1O
         q2lvc5pK2UIgrsinHe+eHuiR5U2CC/7NOhHnO5VjgYiMStiJNGk71nNEbrXamDBg2sDG
         pgznfeKrqTXV8PF3DeX0pxbqI0MsJklCtcQ8AUru2e7hmbY+5BtgLjTWy85dF6HYjbLg
         NoJunhq4V85YpIqOQ5HC2X1lDQwjkSq8GzkEumm+9jDTJXJHTclt7jnnwANf4yNv+ikL
         /02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bbKNwN70bb9RlNiCImh5gAr765/eNXsrDR4TFosl/go=;
        fh=i3KwY+rOQypeT32lMBwSPO913QpOaMgT7r4RG5gy3ag=;
        b=Tw7AjbEe5JVeu6Ctp7zcnjxh579MqU/AP8sGTKc3VcCAObvJLkRrvje5NzG8IcD8P9
         EjdngvVFuooI5RfY5rDk/atZRkDavwm4xMrQ2fG1LEBKv9VrMDEVru8I5qCldwOO9vMk
         LSJ612jwkpGZT0P4/0uR1VcaZXI3T8i0tsYjDBvgHXPpghZuYUotDKYJ5yqa0cyhbPyR
         WJqX1dz5fCocix0MVsHUCWlM9HmVni16v7KLdQOdCPwPpdNvZYetdJHWMIe1/OTuRmG9
         lWzatJSqO6weImdnRtwV8czeo27on0Lr4JxlldVdeRRw/Dt+ftilumWHGje1HDHs2o9H
         pizQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794338307; x=1794943107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bbKNwN70bb9RlNiCImh5gAr765/eNXsrDR4TFosl/go=;
        b=Fb5CkZn8cnlba1M9AzMPVlWVe9hCWLJaZXx4jCfQNplJdtXJQbQAgQoe7th0jyBMeo
         ubEPlFtyCICt7oeG34mpOY38A+b0dCtz8r3GnOYdYzaDbuCuJsqBCFsBAYWs4Ow2BZn2
         1SLgIr78QmyPFd+8i8Ue2gW5kEEdFh2+2rjs0OSKihT4Fvck8650c4EAanDxp8IapiUc
         HsC2LC/qC2AMamLSEp67W7Kcri0Cp3dv6m4ccBAWk4YA9QxapGXisdt6ueLBxNO9aIfA
         O7lO4A2RuiTSNN1OPMDvK2OvakiIWlx5HjgiwrvWnhgG1ChTlNWe29ZZKw7PdvQmNuZH
         +FWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338307; x=1794943107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbKNwN70bb9RlNiCImh5gAr765/eNXsrDR4TFosl/go=;
        b=xXkzzDC1Y1cPT3/4mDBQyFnC2nOAYSDR6B+fGaZGdOrTPzG4r2kvEzWgxBghwGxI4b
         RpyTwIcBv6X6mVIxKz1P+JssdjIvVy66L0G6ZVwZyofo7Wc4I7TD1sfTTesJleMH5nGq
         m5salNgPWsEByWON+jqfCouvl3QveX0dm/Wn54LK088seV4cUPRzFlzuyjGLYK220vkg
         4dtqz/uiRjY9Yc4wThczaYocSTD+l4N/QNL09WroCMT2C66MCUssMOkhhZTE0e0/3Vcx
         2brCq9SJZFX2iOip04xgFXCMHkl/SCqxgBNPlhNZ1Ay+kUkXyE9/ATQp/W1HodLN84Z2
         rFhQ==
X-Forwarded-Encrypted: i=1; AL+hErFDCs//W0sOMZrPvTeFvas7+A5rkFqJSJK4UIYpylV31VOCuOa2oBIRRcYwbslnZg1e6B2VUSN58CzoqYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7kMG/97BHgpYaEvG+0YtIEFr5GlDOZQEliCOAzJ37M1+0cTaz
	l/5NGwAQ7lWOP79c2+NIYQZeDq4WjFY9vwNibGCAfnUIyUYAJG/zo34ezn4BfpJs2+7VCnEWF04
	OT7Y/m04olr9zE1JgJrBUiXHAQeVvJur/9uuspnX7G0WGxENOau0A+TPT6JM=
X-Gm-Gg: AYBFou0SMoyiLZPr2YDxiAIzFe1+VEKIflegJT6f29MQGPZMD2wpc1N55DAe27z6+n0
	Wo3H4xd5MY0oDe7WWkE+itHCcyPzzRtf+hX/uKorZa28hYu1WqhkNjrUFL90MoPAfzVsbegWTrE
	LrVpMvfGcp7TLaY1ZmFkz0so93uTux0fVPeOBGkEzPA7rFRLuP8GlDUoRAvjgM50c2zZ+2Sst8e
	yNWfpUVd+/90IpQJfZCHitR6T9CaWhyLfnl3rb59AgmlSXQnuHY1CIKIIZMnFWWA37s7We5Xizd
	fMoZLs1lPEeQne+KS7vi/2VxHzdwEPIkw4UErNiJeJDEtmUj3PHSTs3mU15+IQpq1gdiQiP5VwL
	Hd8qS94ww1YrPSYjlNNaSEH3t+ATUOqvHMccdRcLSSX8wrnwVVh99DX0B8PohUaQ004zuvDT6vo
	BkFfbtIVd/LEojCblPhw==
X-Received: by 2002:a05:6402:a20e:20b0:6b3:b648:314d with SMTP id
 4fb4d7f45d1cf-6b777eb5cc3mr6144a12.6.1794338306508; Tue, 10 Nov 2026 11:18:26
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110004037.125692-1-jmattson@google.com> <avNYjOevOv5s2o5k@google.com>
In-Reply-To: <avNYjOevOv5s2o5k@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 10 Nov 2026 11:18:14 -0800
X-Gm-Features: AclHuK-Ld1Gchzb01Fm0YtLo-9CmGcGk_lAVK4ne9i34kKI8Zz7QGeRNBrUyoNc
Message-ID: <CALMp9eQAxDhnJGrxt8MquPKE2jsUzezn+nbRXV7E_OiATFhsow@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Add missing CET VMRUN consistency checks
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	John Allen <john.allen@amd.com>, Chao Gao <chao.gao@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:56=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Mon, Nov 09, 2026 at 04:40:37PM -0800, Jim Mattson wrote:
> > Per the APM, "Canonicalization and Consistency Checks,"
> >
> >   [t]he following conditions are considered illegal state combinations:
> >
> >    - CR4.CET=3D1 when CR0.WP=3D0
> >    - Any reserved bit set in S_CET
> >    - CR4.CET=3D1 and U_CET.SS=3D1 when EFLAGS.VM=3D1
> >
> > Check these conditions in software before trying to VMRUN vmcb02, so th=
at
> > the illegal states result in a #VMEXIT to L1 rather than an exit to
> > userspace with KVM_EXIT_FAIL_ENTRY.
> >
> > Fixes: c5ba49458513 ("KVM: nSVM: Save/load CET Shadow Stack state to/fr=
om vmcb12/vmcb02")
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  arch/x86/kvm/svm/nested.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index af0ef678433d..20ede403b62d 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -469,6 +469,21 @@ static bool nested_vmcb_check_save(struct kvm_vcpu=
 *vcpu,
> >       if (CC(!__kvm_is_valid_cr4(vcpu, save->cr4)))
> >               return false;
> >
> > +     if (CC((save->cr4 & X86_CR4_CET) && !(save->cr0 & X86_CR0_WP)))
> > +             return false;
>
> Why aren't we checking X86_FEATURE_SHSTK here as well? Do we know if
> older CPUs that didn't support CET had the consistency check?

CR4.CET is reserved if an AMD CPU doesn't have X86_FEATURE_SHSTK.
Hence, older CPUs without CET support cannot fail the consistency
check.

> > +
> > +     if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) &&
> > +         CC(!kvm_is_valid_u_s_cet(vcpu, save->s_cet)))
> > +             return false;
> > +
> > +     if ((save->cr4 & X86_CR4_CET) && (save->rflags & X86_EFLAGS_VM)) =
{
> > +             u64 u_cet =3D 0;
> > +
> > +             if (!__kvm_emulate_msr_read(vcpu, MSR_IA32_U_CET, &u_cet)=
 &&
>
> If X86_FEATURE_SHSTK is not enumerated by the vCPU, then whether or not
> the consistency check is done depends on ignore_msr. If ignore_msr=3D0,
> the MSR read will fail and we won't do the consistency check, but if
> ignore_msr=3D1 the MSR read will silently return 0, so the consistency
> check will be done but will always succeed.

If X86_FEATURE_SHSTK is not enumerated by the vCPU, then CR4.CET =3D=3D 0
and this entire block is skipped.

> Instead of this implicit dependency, should we check for
> X86_FEATURE_SHSTK explicitly?

That seems superfluous.

> Also, if X86_FEATURE_SHSTK is enumberated by the vCPU, and the MSR read
> fails, the consistency check will silently be skipped. But I don't think
> this can/should happen. Maybe we should WARN in this case.

You're right; failure to read the MSR should result in a failed VMRUN,
and a warning would help triage the failure.

> One last question, in the restore path, the MSR may have not been
> restored yet, right? Can the consistency check mistakenly fail in this
> case?

Not with a legal snapshot. Note that on the restore path, the 'save'
area holds L1 state. Hence, RFLAGS.VM must be clear, because VMRUN
raises #UD in V8086 mode.

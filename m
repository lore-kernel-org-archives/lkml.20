Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825732;
	b=PTtOqdhTUZvU7bJwdoE0MPmVAvOLT1tQD2EWmt0h1mZIAMoW1AgSt9CZEurMb+FCFLL4
	 8fb7Yn+Uxpl/zwQirpOcUnqlIucB/qJ895a0sjyumxZxw6ZlOSIVYyvJrmbl+qGWsQ7St
	 xEtGQcIFcEbs4AhCllZWn3OCvJ0PCl1n0wifP/LyJpwCsQOUSHoLmI8r2qGoE62eVJUWf
	 fFL/Dw/4fyWU1OZDxBvyCRoBnSim3PEVgmn8dwetdiBP29cZZC/XGKo7D4Bm6NZfA9Mkv
	 wFI3GoKcuRlAz0sPMn6+qc20UcpvOcTLNmzaLU2YMYjsdGs1+gticNHLPIderi1W3NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=nqmtpTylBeemZ9sXvm4RoTldTKYD0S9LlWDnxIkCY/A=;
	b=axOKGFIANdzxXtvntxSo3qDmKBh7Uot6Nt45OfbxohxmRaeZ/JOG63bb7e/ucEh5B8F/
	 w/A+xRT/gty1RQW1h5OhETt1SwLh1w4054l9trRGhD5WL13N42xcrJA+HOk4jIMr9jAJ2
	 G1vHlfnu6eiSORSPVa/S3ULV7fWEr1NUxo3RO0jMOj22hAgRykZQ3B6qsJNRKwwbz7L5T
	 gwArW5qH+wjOfLyzfqO0TVNDgvguha4BtTWGL+HNdzNX4DzW5XwmxhdsC9emkwSeQ4qyP
	 nFu4bOgWWRphlq34+DOOhujnyAGmUxqqpcWzCJEouUiR6pLayppBJ7bWMWETzP1sGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nv00Ezch;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1E7609A807
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F1E7609A807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nv00Ezch
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8e16d22d8so15709835ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825730; x=1794430530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nqmtpTylBeemZ9sXvm4RoTldTKYD0S9LlWDnxIkCY/A=;
        b=nv00EzchfADywfLnw8bnPJd54ZSCE5AZp4mq5J7FWO1xpj1EZQPpBgHX56dUDJN2Bq
         qkGS/iTTaluJq8BvapCO89KLhmGQLgMDho93pxTv6ImxamjecdigipmSJ1SzdLt6WU2h
         sTlA8mQxSh1p39MoKb/Rw1NGU9nViRsWHViqVqUN7nyiYeOAE1b3bQYXWrzdIgnWbSS6
         lQG1NFsVQWiCQPZQokw7njfp6NOFZh8kM7AVJLpUV1Wf8gZchQkM21H0VdBgGgsLdHWK
         zW6aozP+k0Sw+Mv8UsPLrXy7VcBTEwJXCk07KWF1cmU9LEPVLyTIPVaWjLP1Klkv/3cU
         c0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825730; x=1794430530;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nqmtpTylBeemZ9sXvm4RoTldTKYD0S9LlWDnxIkCY/A=;
        b=ue2ZymSjjHlchBiUSOKX3toL9A94BUDYNrF47cbR7FozAjI52fqGXlL5OPQ5igmhLj
         yoTUWjrts9BVejbY1wqpU14whaHX90KI1xsvjiC5tN8Z3p/NnRqKy/qX/GhurXVzONnC
         2BG3pS/dXpUV6J7GxXQLIKc7PUKzNjM8tAm8nWYQvdSGPfPa94efIGzlbo8VhQ/zVlUE
         oG0mWF3DXiq4He3FSyMIjzShAQy1w85q6Rjal51/5e7mS13BHqfrMNd6xHL0u1X0Ztz5
         lkhlIBmoYfggheV8TY4E7KzV+Sy+eG7FPgo5oAzy4D6QjIXWBZak/ruMvPJzCEDWWvFb
         aFpA==
X-Forwarded-Encrypted: i=1; AKwUvBw8WiVsH/1Y7pzZ8ueqGjzG0oTBXjw2IbJxct8XzH8dMbeKr6Ib2OSzsAITLCF+Ioc/4CiTNFvmk+SZGgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QXn12rZ7yLNXbmPDc4ZGgVmNOSYNZNFATwzB1Z2E/6ymJ3hfc
	tNgGP6PBriUEXG3IqB3n4AFln/VqOeCrqpOtq7JnmX26b7W4Q1rPFe5auiTfbMUDGEAIPrKKqWn
	107cJKw==
X-Received: from plbbf12.prod.google.com ([2002:a17:902:b90c:b0:2e9:5442:b91a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:26cf:b0:2e9:b7ca:cd5e
 with SMTP id d9443c01a7336-2eb36523137mr166930145ad.62.1793825730369; Wed, 04
 Nov 2026 12:55:30 -0800 (PST)
Date: Wed, 4 Nov 2026 12:55:29 -0800
In-Reply-To: <CAO9r8zNy+r=dZFYthHQzOprD2xnMZ0OuC1SG_xJt10fs5iMjmw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020234535.3182385-1-jmattson@google.com> <20261020234535.3182385-2-jmattson@google.com>
 <CAO9r8zNy+r=dZFYthHQzOprD2xnMZ0OuC1SG_xJt10fs5iMjmw@mail.gmail.com>
Message-ID: <auubwbLDZLy8ZkjR@google.com>
Subject: Re: [PATCH 1/4] KVM: SVM: Always update LBR MSR intercepts on full
 MSR intercept recalc
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Like Xu <likexu@tencent.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026, Yosry Ahmed wrote:
> On Tue, Oct 20, 2026 at 4:45=E2=80=AFPM Jim Mattson <jmattson@google.com>=
 wrote:
> > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > index fe0cba4731b2..55b3ee840365 100644
> > --- a/arch/x86/kvm/svm/svm.c
> > +++ b/arch/x86/kvm/svm/svm.c
> > @@ -721,14 +721,11 @@ void *svm_alloc_permissions_map(unsigned long siz=
e, gfp_t gfp_mask)
> >         return pm;
> >  }
> >
> > -static void svm_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
> > +static void svm_set_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
> >  {
> >         struct vcpu_svm *svm =3D to_svm(vcpu);
> >         bool intercept =3D !(svm->vmcb->control.misc_ctl2 & SVM_MISC2_E=
NABLE_V_LBR);
> >
> > -       if (intercept =3D=3D svm->lbr_msrs_intercepted)
> > -               return;
> > -
> >         svm_set_intercept_for_msr(vcpu, MSR_IA32_LASTBRANCHFROMIP, MSR_=
TYPE_RW, intercept);
> >         svm_set_intercept_for_msr(vcpu, MSR_IA32_LASTBRANCHTOIP, MSR_TY=
PE_RW, intercept);
> >         svm_set_intercept_for_msr(vcpu, MSR_IA32_LASTINTFROMIP, MSR_TYP=
E_RW, intercept);
> > @@ -740,6 +737,22 @@ static void svm_recalc_lbr_msr_intercepts(struct k=
vm_vcpu *vcpu)
> >         svm->lbr_msrs_intercepted =3D intercept;
>=20
> Hmm I was going to ask if we can set svm->lbr_msrs_intercepted based
> on whether or not svm_set_intercept_for_msr() actually set the
> intercept, so that it also captures intercepts due to MSR filtering. I
> assume that we didn't do this because MSR filters can result in
> different interception status for different LBR MSRs, and we don't
> want to track them individually?

NAK.  In the past, KVM had a bitmap to do exactly that, and it was a trainw=
reck.

> Hmm even if we do track them individually (e.g. as a bitmap), it would
> add a bit of complexity here because we'll need to plumb that into
> svm_set_intercept_for_msr(), right?
>=20
> I suppose if we go with "lbr_msrs_intercepted just means KVM wants to
> intercept", then we should probably rename it accordingly?

Probably, but that can be done on top.  And I'd like to change all of these=
 flags
(all two of them?) to be consistent.

> >  }
> >
> > +static void svm_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
> > +{
> > +       struct vcpu_svm *svm =3D to_svm(vcpu);
> > +       bool intercept =3D !(svm->vmcb->control.misc_ctl2 & SVM_MISC2_E=
NABLE_V_LBR);

Eww.  The naming is all kinda of funky, and I strongly dislike the duplicat=
e code.
E.g. svm_set_lbr_msr_intercepts() recalcs, it's not a pure "set".  I'd much=
 rather
pass a @force param, e.g.

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e6b8c0423813..2d70fb37103e 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -728,12 +728,12 @@ void *svm_alloc_permissions_map(unsigned long size, g=
fp_t gfp_mask)
 	return pm;
 }
=20
-static void svm_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
+static void __svm_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu, bool fo=
rce)
 {
 	struct vcpu_svm *svm =3D to_svm(vcpu);
 	bool intercept =3D !(svm->vmcb->control.misc_ctl2 & SVM_MISC2_ENABLE_V_LB=
R);
=20
-	if (intercept =3D=3D svm->lbr_msrs_intercepted)
+	if (intercept =3D=3D svm->lbr_msrs_intercepted && !force)
 		return;
=20
 	svm_set_intercept_for_msr(vcpu, MSR_IA32_LASTBRANCHFROMIP, MSR_TYPE_RW, i=
ntercept);
@@ -747,6 +747,11 @@ static void svm_recalc_lbr_msr_intercepts(struct kvm_v=
cpu *vcpu)
 	svm->lbr_msrs_intercepted =3D intercept;
 }
=20
+static void svm_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
+{
+	__svm_recalc_lbr_msr_intercepts(vcpu, false);
+}
+
 void svm_vcpu_free_msrpm(void *msrpm)
 {
 	__free_pages(virt_to_page(msrpm), get_order(MSRPM_SIZE));
@@ -803,7 +808,7 @@ static void svm_recalc_msr_intercepts(struct kvm_vcpu *=
vcpu)
 #endif
=20
 	if (lbrv)
-		svm_recalc_lbr_msr_intercepts(vcpu);
+		__svm_recalc_lbr_msr_intercepts(vcpu, true);
=20
 	if (cpu_feature_enabled(X86_FEATURE_IBPB))
 		svm_set_intercept_for_msr(vcpu, MSR_IA32_PRED_CMD, MSR_TYPE_W,

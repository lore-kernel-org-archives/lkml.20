Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1016B37F321
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862505; cv=none; b=XfTGqjDpXYMedIClg6+9elrfkwunN5X/eSYSSRp7ONd0HDWu+AVgnRuFJnWQukBfYu30c1u5CfeIdsckAs5Nk0k7oXIJCqupPhfHsPgLwC9f8V+DpjDI/Cl/38r4/OeUnX5n8fxO21cEaBOcIU+lgpJ4HCxE0tzTnnN1n1AqkTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862505; c=relaxed/simple;
	bh=bn3yJsyeECnYWES4LwcleairYi0g2av33Cxyw/hN78k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QvE3Vn5Twhu4KXJpt3ylGvyuFKWBWe/nHgbH/+wY4L44sJBLsZT0dF43At0ecoNGhgpgG//8SJhGVGLDHaVLhSmUJ6yVePB7QANJVJev+pi7CFaDwrqQOhZCHKyaJUNMgnIKDUQzrfWfZztr/iICiPOn9ndkuBVK4dHtasV4APM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eCnAaCNN; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eCnAaCNN"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso553732a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787862502; x=1788467302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8D+nxEdvz4DkgEnFHoWhsUobNzXnmBESdYIamKD2lcM=;
        b=eCnAaCNNnsiaKzFXrF0JeXtZmmfYdclBY+GwYCJ58RkL2Zo/fQytiUkCF01PSTwdfn
         EB16OX2lw6356YD0C++lxjp3fFfAtnzMIHv9BpiFPlQSE9dC+z9OzeTB3HFDp7TTwXGB
         wYnOgb2JiankddZU1KQBLaAv6ofQvR5N24ru1xoa5GJ83gIIWl2Nb6ljYztgkxufpyKG
         OnSqVk5mqat8CiZqkVobMaJ3GosJmkLuCgw94sUz0jerp9CAC5P3XAZWI2ZoB5Wx4fk9
         37cWs37mhOvmFqWO9xkFcFs9KtJSGB67vNg+aWGGSuGHk8U/ZUCcAGaVyA7Rq+dfFpQK
         zX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787862502; x=1788467302;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8D+nxEdvz4DkgEnFHoWhsUobNzXnmBESdYIamKD2lcM=;
        b=gM3ZItwT2xHADKcqxgGsUOTN33cgF4/C+Mpq9ApObGzOfr/JoxRmI2IfTKfmkpDKfi
         YPzi/Qbp/xHq0vTYH9bfevDoT7Xu6V/iXWlyQHEYaJpEtiIcY4L9bXn6U9lLic6HLhiB
         fNQsSZgQTAFf7RPBGIDNPO/huLo888797Z2potserH9z87Btvv2x5lhyaOul7mYItGFT
         5b5X1Dly2+p7/fdhfTK3p5Wag3GFLurr7BQBfm2eyfaMh60NptF3xCw+4VMrDInMMSou
         DuEnUsMlhc+3MgM2NT7YACcZW+jzAIQjUOSBvGzF0fJANSPJkExdViMUb4HjzBFirGUs
         jwsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdWaLL5wiQY2US++/GdnDXBjU7X1m8K1+gVBSbxX30ruPrx0MHm9JcydWS7w87t1rb2VxqmoNfrzCbXOM=@vger.kernel.org
X-Gm-Message-State: AFuF++k8KYbcRRfFwsoi42qoM+577kv1Fw55TAMTCa0jfM2VG1ZHZ27a
	fl8NTJk19fP1pELkGT4yg4ueQaQZGl2vubS8lhXwkkgtpPVfxtAkP9dm3Of6DinZ7IiqiazT/mx
	AiAa3LQ==
X-Received: from pjbng10.prod.google.com ([2002:a17:90b:1a8a:b0:37c:a0c9:c61f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28ce:b0:396:67ed:da2d
 with SMTP id 98e67ed59e1d1-396d1040e3bmr3205671a91.15.1787862501877; Thu, 27
 Aug 2026 13:28:21 -0700 (PDT)
Date: Thu, 27 Aug 2026 13:28:21 -0700
In-Reply-To: <CAO9r8zOOq05nWk6c1sCnPAimFTuZLxc3BDrZLro-fXPR6ZMmTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826233919.998904-1-seanjc@google.com> <20260826233919.998904-14-seanjc@google.com>
 <CAO9r8zOOq05nWk6c1sCnPAimFTuZLxc3BDrZLro-fXPR6ZMmTw@mail.gmail.com>
Message-ID: <apCd5RSDYH13g0qR@google.com>
Subject: Re: [PATCH v3 13/13] KVM: selftests: Add and use double-underscore
 versions of vmlaunch() and vmresume()
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	f734222792@gmail.com, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026, Yosry Ahmed wrote:
> On Wed, Aug 26, 2026 at 4:39=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > diff --git a/tools/testing/selftests/kvm/x86/aperfmperf_test.c b/tools/=
testing/selftests/kvm/x86/aperfmperf_test.c
> > index 11f5894d8ac7..a082658c1e48 100644
> > --- a/tools/testing/selftests/kvm/x86/aperfmperf_test.c
> > +++ b/tools/testing/selftests/kvm/x86/aperfmperf_test.c
> > @@ -83,7 +83,7 @@ static void l1_vmx_code(struct vmx_pages *vmx)
> >                 vmreadz(CPU_BASED_VM_EXEC_CONTROL) | CPU_BASED_USE_MSR_=
BITMAPS);
> >
> >         GUEST_ASSERT(!vmwrite(GUEST_RIP, (u64)l2_guest_code));
>=20
> Do we wanna give the same treatment to vmwrite()?

Yes, and vmreadz().  Assuming '0' is simultaneously a reasonable failure an=
d "safe"
value is so stupid, especially since AFAICT literally none of the users act=
ually
need to gracefully tolerate failure.

LOL, and it can't possibly work, because vmread() clobbers the zeroed value=
 on
VM-Fail.  Hilarious.

I didn't include those changes purely because I had "#$*@ this code" fatigu=
e. :-)
But since this is going to conflict the world over, yeah, it makes sense to=
 just
fix everything.

> > -       GUEST_ASSERT(!vmlaunch());
> > +       vmlaunch();
> >  }
> >
> >  static void guest_code(void *nested_test_data)
> [..]
> > diff --git a/tools/testing/selftests/kvm/x86/nested_emulation_test.c b/=
tools/testing/selftests/kvm/x86/nested_emulation_test.c
> > index 2b38eff4f516..11fe4a31eda0 100644
> > --- a/tools/testing/selftests/kvm/x86/nested_emulation_test.c
> > +++ b/tools/testing/selftests/kvm/x86/nested_emulation_test.c
> > @@ -102,7 +102,7 @@ static void guest_code(void *test_data)
> >                         exit_insn_len =3D vmcb->control.next_rip - vmcb=
->save.rip;
> >                         GUEST_ASSERT_EQ(vmcb->save.rip, (u64)l2_instruc=
tion);
> >                 } else {
> > -                       GUEST_ASSERT_EQ(i ? vmresume() : vmlaunch(), 0)=
;
> > +                       i ? vmresume() : vmlaunch();
>=20
> Ewww
>=20
> >                         exit_reason =3D vmreadz(VM_EXIT_REASON);
> >                         exit_insn_len =3D vmreadz(VM_EXIT_INSTRUCTION_L=
EN);
> >                         GUEST_ASSERT_EQ(vmreadz(GUEST_RIP), (u64)l2_ins=
truction);
> > diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c b=
/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> > index 50c271a03692..c36c11b5f518 100644
> > --- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> > +++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> > @@ -112,7 +112,7 @@ static void vmx_run_l2(void *l2_code, int vector, u=
32 error_code)
> >  {
> >         GUEST_ASSERT(!vmwrite(GUEST_RIP, (u64)l2_code));
> >
> > -       GUEST_ASSERT_EQ(vector =3D=3D SS_VECTOR ? vmlaunch() : vmresume=
(), 0);
> > +       vector =3D=3D SS_VECTOR ? vmlaunch() : vmresume();
>=20
> Ewwwww
>=20
> Can we make these if/else statements? It was already ugly, but it
> looks even more ugly outside of GUEST_ASSERT_EQ().

Yeah.  Another idea would be:

  void vmenter(bool do_vmlaunch)
  {
	if (do_vmlaunch)
		vmlaunch();
	else
		vmresume();
  }

To yield:

	vmenter(vector =3D=3D SS_VECTOR);
	vmenter(!i);

Never mind, that's a terrible idea, the call sites are inscrutable.

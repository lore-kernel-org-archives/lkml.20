Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91711DED5C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852029; cv=none; b=XHmMnTFS5sFLtqik7u2Bdprnu1NDAIrT7J+PwOmsh6ndbB3qTI+lMKcxADD4l3iwzO+o03imk81bnxH/qW90HhkmPRJM/f6tYU0qqhCI5aQGTUDtZtglMbpx9l4Ba+ZnZb3+6Usy/4ybsdjCbzu1Oz/0gqzZGGvQrScHT0Wd4tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852029; c=relaxed/simple;
	bh=mQBC4ZInVAewkqG/uEXWTGggvkR3ICtM2BRnNn8cVvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ib/4C6rV/oPcOaxF4VLRBkyP1D1UIQVbXsn3/+ztgfl8xOFZn0Aq3iG1eFCdiy6f6nS2JmI+eVQSJXMTUMd8TLzK9xK75VS1aRFXtjyxGngJux+4SNmQ0CYM67RAGlic8QJ6ZbJpJmdsv2T8gcTustlZi4vmvIN75TfOYsQ+L/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n/TMbnQo; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n/TMbnQo"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so132620a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787852028; x=1788456828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A0Qync/lpbri7HzFIMP3cl9pdBpZkpuA/yuJrcyMO2s=;
        b=n/TMbnQoerCb/xA6HZywi0Wbc8OnPQ4N9bSILkh81hQXNmo6cNEflo97gBqFs8K8/7
         ekmoAbV9L1dAvZqtLdRyP7E1LQ+lcJRE/iwIV2k5fbb9gKMb225rQnD9ldB+J+1ri7A8
         yiZS1OX2+21IqkTNqFJOZsvzt67NEbLEu7bXA9gbVbiab2WkJbf3f/j1b3z+wlHElJb5
         piHftlkDyC5DnVbRV3SI/WSGjUsin6KAa8iKOm+GnyLo0onDc0AjBWa7UurZlZt1fhhF
         VetCQXjikWSNQ87YXGeoMwWT5kBnjcFWBuujJ49TWIb38m7QnEV1YX0pYtmNxJlEXPFO
         PTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852028; x=1788456828;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0Qync/lpbri7HzFIMP3cl9pdBpZkpuA/yuJrcyMO2s=;
        b=kOWbrFzl0EA9IkTwTB3N2n5o4CHZ0YSnplPYKAMl/EFDBxLtzNLYxN3vatBtM5OiXH
         0vB8GQQK4oFPCWRCIL3KqjjIK5tg6rSIqKweZusulTWn2Zy/9cWHjMXC4OLOQZQ0bUbd
         7Z5zjrIn+D+3lTwrjk4t269msbjG03yWzim8RBZpu1ymuyCv4Pq5i4kt5E7nDjWq6Npu
         rSDfbnajrrY8cX+DdB8ee2oewAO7qz8s7gYvU5N9WeQ5i3zzLLyn415z/u7RDm1UsqoQ
         BhYgcO6ZlAPYHRH03x3N1HBDorUzSwmBGvcScregVTgfUoS5ImzPG+rHphXsle8T+ZYr
         ueYA==
X-Forwarded-Encrypted: i=1; AHgh+RpD5sQxlGfeVxxsWeHTGKXu8bOKe8n7OLU1glvXeXTfJbAkxp0ffncYaN/pKBHnebVYi6z3Fwt9qggNNI8=@vger.kernel.org
X-Gm-Message-State: AFuF++lZYVczgvA9JuYmrljz5mVKFGU+sRJ8eUhUh6Hi7I9a2UzC1mry
	3GcMa2xPsEs47hFMyWfkBEupBWa85ugnygZG8sAnVXkQ6RyqJuoSRINJ4FwS9QF6SoSeisbt8OK
	337/x/A==
X-Received: from pgah16.prod.google.com ([2002:a05:6a02:4e90:b0:cc1:d46e:147a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:b7a7:b0:3be:b0b3:3962
 with SMTP id adf61e73a8af0-3d268ef9e07mr994999637.9.1787852027735; Thu, 27
 Aug 2026 10:33:47 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:33:47 -0700
In-Reply-To: <CAO9r8zOLJs_fm9ixxCRV=uz5qwpOS67=oz5ATGtB=w2Yd2vtOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826233919.998904-1-seanjc@google.com> <20260826233919.998904-13-seanjc@google.com>
 <CAO9r8zOuD+wU1Q80z077WHHpFBWvKomLk=TaXjH3gVnqj=mqFQ@mail.gmail.com>
 <apBomFOn1ZqHEnAQ@google.com> <CAO9r8zP3O_80Lr=4eKL6v-OaM9etMXPsNzADizf6ztB6YBuLHA@mail.gmail.com>
 <apBxMrqEkl_7khix@google.com> <CAO9r8zOLJs_fm9ixxCRV=uz5qwpOS67=oz5ATGtB=w2Yd2vtOw@mail.gmail.com>
Message-ID: <apB0-xly771CU7m_@google.com>
Subject: Re: [PATCH v3 12/13] KVM: selftests: Dedup assembly code for VMLAUNCH
 and VMRESUME
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	f734222792@gmail.com, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026, Yosry Ahmed wrote:
> On Thu, Aug 27, 2026 at 10:17=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > eVMCS is a memory operand, i.e. it's MOV RSP, [evmcs->host_rip].  The e=
xisting
> > evmcs_{vmresume,vmlaunch}() code is rather stupid and loads the address=
 into a
> > register, and then manually encodes MOV RSP, [<reg>].
>=20
> Can't we keep it as a register operand just to avoid vmwrite_operand?
> Does it actually hurt in any way?

...

> > diff --git tools/testing/selftests/kvm/lib/x86/vmx.c tools/testing/self=
tests/kvm/lib/x86/vmx.c
> > index 1a8515de42b0..b5efd10950c7 100644
> > --- tools/testing/selftests/kvm/lib/x86/vmx.c
> > +++ tools/testing/selftests/kvm/lib/x86/vmx.c
> > @@ -179,7 +179,10 @@ void load_vmcs(struct vmx_pages *vmx)
> >         vmclear(vmx->shadow_vmcs_gpa);
> >  }
> >
> > -#define __BUILD_VMX_VM_ENTRY_HELPER(insn, prefix, vmwrite_insn, vmwrit=
e_operand,       \
> > +const u64 HOST_RSP_ENCODING =3D HOST_RSP;
> > +const u64 HOST_RIP_ENCODING =3D HOST_RIP;
> > +
> > +#define __BUILD_VMX_VM_ENTRY_HELPER(insn, prefix, vmwrite_insn,       =
 \
> >                                     __host_rsp, __host_rip)            =
                 \
> >  static int __##prefix##_##insn(void)                                  =
                 \
> >  {                                                                     =
                 \
> > @@ -196,16 +199,17 @@ static int __##prefix##_##insn(void)             =
                                         \
> >                              VMX_SWITCH_GPRS_ASM                       =
                 \
> >                              "pop %%rax;"                              =
                 \
> >                              : [ret]"=3D&a"(ret)                       =
                   \
> > -                            : [host_rsp]__stringify(vmwrite_operand)(_=
_host_rsp),      \
> > -                              [host_rip]__stringify(vmwrite_operand)(_=
_host_rip),      \
> > +                            : [host_rsp]"m"(__host_rsp),              =
                 \
> > +                              [host_rip]"m"(__host_rip),              =
                 \
>=20
> I suppose we can use "r" here though?

No, because then the encoding for VMWRITE needs to be:

  vmwrite %%rsp, %[host_rsp]

but for MOV/eVMCS needs to be:

  mov %%rsp, (%[host_rsp])

Have fun feeding the '(' and ')' into the asm blob :-)

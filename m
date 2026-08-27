Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74D305674
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854074; cv=none; b=OHCtQCmjrdFxukJZ3TcwftngzFaAmn8pRU3RNEj0VBaMKH6gsfzqy27zR+yaV6Bowp0k41HKUr6vQUZ9Rff5X7TbD9tbNnqHE2f/1QN8tctZlfaj+jqVXQuW/itNHxZZrCczuVMciYcVpLFwH0l6HzS1zahWbbQtxc+CN09w4zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854074; c=relaxed/simple;
	bh=mYM7KZCNC4J6Gm99F9eOnRiT7a9uGwEnhTr3Hv881/A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tfhnwcVBGKDsbBH204wG+so/wvO43vlSH177zKBnmSiw7g/pP2T7FbdLrBZ+03+gU0YWW3XeLq7qKhdlqqBqBAv6QE95K9uWt4XYPYInGXnS277irBDtx50XbLmQ6VZR8TeOaSaGm4iiFJIqN92M93fUov7PPGwhtruiV89eCbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l1+3KkUE; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l1+3KkUE"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486c3411c8so230237b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787854063; x=1788458863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TCbLhzowWRlxRL1FBEh8DJZH9Zo/O/ePme34cY78990=;
        b=l1+3KkUE5Upe3WXdYS5j6lyy6qMHUHqNg0aLSLRuQejYlSmvtDxSJfgvFjzrE1lphh
         gSnnyBWe/ss0/eRXFsjuBrMxgVmARMJZOAcQePRXy4vYTqsxDhqXCFAZ5lhputrHuabw
         bAXL7FTYkqdOfoBM9ZqOJ1ZampDWhjwFX6/cBLUEgg+OKAkyoztJ4ufK9Ck2nJz5tUrz
         Js69oHYZ7IOtzw0MOV2sZI7fsgibl7sUXrHu91ZezhhG9oc6l5ZVG7mNkW+1Tx1hQiTe
         Fg+d12iT5dBfvi5Mi16xc5UtLVbRSRzhINEAIGsisuCNF9QmvxGRGrzFhdrnqf2SWsG1
         7o5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854063; x=1788458863;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCbLhzowWRlxRL1FBEh8DJZH9Zo/O/ePme34cY78990=;
        b=Az5YJyE024LgXwxXckk0eyTtR9toZmo1Gc+vWpo4RR4PMJHBemiM/9fWtbj1DRDxxs
         fFkPaaQchuhQlCYldUeeHOMGNR/LQU1uKVOFnEdCUCTj6S9E0sJ7lef1pMBUZW0CNCqz
         jf+22H827CBX2tsDzYS9WQf+lbnGHM1emrLQCQcf0fnHsmoAkovKRZWkTLTlvZLFHC2x
         zFMqXuNXocWFWTxD+xc/mUE1/jKLf7b4MI6fhRB/e7Mzm30EY2e13ihaN9LnVvULmkXs
         MQVgO/PRTUQa3P6EXqiFMmbWI7gVb/LMuHdNj4a+LUhPLrzXh5ppZEfWaIsdcx8vcH4A
         NHLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3ZARZHN/Vrrkb8/yxYa8l/9ZF04vQcMTYMAOJvhivPtx1/rYS2lN1kJlo1WkrzJAiScXi8H/kpfaeRaE=@vger.kernel.org
X-Gm-Message-State: AFuF++l6IrcAogWdKgO6RbDMFS0UopZt8lBv1PR3BIWdufHyaA7C1iwK
	caQvRC6+DqeRSbIDMBnhqQclHDkfQcE8nrX2BEBCMzq+DrApeebE9jxjI1+QzBjxNU2s//Y8+VP
	fiaDs/A==
X-Received: from pfbcj13.prod.google.com ([2002:a05:6a00:298d:b0:842:83c0:8d73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:190c:b0:848:77b3:579a
 with SMTP id d2e1a72fcca58-8562b888e7fmr1797225b3a.17.1787854062569; Thu, 27
 Aug 2026 11:07:42 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:07:41 -0700
In-Reply-To: <CAO9r8zNBpMry1ipXcNcQgZgUkTSb4scDadiMNXN0AwqJiY=8pA@mail.gmail.com>
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
 <apB0-xly771CU7m_@google.com> <CAO9r8zNBpMry1ipXcNcQgZgUkTSb4scDadiMNXN0AwqJiY=8pA@mail.gmail.com>
Message-ID: <apB87RG_qon96Q8R@google.com>
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
> On Thu, Aug 27, 2026 at 10:33=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Thu, Aug 27, 2026, Yosry Ahmed wrote:
> > > On Thu, Aug 27, 2026 at 10:17=E2=80=AFAM Sean Christopherson <seanjc@=
google.com> wrote:
> > > > eVMCS is a memory operand, i.e. it's MOV RSP, [evmcs->host_rip].  T=
he existing
> > > > evmcs_{vmresume,vmlaunch}() code is rather stupid and loads the add=
ress into a
> > > > register, and then manually encodes MOV RSP, [<reg>].
> > >
> > > Can't we keep it as a register operand just to avoid vmwrite_operand?
> > > Does it actually hurt in any way?
> >
> > ...
> >
> > > > diff --git tools/testing/selftests/kvm/lib/x86/vmx.c tools/testing/=
selftests/kvm/lib/x86/vmx.c
> > > > index 1a8515de42b0..b5efd10950c7 100644
> > > > --- tools/testing/selftests/kvm/lib/x86/vmx.c
> > > > +++ tools/testing/selftests/kvm/lib/x86/vmx.c
> > > > @@ -179,7 +179,10 @@ void load_vmcs(struct vmx_pages *vmx)
> > > >         vmclear(vmx->shadow_vmcs_gpa);
> > > >  }
> > > >
> > > > -#define __BUILD_VMX_VM_ENTRY_HELPER(insn, prefix, vmwrite_insn, vm=
write_operand,       \
> > > > +const u64 HOST_RSP_ENCODING =3D HOST_RSP;
> > > > +const u64 HOST_RIP_ENCODING =3D HOST_RIP;
> > > > +
> > > > +#define __BUILD_VMX_VM_ENTRY_HELPER(insn, prefix, vmwrite_insn,   =
     \
> > > >                                     __host_rsp, __host_rip)        =
                     \
> > > >  static int __##prefix##_##insn(void)                              =
                     \
> > > >  {                                                                 =
                     \
> > > > @@ -196,16 +199,17 @@ static int __##prefix##_##insn(void)         =
                                             \
> > > >                              VMX_SWITCH_GPRS_ASM                   =
                     \
> > > >                              "pop %%rax;"                          =
                     \
> > > >                              : [ret]"=3D&a"(ret)                   =
                       \
> > > > -                            : [host_rsp]__stringify(vmwrite_operan=
d)(__host_rsp),      \
> > > > -                              [host_rip]__stringify(vmwrite_operan=
d)(__host_rip),      \
> > > > +                            : [host_rsp]"m"(__host_rsp),          =
                     \
> > > > +                              [host_rip]"m"(__host_rip),          =
                     \
> > >
> > > I suppose we can use "r" here though?
> >
> > No, because then the encoding for VMWRITE needs to be:
> >
> >   vmwrite %%rsp, %[host_rsp]
> >
> > but for MOV/eVMCS needs to be:
> >
> >   mov %%rsp, (%[host_rsp])
> >
> > Have fun feeding the '(' and ')' into the asm blob :-)
>=20
> Semi-joking, what if we pass in the entire instruction instead?

Then there needs to be separate parameters for RSP vs. RIP, and we still ne=
ed to
pass different operands, *and* it bleeds information into the callers since=
 they
would need to hardcode use of %%rax and of the named constraints.

As ugly as the proposed code is, IMO the maintenance implications of the be=
low
is far worse than the subtle 'r' vs. 'm' (and on principle, I dislike passi=
ng an
address in a register and then manually encoding a memory operand).

#define __BUILD_VMX_VM_ENTRY_HELPER(insn, prefix, vmwrite_rsp, vmwrite_rip,=
		\
				    __host_rsp, __host_rip)				\
static int __##prefix##_##insn(void)							\
{											\
	int ret;									\
											\
	__asm__ __volatile__("push $0;"							\
			     vmwrite_rsp						\
			     "lea 1f(%%rip), %%rax;"					\
			     vmwrite_rip						\
			     VMX_SWITCH_GPRS_ASM					\
			     __stringify(insn)";"					\
			     "incq (%%rsp);"						\
			     "1: ;"							\
			     VMX_SWITCH_GPRS_ASM					\
			     "pop %%rax;"						\
			     : [ret]"=3D&a"(ret)						\
			     : [host_rsp]"r"((u64)__host_rsp),				\
			       [host_rip]"r"((u64)__host_rip),				\
			       GUEST_REGS_OFFSETS					\
			     : "memory", "cc");						\
	return ret;									\
}

#define BUILD_VMX_VM_ENTRY_HELPER(insn) 						\
	__BUILD_VMX_VM_ENTRY_HELPER(insn, _,						\
				    "vmwrite %%rsp, %[host_rsp];",			\
				    "vmwrite %%rax, %[host_rip];",			\
				    HOST_RSP, HOST_RIP)					\
	__BUILD_VMX_VM_ENTRY_HELPER(insn, __evmcs,					\
				    "mov %%rsp, (%[host_rsp]);",			\
				    "mov %%rsp, (%[host_rip]);",			\
				    &current_evmcs->host_rsp, &current_evmcs->host_rip)

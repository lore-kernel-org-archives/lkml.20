Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3074940B6D4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851061; cv=none; b=LztD4QY7mJiuU9nL0KoL9bELPMdUo7kd2EZLj/TFuAoOCA2trAtYIKRzoj5qEVOXcLC9/D9usqGu/93WsLKHoDOv6rI4TMjI6fDDQmOtBPWhApGaRsCIThcNeqVkTqEYVThHUyZKmUNoqfwGPYu67fRgls6YK8Wf/TQLEzpEMp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851061; c=relaxed/simple;
	bh=kZUvGMgDkJF0I421Gwxeg/moWCtG0J7dkmuLCb7CDHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=raYu9qlybpjWoXVTyZHXiVHDiFw5kddqx3MPZa/In7lTJEhhUVj9LyIbKiu8rW7cEO2S9or0CEdS6Kfy5Pez7DXWcWY5H3XFREPt8fVsNW4uya4zA3K1C5kJKSKiKxWlUmEuoyZaJYoN8gM/TpirXKC3sVn244In1BPa8SsNebI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=keFn2ScY; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="keFn2ScY"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-85599cf98e5so296038b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787851059; x=1788455859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aYBNRrzJEAv0A994/6qhRFOUK5yMN/F89xH3xrz0hxE=;
        b=keFn2ScYp+CFLLWVQwIJ61MXg0xQYNLGd0pEvM7SVZU20KAGSIVW5UAJetlwPLoW3b
         4mG2np+N2SuU7+N2niCNngT7wS5hHAJOP/sdZz5qvQH1zSRVc9+4EQ/BSKbdT3uNmXrg
         QlbpMphGdv4Dus91r7IIy1Yi2TL4oDN9LXeYdTc1UK3/qnhtK4MpCAmi02l/W5NaE19O
         xQT5fsMnjMX/E6dcB/4p4WnN6z3zTEqVvCGJadQmOylV39xOsSP7jm0HqToel7wcHVbj
         O2WtBEwm9w3XXw45GYS9FgNRvnEYckwdtO56R0Ub+UtqIhmoO7+gB7RLoJ2waJAoUNPQ
         4+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851059; x=1788455859;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYBNRrzJEAv0A994/6qhRFOUK5yMN/F89xH3xrz0hxE=;
        b=Yg3AfLm7bFzQpIand4MkvfJ7BE2u4BHbMFg6/yVIjLrBL0KHhbcajPIMp8L8R6GUwG
         moU8lrrzAFM9I/DuCJWpEvPQeT7T9mZdjhk0d8TlD5bcjrJFZB19y5WKg2ejCycLq/7a
         FCl3uXxeLRXcKeWxKmf76fxRK9CB+KD5vSccbKnp7ESc4WmoPlpPXdb6lmyTeELALWmy
         HtrQemSGFpYoOh+Njl87dLdsAg5F6cz6sF/9o8r2ftLn6oslpjjwrBJU5EcgI0Mrx0sx
         unWCnkGkKIJ2cWQSg1tux7e9T9U1Y7DrSJ3CNqehUYFUoXNOh4bM3SSIj/kzQQchGUZd
         qBFw==
X-Forwarded-Encrypted: i=1; AHgh+RrIjdi/UBJLtPZZAb26UMTCghBdEkG017dIxkrgnoiwOkk+hC4bAcFqYMaT/8dwyg4fxAn/dqSIdgkz7c8=@vger.kernel.org
X-Gm-Message-State: AFuF++mOYoYPlgTbKJpxUH0gjrBiGD3LbE12Wsh20JAO6ex0yLyMkrPB
	+eAKJAD1KwjVGokKCyaKOi7xeNTcQL8YPtKQ9HRviZNZKfa9PwSEntISQHh+h/tMB8WpUKG8KPp
	Yk26NfA==
X-Received: from pfbhg6.prod.google.com ([2002:a05:6a00:8606:b0:848:3f4b:c4da])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2da7:b0:851:bf92:34c9
 with SMTP id d2e1a72fcca58-8562a8d2cdfmr1241692b3a.9.1787851059240; Thu, 27
 Aug 2026 10:17:39 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:17:38 -0700
In-Reply-To: <CAO9r8zP3O_80Lr=4eKL6v-OaM9etMXPsNzADizf6ztB6YBuLHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826233919.998904-1-seanjc@google.com> <20260826233919.998904-13-seanjc@google.com>
 <CAO9r8zOuD+wU1Q80z077WHHpFBWvKomLk=TaXjH3gVnqj=mqFQ@mail.gmail.com>
 <apBomFOn1ZqHEnAQ@google.com> <CAO9r8zP3O_80Lr=4eKL6v-OaM9etMXPsNzADizf6ztB6YBuLHA@mail.gmail.com>
Message-ID: <apBxMrqEkl_7khix@google.com>
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
> On Thu, Aug 27, 2026 at 9:41=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >   #define __BUILD_VMX_VM_ENTRY_HELPER(insn, prefix, vmwrite_insn, vmwri=
te_operand,      \
> >                                     __host_rsp, __host_rip)            =
                 \
>=20
> The only part I really hate is vmwrite_operand. Why do we need it?  Seems
> like all the current helpers use "r", I feel like I am missing something.

...

> >   static int __##prefix##_##insn(void)                                 =
                 \
> >   {                                                                    =
                 \
> >         int ret;                                                       =
                 \
> >                                                                        =
                 \
> >         __asm__ __volatile__("push $0;"                                =
                 \
> >                              __stringify(vmwrite_insn) " %%rsp, %[host_=
rsp];"           \
> >                              "lea 1f(%%rip), %%rax;"                   =
                 \
> >                              __stringify(vmwrite_insn) " %%rax, %[host_=
rip];"           \
> >                              VMX_SWITCH_GPRS_ASM                       =
                 \
> >                              __stringify(insn)";"                      =
                 \
> >                              "incq (%%rsp);"                           =
                 \
> >                              "1: ;"                                    =
                 \
> >                              VMX_SWITCH_GPRS_ASM                       =
                 \
> >                              "pop %%rax;"                              =
                 \
> >                              : [ret]"=3D&a"(ret)                       =
                   \
> >                              : [host_rsp]__stringify(vmwrite_operand)(_=
_host_rsp),      \
> >                                [host_rip]__stringify(vmwrite_operand)(_=
_host_rip),      \
> >                                GUEST_REGS_OFFSETS                      =
                 \
> >                              : "memory", "cc");                        =
                 \
> >         return ret;                                                    =
                 \
> >   }
> >
> >   #define BUILD_VMX_VM_ENTRY_HELPER(insn) \
> >         __BUILD_VMX_VM_ENTRY_HELPER(insn, _, vmwrite, r, (u64)HOST_RSP,=
 (u64)HOST_RIP)  \
> >         __BUILD_VMX_VM_ENTRY_HELPER(insn, __evmcs, mov, m,             =
                 \
> >                                     current_evmcs->host_rsp, current_ev=
mcs->host_rip)

eVMCS is a memory operand, i.e. it's MOV RSP, [evmcs->host_rip].  The exist=
ing
evmcs_{vmresume,vmlaunch}() code is rather stupid and loads the address int=
o a
register, and then manually encodes MOV RSP, [<reg>].

P.S. just in case you didn't already think this code is evil, the '&' in th=
e
     above "[ret]"=3D&a"(ret)" is an earlyclobber that tells the compiler t=
hat
     RAX may be clobbered before all inputs and processed, i.e. prevents th=
e
     compiler from using RAX for VMWRITE's register operand, or from using =
RAX
     to compute the memory operand for eVMCS's MOV.

P.P.S. even though the prototype for VMWRITE is "VMWRITE r64, r/m64", Intel=
 is
       ass-backwards when it comes to syntax, i.e r/m64 is the source, not =
the
       dest, and so the field encoding *must* be a register operand.  I.e. =
we
       can't do something like this:

diff --git tools/testing/selftests/kvm/lib/x86/vmx.c tools/testing/selftest=
s/kvm/lib/x86/vmx.c
index 1a8515de42b0..b5efd10950c7 100644
--- tools/testing/selftests/kvm/lib/x86/vmx.c
+++ tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -179,7 +179,10 @@ void load_vmcs(struct vmx_pages *vmx)
        vmclear(vmx->shadow_vmcs_gpa);
 }
=20
-#define __BUILD_VMX_VM_ENTRY_HELPER(insn, prefix, vmwrite_insn, vmwrite_op=
erand,       \
+const u64 HOST_RSP_ENCODING =3D HOST_RSP;
+const u64 HOST_RIP_ENCODING =3D HOST_RIP;
+
+#define __BUILD_VMX_VM_ENTRY_HELPER(insn, prefix, vmwrite_insn,        \
                                    __host_rsp, __host_rip)                =
             \
 static int __##prefix##_##insn(void)                                      =
             \
 {                                                                         =
             \
@@ -196,16 +199,17 @@ static int __##prefix##_##insn(void)                 =
                                     \
                             VMX_SWITCH_GPRS_ASM                           =
             \
                             "pop %%rax;"                                  =
             \
                             : [ret]"=3D&a"(ret)                           =
               \
-                            : [host_rsp]__stringify(vmwrite_operand)(__hos=
t_rsp),      \
-                              [host_rip]__stringify(vmwrite_operand)(__hos=
t_rip),      \
+                            : [host_rsp]"m"(__host_rsp),                  =
             \
+                              [host_rip]"m"(__host_rip),                  =
             \
                               GUEST_REGS_OFFSETS                          =
             \
                             : "memory", "cc");                            =
             \
        return ret;                                                        =
             \
 }
=20
 #define BUILD_VMX_VM_ENTRY_HELPER(insn) \
-       __BUILD_VMX_VM_ENTRY_HELPER(insn, _, vmwrite, r, (u64)HOST_RSP, (u6=
4)HOST_RIP)  \
-       __BUILD_VMX_VM_ENTRY_HELPER(insn, __evmcs, mov, m,                 =
             \
+       __BUILD_VMX_VM_ENTRY_HELPER(insn, _, vmwrite,                      =
             \
+                                   HOST_RSP_ENCODING, HOST_RIP_ENCODING)  =
             \
+       __BUILD_VMX_VM_ENTRY_HELPER(insn, __evmcs, mov,                    =
             \
                                    current_evmcs->host_rsp, current_evmcs-=
>host_rip)
=20
 BUILD_VMX_VM_ENTRY_HELPER(vmlaunch)

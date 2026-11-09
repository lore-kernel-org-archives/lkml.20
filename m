Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243321;
	b=o8unNjDxBnGfE6z+WWF+63LI8Jtjos4d0D4ckCTDJvWfIja17vchtO140AiBQ13fRWh2
	 YO+QPDsbJiPz5D8yOhm8lLgeubudP4P+53bqkLRtCe9iIgxgITdNZzTjKkf1mRIGXwQ0c
	 Z+Qlf7IRo09jRWw2dfg4rMvORYlm5qwYV7NhGgw0jqYS5sW4iq2hWMO50X5ohG+jx8D42
	 hQEozHEoBtVtLM3NJTux+Oma0ZEWiEwqLzZ2t0IwsD0jEgfWGpdiTMSLxYNKYFLnBaPy/
	 FAWYLRbbytQqhtB0NRkSlAoKQEHLiD1XkIiqfMkNvHQjyoGgKFjR+wzzmFj9ToC/EyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RC0UrwDaQnc2FE/z5VGtYhnyiTOr5aGD0N9qLgTAlhw=;
	b=sJj318DZz4ZHyqwiO4P5Vrobs9MGamq4sDPhY7BmU6yfGdyRByfCj5EoTvzFuvxmdusl
	 AFZEacEVGlJxEUVPgwYrnIFNcA66ooMJ49ri+JEWIBnILPlmV3YsZkpSzPyvzsEqu36Qz
	 Ib55XCwsJ5FZlk7LMuhHXeNWm7dBRcg1NBEY66aLGPQ/pFdfpmN0ax6yCZvH9lB0oDC2e
	 ClC8n9MZGcj8iwFIbhgyMkPyp9yp5o2y2w/5STFZx8swUBscAw8LvWCOAErHMwwqR0EFw
	 EEHBYC5BfkxsdkrtC2q87j4IfZ//lxnQ0/OhoEbNuvDXQKIURYrKWv9884j4LeWMmHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jc1FL17+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55297606A418
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55297606A418
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jc1FL17+
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so277691cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:55:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794243320; cv=none;
        d=google.com; s=arc-20260327;
        b=bnHiWXTZnE7ymajO7REX5Gb8WuTSRifYNI/tVf+4IVyusWxL0GTyBy4I3T4wIfOUGM
         DZnNcZTNKnw2obMi3WmGRqNaNFKe/OyWiYd1oAFkI0TCVAOlsUAIXhla6G9ksdVOPG9W
         flJvYcpCsnR3oiGV/Ada2TjJwstvCCZAOP2dhyt4aM48na9CCVWBSy9FO4hnhBy0Byhe
         HohO5BgOWgfrry5ZdZYeehXnMuY/PzS739XBHH8ZFssKWpNdyJSzpOcMmZi76C9WnJME
         ZMODgZgINUp4F0TiWY0RKQVMiaEZlFBTKodrv14YFa2BpJFRlvUr+88DIQAtUcRX66Bl
         HPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RC0UrwDaQnc2FE/z5VGtYhnyiTOr5aGD0N9qLgTAlhw=;
        fh=gzsQFMOn8BR3M3jnwNtaeVw14ZrQs2ECY4wRJ6ZGCo4=;
        b=bRbqKyfisR0HbvWR7YRGYB5c4ikNd0JY6UL/hgcOAVLS7KEFA8EtK6EkIG6SHbbuD0
         rUjeUx8xMYSN4RU67hDHXl1qZfNXHBSaZb0AO83j4Mjl+O7yeaVxqBQkFoYFx6KO2EKq
         qVTg/aBQK7dRXcE8rxHNBNdxNXFWWzY++ZvJugJjN0Wxadn6omBZnwig9rANwa6G+YNW
         aBQb9dwwYcCHmO60xUMC3n55F06JAFioQIYpV0u47o0WId4RBNwP7wxDVG0lvHyX+57s
         NFbaKtQa0mMUXDKqrJmer1CdoUO2r5y6qjxpRQta897TS8fL0Gci5F+yWnMXMteFMrTk
         mZnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794243320; x=1794848120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RC0UrwDaQnc2FE/z5VGtYhnyiTOr5aGD0N9qLgTAlhw=;
        b=jc1FL17+Np+kc4Do8ZN8kgBCjl8M6NjXByLa4z2MmOaoTcUdZBYYV/NseTN4vrG90D
         4c6xr2vltwjgfwSMUr8mg3QiDP6uR9OtNyp7KSC4bRR8ov0xh/upRx9YmfWlGYWi3lOn
         fRJ/oAjlISRd/SpFsj9df3NbmyJSAf4ryLzvQ1W5UqO6UzUB9r7R9xoii+NccAEr/XFw
         mQUAsZAf3Ey4xkdEWIrom9vXB6uTsTdgggYwnaQU9NbD46E+Y01hJ0/UyjDeNtQWrGAn
         DqbfnkfFfFWk7osqRMpqjR2773LTkkFnFLzfqLyHiwIRCctgtxAaqy/rXkBSHDDfNrbf
         qdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243320; x=1794848120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RC0UrwDaQnc2FE/z5VGtYhnyiTOr5aGD0N9qLgTAlhw=;
        b=NDW7TfZFVtRWmrAKkcCZhNd0lD/k1AvDOZeu41K1B2/Dqxy8dbjqWAloKUkN2NFHlG
         7NP25QxnzUqYLtZ+5ge+c+lgkr0MsOGrjfgQ1ETuposoR5IrLb4Gy/2Ar1irZMWqR6jI
         Hthxv7olIQ+eTHKLCvNUEUovJ2kYkoqmaDyZdSjx3suO+Sk/tmJWtS1/bLGnTJJxoRRN
         Y/RzEzMg9J6GYW8hbVQpJoJxBSWeDFSIO0jm/sfmNJ0pMm4tRC55fj/mHL6gQP7jaqN2
         C7WTcTfJS72SVoTyhH34Obx4mp6V7XQQehXZZieTAVXDE8BhnJFphPYhy1FR7Z3qUFMx
         YEaw==
X-Forwarded-Encrypted: i=1; AL+hErFcN5h7uQcTsYxbeytUXri09+IVTGPh7YTArVC3cUUJ9/GWNZ5xNVRw1yZ5vZaTO0PEDA92WxQM9XoVUfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D5gi0n+Dvu9FqZVwbf2Mt73FrkWkP3zmWJrYxHZacnvMJdlz3
	PhrKgV9BFt0ey/0AyrBYBjXhtcKquA5nKHmuJkBiDFcNsf45MWYdLXGm9R3Jv11MHCG/N3tnxBM
	MqBmFOZ3ubQX+gqMPzbRo0Tbi2jEhiSiOCEWMRoNe
X-Gm-Gg: AYBFou0P+XZVKBSv8jTP0hsvcJgONi8/pnbXmDWWNNuv3vGdfqJBoIX/LzVN/E+Zu4N
	QliMWJHWlqw1YwGj6ZAMEsn2rvnWXty/mnVJPV6M1057eoCqJ2+DqivWk66FzBNKS0uNBocPOwP
	BBZhmy+BCR4PfbkS3VN7ohnrieJg8i2Nuxu7SRpLPJA3MlLMan7a5xx6VqqRutqdx33m9WFcTc/
	Olhz6UjzVJpRCP22RzcpJStpzn3cqkSoQw9OiVQ9OOoBjGS0WQTgMPKAh7G+uyak+pfsZRERxhx
	p3WwFeVceBJHlvxUGNUrFapRnHKci4Kb4s5fuWl/WJHMvuuWukaNav91Z1+2aakr7z53nHnXcQd
	xAaN+uZ6kAWflXraOdUDLXAxzUUiGMLiF7Jo0OVrWuMNJJR9u2YHyJ1XDRd+l1V0k/9+HUw==
X-Received: by 2002:a05:622a:4006:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-55517fe3db9mr549891cf.6.1794243319297; Mon, 09 Nov 2026
 08:55:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tdx-selftests-v16-18-2024e8fa517a@google.com> <20261106164732.3939387-1-seanjc@google.com>
In-Reply-To: <20261106164732.3939387-1-seanjc@google.com>
From: Sagi Shahar <sagis@google.com>
Date: Mon, 9 Nov 2026 10:55:07 -0600
X-Gm-Features: AclHuK_aPoWJeYsWIu0Fp7vvyMmwJfBcQK_7pGNixlXWs0_drRFcIAQ91_Pbzbc
Message-ID: <CAAhR5DEwMT+JMYegyuXR2mLJ4C=pvHo1wSbkHF+jS40U2Ag99A@mail.gmail.com>
Subject: Re: [PATCH v16.1] KVM: selftests: Add support for TDX ucalls, via TDVMCALL_REPORT_FATAL_ERROR
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lisa Wang <wyihan@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:47=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Add support for doing ucalls on TDX by abusing TDVMCALL_REPORT_FATAL_ERRO=
R
> to pass the address of the payload to the host.  The "fatal error" TDVMCA=
LL
> is perfectly suited for passing information to host userspace, as both th=
e
> TDX Module and KVM allow the guest to pass (almost) all registers to the
> host, i.e. provide enough of a data payload to make a collision with a re=
al
> fatal error practically impossible.
>
> TDX can't use port I/O, as the TDX ABI doesn't allow the guest to share
> arbitrary register state with the host on a port I/O exit, and the port I=
/O
> data payload is limited to 4 bytes, i.e. would potentially truncate the
> ucall address.
>
> Alternatively, TDX could use MMIO, but using a magic emulated MMIO addres=
s
> is fragile (see the TODO in __vm_create()), especially for TDX since TDX
> doesn't support read-only memslots, i.e. doesn't have line of sight towar=
ds
> addressing the TODO.  E.g. TDX could hardcode the address to something th=
at
> is all but guaranteed to be unused on x86, e.g. the I/O APIC base address
> or the HPET address, but that doesn't truly address the fragility concern=
s,
> and it's ugly because ucall_arch_init() would completely ignore the passe=
d
> in @mmio_gpa despite obviously utilizing emulated MMIO.
>
> Use a simple flag to route vCPUs/VMs to the right do_ucall() routine, and
> take care to set the flag via write_guest_global() so that ucall_arch_ini=
t()
> is thread safe (in the *extremely* unlikely scenario a single test create=
s
> both TDX and non-TDX VMs *concurrently).
>
> Alternatively, a virtual function pointer could be used to dispatch to th=
e
> correct do_ucall() via an indirect branch, but that has zero advantages
> other than making ucall_arch_do_ucall() look prettier, at the cost of bei=
ng
> slightly harder to understand and making ucall_arch_init() uglier.  KISS.
>
> Cc: Sagi Shahar <sagis@google.com>
> Cc: Lisa Wang <wyihan@google.com>
> Cc: Xiaoyao Li <xiaoyao.li@intel.com>
> Cc: Binbin Wu <binbin.wu@linux.intel.com>
> Cc: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/x86/tdx/tdx.h       |  7 +++
>  .../testing/selftests/kvm/include/x86/ucall.h |  6 +--
>  tools/testing/selftests/kvm/lib/x86/ucall.c   | 53 +++++++++++++++++--
>  3 files changed, 58 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/te=
sting/selftests/kvm/include/x86/tdx/tdx.h
> index d41a1efc8a63..9982aaaba885 100644
> --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> @@ -4,6 +4,13 @@
>
>  #include <linux/types.h>
>
> +/* TDX hypercall Leaf IDs */
> +#define TDVMCALL_GET_TD_VM_CALL_INFO           0x10000
> +#define TDVMCALL_MAP_GPA                       0x10001
> +#define TDVMCALL_GET_QUOTE                     0x10002
> +#define TDVMCALL_REPORT_FATAL_ERROR            0x10003
> +#define TDVMCALL_SETUP_EVENT_NOTIFY_INTERRUPT  0x10004
> +
>  u64 __tdvmcall(u64 fn, u64 r12, u64 r13, u64 r14, u64 r15);
>
>  #endif /* SELFTEST_KVM_TDX_TDX_H */
> diff --git a/tools/testing/selftests/kvm/include/x86/ucall.h b/tools/test=
ing/selftests/kvm/include/x86/ucall.h
> index 0e4950041e3e..aca582bb2cd5 100644
> --- a/tools/testing/selftests/kvm/include/x86/ucall.h
> +++ b/tools/testing/selftests/kvm/include/x86/ucall.h
> @@ -2,12 +2,8 @@
>  #ifndef SELFTEST_KVM_UCALL_H
>  #define SELFTEST_KVM_UCALL_H
>
> -#include "kvm_util.h"
> +#include <linux/kvm.h>
>
>  #define UCALL_EXIT_REASON       KVM_EXIT_IO
>
> -static inline void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
> -{
> -}
> -
>  #endif
> diff --git a/tools/testing/selftests/kvm/lib/x86/ucall.c b/tools/testing/=
selftests/kvm/lib/x86/ucall.c
> index 38050c60a067..bb4a7215d9b1 100644
> --- a/tools/testing/selftests/kvm/lib/x86/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
> @@ -5,16 +5,40 @@
>   * Copyright (C) 2018, Red Hat, Inc.
>   */
>  #include "kvm_util.h"
> +#include "tdx/tdx.h"
> +#include "tdx/tdx_util.h"
>
> -#define UCALL_PIO_PORT ((u16)0x1000)
> +#define UCALL_PIO_PORT         ((u16)0x1000)
> +#define UCALL_TDX_MAGIC                0xabacadabaULL
>
> -void ucall_arch_do_ucall(gva_t uc)
> +static void ucall_tdx_do_ucall(gva_t uc)
> +{
> +       __tdvmcall(TDVMCALL_REPORT_FATAL_ERROR, UCALL_TDX_MAGIC, uc, 0, 0=
);
> +}
> +
> +static void *ucall_tdx_get_ucall(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_run *run =3D vcpu->run;
> +
> +       /*
> +        * KVM_SYSTEM_EVENT_TDX_FATAL stores R0..R15 in data[0..15].  R12
> +        * holds the ucall magic and R13 holds the ucall GVA.
> +        */
> +       if (run->exit_reason =3D=3D KVM_EXIT_SYSTEM_EVENT &&
> +           run->system_event.type =3D=3D KVM_SYSTEM_EVENT_TDX_FATAL &&
> +           run->system_event.data[12] =3D=3D UCALL_TDX_MAGIC)
> +               return (void *)(run->system_event.data[13]);
> +
> +       return NULL;
> +}
> +
> +static void ucall_x86_do_ucall(gva_t uc)
>  {
>         asm volatile("in %[port], %%al"
>                 : : [port] "d" (UCALL_PIO_PORT), "D" (uc) : "rax", "memor=
y");
>  }
>
> -void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
> +static void *ucall_x86_get_ucall(struct kvm_vcpu *vcpu)
>  {
>         struct kvm_run *run =3D vcpu->run;
>
> @@ -26,3 +50,26 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
>         }
>         return NULL;
>  }
> +
> +static bool ucall_is_tdx_vm;
> +
> +void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
> +{
> +       write_guest_global(vm, ucall_is_tdx_vm, is_tdx_vm(vm));
> +}
> +
> +void ucall_arch_do_ucall(gva_t uc)
> +{
> +       if (ucall_is_tdx_vm)
> +               return ucall_tdx_do_ucall(uc);
> +
> +       return ucall_x86_do_ucall(uc);
> +}
> +
> +void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
> +{
> +       if (is_tdx_vm(vcpu->vm))
> +               return ucall_tdx_get_ucall(vcpu);
> +
> +       return ucall_x86_get_ucall(vcpu);
> +}
>
> base-commit: 4aeb1c3931544fb3bb64397391c2e7153a81f824
> --
> 2.56.0.567.gdb80ae8cd5-goog
>

Reviewed-by: Sagi Shahar <sagis@google.com>

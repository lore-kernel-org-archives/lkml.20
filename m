Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF586419FB2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139811; cv=pass; b=QsBiBR97SskqYgk55yySfe3qQ2J/Su3uAdMgjC9MtYlRkzr+BDOKGQ9GBe7JbXundSGEnBen7fXPTsMYQvGjHcCtrI5Y8CdFdDW2PZntH8BpIdWklEUzM+NabkNjyKJrIO/Zx3Puy8TtmFzhLOU9QbjkSYGgrOtWXYRa7ZCUfF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139811; c=relaxed/simple;
	bh=YGxrPNmKo+Cu2MYeesggWlBjJm+RWBe5YXtDpPU+Wk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwlNuBDcfGx+gzS2FBDbiRnL+02UpPWrIzD8XQEPZyTkl5Ew1lIF8jpjcX2StxU2gXlHOWRYeUXER6BEcXcXxDRLIDF/XRzkzt8s7vjmScON0ZfBRSpL09bpvxYdXHgkirzOGmarJ7EMMAJJvprsfTkA7EIa9HgCN6i/Af9Xdgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqhsdzYx; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqhsdzYx"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c34bff61551so861329766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792139804; cv=none;
        d=google.com; s=arc-20260327;
        b=W4SbTkNNYcK46xw8WBUC6bdUSQoV0LPqvqDiAy1a4hpa46AjoFDIbXBEPzTLpnxilC
         Z8VXSUas1GF8mlei3R8YB6o5QC1bpnSgR5GV22HHOWDbVO/VF+s/wwXOaO+4u4dIvxDz
         VNnqbG+v8Pf+lSN9m35Z7YIqly6pEc86eUCrob2RGjXKTZZZoI2OVIofK8cR/BeVu6jU
         GOqaOmLLVDX1+w5kkF3Keh3SSPNjYv7yosvydjXi8OK/hwA14zdIoiPutu7PuCUUdx/j
         tiKkBRhlnnRpXo0PLFf05XVdw+SpgfhIfkKi5lizE1Vz9A0uWlDNkNSPpU8D9Cb7rA8D
         XoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ko2nFEKzryM0Joy0DntqtRQJcRZwX6j2MQIGWblaJQ0=;
        fh=6p+nqI3KmTR6oqzcPTGdKvgQOpFgwRTSUOUZYPuZvkg=;
        b=pahWJJ2quq86GOTrjaf0IpoXYzFgRAjYaN0Y6FC3eD2/M8bTTp77tNOzZTxrFVSiOZ
         PR+/LuS4KA2Bjp+4FPjFY29FbpHIH/3TT2H5OhJ6c6/ZNQlLC5lsMvZwiGFcpsXfQrGy
         hV2OZIrT45dhVAxdghtrXUDdyDdzgBoQjtX8zEit/NgTm4CmFdA7I+ap0dta7JWXbtBD
         bVTVTeCcTbwZ1odfNuuatOmR1l5aQ/J5THzJltRiKh4R/Lt0SbUJfeo09uHwXB52wDFn
         FLcMxmrrAe7ObVx35ow6PhNo8mnUP54VMVzBkqnC7QPg+PGNI8ibUEKBLXXJXQkA/vaR
         cFfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792139804; x=1792744604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ko2nFEKzryM0Joy0DntqtRQJcRZwX6j2MQIGWblaJQ0=;
        b=lqhsdzYxORC5/P5DIurlFwjMDo/C81fWfdmZdWHC5qZM7kxHa7E1XMysN28TUGCY/3
         fLhIx0LCwFymdrvoU1VTzBbbN2fac3kfz2D9mEyFFD1xjpSu6xUBlFceBAvpBcTjk/Y1
         ijspVC++y5RlBedH9WebDUHdhZ6MsDRBag6qEabjOiHiX50anEUTm9OJ0Z00Sm+H0ekr
         rJh3tHJWr3DSyoPYUJYdIibXNz6VWG02Z1hcd2LpSEZ6stpd7bCI20QOT3kGFa+TUgv6
         3vc7h1+DWmIym6BFDHtbLlEcS0gr8kmw8qiJsUno+ai9h9gLqsv7fURPb/qeDFLv2Dhs
         5RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139804; x=1792744604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ko2nFEKzryM0Joy0DntqtRQJcRZwX6j2MQIGWblaJQ0=;
        b=k7sXYcire+N/YXehdZjHm8TIM2HhfH6EYer6x4uGKdfDzHCw9sCku7BXyXkc9FZVVW
         kuYbvaDZukjVFRBu1DvLDDFoF38F70REYim6VVwP5Ot7uyzlFd0VuSiVnTDeoOtw0zOZ
         rK4jDDUjHjL988LJY8piXeMo+Ko4xi3c/G03LcjAY3VQNIObe2TVOGb47Xt6B0bc1hVS
         WCkQ2J8zkiIrtc3N6HY2CPmYr17aYlmfCb0cVvCOtxqnFt1S7FUBNPVbgEwqrwE2GTR7
         aY3L53c40UYsKfn0LEinMBc5IRFdcjX6C68vj3Wc9SxPdwaN2ndrjAQdy9yQsa4Yo0EL
         b83Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9tiUjRh2slosT4fBe9QMhIPY5KnaZkG2QUFoy1HjeLIw8sv0SKX72pVdFoXmyeWiFWTsd/TTPK9nKIpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKop3S9ZvzDomqlPYMudu9Zt7BeOcv8qpm4ApXxh+z9RCqLaP+V
	hFWpMZMxO6k/ArKyFoPpz0VAQXuyZW46721UsSMIG77U+P28LJywGHC/ZL2/5WnzSjY3BK7rqAq
	IQMv7a/V8V3tYB2mCi8MvwMh0CyfCJxk=
X-Gm-Gg: AYBFou0e/kEZqeCfBslZTrWe4ga1H2pOzQLIG5Hm2WrZKUzET2Qt0YOjX6QO71O4Xvd
	vPCvjrBYlb5wt5ikGH1cA21Goz5Se00soNjHkNMPbjdRiXsDoR0w9M/TI4F7BZcOPd2dAeVURT1
	F22Q3V/BhSYQGVTXrI3CY/rg85jpkNw1eTcQc49WNGDPgyN9vCcQxfwpXqYTV3YevgJPoBYMUc2
	JoeexC+yPMW5M0/9N0n3ZS4fAOfbt46CdrM8TcbGoSdSs9sI1qcML2oI4LhZkkRbr/zBqQ4P803
	AHfczIm3SsVhpp34qFabY+rV4maBgsA4TsLh1TNhElYgoia0pTcic1aa
X-Received: by 2002:a05:6938:a082:10b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c3ef39b2474mr293285166b.0.1792139803822; Fri, 16 Oct 2026
 01:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011194902.97364-1-mathieu.desnoyers@efficios.com> <20261011194902.97364-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261011194902.97364-3-mathieu.desnoyers@efficios.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 16 Oct 2026 16:36:31 +0800
X-Gm-Features: AclHuK999gbk47tvgPj7S_99XIxJx7kM0oNSpmR7D65tPGL3PLvLQleVMZhU9_g
Message-ID: <CAN_Opa_aBH0iP+q_GoG=2JhVaCpgu6_K5S7hPDhLQ4u1jw=jqg@mail.gmail.com>
Subject: Re: [PATCH hazptr v3 2/4] ptr_eq.h: Introduce ptr_eq() to preserve
 address dependency
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, 
	John Stultz <jstultz@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Gary Guo <gary@garyguo.net>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev, 
	Lian Wang <lianux.mm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

I checked both implementations of ptr_eq().

The x86 version uses inline asm for the comparison, so
the compiler cannot reason about it as an ordinary C
pointer comparison.

The generic version uses OPTIMIZER_HIDE_VAR() before
the comparison to prevent the compiler from propagating
the original pointer values through it. I verified this
with GCC 13.3 on ARM64: the generated code uses the
second load's result for the dependent access, rather
than reusing the first load's result.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu

On Mon, Oct 12, 2026 at 3:49=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Compiler CSE and SSA GVN optimizations can cause the address dependency
> of addresses returned by rcu_dereference to be lost when comparing those
> pointers with either constants or previously loaded pointers.
>
> Introduce ptr_eq() to compare two addresses while preserving the address
> dependencies for later use of the address. It should be used when
> comparing an address returned by rcu_dereference().
>
> This is needed to prevent the compiler CSE and SSA GVN optimizations
> from using @a (or @b) in places where the source refers to @b (or @a)
> based on the fact that after the comparison, the two are known to be
> equal, which does not preserve address dependencies and allows the
> following misordering speculations:
>
> - If @b is a constant, the compiler can issue the loads which depend
>   on @a before loading @a.
> - If @b is a register populated by a prior load, weakly-ordered
>   CPUs can speculate loads which depend on @a before loading @a.
>
> The same logic applies with @a and @b swapped.
>
> The header "linux/ptr_eq.h" is the expected include target. It
> contains the documentation of the ptr_eq() API.
>
> An architecture specific implementation of the pointer comparison
> can be implemented by each architecture as asm/ptr_eq.h. The x86
> implementation is provided initially. If no implementation header is
> present for the architecture, an arch-agnostic fallback based on
> OPTIMIZER_HIDE_VAR is included from asm-generic.
>
> The arguments to ptr_eq() are const volatile to take advantage of
> implicit conversion that adds cv-qualifiers, which are thus added
> implicitly.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: John Stultz <jstultz@google.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Cc: Zqiang <qiang.zhang1211@gmail.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: maged.michael@gmail.com
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: rcu@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: lkmm@lists.linux.dev
> Cc: Nikita Popov <github@npopov.com>
> Cc: llvm@lists.linux.dev
> Cc: Lian Wang <lianux.mm@gmail.com>
> Cc: Kunwu Chan <kunwu.chan@gmail.com>
> ---
> Changes since v2:
> - Rename ptreq.h to ptr_eq.h (x86, asm-generic and linux headers).
>   Adapt the include guards accordingly.
>
> Changes since v1:
> - Move to linux/ptreq.h, implement x86-specific comparison
>   and asm-generic header (fallback).
>
> Changes since v0:
> - Include feedback from Alan Stern.
> ---
>  arch/x86/include/asm/ptr_eq.h | 16 +++++++++
>  include/asm-generic/Kbuild    |  1 +
>  include/asm-generic/ptr_eq.h  | 16 +++++++++
>  include/linux/ptr_eq.h        | 63 +++++++++++++++++++++++++++++++++++
>  4 files changed, 96 insertions(+)
>  create mode 100644 arch/x86/include/asm/ptr_eq.h
>  create mode 100644 include/asm-generic/ptr_eq.h
>  create mode 100644 include/linux/ptr_eq.h
>
> diff --git a/arch/x86/include/asm/ptr_eq.h b/arch/x86/include/asm/ptr_eq.=
h
> new file mode 100644
> index 000000000000..8e521cabe24b
> --- /dev/null
> +++ b/arch/x86/include/asm/ptr_eq.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_PTR_EQ_H
> +#define _ASM_X86_PTR_EQ_H
> +
> +#include <linux/types.h>
> +#include <asm/asm.h>
> +
> +static __always_inline
> +bool ptr_eq(const volatile void *a, const volatile void *b)
> +{
> +       bool ret;
> +       asm(__ASM_SIZE(cmp) " %1,%2" : "=3D@ccz" (ret) : "r" (a), "r" (b)=
);
> +       return ret;
> +}
> +
> +#endif /* _ASM_X86_PTR_EQ_H */
> diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
> index 2bc00c67dc54..86cee0dfd47f 100644
> --- a/include/asm-generic/Kbuild
> +++ b/include/asm-generic/Kbuild
> @@ -47,6 +47,7 @@ mandatory-y +=3D percpu.h
>  mandatory-y +=3D percpu_types.h
>  mandatory-y +=3D pgalloc.h
>  mandatory-y +=3D preempt.h
> +mandatory-y +=3D ptr_eq.h
>  mandatory-y +=3D rqspinlock.h
>  mandatory-y +=3D runtime-const.h
>  mandatory-y +=3D rwonce.h
> diff --git a/include/asm-generic/ptr_eq.h b/include/asm-generic/ptr_eq.h
> new file mode 100644
> index 000000000000..2bd1c3b8a56f
> --- /dev/null
> +++ b/include/asm-generic/ptr_eq.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_GENERIC_PTR_EQ_H
> +#define __ASM_GENERIC_PTR_EQ_H
> +
> +#include <linux/types.h>
> +#include <linux/compiler.h>
> +
> +static __always_inline
> +bool ptr_eq(const volatile void *a, const volatile void *b)
> +{
> +       OPTIMIZER_HIDE_VAR(a);
> +       OPTIMIZER_HIDE_VAR(b);
> +       return a =3D=3D b;
> +}
> +
> +#endif /* __ASM_GENERIC_PTR_EQ_H */
> diff --git a/include/linux/ptr_eq.h b/include/linux/ptr_eq.h
> new file mode 100644
> index 000000000000..7a2bbf6e64b3
> --- /dev/null
> +++ b/include/linux/ptr_eq.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_PTR_EQ_H
> +#define _LINUX_PTR_EQ_H
> +
> +/*
> + * Compare two addresses while preserving the address dependencies for
> + * later use of the address. It should be used when comparing an address
> + * returned by rcu_dereference().
> + *
> + * This is needed to prevent the compiler CSE and SSA GVN optimizations
> + * from using @a (or @b) in places where the source refers to @b (or @a)
> + * based on the fact that after the comparison, the two are known to be
> + * equal, which does not preserve address dependencies and allows the
> + * following misordering speculations:
> + *
> + * - If @b is a constant, the compiler can issue the loads which depend
> + *   on @a before loading @a.
> + * - If @b is a register populated by a prior load, weakly-ordered
> + *   CPUs can speculate loads which depend on @a before loading @a.
> + *
> + * The same logic applies with @a and @b swapped.
> + *
> + * Return value: true if pointers are equal, false otherwise.
> + *
> + * The compiler barrier() is ineffective at fixing this issue. It does
> + * not prevent the compiler CSE from losing the address dependency:
> + *
> + * int fct_2_volatile_barriers(void)
> + * {
> + *     int *a, *b;
> + *
> + *     do {
> + *         a =3D READ_ONCE(p);
> + *         asm volatile ("" : : : "memory");
> + *         b =3D READ_ONCE(p);
> + *     } while (a !=3D b);
> + *     asm volatile ("" : : : "memory");  <-- barrier()
> + *     return *b;
> + * }
> + *
> + * With gcc 14.2 (arm64):
> + *
> + * fct_2_volatile_barriers:
> + *         adrp    x0, .LANCHOR0
> + *         add     x0, x0, :lo12:.LANCHOR0
> + * .L2:
> + *         ldr     x1, [x0]  <-- x1 populated by first load.
> + *         ldr     x2, [x0]
> + *         cmp     x1, x2
> + *         bne     .L2
> + *         ldr     w0, [x1]  <-- x1 is used for access which should depe=
nd on b.
> + *         ret
> + *
> + * On weakly-ordered architectures, this lets CPU speculation use the
> + * result from the first load to speculate "ldr w0, [x1]" before
> + * "ldr x2, [x0]".
> + * Based on the RCU documentation, the control dependency does not
> + * prevent the CPU from speculating loads.
> + */
> +
> +#include <asm/ptr_eq.h>
> +
> +#endif /* _LINUX_PTR_EQ_H */
> --
> 2.43.0
>

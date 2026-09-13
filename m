Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B1039F168
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294508; cv=pass; b=XeEAgOx5IxpZ2lDux6qU4llnty76atOxje1ZuELUHZMpw7sbBly76sGeNXpPdCwu+WqAOT6wDDML4x+WT1pp5vUVdN+Hh74HCvjEwCkjGcMhuZs4e3exE2peLl6L8UoexHBfI1iJKhVm+NI2z+fIfpUx5FE88oEuKBDb6TVoUoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294508; c=relaxed/simple;
	bh=abKonwDomX5F1pVf5Uo619oaBjWlx7rq+2crALcJE1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/An/zotoEbC9VsB8mcD0if020otmfFRkCpf1gWXQRjO7j/Sd9jJUvVCI7K1qv/KuYQV94++VAqO+s/c4zeItkyeMGsPct8r7j1ELHX63c+4kUg0/uxU9dRh8r4BLVHYn3caJAr+8hVxElZhvU7Vn3nzwbhZVVqAZ5cw2DWv89Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgpm2ad6; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgpm2ad6"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aae3149so776444d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789294506; cv=none;
        d=google.com; s=arc-20260327;
        b=kLOiolr7EKYiQEHuYu9gF1prjCIbMxgDjj3cNlyZ07ltRNzRw7C80AS5g/8udcICGE
         3nJWDGAkc9a4KlIcAT1HjFs+aO/ZVrPhJnIEM+V/2rkKTLdoyEN+o29XPeYfXITsmbdB
         XmUIGaQGVQiwKEGXe5Wxi/O8/mSwTkAJ//AjM1RzAwQbqZ3g2sqT9MfRsY+mQN7kXUdI
         mJWagPXG6aQ2t6umFVDi1jEIxHsqDclf85IT+bHOFrfgQhXECLAG7PpmxDaupfq2mWSb
         gxyo4JjJUtmMTIOgwEqSQOXcn5u4RML97Iz55if/IAOP4APcZGEkEKFTReBBVPD/rLKb
         KA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CMKnin8BZ9Z0ovUiJNtYkpqGxPpTK3MjcPZkSXHrmtI=;
        fh=j4oqLb7YFnDESb8z2C2gjOVaOQLFX59oCm5QR7za5X4=;
        b=LsE/w9KzzxQZSVfPhVqvjr2AJLsC+7bDWpzC2eBUhdD+61X7/LBH0gBdK5potS68yB
         DjYE6eWrbn7VcUEugCjVfs375PoTHIw0coJODMLvjRjLDRv5j7vxnQ8xoCnZC3+bUz51
         NumFZ6xiWiEb0Elz8Wh4/UYoHP1Pdq5sUOk9opc1dGDUZ9oX8/iWhvmiRRGwviZsuWcG
         jh9+V/+MP8uhG/oGgLt9eM0fbjVj02cJx2CVzoJ8P/YORiTcrQPksEMZlpuyD1YjG2cR
         KKycgNwhINiWnOoB5WshnywFlfzHwD5GLJ8Y8iKqZO+C6JIzKUBiXH7v/ECdPKjAjGzP
         UZ4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789294506; x=1789899306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CMKnin8BZ9Z0ovUiJNtYkpqGxPpTK3MjcPZkSXHrmtI=;
        b=fgpm2ad6Kak08W1Sxjtb9ns6TMrNxgULeu/eGoMJBBzY3fF7WNMiSjI7sYBm3rtvPn
         tvaVQbwY74ZAvCYk+Sii8a2zfH4f5q1VJf35lmc636xofIK7TtootYX6IOeKPku88XBt
         eNGzotLJ+7jQIZBKsLQ5AeFvBbGzN4gH9DyQ2cVt6PEy1zCMS7EekxcoXc3qa11RxbnK
         e6/Ep9vNZ55vN+UiUkxI0GUc6hFhXUNv5UGQu59YC5+3xMaGRYtqZmBGf/wCIZ946FmI
         0NmxQg4ajAy3iDXq8UsqZyklKTkxbnSlaQrJbvqG4na/ATQFTJcL97hF9JtiLT86l2Qs
         PAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789294506; x=1789899306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMKnin8BZ9Z0ovUiJNtYkpqGxPpTK3MjcPZkSXHrmtI=;
        b=KCTxt7TuC+8AsOXBQZqx089/K8y8knHg8ziHBI6Sr2OUdaSteblSQu6rVNFeCXFoKi
         ebAkcVWAiTORl258fAMhJGwjohLjeXz9HkB78ynjeXfGwRKyXOpsaZtXqSyaTxed167q
         vtgMNXmpEaGfd+8QOnHjYdr2WwuqcyjCxB1/RnniqeMxlQ+haD4IFqWEm4V70juSfuyT
         eHfF8SvmZpGmQXSaZoUWCO69Rv03eLCPYuKPwOHQyb6zUSeMLu6SP2+NM9gLy5cr1Ldm
         azfSwN1jS3n35pd4QpAxgQIK5vGNL7Qz65vjptvzT+rNOu94BuTgzkyP2zog4UBvPNpd
         RGNg==
X-Forwarded-Encrypted: i=1; AKwUvBzRIR5BBS4k+lKExpL/ApIUTrFVYFGjBN0XXziRT5cfq4pPu6jh5x4IlAqP+kLAk/djPUD6fzMWAllHyQA=@vger.kernel.org
X-Gm-Message-State: AFuF++kIZOaFdAdDvYMW28LynyZAlRvAryUbz1FUSistbAvpCGKjZcw/
	FRJYk0bNQRYBaT8rqzI0+JhsC0ujmYxTQCF/Go4lFZ/l1qNccJ1EbqmpoNCj75yTj46CiAmSWJ+
	J9GtL0v5GN7vUN2BSZd7yif3nAHiT03U=
X-Gm-Gg: AYBFou06yH6RdlmjvU4wpszCsyZb/d1NFMDy78PgtBD+1lunqgMNijknXN4Z9TUMvJV
	ZxIvTx1uRvieafHw7/NPpTDNpdQrc2k+sNCeceEdkqSkGa3b++cchbILO2/a3ythnxT2VAvgrOa
	iFQj431bwK8ZGlEM5ISmgH+9F4jcY82aJnTPQoT7taTytdlQJHNaDQEJUT4nC6z6QUvtkL5upoG
	AnMQh4LkNEM3KGCTe26SJps2ubALKWdEBpqiug3yOijPc5ocK8gquk+tsIHLBi5M+aOFz6Rj4X4
	63OYq17s8mh6eX8UuicJYp1B1IqycrQjx/UWVo98a6IYZG07SuRHhq0=
X-Received: by 2002:a53:cd08:0:b0:66f:cabb:d8ae with SMTP id
 956f58d0204a3-67124706acbmr3896111d50.32.1789294505989; Sun, 13 Sep 2026
 03:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
In-Reply-To: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sun, 13 Sep 2026 12:14:54 +0200
X-Gm-Features: AcwNN1WyLGxtdyeI7mFRimaHIMiAltPrXRIv6rwAqpJ4tpfW4ScfqDuJ5Qm8CPM
Message-ID: <CALsPMBMDek9CssXm+qoFsDHvjaJfyuOUVcx-H83EXeYOVFMF6Q@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

A gentle ping on this patch. v2 incorporates Steven's suggestion to use
trace_call__riscv_tlb_flush_path() after the explicit enabled check.

The patch has passed the RISC-V Patchwork CI, and the local, SBI RFENCE,
and cross-CPU-call paths have been exercised in QEMU.

Any further comments would be appreciated.

Thanks,
Roman

On Sun, Aug 30, 2026 at 4:36=E2=80=AFPM Roman 'Hedin' Storozhenko
<romeusmeister@gmail.com> wrote:
>
> Make RISC-V TLB flush path selection observable. Record whether Linux
> handles an invalidation locally, delegates it to SBI RFENCE, or executes
> it through a cross-CPU call, so MM activity can be correlated with the
> RISC-V, firmware, or Linux cross-CPU path carrying the request.
>
> The generic tlb:tlb_flush event describes TLB flush activity using
> architecture-independent reason and page-count information. The RISC-V
> implementation subsequently selects between local invalidation, SBI
> RFENCE, and Linux cross-CPU coordination, with additional
> architecture-specific request context available at that point.
>
> Making this selection observable is useful when debugging RISC-V TLB
> shootdowns. When a remote invalidation is observed to be slow, the
> selected path determines whether to investigate SBI firmware and
> platform handling or Linux cross-CPU and IPI handling. An unexpectedly
> broad target mask can reveal an unintended address-space CPU footprint,
> while the range and stride distinguish invalidation requests with
> different mapping granularities.
>
> Place the event in the RISC-V implementation because the local, SBI
> RFENCE, or cross-CPU choice is made there, and SBI RFENCE and the
> invalidation stride are RISC-V-specific semantics rather than properties
> of the generic MM flush request.
>
> Add riscv_tlb:riscv_tlb_flush_path in flush_tlb_all() and
> __flush_tlb_range(). Record start, size, stride, the hardware-visible
> ASID, whether a specific mm is associated with the request, the target
> CPU mask and its weight, the requested scope, and the selected path.
>
> Record the complete target mask in addition to its weight because CPU
> identity cannot be reconstructed from a count and is needed to correlate
> the request with per-CPU scheduler, IPI, and firmware activity.
>
> The event records the invalidation request and the path selected by Linux
> before the operation is dispatched. In particular, selecting the SBI
> RFENCE path means that Linux delegated the request to firmware; the event
> does not describe the implementation or outcome of that delegated
> operation.
>
> Tested on QEMU virt with OpenSBI using local and shared-mm
> mprotect()/munmap() workloads. Local requests reported path=3Dlocal,
> while remote requests reported path=3Dsbi-rfence and were followed by the
> existing riscv:sbi_call RFENCE event.
>
> The cross-CPU-call path was tested with QEMU virt using APLIC+IMSIC.
> A MADV_PAGEOUT reclaim workload was used to exercise mm-independent
> global flushes. All reported path values (local, sbi-rfence and
> cross-cpu-call) and scope values (single, range, address-space and all)
> were observed.
>
> Signed-off-by: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
> ---
> Add a RISC-V tracepoint for observing the path selected by Linux for TLB
> invalidation requests: local invalidation, SBI RFENCE, or Linux
> cross-CPU coordination.
>
> The tracepoint is intended to make RISC-V TLB shootdown behavior easier
> to correlate with MM activity, CPU targeting, SBI calls, and IPI
> handling. The patch records the invalidation request context and the
> Linux path-selection decision before the operation is dispatched.
>
> The patch was tested on QEMU virt with both the SBI RFENCE path and an
> APLIC+IMSIC configuration. Local, SBI RFENCE, and cross-CPU-call paths
> were exercised. All reported scope values -- single, range,
> address-space, and all -- were also observed.
> ---
> Changes in v2:
> - Use trace_call__riscv_tlb_flush_path() after the explicit
>   trace_riscv_tlb_flush_path_enabled() check to avoid a second
>   tracepoint static-key test, as suggested by Steven Rostedt.
> - Link to v1: https://lore.kernel.org/r/20260829-tlb_tracepoint-v1-1-dfda=
ede7e741@gmail.com
> ---
>  arch/riscv/mm/tlbflush.c         |  60 +++++++++++++++++++--
>  include/trace/events/riscv_tlb.h | 113 +++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 169 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 962db300a166..cefce9364bd2 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -9,6 +9,9 @@
>  #include <asm/mmu_context.h>
>  #include <asm/cpufeature.h>
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/riscv_tlb.h>
> +
>  #define has_svinval()  riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVA=
L)
>
>  /*
> @@ -63,6 +66,33 @@ void local_flush_tlb_kernel_range(unsigned long start,=
 unsigned long end)
>         local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_T=
LB_NO_ASID);
>  }
>
> +static enum riscv_tlb_flush_scope
> +riscv_tlb_get_flush_scope(unsigned long size, unsigned long stride, bool=
 has_mm)
> +{
> +       if (size =3D=3D FLUSH_TLB_MAX_SIZE)
> +               return has_mm ? RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE :
> +                       RISCV_TLB_FLUSH_SCOPE_ALL;
> +
> +       return size <=3D stride ? RISCV_TLB_FLUSH_SCOPE_SINGLE :
> +               RISCV_TLB_FLUSH_SCOPE_RANGE;
> +}
> +
> +static __always_inline void
> +riscv_tlb_trace_flush_path(const struct cpumask *cmask, unsigned long st=
art,
> +                          unsigned long size, unsigned long stride,
> +                          unsigned long asid, bool has_mm,
> +                          enum riscv_tlb_flush_path path)
> +{
> +       enum riscv_tlb_flush_scope scope;
> +
> +       if (!trace_riscv_tlb_flush_path_enabled())
> +               return;
> +
> +       scope =3D riscv_tlb_get_flush_scope(size, stride, has_mm);
> +       trace_call__riscv_tlb_flush_path(start, size, stride, asid, has_m=
m,
> +                        cmask, scope, path);
> +}
> +
>  static void __ipi_flush_tlb_all(void *info)
>  {
>         local_flush_tlb_all();
> @@ -70,12 +100,26 @@ static void __ipi_flush_tlb_all(void *info)
>
>  void flush_tlb_all(void)
>  {
> -       if (num_online_cpus() < 2)
> +       if (num_online_cpus() < 2) {
> +               riscv_tlb_trace_flush_path(cpu_online_mask, 0,
> +                                          FLUSH_TLB_MAX_SIZE, 0,
> +                                          FLUSH_TLB_NO_ASID, false,
> +                                          RISCV_TLB_FLUSH_PATH_LOCAL);
>                 local_flush_tlb_all();
> -       else if (riscv_use_sbi_for_rfence())
> -               sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, F=
LUSH_TLB_NO_ASID);
> -       else
> +       } else if (riscv_use_sbi_for_rfence()) {
> +               riscv_tlb_trace_flush_path(cpu_online_mask, 0,
> +                                          FLUSH_TLB_MAX_SIZE, 0,
> +                                          FLUSH_TLB_NO_ASID, false,
> +                                          RISCV_TLB_FLUSH_PATH_SBI_RFENC=
E);
> +               sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE,
> +                                          FLUSH_TLB_NO_ASID);
> +       } else {
> +               riscv_tlb_trace_flush_path(cpu_online_mask, 0,
> +                                          FLUSH_TLB_MAX_SIZE, 0,
> +                                          FLUSH_TLB_NO_ASID, false,
> +                                          RISCV_TLB_FLUSH_PATH_CROSS_CPU=
_CALL);
>                 on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
> +       }
>  }
>
>  struct flush_tlb_range_data {
> @@ -107,12 +151,20 @@ static void __flush_tlb_range(struct mm_struct *mm,
>
>         /* Check if the TLB flush needs to be sent to other CPUs. */
>         if (cpumask_any_but(cmask, cpu) >=3D nr_cpu_ids) {
> +               riscv_tlb_trace_flush_path(cmask, start, size, stride, as=
id,
> +                                          !!mm, RISCV_TLB_FLUSH_PATH_LOC=
AL);
>                 local_flush_tlb_range_asid(start, size, stride, asid);
>         } else if (riscv_use_sbi_for_rfence()) {
> +               riscv_tlb_trace_flush_path(cmask, start, size, stride, as=
id,
> +                                          !!mm, RISCV_TLB_FLUSH_PATH_SBI=
_RFENCE);
>                 sbi_remote_sfence_vma_asid(cmask, start, size, asid);
>         } else {
>                 struct flush_tlb_range_data ftd;
>
> +               riscv_tlb_trace_flush_path(cmask, start, size, stride, as=
id,
> +                                          !!mm,
> +                                          RISCV_TLB_FLUSH_PATH_CROSS_CPU=
_CALL);
> +
>                 ftd.asid =3D asid;
>                 ftd.start =3D start;
>                 ftd.size =3D size;
> diff --git a/include/trace/events/riscv_tlb.h b/include/trace/events/risc=
v_tlb.h
> new file mode 100644
> index 000000000000..3eff171ec54f
> --- /dev/null
> +++ b/include/trace/events/riscv_tlb.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM riscv_tlb
> +
> +#if !defined(_TRACE_RISCV_TLB_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_RISCV_TLB_H
> +
> +#include <linux/cpumask.h>
> +#include <linux/tracepoint.h>
> +
> +#ifndef _TRACE_RISCV_TLB_ENUMS
> +#define _TRACE_RISCV_TLB_ENUMS
> +
> +enum riscv_tlb_flush_scope {
> +       RISCV_TLB_FLUSH_SCOPE_SINGLE,
> +       RISCV_TLB_FLUSH_SCOPE_RANGE,
> +       RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE,
> +       RISCV_TLB_FLUSH_SCOPE_ALL,
> +};
> +
> +enum riscv_tlb_flush_path {
> +       RISCV_TLB_FLUSH_PATH_LOCAL,
> +       RISCV_TLB_FLUSH_PATH_SBI_RFENCE,
> +       RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL,
> +};
> +
> +#endif /* _TRACE_RISCV_TLB_ENUMS */
> +
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_SINGLE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_RANGE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ALL);
> +
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_LOCAL);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_SBI_RFENCE);
> +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL);
> +
> +#define show_riscv_tlb_flush_scope(scope) \
> +       __print_symbolic(scope, \
> +               { RISCV_TLB_FLUSH_SCOPE_SINGLE,        "single" }, \
> +               { RISCV_TLB_FLUSH_SCOPE_RANGE,         "range" }, \
> +               { RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE, "address-space" },=
 \
> +               { RISCV_TLB_FLUSH_SCOPE_ALL,           "all" })
> +
> +#define show_riscv_tlb_flush_path(path) \
> +       __print_symbolic(path, \
> +               { RISCV_TLB_FLUSH_PATH_LOCAL,          "local" }, \
> +               { RISCV_TLB_FLUSH_PATH_SBI_RFENCE,     "sbi-rfence" }, \
> +               { RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL, "cross-cpu-call" }=
)
> +
> +/*
> + * Record the invalidation request received by the RISC-V architecture c=
ode
> + * and the path selected by Linux.
> + *
> + * The target CPU mask represents the CPUs Linux intends to cover for th=
e
> + * request. It can be correlated with per-CPU activity, but does not des=
cribe
> + * which harts ultimately performed an invalidation.
> + *
> + * The ASID is hardware-visible and may be reused. It must not be treate=
d as a
> + * persistent identifier for an mm.
> + *
> + * The stride describes the invalidation granularity supplied to the RIS=
C-V
> + * implementation. SBI RFENCE receives start, size and ASID, but not str=
ide.
> + *
> + * The event is emitted at path selection time. For SBI RFENCE, it recor=
ds
> + * delegation of the request to firmware; firmware processing after that
> + * point is outside the event's scope.
> + */
> +TRACE_EVENT(riscv_tlb_flush_path,
> +       TP_PROTO(unsigned long start, unsigned long size,
> +                unsigned long stride, unsigned long asid, bool has_mm,
> +                const struct cpumask *cmask,
> +                enum riscv_tlb_flush_scope scope,
> +                enum riscv_tlb_flush_path path),
> +
> +       TP_ARGS(start, size, stride, asid, has_mm, cmask, scope, path),
> +
> +       TP_STRUCT__entry(
> +               __field(unsigned long, start)
> +               __field(unsigned long, size)
> +               __field(unsigned long, stride)
> +               __field(unsigned long, asid)
> +               __field(bool, has_mm)
> +               __field(unsigned int, target_mask_weight)
> +               __cpumask(target_cpus)
> +               __field(u8, scope)
> +               __field(u8, path)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->start =3D start;
> +               __entry->size =3D size;
> +               __entry->stride =3D stride;
> +               __entry->asid =3D asid;
> +               __entry->has_mm =3D has_mm;
> +               __entry->target_mask_weight =3D cpumask_weight(cmask);
> +               __assign_cpumask(target_cpus, cpumask_bits(cmask));
> +               __entry->scope =3D scope;
> +               __entry->path =3D path;
> +       ),
> +
> +       TP_printk("start=3D%#lx size=3D%#lx stride=3D%#lx asid=3D%#lx has=
_mm=3D%d target_mask_weight=3D%u target_cpus=3D%s scope=3D%s path=3D%s",
> +                 __entry->start, __entry->size, __entry->stride,
> +                 __entry->asid, __entry->has_mm,
> +                 __entry->target_mask_weight, __get_cpumask(target_cpus)=
,
> +                 show_riscv_tlb_flush_scope(__entry->scope),
> +                 show_riscv_tlb_flush_path(__entry->path))
> +);
> +
> +#endif /* _TRACE_RISCV_TLB_H */
> +
> +/* This part must be outside protection. */
> +#include <trace/define_trace.h>
>
> ---
> base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
> change-id: 20260829-tlb_tracepoint-844105ab5092
>
> Best regards,
> --
> Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
>


--=20
Kind regards,
Roman 'Hedin' Storozhenko

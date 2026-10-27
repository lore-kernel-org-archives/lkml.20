Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793129548;
	b=M8VskLLqdK1AD2Q7kE4Bgv58f48BrSUNzKTAA+GMLm+f6pas/T9zQghlpjfiYls0hSAh
	 XETYN45MYvNi35atDQPVhImTYEL94yCHetEcEKg4KYyVYX3ROOfSLQBJWR5v2vAU74DCB
	 SjxVm81VvqND/OgvGX2Fm+7zmQMAVcjeRrCluf7w/CNWa7QhkljLqqapVjaH71RIg0tlV
	 vuv/2q7NviolRqP3gA56zpZl6tCUeFoNMzkY9i0aYA6dJdfYTURi3+kx7YbI+BmK1DMP/
	 LUeM0oAkKj9l8q5RFePEDkMoz+wcezxSxuDwE05eUX6+CIGwzmNKYTRow5FHNsJRlZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129548;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=MvE/Uou57iqLkXne4j6ASPHj1sjslqtqu+Hpd5pjln0=;
	b=z2qwmtlj3K2FTJF4iHxnIJbqwezTWznwt0z/qbe2UkpbbmdOrtI9er6124GDLTdcAJ2B
	 0gwjUe4JZzAtnjlH/Er0D/sw3nBCtOsUsi37BE3juo3TA2eTtVRbcNDcgzwBtVq7KeaqZ
	 m4IDCttjIysHxSw9ioQ3WF5Bwi6zqWS1MpJD6Lti/Hb5RuIDJspDnIVZ6tUGHbCcnt0WN
	 B4Ylb2xTeG4UF5v4g31n5d5WflDi/vb/i6THv1jvL2SDqZA8pcXvFZ2yNAZcfWZxpcsbJ
	 zUmPNEg06OSHl6iK1qyME5xA/PckYr/m3kiQfx/53U3Pgo6MGD4dnzRtJFYAllPnTMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QL7QRdof;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LknjMRQj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39978606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39978606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QL7QRdof;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LknjMRQj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793129545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MvE/Uou57iqLkXne4j6ASPHj1sjslqtqu+Hpd5pjln0=;
	b=QL7QRdof46lZUqzTldWb6XdF5HtBB0CH6JlM7gNLB30jhBGGnb/dB1EGvH9PiuPv3TpBj4
	eHddsCMy9N8fBmU8w75fykmUedvdeDrZlY27sedZ0gt8HxFU90XRjbzs0S29p03j9JcmY/
	xhuB61aFIp6CqFpG+zv30AYyvIEWg9o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-_UIIMrc-ONKVfSXz5JvnCg-1; Tue, 27 Oct 2026 15:32:10 -0400
X-MC-Unique: _UIIMrc-ONKVfSXz5JvnCg-1
X-Mimecast-MFC-AGG-ID: _UIIMrc-ONKVfSXz5JvnCg_1793129529
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4870142f030so96457f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:32:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793129529; cv=none;
        d=google.com; s=arc-20260327;
        b=llm3UM9XZd+0071ZELxYvETcqwYzKAMEumbe59Km/l/E/JL5DnmhmCKM5WJnx7cD/j
         K5VvjIYg9cPh9rVV8pi6+zEJf9rw7RJxCdNsKQnPbqGrSAkrk+iEBVLTxP/K6ritjYBj
         erhfaZO6UhOfqJuIEsZswOSbja7e5nSIPrLzraY1SMSJeU0h2QtfeEgofpNVPOM/fLQ8
         NGyA0E6R9GI4jR+Ev7mxEoy89Etlp6YGTAjNTWIKonVq5fupH+WhaEgCptjhqupy5LoX
         s+u/MkOQblcgEkCo9BNvfXehvI+hSHkT0kfGsw29MIKTq+oagDT7+dvT0R09HwX0fYRl
         t4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MvE/Uou57iqLkXne4j6ASPHj1sjslqtqu+Hpd5pjln0=;
        fh=SHgn8Tmzfkw3NcSpFx2BmurDq/1pqRYcCyFXhVQaQJk=;
        b=g40LrM6H+NtfM1idnf5cMgx2T7tfZPF15njvD/OKtyJLtQwA+Zw2A+Oz70MCuHIKt3
         NVyvKtB1o3W/ii+7nvedif573MDjW2Tq5t40lV0pbBG7OuCtK4koxaeM1Me/DbIxxu3p
         Md643hwghn2JUjucHEcEKkCnchoRYtCCGtmd4BQUASz6nMCnUc6W31yjxIGDrkFz+gGa
         kmIbvasgwlFJzTqff3X79JL4GJ92yosyEZ4hpD5yy0S77gJ1E+jP2GfHDxHuoniiCOSx
         30akJukE0z0sbda8mC8jXEAXtPsr5iywAFlmqNVab+sf8HdBE1x40PtBVjxK0aMNaq+J
         MG+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793129529; x=1793734329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MvE/Uou57iqLkXne4j6ASPHj1sjslqtqu+Hpd5pjln0=;
        b=LknjMRQjY1zYTOidm8/6Mfek5F+JLTn7Ro2k1JSQkTHPaP46qjGqWNnTHpzN9NwkfX
         6SlVOwsLeLH7Q6RpYgIEfH51uH6hg1zotauriZ9oxPEzn52GSAgAWWJvBBR4B6rfrzGi
         yz9h/80mZTqiszJMWKxmpCXO5/ad1/giJZIzpnICpiNuQTq6ih0qv8AL7ApCb6ks53a4
         ynVhDEDsEM0FL4YozOwbfsaIzZgabnwKunbf4pvzt1P2d/z1QX6GFzx/L2XMKmR3dIgF
         542iGZVrQ54cdAUHqKnFV+CxXBdvp73G9CD+B9cED6JvhfxGdokdbu0jMrXUnoOEOPVc
         H9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793129529; x=1793734329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MvE/Uou57iqLkXne4j6ASPHj1sjslqtqu+Hpd5pjln0=;
        b=KRcvvtiF2YTtvK2hC6KejkamQmAywoeSuNjb1nBj5uy62O2kR8Ka+hOJRZxXHmVWgl
         ZPA934cLJbzEeIlpeqhW/LYYpAcmeiFdS8UH0O8Z5NNWTxqgrrC4yzrKZJCbC/Vn+gFh
         +KFMN344Np5E2f5lwgo1VIJhtkoAu6CqvgJKVPR8TNH4muds2N82P/WMhyzcBaIWTYSo
         hb+DfqCM6nzJabK0WEU/AOKuEvTTAPK4KMol67wgy93aCGf3JcdExI4NK0MwzXsYR6Ya
         it+Oy4yT/xg3qpinPbCKLcB5Y1ykdD2czpj0Ffl17EGop1bkDLuRcuoNEd5ON1Gy0iT7
         owOw==
X-Gm-Message-State: AFq9FYJ2s7CbcMTFG45jYBZgIEc5FLjyPMgZhRtx2QmbrYeX3CHYBcm5
	IB4ILFgXL+g0tfDm9mqzGTaE9rgplWi9PLm0OaWgbWM1WXLbqJbCPKeIZgnI4OFhpzFTgxdKzz7
	OVhC+hcjJqCWTM81ENhKxWMl8nkf+1xsAr1pOapO6EI26BCg9rFZSzbdntqAQzl47F7ulsWGRGz
	kJ29mZARdI55z19teLsY3aDzmf0etrUIE+0EwH0T6O
X-Gm-Gg: AYBFou0ZFTFe1pCMZ8jtbpTlfCXsnMXbcjLJSFGfw4HMrqiaPNCDt3GgHMDdgBclYky
	ejXzLAaq81q+z3pVDNUfoIb7dTk90ML/0O4dtmnr2DHRI/mxnyL+JKdvENSvLu8B4VsQ7Q02UWL
	zGGcVq/Uc+o9wF3LoWf9cf5tjAd/M1nRkroWOYX8BrVGZKWNQJemf0Tb/3+xBmbwgm5MI1/D/ur
	sUF1rfI4inOd8H1Xg==
X-Received: by 2002:a05:6000:250b:b0:48d:bfd5:79c with SMTP id ffacd0b85a97d-48e5d3047eemr1043559f8f.42.1793129528549;
        Tue, 27 Oct 2026 12:32:08 -0700 (PDT)
X-Received: by 2002:a05:6000:250b:b0:48d:bfd5:79c with SMTP id
 ffacd0b85a97d-48e5d3047eemr1043515f8f.42.1793129527941; Tue, 27 Oct 2026
 12:32:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com> <20260930063919.608911-4-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260930063919.608911-4-himanshu.chauhan@oss.qualcomm.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Tue, 27 Oct 2026 15:31:56 -0400
X-Gm-Features: AclHuK-UbrSBtB3Fl9Kc4WQt34Hyp5d7apuD9u6LYfDYWVM-pHDUAy6CVDVsIRo
Message-ID: <CADRr4besNqOW=tamM8HC1Z1+Tt41rQvdQL-FQHGzRbxmdvhqWA@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] riscv: ptrace support for hardware break/watchpoints
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	alex@ghiti.fr, aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org, 
	qingfang.deng@linux.dev, shuah@kernel.org, thecharlesjenkins@gmail.com, 
	cp0613@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:39=E2=80=AFAM Himanshu Chauhan
<himanshu.chauhan@oss.qualcomm.com> wrote:
>
> Add ptrace support for hardware breakpoints and watchpoints on
> RISC-V. Debuggers can now set and query hardware debug triggers
> through the standard PTRACE_GETREGSET/SETREGSET interface using new
> NT_RISCV_HW_BREAK/WATCH note types, backed by
> register_user_hw_breakpoint()/modify_user_hw_breakpoint() and
> delivering SIGTRAP/TRAP_HWBKPT to the tracee when a trigger fires.
>
> For convenience, also add a simpler PTRACE_GETHBPREGS/SETHBPREGS

Can you split PTRACE_GETHBPREGS/SETHBPREGS into one patch and
PTRACE_GETREGSET/SETREGSET into another.
This patch is getting quite large and hard to review.

Thanks,
Jesse Taube

> request pair that lets a tracer read or write a single breakpoint or
> watchpoint directly, without going through the regset machinery.
> These request numbers live in the arch-specific ptrace range
> (0x4210/0x4211) so they don't collide with the generic
> PTRACE_PEEKDATA/PTRACE_PEEKUSR codes.
>
> Breakpoints and watchpoints share the same trigger pool on this
> architecture, so select HAVE_MIXED_BREAKPOINTS_REGS. Hook up
> thread flush/copy so per-task breakpoints are cleaned up and cleared
> across fork/exec.
>
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> ---
>  arch/riscv/Kconfig                     |   1 +
>  arch/riscv/include/asm/hw_breakpoint.h |  10 +
>  arch/riscv/include/asm/processor.h     |  18 +
>  arch/riscv/include/uapi/asm/ptrace.h   |  50 +++
>  arch/riscv/kernel/hw_breakpoint.c      |   1 -
>  arch/riscv/kernel/process.c            |   5 +
>  arch/riscv/kernel/ptrace.c             | 507 +++++++++++++++++++++++++
>  include/uapi/linux/elf.h               |   4 +
>  tools/include/uapi/linux/elf.h         |   2 +
>  9 files changed, 597 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 17fa7d4f9729..d382f5d7b6a7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -176,6 +176,7 @@ config RISCV
>         select HAVE_GCC_PLUGINS
>         select HAVE_GENERIC_VDSO if MMU
>         select HAVE_HW_BREAKPOINT if PERF_EVENTS
> +       select HAVE_MIXED_BREAKPOINTS_REGS if PERF_EVENTS
>         select HAVE_IRQ_TIME_ACCOUNTING
>         select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
>         select HAVE_KERNEL_GZIP if !EFI_ZBOOT
> diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/=
asm/hw_breakpoint.h
> index a165bb9636de..ca2ef93c020c 100644
> --- a/arch/riscv/include/asm/hw_breakpoint.h
> +++ b/arch/riscv/include/asm/hw_breakpoint.h
> @@ -14,6 +14,7 @@ struct task_struct;
>
>  /* Maximum number of hardware breakpoints supported */
>  #define RISCV_HW_BP_NUM_MAX 32
> +#define RISCV_MAX_BP           16
>
>  #if __riscv_xlen =3D=3D 64
>  #define cpu_to_le cpu_to_le64
> @@ -279,6 +280,10 @@ struct arch_hw_breakpoint {
>         unsigned long address;
>         unsigned long len;
>         unsigned int type;
> +       unsigned int match;
> +       unsigned int chain;
> +       unsigned int select;
> +       unsigned int time;
>
>         /* Trigger configuration data */
>         unsigned long tdata1;
> @@ -305,8 +310,13 @@ void arch_disable_hw_breakpoint(struct perf_event *b=
p);
>  int arch_install_hw_breakpoint(struct perf_event *bp);
>  void arch_uninstall_hw_breakpoint(struct perf_event *bp);
>  void hw_breakpoint_pmu_read(struct perf_event *bp);
> +void clear_ptrace_hw_breakpoint(struct task_struct *tsk);
> +void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
> +void ptrace_hw_copy_thread(struct task_struct *task);
>
>  #else
>
> +static inline void ptrace_hw_copy_thread(struct task_struct *task) { }
> +
>  #endif /* CONFIG_HAVE_HW_BREAKPOINT */
>  #endif /* __RISCV_HW_BREAKPOINT_H */
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index 815715c67f94..6f6186b9663e 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -15,6 +15,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/insn-def.h>
>  #include <asm/alternative-macros.h>
> +#include <asm/hw_breakpoint.h>
>  #include <asm/hwcap.h>
>  #include <asm/usercfi.h>
>
> @@ -110,6 +111,19 @@ struct pt_regs;
>  #define RISCV_PREEMPT_V_NEED_RESTORE   0x40000000
>  #define RISCV_PREEMPT_V_IN_SCHEDULE    0x20000000
>
> +struct debug_info {
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +       /* Have we suspended stepping by a debugger? */
> +       int                     suspended_step;
> +       /* Allow breakpoints and watchpoints to be disabled for this thre=
ad. */
> +       int                     bp_disabled;
> +       int                     wp_disabled;
> +       /* Hardware breakpoints pinned to this task. */
> +       struct perf_event       *hbp_break[RISCV_MAX_BP];
> +       struct perf_event       *hbp_watch[RISCV_MAX_BP];
> +#endif
> +};
> +
>  /* CPU-specific state of a task */
>  struct thread_struct {
>         /* Callee-saved registers */
> @@ -133,6 +147,10 @@ struct thread_struct {
>  #endif
>  #ifdef CONFIG_RISCV_ISA_SSQOSID
>         u32 srmcfg;
> +#endif
> +       struct debug_info debug;
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +       struct perf_event       *ptrace_bps[RISCV_HW_BP_NUM_MAX];
>  #endif
>  };
>
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/ua=
pi/asm/ptrace.h
> index 3de2b7124aff..83e073dbbf6d 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -10,11 +10,14 @@
>
>  #include <linux/types.h>
>  #include <linux/const.h>
> +#include <linux/bits.h>
>
>  #define PTRACE_GETFDPIC                33
>
>  #define PTRACE_GETFDPIC_EXEC   0
>  #define PTRACE_GETFDPIC_INTERP 1
> +#define PTRACE_GETHBPREGS      0x4210
> +#define PTRACE_SETHBPREGS      0x4211
>
>  /*
>   * User-mode register state for core dumps, ptrace, sigcontext
> @@ -164,6 +167,53 @@ struct user_cfi_state {
>         __u64 shstk_ptr;
>  };
>
> +/*
> + * bit[3:0]        Match
> + * bit[8:4]        Size
> + * bit[11:9]       When
> + * bit[12]         Select
> + * bit[13]         Chain
> + * bit[16:14]      Type
> + * bit[XLEN-1:17]  Reserved
> + */
> +#define HWDEBUG_MATCH_MASK     __GENMASK(3, 0)
> +#define HWDEBUG_SIZE_MASK      __GENMASK(8, 4)
> +#define HWDEBUG_WHEN_MASK      __GENMASK(11, 9)
> +#define HWDEBUG_SELECT_MASK    _BITUL(12)
> +#define HWDEBUG_CHAIN_MASK     _BITUL(13)
> +#define HWDEBUG_TYPE_MASK      __GENMASK(16, 14)
> +
> +#define HWDEBUG_MATCH(_ctrl)   (((_ctrl) & HWDEBUG_MATCH_MASK) >> 0)
> +#define HWDEBUG_SIZE(_ctrl)    (((_ctrl) & HWDEBUG_SIZE_MASK) >> 4)
> +#define HWDEBUG_WHEN(_ctrl)    (((_ctrl) & HWDEBUG_WHEN_MASK) >> 9)
> +#define HWDEBUG_SELECT(_ctrl)  (((_ctrl) & HWDEBUG_SELECT_MASK) >> 12)
> +#define HWDEBUG_CHAIN(_ctrl)   (((_ctrl) & HWDEBUG_CHAIN_MASK) >> 13)
> +#define HWDEBUG_TYPE(_ctrl)    (((_ctrl) & HWDEBUG_TYPE_MASK) >> 14)
> +
> +#define HWDEBUG_MK_MATCH(_match)       ((_match << 0) & HWDEBUG_MATCH_MA=
SK)
> +#define HWDEBUG_MK_SIZE(_sz)           ((_sz << 4) & HWDEBUG_SIZE_MASK)
> +#define HWDEBUG_MK_WHEN(_when)         ((_when << 9) & HWDEBUG_WHEN_MASK=
)
> +#define HWDEBUG_MK_SELECT(_sel)                ((_sel << 12) & HWDEBUG_S=
ELECT_MASK)
> +#define HWDEBUG_MK_CHAIN(_chain)       ((_chain << 13) & HWDEBUG_CHAIN_M=
ASK)
> +#define HWDEBUG_MK_TYPE(_type)         ((_type << 14) & HWDEBUG_TYPE_MAS=
K)
> +
> +struct user_hwdebug_state {
> +       __u32 info;
> +       __u32 pad;
> +       struct {
> +               __u64 addr;
> +               __u32 control;
> +               __u32 pad;
> +       } dbg_regs[16];
> +};
> +
> +struct __riscv_hwdebug_state {
> +       __u64 addr;
> +       __u64 type;
> +       __u64 len;
> +       __u64 ctrl;
> +};
> +
>  #endif /* __ASSEMBLER__ */
>
>  #endif /* _UAPI_ASM_RISCV_PTRACE_H */
> diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_bre=
akpoint.c
> index c2ab5e6008e7..dd6f63953969 100644
> --- a/arch/riscv/kernel/hw_breakpoint.c
> +++ b/arch/riscv/kernel/hw_breakpoint.c
> @@ -698,7 +698,6 @@ EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
>
>  void hw_breakpoint_pmu_read(struct perf_event *bp) { }
>
> -void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
>
>  static int __init arch_hw_breakpoint_init(void)
>  {
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 7cc5a6a5c020..bdcb0386cd0d 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -204,6 +204,7 @@ void flush_thread(void)
>         if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
>                 envcfg_update_bits(current, ENVCFG_PMM, ENVCFG_PMM_PMLEN_=
0);
>  #endif
> +       flush_ptrace_hw_breakpoint(current);
>  }
>
>  void arch_release_task_struct(struct task_struct *tsk)
> @@ -283,6 +284,10 @@ int copy_thread(struct task_struct *p, const struct =
kernel_clone_args *args)
>         p->thread.riscv_v_flags =3D 0;
>         if (has_vector() || has_xtheadvector())
>                 riscv_v_thread_alloc(p);
> +       ptrace_hw_copy_thread(p);
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +       memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
> +#endif

>         p->thread.sp =3D (unsigned long)childregs; /* kernel sp */
>         return 0;
>  }
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index f336a183667e..2d4ee51e6859 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -18,8 +18,10 @@
>  #include <linux/elf.h>
>  #include <linux/regset.h>
>  #include <linux/sched.h>
> +#include <linux/sched/signal.h>
>  #include <linux/sched/task_stack.h>
>  #include <asm/usercfi.h>
> +#include <linux/hw_breakpoint.h>
>
>  enum riscv_regset {
>         REGSET_X,
> @@ -35,6 +37,10 @@ enum riscv_regset {
>  #ifdef CONFIG_RISCV_USER_CFI
>         REGSET_CFI,
>  #endif
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +       REGSET_RISCV_HW_BREAK,
> +       REGSET_RISCV_HW_WATCH,
> +#endif
>  };
>
>  static int riscv_gpr_get(struct task_struct *target,
> @@ -372,6 +378,397 @@ static int riscv_cfi_set(struct task_struct *target=
,
>  }
>  #endif
>
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +/*
> + * Handle hitting a HW-breakpoint.
> + */
> +static void riscv_ptrace_hbptriggered(struct perf_event *bp,
> +                               struct perf_sample_data *data,
> +                               struct pt_regs *regs)
> +{
> +       struct arch_hw_breakpoint *bkpt =3D counter_arch_bp(bp);
> +
> +       force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)bkpt->addres=
s);
> +}
> +
> +/*
> + * Unregister breakpoints from this task and reset the pointers in
> + * the thread_struct.
> + */
> +void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
> +{
> +       int i;
> +       struct thread_struct *t =3D &tsk->thread;
> +
> +       for (i =3D 0; i < RISCV_MAX_BP; i++) {
> +               if (t->debug.hbp_break[i]) {
> +                       unregister_hw_breakpoint(t->debug.hbp_break[i]);
> +                       t->debug.hbp_break[i] =3D NULL;
> +               }
> +       }
> +
> +       for (i =3D 0; i < RISCV_MAX_BP; i++) {
> +               if (t->debug.hbp_watch[i]) {
> +                       unregister_hw_breakpoint(t->debug.hbp_watch[i]);
> +                       t->debug.hbp_watch[i] =3D NULL;
> +               }
> +       }
> +}
> +
> +void ptrace_hw_copy_thread(struct task_struct *tsk)
> +{
> +       memset(&tsk->thread.debug, 0, sizeof(struct debug_info));
> +}
> +
> +static struct perf_event *ptrace_hbp_get_event(unsigned int note_type,
> +                                              struct task_struct *tsk,
> +                                              unsigned long idx)
> +{
> +       struct perf_event *bp =3D ERR_PTR(-EINVAL);
> +
> +       switch (note_type) {
> +       case NT_RISCV_HW_BREAK:
> +               if (idx >=3D RISCV_MAX_BP)
> +                       goto out;
> +               idx =3D array_index_nospec(idx, RISCV_MAX_BP);
> +               bp =3D tsk->thread.debug.hbp_break[idx];
> +               break;
> +       case NT_RISCV_HW_WATCH:
> +               if (idx >=3D RISCV_MAX_BP)
> +                       goto out;
> +               idx =3D array_index_nospec(idx, RISCV_MAX_BP);
> +               bp =3D tsk->thread.debug.hbp_watch[idx];
> +               break;
> +       }
> +
> +out:
> +       return bp;
> +}
> +
> +static int ptrace_hbp_set_event(unsigned int note_type,
> +                               struct task_struct *tsk,
> +                               unsigned long idx,
> +                               struct perf_event *bp)
> +{
> +       int err =3D -EINVAL;
> +
> +       switch (note_type) {
> +       case NT_RISCV_HW_BREAK:
> +               if (idx >=3D RISCV_MAX_BP)
> +                       goto out;
> +               idx =3D array_index_nospec(idx, RISCV_MAX_BP);
> +               tsk->thread.debug.hbp_break[idx] =3D bp;
> +               err =3D 0;
> +               break;
> +       case NT_RISCV_HW_WATCH:
> +               if (idx >=3D RISCV_MAX_BP)
> +                       goto out;
> +               idx =3D array_index_nospec(idx, RISCV_MAX_BP);
> +               tsk->thread.debug.hbp_watch[idx] =3D bp;
> +               err =3D 0;
> +               break;
> +       }
> +
> +out:
> +       return err;
> +}
> +
> +static struct perf_event *ptrace_hbp_create(unsigned int note_type,
> +                                           struct task_struct *tsk,
> +                                           unsigned long idx)
> +{
> +       struct perf_event *bp;
> +       struct perf_event_attr attr;
> +       int err, type;
> +
> +       switch (note_type) {
> +       case NT_RISCV_HW_BREAK:
> +               type =3D HW_BREAKPOINT_X;
> +               break;
> +       case NT_RISCV_HW_WATCH:
> +               type =3D HW_BREAKPOINT_RW;
> +               break;
> +       default:
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       ptrace_breakpoint_init(&attr);
> +
> +       /*
> +        * Initialise fields to sane defaults
> +        * (i.e. values that will pass validation).
> +        */
> +       attr.bp_addr    =3D 0;
> +       attr.bp_len     =3D HW_BREAKPOINT_LEN_4;
> +       attr.bp_type    =3D type;
> +       attr.disabled   =3D 1;
> +
> +       bp =3D register_user_hw_breakpoint(&attr, riscv_ptrace_hbptrigger=
ed, NULL, tsk);
> +       if (IS_ERR(bp))
> +               return bp;
> +
> +       err =3D ptrace_hbp_set_event(note_type, tsk, idx, bp);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return bp;
> +}
> +
> +static int ptrace_hbp_fill_attr_ctrl(unsigned int note_type,
> +                                    struct arch_hw_breakpoint *bpctrl,
> +                                    struct perf_event_attr *attr)
> +{
> +       int len, type;
> +
> +       attr->disabled =3D 0;
> +       type =3D bpctrl->type;
> +       len =3D bpctrl->len;
> +
> +       switch (note_type) {
> +       case NT_RISCV_HW_BREAK:
> +               if ((type & HW_BREAKPOINT_X) !=3D type)
> +                       return -EINVAL;
> +               break;
> +       case NT_RISCV_HW_WATCH:
> +               if ((type & HW_BREAKPOINT_RW) !=3D type)
> +                       return -EINVAL;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       attr->bp_len    =3D len;
> +       attr->bp_type   =3D type;
> +       attr->bp_addr   =3D bpctrl->address;
> +
> +       return 0;
> +}
> +
> +static int ptrace_hbp_get_resource_info(unsigned int note_type, u32 *inf=
o)
> +{
> +       u8 num;
> +
> +       switch (note_type) {
> +       case NT_RISCV_HW_BREAK:
> +               num =3D hw_breakpoint_slots(TYPE_INST);
> +               break;
> +       case NT_RISCV_HW_WATCH:
> +               num =3D hw_breakpoint_slots(TYPE_DATA);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       *info =3D num;
> +
> +       return 0;
> +}
> +
> +static u32 encode_ctrl_reg(struct perf_event *bp)
> +{
> +       struct arch_hw_breakpoint *bpctrl =3D counter_arch_bp(bp);
> +       u32 ctrl =3D 0;
> +
> +       /* Expose the generic UAPI bp_type values in ptrace control bits.=
 */
> +       ctrl |=3D HWDEBUG_MK_TYPE(bp->attr.bp_type);
> +       ctrl |=3D HWDEBUG_MK_MATCH(bpctrl->match);
> +       ctrl |=3D HWDEBUG_MK_SELECT(bpctrl->select);
> +       ctrl |=3D HWDEBUG_MK_WHEN(bpctrl->time);
> +       ctrl |=3D HWDEBUG_MK_SIZE(bp->attr.bp_len);
> +       ctrl |=3D HWDEBUG_MK_CHAIN(bpctrl->chain);
> +
> +       return ctrl;
> +}
> +
> +static int ptrace_hbp_get_ctrl(unsigned int note_type,
> +                              struct task_struct *tsk,
> +                              unsigned long idx,
> +                              u32 *ctrl)
> +{
> +       struct perf_event *bp =3D ptrace_hbp_get_event(note_type, tsk, id=
x);
> +
> +       if (IS_ERR(bp))
> +               return PTR_ERR(bp);
> +
> +       *ctrl =3D bp ? encode_ctrl_reg(bp) : 0;
> +       return 0;
> +}
> +
> +static int ptrace_hbp_get_addr(unsigned int note_type,
> +                              struct task_struct *tsk,
> +                              unsigned long idx,
> +                              u64 *addr)
> +{
> +       struct perf_event *bp =3D ptrace_hbp_get_event(note_type, tsk, id=
x);
> +
> +       if (IS_ERR(bp))
> +               return PTR_ERR(bp);
> +
> +       *addr =3D bp ? counter_arch_bp(bp)->address : 0;
> +       return 0;
> +}
> +
> +static struct perf_event *ptrace_hbp_get_initialised_bp(unsigned int not=
e_type,
> +                                                       struct task_struc=
t *tsk,
> +                                                       unsigned long idx=
)
> +{
> +       struct perf_event *bp =3D ptrace_hbp_get_event(note_type, tsk, id=
x);
> +
> +       if (!bp)
> +               bp =3D ptrace_hbp_create(note_type, tsk, idx);
> +
> +       return bp;
> +}
> +
> +static void decode_ctrl_reg(u32 uctrl, struct arch_hw_breakpoint *bpctrl=
)
> +{
> +       bpctrl->type =3D HWDEBUG_TYPE(uctrl);
> +       bpctrl->match =3D HWDEBUG_MATCH(uctrl);
> +       bpctrl->select =3D HWDEBUG_SELECT(uctrl);
> +       bpctrl->time =3D HWDEBUG_WHEN(uctrl);
> +       bpctrl->len =3D HWDEBUG_SIZE(uctrl);
> +       bpctrl->chain =3D HWDEBUG_CHAIN(uctrl);
> +}
> +
> +static int ptrace_hbp_set_ctrl(unsigned int note_type,
> +                              struct task_struct *tsk,
> +                              unsigned long idx,
> +                              u32 uctrl)
> +{
> +       int err;
> +       struct perf_event *bp;
> +       struct perf_event_attr attr;
> +       struct arch_hw_breakpoint bpctrl;
> +
> +       bp =3D ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
> +       if (IS_ERR(bp)) {
> +               err =3D PTR_ERR(bp);
> +               return err;
> +       }
> +
> +       attr =3D bp->attr;
> +       decode_ctrl_reg(uctrl, &bpctrl);
> +       bpctrl.address =3D attr.bp_addr;
> +       err =3D ptrace_hbp_fill_attr_ctrl(note_type, &bpctrl, &attr);
> +       if (err)
> +               return err;
> +
> +       return modify_user_hw_breakpoint(bp, &attr);
> +}
> +
> +static int ptrace_hbp_set_addr(unsigned int note_type,
> +                              struct task_struct *tsk,
> +                              unsigned long idx,
> +                              u64 addr)
> +{
> +       int err;
> +       struct perf_event *bp;
> +       struct perf_event_attr attr;
> +
> +       bp =3D ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
> +       if (IS_ERR(bp)) {
> +               err =3D PTR_ERR(bp);
> +               return err;
> +       }
> +
> +       attr =3D bp->attr;
> +       attr.bp_addr =3D addr;
> +       err =3D modify_user_hw_breakpoint(bp, &attr);
> +       return err;
> +}
> +
> +#define PTRACE_HBP_ADDR_SZ     sizeof(u64)
> +#define PTRACE_HBP_CTRL_SZ     sizeof(u32)
> +#define PTRACE_HBP_PAD_SZ      sizeof(u32)
> +
> +static int riscv_hw_break_get(struct task_struct *target,
> +                       const struct user_regset *regset,
> +                       struct membuf to)
> +{
> +       unsigned int note_type =3D regset->core_note_type;
> +       int ret, idx, num_slots;
> +       u32 info, ctrl;
> +       u64 addr;
> +
> +       /* Resource info: number of available slots */
> +       ret =3D ptrace_hbp_get_resource_info(note_type, &info);
> +       if (ret)
> +               return ret;
> +
> +       membuf_write(&to, &info, sizeof(info));
> +       membuf_zero(&to, sizeof(u32));
> +
> +       /* Emit one (address, ctrl, pad) entry per available slot */
> +       num_slots =3D (int)info;
> +       for (idx =3D 0; idx < num_slots; idx++) {
> +               ret =3D ptrace_hbp_get_addr(note_type, target, idx, &addr=
);
> +               if (ret)
> +                       return ret;
> +               ret =3D ptrace_hbp_get_ctrl(note_type, target, idx, &ctrl=
);
> +               if (ret)
> +                       return ret;
> +               membuf_store(&to, addr);
> +               membuf_store(&to, ctrl);
> +               membuf_zero(&to, sizeof(u32));
> +       }
> +       return 0;
> +}
> +
> +static int riscv_hw_break_set(struct task_struct *target,
> +                       const struct user_regset *regset,
> +                       unsigned int pos, unsigned int count,
> +                       const void *kbuf, const void __user *ubuf)
> +{
> +       unsigned int note_type =3D regset->core_note_type;
> +       int ret, idx =3D 0, offset, limit;
> +       u32 ctrl;
> +       u64 addr;
> +
> +       /* Resource info and pad */
> +       offset =3D offsetof(struct user_hwdebug_state, dbg_regs);
> +       user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, 0, offset);
> +
> +       /* (address, ctrl) registers */
> +       limit =3D regset->n * regset->size;
> +       while (count && offset < limit) {
> +               if (count < PTRACE_HBP_ADDR_SZ)
> +                       return -EINVAL;
> +
> +               ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &a=
ddr,
> +                                        offset, offset + PTRACE_HBP_ADDR=
_SZ);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D ptrace_hbp_set_addr(note_type, target, idx, addr)=
;
> +               if (ret)
> +                       return ret;
> +
> +               offset +=3D PTRACE_HBP_ADDR_SZ;
> +
> +               if (!count)
> +                       break;
> +
> +               ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &c=
trl,
> +                                        offset, offset + PTRACE_HBP_CTRL=
_SZ);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D ptrace_hbp_set_ctrl(note_type, target, idx, ctrl)=
;
> +               if (ret)
> +                       return ret;
> +
> +               offset +=3D PTRACE_HBP_CTRL_SZ;
> +
> +               user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
> +                                         offset, offset + PTRACE_HBP_PAD=
_SZ);
> +               offset +=3D PTRACE_HBP_PAD_SZ;
> +               idx++;
> +       }
> +
> +       return 0;
> +}
> +#endif /* CONFIG_HAVE_HW_BREAKPOINT */
> +
>  static struct user_regset riscv_user_regset[] __ro_after_init =3D {
>         [REGSET_X] =3D {
>                 USER_REGSET_NOTE_TYPE(PRSTATUS),
> @@ -421,6 +818,24 @@ static struct user_regset riscv_user_regset[] __ro_a=
fter_init =3D {
>                 .set =3D riscv_cfi_set,
>         },
>  #endif
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +       [REGSET_RISCV_HW_BREAK] =3D {
> +               USER_REGSET_NOTE_TYPE(RISCV_HW_BREAK),
> +               .n =3D sizeof(struct user_hwdebug_state) / sizeof(u32),
> +               .size =3D sizeof(u32),
> +               .align =3D sizeof(u32),
> +               .regset_get =3D riscv_hw_break_get,
> +               .set =3D riscv_hw_break_set,
> +       },
> +       [REGSET_RISCV_HW_WATCH] =3D {
> +               USER_REGSET_NOTE_TYPE(RISCV_HW_WATCH),
> +               .n =3D sizeof(struct user_hwdebug_state) / sizeof(u32),
> +               .size =3D sizeof(u32),
> +               .align =3D sizeof(u32),
> +               .regset_get =3D riscv_hw_break_get,
> +               .set =3D riscv_hw_break_set,
> +       },
> +#endif
>  };
>
>  static const struct user_regset_view riscv_user_native_view =3D {
> @@ -541,12 +956,104 @@ void ptrace_disable(struct task_struct *child)
>  {
>  }
>
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +static int riscv_ptrace_bp_get(struct task_struct *child, unsigned long =
idx,
> +                         struct __riscv_hwdebug_state *state)
> +{
> +       struct perf_event *bp;
> +
> +       if (idx >=3D RISCV_HW_BP_NUM_MAX)
> +               return -EINVAL;
> +
> +       bp =3D child->thread.ptrace_bps[idx];
> +       if (!bp)
> +               return -ENOENT;
> +
> +       state->addr =3D bp->attr.bp_addr;
> +       state->len  =3D bp->attr.bp_len;
> +       state->type =3D bp->attr.bp_type;
> +       state->ctrl =3D bp->attr.disabled =3D=3D 1;
> +
> +       return 0;
> +}
> +
> +static int riscv_ptrace_bp_set(struct task_struct *child, unsigned long =
idx,
> +                         struct __riscv_hwdebug_state *state)
> +{
> +       struct perf_event *bp;
> +       struct perf_event_attr attr;
> +
> +       if (idx >=3D RISCV_HW_BP_NUM_MAX)
> +               return -EINVAL;
> +
> +       bp =3D child->thread.ptrace_bps[idx];
> +       if (bp)
> +               attr =3D bp->attr;
> +       else
> +               ptrace_breakpoint_init(&attr);
> +
> +       attr.bp_addr =3D state->addr;
> +       attr.bp_len  =3D state->len;
> +       attr.bp_type =3D state->type;
> +       /* Always register disabled; enable below if requested */
> +       attr.disabled =3D 1;
> +
> +       if (!bp) {
> +               bp =3D register_user_hw_breakpoint(&attr, riscv_ptrace_hb=
ptriggered, NULL, child);
> +               if (IS_ERR(bp))
> +                       return PTR_ERR(bp);
> +               child->thread.ptrace_bps[idx] =3D bp;
> +       }
> +
> +       /* Enable or disable as requested by ctrl (0 =3D enabled, 1 =3D d=
isabled) */
> +       attr.disabled =3D state->ctrl =3D=3D 1;
> +       return modify_user_hw_breakpoint(bp, &attr);
> +}
> +
> +static long riscv_ptrace_gethbpregs(struct task_struct *child, unsigned =
long idx,
> +                             unsigned long __user *datap)
> +{
> +       struct __riscv_hwdebug_state state;
> +       long ret;
> +
> +       ret =3D riscv_ptrace_bp_get(child, idx, &state);
> +       if (ret)
> +               return ret;
> +       if (copy_to_user(datap, &state, sizeof(state)))
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +
> +static long riscv_ptrace_sethbpregs(struct task_struct *child, unsigned =
long idx,
> +                             unsigned long __user *datap)
> +{
> +       struct __riscv_hwdebug_state state;
> +
> +       if (copy_from_user(&state, datap, sizeof(state)))
> +               return -EFAULT;
> +
> +       return riscv_ptrace_bp_set(child, idx, &state);
> +}
> +#endif /* CONFIG_HAVE_HW_BREAKPOINT */
> +
>  long arch_ptrace(struct task_struct *child, long request,
>                  unsigned long addr, unsigned long data)
>  {
>         long ret =3D -EIO;
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +       unsigned long __user *datap =3D (unsigned long __user *)data;
> +#endif
>
>         switch (request) {
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +       case PTRACE_GETHBPREGS:
> +               ret =3D riscv_ptrace_gethbpregs(child, addr, datap);
> +               break;
> +       case PTRACE_SETHBPREGS:
> +               ret =3D riscv_ptrace_sethbpregs(child, addr, datap);
> +               break;
> +#endif
>         default:
>                 ret =3D ptrace_request(child, request, addr, data);
>                 break;
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index ee30dcd80901..1315ac35157c 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -547,6 +547,10 @@ typedef struct elf64_shdr {
>  #define NT_RISCV_TAGGED_ADDR_CTRL 0x902        /* RISC-V tagged address =
control (prctl()) */
>  #define NN_RISCV_USER_CFI      "LINUX"
>  #define NT_RISCV_USER_CFI      0x903           /* RISC-V shadow stack st=
ate */
> +#define NN_RISCV_HW_BREAK      "LINUX"
> +#define NT_RISCV_HW_BREAK      0x904           /* RISC-V hardware breakp=
oint registers */
> +#define NN_RISCV_HW_WATCH      "LINUX"
> +#define NT_RISCV_HW_WATCH      0x905           /* RISCV-V hardware watch=
point registers */
>  #define NN_LOONGARCH_CPUCFG    "LINUX"
>  #define NT_LOONGARCH_CPUCFG    0xa00   /* LoongArch CPU config registers=
 */
>  #define NN_LOONGARCH_CSR       "LINUX"
> diff --git a/tools/include/uapi/linux/elf.h b/tools/include/uapi/linux/el=
f.h
> index 5834b83d7f9a..21f225502051 100644
> --- a/tools/include/uapi/linux/elf.h
> +++ b/tools/include/uapi/linux/elf.h
> @@ -460,6 +460,8 @@ typedef struct elf64_shdr {
>  #define NT_RISCV_CSR   0x900           /* RISC-V Control and Status Regi=
sters */
>  #define NT_RISCV_VECTOR        0x901           /* RISC-V vector register=
s */
>  #define NT_RISCV_TAGGED_ADDR_CTRL 0x902        /* RISC-V tagged address =
control (prctl()) */
> +#define NT_RISCV_HW_BREAK      0x904
> +#define NT_RISCV_HW_WATCH      0x905
>  #define NT_LOONGARCH_CPUCFG    0xa00   /* LoongArch CPU config registers=
 */
>  #define NT_LOONGARCH_CSR       0xa01   /* LoongArch control and status r=
egisters */
>  #define NT_LOONGARCH_LSX       0xa02   /* LoongArch Loongson SIMD Extens=
ion registers */
> --
> 2.43.0
>


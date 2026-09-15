Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F795348C4B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462084; cv=none; b=BG2VIiWnKiQuuJlhqeXeP/uXklU6/ZPAoJgaMRFNoVY2QtCP5LhnjfMIqYnUqJZ2hCZh7qrFAA2FEr+P/pxRdS1eXdKR/rfr6CwTprJOiRW1I3nUoq4L1qr5JZVsaL6BHQR66zgX/VLFrt13t7tmhVnm1PTO1BrRaupWnL7/giI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462084; c=relaxed/simple;
	bh=GjBVNdB6GX3YSOtR/IpTgiMeOJZd2VbTRpn4651mRgM=;
	h=Cc:Date:Message-Id:Mime-Version:Content-Type:Subject:In-Reply-To:
	 References:To:From; b=HyvhD0ECB3lFC6cesU/3IEANiLNFNEhNCU8k21zDx3YzT12aT8oL1aR8qm1lGQ83f/qjNrg5LxYv7DB9eKctoA1SxtvyfPB0/yd4sYCtjfNN3We6SfY3xL6jGdwZtzriV7s2YXl7cmkMZTxrqfPkmrU8qHYUrq0p7IwIzQWuR04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UJtIm0N4; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UJtIm0N4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789462069; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=LKefFpqibkTp2313QcKUgVLA6yotNyLMbrRahOOTVuY=;
 b=UJtIm0N410GYc07ogmTsTfgASPWtvbeKcdyjxLS9NtcTgK3QkIPdQtJYmpOqTqpi4qZolz
 tdZ/bGsSXSxGztH7BW7Dr0p8G1vOUruig+Jdc3/s7H/n63aLZK1zanekNWjs3cQr3Z/Ibs
 7fmsGquCM5w/xbtDYlUKA9mELsx0k4us/fUkTJAcaf+Tl2A+sdEQ0cJ1xgXOn4nXdsZg1r
 SRZhGOkIBUJ2haBrBnnejHj45Tcwn9ChhzsFrVYVtZJUqZEJVH0+PS4HKzp39bQg/t/ch/
 HLOHf9MZyFxG1IaItY1Y/zrGBW6T0uALkGlHKpSHvEoEr3MWIzq7X13ENp3cpQ==
Cc: <qingfang.deng@linux.dev>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, 
	<palmer@dabbelt.com>, <pjw@kernel.org>, <shuah@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <thecharlesjenkins@gmail.com>, 
	<jtaubepe@redhat.com>
Date: Tue, 15 Sep 2026 16:47:29 +0800
Message-Id: <5a7c08bd-4313-4424-b649-a19ffe5242e4@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26aa90633+29c757+vger.kernel.org+qirui.001@bytedance.com>
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] riscv: ptrace support for hardware break/watchpoints
In-Reply-To: <20260803134913.2013674-4-himanshu.chauhan@oss.qualcomm.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com> <20260803134913.2013674-4-himanshu.chauhan@oss.qualcomm.com>
To: "Himanshu Chauhan" <himanshu.chauhan@oss.qualcomm.com>, 
	<linux-riscv@lists.infradead.org>
From: "Rui Qi" <qirui.001@bytedance.com>
Content-Transfer-Encoding: quoted-printable

On 8/3/26 9:49 PM, Himanshu Chauhan wrote:
> Add ptrace support for hardware breakpoints and watchpoints on
> RISC-V. Debuggers can now set and query hardware debug triggers
> through the standard PTRACE_GETREGSET/SETREGSET interface using new
> NT_RISCV_HW_BREAK/WATCH note types, backed by
> register_user_hw_breakpoint()/modify_user_hw_breakpoint() and
> delivering SIGTRAP/TRAP_HWBKPT to the tracee when a trigger fires.
>=20
> For convenience, also add a simpler PTRACE_GETHBPREGS/SETHBPREGS
> request pair that lets a tracer read or write a single breakpoint or
> watchpoint directly, without going through the regset machinery.
> These request numbers live in the arch-specific ptrace range
> (0x4210/0x4211) so they don't collide with the generic
> PTRACE_PEEKDATA/PTRACE_PEEKUSR codes.
>=20
> Breakpoints and watchpoints share the same trigger pool on this
> architecture, so select HAVE_MIXED_BREAKPOINTS_REGS. Hook up
> thread flush/copy so per-task breakpoints are cleaned up and cleared
> across fork/exec.
>=20
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
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a624dacdaf12..4d2913b49817 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -173,6 +173,7 @@ config RISCV
>  	select HAVE_GCC_PLUGINS
>  	select HAVE_GENERIC_VDSO if MMU
>  	select HAVE_HW_BREAKPOINT if PERF_EVENTS
> +	select HAVE_MIXED_BREAKPOINTS_REGS

RISC-V selects HAVE_MIXED_BREAKPOINTS_REGS unconditionally:

  select HAVE_HW_BREAKPOINT if PERF_EVENTS
  select HAVE_MIXED_BREAKPOINTS_REGS        # unconditional

but that symbol has a direct dependency:

  config HAVE_MIXED_BREAKPOINTS_REGS
      bool
      depends on HAVE_HW_BREAKPOINT          # arch/Kconfig:401

and HAVE_HW_BREAKPOINT itself depends on
PERF_EVENTS (arch/Kconfig:399), which RISC-V only selects
conditionally (the line above).

So with PERF_EVENTS disabled =E2=80=94 a valid config for minimal/embedded
RISC-V builds =E2=80=94 HAVE_HW_BREAKPOINT is off, yet
HAVE_MIXED_BREAKPOINTS_REGS is forced on. Kconfig then warns about
unmet direct dependencies:

  warning: (RISCV) selects HAVE_MIXED_BREAKPOINTS_REGS whose direct
  dependencies (HAVE_HW_BREAKPOINT) are not met

The fix is to gate the select the same way as the line above it:

  select HAVE_MIXED_BREAKPOINTS_REGS if PERF_EVENTS

(or "if HAVE_HW_BREAKPOINT" if you prefer the more direct
expression =E2=80=94 both are equivalent here since HAVE_HW_BREAKPOINT
itself depends on PERF_EVENTS).

Thanks,
Rui Qi

>  	select HAVE_IRQ_TIME_ACCOUNTING
>  	select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
>  	select HAVE_KERNEL_GZIP if !EFI_ZBOOT
> diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/=
asm/hw_breakpoint.h
> index 4df1bfe0507e..94ebdd1ab9c3 100644
> --- a/arch/riscv/include/asm/hw_breakpoint.h
> +++ b/arch/riscv/include/asm/hw_breakpoint.h
> @@ -14,6 +14,7 @@ struct task_struct;
> =20
>  /* Maximum number of hardware breakpoints supported */
>  #define RISCV_HW_BP_NUM_MAX 32
> +#define RISCV_MAX_BP		16
> =20
>  #if __riscv_xlen =3D=3D 64
>  #define cpu_to_le cpu_to_le64
> @@ -256,6 +257,10 @@ struct arch_hw_breakpoint {
>  	unsigned long address;
>  	unsigned long len;
>  	unsigned int type;
> +	unsigned int match;
> +	unsigned int chain;
> +	unsigned int select;
> +	unsigned int time;
> =20
>  	/* Trigger configuration data */
>  	unsigned long tdata1;
> @@ -282,8 +287,13 @@ void arch_disable_hw_breakpoint(struct perf_event *b=
p);
>  int arch_install_hw_breakpoint(struct perf_event *bp);
>  void arch_uninstall_hw_breakpoint(struct perf_event *bp);
>  void hw_breakpoint_pmu_read(struct perf_event *bp);
> +void clear_ptrace_hw_breakpoint(struct task_struct *tsk);
> +void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
> +void ptrace_hw_copy_thread(struct task_struct *task);
> =20
>  #else
> =20
> +static inline void ptrace_hw_copy_thread(struct task_struct *task) { }
> +
>  #endif /* CONFIG_HAVE_HW_BREAKPOINT */
>  #endif /* __RISCV_HW_BREAKPOINT_H */
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index 812517b2cec1..421bb6773015 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -15,6 +15,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/insn-def.h>
>  #include <asm/alternative-macros.h>
> +#include <asm/hw_breakpoint.h>
>  #include <asm/hwcap.h>
>  #include <asm/usercfi.h>
> =20
> @@ -102,6 +103,19 @@ struct pt_regs;
>  #define RISCV_PREEMPT_V_NEED_RESTORE	0x40000000
>  #define RISCV_PREEMPT_V_IN_SCHEDULE	0x20000000
> =20
> +struct debug_info {
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	/* Have we suspended stepping by a debugger? */
> +	int			suspended_step;
> +	/* Allow breakpoints and watchpoints to be disabled for this thread. */
> +	int			bp_disabled;
> +	int			wp_disabled;
> +	/* Hardware breakpoints pinned to this task. */
> +	struct perf_event	*hbp_break[RISCV_MAX_BP];
> +	struct perf_event	*hbp_watch[RISCV_MAX_BP];
> +#endif
> +};
> +
>  /* CPU-specific state of a task */
>  struct thread_struct {
>  	/* Callee-saved registers */
> @@ -122,6 +136,10 @@ struct thread_struct {
>  	bool force_icache_flush;
>  	/* A forced icache flush is not needed if migrating to the previous cpu=
. */
>  	unsigned int prev_cpu;
> +#endif
> +	struct debug_info debug;
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	struct perf_event	*ptrace_bps[RISCV_HW_BP_NUM_MAX];
>  #endif
>  };
> =20
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/ua=
pi/asm/ptrace.h
> index 3de2b7124aff..9b0acc0537fa 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -10,11 +10,14 @@
> =20
>  #include <linux/types.h>
>  #include <linux/const.h>
> +#include <linux/bits.h>
> =20
>  #define PTRACE_GETFDPIC		33
> =20
>  #define PTRACE_GETFDPIC_EXEC	0
>  #define PTRACE_GETFDPIC_INTERP	1
> +#define PTRACE_GETHBPREGS	0x4210
> +#define PTRACE_SETHBPREGS	0x4211
> =20

PTRACE_GETHBPREGS and PTRACE_SETHBPREGS are defined as 0x4210 and 0x4211
(arch/riscv/include/uapi/asm/ptrace.h), but those values are already
taken generically by PTRACE_SET_SYSCALL_USER_DISPATCH_CONFIG and
PTRACE_GET_SYSCALL_USER_DISPATCH_CONFIG (include/uapi/linux/ptrace.h),
and the whole 0x4200-0x4300 range is explicitly reserved for
architecture-independent additions.

Because sys_ptrace() calls arch_ptrace() before ptrace_request(), and
RISC-V's arch_ptrace() handles GETHBPREGS/SETHBPREGS under
CONFIG_HAVE_HW_BREAKPOINT before the default fall-through, a tracer
issuing the generic syscall-user-dispatch config requests gets routed
into the hwbreak handlers instead =E2=80=94 and GET/SET land on the wrong
handler. So syscall-user-dispatch config is broken on RISC-V whenever
hardware breakpoints are enabled.

Thanks,
Rui Qi

>  /*
>   * User-mode register state for core dumps, ptrace, sigcontext
> @@ -164,6 +167,53 @@ struct user_cfi_state {
>  	__u64 shstk_ptr;
>  };
> =20
> +/*
> + * bit[3:0]        Match
> + * bit[8:4]        Size
> + * bit[11:9]       When
> + * bit[12]         Select
> + * bit[13]         Chain
> + * bit[16:14]      Type
> + * bit[XLEN-1:17]  Reserved
> +*/
> +#define HWDEBUG_MATCH_MASK	__GENMASK(3, 0)
> +#define HWDEBUG_SIZE_MASK	__GENMASK(8, 4)
> +#define HWDEBUG_WHEN_MASK	__GENMASK(11, 9)
> +#define HWDEBUG_SELECT_MASK	_BITUL(12)
> +#define HWDEBUG_CHAIN_MASK	_BITUL(13)
> +#define HWDEBUG_TYPE_MASK	__GENMASK(16, 14)
> +
> +#define HWDEBUG_MATCH(_ctrl)	(((_ctrl) & HWDEBUG_MATCH_MASK) >> 0)
> +#define HWDEBUG_SIZE(_ctrl)	(((_ctrl) & HWDEBUG_SIZE_MASK) >> 4)
> +#define HWDEBUG_WHEN(_ctrl)	(((_ctrl) & HWDEBUG_WHEN_MASK) >> 9)
> +#define HWDEBUG_SELECT(_ctrl)	(((_ctrl) & HWDEBUG_SELECT_MASK) >> 12)
> +#define HWDEBUG_CHAIN(_ctrl)	(((_ctrl) & HWDEBUG_CHAIN_MASK) >> 13)
> +#define HWDEBUG_TYPE(_ctrl)	(((_ctrl) & HWDEBUG_TYPE_MASK) >> 14)
> +
> +#define HWDEBUG_MK_MATCH(_match)	((_match << 0) & HWDEBUG_MATCH_MASK)
> +#define HWDEBUG_MK_SIZE(_sz)		((_sz << 4) & HWDEBUG_SIZE_MASK)
> +#define HWDEBUG_MK_WHEN(_when)		((_when << 9) & HWDEBUG_WHEN_MASK)
> +#define HWDEBUG_MK_SELECT(_sel)		((_sel << 12) & HWDEBUG_SELECT_MASK)
> +#define HWDEBUG_MK_CHAIN(_chain)	((_chain << 13) & HWDEBUG_CHAIN_MASK)
> +#define HWDEBUG_MK_TYPE(_type)		((_type << 14) & HWDEBUG_TYPE_MASK)
> +
> +struct user_hwdebug_state {
> +	__u32 info;
> +	__u32 pad;
> +	struct {
> +		__u64 addr;
> +		__u32 control;
> +		__u32 pad;
> +	} dbg_regs[16];
> +};
> +
> +struct __riscv_hwdebug_state {
> +	unsigned long addr;
> +	unsigned long type;
> +	unsigned long len;
> +	unsigned long ctrl;
> +} __packed;
> +
>  #endif /* __ASSEMBLER__ */
> =20
>  #endif /* _UAPI_ASM_RISCV_PTRACE_H */
> diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_bre=
akpoint.c
> index fc54a1a897c5..b4fab41cd3f8 100644
> --- a/arch/riscv/kernel/hw_breakpoint.c
> +++ b/arch/riscv/kernel/hw_breakpoint.c
> @@ -630,7 +630,6 @@ EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
> =20
>  void hw_breakpoint_pmu_read(struct perf_event *bp) { }
> =20
> -void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
> =20
>  static int __init arch_hw_breakpoint_init(void)
>  {
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index b2df7f72241a..b20b5fbeb4e3 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -204,6 +204,7 @@ void flush_thread(void)
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
>  		envcfg_update_bits(current, ENVCFG_PMM, ENVCFG_PMM_PMLEN_0);
>  #endif
> +	flush_ptrace_hw_breakpoint(current);
>  }
> =20
>  void arch_release_task_struct(struct task_struct *tsk)
> @@ -283,6 +284,10 @@ int copy_thread(struct task_struct *p, const struct =
kernel_clone_args *args)
>  	p->thread.riscv_v_flags =3D 0;
>  	if (has_vector() || has_xtheadvector())
>  		riscv_v_thread_alloc(p);
> +	ptrace_hw_copy_thread(p);
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
> +#endif
>  	p->thread.sp =3D (unsigned long)childregs; /* kernel sp */
>  	return 0;
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
> =20
>  enum riscv_regset {
>  	REGSET_X,
> @@ -35,6 +37,10 @@ enum riscv_regset {
>  #ifdef CONFIG_RISCV_USER_CFI
>  	REGSET_CFI,
>  #endif
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	REGSET_RISCV_HW_BREAK,
> +	REGSET_RISCV_HW_WATCH,
> +#endif
>  };
> =20
>  static int riscv_gpr_get(struct task_struct *target,
> @@ -372,6 +378,397 @@ static int riscv_cfi_set(struct task_struct *target=
,
>  }
>  #endif
> =20
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +/*
> + * Handle hitting a HW-breakpoint.
> + */
> +static void riscv_ptrace_hbptriggered(struct perf_event *bp,
> +				struct perf_sample_data *data,
> +				struct pt_regs *regs)
> +{
> +	struct arch_hw_breakpoint *bkpt =3D counter_arch_bp(bp);
> +
> +	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)bkpt->address);
> +}
> +
> +/*
> + * Unregister breakpoints from this task and reset the pointers in
> + * the thread_struct.
> + */
> +void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
> +{
> +	int i;
> +	struct thread_struct *t =3D &tsk->thread;
> +
> +	for (i =3D 0; i < RISCV_MAX_BP; i++) {
> +		if (t->debug.hbp_break[i]) {
> +			unregister_hw_breakpoint(t->debug.hbp_break[i]);
> +			t->debug.hbp_break[i] =3D NULL;
> +		}
> +	}
> +
> +	for (i =3D 0; i < RISCV_MAX_BP; i++) {
> +		if (t->debug.hbp_watch[i]) {
> +			unregister_hw_breakpoint(t->debug.hbp_watch[i]);
> +			t->debug.hbp_watch[i] =3D NULL;
> +		}
> +	}
> +}

The direct request path and the regset path store their events in
different arrays:

  - PTRACE_SETHBPREGS stores into thread.ptrace_bps[idx]

  - The regset path (NT_RISCV_HW_BREAK/WATCH) stores into
    thread.debug.hbp_break[idx] / hbp_watch[idx]

But flush_ptrace_hw_breakpoint() only unregisters the latter =E2=80=94 it
walks hbp_break[] and hbp_watch[], calls unregister_hw_breakpoint()
and NULLs them, and never touches ptrace_bps[]

On exec, flush_thread() calls only flush_ptrace_hw_breakpoint()
and the generic perf exec path perf_event_remove_on_exec()
(kernel/events/core.c) skips events without attr->remove_on_exec =E2=80=94 =
which
ptrace_breakpoint_init() never sets.

Net result: an event installed via the direct PTRACE_SETHBPREGS
request sits in ptrace_bps[], is not touched by
flush_ptrace_hw_breakpoint(), and is not removed by the generic exec
path either. So a normal, dumpable exec can keep the old image's
hardware triggers armed =E2=80=94 pointing at addresses that, after exec,
may map to unrelated code or data in the new image (spurious
triggers or missed ones). The events only get cleaned at task exit
via perf_event_exit_task().

> +
> +void ptrace_hw_copy_thread(struct task_struct *tsk)
> +{
> +	memset(&tsk->thread.debug, 0, sizeof(struct debug_info));
> +}
> +
> +static struct perf_event *ptrace_hbp_get_event(unsigned int note_type,
> +					       struct task_struct *tsk,
> +					       unsigned long idx)
> +{
> +	struct perf_event *bp =3D ERR_PTR(-EINVAL);
> +
> +	switch (note_type) {
> +	case NT_RISCV_HW_BREAK:
> +		if (idx >=3D RISCV_MAX_BP)
> +			goto out;
> +		idx =3D array_index_nospec(idx, RISCV_MAX_BP);
> +		bp =3D tsk->thread.debug.hbp_break[idx];
> +		break;
> +	case NT_RISCV_HW_WATCH:
> +		if (idx >=3D RISCV_MAX_BP)
> +			goto out;
> +		idx =3D array_index_nospec(idx, RISCV_MAX_BP);
> +		bp =3D tsk->thread.debug.hbp_watch[idx];
> +		break;
> +	}
> +
> +out:
> +	return bp;
> +}
> +
> +static int ptrace_hbp_set_event(unsigned int note_type,
> +				struct task_struct *tsk,
> +				unsigned long idx,
> +				struct perf_event *bp)
> +{
> +	int err =3D -EINVAL;
> +
> +	switch (note_type) {
> +	case NT_RISCV_HW_BREAK:
> +		if (idx >=3D RISCV_MAX_BP)
> +			goto out;
> +		idx =3D array_index_nospec(idx, RISCV_MAX_BP);
> +		tsk->thread.debug.hbp_break[idx] =3D bp;
> +		err =3D 0;
> +		break;
> +	case NT_RISCV_HW_WATCH:
> +		if (idx >=3D RISCV_MAX_BP)
> +			goto out;
> +		idx =3D array_index_nospec(idx, RISCV_MAX_BP);
> +		tsk->thread.debug.hbp_watch[idx] =3D bp;
> +		err =3D 0;
> +		break;
> +	}
> +
> +out:
> +	return err;
> +}
> +
> +static struct perf_event *ptrace_hbp_create(unsigned int note_type,
> +					    struct task_struct *tsk,
> +					    unsigned long idx)
> +{
> +	struct perf_event *bp;
> +	struct perf_event_attr attr;
> +	int err, type;
> +
> +	switch (note_type) {
> +	case NT_RISCV_HW_BREAK:
> +		type =3D HW_BREAKPOINT_X;
> +		break;
> +	case NT_RISCV_HW_WATCH:
> +		type =3D HW_BREAKPOINT_RW;
> +		break;
> +	default:
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	ptrace_breakpoint_init(&attr);
> +
> +	/*
> +	 * Initialise fields to sane defaults
> +	 * (i.e. values that will pass validation).
> +	 */
> +	attr.bp_addr	=3D 0;
> +	attr.bp_len	=3D HW_BREAKPOINT_LEN_4;
> +	attr.bp_type	=3D type;
> +	attr.disabled	=3D 1;
> +
> +	bp =3D register_user_hw_breakpoint(&attr, riscv_ptrace_hbptriggered, NU=
LL, tsk);
> +	if (IS_ERR(bp))
> +		return bp;
> +
> +	err =3D ptrace_hbp_set_event(note_type, tsk, idx, bp);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return bp;
> +}
> +
> +static int ptrace_hbp_fill_attr_ctrl(unsigned int note_type,
> +				     struct arch_hw_breakpoint *bpctrl,
> +				     struct perf_event_attr *attr)
> +{
> +	int len, type;
> +
> +	attr->disabled =3D 0;
> +	type =3D bpctrl->type;
> +	len =3D bpctrl->len;
> +
> +	switch (note_type) {
> +	case NT_RISCV_HW_BREAK:
> +		if ((type & HW_BREAKPOINT_X) !=3D type)
> +			return -EINVAL;
> +		break;
> +	case NT_RISCV_HW_WATCH:
> +		if ((type & HW_BREAKPOINT_RW) !=3D type)
> +			return -EINVAL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	attr->bp_len	=3D len;
> +	attr->bp_type	=3D type;
> +	attr->bp_addr	=3D bpctrl->address;
> +
> +	return 0;
> +}
> +

a slot programmed via the
NT_RISCV_HW_BREAK/WATCH regset cannot be disabled through the same ABI.

The control word (uapi/asm/ptrace.h) has no enabled bit, and
ptrace_hbp_fill_attr_ctrl() unconditionally sets attr->disabled =3D 0. A
debugger's natural disable attempt =E2=80=94 writing a zero control word =
=E2=80=94 fails:

Tracing that path:

1. decode_ctrl_reg(0, &bpctrl) leaves bpctrl->type =3D=3D 0 and bpctrl->len
=3D=3D 0;

2. ptrace_hbp_fill_attr_ctrl() sets attr->disabled =3D 0 (i.e. enabled),
and the validation checks ((type & HW_BREAKPOINT_X) !=3D type) / ((type &
HW_BREAKPOINT_RW) !=3D type) both pass for type =3D=3D 0, since 0 is a subs=
et
of any mask;

3.so attr->bp_type is set to 0, i.e. HW_BREAKPOINT_EMPTY, with
attr->disabled =3D 0;

4. modify_user_hw_breakpoint() then calls hw_breakpoint_arch_parse() ->
rv_init_mcontrol_trigger(), whose switch (attr->bp_type) hits default:
return -EINVAL; for bp_type =3D=3D 0.

The modify_user_hw_breakpoint() call therefore fails, the previous
hardware breakpoint stays armed, and the write appears to "succeed" at
the regset layer only to fail silently underneath. A slot created via
the regset is thus reprogrammable, but not disableable, until exec or
task exit.

For contrast, arm64's ptrace_hbp_fill_attr_ctrl() reads a real
ctrl.enabled bit, computes disabled =3D !ctrl.enabled, and returns early
(attr->disabled =3D 1)
when the slot is disabled, so a zero/disabled control word is a
legitimate operation there. RISC-V has no equivalent path.

> +static int ptrace_hbp_get_resource_info(unsigned int note_type, u32 *inf=
o)
> +{
> +	u8 num;
> +
> +	switch (note_type) {
> +	case NT_RISCV_HW_BREAK:
> +		num =3D hw_breakpoint_slots(TYPE_INST);
> +		break;
> +	case NT_RISCV_HW_WATCH:
> +		num =3D hw_breakpoint_slots(TYPE_DATA);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	*info =3D num;
> +
> +	return 0;
> +}
> +
> +static u32 encode_ctrl_reg(struct perf_event *bp)
> +{
> +	struct arch_hw_breakpoint *bpctrl =3D counter_arch_bp(bp);
> +	u32 ctrl =3D 0;
> +
> +	/* Expose the generic UAPI bp_type values in ptrace control bits. */
> +	ctrl |=3D HWDEBUG_MK_TYPE(bp->attr.bp_type);
> +	ctrl |=3D HWDEBUG_MK_MATCH(bpctrl->match);
> +	ctrl |=3D HWDEBUG_MK_SELECT(bpctrl->select);
> +	ctrl |=3D HWDEBUG_MK_WHEN(bpctrl->time);
> +	ctrl |=3D HWDEBUG_MK_SIZE(bp->attr.bp_len);
> +	ctrl |=3D HWDEBUG_MK_CHAIN(bpctrl->chain);
> +
> +	return ctrl;
> +}
> +
> +static int ptrace_hbp_get_ctrl(unsigned int note_type,
> +			       struct task_struct *tsk,
> +			       unsigned long idx,
> +			       u32 *ctrl)
> +{
> +	struct perf_event *bp =3D ptrace_hbp_get_event(note_type, tsk, idx);
> +
> +	if (IS_ERR(bp))
> +		return PTR_ERR(bp);
> +
> +	*ctrl =3D bp ? encode_ctrl_reg(bp) : 0;
> +	return 0;
> +}
> +
> +static int ptrace_hbp_get_addr(unsigned int note_type,
> +			       struct task_struct *tsk,
> +			       unsigned long idx,
> +			       u64 *addr)
> +{
> +	struct perf_event *bp =3D ptrace_hbp_get_event(note_type, tsk, idx);
> +
> +	if (IS_ERR(bp))
> +		return PTR_ERR(bp);
> +
> +	*addr =3D bp ? counter_arch_bp(bp)->address : 0;
> +	return 0;
> +}
> +
> +static struct perf_event *ptrace_hbp_get_initialised_bp(unsigned int not=
e_type,
> +							struct task_struct *tsk,
> +							unsigned long idx)
> +{
> +	struct perf_event *bp =3D ptrace_hbp_get_event(note_type, tsk, idx);
> +
> +	if (!bp)
> +		bp =3D ptrace_hbp_create(note_type, tsk, idx);
> +
> +	return bp;
> +}
> +
> +static void decode_ctrl_reg(u32 uctrl, struct arch_hw_breakpoint *bpctrl=
)
> +{
> +	bpctrl->type =3D HWDEBUG_TYPE(uctrl);
> +	bpctrl->match =3D HWDEBUG_MATCH(uctrl);
> +	bpctrl->select =3D HWDEBUG_SELECT(uctrl);
> +	bpctrl->time =3D HWDEBUG_WHEN(uctrl);
> +	bpctrl->len =3D HWDEBUG_SIZE(uctrl);
> +	bpctrl->chain =3D HWDEBUG_CHAIN(uctrl);
> +}
> +
> +static int ptrace_hbp_set_ctrl(unsigned int note_type,
> +			       struct task_struct *tsk,
> +			       unsigned long idx,
> +			       u32 uctrl)
> +{
> +	int err;
> +	struct perf_event *bp;
> +	struct perf_event_attr attr;
> +	struct arch_hw_breakpoint bpctrl;
> +
> +	bp =3D ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
> +	if (IS_ERR(bp)) {
> +		err =3D PTR_ERR(bp);
> +		return err;
> +	}
> +
> +	attr =3D bp->attr;
> +	decode_ctrl_reg(uctrl, &bpctrl);
> +	bpctrl.address =3D attr.bp_addr;
> +	err =3D ptrace_hbp_fill_attr_ctrl(note_type, &bpctrl, &attr);
> +	if (err)
> +		return err;
> +
> +	return modify_user_hw_breakpoint(bp, &attr);
> +}
> +
> +static int ptrace_hbp_set_addr(unsigned int note_type,
> +			       struct task_struct *tsk,
> +			       unsigned long idx,
> +			       u64 addr)
> +{
> +	int err;
> +	struct perf_event *bp;
> +	struct perf_event_attr attr;
> +
> +	bp =3D ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
> +	if (IS_ERR(bp)) {
> +		err =3D PTR_ERR(bp);
> +		return err;
> +	}
> +
> +	attr =3D bp->attr;
> +	attr.bp_addr =3D addr;
> +	err =3D modify_user_hw_breakpoint(bp, &attr);
> +	return err;
> +}
> +
> +#define PTRACE_HBP_ADDR_SZ	sizeof(u64)
> +#define PTRACE_HBP_CTRL_SZ	sizeof(u32)
> +#define PTRACE_HBP_PAD_SZ	sizeof(u32)
> +
> +static int riscv_hw_break_get(struct task_struct *target,
> +			const struct user_regset *regset,
> +			struct membuf to)
> +{
> +	unsigned int note_type =3D regset->core_note_type;
> +	int ret, idx, num_slots;
> +	u32 info, ctrl;
> +	u64 addr;
> +
> +	/* Resource info: number of available slots */
> +	ret =3D ptrace_hbp_get_resource_info(note_type, &info);
> +	if (ret)
> +		return ret;
> +
> +	membuf_write(&to, &info, sizeof(info));
> +	membuf_zero(&to, sizeof(u32));
> +
> +	/* Emit one (address, ctrl, pad) entry per available slot */
> +	num_slots =3D (int)info;
> +	for (idx =3D 0; idx < num_slots; idx++) {
> +		ret =3D ptrace_hbp_get_addr(note_type, target, idx, &addr);
> +		if (ret)
> +			return ret;
> +		ret =3D ptrace_hbp_get_ctrl(note_type, target, idx, &ctrl);
> +		if (ret)
> +			return ret;
> +		membuf_store(&to, addr);
> +		membuf_store(&to, ctrl);
> +		membuf_zero(&to, sizeof(u32));
> +	}
> +	return 0;
> +}
> +
> +static int riscv_hw_break_set(struct task_struct *target,
> +			const struct user_regset *regset,
> +			unsigned int pos, unsigned int count,
> +			const void *kbuf, const void __user *ubuf)
> +{
> +	unsigned int note_type =3D regset->core_note_type;
> +	int ret, idx =3D 0, offset, limit;
> +	u32 ctrl;
> +	u64 addr;
> +
> +	/* Resource info and pad */
> +	offset =3D offsetof(struct user_hwdebug_state, dbg_regs);
> +	user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, 0, offset);
> +
> +	/* (address, ctrl) registers */
> +	limit =3D regset->n * regset->size;
> +	while (count && offset < limit) {
> +		if (count < PTRACE_HBP_ADDR_SZ)
> +			return -EINVAL;
> +
> +		ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &addr,
> +					 offset, offset + PTRACE_HBP_ADDR_SZ);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D ptrace_hbp_set_addr(note_type, target, idx, addr);
> +		if (ret)
> +			return ret;
> +
> +		offset +=3D PTRACE_HBP_ADDR_SZ;
> +
> +		if (!count)
> +			break;
> +
> +		ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl,
> +					 offset, offset + PTRACE_HBP_CTRL_SZ);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D ptrace_hbp_set_ctrl(note_type, target, idx, ctrl);
> +		if (ret)
> +			return ret;
> +
> +		offset +=3D PTRACE_HBP_CTRL_SZ;
> +
> +		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
> +					  offset, offset + PTRACE_HBP_PAD_SZ);
> +		offset +=3D PTRACE_HBP_PAD_SZ;
> +		idx++;
> +	}
> +
> +	return 0;
> +}
> +#endif	/* CONFIG_HAVE_HW_BREAKPOINT */
> +
>  static struct user_regset riscv_user_regset[] __ro_after_init =3D {
>  	[REGSET_X] =3D {
>  		USER_REGSET_NOTE_TYPE(PRSTATUS),
> @@ -421,6 +818,24 @@ static struct user_regset riscv_user_regset[] __ro_a=
fter_init =3D {
>  		.set =3D riscv_cfi_set,
>  	},
>  #endif
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	[REGSET_RISCV_HW_BREAK] =3D {
> +		USER_REGSET_NOTE_TYPE(RISCV_HW_BREAK),
> +		.n =3D sizeof(struct user_hwdebug_state) / sizeof(u32),
> +		.size =3D sizeof(u32),
> +		.align =3D sizeof(u32),
> +		.regset_get =3D riscv_hw_break_get,
> +		.set =3D riscv_hw_break_set,
> +	},
> +	[REGSET_RISCV_HW_WATCH] =3D {
> +		USER_REGSET_NOTE_TYPE(RISCV_HW_WATCH),
> +		.n =3D sizeof(struct user_hwdebug_state) / sizeof(u32),
> +		.size =3D sizeof(u32),
> +		.align =3D sizeof(u32),
> +		.regset_get =3D riscv_hw_break_get,
> +		.set =3D riscv_hw_break_set,
> +	},
> +#endif
>  };
> =20
>  static const struct user_regset_view riscv_user_native_view =3D {
> @@ -541,12 +956,104 @@ void ptrace_disable(struct task_struct *child)
>  {
>  }
> =20
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +static int riscv_ptrace_bp_get(struct task_struct *child, unsigned long =
idx,
> +			  struct __riscv_hwdebug_state *state)
> +{
> +	struct perf_event *bp;
> +
> +	if (idx >=3D RISCV_HW_BP_NUM_MAX)
> +		return -EINVAL;
> +
> +	bp =3D child->thread.ptrace_bps[idx];
> +	if (!bp)
> +		return -ENOENT;
> +
> +	state->addr =3D bp->attr.bp_addr;
> +	state->len  =3D bp->attr.bp_len;
> +	state->type =3D bp->attr.bp_type;
> +	state->ctrl =3D bp->attr.disabled =3D=3D 1;
> +
> +	return 0;
> +}
> +
> +static int riscv_ptrace_bp_set(struct task_struct *child, unsigned long =
idx,
> +			  struct __riscv_hwdebug_state *state)
> +{
> +	struct perf_event *bp;
> +	struct perf_event_attr attr;
> +
> +	if (idx >=3D RISCV_HW_BP_NUM_MAX)
> +		return -EINVAL;
> +
> +	bp =3D child->thread.ptrace_bps[idx];
> +	if (bp)
> +		attr =3D bp->attr;
> +	else
> +		ptrace_breakpoint_init(&attr);
> +
> +	attr.bp_addr =3D state->addr;
> +	attr.bp_len  =3D state->len;
> +	attr.bp_type =3D state->type;
> +	/* Always register disabled; enable below if requested */
> +	attr.disabled =3D 1;
> +
> +	if (!bp) {
> +		bp =3D register_user_hw_breakpoint(&attr, riscv_ptrace_hbptriggered, N=
ULL, child);
> +		if (IS_ERR(bp))
> +			return PTR_ERR(bp);
> +		child->thread.ptrace_bps[idx] =3D bp;
> +	}
> +
> +	/* Enable or disable as requested by ctrl (0 =3D enabled, 1 =3D disable=
d) */
> +	attr.disabled =3D state->ctrl =3D=3D 1;
> +	return modify_user_hw_breakpoint(bp, &attr);
> +}
> +
> +static long riscv_ptrace_gethbpregs(struct task_struct *child, unsigned =
long idx,
> +			      unsigned long __user *datap)
> +{
> +	struct __riscv_hwdebug_state state;
> +	long ret;
> +
> +	ret =3D riscv_ptrace_bp_get(child, idx, &state);
> +	if (ret)
> +		return ret;
> +	if (copy_to_user(datap, &state, sizeof(state)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static long riscv_ptrace_sethbpregs(struct task_struct *child, unsigned =
long idx,
> +			      unsigned long __user *datap)
> +{
> +	struct __riscv_hwdebug_state state;
> +
> +	if (copy_from_user(&state, datap, sizeof(state)))
> +		return -EFAULT;
> +
> +	return riscv_ptrace_bp_set(child, idx, &state);
> +}
> +#endif /* CONFIG_HAVE_HW_BREAKPOINT */
> +
>  long arch_ptrace(struct task_struct *child, long request,
>  		 unsigned long addr, unsigned long data)
>  {
>  	long ret =3D -EIO;
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	unsigned long __user *datap =3D (unsigned long __user *)data;
> +#endif
> =20
>  	switch (request) {
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	case PTRACE_GETHBPREGS:
> +		ret =3D riscv_ptrace_gethbpregs(child, addr, datap);
> +		break;
> +	case PTRACE_SETHBPREGS:
> +		ret =3D riscv_ptrace_sethbpregs(child, addr, datap);
> +		break;
> +#endif
>  	default:
>  		ret =3D ptrace_request(child, request, addr, data);
>  		break;
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index ee30dcd80901..1315ac35157c 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -547,6 +547,10 @@ typedef struct elf64_shdr {
>  #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control=
 (prctl()) */
>  #define NN_RISCV_USER_CFI	"LINUX"
>  #define NT_RISCV_USER_CFI	0x903		/* RISC-V shadow stack state */
> +#define NN_RISCV_HW_BREAK	"LINUX"
> +#define NT_RISCV_HW_BREAK	0x904		/* RISC-V hardware breakpoint registers=
 */
> +#define NN_RISCV_HW_WATCH	"LINUX"
> +#define NT_RISCV_HW_WATCH	0x905		/* RISCV-V hardware watchpoint register=
s */
>  #define NN_LOONGARCH_CPUCFG	"LINUX"
>  #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>  #define NN_LOONGARCH_CSR	"LINUX"
> diff --git a/tools/include/uapi/linux/elf.h b/tools/include/uapi/linux/el=
f.h
> index 5834b83d7f9a..21f225502051 100644
> --- a/tools/include/uapi/linux/elf.h
> +++ b/tools/include/uapi/linux/elf.h
> @@ -460,6 +460,8 @@ typedef struct elf64_shdr {
>  #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
>  #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
>  #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control=
 (prctl()) */
> +#define NT_RISCV_HW_BREAK	0x904
> +#define NT_RISCV_HW_WATCH	0x905
>  #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>  #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers=
 */
>  #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension regi=
sters */

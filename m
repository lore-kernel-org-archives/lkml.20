Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECD921A434
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834374; cv=none; b=A3CuBfE3A0LnVM25T9x4yNxI0G2WyL+fw1KgD8PkfJsPxJBm012h7d8zwzvuxk/w5Q6im8ASP7weK3GXBcw19XD186vLOoa1Bxo6N4W9PiIGLTrviPlda0/FCCY7NcdEu4x7riHeyBDSwcujOw7NB+3zj4bv55SryLu1BMOa1PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834374; c=relaxed/simple;
	bh=CO2kOUM7TRdFECxqr1r/jfAIjFWfUBLeC303UsBtMew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=allVJFiJYosX+JuUO1i/ndaZklyO/o6AbVSAbQwXteVZiJml7oWkbbnJdBLJMqq/Wdy24VdRwnFr7GS/ZnmmdZbGn09Uh3h0sNVtBK/C6RkcuVUwskh7VEYcef0wv3hPz4Hv2iV8Gcw2UapHpIRB0X6FMI2IYFOI1rtPOAHTD+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAXHz3kL5Bq4ERiBg--.38527S2;
	Thu, 27 Aug 2026 20:39:03 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: xujiakai2025@iscas.ac.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	dev.mbstr@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	qirui.001@bytedance.com,
	samuel.holland@sifive.com,
	zhangchunyan@iscas.ac.cn
Subject: Re: [PATCH v5] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Thu, 27 Aug 2026 20:38:48 +0800
Message-Id: <20260827123849.816-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1.windows.2
In-Reply-To: <20260705063656.237676-1-xujiakai2025@iscas.ac.cn>
References: <20260705063656.237676-1-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:rQCowAAXHz3kL5Bq4ERiBg--.38527S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF13Aw4Uuw1DZryDGFyxGrg_yoW3uw48pF
	Z8CFnrArZrKryIva4avrn7WFy5Jrs5W345KFW7Jw15Aa1rtFyrZr909as0qr1UAry0qa40
	qF12yws3Can0va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUC1v3UUUUU=
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRMMCWqP79DjiwAAst

gentle ping ?=0D
=0D
> The fp_is_valid() function uses ALIGN(sp, THREAD_SIZE) as the upper=0D
> bound for the frame pointer check. This bound is calculated relative=0D
> to the current sp and shifts upward when sp itself exceeds the valid=0D
> stack region, allowing the unwinder to read past the end of the=0D
> allocated task stack and triggering KASAN stack-out-of-bounds.=0D
> =0D
> Fix this by using absolute stack boundaries determined once before=0D
> the unwind loop:=0D
> =0D
> - When sp is on the task stack, use the task's pt_regs as the upper=0D
>   bound.=0D
> - When sp is on the overflow_stack (CONFIG_VMAP_STACK=3Dy), use the=0D
>   overflow_stack's top as the boundary.=0D
> - When sp is on the IRQ stack (CONFIG_IRQ_STACKS=3Dy), use the IRQ=0D
>   stack's top as the boundary.=0D
> - When sp is not on any known stack, warn and return.=0D
> - For remote tasks (task !=3D current), if sp is not on the task=0D
>   stack, warn and return since we cannot reliably determine the=0D
>   correct boundary from a different CPU's stacks.=0D
> =0D
> Make the DECLARE_PER_CPU(overflow_stack) unconditional in=0D
> asm/stacktrace.h so that stacktrace.c can use=0D
> IS_ENABLED(CONFIG_VMAP_STACK) instead of #ifdef, in line with the=0D
> kernel coding style which discourages the use of #ifdef in .c files=0D
> (https://docs.kernel.org/process/coding-style.html).  This is safe=0D
> because the DEFINE_PER_CPU (memory allocation) in traps.c remains=0D
> guarded by CONFIG_VMAP_STACK; the reference in stacktrace.c is only=0D
> compiled when IS_ENABLED(CONFIG_VMAP_STACK) evaluates to true.=0D
> =0D
> Fixes: a2a4d4a6a0bf ("riscv: stacktrace: fixed walk_stackframe()")=0D
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>=0D
> Assisted-by: YuanSheng:DeepSeek-V3.2=0D
> ---=0D
> V4 -> V5:=0D
> - Made DECLARE_PER_CPU(overflow_stack) unconditional in=0D
>   asm/stacktrace.h so that stacktrace.c can use IS_ENABLED()=0D
>   instead of #ifdef, as suggested by Nam Cao.=0D
> - Converted #ifdef CONFIG_VMAP_STACK to else if=0D
>   (IS_ENABLED(CONFIG_VMAP_STACK)) in walk_stackframe() and folded=0D
>   the overflow_stack and IRQ stack checks into a single if-else=0D
>   chain, eliminating the !high sentinel variable.=0D
> Link: https://lore.kernel.org/linux-riscv/20260630090535.4103888-1-xujiak=
ai2025@iscas.ac.cn/T/#u=0D
> =0D
> V3 -> V4:=0D
> - Switched to #include <asm/irq_stack.h> instead of hand-written=0D
>   DECLARE_PER_CPU, as suggested by Nam Cao.  This also fixes a=0D
>   build failure when CONFIG_IRQ_STACKS=3Dn since the header=0D
>   unconditionally declares irq_stack_ptr.=0D
> - Added dedicated overflow_stack handling (CONFIG_VMAP_STACK)=0D
>   with the correct 4 KiB boundary. v3 fell through to the 32 KiB=0D
>   IRQ stack bound when unwinding from the overflow_stack,=0D
>   triggering KASAN OOB reads past the small overflow_stack=0D
>   allocation. Reported by Sashiko AI review and reproduced by Xiao Wu.=0D
> - Changed the fallback else branch to warn and return instead of=0D
>   silently falling back to task_pt_regs(), as suggested by Nam Cao.=0D
> - For remote tasks (task !=3D current), bail out with a warning when=0D
>   sp is not on the task stack, since we cannot reliably use the=0D
>   local CPU's IRQ/overflow stacks as the boundary.=0D
> Link: https://lore.kernel.org/linux-riscv/20260625123906.211981-1-xujiaka=
i2025@iscas.ac.cn/T/#u=0D
> =0D
> V2 -> V3:=0D
> - Handled the case where sp is on the IRQ stack (CONFIG_IRQ_STACKS),=0D
>   as suggested by Nam Cao: when sp is not within the task stack=0D
>   range, use the IRQ stack's top (irq_stack_ptr + IRQ_STACK_SIZE)=0D
>   as the upper bound instead of task_pt_regs(), which would point=0D
>   to the wrong stack. The check uses the sp variable directly rather=0D
>   than on_thread_stack(), because on_thread_stack() reads the=0D
>   current CPU register sp which may differ from the unwinder's sp=0D
>   when regs is provided.=0D
> - Used IS_ENABLED(CONFIG_IRQ_STACKS) to guard the IRQ stack check,=0D
>   and cast irq_stack_ptr to unsigned long for byte-level arithmetic.=0D
> Link: https://lore.kernel.org/linux-riscv/20260517143704.659416-1-xujiaka=
i2025@iscas.ac.cn/T/#u=0D
> =0D
> V1 -> V2:=0D
> - Moved the NULL task check from fp_is_valid() into walk_stackframe(),=0D
>   as suggested by Matthew Bystrin.=0D
> - Changed the upper bound from task_stack_page(task) + THREAD_SIZE to=0D
>   task_pt_regs(task) for a tighter boundary, as suggested by Matthew=0D
>   Bystrin.=0D
> Link: https://lore.kernel.org/linux-riscv/20260514100711.838895-1-xujiaka=
i2025@iscas.ac.cn/t/#u=0D
> ---=0D
>  arch/riscv/include/asm/stacktrace.h |  8 +++++--=0D
>  arch/riscv/kernel/stacktrace.c      | 37 ++++++++++++++++++++++++-----=0D
>  2 files changed, 37 insertions(+), 8 deletions(-)=0D
> =0D
> diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm=
/stacktrace.h=0D
> index b1495a7e06ce..2d13c35a8c05 100644=0D
> --- a/arch/riscv/include/asm/stacktrace.h=0D
> +++ b/arch/riscv/include/asm/stacktrace.h=0D
> @@ -22,8 +22,12 @@ static inline bool on_thread_stack(void)=0D
>  }=0D
>  =0D
>  =0D
> -#ifdef CONFIG_VMAP_STACK=0D
> +/*=0D
> + * Declare unconditionally so that arch/riscv/kernel/stacktrace.c can us=
e=0D
> + * IS_ENABLED(CONFIG_VMAP_STACK) rather than #ifdef, in line with the ke=
rnel=0D
> + * coding style. The DEFINE_PER_CPU (memory allocation) remains guarded =
by=0D
> + * CONFIG_VMAP_STACK in traps.c.=0D
> + */=0D
>  DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overfl=
ow_stack);=0D
> -#endif /* CONFIG_VMAP_STACK */=0D
>  =0D
>  #endif /* _ASM_RISCV_STACKTRACE_H */=0D
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrac=
e.c=0D
> index c7555447149b..7a66c7ee2c81 100644=0D
> --- a/arch/riscv/kernel/stacktrace.c=0D
> +++ b/arch/riscv/kernel/stacktrace.c=0D
> @@ -12,6 +12,7 @@=0D
>  #include <linux/stacktrace.h>=0D
>  #include <linux/ftrace.h>=0D
>  =0D
> +#include <asm/irq_stack.h>=0D
>  #include <asm/stacktrace.h>=0D
>  =0D
>  #ifdef CONFIG_FRAME_POINTER=0D
> @@ -35,12 +36,12 @@=0D
>  extern asmlinkage void handle_exception(void);=0D
>  extern unsigned long ret_from_exception_end;=0D
>  =0D
> -static inline int fp_is_valid(unsigned long fp, unsigned long sp)=0D
> +static inline int fp_is_valid(unsigned long fp, unsigned long sp,=0D
> +			       unsigned long high)=0D
>  {=0D
> -	unsigned long low, high;=0D
> +	unsigned long low;=0D
>  =0D
>  	low =3D sp + sizeof(struct stackframe);=0D
> -	high =3D ALIGN(sp, THREAD_SIZE);=0D
>  =0D
>  	return !(fp < low || fp > high || fp & 0x07);=0D
>  }=0D
> @@ -48,7 +49,7 @@ static inline int fp_is_valid(unsigned long fp, unsigne=
d long sp)=0D
>  void notrace walk_stackframe(struct task_struct *task, struct pt_regs *r=
egs,=0D
>  			     bool (*fn)(void *, unsigned long), void *arg)=0D
>  {=0D
> -	unsigned long fp, sp, pc;=0D
> +	unsigned long fp, sp, pc, high =3D 0;=0D
>  	int graph_idx =3D 0;=0D
>  	int level =3D 0;=0D
>  =0D
> @@ -68,19 +69,43 @@ void notrace walk_stackframe(struct task_struct *task=
, struct pt_regs *regs,=0D
>  		pc =3D task->thread.ra;=0D
>  	}=0D
>  =0D
> +	if (!task)=0D
> +		task =3D current;=0D
> +=0D
> +	if (sp >=3D (unsigned long)task_stack_page(task) &&=0D
> +	    sp < (unsigned long)task_stack_page(task) + THREAD_SIZE) {=0D
> +		high =3D (unsigned long)task_pt_regs(task);=0D
> +	} else if (task !=3D current) {=0D
> +		pr_warn("%s: sp (%lx) is not in task stack of %s\n",=0D
> +			__func__, sp, task->comm);=0D
> +		return;=0D
> +	} else if (IS_ENABLED(CONFIG_VMAP_STACK) &&=0D
> +		   sp >=3D (unsigned long)this_cpu_ptr(overflow_stack) &&=0D
> +		   sp < (unsigned long)this_cpu_ptr(overflow_stack) + OVERFLOW_STACK_S=
IZE) {=0D
> +		high =3D (unsigned long)this_cpu_ptr(overflow_stack) + OVERFLOW_STACK_=
SIZE;=0D
> +	} else if (IS_ENABLED(CONFIG_IRQ_STACKS) &&=0D
> +		   sp >=3D (unsigned long)this_cpu_read(irq_stack_ptr) &&=0D
> +		   sp < (unsigned long)this_cpu_read(irq_stack_ptr) + IRQ_STACK_SIZE) =
{=0D
> +		high =3D (unsigned long)this_cpu_read(irq_stack_ptr) + IRQ_STACK_SIZE;=
=0D
> +	} else {=0D
> +		pr_warn("%s: sp (%lx) is not on any known stack\n",=0D
> +			__func__, sp);=0D
> +		return;=0D
> +	}=0D
> +=0D
>  	for (;;) {=0D
>  		struct stackframe *frame;=0D
>  =0D
>  		if (unlikely(!__kernel_text_address(pc) || (level++ >=3D 0 && !fn(arg,=
 pc))))=0D
>  			break;=0D
>  =0D
> -		if (unlikely(!fp_is_valid(fp, sp)))=0D
> +		if (unlikely(!fp_is_valid(fp, sp, high)))=0D
>  			break;=0D
>  =0D
>  		/* Unwind stack frame */=0D
>  		frame =3D (struct stackframe *)fp - 1;=0D
>  		sp =3D fp;=0D
> -		if (regs && (regs->epc =3D=3D pc) && fp_is_valid(frame->ra, sp)) {=0D
> +		if (regs && (regs->epc =3D=3D pc) && fp_is_valid(frame->ra, sp, high))=
 {=0D
>  			/* We hit function where ra is not saved on the stack */=0D
>  			fp =3D frame->ra;=0D
>  			pc =3D regs->ra;=0D
> -- =0D
> 2.34.1=


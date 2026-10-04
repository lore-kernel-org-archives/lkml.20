Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A13243956
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791103883; cv=pass; b=Dgr8kha6BHPu55lY71toA59ujPcNuf90bpX1KMB6PACts7xa7FGUYciXNMgz7DKI94WfDOr6pnSiPkt5qRr/EJosnQWG3Pgbk+nG9lOSj+yydvH/Cd2CYDgXi90V6cYSEqcaifygLzZuaP/GK6jdrHwrmN6mX0+nzJ4FMg87RxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791103883; c=relaxed/simple;
	bh=a3dq4F5hZcch0kXBpQkEeinaRCHGax4kQvnENoiYn/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgwRtRodMWJefTaWLTY5ESrWLfuhf4Hc8aewcqzquDwioPt7ao16kpCmCpW6JtgcTuCTfYflRKyI5kvxd1ITgBMacxN22rXFWgAtCojypC5foyx7KUZD+0474S0/SpslpU8ucRqbYF6hcWCbQhtGKoweH7yWWeztDimyM0LzWnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9TyHVYP; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9TyHVYP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1442993a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 01:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791103879; cv=none;
        d=google.com; s=arc-20260327;
        b=rj1/ynnnhevtXy0eBK8FcCliuqRMu4SLWeeiXAF58sqeONdPWnW3rItETDGAfpu3Mv
         8MgZjDVRJDtiWgU0ixrKWS6vhnae2eOYMT32SmeGZX4vUf/zGf4KhQPl5TPPMa0ypivN
         61/1qZNkDfeDF9qXrlFYHiZt8iG0iiis/rHSi5L464ZQyiCTK2kZvMkgZEJJpwWM1J/u
         4c1zrOzR5L161DVwMVf8GD2hTRJjh3bDL3QgED1Y+JXN0jTk3RC7VUOxTAubMfDm5Q3q
         MVyNlF6r0scpb6Ch2puJRE6xf9tvNKKrs3OPM+dPiy7FPfUJE8K3aBZiuBu57FgZfjlW
         6Qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IE3W/S+XItDaS0v98Y+ZUAiffd5bjG5l0VA34Ly11+M=;
        fh=KpL59nqUIOVTREo5wD6N1CRN3v70bR2Tgwx3/w5ojq4=;
        b=j7lz1/GmC/c6AXgYvcdDrY4QTU3Y5ULBDMnasSbBi2OPHDnt8xS0kSLBrc9JeC61kZ
         5Q0vdr/wztmUUaweqvE3wkrwqrnTF/QdfP498C1zkcDDn/necBtuRxyNci9iyejCUa//
         90y9NewbQ2sruFb9R9UQLLn3sb7DhztsIn1qS77CwV7bLbloLy4PZXDDG/yI+wvxbt3D
         6sI4ECUAZjSF41DpCVwPAbNFBV9pN22oFBNerl3Dwc7wX5MYko3MT7O3l5Tbuh/rw8uX
         XV0DQ3Rmi8JnCkM4oFWaIBILGB3ngRUKHFK7/TcMJI6h2P2yrXI+6ZXrtA6iVdgTHop1
         sD5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791103879; x=1791708679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IE3W/S+XItDaS0v98Y+ZUAiffd5bjG5l0VA34Ly11+M=;
        b=f9TyHVYPwZPuID0bEQBBMQ+acvHfO2TAS3TyEvQeMmySB5xFHrnAFHrq1qex0zhQfR
         oQ4kM5p/Q1NvLrVhP9VIwh4UGSEaf4sY8TDyUNGghz21meuD/iSPD2LBj8SAVqpbEyTl
         1UvWMPmPu2I0fsrsr6CJ2HgSlOHinlRBwkj2wLzzYanSb0PaLOU1bwkjBe1P+QwloG7Y
         rKFg8K6n9P6I6+pRobOBw9ui7pJM3JBlC1xW2fzcKyH8opkzlnuquOi5GeF5CzzazCe9
         u29X+yO/LxvNFy/EEjP/+eipG0/O25RnA5jf75n+PRoQNZ6xwLsoa/zSMMje5ExQK9dK
         UG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791103879; x=1791708679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE3W/S+XItDaS0v98Y+ZUAiffd5bjG5l0VA34Ly11+M=;
        b=upRP6we+4c4Zk2EJFxY3qhbwU82DfGVUVysdHxncKJwSSFycMh3xWUoK8jrwX9VKMd
         l2cQxWzo+HKfx8GHEiTwWAEbUzgnEyJJ6xtFDvwpHmvld/BFJUJSsv8t3iDIq3UACqVX
         Ip5+1XoYlcxw7klJy+t+o1Skv23Qg7EVVPodjUHZT8JWZuATVa8ZYHAi5i7OwSKg7Mei
         3JDMJfPAbciBUNw4B5FLR7CKqWSQRPx5/BE0SzuoI/DSqvRfaQe9mNqqw3KPpRGMZoDR
         odFVU60sMYYyW31k8Vlex7vBC/Ci6v1K3nvbjPNFRt5e7wagOVJ3CxzP94G40TBGT49X
         Nlmg==
X-Forwarded-Encrypted: i=1; AKwUvBzhGTyo80O8tzojHuIIA7vS4jYnEnKGlC14JWHPYEb7IHC51gGvSTalsrCDF2lfxnqcgFK0rNtYTiqvRLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgYqln5E3HZYXSZH2+73SiXgXHe7AZTs/iE6PluUZuOlW7tYkv
	xvyZQ6yZiKmgvpy0fTlHKFCBjTUkkTEhfF0CjPIwuCTyxv2pOU0niQgZBNIhhb2MRIE7geB/LtF
	0l3keYPZj2gevGF+X0gFCJBtH+6sQOgo=
X-Gm-Gg: AYBFou1DEKRWMDmNBbzSRInZ0XzwhH+MD79SYBCN0yItWLs3ipllychl4n7EBLPMO2A
	882V+J8QAdnhWc3Axj4JLnE5mGt/xbcwXe7RRPrKRCq1y/PpA+UOZ1Soi9HiDF5aKQxDMn/X4/O
	9rv0ZGVud2aF/EFlcPLuOFMW+1+VPEqRP72dNHVo+b2wPsX97Yywnxp4Rhs3QivcLnk9JVXRPk8
	WZuQFOP1ullt0WxhoXr6AkxZswm8ExBd8X6tl8fIlfh63Lo8WN9O/z6SIoc0SqDwtr9RQb07pbo
	47HbtADVgE7/+xYZrvOPzTFzrDtrsXdrC39HHdsIcqCQ9HkZdKcbPhM/dsyHtIN1IOluV0p41nr
	hi2MxU6aVCU3QiULBU9QdnPBp9iVe4fCQ9N/z+g3ebw==
X-Received: by 2002:a05:6402:4595:b0:6ab:e30:c9ac with SMTP id
 4fb4d7f45d1cf-6afad732328mr3533378a12.6.1791103879028; Sun, 04 Oct 2026
 01:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927005821.8369-1-kaloz@kernel.org> <20260927005821.8369-2-kaloz@kernel.org>
In-Reply-To: <20260927005821.8369-2-kaloz@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 4 Oct 2026 10:51:07 +0200
X-Gm-Features: AclHuK9KY8WlCdIqvjnP4WQZk1D_MtjB20nxukAu_h3NNW66dw1F-VEMknyuhjU
Message-ID: <CA+=Fv5SMMMa=tBKkanp0xp9ZU6FtxqJiqgOShotmRs9QNXjuzQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] sparc32: support futexes on SMP
To: Imre Kaloz <kaloz@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Imre,

On Sun, Sep 27, 2026 at 2:59=E2=80=AFAM Imre Kaloz <kaloz@kernel.org> wrote=
:
>
> asm-generic/futex.h provides the futex atomic ops for UP only, so FUTEX
> has depended on !(SPARC32 && SMP).
>
> Implement them in atomic32.c for both. LEON parts that implement casa
> run it on the user word, as user code updates the word with casa there
> and takes no kernel lock. Other CPUs have no compare-and-swap; the ops
> serialize on __atomic_hash, which lets a kernel emulation of user casa
> share the lock.
>
> casa is optional on LEON, so it is probed once at boot. On a part
> without it the kernel-mode illegal_instruction is fixed up from the
> exception table.
>
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  arch/sparc/include/asm/futex_32.h |   6 +-
>  arch/sparc/kernel/traps_32.c      |  13 +++-
>  arch/sparc/lib/atomic32.c         | 122 ++++++++++++++++++++++++++++++
>  init/Kconfig                      |   1 -
>  4 files changed, 139 insertions(+), 3 deletions(-)
>
> diff --git a/arch/sparc/include/asm/futex_32.h b/arch/sparc/include/asm/f=
utex_32.h
> index 6a332a9f099c..2271aad566f8 100644
> --- a/arch/sparc/include/asm/futex_32.h
> +++ b/arch/sparc/include/asm/futex_32.h
> @@ -1,6 +1,10 @@
>  #ifndef _ASM_FUTEX_H
>  #define _ASM_FUTEX_H
>
> -#include <asm-generic/futex.h>
> +#include <linux/types.h>
> +
> +int arch_futex_atomic_op_inuser(int op, u32 oparg, int *oval, u32 __user=
 *uaddr);
> +int futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
> +                                 u32 oldval, u32 newval);
>
>  #endif
> diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
> index bb149f6cc34b..e1d50820c376 100644
> --- a/arch/sparc/kernel/traps_32.c
> +++ b/arch/sparc/kernel/traps_32.c
> @@ -11,6 +11,7 @@
>   */
>
>  #include <linux/cpu.h>
> +#include <linux/extable.h>
>  #include <linux/sched/mm.h>
>  #include <linux/sched/debug.h>
>  #include <linux/mm_types.h>
> @@ -108,8 +109,18 @@ void do_hw_interrupt(struct pt_regs *regs, unsigned =
long type)
>  void do_illegal_instruction(struct pt_regs *regs, unsigned long pc, unsi=
gned long npc,
>                             unsigned long psr)
>  {
> -       if(psr & PSR_PS)
> +       if (psr & PSR_PS) {
> +               const struct exception_table_entry *entry;
> +
> +               /* The casa probe on a CPU without casa. */
> +               entry =3D search_exception_tables(pc);
> +               if (entry) {
> +                       regs->pc =3D entry->fixup;
> +                       regs->npc =3D regs->pc + 4;
> +                       return;
> +               }
>                 die_if_kernel("Kernel illegal instruction", regs);
> +       }
>  #ifdef TRAP_DEBUG
>         printk("Ill instr. at pc=3D%08lx instruction is %08lx\n",
>                regs->pc, *(unsigned long *)regs->pc);
> diff --git a/arch/sparc/lib/atomic32.c b/arch/sparc/lib/atomic32.c
> index 8ae880ebf07a..be712c2917d5 100644
> --- a/arch/sparc/lib/atomic32.c
> +++ b/arch/sparc/lib/atomic32.c
> @@ -9,8 +9,13 @@
>   */
>
>  #include <linux/atomic.h>
> +#include <linux/futex.h>
> +#include <linux/init.h>
>  #include <linux/spinlock.h>
>  #include <linux/module.h>
> +#include <linux/uaccess.h>
> +#include <asm/cpu_type.h>
> +#include <asm/futex.h>
>
>  #ifdef CONFIG_SMP
>  #define ATOMIC_HASH_SIZE       4
> @@ -195,3 +200,120 @@ unsigned long __xchg_u32(volatile u32 *ptr, u32 new=
)
>         return (unsigned long)prev;
>  }
>  EXPORT_SYMBOL(__xchg_u32);
> +
> +/* Only some LEON parts implement casa. */
> +static bool sparc32_casa __ro_after_init;
> +
> +static int __casa_user(u32 *uval, u32 __user *uaddr, u32 oldval, u32 new=
val)
> +{
> +       /*
> +        * casa [%o0] 0xb, %o1, %o2, as a word any assembler accepts. ASI
> +        * 0x0b is the supervisor address space; the emulated casa in
> +        * cas_emu_32.c instead accepts the user ASIs 0x0a and 0x80.
> +        */
> +       register u32 __user *uaddr_r asm("o0") =3D uaddr;
> +       register u32 oldval_r asm("o1") =3D oldval;
> +       register u32 newval_r asm("o2") =3D newval;
> +       int ret =3D 0;
> +
> +       __asm__ __volatile__(
> +       "1:     .word   0xd5e20169\n"
> +       "2:\n"
> +       "       .section .fixup,#alloc,#execinstr\n"
> +       "       .align  4\n"
> +       "3:     sethi   %%hi(2b), %0\n"
> +       "       jmpl    %0 + %%lo(2b), %%g0\n"
> +       "        mov    %4, %0\n"
> +       "       .previous\n"
> +       "       .section __ex_table,#alloc\n"
> +       "       .align  4\n"
> +       "       .word   1b, 3b\n"
> +       "       .previous\n"
> +       : "+r" (ret), "+r" (newval_r)
> +       : "r" (uaddr_r), "r" (oldval_r), "i" (-EFAULT)
> +       : "memory");
> +
> +       *uval =3D newval_r;
> +       return ret;
> +}
> +
> +/* Without casa the illegal_instruction trap takes the fixup above. */
> +static int __init sparc32_casa_probe(void)
> +{
> +       u32 word =3D 0, val;
> +
> +       if (sparc_cpu_model =3D=3D sparc_leon)
> +               sparc32_casa =3D !__casa_user(&val, (u32 __force __user *=
)&word,
> +                                           0, 1);
> +       return 0;
> +}
> +early_initcall(sparc32_casa_probe);
> +
> +/*
> + * Without casa, user CAS is emulated under the same lock. ATOMIC_HASH()
> + * uses page offset bits only, so every mapping of a word takes one lock=
.
> + */
> +int futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
> +                                 u32 oldval, u32 newval)
> +{
> +       unsigned long flags;
> +       u32 val;
> +       int ret;
> +
> +       if (!access_ok(uaddr, sizeof(u32)))
> +               return -EFAULT;
> +       if (sparc32_casa)
> +               return __casa_user(uval, uaddr, oldval, newval);
> +
> +       /* Every caller already runs with page faults disabled. */
> +       spin_lock_irqsave(ATOMIC_HASH(uaddr), flags);
> +       ret =3D __get_user(val, uaddr);
> +       if (!ret && val =3D=3D oldval)
> +               ret =3D __put_user(newval, uaddr);
> +       spin_unlock_irqrestore(ATOMIC_HASH(uaddr), flags);
> +
> +       if (!ret)
> +               *uval =3D val;
> +       return ret;
> +}
> +
> +int arch_futex_atomic_op_inuser(int op, u32 oparg, int *oval, u32 __user=
 *uaddr)
> +{
> +       u32 oldval, newval, val;
> +       int ret;
> +
> +       if (get_user(oldval, uaddr))
> +               return -EFAULT;
> +
> +       for (;;) {
> +               switch (op) {
> +               case FUTEX_OP_SET:
> +                       newval =3D oparg;
> +                       break;
> +               case FUTEX_OP_ADD:
> +                       newval =3D oldval + oparg;
> +                       break;
> +               case FUTEX_OP_OR:
> +                       newval =3D oldval | oparg;
> +                       break;
> +               case FUTEX_OP_ANDN:
> +                       newval =3D oldval & ~oparg;
> +                       break;
> +               case FUTEX_OP_XOR:
> +                       newval =3D oldval ^ oparg;
> +                       break;
> +               default:
> +                       return -ENOSYS;
> +               }
> +
> +               ret =3D futex_atomic_cmpxchg_inatomic(&val, uaddr, oldval=
, newval);
> +               if (ret)
> +                       return ret;
> +               if (val =3D=3D oldval)
> +                       break;
> +               oldval =3D val;
> +       }
> +
> +       *oval =3D oldval;
> +       return 0;
> +}
> diff --git a/init/Kconfig b/init/Kconfig
> index 8583d9f06c52..9eb8086af7db 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1875,7 +1875,6 @@ config BASE_SMALL
>
>  config FUTEX
>         bool "Enable futex support" if EXPERT
> -       depends on !(SPARC32 && SMP)
>         default y
>         imply RT_MUTEXES
>         help
> --
> 2.47.3
>

Tested on a real SPARCstation 20 (SMP), on both a HyperSPARC and a
SuperSPARC-II module. Raw FUTEX_WAIT/WAKE and FUTEX_LOCK_PI/UNLOCK_PI
all work on both (no more ENOSYS), and an 8-thread pthread_mutex
contention test (1.6M locked increments) finished with zero lost
updates on both CPUs.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

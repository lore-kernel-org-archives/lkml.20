Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16CE3AA4F8
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792310886; cv=pass; b=uiiUjALL8ub/t+0M0Guol8LE6VOjcELMzR0t/HHoTsSKp/ygPIUJo/bFN31zL//W8H3PH77Xu//n5meP3yA0oss4gX/aN+DZECH2lRPzkT45e5u03P01+jvRphDy1Mt7/VXNuMdauqnX9XkPBqEKkCS55VBOUM7A4o02czQ4Y6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792310886; c=relaxed/simple;
	bh=y5XFEsvnDCd+UySf+pmbl1sH78HpJs5GMPMF7q8dor4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JeRYAXALLn3tAwxxfJTDfLyzdl/oHUy8OfSwd4HEGAQ/En2apXMbpGAyDCo9cua1E4kIUvN9PAt2Al1ZuQfgn+Ea3OneUyZiowtFT03+LdQfe4QS/tOyz2GtDOpnyXLQtQ++5bU0uGThQdh5yhHN31rhma6VdieMGSkl+S7NJ9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Onc8bUu6; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Onc8bUu6"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1513091a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:08:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792310883; cv=none;
        d=google.com; s=arc-20260327;
        b=IsOYzweBjpCCJKkSmjavTAqNCo3n1VelcqR2p17oVw8R0OlzlPpBZOfNDACY876inj
         87E6uWAMM8j2EAZ+2OqSj1VfdrQI/RPahU50YTKx68IRd2rhnegkNyoq5Jq5V2UquHJn
         /Dfk1NoHjMBBaUVtlF5dcjCdW9NsphivddmLr5N9ijRqLrmcm/HhI2nf8TjfK6owAgPM
         SijhICwJ/5K1XOQTqFSoCjycsjh7jHayhQ+wUAk0w3NaX4tYxRJhSQGmMqDfoGUa6vj0
         X9eVAF5dXOqMGTLaBny6N3QSxjWByuWC+kZaC5Fel4nAEzQvR1jJB1z2ZL56TrXIAV9G
         SCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ilZ4wI/E3Hj/jf8XjpsaqFvh6n8hcaWUBtaKdqcYMKQ=;
        fh=3iIiW8i26I6zaFV8L5Xbe93O1hbVB7Thn92zb9Swa+k=;
        b=hQYXM2aRE7FQHgHZ75pbtOXcb7ni56lKEoWJQTHGOB7a4Wbt8lJZZ8LSiiA+AfXJVF
         xAmwGA3TwRLwCt7NaTb/AQwKunVKcmjDXU0gnuEbHlqJCr6KUYTDmhMZLzmgmkg8zG7a
         Na183/PJLuU3zvRbmdik0sfqywrKgWqzlPD2JKqPaw7Ar4b4UYdkHcnsvVifiCEORyGT
         noFwp8at+uD/YUgngCKNnlVekgMV1MG54vVZNPq2YHg0SH24BI/N6MZ/7HezlQ9ji809
         ifJUcT2VWaQHbAj//YNDgZbWZqEk85v9Kk4TBi+skc8OL9y45IxwH6KnfJ+u9pdbuXaJ
         5HAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792310883; x=1792915683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ilZ4wI/E3Hj/jf8XjpsaqFvh6n8hcaWUBtaKdqcYMKQ=;
        b=Onc8bUu6Ldi4XCsQHhnBDZGF/IKxuk/7Anei7g8kAksDx4lzKGOeRf5pgv8Jbkq4em
         asMw3+EAELQV/eEXDuh+tvpQ82ASTWawjQlFT9gOQzigu91G5zlR5Ua/i98mlWR8ufvB
         3ZJKMcadaYj5RDNS1nHn5OI39AvDxd4eoqkMrZ/+bLUle2LIBcZHMfE0VFDSs/xB9XMk
         QTogOwp/lhPdyXGuRm3/Ol8yqgxBDNDUjxXkun9KmJcTjUnj7NZvDq6A1bOhfFtFi1XZ
         4vd+DndliPFDI9oCO6D8KM6ZapX6H/vnhXJaK8iSjY0RiDOXZaUMvHGekP7a7qHX/Fgm
         /D6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792310883; x=1792915683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilZ4wI/E3Hj/jf8XjpsaqFvh6n8hcaWUBtaKdqcYMKQ=;
        b=VBemf2RqqpZOoxCjX3FynryrUzHpMi8YuMahiLx8JcqVWb6pghJtV7j/wK/S+42zyE
         +VrWj3j9Zvb8VG9sf6fDuhOj7ylFZ8w5PZRslRwrfrivHdayKJ3RPF8QFm5ZHobGj5iw
         zYxisUe2kMPHQeKgcHBpArwDhNluU0TrI4fOwTk2pCqoLiY0iYS673DgmTkm8YmgCmlr
         5YbZB7QVWjBo1cCI2THEZogy0WHrY4RzL+2x1sb2szF02+KK23CeDA8nwHokKXUdbdST
         PXjmCnkimGjG+PQYaPZheFNLkiA+lsQJptUmahYzeJ/Kj+1u2U0QuaD8yKqyxg/rIekL
         6mPA==
X-Forwarded-Encrypted: i=1; AKwUvBwH2MTxq/kENlgxvzblBPhQoffuRrAXUB6fsNgWzzIQ9vtFjEYxyUQ7kbTH+QMwKpSwS+4BRaKsdjhvHo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOlCcYkFwsRdww3pSbQlXfF3MTGvuwrf5T0JX+LpvlsQ6sw76K
	+MeidwksHyD1BF1IzJSgBDq5r4gnAGcHqqrG6nQg4x89TAyh3SgZc+SWplhQfKREVdEY9oqcUtm
	OAXPg7/0Yc7Gj4l1lwwCObx7ORml5wKg=
X-Gm-Gg: AYBFou2GRM4UvztE+T+gSaWlBJP3wjQypMf/evzrpJR8dabVkD0oKeEOLnMzbHdSCBU
	O8gIzkWcpPP3oMuLQ9F7vNfdOyqmc7k5sEzN9RQfa/9h/mwMFCdmAfDaElnpStf8UgnL9ja2d/J
	Sj3h/z+0FIowSsx9z9dOpJWsz3QNv1Fuaq6dJR4CwxSml7HHHuV8NMvPh6aLUlHYVPJ9poQsNAj
	d72kon0bmmA6LPo2xiaY40HpkJPuE7FYgUASpGNMIuzUs/RJ1wuFeA+gPCAzELxPzmopGK0uIcu
	g9o8oU0saghmVVqfiHgyS3xaODgy58x7dt5y5kF+675v1MscJaoC6g6ZnLYeIb+5vSF6YC9eMU1
	KS9/1hUVx0mWyIf9YL/firovb9d7z6h1JH+9A2uil+A==
X-Received: by 2002:a05:6402:2706:b0:6b1:e4cb:a23e with SMTP id
 4fb4d7f45d1cf-6b3a8173599mr2673068a12.14.1792310882887; Sun, 18 Oct 2026
 01:08:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com> <20261016-alpha-perf-regs-v3-v2-4-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-4-17654742226a@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 10:07:51 +0200
X-Gm-Features: AclHuK-VNsafBbC0UElzSysk3-G5WNDIzbQ-ccYV-utxuPfu6H2A1XeMjX_M9H0
Message-ID: <CA+=Fv5TmOWVV379PuTV+7Zhbq9MziJ4Jt9pr_gxvvnz_ca6RXg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP
 support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 17, 2026 at 3:56=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Let perf sample registers and dump the user stack, which is what the
> perf tool needs for --call-graph dwarf.
>
> The register indices follow the hardware numbering, so r0-r30 map
> directly to DWARF register numbers, with pc after them. r9-r15
> are callee-saved and live in switch_stack rather than pt_regs, so they
> cannot be sampled. Without r15 an unwinder cannot recover the CFA of a
> first frame that uses $15 as its frame pointer.
>
> sp is not in pt_regs either: for user frames it comes from
> user_stack_pointer(), and for kernel frames (PERF_SAMPLE_REGS_INTR) it
> is the end of the trap frame, as in stacktrace.c.
>
> Software events such as context switches and tracepoints hand perf a
> per-CPU pt_regs filled in by perf_fetch_caller_regs() instead of a
> trap frame. It is not on the stack and has no room for sp, so report
> sp as 0 there rather than the address of the per-CPU buffer.
>
> Assisted-by: Claude:claude-opus-5-5
> Acked-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  .../features/perf/perf-regs/arch-support.txt       |  2 +-
>  .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
>  arch/alpha/Kconfig                                 |  2 +
>  arch/alpha/include/uapi/asm/perf_regs.h            | 45 +++++++++++++++
>  arch/alpha/kernel/Makefile                         |  1 +
>  arch/alpha/kernel/perf_regs.c                      | 64 ++++++++++++++++=
++++++
>  6 files changed, 114 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/features/perf/perf-regs/arch-support.txt b/Doc=
umentation/features/perf/perf-regs/arch-support.txt
> index 4c9a5a012075..7d736d678fd4 100644
> --- a/Documentation/features/perf/perf-regs/arch-support.txt
> +++ b/Documentation/features/perf/perf-regs/arch-support.txt
> @@ -6,7 +6,7 @@
>      ---------add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support---=
-----------
>      |         arch |status|
>      -----------------------
> -    |       alpha: | TODO |
> +    |       alpha: |  ok  |
>      |         arc: | TODO |
>      |         arm: |  ok  |
>      |       arm64: |  ok  |
> diff --git a/Documentation/features/perf/perf-stackdump/arch-support.txt =
b/Documentation/features/perf/perf-stackdump/arch-support.txt
> index dd362b5cb638..17b84ea7769d 100644
> --- a/Documentation/features/perf/perf-stackdump/arch-support.txt
> +++ b/Documentation/features/perf/perf-stackdump/arch-support.txt
> @@ -6,7 +6,7 @@
>      -----------------------
>      |         arch |status|
>      -----------------------
> -    |       alpha: | TODO |
> +    |       alpha: |  ok  |
>      |         arc: | TODO |
>      |         arm: |  ok  |
>      |       arm64: |  ok  |
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index b2c359b947f6..8fafbfabd1e5 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -41,6 +41,8 @@ config ALPHA
>         select HAVE_PAGE_SIZE_8KB
>         select HAVE_PCSPKR_PLATFORM
>         select HAVE_PERF_EVENTS
> +       select HAVE_PERF_REGS
> +       select HAVE_PERF_USER_STACK_DUMP
>         select NEED_DMA_MAP_STATE
>         select NEED_SG_DMA_LENGTH
>         select GENERIC_IRQ_PROBE
> diff --git a/arch/alpha/include/uapi/asm/perf_regs.h b/arch/alpha/include=
/uapi/asm/perf_regs.h
> new file mode 100644
> index 000000000000..da96a31b12fb
> --- /dev/null
> +++ b/arch/alpha/include/uapi/asm/perf_regs.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_ASM_ALPHA_PERF_REGS_H
> +#define _UAPI_ASM_ALPHA_PERF_REGS_H
> +
> +/*
> + * Indices 0-30 match the hardware (and DWARF) register numbers.
> + * r9-r15 are not saved in pt_regs and cannot be sampled.
> + */
> +enum perf_event_alpha_regs {
> +       PERF_REG_ALPHA_R0,
> +       PERF_REG_ALPHA_R1,
> +       PERF_REG_ALPHA_R2,
> +       PERF_REG_ALPHA_R3,
> +       PERF_REG_ALPHA_R4,
> +       PERF_REG_ALPHA_R5,
> +       PERF_REG_ALPHA_R6,
> +       PERF_REG_ALPHA_R7,
> +       PERF_REG_ALPHA_R8,
> +       PERF_REG_ALPHA_R9,
> +       PERF_REG_ALPHA_R10,
> +       PERF_REG_ALPHA_R11,
> +       PERF_REG_ALPHA_R12,
> +       PERF_REG_ALPHA_R13,
> +       PERF_REG_ALPHA_R14,
> +       PERF_REG_ALPHA_R15,
> +       PERF_REG_ALPHA_R16,
> +       PERF_REG_ALPHA_R17,
> +       PERF_REG_ALPHA_R18,
> +       PERF_REG_ALPHA_R19,
> +       PERF_REG_ALPHA_R20,
> +       PERF_REG_ALPHA_R21,
> +       PERF_REG_ALPHA_R22,
> +       PERF_REG_ALPHA_R23,
> +       PERF_REG_ALPHA_R24,
> +       PERF_REG_ALPHA_R25,
> +       PERF_REG_ALPHA_R26,
> +       PERF_REG_ALPHA_R27,
> +       PERF_REG_ALPHA_R28,
> +       PERF_REG_ALPHA_GP,
> +       PERF_REG_ALPHA_SP,
> +       PERF_REG_ALPHA_PC,
> +       PERF_REG_ALPHA_MAX,
> +};
> +
> +#endif /* _UAPI_ASM_ALPHA_PERF_REGS_H */
> diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
> index 4ea5c189e60e..0c04b89676ed 100644
> --- a/arch/alpha/kernel/Makefile
> +++ b/arch/alpha/kernel/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_PCI)     +=3D pci.o pci_iommu.o pci-sysfs.=
o
>  obj-$(CONFIG_SRM_ENV)  +=3D srm_env.o
>  obj-$(CONFIG_MODULES)  +=3D module.o
>  obj-$(CONFIG_PERF_EVENTS) +=3D perf_event.o
> +obj-$(CONFIG_HAVE_PERF_REGS) +=3D perf_regs.o
>  obj-$(CONFIG_RTC_DRV_ALPHA) +=3D rtc.o
>  obj-$(CONFIG_AUDIT)    +=3D audit.o
>
> diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.=
c
> new file mode 100644
> index 000000000000..33ea2e831ba0
> --- /dev/null
> +++ b/arch/alpha/kernel/perf_regs.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bits.h>
> +#include <linux/perf_event.h>
> +#include <linux/sched/task_stack.h>
> +#include <asm/perf_regs.h>
> +
> +#define REG(idx, field) \
> +       [PERF_REG_ALPHA_##idx] =3D offsetof(struct pt_regs, field)
> +
> +#define REG_RESERVED   (~GENMASK_ULL(PERF_REG_ALPHA_MAX - 1, 0) | \
> +                        GENMASK_ULL(PERF_REG_ALPHA_R15, PERF_REG_ALPHA_R=
9))
> +
> +static const unsigned int pt_regs_offset[PERF_REG_ALPHA_MAX] =3D {
> +       REG(R0, r0),    REG(R1, r1),    REG(R2, r2),    REG(R3, r3),
> +       REG(R4, r4),    REG(R5, r5),    REG(R6, r6),    REG(R7, r7),
> +       REG(R8, r8),    REG(R16, r16),  REG(R17, r17),  REG(R18, r18),
> +       REG(R19, r19),  REG(R20, r20),  REG(R21, r21),  REG(R22, r22),
> +       REG(R23, r23),  REG(R24, r24),  REG(R25, r25),  REG(R26, r26),
> +       REG(R27, r27),  REG(R28, r28),  REG(GP, gp),    REG(PC, pc),
> +};
> +
> +u64 perf_reg_value(struct pt_regs *regs, int idx)
> +{
> +       if (idx =3D=3D PERF_REG_ALPHA_SP) {
> +               if (user_mode(regs))
> +                       return user_stack_pointer(regs);
> +               /*
> +                * Software events built by perf_fetch_caller_regs() use =
a
> +                * per-CPU pt_regs rather than a trap frame, and pt_regs =
has
> +                * nowhere to record sp, so report none.
> +                */
> +               if (!object_is_on_stack(regs))
> +                       return 0;
> +               /* Same kernel sp approximation as stacktrace.c. */
> +               return (unsigned long)(regs + 1);
> +       }
> +
> +       if (WARN_ON_ONCE((u32)idx >=3D PERF_REG_ALPHA_MAX ||
> +                        BIT_ULL(idx) & REG_RESERVED))
> +               return 0;
> +
> +       return *(unsigned long *)((void *)regs + pt_regs_offset[idx]);
> +}
> +
> +int perf_reg_validate(u64 mask)
> +{
> +       if (!mask || mask & REG_RESERVED)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +u64 perf_reg_abi(struct task_struct *task)
> +{
> +       return PERF_SAMPLE_REGS_ABI_64;
> +}
> +
> +void perf_get_regs_user(struct perf_regs *regs_user,
> +                       struct pt_regs *regs)
> +{
> +       regs_user->regs =3D task_pt_regs(current);
> +       regs_user->abi =3D perf_reg_abi(current);
> +}
>
> --
> 2.55.0
>

Retested on my AlphaServer ES40. Synthetic context-switch and
sched_switch samples now report SP=3D0 as intended. Register sampling,
user stack dumps and DWARF unwinding also passed, with the documented
r15 limitation.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus

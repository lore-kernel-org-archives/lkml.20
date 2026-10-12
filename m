Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED954AA417
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821926; cv=pass; b=TKCjB0EtmQh8iV1QFYSlUZZW6lIwYDIfCkaKDPa4r0Ra33jLtErBxVihIKawH7iqKJ/qP1AKYPJucJt4gR2UZXcCJhGW4xluycTFkw08+j1oFfjjAzT6R/nvcBaXAcgBHZKvy+W11mdscC59fqEfgcOnDa9onf27Mmntq35kgnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821926; c=relaxed/simple;
	bh=qvVpEPzOzLifjD/7DmAg+LNyF2ciqW2crgsJsv4fMNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcPsiHMRpTU0lrfAbf7ZAU2Ax0VlfdJtoMmYpnlqZAm3JgXfJslJvlzysr233bvA7RtSfh3LrdLLfmh9KTYD3ML4EbN4hMeB/MKOw42KexfElLKrfnmXEsrxW/FCC93qVnDHdULlX4z2afuu9h/uXYKujc3itSmexzvkUPrIpMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsPS4BD7; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsPS4BD7"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c350db5a761so163545566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791821924; cv=none;
        d=google.com; s=arc-20260327;
        b=K/AC97ll8KeKK3Iau6fRIRjipMtvMdPxMDsfOWXACtGI+FcaDQ96jzrrrZ8s/jeGRp
         OkW/E2ArSzVozLxASNLbIonwzOXlfLxfqMnjkqJ6xcPD6bL93GMu9IH7KXrJ2AOlAfAi
         uBA2QXakeMCrfab/To1oG2QFgK/31iSKE569CEs2f/CMQiP+kqM88uPSFaCbmtoKGIBL
         WPDTs0+pBKuMU3JvxbmtrRqS8IaQIIkhTWZoVgxcHwYNANV30pqpCFHuBisoq4bSCx6M
         rQRe3RrECe5Pi4rFM5NgWMpR62T/bVtqgPu3UwuI4JAh/3KPhvQ6W9TvCk6HISSlyZNM
         pSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUeAR5YurRmrLyPWT1WYCY1/iIz0jhnPKKa1Syh0wXc=;
        fh=DIQjUfG3KX2G4wCwDugM2NqEOLNDBxnHl9C8IaNSLZU=;
        b=oVIwjUXrVWBgB6p7E0R8vcP+G4/uS5f2dWkv+ZN+Icz9Lg/aCwTz9Jz94CknGvUWj9
         d6CM962wMkMGsPLc7rcXViYUVd/3RrcgSG5UbdFJ6ZfkPzzvyrk8z/95MT+KPjAaYHZW
         XvhOyR51NMCJirRtbGFc8IeM1pPABq1mDgjv+mAIE71+jnThiXFdoyRxZvytbofCfuWm
         OpxSfVgD36FpiTb6NrsgKnD5n2o7CxhQ6GKakU/w0d/iKJBGFSoJcY0XcnYfq7f0sPas
         jFlfn9aICB+WFnZTO6xJ6CCOMsmBP+sr3sRIrEgA2l6WMINNvfMvdyFZaXhL+22opLR+
         d2JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791821924; x=1792426724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUeAR5YurRmrLyPWT1WYCY1/iIz0jhnPKKa1Syh0wXc=;
        b=PsPS4BD7m2jkgUCxRdMk0FNY2z5ZY59lAfo1Ryo47UKC1ju9hpMh4jWUN90HEJprgS
         Z+PRQR0N4FHO8/rzWt0K9670/ixmjyEGtvNvyXmSFP75wzZeEH1zaOf+tR32+jDFpJqe
         ZuISWP8RJ2XqbFu/QDyph1iE0p49cMI7cNH2h8l9KfHhfAazx+pHtYvkqaU8J2jyCVaz
         MPWT3vHhzxXm4aYP1+AwRiQnTVbGa2NXDJGCdNej3Mk7bHUkN/cxVzAnTNkZFN9McSQC
         CXN4VzRUuv/vQwGi3HCnNaElw+i0BqDIwIZWS+TlnGoffcIcf4qf/5Yd6Ae5MJNOZL+u
         qX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821924; x=1792426724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUeAR5YurRmrLyPWT1WYCY1/iIz0jhnPKKa1Syh0wXc=;
        b=u4tuUpIze8q0LTv91jWES3Btqsz2fdLvwY0qcGNGyp+Gwh6K90NnOIhvripNi2HDgt
         mtqcghLMdyPloiApo/GTT/TixhczuHxkqvH4E2iu0gC4hHIzQlA/Or9JtZHz9e+nzy6g
         1KHJLo3Rf1mw+AEJtoaBrd49n2t6rbkSAGVW5hMmdoZnPsxuKwQzgKNM3WWDr/SrYquD
         ctWAjxl7K9QXWc5bt7oXFJnreBHBv5cvAFgcj/bCANXRsKjC2SAFh0KA4jVZXFWrzpSs
         VU2b/uCgOqpuxUMO8YwZmCJ7GVTaMyjEZCM+vATV9uq0sGHqncTe1nKhGBlujMwm23um
         4XBw==
X-Forwarded-Encrypted: i=1; AKwUvBxQE9uNS9+bsfeyUt2Tx91duqLBjdvQrwRPCzSTlrGjdzNQ+yQUkV0BWcN/WDQnZ+fHPQ117e/wvtlOaRo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYlU5J1nuffGQCtXMziz7k/DrtMk+4Y6FB1nVH1YIAux7nP1tv
	VnqEGPMjdnz5QIA0+H9C1iDdHqJhDtDqMEJ0xtVA+P71yXk9B0X7byhwXaEFe+WgNmtXJg8GJLL
	/7vCBbkRwgy0+SdQ8J7ZxBraEfzYWlF4=
X-Gm-Gg: AYBFou0p5vPsf4IlFesa7THpq4FKZYpyeeuHHEba/BMad1AKUSVwNUBKxBbPz7i9zX6
	yHYVE4ua4LXrg/ewo28+uaFXcZ2X4phgzzcDujLm374ob/DsVRRPIu8pedvnSIR4d1rsioPO+hl
	nAcJPgxOrmuaoS3bOlTCwsjeS1wwgHx4GDkNCZWx7/31vGjK71gbhVghjIH6hO3eqLlGhLAqmRT
	ATPLaABNvLcJUBKz+e+mbQHHOHNJLPqPm3teQ91Vfj2PwtA6X/s1DnD829oZdxALQUM3hztIdR3
	x0d0RgP+b9uBYYccybEqh1ZSPqa0baEmFZ+LOXcpxIhggFuD1JRZmtjlsW6jBVwSJrr9G3W1zoJ
	XUPG3T9NwOBcBdTpe1XyvSMk2R4eAjTXiNJasvSV/nQ==
X-Received: by 2002:a17:906:dc8e:b0:c2e:4488:b8a3 with SMTP id
 a640c23a62f3a-c31aa0850bamr1000531266b.33.1791821923522; Mon, 12 Oct 2026
 09:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-1-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-1-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 18:18:32 +0200
X-Gm-Features: AclHuK-nN_rEqA6xqbO4CkyZX0-XsUGhkKaJX3rrOmarOEgQAl1ktERcvGizgjc
Message-ID: <CA+=Fv5RoxY0Bav9Q-E4FpEofokfB26ePOwPPWUmEDp6_sO5S3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] alpha: fix stale user_stack_pointer()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 10:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> PALcode keeps the user stack pointer in the PCB, not the trap frame, so
> pt_regs->usp is only valid where entry code stores it: entSys,
> do_entArith() and do_entIF(). Interrupts, page faults and unaligned
> traps leave it stale, and ptrace and /proc/<pid>/syscall read it
> through user_stack_pointer().
>
> A user-mode pt_regs is at the top of its task's stack, so find the
> thread_info from it and use rdusp() for current or pcb.usp otherwise,
> as KSTK_ESP() and the regset code already do.
>
> Fixes: 8a2857bc2b30 ("alpha: enable regset-based ptrace and core dumps")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/ptrace.h |  7 +------
>  arch/alpha/kernel/ptrace.c      | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptr=
ace.h
> index 430e8dc27ff7..45d1229344b6 100644
> --- a/arch/alpha/include/asm/ptrace.h
> +++ b/arch/alpha/include/asm/ptrace.h
> @@ -26,12 +26,7 @@ static inline unsigned long regs_return_value(struct p=
t_regs *regs)
>         return regs->r0;
>  }
>
> -/* Helpers for working with the user stack pointer */
> -static inline unsigned long user_stack_pointer(struct pt_regs *regs)
> -{
> -       /* Valid for user-mode regs */
> -       return regs->usp;
> -}
> +unsigned long user_stack_pointer(struct pt_regs *regs);
>
>  static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
>  {
> diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> index e1d8c2f69688..dba7e9905cfa 100644
> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -440,6 +440,18 @@ ptrace_cancel_bpt(struct task_struct * child)
>         return (nsaved !=3D 0);
>  }
>
> +/*
> + * PALcode keeps the user stack pointer in the PCB, not the trap frame.
> + * A user-mode pt_regs sits at the top of its task's stack, so the
> + * thread_info is at the base.
> + */
> +unsigned long user_stack_pointer(struct pt_regs *regs)
> +{
> +       struct thread_info *ti =3D (void *)((unsigned long)regs & -THREAD=
_SIZE);
> +
> +       return ti =3D=3D current_thread_info() ? rdusp() : ti->pcb.usp;
> +}
> +
>  void user_enable_single_step(struct task_struct *child)
>  {
>         /* Mark single stepping.  */
>
> --
> 2.55.0
>

Nice work!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

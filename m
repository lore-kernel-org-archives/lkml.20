Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5306513564
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061343; cv=pass; b=JYM5UGZZ3uP2y/GP9cuumIzlG3dIiYzzTb6f2j40DUxnUQDoMLPJSR3pQAnolivW7U20TfAI0SR0h0mYbZNgyPZOBPCv2TyfN5l0v/myKYttpQh1R78rMvrpwdcHIiMd8P4k6xPFWT1teVVfLTNNQv22i0mDy4P/KmRcyfyAJxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061343; c=relaxed/simple;
	bh=IJgvpO6/GZ5vutrzR5YipI9vHkWFgMsz/X+gwRbcJUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4MoUjYPMqb7EZKJqgmKxRkFYCP1ilrpgL684vfTC7gcCk4ACGox2vu4M96SrP8TF5/6ndkSsyHhOuf/3LA1TWXkpPfM34rs1/BoOqjXVgZDJxFZfgvsWdxLgxOeXDNe9bPdXyR83GIT1nDT0UCOQ55cQ7rvooduHJtS0m2uevY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRxnRAPn; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRxnRAPn"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso449626a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792061338; cv=none;
        d=google.com; s=arc-20260327;
        b=gU24a0nmoUoJYUENoVBZ8DPOfxabtUJZQ3yzgE5mr5PYmu46LgNiHctyGldbmWy/Sl
         dzocpXG5PQxsQTPCHujb6lecblEjgW1vvkP8mLnyHAPB7bsGG0f9kVdKRDSs1AMkEXMo
         kL4LtUE/74RuWetQXFgnwuIYtf1qc34ug90/9cujYr1UdvUDBz2MZL148CZ76gzgLyEy
         NW0hMms5T3pDc7jv53DJ/2/Wmwpt4u4y1ywCoyeeFoE5stuzrX/YYFpr0HpKYFzkqG4/
         db+9JBD4Q5eebFQOZRVIa42Pq9y1jG1LIp5CphltkVGltfUCbW9MVdMi5ems/xmqcpRA
         86XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iC2PDsG9ehdnra7rI62aO4hbslW1ebWnxZmL1ySRB9c=;
        fh=G7l2GdkW7DzvLoivstzRpb4z1N3CN48LyCx+NrSbPQ8=;
        b=FVnGaketKFdbqkMS/V8gOfSbdU5RVlxwoEaRfI/lOttMNY4Au8gdGN7+AHeYpiJ1i7
         k3FOhEXdTCnzBRAnc+weoUJWmdfV+9jYeK+EWMH36GPpm47T/X4sqdWdnlRkgjBfMiyL
         hI4+cqiwWM+nJ3eCvkEkulmzhhJ6qURYuXCne0S2QmRaZrLCIQd1PHhYeXsVRqXE1djZ
         HWz4FuaUFvUC0+tjjxIr1+3Mm/SFd0dYlU26oISdxhEPp4Oil0Ek9QNhq0OQn/Rp3Vex
         O8B8MlMPKzB5DaEZ2LJkn9u3DUEJ8tNf9LuZxZDgePjJLZc93KRHsK9uAMShZENhETa+
         nqdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061338; x=1792666138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iC2PDsG9ehdnra7rI62aO4hbslW1ebWnxZmL1ySRB9c=;
        b=VRxnRAPnCeROMEtG4agrc9XDF/BIke08DNRMVr8whzFg8C3DqNMCmj8lAExc5tfUGP
         JGAxVp2CpJSTay55YBRyeA4cP4QCW9WTmYdkwWbOwpJp2mfoXPmKuGTEAs/Teemd342G
         jYFXA6menohXmGCuxkD0mdtQLfWB4r6c9HPG6H3aRlp04xKGqjZ0E20/7/ieWo1YJqEy
         GgPAVtlXDxdWZHdlGlaebwabmYO8GBKhXPyJH+dOhW/H1meubVHFkYBRiSqgDjIV2hg5
         z5c+A+M2wXJbpNY6doU4WkYclRIAF+eDeOd3KBttui6MYN/LOASXQ31vl7awKiYUEkKh
         2EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061338; x=1792666138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iC2PDsG9ehdnra7rI62aO4hbslW1ebWnxZmL1ySRB9c=;
        b=n+cV9dPB+kCAijSS6Vus2DJ7BbnHKurd5QfvXjLwKdKlScalHj80h3u/IbPrcpJhY5
         YLM+PoMv0AI8m3OAnAzEha3vwRX082lrRsLbyNxo4TbWAvUvAfSsxMqSJFA87AVk4PnU
         hbVfKwMC7U+W2r1gKZ5+JAfpKNs1PAMONKaqHag7mRMfY2XTpimRcI8CWfYVXw7qZb+N
         3L/XEGZAex7aP2IypSDSTUQUK/ejbtWHHR/Xk3dvyFsm1xTEPr67Y40vPiEnOtkL50d7
         UMfTQ+tDgDcb77v6yG8i6lz92uWQuA8/++p/U0TvCVH21WaNiRsSXz8HgNWzE9t54tvJ
         fFCw==
X-Forwarded-Encrypted: i=1; AKwUvBza4kwGFAxqcuzTEb6WJWRsJni9AYkJ3/4kggNPKk6CZC++Tt5CELW7LbBSFKLA7jcK6WNogQobDpv2GiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwVZmMsASUoh5sjAGNOLJGSpS6k5asriHddEfIMIYWTstR3mEK
	T4waAnuASkbePfBpmk0JqW/Rv72r5w0NYjMvdgYeI1KJGiN8rcz6lemXClDgmr7irE/HDxDAATM
	/j46JWsb0vFMMb/DAqkRyxLVG+CONdes=
X-Gm-Gg: AYBFou2Sy+jvOtRcG77qtPhQ++Le03xWNdcBN3YIrG2nAaN/61WpLvtmThheih+kAZq
	AwGdWZ7rQf4NgqAcMmc7kchh9TJ8siSyMt7hBu+wEmlzXGdJQQoOg8OpbHBnx7j8hDj/3yGW71x
	3ZygYIGr9zwUUpyMxhzTTdpsZML/arreL5++81iDIBLa6OOFLnutSPUWos0d4osek8fPYPWNkFt
	Rk/nuOiQYdpNHrP4W10Gv3TLyMup7V/yDZdHInO0pJdKy8npVdqoVBHr7b5ETkFHvIqqe9I5lf9
	+ttiBVUVps36knBSNpJgYz4w6sxb4lme8tPu/xfndXklu/71/GF8SuY0SiWlg/FZMNPH8nA1mv8
	DQH/pnRyDEGHOmZ5i+f9Y3c0MZqj8ADCGHUGeXtKnrw==
X-Received: by 2002:a05:6402:324f:b0:6b1:e8e1:a3aa with SMTP id
 4fb4d7f45d1cf-6b1e8e1a84cmr4973615a12.7.1792061338000; Thu, 15 Oct 2026
 03:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015085545.3246951-1-ramin.moussavi@yacoub.de> <20261015085545.3246951-2-ramin.moussavi@yacoub.de>
In-Reply-To: <20261015085545.3246951-2-ramin.moussavi@yacoub.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 15 Oct 2026 12:48:46 +0200
X-Gm-Features: AclHuK8mCm9Ee0LkjgfrS5QZWWzZqnEL_WpPmAkC66KzWm8nuPPfV5rDKDnh3Q4
Message-ID: <CA+=Fv5Stzr=3QZRvRcUeTRj6dqp+rVzZAUwgBK29z3CoqsqLVg@mail.gmail.com>
Subject: Re: [PATCH 1/4] sparc32: keep PIL raised until the IRQ frame is gone
To: Ramin Moussavi <ramin.moussavi@yacoub.de>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Guenter Roeck <linux@roeck-us.net>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ramin,

On Thu, Oct 15, 2026 at 10:57=E2=80=AFAM Ramin Moussavi
<ramin.moussavi@yacoub.de> wrote:
>
> The per-cpu timer interrupts on sun4m and sun4d SMP, and the LEON SMP
> IPI, leave their handler with
>
>         wr      %l0, PSR_ET, %psr
>         WRITE_PAUSE
>         RESTORE_ALL
>
> %l0 is the PSR at trap time, so this turns traps back on at the PIL of
> the interrupted code, usually 0, while the trap frame is still on the
> stack. Any interrupt that is pending at that point is taken on top of
> the frame, and if it leaves through the same path it opens the same
> window one level deeper. A source that keeps firing makes the nesting
> unbounded: the kernel stack runs into its thread_info, w_saved and the
> task pointer get overwritten, and the next window trap stores through
> them with traps disabled. The CPU goes to error state.
>
> The generic path does not have this problem. real_irq_continue keeps
> PIL at 15 after handler_irq and lets ret_trap_entry restore the old PIL
> together with the rett. It was fixed that way in Linux 2.1.129
> (entry.S 1.153, November 1998):
>
>         -       wr      %l0, PSR_ET, %psr
>         +       or      %l0, PSR_PIL, %g2       ! restore PIL after handl=
er_irq
>         +       wr      %g2, PSR_ET, %psr       ! keep ET up
>
> smp_ticker had been added in 2.1.36 with a copy of the old exit, and
> kept it through the rename to smp4m_ticker and the addition of
> smp4d_ticker in 2.1.97. smpleon_ipi copied the pattern in 2011. Do the
> same as real_irq_continue in all three.
>
> On hardware the window is a few instructions long and no interrupt
> source refills it that fast. qemu does: its ESCC finishes a transmit
> instantly, and since 8.2 it takes a pending interrupt right after rett
> (930f1865cc65 "target/sparc: Clear may_lookup for npc =3D=3D DYNAMIC_PC")=
.
> A burst of console output on an SS-20 with -smp 4 is enough. A trap
> ring buffer in trap_setup showed the level 12 serial interrupt taken
> over and over at smp4m_ticker+0x34, timer ticks nesting further down,
> and the frames sinking below the thread_info.
>
> Tested on qemu 11.1.0, SS-20, -smp 4, with a test that writes a few
> hundred lines to the serial console from a multithreaded process: the
> kernel went to error state in 4 of 4 boots before, and booted cleanly
> 8 of 8 times after. Two full runs of the uClibc-ng test suite on top
> then completed without a crash. LEON SMP was tested on qemu's
> leon3_generic with -smp 4, where a full run of the suite completed
> without a crash as well. sun4d gets the same one line change but was
> not run; qemu has no sun4d machine.
>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
> ---
>  arch/sparc/kernel/entry.S | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
> index ea51ef52c952..87d03a58446e 100644
> --- a/arch/sparc/kernel/entry.S
> +++ b/arch/sparc/kernel/entry.S
> @@ -252,7 +252,8 @@ smp4m_ticker:
>         WRITE_PAUSE
>         call    smp4m_percpu_timer_interrupt
>          add    %sp, STACKFRAME_SZ, %o0
> -       wr      %l0, PSR_ET, %psr
> +       or      %l0, PSR_PIL, %g2       ! keep PIL up until the frame is =
gone
> +       wr      %g2, PSR_ET, %psr
>         WRITE_PAUSE
>         RESTORE_ALL
>
> @@ -353,7 +354,8 @@ smp4d_ticker:
>         WRITE_PAUSE
>         call    smp4d_percpu_timer_interrupt
>          add    %sp, STACKFRAME_SZ, %o0
> -       wr      %l0, PSR_ET, %psr
> +       or      %l0, PSR_PIL, %g2       ! keep PIL up until the frame is =
gone
> +       wr      %g2, PSR_ET, %psr
>         WRITE_PAUSE
>         RESTORE_ALL
>
> @@ -407,7 +409,8 @@ smpleon_ipi:
>         WRITE_PAUSE
>         call    leonsmp_ipi_interrupt
>          add    %sp, STACKFRAME_SZ, %o1 ! pt_regs
> -       wr      %l0, PSR_ET, %psr
> +       or      %l0, PSR_PIL, %g2       ! keep PIL up until the frame is =
gone
> +       wr      %g2, PSR_ET, %psr
>         WRITE_PAUSE
>         RESTORE_ALL
>
>
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> --
> 2.53.0
>
>

I plan to test this on my SMP SS-20 with HyperSPARC CPUs. I have seen
intermittent stalls and register-window-related failures, so this looks wor=
th
investigating, although I cannot yet say whether they share this cause.

Regards,
Magnus

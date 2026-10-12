Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE1416869
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822071; cv=pass; b=Z5A3nItWnUsVZT5Y0llxh5tOZx81XUEn/KXiKMKT7OxPEkmHzCntLO1G1LA2HCh+iWBn6qxNyNAlrQ89y8GcBQ/24jYvKEuRacfUd1ztss+puw6YNjPt/l2/Lqn3Po9gag5uKDWFhRsW0VmWQXIVftCTm/dTEGDRBKw7A0ozu1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822071; c=relaxed/simple;
	bh=ZtJuy+UREce1sg1peUoIDUZxf72qfaMwDaVEPJG8eTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3TulAPI9m1auqKYOxvoAy2KdXvFtveXCTosu/cLtl/glmS5wbF34jYA21KU/UDzGzmytkeFbxolDrJSOdvWjFzgB2uOHd4UNG2kshbIvnaXKu5VZDZQwXLfEnnzrEX/dfc8xs5kp7Bb/sz0PXJ09m/MZ+0LrefTP9MXMpf/ua4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlQe5Rq1; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlQe5Rq1"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2acc1e170cso337937066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791822068; cv=none;
        d=google.com; s=arc-20260327;
        b=mz09H2DzgT1VhIe24pyGC/79WVpFDVu3BwxY6y8dpn9XakOJ5QJtBuOjguvXtuLSlj
         IQMSoKMgUJyUhrdByzQ0Us6aEGIVMLKE8jAoZpkycfi7d/d0Vr3fKFbq83g4C8IeszSL
         7mkVZCgdzMwkuuz4xvTYYCBN7nw8rol3ZNgcoIf6gCc9Of37C55kakfcsr6x3rTIhmlx
         REriiYNkEOoAY63msD/OVBzc1qLX9wIoOjJeP5UhtwImR+R20c01n3HUDlssxv1e7s3H
         rQ4wkX/RlTniY3tMErzEvIevwi2fhCc4cpXa/l9DoSQFOt51d7C0lTAvv6h9HyvJ3r+9
         ZO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtrJmGwBJ7fFDAdke9R1Vl4DtHEPSg3jl6Ch4LlMUAA=;
        fh=npfPblgdVwa6FunsZdXd5KxfqEWra00Q0BE0YAINxic=;
        b=Ejb1OiLDqJwrisRHHER5xh5bFl2za1oN4YZQJrGbu+zMucAjgGT59DaUtKbkqiNjde
         3F6iK8gk3v5Jm4/sN5Cn7IrfYu3cVj3oIHdcc7V15o0Ce2iEh8DzSLBmF2wNmrgYqwml
         qdgYtiHc+hcJI0uim8uo6ln3cWH4pVScpO4+i0eu4mZtRtKs42s54XR1JgxVY50eSwI1
         wswbYfS9BUYDubtrF15Jr1ayTrhkXDYdi/95i90xIOMm9QbqSAxrbz51b/x3tGVVYc/U
         7EQCpbTxxUBvWbN28GXv3pKjYTIkzfikqZICo6Hs2Iq+B5VDkONT1PClJy76qK7Vjurg
         VwUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791822068; x=1792426868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtrJmGwBJ7fFDAdke9R1Vl4DtHEPSg3jl6Ch4LlMUAA=;
        b=mlQe5Rq1SzCNDLgbX91+TwnsTuHGb9Q1PNka/WwZ1b4omFf2cviF0DCRzMFQTxS/Cp
         4kvi7eFoR2FXsAiQmzTBclVr20+xw9pf8erRlMoTnC6EOa6Nb0URMMYvwUdnax46HppO
         MJattmjMAg9RomV8fBUTBVcfuqu2tohO/rFrE7PceK0NuWZP3XUib4YiXDwTNVOXJgNf
         XDOD9IhgTmgK0dh1bR8BhZs+rS3AgOjEkgC5LyPj+grjMYHwj5KSZMTg4ASrcWpvAT3f
         4UclTyagrWBXPz1Kz5qTpJwadd/mXeLakp6skbKaqbrPR6JSyJuSxmboPM5QmFYGbWUL
         nGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822068; x=1792426868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtrJmGwBJ7fFDAdke9R1Vl4DtHEPSg3jl6Ch4LlMUAA=;
        b=jY2Q0SLQy0HznR6ZsZrX8ReqtItOE0o6YaxTZea4rdnug77ZO4xXbNl/N3OFa0heAf
         dYWRUwYz1Z5M/0wx8EPlSBeTaQWvOTiTabOaI7Fi8TqdNcLC9NBefxA2J1Fpl5w3T7fV
         8TFeET/1btF+SF206NBDdoqglK6t8YJzXPXt08nKbOkex6jv46xHOlubkYpqMyr8uvJC
         OadWl4vLIf9c1sWH5GTk9bckGDPDRh9efIgoxwoPhfA/Yo55LgP2+Ryx/WJtuIuDwy7R
         sFIuYnWyIEEjIEVjJzduRUaxVoF/s3pri/OIXIH+VvB2Br7ODtNidvC1jSxVdihcpzvh
         5fVA==
X-Forwarded-Encrypted: i=1; AKwUvBzx6734O5U3ixiNQ33wRYwvqjuuEIutl8kQBqkNzatP3572BktxHOrc9/iIXrz63n9oE9g+VwU9cGHAHfs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIZ1eO6FQRHiWlV40PuP8ZpQE+Yp4TL55V+M/Oi6JTnjhGiozP
	jcYAFYwyXE2ehqPXwhHwdH5QICBvW7O+y6dzu9qf53yoEZ57/QHWOXF65CUMADEnzYPJohYSOPB
	PKLD0f+kjOF/A3vaytUiCnyh2+105W2E=
X-Gm-Gg: AYBFou0ieZ+LIVYPe4uY3pVAeFKp4PNLkfJ7Jv49Fbleith8a9H4pQ7KxNQrSbSUhvX
	cMCElZCLb15a7RIaRTm/qi4rv7sxtqeNATg6CGtegD27RHd1sMnpYb9+UoC+OzgksS239pAP7CG
	l8Au6c9Xyv57ajzq1GU3cgIpvcyzvvqVytlty/gSHos4Woudrv3JrkyDiYEQ9pHx8gx+VCM9+Jl
	5m0zVRyKOB3GPjtJLuAdUS9D0s5HWU2tKQnAqnyOsvFOd4wU/30TvQnkNsuyTfTg0mYQ3QGZi2l
	Ob6D0OwbMugGSLomqGYCvVI9Llb8A9gs9dASYi4jXPr/RA0mJW6YnSGUs5fvU3TE4GwAxz393cF
	L8wi/KBaWfn9c+N25ASY5oIOBi5QrEzbnAZC+driKsDc=
X-Received: by 2002:a17:907:d92:b0:c2e:7daa:2399 with SMTP id
 a640c23a62f3a-c31aa0b59aamr1021227866b.42.1791822068206; Mon, 12 Oct 2026
 09:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-2-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-2-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 18:20:56 +0200
X-Gm-Features: AclHuK8ctq3ag-qDSt__fyD9TouOLhL0ONKOVT2c6PAyBUOuhZ4oNrOZClMtffw
Message-ID: <CA+=Fv5R05SLcLkHRfVhqLbjWfp29gpR=R8JDktjOKkYw83Xwig@mail.gmail.com>
Subject: Re: [PATCH 2/4] alpha: stop storing the user stack pointer in pt_regs
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
> Nothing reads pt_regs->usp now that user_stack_pointer() uses the PCB.
> Drop the stores, which saves a PAL_rdusp call on every syscall, and
> give the field back its old name.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/uapi/asm/ptrace.h | 2 +-
>  arch/alpha/kernel/asm-offsets.c      | 1 -
>  arch/alpha/kernel/entry.S            | 5 -----
>  arch/alpha/kernel/traps.c            | 8 --------
>  4 files changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/ua=
pi/asm/ptrace.h
> index 9d86b2a1526e..72ed913a910f 100644
> --- a/arch/alpha/include/uapi/asm/ptrace.h
> +++ b/arch/alpha/include/uapi/asm/ptrace.h
> @@ -43,7 +43,7 @@ struct pt_regs {
>         unsigned long trap_a1;
>         unsigned long trap_a2;
>  /* This makes the stack 16-byte aligned as GCC expects */
> -       unsigned long usp;
> +       unsigned long __pad0;
>  /* These are saved by PAL-code: */
>         unsigned long ps;
>         unsigned long pc;
> diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offs=
ets.c
> index c89792c86044..22ed3c975b1c 100644
> --- a/arch/alpha/kernel/asm-offsets.c
> +++ b/arch/alpha/kernel/asm-offsets.c
> @@ -30,7 +30,6 @@ static void __used foo(void)
>
>         DEFINE(HAE_CACHE, offsetof(struct alpha_machine_vector, hae_cache=
));
>         DEFINE(HAE_REG, offsetof(struct alpha_machine_vector, hae_registe=
r));
> -       DEFINE(PT_REGS_USP, offsetof(struct pt_regs, usp));
>
>         DEFINE(TI_FLAGS,        offsetof(struct thread_info, flags));
>         DEFINE(TI_SYSCALL_WORK, offsetof(struct thread_info, syscall_work=
));
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index bfa116d455fb..790389a15c3c 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -476,11 +476,6 @@ entSys:
>         ldq     $1, 0($sp)      /* syscall nr from saved r0 */
>         stq     $1, 8($sp)      /* regs->r1 =3D shadow syscall nr */
>
> -       mov     $0, $8
> -       call_pal PAL_rdusp
> -       stq     $0, PT_REGS_USP($sp)
> -       mov     $8, $0
> -
>         lda     $8, 0x3fff
>         bic     $sp, $8, $8
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index cfaef96c4ce8..5882c65b7ef1 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -30,12 +30,6 @@
>
>  #include "proto.h"
>
> -static __always_inline void alpha_snapshot_usp(struct pt_regs *regs)
> -{
> -       if (user_mode(regs))
> -               regs->usp =3D rdusp();
> -}
> -
>  void
>  dik_show_regs(struct pt_regs *regs, unsigned long *r9_15)
>  {
> @@ -186,7 +180,6 @@ do_entArith(unsigned long summary, unsigned long writ=
e_mask,
>  {
>         long si_code =3D FPE_FLTINV;
>
> -       alpha_snapshot_usp(regs);
>         if (summary & 1) {
>                 /* Software-completion summary bit is set, so try to
>                    emulate the instruction.  If the processor supports
> @@ -208,7 +201,6 @@ do_entIF(unsigned long type, struct pt_regs *regs)
>  {
>         int signo, code;
>
> -       alpha_snapshot_usp(regs);
>         if (type =3D=3D 3) { /* FEN fault */
>                 /* Irritating users can call PAL_clrfen to disable the
>                    FPU for the process.  The kernel will then trap in
>
> --
> 2.55.0
>

Looks good to me, I see the __pad0 is back again in pt_regs
brings back memories from tracking down the stack alignment
issues a while back.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

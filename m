Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B08F4B826D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825155; cv=pass; b=k53dC4KWzlqVqF+VwipqTaxvPkWMsbzBWqZdYlaQmUoEL3kiDc6HKpYHRvtOyjeBh9QvwCVBVnJScQDMiUHgZzifG191vp08q7VYBHe9vQIBjvVG1hTVeP04Q6+Yah165dngGZTYd9NO5i1wqDt9bn4NBJwH7YJ7C4MiBBNrrY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825155; c=relaxed/simple;
	bh=dpW2g/OHhp1bd+k/Wa9Z4WycLX07oh4uMIjONrgblWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPpxWpw7WUUb4EjqEPDMrHWq45Zb19ix3NZIjngehXM2A25ad+UXeZ/j5aX53y7gLE3mn8oPTEvslmAgmw3qUCOsivXr5HLOYtrNqrLB8lXFVw3Up81Dzj+o+JQpETCws7tKUpegoDXvfgl29zF5FcqxKA5+WfZ87en2yQRAVvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNtkXBU+; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNtkXBU+"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e5e090746so187627766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791825149; cv=none;
        d=google.com; s=arc-20260327;
        b=MhsHtTsJOwibsp4bxPgV7PvklYRW7ktju+LDsqIQVARwGHG1wsw4myzxM5CCyybCDN
         9YH+6mzl/sKGEaULalI0/Dxg/XGw41pLmUNnlw+Us5B+oJpzi9N+/3qkjm3tr8Rb93GD
         RG9x7FLp5ndQP4koARHJC7b71Oh1Mcp4heoNSAZBeHNEk8CJyzo5qWlvyYLkB+1DfJNl
         WqKxlmqf0k/QGu+UcJeE933gsVTUDIfsAwD9EmZPCybjtAHxy8U0D3cX9yLxoCC5WOnX
         vJT4wXFDXaP9TaZ7mXxQtX8o8qevS8e5O6FNn9Nc0kdtqGHbyMDoNOiheeBV3U8WOecL
         vkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UhieV+/eJrwJW2//RDtEPeUp5XItWunJ/DM2B+e/f0M=;
        fh=Q7NjKIg72bT4qFh1zQYQg+7as/APfJ/SRHjoKEZlfZo=;
        b=lcosE3a680ydHCSArg3ld0m3nHb+kYeyaLZn4mnGRsLFvnTPTEj7IU+8mdMgzdkWbA
         KjFIe5RUUr26j2CGB8YmcKoGxqqZFhpSddN1U+XXxv6bu5AW6lcyoHjsi7un3bwEJMrj
         qYFh2azrGYTb2KjT++Cvr6532nO9dBX4QnEJb0FOlUO7mK/qHUi4xUnPYI4ltPlFalBQ
         Lx9UbHfZQExAfZe/zXWBHd4p4/u+Rpe1Nz3hO5OXBTOJQk+fZm7F00UI4YJEEhu+nkuW
         2f3ZRrYV+7mpsWXNQaB18Y8qlDJTYJavoi+KLIuHm5Dp7NZCC4h7lPif84ffahFcuiMl
         nAIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791825149; x=1792429949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhieV+/eJrwJW2//RDtEPeUp5XItWunJ/DM2B+e/f0M=;
        b=LNtkXBU+ki5e5hfXUbOYJgoqmVPmvvlOv6aE8TeGaObQVrMEhK5SMDzl2vxRDv3w9a
         Y9wMRqWUrUzIgVfOB2QeS1wDoxLAVUOmRoz+jmQZ2FJr+w3MAOm2EhDw6RbyRXdE8+sd
         EFFSjzf7S6eyHBu/Eheio/8fEREfXEZSFvjEZ4TJCeXfBVO6s1iEXjBDMbRGtGf9lMhI
         uTRs9DRO+EAWbu993mr/8EBwNvBG2f3wYG4vQXxzFlixvQJSNrsYkgQNH/kDlVbbtugm
         v2p3/8lgQ1Lu1aQtanuQOuwjI6Zru14CSDwomS76o3l499/Be5ER+5B517veqwwcEpiM
         ZJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825149; x=1792429949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhieV+/eJrwJW2//RDtEPeUp5XItWunJ/DM2B+e/f0M=;
        b=Z0QPZsnj4cJ+y27XJdpTllTjXYpNl75rLjr6mO5lNyqqvshNJIhkrDFjwghFO9FouD
         unkJbruO5LeGNmFI66JSOicxUEJXxroRm26zd3bROe0JyySM+G3YgiEOkXyaoQ2wIbq1
         HbffW/xwR6ufg6N9KJBBLsL0/416MRTth68lSccMn+T61DHSXEdb6tsyhEPiIgQf+OmZ
         NRk01xnD4fr5wro+wwyZhnYoDs0A4By5mremjmGZJA9S4VTV5PuzEcnPy3dcJTTw/Owv
         P0i1rjlCeH6pVMFleq65zwD/0l+YExNQ29QHbYaOlMJrQGkZs5c+tuxBEZ6l/okU4ToN
         6yow==
X-Forwarded-Encrypted: i=1; AKwUvBze64EzYgfFrhwcrU7xtADeLLYKBfTje+JPmYpK3bfu+Jhp7n1wC0CGtsy0iNKE8YOnsMryYXcTJ2KJxVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeGFZ+xYZCf6DyBD3PbtIBZZnd3yl6J62RSXhHyDd2W1PjVTTA
	TCylMLJ9ieczCFMsy5904EQ8Xu4/YiZzuVYRAonOgMx0aglKoyi0XzTxStRxxPB9tXfSqRJ7QMs
	6rTUpok560efYcPp9DEQieOOG9kP16ec=
X-Gm-Gg: AYBFou2d8MKKLeGS+Ll+FqQlSEIbT8XqZAfBfr2Gpoo8KgC7UrmCIHQ+a3RKqdxujp1
	w12bkJL/hL/PA14Bp/HsxTxHAvnhJ26GzSn48QmVoS+xPbHaf/oJWd1UBMqUd1ZkJKpx+hJXk1Y
	tMEtPEcDgjFvz43d5ouLdQ66rkA4ZNusNzIm7/WRrVXf0E+NXeFnDUMblD4Qo+tu2Pd3sWvGAA/
	XzciDLcDDxtfhBEFUB8fL13hqGZLTBa4X+DrtrvYlYYjsOsXpDDL0649k3KFIogI6/OLD4ifV3t
	/239HlH6uh1khnt3bFHz1Kf2R+if/D3RdMt1vDodxkHENwXtKaCSM+A1fxuP2J6HSbVdSOnNeCn
	PeQTmhs0XFkyctGCd/OUQKbsm7RZJDm7LSS9t/XpjHA==
X-Received: by 2002:a17:907:2d24:b0:c2d:bcf7:37f9 with SMTP id
 a640c23a62f3a-c31aa07a9d9mr992370766b.26.1791825149332; Mon, 12 Oct 2026
 10:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-3-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-3-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 19:12:17 +0200
X-Gm-Features: AclHuK_IfbO80biMKT5u2j2yFp2FuPhLw89IvxvMZVpINwN-IiFIyIRGdYMzWGo
Message-ID: <CA+=Fv5RW+ju5weuhDMLjEFcWvg0G0RnWXiqTr-0HmCnWhcaQUA@mail.gmail.com>
Subject: Re: [PATCH 3/4] alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
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
> Both open-code the same PCB lookup.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/processor.h | 3 +--
>  arch/alpha/kernel/process.c        | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/=
processor.h
> index c461a26d47b3..73251cd671e0 100644
> --- a/arch/alpha/include/asm/processor.h
> +++ b/arch/alpha/include/asm/processor.h
> @@ -43,8 +43,7 @@ unsigned long __get_wchan(struct task_struct *p);
>
>  #define KSTK_EIP(tsk) (task_pt_regs(tsk)->pc)
>
> -#define KSTK_ESP(tsk) \
> -  ((tsk) =3D=3D current ? rdusp() : task_thread_info(tsk)->pcb.usp)
> +#define KSTK_ESP(tsk) user_stack_pointer(task_pt_regs(tsk))
>
>  #define cpu_relax()    barrier()
>
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
> index 06522451f018..7861c9e767b7 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -318,7 +318,7 @@ dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt,=
 struct thread_info *ti)
>         dest[27] =3D pt->r27;
>         dest[28] =3D pt->r28;
>         dest[29] =3D pt->gp;
> -       dest[30] =3D ti =3D=3D current_thread_info() ? rdusp() : ti->pcb.=
usp;
> +       dest[30] =3D user_stack_pointer(pt);
>         dest[31] =3D pt->pc;
>
>         /* Once upon a time this was the PS value.  Which is stupid
>
> --
> 2.55.0
>

Looks good to me.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

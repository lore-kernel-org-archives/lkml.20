Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852645;
	b=1yBAmlUwnLQicYGr4I25Ijy+1m6sincVW31hahbjSf0d9mLOSozOUKQqdMmCzn8uy8wW
	 PMwvD3t4UsRy3sxKpAun4r/I+CJ2VGxzrHod6pD+NIHh0eCE3rbq2wI9gOAaT6EpPvSCx
	 9grwRkxI7H6SrMAOn9vTWauFIUPLza/GTR+vCLh+4ZJUESn5t51X3yr6EPUY8CsgJXS65
	 SoR7arQB7yRtWhuTgo8nbKzNkSSKMvyd4s1cDKhpJSYEKfoBEH2mASLULHZDED7a+L2qV
	 iVgmr7CfarrnGqGT6J2bBuXIUAdwBIugp0Ar3WgjHbXLF/XVRDM1Joq35+tyEFu4Iaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
	b=ToOUanCyjcbM2ibjSzilgbXZcuWJUixP4UqyXP7yFz2oSYMI+5JGkMUss8i2YjfDmr9V
	 YF6hdHhqCUIrQuz4pzv+h/XhQSIzDKHDFZtM6HohOCyI6P7G6Bi2c1ocjb1dclkxvVMtl
	 yH41cb47lY4VttpoVJmHy6BtDHCPW8Hxkgwj3a/vlI/ZG+ALz1tiDshXwlgztuZ2dbEoZ
	 683k3wAsNqQSVECYQBpUBbn7CxI4hinl6eGd9WoP/BJlZrIX4x26ALrxjL1XjpuKiXwst
	 MZ0hgDIA5CgxxWwEpIU7++pgZnSBpwBOM7wca/Srh7Brgx36L3pQaLXLUVTFJbPITNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0lt4j5h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BC3606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BC3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0lt4j5h
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b56221d361so5867646a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852643; cv=none;
        d=google.com; s=arc-20260327;
        b=OtjcIqHXIQoUrJf9xVX88UKz7kFyaYd1at2FvGJWEm5YbEIM5rZg7PszJE2GkTdtOb
         VuGHdi/4AANa8XKuOpj0N1rfbIe0zKEe0gQ2A+zqbqC87uxPyJjr/TWuHjUg3WrH89dN
         7BLzz20AgphpjYve6gi1GWTxlVkLttT2v/2YJP8yuqKIO01M740jV8vQ310NzYDGpPcC
         YyJ0V51Tb1JqzuQoloGqz1j8BJJfgF31clO5D4p2gq9F0l34Z28XqOVPl+LjcXkUt8yH
         K4b5pOvWQSo0ROpVl0PXI9ZEihij6j0AQswMGZFGva30aD3hks+pkooE6DXcUOvPs4vP
         Attw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        fh=I72ZcSapIcnIEJUR9VqBcCHYohJA3KKUvlo865BKxVw=;
        b=k3tn0Qa7uakXkxKStOrxeVaY1L8s5ngL9sPfxAtCeATDbd49J/biSE+AktfH2/eYeb
         DFxF1/eAUeG4Dh2/zGp6dI5fjXNug4T5b8eafqDzzh9Mwiso24HnXn/ipJPk4dnV42o/
         b+TU0YsXMBnFqDs71+69VAXiyzQprIXgAxeLlGZ9z5YCRVMkmx6xDJO/PG2TEgmfrW3I
         xDdibbbVdUuhvoTSIjqxchkWTU3mzThmgAZZHzHGuZvVuiRn9AbtjdiwFlipP52H9lUG
         tCy3SO63X8ZGmnDuRLDsw9Aoj+91+fYjndhvVpUBArGp+EWmlrbAbVPoN2DNU68Oa3J9
         GT1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852643; x=1795457443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        b=x0lt4j5h7o5ZOIupC6QpocZBfmv8wFzUHnqEUjT+qXXHs4fqM/212o+JPya3Ne+Seo
         tLIn+ce71Roeft17QbgYTLYZCJ0+SlsLtt4o2OLm95aLJ5VyGYDhMzriK8UdMTHsHNnj
         8mTqTlr5/Ax8I+pLOcrqBMRwU57PT7keOGJO4t4tmQGJKRYz/1wZ/uaK+JY6cLy80yx1
         pkobwBcMhURP6h4GfSR12sTX8GLQ2Qvn5juEllVfsWcYtDCP4X7X2kujH+BqvT2pv+Ny
         N7Wj9fipbTOHczIeVSeB+l1xH0/w8nez4g0GJUB68vMGCquO73GzeOY0af50BLWOXJ1z
         6RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852643; x=1795457443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        b=cGGNZUCRPo6/LaeevRZqGSGtc/VGL10/M+3HSwb+HNXrq7HDBGfp2YldtmZykbaEYm
         /9DeMElvuMvECa2W+HS3/aTnmgpA0nZ9i05xTIvT9BI8PFOfN3c89ScD/qmIT7b6DjOR
         J1vUBJCN0bz/fVe0yQF1VXx5/Pwr6KxHkdkfZ8hdfem4RSRE3BIVFnl/phliYvcRny8M
         kY5wRwybQkvr+rKIXXHvrIMeesYNdFiM43NDyYvEt/puTUHRPPnFmEB1Kkk05rKxYEHO
         xPimnLQGPLotGX1wCMsQJAzAir0F7OKn1lR3bDEJo4Vs+xmury9K+mPkkfWccdcUWuec
         B5RA==
X-Gm-Message-State: APuU4Z9jQZqY3ynag+xJo+nt+Gg+GYzkAZV5yiDwvE2vQQCF3N79kBp1
	hWeBsGqCeAUo5S4P4NzKlXAK/fU/GKh0B/r6N0mUVcHof3jh1ATKKQbqMSODBCy8xvgDIeN0Qe+
	2MdJrOAvVklqQuNXeWaeV41IkOaanURc=
X-Gm-Gg: AYBFou1FIkDS5/Tr8Fh9ouT+It+HeVj76VK+RQ7HldTWgO/B7PR+VGn/6AXjuO4Mimw
	gN2iCRLvQ7GejhBGCroA79IatXCbCl+duSbUpKsAgHNuURVw10VPZX3tyCLZw5Q2qambCN1HptW
	qdD39yFQxuPiVk3BvndrcFsGDFg8aryMIYiaGA/IidTpbz361GSNf2YZ6BzO9nIpPMYPlJdbuhp
	Z04JMUA3jhSI3zsQQ6EhnPatdT0v4qYBmhEhEFLnsb7PZ+mxeETOFNqAR3GiCUfvI7L0BNVxpS+
	Gudr3FzwHw1FENkzk/99RQMEkA2155HirseQVjyEYqkyjUAkJ3WJYBeHQvLUchCtKt+ul05KPu6
	UAcSiZnC85Ru/SFLMRLQ49dHdQkmx2b9XJNFoKh0rYOH7mdCEcWtks1ZoEBMK361/bTGkJRJTvs
	bxiNl5cqBVDADKhJDJ0L7CxpHPv4Bw0E+/s24aHETdJIyG
X-Received: by 2002:aa7:c4cc:0:b0:6b4:1037:2bb1 with SMTP id
 4fb4d7f45d1cf-6b7c0bc27a9mr6612692a12.22.1794852642773; Mon, 16 Nov 2026
 10:10:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114184720.373178-1-renzo@cs.unibo.it> <20261114184720.373178-2-renzo@cs.unibo.it>
In-Reply-To: <20261114184720.373178-2-renzo@cs.unibo.it>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 16 Nov 2026 19:10:30 +0100
X-Gm-Features: AclHuK-3zf0u-_tVqqSwOuwnlXe0JuQIB0eE-s6YSpQo7rK-ZYPGihb4jDlFOAE
Message-ID: <CA+=Fv5QPMYffznpkrEhZ3pMWtpHwNUUa3OaHxLexu8S47a7tRQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] asm/ptrace.h: add instruction_pointer_set
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Eugene Syromyatnikov <evgsyr@gmail.com>, Davide Berardi <berardi.dav@gmail.com>, 
	"Dmitry V . Levin" <ldv@strace.io>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, strace-devel@lists.strace.io, 
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Brian Cain <bcain@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Renzo,

On Sat, Nov 14, 2026 at 7:47=E2=80=AFPM Renzo Davoli <renzo@cs.unibo.it> wr=
ote:
>
> Add an instruction_pointer_set function for architectures that do
> not currently provide one.
>
> Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
> ---
>  arch/alpha/include/asm/ptrace.h      | 6 ++++++
>  arch/hexagon/include/asm/ptrace.h    | 6 ++++++
>  arch/m68k/include/asm/ptrace.h       | 6 ++++++
>  arch/microblaze/include/asm/ptrace.h | 6 ++++++
>  arch/nios2/include/asm/ptrace.h      | 6 ++++++
>  arch/um/include/asm/ptrace-generic.h | 6 ++++++
>  arch/xtensa/include/asm/ptrace.h     | 6 ++++++
>  7 files changed, 42 insertions(+)
>
> diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptr=
ace.h
> index 45d1229344b6..1a6f073e892e 100644
> --- a/arch/alpha/include/asm/ptrace.h
> +++ b/arch/alpha/include/asm/ptrace.h
> @@ -33,6 +33,12 @@ static __always_inline bool regs_irqs_disabled(struct =
pt_regs *regs)
>         return arch_irqs_disabled_flags(regs->ps);
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  /* Syscall emulation defines */
>  #define PTRACE_SYSEMU                  0x1d
>  #define PTRACE_SYSEMU_SINGLESTEP       0x1e
> diff --git a/arch/hexagon/include/asm/ptrace.h b/arch/hexagon/include/asm=
/ptrace.h
> index ed35da1ee685..0a121f6e3bfc 100644
> --- a/arch/hexagon/include/asm/ptrace.h
> +++ b/arch/hexagon/include/asm/ptrace.h
> @@ -18,6 +18,12 @@ extern const char *regs_query_register_name(unsigned i=
nt offset);
>         ((struct pt_regs *) \
>          ((unsigned long)current_thread_info() + THREAD_SIZE) - 1)
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #if CONFIG_HEXAGON_ARCH_VERSION >=3D 4
>  #define arch_has_single_step() (1)
>  #endif
> diff --git a/arch/m68k/include/asm/ptrace.h b/arch/m68k/include/asm/ptrac=
e.h
> index bc86ce012025..6e8a8f0daee8 100644
> --- a/arch/m68k/include/asm/ptrace.h
> +++ b/arch/m68k/include/asm/ptrace.h
> @@ -18,6 +18,12 @@
>         (struct pt_regs *)((char *)current_thread_info() + THREAD_SIZE) -=
 1
>  #define current_user_stack_pointer() rdusp()
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #define arch_has_single_step() (1)
>
>  #ifdef CONFIG_MMU
> diff --git a/arch/microblaze/include/asm/ptrace.h b/arch/microblaze/inclu=
de/asm/ptrace.h
> index 17982292a64f..69e10658d7a9 100644
> --- a/arch/microblaze/include/asm/ptrace.h
> +++ b/arch/microblaze/include/asm/ptrace.h
> @@ -20,5 +20,11 @@ static inline long regs_return_value(struct pt_regs *r=
egs)
>         return regs->r3;
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #endif /* __ASSEMBLER__ */
>  #endif /* _ASM_MICROBLAZE_PTRACE_H */
> diff --git a/arch/nios2/include/asm/ptrace.h b/arch/nios2/include/asm/ptr=
ace.h
> index 96cbcd40c7ce..d120d8ecb187 100644
> --- a/arch/nios2/include/asm/ptrace.h
> +++ b/arch/nios2/include/asm/ptrace.h
> @@ -70,6 +70,12 @@ struct switch_stack {
>  #define user_stack_pointer(regs)       ((regs)->sp)
>  extern void show_regs(struct pt_regs *);
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #define current_pt_regs() \
>         ((struct pt_regs *)((unsigned long)current_thread_info() + THREAD=
_SIZE)\
>                 - 1)
> diff --git a/arch/um/include/asm/ptrace-generic.h b/arch/um/include/asm/p=
trace-generic.h
> index 62e9916078ec..632d4ce3334d 100644
> --- a/arch/um/include/asm/ptrace-generic.h
> +++ b/arch/um/include/asm/ptrace-generic.h
> @@ -29,6 +29,12 @@ struct pt_regs {
>
>  #define PTRACE_OLDSETOPTIONS 21
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #ifdef CONFIG_BINFMT_ELF_FDPIC
>  #define PTRACE_GETFDPIC                31
>  #define PTRACE_GETFDPIC_EXEC   0
> diff --git a/arch/xtensa/include/asm/ptrace.h b/arch/xtensa/include/asm/p=
trace.h
> index d0568ff6d349..97b14418955e 100644
> --- a/arch/xtensa/include/asm/ptrace.h
> +++ b/arch/xtensa/include/asm/ptrace.h
> @@ -103,6 +103,12 @@ static inline unsigned long regs_return_value(struct=
 pt_regs *regs)
>         return regs->areg[2];
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  int do_syscall_trace_enter(struct pt_regs *regs);
>  void do_syscall_trace_leave(struct pt_regs *regs);
>
> --
> 2.47.3
>

The Alpha change looks good and applies cleanly on my for-next,
including the generic-entry fixes.

Tested both series together on my AlphaServer ES40. The ptrace
selftests passed on all three CPUs, including syscall skipping
and instruction-pointer modification.

For the Alpha part:

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus

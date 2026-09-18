Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600954DA9D1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728914; cv=pass; b=IUWI70NGrBGwK/1+7exWEBhdlP4fgmZ6+6C83EOpSBPFApL95JcgZfj5oV4omPQJpJUjqF4kVrAbAR30nEJfy0fARDu/0SutashXtoHO0AMzTKyYT1kBE33mZCfm+hTCedtMTOAhwqle4uX1zMxXYeR1O7c5RalRfZ5oYQOOO3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728914; c=relaxed/simple;
	bh=0QFLY2cyWzIGxwHrQ7HwSGwbi9sjKL2DXLzkJTDdzU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fu4GVaylh+tWjWBlt4YUESGFYbhhrmrhJCxTztTea0QtyVbXSLUD5sCFok3wcof9JIP31q36SGAA6OL8DW/i9NgVBu10fXF0JwdUIonIc2yyJpjEZqwiAM5D6mD4o8vMeVYD0GV3TQerHrprOsTevWbLmHoHUT0yhO4VqTmjzfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Azd5WHFc; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azd5WHFc"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so73467966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789728907; cv=none;
        d=google.com; s=arc-20260327;
        b=ouDtXlvQCX9LZjnMxWJh+7Zf5LGJBAYewzfXeMPn2GCqAK2nqbaVZL91keMXXxI/Ub
         uoRUjL1EAteqJYBdboREVF5aY9Yi7JdQFv8QK1eDrspbe0bKT/oiz4RwrY0qy+YQWSmk
         VQTbgbmrlqbHWrcNfw55Thk8cwR8ewvTtrhqjJIsShoYdpj2L9HE1MlgGecReqkc4kTg
         +Yvi/d6z72zQsB86Y+fchoDKSDdMSO5AD6nnr63PsgG2VurIcw7urMpGcDRHzXPpij8K
         1FkjhAKxH27xslrwZOwAsDxyXjZSuQxHlNtwnh3XpwDsHLaK73ZAHDpCs/0zdsFjKHuK
         z05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        fh=3+cZTW++QFKbfDwyz2jTGklqPt74l8jMFU941FOmMhQ=;
        b=oA88AsyGHzajz74HiyogF4+uO3GRVD96pokXDe1KWmmfZAfphfS4Uzu9xSSmTEo0PS
         tJZqtiDVnZ/dA0pp0V057Jy6RBjvinwPAX8ijAEHPzjzpm9lHtPZf3upg6xTZ2vq4yJw
         lr1cbPFFF6OduFDiLA0JGoJdya0zKZEyLVRuQ2+j5YCl+iwIZRcGsSHcvIhcMpkxZHnF
         eL8aUVuTuUMURrn91qTsPHbLt7YId8hOaVZjqF3k2joY/RzhE3ZslBhYpZuTEKjISckQ
         wCKlm86QsIAt1UzL6+hV1eA/aos/oN70UP9HWio6Mza9feaj3QXGsR00+0AJrRmoAtE9
         EenA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728907; x=1790333707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        b=Azd5WHFc1CvGiYQ9NCg17h0QdQDsKZ1Ic+0GnZXnWRlhTXCHeOt/YKAE0IjeF3RFdo
         mNUlVWWMNvpDH01goCjbtTfi0Wb0g8nlX2FBJGkeqtrHbz9vnW4fm/VQ+kdwbqCSZ1kS
         Oi45Tx85x94cXarLimXLqXpPwrB4/rntqcR3q5+hBllZwHtqJMygkg6UgyHurXqBPemO
         /iVmKyn8SWOHzkRG5ESZV9hfeq3LpxINZGbxIPaCg8OJ0I78rpaQ5l15M18yL2So4NA5
         NCr6l6shtfaJr+Hss/3rPX5iLi+JKMylFgMwfsDg7JxXyd3atCS1RasPfbddZyg9hr7T
         G/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728907; x=1790333707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        b=eX3/5ZAdgdfila8hurF5A/6RnxV0KRGZlOqHod3qJgc7Kab3rgux8qDu7GqXxr2uTV
         M4BZLMYGjwKRHQxfSEi1N3sQSVK/BVJdq7U58VZVoYZZFtfT54iW+Ydw7nA23IUzq+nI
         dht0yeiWz2NoHgpCI0je9KMHnnZYd6MoUcNrWTyrJKPtMRFFK0eWG1T6znQJFl08Yn0S
         E7DSp/jnj5YsX6PrqzUXkHt/TVZm9MwQYdbVvTXMGT+93XngUgcuI2kiCiUXHKQtvs01
         +RH/ks7yqZ395mpH7KDtYCKCE4C3TSHkbZ3pCS18q9C5xhFPqWDB5/by7Xy9gl5up4nE
         1vDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFOxHLwSEan9ZGQh7vs9wiPHcRsSBoy7cbfDVs9PVA+hwtw2IPw7qwSC3adiEaCG3LSdm7kIqgf3kyCSI=@vger.kernel.org
X-Gm-Message-State: AFuF++mDu99sJfITQP3iCp0Y7njt+FsYbvtXC0SFc20dxV0ibPjzseUH
	DKhzkZXRNjdf0f1HCCRirt2jYs6t1ZRgrBhbvbU78dMWfSE5KPXSGMMOH8r3l2j70WcPE3w09XU
	MDiD1uKy+tve0JWsz3t5+gSLQZPni09Q=
X-Gm-Gg: AYBFou2dcM798vj2WhfLHAW8BHaR/HB6ABGnNua9jhBhOsaBnzjTVwPZvGC072oa/fm
	RADJNfFV/76PUnJBF8FOd0+hOz5E2majx3IjwU9GU6miTYHOpcTGHwF4kNDqFZdRJvDaAkXzSKn
	8U8Uyqn3MwZzKZCe6fXu6YBcSnsjMtR+D2SMu3sOjFZw7IQuhbFzRoHW0iJr2TaWbN/0RMJlovq
	GhsFy2syaqOLNlDrkHKiylFbnm2TuJi3OwKPWog5yLHFZPWcu+DCBS+vOvAIlri0Nwcfph/6Osg
	pawiMeXcGbLCWsU98bCeRZ5Pw6QB2KUEbPNqq05OnDD0oCAhfnKfsljdgAV9yVOcYiGMtZkAFII
	o1t13OYeXwlfoADigqMUloOBCm3dyluoDSHx6nEPFSzbw2sJIhIoc
X-Received: by 2002:a17:907:d0a:b0:c28:ec7c:27ae with SMTP id
 a640c23a62f3a-c2a15aecddfmr221737866b.25.1789728906928; Fri, 18 Sep 2026
 03:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-12-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-12-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 12:54:55 +0200
X-Gm-Features: AcwNN1XYBCc8XytQv7lpPsMdlPdL7ChQXyccU8FUv6otEOv13o1h6_2iRPXOShM
Message-ID: <CA+=Fv5Q+sOLmT0Wf3OGdKw=mBt_EoS8ZQDF3wwGrm2-2vnOYgg@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] alpha: Remove alpha_ prefix from custom syscall entries
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:48=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Some architectures need special entry points for some syscalls (like
> clone3). The current approach is, instead of having a special name like
> arch_syscall, to name if as __syscall. This is enough to different the
> common entry point to the architecture specific entry point.
>
> Change alpha special syscall entries to do the same. This makes easier to
> join the syscall tables. Leave alpha_syscall_zero because this syscall on=
ly
> exists in alpha anyway.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 9f2608de2544..8a85fcf117cb 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -879,9 +879,9 @@ ret_from_kernel_thread:
>
>  .macro fork_like name
>         .align  4
> -       .globl  alpha_\name
> -       .ent    alpha_\name
> -alpha_\name:
> +       .globl  __sys_\name
> +       .ent    __sys_\name
> +__sys_\name:
>         .prologue 0
>         bsr     $1, do_switch_stack
>         // NB: if anyone adds preemption, this block will need to be prot=
ected
> @@ -896,7 +896,7 @@ alpha_\name:
>         ldq     $26, 56($sp)
>         lda     $sp, SWITCH_STACK_SIZE($sp)
>         ret
> -.end   alpha_\name
> +.end   __sys_\name
>  .endm
>
>  fork_like fork
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 8fc4701a6328..a41276634923 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -9,7 +9,7 @@
>  #
>  0      common  osf_syscall                     alpha_syscall_zero
>  1      common  exit                            sys_exit
> -2      common  fork                            alpha_fork
> +2      common  fork                            __sys_fork
>  3      common  read                            sys_read
>  4      common  write                           sys_write
>  5      common  osf_old_open                    sys_ni_syscall
> @@ -72,7 +72,7 @@
>  63     common  getpgrp                         sys_getpgrp
>  64     common  getpagesize                     sys_getpagesize
>  65     common  osf_mremap                      sys_ni_syscall
> -66     common  vfork                           alpha_vfork
> +66     common  vfork                           __sys_vfork
>  67     common  stat                            sys_newstat
>  68     common  lstat                           sys_newlstat
>  69     common  osf_sbrk                        sys_ni_syscall
> @@ -242,7 +242,7 @@
>  309    common  get_kernel_syms                 sys_ni_syscall
>  310    common  syslog                          sys_syslog
>  311    common  reboot                          sys_reboot
> -312    common  clone                           alpha_clone
> +312    common  clone                           __sys_clone
>  313    common  uselib                          sys_uselib
>  314    common  mlock                           sys_mlock
>  315    common  munlock                         sys_munlock
> @@ -474,7 +474,7 @@
>  542    common  fsmount                         sys_fsmount
>  543    common  fspick                          sys_fspick
>  544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          alpha_clone3
> +545    common  clone3                          __clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.55.0
>
>

The fork_like macro now defines __sys_clone3, but the syscall table
entry is changed from alpha_clone3 to __clone3.

This should be __sys_clone3, like the other custom entry points.

I also confirmed this by building the tree at this patch, before applying
patch 13:

LD      .tmp_vmlinux1
alpha-unknown-linux-gnu-ld: arch/alpha/kernel/systbls.o:
in function `sys_call_table':
(.data+0x1108): undefined reference to `__clone3'

Patch 13 hides the issue because the common table uses __clone3 as the
ABI tag but correctly selects __sys_clone3 as the syscall entry point.

Magnus

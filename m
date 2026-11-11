Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382999;
	b=3SY4dLXvhNReD4MSdAduOqraqbWqdfSkrRdsZFXWo71ZDxiVSyXvXJwsbAHv59YA0KYb
	 8JlOgwTa+b/ymmMswNqw6BCR1BUQxo8TRtXPFi8rrk8rj+vE4h53y9FhycOtUrqwl97S/
	 t36MywKH4DDXjCWc5Yt70aaMgXoAkGkbiHvCQUVseMA+d1hFNik6kzqqBx4E6qoi6Tdf9
	 6vDjJwk1G6zgJU2wZEELdGr7rXenMWSglg7Slbb++xJxy3aaYDnmPkjsszarJ2KXag6+z
	 PRvMe/5oYp2X69p5/6TPi8J5I+r/sfHlZ/iyIq8+0eFCbUM/lJpHE4a3E536d7lzb7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
	b=ViyBVemuAUZRidvlvTivjuWdsEdwyU6F5cFCQnbQG6DSbZ3CRubjjFR39MxhunSd6mh8
	 A/f/f9LdaoUyZXa7/pnaLtSvWsI/2z/cnX0yPSFTqE45nRifFCz7KduSa5czOh/h1RBUO
	 Fe4d6InPsPkxuUVqJrQRelh0AY+45dhByG+jWxj9NbI70v7jCNz7fsGFAtMPFvJ9Tb5pu
	 4MwPbwEgpRsLrzpPmMKrU0WWHsVOrLNYn7MT88lNiRpZ9eOeIL61WdIM2V0xXttSyGGCA
	 KFWNZjH/xtsvTCqeVzBSvRW67Mu1POgvTW8vDy7bZtWERyJb9gr/CqFt60lhKRXjhDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5NQKG5D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAC606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CAC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5NQKG5D
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso1704780a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382997; cv=none;
        d=google.com; s=arc-20260327;
        b=LIkMD3+ZLRyWQEPNBNRdTk/XLMEytaFTJf2zBkvu4w6/UClerW5ssakK+fU/+ideSj
         DzvAzJXAieRD2MVGXePGZPDe4agKHhXjBTwJjnDe9zLWE7MSSjnt7ZOtQQYtz36kw5hi
         tvAgzfZvLZ3IVRiY1Iqlcyv4pJsnCIblEfs8SlXXjj1nS/LoyonpjDa/nMat3GWusSwi
         7/F6C/idkobOsZmy0sAbVkaR3Fs/N309zpBmTEImUPx9W8hNd5steh6iqqYSObvepE5d
         FQ+/H+mLmzHcM3PsDpIUIgP87V5yrWCLTwISRekjd/Qj+QYXlkiMEKiNQPqcCvtcr8Po
         JSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        fh=G6HUJYRpyBPsc/GtW9vve9/iNtBjoPHwAPihZvgqoUo=;
        b=a2AMRca+770oMCD/mxWRDTaDq2tSqTQXXu8newYLzN7Wv9II65PMw7NEkby09xBIth
         JDiv8FqnxYieVwwyITQTHLt35YZ3K7iI7Q0A3h69TYkkcLi7rjc1uML0+K7QZ642oz9F
         IhweheNblt59yin7JnP2rlfl5t0qMnzGZqUrCJ8n2EXkoJkEJzV1Eh87QZne8u0AhTc3
         ML/mgELSrk8PnKMwsenSl0STU0i57G6hugkMR/WjbLUXcNX+HwYPfO+1Zu+KoN/V5ltF
         ByFCYoHnm2S/MsdvXpwdMFZ2oQVlaWNV5Im+ka6y7YMC6RqZ0rrFFDsRayJ6tp7vTOQw
         oA7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382997; x=1794987797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=h5NQKG5DsH5k0QdRiJVJ86KtbHIpBxOZtiNveHnZG/t4JAkAZl11gGqvbZh2gbx+CZ
         U7R2l09uEN9Mz6txyG/VHZJvSvlNiFdQj+V+bgbOtkQgjiNZU0CA5FMY6smQ/+4XBAH3
         TyiknHwqbS9a1ikRyqP2U11AjltnFdJ0aJiSYxxvbDIdddHQa9rv+KTy80xEhAMzl3C+
         bIpY5WP4LhG5OSEIpLn1ynS3EgjFFWznVldcdS2uIAoKSyrP0PX27WalhA9H67xC1xsv
         oVv9D9PpI4KM5wKfG/3AUYQbehBCy8YKKKaBfMQR6O76UfhYBDJ2qQ9F1ZaCwVdZpUw3
         DTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382997; x=1794987797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=LInj4kPrxlgL/g1l5Fcb3T3UyEhOq1Ah7LlrTQiT+GqZReiVEsikM1WYYWg643vC6M
         ycDl2yy0bH/I1xKzOK5h3QJSAonf4W3DI4G90LrFDVgtnZCEpEIf5/eQpwwEMbefIs6u
         aBA05G2vdwm75l0dgfTWRy9j/nRAsN5CuuLzrNts8STnJ5C+4s0Lv+jW2RH4EeejXa16
         NKE2hK9ulnfWVkJPbK5dxpwl8JNYIBVKpe4+aZ3giMYpRtpSmF7c5NmHgZIcrRpHSeE3
         sMsNB3jeKyCvMECb5R0wMm2EGViJUaoqP6HxcuINBibvceuIHvLzLsP/sTBeKos8505+
         3ssQ==
X-Forwarded-Encrypted: i=1; AL+hErGkC20qw50qXylnO4tNJGl95TnP3+ifoPoSp7ivK0iRAXT91DgWzPhUDsvU2m5831mNg3YJc6iSUNEbGvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nPaEWaJUHGEQAHHOc+i1P7Q8cn2l/qS6a41rXYIoXw6Knx++6
	3GT2ySHsaZpf2FEnKoN0YeXxEH4UarHvQ4vMrnx4+2jNR7nxS1+0pUUVQGrjOZZbJTr8GzSSI36
	/fjNHYpuOWtXjfwh4kLcZyGevuZ48GzQ=
X-Gm-Gg: AYBFou2e2TDqI7uLuoc8eoVVDfRub8YJXxcxN7t7JwANVqL8a70+A2+IZpdl7spL/Zh
	TtF8j74mN7f8CpzuYK3uqpRQ6QwjvpID82pKlPJykcxX/6uQMNXht+tKQ1soX+NEAAw4hH5IIly
	aSGHAvmIls2wsKsIqMcu3ueoD8QvonxQaTpaLwP0CI3o+krYum99lzBDEOzC/WiwPkO0tDC2CW1
	Es96YVuFgJFgoTnISepXAe12oEFGRxtDbDWotQitQcHXSXGEUs1k8n4gsnFTV514GAdhQt9/kNY
	17Jajx808WcMcd1QBl24G5vAJarNJaa5Mv8w/3jD3/z49NykuetDeJrh2rVa6QnUoqdHS6tBfC9
	9EMaEkcx72+HZ/VfOAAaZNRp/dReb7Ywillktljxn8jXA9I+KiSPBeaxtsXxZahlATqfY8w==
X-Received: by 2002:aa7:c1c4:0:b0:6b5:90b9:e1f4 with SMTP id
 4fb4d7f45d1cf-6b7773edf4bmr819135a12.15.1794382997169; Tue, 10 Nov 2026
 23:43:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:43:04 +0100
X-Gm-Features: AclHuK-WWcZzAuRTugYoSHBXz8aDMS8vLzO87BtuVYEGxCZ10b0uUmgcqCUEPe8
Message-ID: <CA+=Fv5Tm4-DV9KEKxO11ta84EvqigB-KDemhOML1hx9zoxx0cA@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] alpha: Remove alpha_ prefix from custom syscall entries
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:26=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
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
> Changes from v7:
> - Fix __clone3 entry
> ---
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 790389a15c3c..25d05f45512d 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -729,9 +729,9 @@ ret_from_kernel_thread:
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
> @@ -746,7 +746,7 @@ alpha_\name:
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
> index 8fc4701a6328..59eb066a40bf 100644
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
> +545    common  clone3                          __sys__clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.56.0
>
>

This conflicts with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Commit d38895ba9330 ("alpha: dispatch system calls from C") removes
the fork_like assembly wrappers and changes the table entries to
sys_fork, sys_vfork, sys_clone and sys_clone3.

Consequently, this rename is no longer needed when integrating your
series on top of that branch. I skipped this patch for my integration
test and retained those existing entries.

My for-next is registered with linux-next, so this is an interaction
we should account for when the trees are combined.

Thanks,
Magnus

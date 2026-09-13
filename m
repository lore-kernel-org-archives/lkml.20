Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA25B360EF7
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292857; cv=pass; b=J1bDSJb/GcjhFl0ctpnDPljupww/e+JFS/4r7hv5y88uTnUPlO42dc6hnLR7sqM4BH++Nxk2q3lzQsnw3a+coO8fExbsYHOXDHq4NUClYXnz7SUqhRzIP2bENPH2tn+846B0mAx24WgeBVHbGOj5WqQRM1J/D3Im0pRKUe75iZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292857; c=relaxed/simple;
	bh=eJNTesAn6h2lzMt2G6CtkXXOdvXqAL/OpBlKJaqdu0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRgZRdblkqblkW6z5CR31rEGS3/PMAPa1ISdmmuEkVSwiBwiOT+xoT2gosj31X5WzE0QWNoVA/7Qv4iqIXKV0E/SimWFDawvbGi/05JTkPmuTrsDwxQcSNr9tv7a+amdg8rcV1K3jDVxrtkHH9PJSTrrMwyeX0H8Qj8kUM+SEDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8ehppNv; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8ehppNv"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c2so174482166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789292853; cv=none;
        d=google.com; s=arc-20260327;
        b=MC9ICkt0e36zzhsSiRPC5H9bTvJTK64PSs1USthn94kJ6C1TmjF01cXcnXMBf1qSMd
         W5CZw4TufqdpJgKNRFYar71/uEF2Ys6W57S1qsyC7fpH6idKkuTYXnHDA6vrQjXaIDQN
         Is9bdAbSOhTw7A+TfSprBKkWpqvmNfiNWl2COBOtv1fDWsgx7M6Re37BI/dz++wbYMbY
         rB5zzroDNaVppe9T63LpQS9aTFjD/WHXAjB/9y+A+dzGSGzRm+cN+Tm0N3ER08F+c6d4
         s+krsuU/X2+P/BetbNIEOUdz/o1ZLpHCK0vLct91ZJdu+CZVQN8rLZEHt+JsNJs0N7fp
         lHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZA6UhLFK2nKQBy/urUjDvw9ImmmMVXllGlAj00whEYQ=;
        fh=phNyVZ6vJsnTg4il5sLzLNrPbS5Qna6y50GS1NKvZyk=;
        b=OkN19lfr46+i/fZHJ6Opux3MkkjzIF8bNXMtZL+cWoZtvC/uAWz95tMN2dzJwonKIq
         rUcg2aFpfp77MbknpjHs5WQigeQW9P2sb4pvU//+ecc35i6BQJ56Q3f/UnbfRYAgY6hq
         sPwleMvOv6s3Zqt3AHIqwWEQdpS8p23Lxp5pzmwdgW9kFK4S7Jf7gFETUGRZE55QpJZK
         WCrrzqT7m0fioa8G9q4H0gMZw1JoNNPf7bstycjSdb7fLG/lUbl6eAHwRE+/BOGbSLWq
         lHukLgl+IBLQP4XDjt//hV0kyJU8FjrWjnTWSwgwSOfuMkNFJFXNtwZYouwGU7cAAy/l
         +uoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789292853; x=1789897653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZA6UhLFK2nKQBy/urUjDvw9ImmmMVXllGlAj00whEYQ=;
        b=h8ehppNv9a9mZN2mWTTSjPlxRZZ47DTOchDQwJfNkrnjSv9vP4CkJg9QyhnBBNPSYf
         q2vCzIXH1PCHcXoZV+/eqcs+OzyZHyuJ29KSkvfB5yGeb15eYnQB80QjSpJFWplTp+HB
         DF2LS2hg38+DG2uEJ9xT1mvrp69NaU2gLfUhMAIDX1Epes/9Gu6oSTTP0BG9BOj0wusG
         wHne81TegdQd85i2AD5fYiDkfOJsKiQYZozm+C6ZB7s26o5pJdrgw5nvq76czrlTfqaG
         KeEW2ECl38Vl1+v1b9h3DjbU4mRQrSCisYnflUmHPSB8WkDYS+N+PnH9lznyeRkUUEQQ
         opMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789292853; x=1789897653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZA6UhLFK2nKQBy/urUjDvw9ImmmMVXllGlAj00whEYQ=;
        b=mns2Plgd+MYSop3zEOQqcyzT7VDX6ySyhk6oKA8kDCnFd0lFOfNbuUEJ440n8MMk7W
         aQ3R9L2nx1urjGjfmQP40bhmCHG/rTEsLux+Pdi/1pSGGwUOSXZ1aUr+69GGxlU/RwFZ
         qOeA2AwXxWj5PUI9DfJbvtoLquAPBsLEepSJdAAjWs/A0r9cATpJV7IXIk+cXlt+tfFa
         CYoWo6UnDr+QiXzzZUUiWqiBvGivRURQze/QeNQdtwse7jCOfBA+3P/z4p1qTf9S45qf
         jzexVYWMvOsLGqQRIBjzR9Wfco4U9DyxewjV0iUniV7YJcxm04X9SX7v4/0kgrO/fEYH
         Fxgg==
X-Forwarded-Encrypted: i=1; AKwUvBz/3e3DgGd8cXODRm5MvME+SAti4M/uESza02Nu/u1VCP+VbUA5qT1s11XdK1zouSfCy1ECNqHs6QHGlZc=@vger.kernel.org
X-Gm-Message-State: AFuF++kJNSj/dHhKA5+uugeRIG8W7f1tTi+hpoF1yVWZBSCi0/eICjk+
	vQMA7TPr4VxfQKRAgvtlwMrUZOnrWOeHB2ZYGbd0gW5IDPXx2cnjdYpM4AnkSSFAEB1souWCjje
	SYn0eEmF6r5+/0/qM7efHKwG7K4c3EAw=
X-Gm-Gg: AYBFou00t3qxcOWm613TKZM3ThYV2pvuiBGS7J4dGReJTP1jg7FtSaib6qKWlHipatU
	Gm2Da1AAgbDqAnj6p+oJ+/k2i6ck16hzu9R0YddCMjBs3yHkbdCf0OPW/Gyf1ckvSs9lsj6z8zh
	oSpPI47zQD+Sn12ILW0ygE378PDuLhEhSP8urkOSDtwqm+PrPJoNXcFxn4oTU4JyQvuoVWVCSxm
	wg/bk81QEWDoISJgczZBOU4IQ0bXmBQpsAiFnedjUSPCLW1Rp5idTJ59DFUcMpe1E2jPCW/0Iwf
	R3ND5Zreqak6tGoEYtIarr4aAHdbQgVGy4vAi8nxxfOM3vbSUl3CsVJIqgfhg708XV/ErJbUdZE
	YVFRYweKgGO+7lNBx6+41naOuguaWruh+KzExuxzfTM+O0IZnEFI=
X-Received: by 2002:a17:907:7245:b0:c26:2a5:819 with SMTP id
 a640c23a62f3a-c29666f6d30mr1154408066b.18.1789292852706; Sun, 13 Sep 2026
 02:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com> <20260912-alpha-kernel-compression-v1-2-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-2-ce9d55330193@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 13 Sep 2026 11:47:21 +0200
X-Gm-Features: AcwNN1Wn8vDFe3kkeFSsO4X04COC04caHU0GY_q-GiU63xx0kOtwZKDVXikQwcI
Message-ID: <CA+=Fv5Q7rTXzMrKA6HVSwee5Zs4PAsV5t4NpwyF6HEiv8aohjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] alpha: add self-extracting compressed kernel boot stub
To: Matt Turner <mattst88@gmail.com>
Cc: Lasse Collin <lasse.collin@tukaani.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 12, 2026 at 9:55=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Alpha only ever supported gzip for the kernel image, and did so in a way
> out of step with every other architecture: aboot, the disk boot loader,
> decompresses vmlinux.gz itself with its own bundled inflate code, so
> adding a compression format meant writing a new decompressor inside
> aboot as well as in the kernel.
>
> Build a proper self-extracting arch/alpha/boot/compressed/vmlinux
> instead, modeled on parisc: a small ELF stub with the real, compressed
> vmlinux linked in, which decompresses the kernel, relocates it into
> place and jumps to its entry point. aboot needs no changes.
>
> The build now emits arch/alpha/boot/vmlinuz rather than vmlinux.gz,
> which was never a name aboot cared about and would be a lie for an ELF
> stub: the bootpz path in the same directory still produces real gzip
> data as vmlinux.nh.gz. Existing aboot.conf files name the image as it
> was installed in /boot, so only the command that copies it out of the
> build tree changes.
>
> Unlike parisc and mips, the stub is linked at START_ADDR rather than at
> a separate low address; see compressed/vmlinux.lds.S. It has no console
> output, since bringing up the HWRPB console callbacks needs more than
> the CRB dispatch the kernel proper does much later, so error() just
> halts.
>
> The legacy SRM netboot path (bootpz.c) is left alone: it has its own
> boot protocol (PALcode reinitialization, self-populated ZERO_PGE,
> build-time-computed image sizes) that does not fit this design without a
> separate rewrite, and keeps using plain gzip via vmlinux.nh.gz.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig                       |   1 +
>  arch/alpha/Makefile                      |   6 +-
>  arch/alpha/boot/.gitignore               |   2 +
>  arch/alpha/boot/Makefile                 |  16 ++-
>  arch/alpha/boot/compressed/.gitignore    |   3 +
>  arch/alpha/boot/compressed/Makefile      |  36 +++++++
>  arch/alpha/boot/compressed/head.S        |  36 +++++++
>  arch/alpha/boot/compressed/misc.c        | 178 +++++++++++++++++++++++++=
++++++
>  arch/alpha/boot/compressed/trampoline.S  |  46 ++++++++
>  arch/alpha/boot/compressed/vmlinux.lds.S |  83 ++++++++++++++
>  arch/alpha/boot/compressed/vmlinux.scr   |  10 ++
>  11 files changed, 409 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 04511242506b..2688bb00f175 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -30,6 +30,7 @@ config ALPHA
>         select HAVE_ASM_MODVERSIONS
>         select HAVE_DEBUG_KMEMLEAK
>         select HAVE_GUP_FAST
> +       select HAVE_KERNEL_GZIP
>         select HAVE_PAGE_SIZE_8KB
>         select HAVE_PCSPKR_PLATFORM
>         select HAVE_PERF_EVENTS
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 7074602dca94..405d4bfd644c 100644
> --- a/arch/alpha/Makefile
> +++ b/arch/alpha/Makefile
> @@ -47,9 +47,9 @@ export LIBS_Y
>  boot :=3D arch/alpha/boot
>
>  #Default target when executing make with no arguments
> -all boot: $(boot)/vmlinux.gz
> +all boot: $(boot)/vmlinuz
>
> -$(boot)/vmlinux.gz: vmlinux
> +$(boot)/vmlinuz: vmlinux
>         $(Q)$(MAKE) $(build)=3D$(boot) $@
>
>  bootimage bootpfile bootpzfile: vmlinux
> @@ -59,7 +59,7 @@ archheaders:
>         $(Q)$(MAKE) $(build)=3Darch/alpha/kernel/syscalls all
>
>  define archhelp
> -  echo '* boot         - Compressed kernel image (arch/alpha/boot/vmlinu=
x.gz)'
> +  echo '* boot         -using
alpha-unknown-linux-gnu- Compressed kernel image (arch/alpha/boot/vmlinuz)'
>    echo '  bootimage    - SRM bootable image (arch/alpha/boot/bootimage)'
>    echo '  bootpfile    - BOOTP bootable image (arch/alpha/boot/bootpfile=
)'
>    echo '  bootpzfile   - compressed kernel BOOTP image (arch/alpha/boot/=
bootpzfile)'
> diff --git a/arch/alpha/boot/.gitignore b/arch/alpha/boot/.gitignore
> new file mode 100644
> index 000000000000..4125506521f6
> --- /dev/null
> +++ b/arch/alpha/boot/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +vmlinuz
> diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
> index d8dba85e606c..7c2a41c1e2a0 100644
> --- a/arch/alpha/boot/Makefile
> +++ b/arch/alpha/boot/Makefile
> @@ -9,9 +9,10 @@
>  #
>
>  hostprogs      :=3D tools/mkbb tools/objstrip
> -targets                :=3D vmlinux.gz vmlinux \
> +targets                :=3D vmlinuz vmlinux \
>                    vmlinux.nh tools/lxboot tools/bootlx tools/bootph \
> -                  tools/bootpzh bootloader bootpheader bootpzheader
> +                  tools/bootpzh bootloader bootpheader bootpzheader
> +subdir-                :=3D compressed
>  OBJSTRIP       :=3D $(obj)/tools/objstrip
>
>  KBUILD_HOSTCFLAGS :=3D -Wall -I$(objtree)/usr/include
> @@ -38,9 +39,14 @@ ifdef INITRD
>         cat $(INITRD) >> $@
>  endif
>
> -# Compressed kernel image
> -$(obj)/vmlinux.gz: $(obj)/vmlinux FORCE
> -       $(call if_changed,gzip)
> +# Self-extracting compressed kernel image: a small ELF stub (see
> +# compressed/) with the real vmlinux linked in compressed, which aboot
> +# loads and enters like a plain vmlinux.
> +$(obj)/compressed/vmlinux: vmlinux FORCE
> +       $(Q)$(MAKE) $(build)=3D$(obj)/compressed $@
> +
> +$(obj)/vmlinuz: $(obj)/compressed/vmlinux FORCE
> +       $(call if_changed,copy)
>         @echo '  Kernel $@ is ready'
>
>  $(obj)/main.o: $(obj)/ksize.h
> diff --git a/arch/alpha/boot/compressed/.gitignore b/arch/alpha/boot/comp=
ressed/.gitignore
> new file mode 100644
> index 000000000000..765a08f1bd77
> --- /dev/null
> +++ b/arch/alpha/boot/compressed/.gitignore
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +vmlinux
> +vmlinux.lds
> diff --git a/arch/alpha/boot/compressed/Makefile b/arch/alpha/boot/compre=
ssed/Makefile
> new file mode 100644
> index 000000000000..d826f7e4384d
> --- /dev/null
> +++ b/arch/alpha/boot/compressed/Makefile
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Create a self-extracting compressed vmlinux image from the original
> +# vmlinux. aboot loads and enters it like a plain vmlinux.
> +#
> +
> +OBJECTS :=3D head.o misc.o trampoline.o piggy.o
> +targets :=3D vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz
> +targets +=3D $(OBJECTS)
> +
> +# The stub runs before the kernel has identified the CPU it booted on, s=
o
> +# build it for the base Alpha instruction set rather than inheriting the
> +# kernel's -mcpu=3D.
> +KBUILD_CFLAGS :=3D -D__KERNEL__ -std=3Dgnu11 -Os -fno-strict-aliasing
> +KBUILD_CFLAGS +=3D -fno-PIE -ffreestanding -fno-stack-protector
> +KBUILD_CFLAGS +=3D -fno-asynchronous-unwind-tables
> +KBUILD_CFLAGS +=3D -pipe -mno-fp-regs -ffixed-8
> +KBUILD_CFLAGS +=3D -DDISABLE_BRANCH_PROFILING -D__DISABLE_EXPORTS
> +KBUILD_CFLAGS +=3D $(CC_FLAGS_DIALECT)
> +
> +LDFLAGS_vmlinux :=3D -X --orphan-handling=3Dwarn -T
> +$(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) $(LI=
BS_Y) FORCE
> +       $(call if_changed,ld)
> +
> +OBJCOPYFLAGS_vmlinux.bin :=3D -R .comment -R .note -S
> +$(obj)/vmlinux.bin: vmlinux FORCE
> +       $(call if_changed,objcopy)
> +
> +suffix-$(CONFIG_KERNEL_GZIP)   :=3D gz
> +
> +$(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
> +       $(call if_changed,gzip)
> +
> +LDFLAGS_piggy.o :=3D -r --format binary --oformat elf64-alpha -T
> +$(obj)/piggy.o: $(obj)/vmlinux.scr $(obj)/vmlinux.bin.$(suffix-y) FORCE
> +       $(call if_changed,ld)
> diff --git a/arch/alpha/boot/compressed/head.S b/arch/alpha/boot/compress=
ed/head.S
> new file mode 100644
> index 000000000000..c689ac439d15
> --- /dev/null
> +++ b/arch/alpha/boot/compressed/head.S
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Entry point for the self-extracting compressed kernel stub. aboot
> + * jumps here with the OSF/1 parameter page (ZERO_PGE) already populated
> + * and $30 set to INIT_STACK, exactly as it would for an uncompressed
> + * vmlinux.
> + */
> +
> +#include <linux/init.h>
> +#include <asm/pal.h>
> +
> +       .set noreorder
> +
> +__HEAD
> +       .globl  __start
> +       .ent    __start
> +__start:
> +       br      $29,1f
> +1:     ldgp    $29,0($29)
> +
> +       /*
> +        * Clear our own bss. The decompressors keep state there, and
> +        * nothing guarantees that aboot zeroed the part of our PT_LOAD
> +        * segment that has no file backing.
> +        */
> +       lda     $1,_bss
> +       lda     $2,_ebss
> +2:     cmpult  $1,$2,$3
> +       beq     $3,3f
> +       stq     $31,0($1)
> +       addq    $1,8,$1
> +       br      $31,2b
> +
> +3:     jsr     $26,decompress_and_boot
> +       call_pal PAL_halt
> +       .end __start
> diff --git a/arch/alpha/boot/compressed/misc.c b/arch/alpha/boot/compress=
ed/misc.c
> new file mode 100644
> index 000000000000..72998582be68
> --- /dev/null
> +++ b/arch/alpha/boot/compressed/misc.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Decompression and self-relocation for the compressed kernel boot stub=
,
> + * based on arch/parisc/boot/compressed/misc.c.
> + *
> + * aboot loads the stub as an ordinary ELF at START_ADDR and jumps to it
> + * with the parameter page and stack already set up; vmlinux.lds.S
> + * explains why the stub has to be linked there. We decompress above our
> + * own bss and never write below START_ADDR, so what aboot prepared stay=
s
> + * valid for the real kernel.
> + */
> +
> +#include <linux/elf.h>
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include <asm/hwrpb.h>
> +#include <asm/page.h>
> +#include <asm/pal.h>
> +#include <asm/setup.h>
> +
> +#define STATIC static
> +#define memzero(s, n) memset((s), 0, (n))
> +
> +extern char input_data[];
> +extern int input_len;
> +/* output_len is inserted by the linker, possibly at an unaligned addres=
s */
> +extern char output_len;
> +
> +extern char _ebss[];
> +extern char trampoline_start[], trampoline_end[];
> +
> +static unsigned long free_mem_ptr;
> +static unsigned long free_mem_end_ptr;
> +static unsigned long mem_end;
> +
> +/* The stub has no console, so the message is only for debuggers. */
> +void __noreturn error(char *m)
> +{
> +       while (1)
> +               __halt();
> +}
> +
> +#ifdef CONFIG_KERNEL_GZIP
> +#include "../../../../lib/decompress_inflate.c"
> +#endif
> +
> +/* Scratch heap for the decompressors, larger than any of them needs. */
> +#define STUB_HEAP_SIZE (4 * 1024 * 1024)
> +
> +/*
> + * Type punning through a packed struct, to avoid the warnings the regul=
ar
> + * get_unaligned_le32() produces when reading a char-typed symbol as an
> + * integer.
> + */
> +static u32 punned_get_unaligned_le32(const void *p)
> +{
> +       const struct { __le32 x; } __packed *pp =3D p;
> +
> +       return le32_to_cpu(pp->x);
> +}
> +
> +/*
> + * End of the usable memory cluster that holds the kernel, or 0 if the
> + * HWRPB does not describe one. Used to check that the decompressed imag=
e
> + * and the stub's scratch space fit before anything is written.
> + */
> +static unsigned long usable_memory_end(void)
> +{
> +       struct hwrpb_struct *hwrpb;
> +       struct memdesc_struct *memdesc;
> +       unsigned long pfn =3D (START_ADDR - PAGE_OFFSET) >> PAGE_SHIFT;
> +       unsigned long i;
> +
> +       hwrpb =3D (struct hwrpb_struct *)(PAGE_OFFSET + INIT_HWRPB->phys_=
addr);
> +       memdesc =3D (struct using
alpha-unknown-linux-gnu-using
alpha-unknown-linux-gnu-memdesc_struct *)((unsigned long)hwrpb +
> +                                           hwrpb->mddt_offset);
> +
> +       for (i =3D 0; i < memdesc->numclusters; i++) {
> +               struct memclust_struct *cluster =3D &memdesc->cluster[i];
> +               unsigned long end_pfn =3D cluster->start_pfn + cluster->n=
umpages;
> +
> +               if (cluster->usage)
> +                       continue;
> +               if (pfn >=3D cluster->start_pfn && pfn < end_pfn)
> +                       return PAGE_OFFSET + (end_pfn << PAGE_SHIFT);
> +       }
> +
> +       return 0;
> +}
> +
> +/*
> + * Move the decompressed kernel's single PT_LOAD segment down onto
> + * START_ADDR and jump to its entry point. The kernel is always linked
> + * with exactly one PT_LOAD whose p_vaddr equals its e_entry equals
> + * START_ADDR (see arch/alpha/kernel/vmlinux.lds.S); anything else we do
> + * not know how to boot.
> + *
> + * The copy cannot run from this stub, which is itself executing at
> + * START_ADDR; see trampoline.S.
> + */
> +static void __noreturn relocate_and_jump(void *image)
> +{
> +       void (*trampoline)(unsigned long dest, unsigned long src,
> +                          unsigned long filesz, unsigned long memsz,
> +                          unsigned long entry);
> +       unsigned long tramp_len =3D trampoline_end - trampoline_start;
> +       Elf64_Phdr phdr, load_phdr =3D {};
> +       Elf64_Ehdr ehdr;
> +       int i, found_load =3D 0;
> +       unsigned long tramp;
> +
> +       memcpy(&ehdr, image, sizeof(ehdr));
> +
> +       if (ehdr.e_ident[EI_MAG0] !=3D ELFMAG0 ||
> +           ehdr.e_ident[EI_MAG1] !=3D ELFMAG1 ||
> +           ehdr.e_ident[EI_MAG2] !=3D ELFMAG2 ||
> +           ehdr.e_ident[EI_MAG3] !=3D ELFMAG3 ||
> +           ehdr.e_ident[EI_CLASS] !=3D ELFCLASS64 ||
> +           ehdr.e_ident[EI_DATA] !=3D ELFDATA2LSB ||
> +           ehdr.e_machine !=3D EM_ALPHA ||
> +           ehdr.e_type !=3D ET_EXEC ||
> +           ehdr.e_entry !=3D START_ADDR)
> +               error("Not a bootable Alpha kernel image");
> +
> +       for (i =3D 0; i < ehdr.e_phnum; i++) {
> +               memcpy(&phdr, image + ehdr.e_phoff + i * ehdr.e_phentsize=
,
> +                      sizeof(phdr));
> +
> +               if (phdr.p_type !=3D PT_LOAD)
> +                       continue;
> +               if (found_load || phdr.p_vaddr !=3D START_ADDR)
> +                       error("Unexpected kernel segment layout");
> +               found_load =3D 1;
> +               load_phdr =3D phdr;
> +       }
> +       if (!found_load)
> +               error("Kernel image has no PT_LOAD segment");
> +
> +       /*
> +        * The trampoline has to outlive both the scratch heap it is copi=
ed
> +        * into and the region it is about to write, which extends past t=
he
> +        * kernel's file image to the end of its bss.
> +        */
> +       tramp =3D ALIGN(max(free_mem_end_ptr, START_ADDR + load_phdr.p_me=
msz), 8);
> +       if (mem_end && tramp + tramp_len > mem_end)
> +               error("Not enough memory to relocate the kernel");
> +
> +       memcpy((void *)tramp, trampoline_start, tramp_len);
> +       imb();
> +using
alpha-unknown-linux-gnu-
> +       trampoline =3D (void *)tramp;
> +       trampoline(load_phdr.p_vaddr,
> +                  (unsigned long)image + load_phdr.p_offset,
> +                  load_phdr.p_filesz, load_phdr.p_memsz, ehdr.e_entry);
> +       unreachable();
> +}
> +
> +void __noreturn decompress_and_boot(void)
> +{
> +       unsigned long image_len =3D punned_get_unaligned_le32(&output_len=
);
> +       void *image =3D (void *)ALIGN((unsigned long)_ebss, PAGE_SIZE);
> +
> +       free_mem_ptr =3D ALIGN((unsigned long)image + image_len, PAGE_SIZ=
E);
> +       free_mem_end_ptr =3D free_mem_ptr + STUB_HEAP_SIZE;
> +
> +       mem_end =3D usable_memory_end();
> +       if (mem_end && free_mem_end_ptr > mem_end)
> +               error("Not enough memory to decompress the kernel");
> +
> +       /* Some decompressors report failure only through the return valu=
e. */
> +       if (__decompress(input_data, input_len, NULL, NULL, image, image_=
len,
> +                        NULL, error))
> +               error("Kernel decompression failed");
> +
> +       relocate_and_jump(image);
> +}
> diff --git a/arch/alpha/boot/compressed/trampoline.S b/arch/alpha/boot/co=
mpressed/trampoline.S
> new file mode 100644
> index 000000000000..bf57d3b0fd7f
> --- /dev/null
> +++ b/arch/alpha/boot/compressed/trampoline.S
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copy the decompressed kernel onto START_ADDR, clear its bss and jump =
to
> + * its entry point. See relocate_and_jump() in misc.c for why this canno=
t
> + * run from the stub itself. It is position independent (no data or
> + * rodata references, no gp) and clobbers only its argument registers an=
d
> + * $1, so misc.c can copy it anywhere and call it there.
> + */
> +
> +       .set noreorder
> +
> +       .globl  trampoline_start
> +       .globl  trampoline_end
> +       .ent    trampoline_start
> +trampoline_start:
> +       /* $16 =3D dest, $17 =3D src, $18 =3D p_filesz, $19 =3D p_memsz, =
$20 =3D entry */
> +
> +       /*
> +        * dest and src are both page aligned, and everything above
> +        * p_filesz is bss, so round both lengths up and work in quadword=
s
> +        * only, using instructions every Alpha implements.
> +        */
> +       addq    $18,7,$18
> +       bic     $18,7,$18
> +       addq    $19,7,$19
> +       bic     $19,7,$19
> +       subq    $19,$18,$19             /* bytes to zero after the copy *=
/
> +
> +1:     beq     $18,2f
> +       ldq     $1,0($17)
> +       stq     $1,0($16)
> +       addq    $17,8,$17
> +       addq    $16,8,$16
> +       subq    $18,8,$18
> +       br      $31,1b
> +
> +2:     beq     $19,3f
> +       stq     $31,0($16)
> +       addq    $16,8,$16
> +       subq    $19,8,$19
> +       br      $31,2b
> +
> +3:     imb
> +       jmp     $31,($20)
> +       .end trampoline_start
> +trampoline_end:
> diff --git a/arch/alpha/boot/compressed/vmlinux.lds.S b/arch/alpha/boot/c=
ompressed/vmlinux.lds.S
> new file mode 100644
> index 000000000000..5328c1ccaccf
> --- /dev/null
> +++ b/arch/alpha/boot/compressed/vmlinux.lds.S
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm-generic/vmlinux.lds.h>
> +#include <asm/page.h>
> +#include <asm/setup.h>
> +
> +OUTPUT_FORMAT("elf64-alpha")
> +OUTPUT_ARCH(alpha)
> +ENTRY(__start)
> +
> +SECTIONS
> +{
> +       /*
> +        * Link the stub at the address the real, uncompressed vmlinux ha=
s
> +        * always occupied. aboot derives the OSF/1 parameter-page
> +        * (ZERO_PGE) and initial stack (INIT_STACK) addresses from the
> +        * loaded image's own p_vaddr, so a stub linked anywhere else wou=
ld
> +        * hand the real kernel a parameter page it does not expect.
> +        */
> +       . =3D START_ADDR;
> +
> +       .head.text : {
> +               _head =3D .;
> +               HEAD_TEXT
> +               _ehead =3D .;
> +       }
> +
> +       . =3D ALIGN(8);
> +       .rodata.compressed : {
> +               *(.rodata.compressed)
> +       }
> +
> +       . =3D ALIGN(PAGE_SIZE);
> +       .text : {
> +               _text =3D .;
> +               *(.text)
> +               *(.text.*)
> +               _etext =3D .;
> +       }
> +       . =3D ALIGN(8);
> +       .rodata : {
> +               *(.rodata)
> +               *(.rodata.*)
> +       }
> +       . =3D ALIGN(8);
> +       .data : {
> +               *(.data)
> +               *(.data.*)
> +       }
> +       .got : {
> +               *(.got)
> +       }
> +       .sdata : {
> +               *(.sdata)
> +       }
> +       /*
> +        * misc.c decompresses to _ebss, so nothing that the stub still
> +        * needs may be placed after .bss. --orphan-handling=3Dwarn keeps=
 a
> +        * new section from silently landing there.
> +        */
> +       . =3D ALIGN(8);
> +       .bss : {
> +               _bss =3D .;
> +               *(.sbss)
> +               *(.scommon)
> +               *(.bss)
> +               *(.bss.*)
> +               *(COMMON)
> +               . =3D ALIGN(8);
> +               _ebss =3D .;
> +       }
> +
> +       STABS_DEBUG
> +       DWARF_DEBUG
> +       ELF_DETAILS
> +
> +       DISCARDS
> +       /DISCARD/ : {
> +               *(.eh_frame)
> +               *(.modinfo)
> +               *(.note)
> +               *(.note.*)
> +       }
> +}
> diff --git a/arch/alpha/boot/compressed/vmlinux.scr b/arch/alpha/boot/com=
pressed/vmlinux.scr
> new file mode 100644
> index 000000000000..dac2d142bcfa
> --- /dev/nullusing
alpha-unknown-linux-gnu-
> +++ b/arch/alpha/boot/compressed/vmlinux.scr
> @@ -0,0 +1,10 @@
> +SECTIONS
> +{
> +  .rodata.compressed : {
> +       input_len =3D .;
> +       LONG(input_data_end - input_data) input_data =3D .;
> +       *(.data)
> +       output_len =3D . - 4; /* can be at unaligned address */
> +       input_data_end =3D .;
> +       }
> +}
>
> --
> 2.54.0
>
I reviewed the self-extracting boot stub and tested the complete series
on an UP2000+ at 833 MHz through SRM and aboot
1.0_pre20040408.

The bzip2, lzma, xz and zstd self-extracting kernels all booted
successfully.

I additionally boot-tested the bzip2 image with an external 896000-byte
uncompressed cpio initramfs. aboot loaded it at
0xfffffc007ff16000, and the initramfs reached userspace intact.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

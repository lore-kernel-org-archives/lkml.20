Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719223A901C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941799; cv=pass; b=BgrfHEtXiyd/FPZ/0dNK+PHhTSyL43IJ1BzPBexAwqf8ePOr7Tx+C2IDytI7wMk0ngJGx0Rj786DHjjf8QtyS2WxL/tU5vKihcwMesvuRJvC4mf9Z1dYhPieG3BZ/hS+UqmD9SnffZlY73fDL73pitXdbTJhbBMyg5FP6AMPjHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941799; c=relaxed/simple;
	bh=7s8SHlsqyt2AUfFDcYfnHSUF9xCjR4O62YhHFP5HeT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8WYlvA16OLFA5jYOi+o2HzRAbaMPvcE2yblcCsguv4ybVtxTWip1zyPiHVeS/MxnCbLQ3JiZdkam0jEMsYPD1KOsnjLkpOctNhhxZ5rZMHWw7/qbxfbudmSq+xFWiJAmonHlnfxMmtThKIjlBi46ltG9gK/m+9wRgdi+wrd568=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cde6jRyM; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cde6jRyM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso1799103f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787941795; cv=none;
        d=google.com; s=arc-20260327;
        b=IwlFzYQY1Std7wS4HqVTNN8yEWQ0ZwVVLSY+8WWU+1Ujrf+TeKZ66qekSsvIEtxTYv
         M0r7yCl4rSoWfX42ql9VMSUbbi7jyfzJdeogOtygAYk4xIvBzqaPV2tQCHdmiGficuDt
         Gb+KO5nRp9YtVlEXjAWDqJCBuPCrn+3ODSzDgx1TNf/FVCRxQ69m758yD0ETGn3qMf/f
         U/IgvNauovZHn/N76XwPLpWSIDOEsNieucA1NoN67iThPnVgeOXTq1dX9uu8Ds0e6n6Y
         /xt9MFPqmQOXWP8dPVX/e9PZmMGw+RwBF99Qf5K2DLYyghrIXNKUEfOwsnZUnM1DIqcf
         eGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=;
        fh=CZt5ub+reOBjBSh4n4oADj7vA8Oz/R7sAcq40iSQanU=;
        b=q3cUk+Xvqapu1vMuHiQ0GiSdFF17SPRwQLzVb8HXIdKUlbz98GXvVnSpJMmvAeI/e6
         XomX9FR0+32vUCHopijzehL0iiPllzHh2SbEk8IoiQ8DHWuNvUBd7ypzwLkDAu3UK+mJ
         vjW4PD47GSYCP9+bNhVPuWPcscm5ZBD52idhka/IoX1NS3fMWTzWiAAUvpm/T8it/I+g
         hrsJHqsbSI2apjZwbSLex2TxC7xLvum8KpDS3DvjXiomuorp/EjwTbfZvUN8e+sm/b3/
         o/apMQRSMs5hTswlgPJoHABk0FfF3MRwVfBDmyw+uCDups7dekmtGnI9YgxBt7ykHGwu
         VRgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787941795; x=1788546595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=;
        b=cde6jRyMCiYwDuYjtsDxdicI4kdNgBceBr3G6nfAwi2VQRHYhhHetZZPqDxdiFAcyI
         ASVywQAIRexKkceVCxP796MAeeO4hA2Gqf67eV/fRtEb6NAmOIwaizDQL+vm2hptdp10
         l6PWRdrZUWcj0Jbx5fdtZ+VRChWSo9yFHUXLfmYcpZ4lr3z/HZcysBGsKQxbbwkTm+Lh
         7xUy9nBhIdib8TFkCHVYnSdDId1kCnFx/22sGpXhAQ7AOPyyw8CU/RnbMskGdotWb/1x
         78Z3h1xgAo0hxJKEEU+BNkHjbI0GqThSzfnZMsj3YhAv7oWQuxvsQ2bLUn4fWRNfaSjk
         84GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787941795; x=1788546595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=;
        b=KSRixkrrcCZbil6dMhQuToTTnt9jVRHhise/l2Sxjh692y3tQGNR/dAXuO2TZAEUit
         Pbe45oZsjg7o+ybUD+dUrU386jjKLLZN6wjRk4/cqPePsODiJF/TnbGsprwBlcQmOqdC
         0FFDIpntodHguZUNxf/uk4sRgUAC7WygTD0mnwUXhT0NDCrg9EHYJAKianOk5sAFCMGP
         kEEPFlx31t5oOqi7xSWnBsu+q7P9tgg9P4FRkvWMSjLejgSndrBD5RPB2WJDzs4SlLsV
         KSKZf2/uPmn+Mk1gCRAC7pQMn9nevGZmRbDHiRlVpxFLnK5x0LEOdnfRreKXOwtQ8ZEe
         rVWw==
X-Forwarded-Encrypted: i=1; AHgh+RoKsbTEKfvTo+tASftw86363OCZUFfyaXQoQ5awwUkC5zkwvu0aayERuHWKeE2kfnVdH/FQybFHmFixlVE=@vger.kernel.org
X-Gm-Message-State: AFuF++kQr1KxxG+5g7lGdeMIGAXtSEeYodCqfLgRE3as/Sco8wQsO4lD
	1jYIhc6AU83SQd1aBUOx9rVN6c6hl2Oz+rwQzA4LmuWyT8vZd70zwXzdN8yBdC5z7m7UBT3v6eZ
	pBF6lKCT3umaLRYOXUIkU8oaUA2P+nNg8e9Cd9PeK
X-Gm-Gg: AR+sD13Q0+Y/kAqVGg9CqI8WE2vZo0g3CCeALgy/VEBh0s8ahhyrW8EPNNRh8U32B6K
	17dUYzogER0Cu+tvaxRSLdpfIa2My9WQCDcAxpP5Ky1R3uP7EpYt8DTFq2RLWwG5Rp43kDa68XL
	RsRGwGvCfi9vl7mzeQsDj68lT0LL45RX0BBP0XWl8Ccfqn3v0iwk3J5VufZl8OvAANuU2JCfT+/
	gvV1zrAvNhqM6rpDVO0MQFbdkqOR8zDl0vbt5gazGLZHlko+2UAdJN1SLRX9llqFKm/cnFPfooJ
	vOUASMZ6Y1YncoUDX3Zxn7dO+nm5+x9jtHgTmJ9czaXvNX6RkXErodx9sBj7gUMAYdoYBEyh1PC
	Aw8nL6ycAp0361eXE4P8Sm7i/D7NtrGSraXqDoyKYSX0XDDsvLWLln9+0Jg==
X-Received: by 2002:a05:6000:25ee:b0:482:ea3e:882a with SMTP id
 ffacd0b85a97d-482eab75e7dmr25940329f8f.6.1787941794160; Fri, 28 Aug 2026
 11:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
In-Reply-To: <20260827194508.446733-1-linux@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Aug 2026 11:29:42 -0700
X-Gm-Features: AcwNN1Wo8FotnJAZ3x2qyZAW16XADYe-Cm0K9lnOHcg75ObfT4YQxREeCDOy8I4
Message-ID: <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com> =
wrote:
>
> The suspend code that runs from OCRAM is copied there with fncpy(),
> which does not copy the kCFI type hash preceding the function. With
> CONFIG_CFI=3Dy the indirect call through imx6_suspend_in_ocram_fn
> therefore panics.
>
> Keep the call covered by CFI instead of exempting it:

Nice!  This is a pretty good progression.

>
> - Declare imx6_suspend() with SYM_TYPED_FUNC_START() so a type hash
>   is emitted for it. fncpy() requires the entry point to be 8-byte
>   aligned, and the macro's alignment applies to the hash rather than
>   the entry that follows it, so pad manually before the macro.
>
> - Add a cfi_type member at the end of struct imx6_cpu_pm_info, which
>   directly precedes the OCRAM copy of the function. It fits in the
>   struct's tail padding, so no sizes or offsets change. Fill it using
>   cfi_get_func_hash(), putting the hash where the caller's CFI check
>   expects it: four bytes before the function entry.
>
> Also mark ccm_base, suspend_ocram_base and imx6_suspend_in_ocram_fn
> as __ro_after_init: they are only written during __init, and the
> function pointer in particular should not be writable afterwards.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
> ---
> Tested on a Kobo Clara HD (i.MX6SLL) running postmarketOS
> (clang/LLVM, CONFIG_CFI=3Dy): suspend and resume work.
>
> Changes in v4, all following Nick's suggestions:
> - Drop the v3 __nocfi wrapper; keep the indirect call CFI-checked.
> - Store the hash in a cfi_type member in the struct's tail padding
>   instead of open-coded pointer arithmetic.
> - Use cfi_get_func_hash() instead of reading the hash manually.
> - Use SYM_TYPED_FUNC_START()/SYM_FUNC_END() instead of ENTRY()/
>   ENDPROC() with a hand-rolled __CFI_TYPE.
>
> Note: linux/uaccess.h is included before linux/cfi.h because
> cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> include uaccess.h itself.

Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.

>
>  arch/arm/mach-imx/pm-imx6.c      | 25 ++++++++++++++++++++++---
>  arch/arm/mach-imx/suspend-imx6.S | 14 ++++++++++++--
>  2 files changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca4..2d3d3cd 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -4,6 +4,8 @@
>   * Copyright 2011 Linaro Ltd.
>   */
>
> +#include <linux/uaccess.h>
> +#include <linux/cfi.h>

This is a bug in include/linux/cfi.h; don't work around it. Fix it.

>  #include <linux/clk/imx.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
> @@ -61,9 +63,9 @@
>  #define MX6Q_SUSPEND_OCRAM_SIZE                0x1000
>  #define MX6_MAX_MMDC_IO_NUM            33
>
> -static void __iomem *ccm_base;
> -static void __iomem *suspend_ocram_base;
> -static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);
> +static void __iomem *ccm_base __ro_after_init;
> +static void __iomem *suspend_ocram_base __ro_after_init;
> +static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_=
after_init;
>
>  /*
>   * suspend ocram space layout:
> @@ -229,8 +231,18 @@ struct imx6_cpu_pm_info {
>         struct imx6_pm_base l2_base;
>         u32 mmdc_io_num; /* Number of MMDC IOs which need saved/restored.=
 */
>         u32 mmdc_io_val[MX6_MAX_MMDC_IO_NUM][2]; /* To save offset and va=
lue */
> +       u32 cfi_type; /* kCFI type hash of imx6_suspend() */
>  } __aligned(8);
>
> +/*
> + * The ocram copy of imx6_suspend() starts right after struct imx6_cpu_p=
m_info,
> + * and the CFI check on the indirect call reads the kCFI type hash from =
the
> + * four bytes preceding the function entry, so cfi_type must occupy the =
last
> + * four bytes of the struct, i.e. fit into its tail padding.
> + */
> +static_assert(offsetofend(struct imx6_cpu_pm_info, cfi_type) =3D=3D
> +             sizeof(struct imx6_cpu_pm_info));

on this IWYU thread, shall we also include linux/build_bug.h for
static_assert or linux/stddef.h for offsetofend?

> +
>  void imx6_set_int_mem_clk_lpm(bool enable)
>  {
>         u32 val =3D readl_relaxed(ccm_base + CGPR);
> @@ -568,6 +580,13 @@ static int __init imx6q_suspend_init(const struct im=
x6_pm_socdata *socdata)
>                         mmdc_offset_array[i]);
>         }
>
> +       /*
> +        * Mask out the Thumb bit, as cfi_get_func_hash() expects the
> +        * function's actual start address. Returns 0 if CONFIG_CFI=3Dn.
> +        */
> +       pm_info->cfi_type =3D
> +               cfi_get_func_hash((void *)((uintptr_t)&imx6_suspend & ~1U=
L));
> +
>         imx6_suspend_in_ocram_fn =3D fncpy(
>                 suspend_ocram_base + sizeof(*pm_info),
>                 &imx6_suspend,
> diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend=
-imx6.S
> index 63ccc2d..f60c4e5 100644
> --- a/arch/arm/mach-imx/suspend-imx6.S
> +++ b/arch/arm/mach-imx/suspend-imx6.S
> @@ -3,6 +3,7 @@
>   * Copyright 2014 Freescale Semiconductor, Inc.
>   */
>
> +#include <linux/cfi_types.h>
>  #include <linux/linkage.h>
>  #include <asm/assembler.h>
>  #include <asm/asm-offsets.h>
> @@ -148,7 +149,16 @@
>
>         .endm
>
> -ENTRY(imx6_suspend)
> +#ifdef CONFIG_CFI
> +       /*
> +        * Pad the location counter so that the type hash emitted by
> +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> +        * fncpy() requires the function entry to be 8-byte aligned.
> +        */
> +       .align  3
> +       .4byte  0

I still don't like these assembler directives inline like this; this
feels like we should have perhaps a new macro in
include/linux/cfi_types.h. Thoughts, Sami?

One that garuntees the 8B alignment of the symbol for w/e that
function patching routine requires?

> +#endif
> +SYM_TYPED_FUNC_START(imx6_suspend)
>         ldr     r1, [r0, #PM_INFO_PBASE_OFFSET]
>         ldr     r2, [r0, #PM_INFO_RESUME_ADDR_OFFSET]
>         ldr     r3, [r0, #PM_INFO_DDR_TYPE_OFFSET]
> @@ -329,4 +339,4 @@ resume:
>         resume_mmdc
>
>         ret     lr
> -ENDPROC(imx6_suspend)
> +SYM_FUNC_END(imx6_suspend)
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers

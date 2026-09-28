Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603F33A02B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580163; cv=pass; b=dba18uFe58JXE1eCC7z1A6shDAixvR1mPBlPQKOMG/gjOju996qj7xRzEwD9HsVGjxrap+KaPhrs8gEuVn5OJQxIag6RXj463+HUXI8BRMa3V57wCAY7LxPAaC0TkNqpfjE7zR9m2jcODJPyQC0ikPIvlBrwgzxgHNTGlaPJPAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580163; c=relaxed/simple;
	bh=APrQLHWyNaMSnUAIds3Epz7+tbhmT/nxmeVzEs8HE4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TW/zNnMvDjE5qe/KsRHCpzFRKNt5XvvTP1QRjeKCOLDqoo0blGogWj5f/2u4aspy95ThnmSYsPAl+ievp0y7Bs6vqqN2vx6hdUpqbRpFoYos+/vXuxpcDmVqypCrAvesV/HoGSYE4faRMgHTqxCSNqHGewnPessYzeNacjNOUYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aowtTon9; arc=pass smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aowtTon9"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-98729795320so440492241.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790580154; cv=none;
        d=google.com; s=arc-20260327;
        b=bpYDp/O7IKKzDXUrq++hLImhPSnd2rFd7t8W3TWJhq1m4DPIjO/8bnE4ijQ1h6Nvka
         /ekMOV6Xemm05N+HY8Hk1puNDROryRXRrXdPm/NSOOmL0z7COU1EWdTD4eTzNBFYY0vQ
         qBQUvCAvfuhg9lYc5/p5flaz06ipa48WR2JDNTaW4kvf410806t8m+5qwbzByvZLT9Ft
         bUDgpbQXzogvWa5aHJHhpzmCFSzemN06gabOdlBHGK5aXhFLA8RNzrfCHXNaPug8Y2no
         8cjE+2numDmxXSD+8c//SAZ2rZ27KkWnVpeci/wsrLrXY1Zhohj9QZBVmvwxwSinfun3
         tL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7S7hcaIQrNT100EqV+kMOddYduCRqLzOTn6PrUxYv68=;
        fh=cZmYv1rNa+XOC5ODNfsgbkWlOpbmA2HAhGxSeSSEHck=;
        b=HRz0qMrQTvtx56TD/vfaM5ztHqwztb3bzteWAkk1KQ/GmlL+5dS5nDR4k9UCSjqXZY
         HfPn9SE7fxy2YAk+KutsHV41/fX1lthtOQXACGgHlFp43Evy55l0A92Rv0hkHUQWOiQh
         tdK5TBlSZYsQdxTvqmsVwraURxn0yNsVgWRQBlOWI3lhT39Hp/cvfhi2hE4EbMtfucPm
         4zSVle3O5YBuL3Knrj5jbWmkdCOFpwPR2DCfJk8zVIdsGtbvAKxJipjR3ZLL13zyXbBg
         yESgVLDu58c99/fL9BDEWtJ9VApX/SIrnp3GpAOTwPGYcgxbBGJ9HzQ9uLqi4I+jG3L1
         Zivw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790580154; x=1791184954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7S7hcaIQrNT100EqV+kMOddYduCRqLzOTn6PrUxYv68=;
        b=aowtTon9eurVABMkco2PDehcr/Udzr/nr4OhZ9Sv/tqOxSXHrkp/TGRYtOzBXeef2x
         L+p1lw7+1d8T3kosxzJ/covXUFOf/UtBEXDEqGR/aCkFEWhB+lv7mrW6pa2ZseW41W1r
         tsHx9oHjkZhhTdBc0VMhShTEq2qSwDj5Lcj4i8c00QTjzK0wgVOTTohMHYPqrU8FzyXJ
         aZmEy6/G8SUrF6vDt4uNBDVOk5SRorvptVTwyQBzENqsPXBa4HSVAGO7zbQ6bcjnVH2Q
         nA5nf5cZBX79bXvFgnPRzND/i8KGd2jDp7czqNhfeQEjy6W+KKdZXUtuivc2y0e6xp3D
         /hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790580154; x=1791184954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7S7hcaIQrNT100EqV+kMOddYduCRqLzOTn6PrUxYv68=;
        b=dMjZPeB7uku/J9f8HAgErAX59aenIkCrBEeUT3Zr3aklZ3Td/1TAzyPA8ikEe2RZVK
         UzyD174AZ5ZTUTxNbS+s3XV8u5NAPqFstH0vl6A/V/1Z7jyuuwwezx7Qgnkih51WsEe4
         +2VrHXs7+FmYVXzOqRKe5EhGp5BZNTVx3jGAohOY979RyJhfNwIAEq88pn8sS5nT1X8R
         F/gV/d9dbV1cZ0PZNmME1y3jQH+Inu78bLTNvareh3corEcTsjjvDuyC7xKMJydLO/Q7
         P2uArcW6vBfEh+QI/NdA/uaYdybuPsQa7hwGk8RfoT3eNOi0+viwYIpklBn/hCgx9oDh
         y7Cg==
X-Forwarded-Encrypted: i=1; AKwUvByVEAf4QBVcHKyifSwVkNqJL13PVG/q7nbA0obKExFNLCQ72JDPDxHnmQO3uAUxl0pkh0R+VTOd/sOOgPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHMToNvmRB0syYHKCW1GlQlrY17blAKkJxoV8/aUiOer1Mrz0C
	+8jbdafhVLKR9zLLZuguZuaTR9VxH/iYXDYLM4EPzupZVDv5pGuhL6d9aVW2Rcpg2rf/tteOCaN
	jGtCDLKI/mzLTKGSNV0NC5EUOsZd8d+ami2dYRoY=
X-Gm-Gg: AYBFou1RizW9mFPdj/K841umbx9WfsJwBJ1Fo+558pfOsAg/EGYnbQ13ueY1UuWlT47
	SmlwFsageZfag+N24Tb/yYHR24CglpUF2jjJFMsLlt2pXvWV0XQJ7o9Ocg+3EhnrLDtwiKQ2rYb
	1E/JcJwv5gTWQ6lC5niG6XIUUvwFzz+Wy1k2sR3yC3f6MCoMXtbIT+VSQYB/n/0a5arVvQz4CcI
	uQkm77/9ZiR0rzFC2yzGlDLKN/G7YU1Rkz5kxLeCgtIn8+bCfLWYAGRQCce8dLTRmWkRgf4Vtoz
	nW5RNjbIWNtJPADXYwQvea1T92Cy1WBBVEdpiS0OtVBezYY/81bgaho8SGSaCs0qYyxTIQD55DX
	q4R/kgu/g8yYOsehhn7nE+JxKh8ePBP8=
X-Received: by 2002:a05:6102:3912:b0:7a5:9a:3a31 with SMTP id
 ada2fe7eead31-7af1e0ef5f1mr4324150137.34.1790580153025; Mon, 28 Sep 2026
 00:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com>
In-Reply-To: <20260928063824.1386524-1-morbo@google.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Sep 2026 00:22:17 -0700
X-Gm-Features: AclHuK-aDUfgxYTMcH2KBUEabNgFX4lq35X-cZ81U2Qsle4b2SorScwmDO1r1OY
Message-ID: <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 11:38=E2=80=AFPM Bill Wendling <morbo@google.com> w=
rote:
>
> The 'data' pointer field in 'struct acpi_gpio_mapping' is associated
> with the 'size' field, which represents the number of elements of
> type 'struct acpi_gpio_params' allocated for 'data'.
>
> To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
> attribute.
>
> Analysis of allocation, assignment, and access points shows that the
> pointer is never accessed before the count is set, which guarantees that
> this annotation is safe and will not cause runtime panics or
> false-positive bounds checks.
>
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  include/linux/gpio/consumer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.=
h
> index fceeefd5f893..2b80cf7aa7e7 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -667,7 +667,7 @@ struct acpi_gpio_params {
>
>  struct acpi_gpio_mapping {
>         const char *name;
> -       const struct acpi_gpio_params *data;
> +       const struct acpi_gpio_params *data __counted_by_ptr(size);
>         unsigned int size;
>
>  /* Ignore IoRestriction field */

There's a problem with 'drivers/firmware/efi/libstub/Makefile'. Clang
needs a compiler flag to support the "__counted_by_ptr" attribute
referencing a field *after* the pointer, like in this patch. However,
the Makefile blasts the flag away for x86 platforms. Below is a hack
that copies the part of the top-level Makefile that adds the flag. I
don't think that's a good solution. The comment in the driver's
Makefile says that the stub code executes before the kernel does,
which I assume is why a lot of the flags are blown away... In any
event, I'm not sure how best to address this.

-bw

diff --git a/drivers/firmware/efi/libstub/Makefile
b/drivers/firmware/efi/libstub/Makefile
index 77a2b2d74f3f..945674048d8f 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -19,6 +19,14 @@ cflags-$(CONFIG_X86)         +=3D -m$(BITS)
-D__KERNEL__ $(CC_FLAGS_DIALECT) \
                                   -fno-asynchronous-unwind-tables \
                                   $(CLANG_FLAGS)

+ifeq ($(CONFIG_X86_32)$(CONFIG_X86_64),y)
+ifdef CONFIG_CC_IS_CLANG
+ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+cflags-y                       +=3D -fexperimental-late-parse-attributes
+endif
+endif
+endif
+
 # arm64 uses the full KBUILD_CFLAGS so it's necessary to explicitly
 # disable the stackleak plugin
 cflags-$(CONFIG_ARM64)         +=3D -fpie $(DISABLE_KSTACK_ERASE) \

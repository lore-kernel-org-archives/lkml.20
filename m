Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E83859EE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727500; cv=pass; b=PirP34+7LbBwRRxEVhtU51stjs1bNlAKMLVvSSQjBfJh7gacJfP1jPjwrMpGp0gBkKNw8Mkz5SI0HEqTNS0tHcy/dnUtZCNlT1E9G6oTeYh87bkHTNWNsaDulRNPN5b46OYsSHGtO5Lo4ZsqvMaMnt5RYZZk/xUhNqNJBflm6Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727500; c=relaxed/simple;
	bh=VkpLU0Af33XlX/RemVpxumH//iSjNJJhhPiNOFhY/1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wap5KEmLTUKirTF1ayZTEf6dnbJpHTUp7+zfvrxwTPpbvX8B9AJ+3HQjPrFaPNJWUfpiIFun4EvT8V/LlwiKA2C4CBY11drvZ5eY5CzN9qC1PxlUG8ID6yJIJ6S3guly1CliSyZaEsacvwBrCAimOv8hhqrTFGJJcEajaQk+L5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXE9Sf97; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXE9Sf97"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c86945164so31096941fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788727497; cv=none;
        d=google.com; s=arc-20260327;
        b=SzACosWnE1rNN+KwQS/xyc/fc5v9gID2XYuqWh/hOB6JJTc9/qQuOvLjMaqh6Jf7x4
         HP5GIH5K2xu/l8f/Zrm+P6RxzmUSNI+nwThjLiG6BxQgas/0UWxpTXFJWxLU3YHhnsux
         D3wziOL/pt0rq/NqCHweC2KPz7W6ApdC1ed+j7ziWTj4NprgbWjDoJmtBsXutSdBAs0J
         l8jcsaQzBr0CxVakEoH2uGGbJC/I5QNBEhZ8z9gY78R3CRXyhqNdvQ14KfKNmPIYWhCx
         VZktHSHFxu8E053sCeQ9CFStF9JdmwODeV9fHxPoeVuYC+TCzK+OIoa8u+1tS424fv2O
         c5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzYQvjZ8ZhWU00AbJw1XeqFa9/GR9OzYSJ21bWTSmb8=;
        fh=lQjV8a3Wp95ki96KQoqGQJ2v/fTUYoDnJkYwpmnkEjk=;
        b=MiRnV6F+TaEU353kQprvVvVd/HpVNeCO8bNQ3Mf/zBuoqEhWR8tVSEZWoImMx/7rp4
         laPloSyyaclmG1QB45JDWJWXWzXqxGl7fFG30ZA00Rn8A4b/e1jnjNywKxCJtiiJovCv
         oWg2uQd4KHjT4u/8oiGtF8Nzrs65OcFma/+pFdwlvIMhUgeYUvbrXAvNWAv/HKEt58LE
         mxexLJ/WZjZsUZBaN5aAQKZZwIhrfgv9qR8fhhPELEoFQjorpqB9HJRYS5vAJ10fXlJa
         pLy7wAinjqAY2A8GbAuwEkdOSOQT11rPa5GEnXZCOLzCStA4Pl0mUs9kNkmnJB6HqdHC
         Fxvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788727497; x=1789332297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzYQvjZ8ZhWU00AbJw1XeqFa9/GR9OzYSJ21bWTSmb8=;
        b=eXE9Sf97uDPTk5XbmWZbwzESaVv5Sc+icXh/GwPgScKs4kUibFOa7QRJUoolJbtFcc
         c7qPDuXyPsl/vfijToc1TZBG65d5LYkjGDkA3pq65NMNV+37hKA9y6MHuCy/4sTNurKg
         5GmNUkhFyOoohh4c2uffnoHj1Pk06zYB7FWzmJTu8nWeKzQHjECbAhD+xHBVSzA7mYh6
         3L3FQt2yZPd6lbWNzPGHWrAl1Had67l4hed0QYRv/FWCtz+v1CvKZcl+wLzjwkfYEnSM
         WWNlFPRCEt5DgP9OOhne9ZcGeZT9w/8jNe0HXzn/sdGEJGy4geaUrtdwTxd0FoIA5OWf
         4BxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788727497; x=1789332297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzYQvjZ8ZhWU00AbJw1XeqFa9/GR9OzYSJ21bWTSmb8=;
        b=iYWKUQsWg4nFhELTYeZUYSUIH/hlZHfq4f1Bf602OZGwuc48e+tIKFcgZvBe8l6vr0
         XTK5j9y0/U1N3gKxMXHvPX0rRFot0UmrLC+859gD55CkuQeHBs6rFQNvJr9+VRw0JZFE
         jpaVZHTsmFcodgeZfzObkgo88np/i8RwW11Uh6h1UAH2wKTOpk72drHuHpx8MKF8kIl8
         0bjfiscIatbtA1C/PHvW6JxXsvBRd+L9J7L0OUtrNg0UOavctMp7j7MKcocNk3Th0dvI
         b9eskrmqNd+x9xyoU4JlW6Cq0zzZOQvYdudEdKwM5MqTqQ5hGTggxOApgcka40ImdDIi
         7QrQ==
X-Forwarded-Encrypted: i=1; AKwUvByEBX92d1y/VfU2WXFVDfbE1p7ycoBqgndIDwAQhNKBQf1yLgK9P1c3B1pDTYQBZgy55n1l3RV4UqGRUnE=@vger.kernel.org
X-Gm-Message-State: AFuF++nuvQrqAptprmu+oX10iAgiTfb5TIaPlhnxt3aoVtgeA4211h6Z
	MlbopehkFdZdkmssMpUaabt7lQr3CsS9TAQkXyU0YJ5Sjg1DMGjVqDuDNyY76cyFukRMZ/wEL8z
	05vzwAB2QHY1/YF2DcTTT1FdHCk8BeiI=
X-Gm-Gg: AYBFou0oL733+GmX4mrjzvpkTA33YMWsl1mVmf6fpc9Y6s9TCobL9g/+iRaJQdRM9zN
	lqPg16nBSdXBv7S7LcLokuhepY8O1MM4RITDKKjnYv0duiBkURkSOFShKd2AUPq7d5h+g98WtIf
	MAovUxnnPns6GzGC9/lpN9PfUnMGxsuvX+talG6yRxLQc4UiuMEyWBeaFkKD3f9gbKe6/i95RJY
	RNpyg2W9DzuhKPdOc7pcnhuYh7JKMyyleZNIF2NUZcw8RFeGGE3BwEoNiJbKc8ed1gu7abwt2Z3
	2iNDU8XBbL8TqHf1Lx1Z5ZCjZlulnZkt+g/6boVBg5TPU4hVJXsSpvRLoDMHM3QuQZH9cTDjbUW
	fdoG78eOXFF8In4E+7ZhEzkXQs604wK9ne1e2flfJ+3B56BYfxwj6OrC3RVUqtobDQToSpyDKK3
	qDqBW47WwqA28LDjTmaeKC1VyKJmzV
X-Received: by 2002:a2e:bc81:0:b0:39d:b5b9:f0f4 with SMTP id
 38308e7fff4ca-3a371bd2f78mr21937581fa.10.1788727496379; Sun, 06 Sep 2026
 13:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082741.578048-1-ubizjak@gmail.com> <20260904082741.578048-2-ubizjak@gmail.com>
 <D7BA2D11-A6C7-4B1D-AD59-BAF85AC7BB58@zytor.com>
In-Reply-To: <D7BA2D11-A6C7-4B1D-AD59-BAF85AC7BB58@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Sep 2026 22:44:44 +0200
X-Gm-Features: AcwNN1Utir2AiMYOBOogexBmVVVaZJ7V8LCzsitaQHdXbNr_A2yYRDKwRpY2i8U
Message-ID: <CAFULd4aAL1zrtagDftpDSY3JrShdXtDxMjZht0OqsmFnhHyViA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86/boot: Disable GCC min-pagesize assumption in
 boot code
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:18=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> On September 4, 2026 1:25:22 AM PDT, Uros Bizjak <ubizjak@gmail.com> wrot=
e:
> >GCC treats absolute addresses smaller than the min-pagesize param
> >(which defaults to 4kB) in the generic address space as presumed
> >results of pointer arithmetics from NULL. For example, the following
> >code, when compiled with -O2 -Warray-bounds (included in -Wall):
> >
> >  int foo (void) { return *(int *)0x123; }
> >
> >will emit a rather cryptic warning:
> >
> >warning: array subscript 0 is outside array bounds of =E2=80=98int[0]=E2=
=80=99 [-Warray-bounds=3D]
> >    1 | int foo (void) { return *(int *)0x123; }
> >      |                         ^~~~~~~~~~~~~
> >cc1: note: source object is likely at address zero
> >
> >Currently, the warning is supressed by the GCC specific RELOC_HIDE()
> >macro that obfuscates arithmetic on a variable address so that GCC
> >doesn't recognize the original var, and make assumptions about it.
> >
> >The GCC specific RELOC_HIDE() macro was introduced to work around
> >certain ppc64 specific compiler bug in pre-4.1 GCC. This bug was
> >fixed long ago, and replacing GCC specific macro with a generic one
> >triggers the above warning in boot and realmode source code.
> >
> >The early boot environment does not guarantee any minimum page size,
> >so explicitly setting the minimum page size to zero by adding
> >--param=3Dmin-pagesize=3D0 to the compiler flags when building x86 boot
> >and realmode code with GCC inhibits warnings for addresses below 4kB.
> >
> >The option is guarded by CONFIG_CC_IS_GCC since it is GCC-specific.
> >
> >Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> >Cc: Thomas Gleixner <tglx@linutronix.de>
> >Cc: Ingo Molnar <mingo@kernel.org>
> >Cc: Borislav Petkov <bp@alien8.de>
> >Cc: Dave Hansen <dave.hansen@linux.intel.com>
> >Cc: "H. Peter Anvin" <hpa@zytor.com>
> >---
> > arch/x86/boot/Makefile        | 3 +++
> > arch/x86/realmode/rm/Makefile | 3 +++
> > 2 files changed, 6 insertions(+)
> >
> >diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> >index 3f9fb3698d66..372e67d2a855 100644
> >--- a/arch/x86/boot/Makefile
> >+++ b/arch/x86/boot/Makefile
> >@@ -55,6 +55,9 @@ KBUILD_CFLAGS        :=3D $(REALMODE_CFLAGS) -D_SETUP
> > KBUILD_AFLAGS :=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
> > KBUILD_CFLAGS +=3D -fno-asynchronous-unwind-tables
> > KBUILD_CFLAGS +=3D $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
> >+ifdef CONFIG_CC_IS_GCC
> >+KBUILD_CFLAGS +=3D $(call cc-option,--param=3Dmin-pagesize=3D0)
> >+endif
> >
> > $(obj)/bzImage: asflags-y  :=3D $(SVGA_MODE)
> >
> >diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefi=
le
> >index a0fb39abc5c8..75058f4dd7c1 100644
> >--- a/arch/x86/realmode/rm/Makefile
> >+++ b/arch/x86/realmode/rm/Makefile
> >@@ -67,3 +67,6 @@ KBUILD_CFLAGS        :=3D $(REALMODE_CFLAGS) -D_SETUP =
-D_WAKEUP \
> >                  -I$(srctree)/arch/x86/boot
> > KBUILD_AFLAGS :=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
> > KBUILD_CFLAGS +=3D -fno-asynchronous-unwind-tables
> >+ifdef CONFIG_CC_IS_GCC
> >+KBUILD_CFLAGS +=3D $(call cc-option,--param=3Dmin-pagesize=3D0)
> >+endif
>
> That seems like a much better answer than that horrible hack.
>
> Acked-by: H. Peter Anvin <hpa@zytor.com>

I have retracted the 2/2 patch, so there is no need for the new --param any=
more.

Uros.

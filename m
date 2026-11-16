Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858652;
	b=bv+WjazxWai2lR3iZPqyA6436+qwsy1L3nGEiIgurW4ysLmpud877uaFG6q4ApVY9uvN
	 +KCD5D6uKcVMc6FkF1BQzzmqOalzcFm5czAKoOdr5eNg1KWw+6C7w4+FSP1TvXoX63K2R
	 NOExInibCsm839llmuwBTc3LzTyI1k9hrtcbDyBowL537wnCUHLgOMjdu47wyl4m1rYdK
	 +NcBdXi70s0EbgWp9PYd5nkxQRjstoc22HRa9NkCZY/BtkzDysCdLIqmZIG1qM1GUwZoG
	 98HEDTXKL24MAAopxSXhzteuMNTcUEh/xhS+KZcf0v6Hk5OkCdGCeG/FcfBWjqQ81NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CxkHrH3VxQe1SMYPYrNEyj9vp9sqPdyZzYaUVPRrdH4=;
	b=UoqCpNwtNOAYUT1Jh9TcOpBYwjOYrGZqyH0CAfJfMi/06tgmGU9zUGtFIz6jdFouVdEN
	 MbSKpIMO6qvqIqwj9CgAmOf9Lwk5BKV+2ZVd286WoyLD7EtraTb94cGOO6cEK5F7KP7GG
	 40HdO1FEVmxP/h80dNVj0Nw6vmFXbRhPPmD96dXusc8z5EsT04mc+xdNEN6z9PPsrYlP6
	 7T6xowk4pjQwTJcjx8gbZXZ09Q9tqiNUvifT0NfjEqHFZutA0+mo24HvdxZplK8fFxFGf
	 LXiKoMJU1co6Ihsk4F3AXnS+KPX+khACI6J9nJ/nzeZDF3I4pyJEKmgYswwVfnxSeww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a44tx9FY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4178A606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4178A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a44tx9FY
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b81214ab40so598542a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:50:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794858651; cv=none;
        d=google.com; s=arc-20260327;
        b=rUAmGQEEwccAhcNa+jCvbC93wVP7UxiObhVm0ChyT7cVYcf3os67p+40H0mhC4WFld
         CKoNnMe087KNdipHV5sVFHMBHzFmnGZIwsIyggoMIATMwQ0HmoSuycMFdGQjl91daQa5
         glWDWKPUJ7qigGXPS3I9o/+5GXftL8c+Fi3wpuOLykpyoYv5jNEnxig9tDj98ZB1ynoN
         y6YDqYGDqAA1wLe3p5Y7wd8vozwno+8bUnhfxfsQsW5QmTkK/M21jyWppCh12LSEm7bb
         jLasyj+n1DeXRlit9qR53RdRzCX8JmkHZ8cxie+2qCAdF9rpVzIAUs++8wOGH9r20zDV
         cJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CxkHrH3VxQe1SMYPYrNEyj9vp9sqPdyZzYaUVPRrdH4=;
        fh=7WdMDqO1xVv7bS4KPwcxwsRIdbbgubleinkMc6U5b3w=;
        b=RESVRfn0eAkDSKnRhoPk6tZ7p+DfocJ3g4ekiDyyODebbTwDxNoi4fT6rmzJ/21hex
         0KM2rfAkqkmH+PqPg03JJLD/aMwJg+MlJEe5BgekgTxXkCriZE41dvrBcNeYY6lcExFy
         kGiwD3JkozkkKpHroQ8R9eOzI6nIGwi3XpAS6iskEDw3/G1OYnyq5404aph0GZd3Zlwu
         hjfqCTpSsywsa0j8+M8WDhnS0h3FVLUQZyvpdclSOHnQahWUQ5gx90hLgGrTZz/JvqtJ
         FqvslDl0gSCc6LqgEpdVWrnRT5lsPP4oCUICh+iZX9NBYSpxrYepJByENxq+3BxR01/F
         2ipA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794858651; x=1795463451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CxkHrH3VxQe1SMYPYrNEyj9vp9sqPdyZzYaUVPRrdH4=;
        b=a44tx9FYyulYEGe3djm9Dz0e4h/xYE50BzIFjZWY1zKfeBJKRnDZ7tRH5xTHnNkbKC
         YrNy7YuRVwhOfWVEbrk9cNdS9qLZw29MPMsit5oz5tz4efpaft9J5GLu9dExFJgC1GxE
         Fo9SP5H0u8Qh1mGGy8eOrfa8Jb7o4+gCQ6ztDG5atsUt8o8wI4m7iRI1UPAedfyZV3T9
         xYfQM8cLEkGF8gaYfwKGPKxknUriZVosfrn5SrWMrZBgDwvuOk2Up9e6zTMHQuw291wQ
         JN3IyTMeymXNNN+s2nh8650jxW8nzAbS2WkDJriAZsikKVfeinh6IYLIxDHgV1bsJwsd
         vrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858651; x=1795463451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxkHrH3VxQe1SMYPYrNEyj9vp9sqPdyZzYaUVPRrdH4=;
        b=flB3jKrAbPQ8mtreu7vKVB3j0TbVSZhmQGB9xemIwA9ZYPh9wWnkXkEznFvwgBNYu1
         CK8nx8EM16Uu/lbJGIElma2r/MpQISAeWkOhMX1O0stPuH/9L8KLshJoo0zGetRsqjYW
         resLjq1tCcyjO0E5OdbCNrmD6RJ7j1hL/w2e6i8B5lcJral+35vnxHhvCxH17Py6R0Zh
         yAYj+wyKQUxjR2fwaSRM8WIX1wJrX/0h49w30PLbaKi8wNlTmPQa2xyIMci7yBfOsfDR
         AucOtcK5AcL44iSsBqx3rRJqBncXf9fjHtK2Xego2XU3WmHjviFxCmhhrglguZZo//IL
         53lA==
X-Forwarded-Encrypted: i=1; AL+hErHziAy5DKdAJaGN/FRcIbDs+9zBwktsF+pS5PlofUrfojAl5mJaeKQ/c3lFPAw3Sv3zmP3hZxNSw8Kvrws=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P9e+jJWkeSn1nwMpoJFkqIE2WNdHiu4xbBkibDOtixHkL5lip
	OFzqty71TEQb9FgXs4YJrjztXfBmBiNLwCvdchT8J8AB1069xL+BCVpNXwdqI59qfUR/n9tJXm4
	Rw2zNKT/Dxp0UBvj3IE3Q5dS/WYvHMMA=
X-Gm-Gg: AYBFou1O2KLDIKPsvfBglk2iP07Scpcl+KNMjv/8eayBrLPeejFFw1ztjVsnR1B3rkH
	0SQXzwFnr1nOIMrfyxp73TD6f29NlMrUyFIy6ObVqx3TZM/e4tl3weqy2O0dE42aiun+9Rx9Xxl
	F7BbKALYFqUP1RnT/u/f9wYbImDtZ8Wa35ur2b9w4EQ8wemF7TptmPnwyFVwn4Ftebyj+ona+mF
	G1eCAEVr4JO9WkOv3LXf1bY/Cisp1bLfxLowRtn7jE6ogJTxhFOkKaEYGa0rTy2umw+DXoXnCjy
	sig1WegrkZvq/YBw/EuDSZmp1lZbskGhZPAG4B4D57q8FzyJqm4EiwUaISER6+O42n+WDO48fXa
	U0aIpy6L0Lvjq28Cnw1GUVP82OQoa1wivTLG4EEKX/zlh/w2xBCwR+JKi8MhQP4no0uar7ePu7F
	sLgMqRIc+Caq1IMvOQ4aiACtI=
X-Received: by 2002:a05:6402:2b91:b0:6b4:1eed:b9f2 with SMTP id
 4fb4d7f45d1cf-6b859739689mr380339a12.10.1794858650577; Mon, 16 Nov 2026
 11:50:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116152403.2672-1-ilpo.jarvinen@linux.intel.com> <20261116152403.2672-3-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20261116152403.2672-3-ilpo.jarvinen@linux.intel.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 16 Nov 2026 20:50:39 +0100
X-Gm-Features: AclHuK_k2jdl-xE0SWqHh40PilxNCJBvLhOeyDjPjuatpm5yQ5pSESh5pEDEfkc
Message-ID: <CA+=Fv5SkcpskpFUCP-qDmP1vWqDiqO8FgSJJ92UvX6jGRfaGLQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] alpha/PCI: Convert to pci_bus_size_and_assign_resources()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Mon, Nov 16, 2026 at 4:24=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> To serialize bridge window sizing and resource assignment, PCI core
> needs to hold locks across both phases. Alpha nautilus PCI code calls
> pci_bus_size_bridges() and pci_bus_assign_resources() separately
> because it needs to do special resource alignment and setup after the
> window sizes have been calculated. At least the former would seem to
> belong to some existing __weak pcibios_*() hook but the latter might
> need yet another pcibios_*() hook just for this single use.
>
> The nautilus code runs during init, so nothing is likely to race with
> it. Converting it is mainly about consolidating the sizing and
> assignment entry points of PCI core, which eventually allows removing
> pci_bus_assign_resources().
>
> Instead of trying to do a complex rework of the code, which is risky
> without the ability to test on the hardware, simply convert
> pci_bus_assign_resources() to pci_bus_size_and_assign_resources(). This
> adds a small bit of extra work by performing the sizing step again, but
> the calculations should yield the same sizes, so it seems safe
>

Agreed. By the second pass irongate_mem has been request_resource()d, so
pbus_size_mem() skips it as assigned, and ioport_resource is never picked
as a window (find_bus_resource_of_type()). Only the AGP bridge's
unassigned windows are sized again, from the same inputs.

That does rely on the assigned check, though: if your follow-up series
starts sizing assigned windows, nautilus' relocated root window
(size_windows =3D 1) must stay untouched by the second pass.

It builds at every patch for the generic and Nautilus configs. I have a
UP1100 (Nautilus), but it doesn't start up at the moment; if I get it
running again I'll give this a boot. But for the Alpha part of this series:

Acked-by: Magnus Lindholm <linmag7@gmail.com>

> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/alpha/kernel/sys_nautilus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nau=
tilus.c
> index 13b79960b4b9..23a74fd4a83f 100644
> --- a/arch/alpha/kernel/sys_nautilus.c
> +++ b/arch/alpha/kernel/sys_nautilus.c
> @@ -263,7 +263,7 @@ nautilus_init_pci(void)
>         if ((IRONGATE0->dev_vendor >> 16) > 0x7006)     /* Albacore? */
>                 IRONGATE0->pci_mem =3D pci_mem;
>
> -       pci_bus_assign_resources(bus);
> +       pci_bus_size_and_assign_resources(bus);
>         pci_bus_add_devices(bus);
>  }
>
> --
> 2.47.3
>

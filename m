Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAD4BF949
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827740; cv=pass; b=naAYvc2nvNSV7nAmzQ7RSi6/tJ3q/khCtD9mOgR7VhQvu2oBUcLaAnqoH/7LR4G0IcWXpaPUbojEnqOEwGUpspoKi0oKhDTcNMG+T3snAbPj/LA0INyTXGosEcMkPUT2OmBjrpIsroTYL3HFBQau7BZ+YnfL30oW9pnq7zeeplo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827740; c=relaxed/simple;
	bh=kZdS4dF4wn+JWIPITemwpdYnrEbvaGpLaLJey0JUXyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDdCyRfP3ej19TvrXeJOfk4QiiMYhLuCLOuG63fK8DBF44K+P+jMDocGo4vVyOtbgY49TbV2qwfOncaspud5pq7yl6rp6tOjYrps9piQliqVVw5UUQLWA83CP0jeJ0bT7z6HRgag9n7KkFQYXxJeYYht9lZfUZ3VSpjrnJW1R5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS38XM3v; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS38XM3v"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e62319cfaso213375866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791827737; cv=none;
        d=google.com; s=arc-20260327;
        b=YskcE0Hyg202L+q05IrqhyDARPyrtQEY7YwyJhuawsM6IyVuHHgChiidSN+t5I4IAS
         E+BeN/JYPd/e1xcV1n4Gi7aztnSoCoFUvd+JdlOYGUkGanShHKjrr1c+SVWXADVX/pdK
         g110VdVqbLtVFQHHiDF4cQyEwjHO30L569HsITnr9XVRhnJ1Eg9+Y6ZYWOHAM4htK9lq
         sZyzkCF3sEhnq+298w2b8izet4/rTKekPUdWDYmr5HLThrjbRf2K+UHsOME3DewjKhA5
         5Xc/LDv/+RFMR4sLkHz0/FAMXfkKgAfFFkgLYVRtMax5TYawwelNt8SUAlGbzwWDHEBM
         4pMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxQuVKRIInAc/Z3AzZWZwMxHNHQeTzSvMjD6+JaMyKw=;
        fh=jZurQdOav8r4I8kMgCwOsccSB+x5e07T6k15YT7VlAs=;
        b=L7CcezjX/BQcAQ8BPTIR+z04BvTfk3NxY3CPlOiuIGUzV3wel3byUyMZQ2B870irqh
         fvUA/o9cpqbYTzuSKfbak43sOxTrHGdZis0Yrx7TNAU7Ts9CguevF2iOdFcYls8E1IcF
         Me7DFlrCCnRz2t5CChw3FWlwoETjjDxTyk6jv1OFo9XY3fsh9HD7Md5PCtr81WX9B8z9
         NujJyedhUchMAArytxNsZdfdHbG992oBtVOek7RF64Kh66NLkRFCSUO/LjovknjsSuPv
         aL4LBg3ZVEib+y4gZCaO2X/V5boq35+MBlPEWgibX/ucT6zNDYqNYNpDp53QSRFvTtv3
         In1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827737; x=1792432537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxQuVKRIInAc/Z3AzZWZwMxHNHQeTzSvMjD6+JaMyKw=;
        b=CS38XM3vh3vljlm8rLNG7/wvoBHKg8Ph75VOB5tc48ohOqPqyM/+RBRZymZvLuhl+g
         jj0qCF9synkpB1x8iscbq5tNtlAep55nJgOUi46ZECRw4wJy9jENhLp8eXhnXf/NXUm6
         pFILQA1sKX8uxmjuLqmsZ7VpIVid29nHNk+CPL23UTvaGekSxApIu8R9aYDaWUM+/CMO
         5WLfglvDdIMS3YUS8GQy1UZ5bp/nHgphvvURYLj81L0lRB0Mf7uDBhyLhqQHkJveTg3N
         BH4d7QnQzjbYJom7KPjNP+YVI2PfxOs35OcdKmIKcbv1Iq3+rYc6lepme6DcU8q36pwk
         Ya4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827737; x=1792432537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxQuVKRIInAc/Z3AzZWZwMxHNHQeTzSvMjD6+JaMyKw=;
        b=mZI0NxDSb79sa/SujxKN5SAK+VIcuGIHzcSnb4tBJSbTNluRO90aG2m8r/Gwc0Sap3
         lBb7P8TqLAEsw5NKsHWH2AjdEuoVcB6UdcxuPeS8eiwBolJqAYn5IfHZsBBAf9FU6PO2
         uQJ6Kt4fZqWjTiNgzafiJL1lXqgPVcrByHX/3OlZQCo9U52w1wyYqVnkXw008mDVHGm3
         KR/BmZ9yP/pwM58K6gp+hvr2IrUdajSmcV+9YCo1eK1Qj7g5QWAh8/HQTXs1yijI6ioM
         NGbVN3q18t/7iJDxrdrV4ysojsZJouOr8EFkPFZSooqr/HeXvhj7GH+/x/0lEEtwntlw
         EDrA==
X-Forwarded-Encrypted: i=1; AKwUvBx6CON9RBeX6sFUNhvMhjLKd0sbtUio0ZnF23+83V/V8mHlCZ5xG4muqBiYwQdIRnhCJxBwZiH/w5U6TC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfL8xastkOVQPFQOGh7lLqhME2fFFh44d4ttJ/V7TwOpwp9EIv
	bSLmbL3Yno/N5lnO0Ao68uzyThxR5U9G5njjlxOeoet5tuZqDbweHMaIwCGQdiuyzzvs/z8E6zF
	8c4bFNu+5Z/TfV8pwPTrZdHuPqwgYBcoUvRjncSXJQ9dg
X-Gm-Gg: AYBFou092zRF9XpoXMMKfk71IsOtU/w3rKGDBlwjH5eSdnGtMW5rf/LFgR5cuCvTsgV
	WiSNh294aROOVjT7HLecXlQIhUYtMHBLEjvILe2/xgNNK+RDqfVbx0EsHGGz0skII0B3yOONsGP
	WHQ929A+Rfhhbxb86FEKIY5fkmkqKd2yBVZhz7QPs3+j8dulNz7CjfAuglDzWGnYB1grW3EfuTZ
	j3OTie9h7PkYJAAB0ASwnlhZYO+PflCax7L3geSc4RUKb3gO++cmG0AdV9IQXuW+Ewmphmg2D2N
	IGs3YBNaYPtPuOyeHei0tKz4tvQTZmuInkumB8TegZP2UiHgc+uYv7zlmvcDgjCHZkvxpGch3fk
	Orw2djTfUXjmQsvqRiYdh+25LAuYfZWptrURhFZOJzI04bMdHMUFP29IA/5VOmn/mmLK7
X-Received: by 2002:a17:907:c0d:b0:c2e:3ed7:7db4 with SMTP id
 a640c23a62f3a-c31aa00dc1bmr971765166b.23.1791827736975; Mon, 12 Oct 2026
 10:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003223237.513456-1-voytikd@gmail.com> <aszHlWi_aLIh8r9F@thinkstation>
In-Reply-To: <aszHlWi_aLIh8r9F@thinkstation>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Mon, 12 Oct 2026 19:55:10 +0200
X-Gm-Features: AclHuK8QxOWUKD8tjoKoD_vULn_acAenrN-17lB0n0Wf19SoI_dhhDRr9qFGuro
Message-ID: <CAAX90H0PGW_PF53FpWYExaQPKmDdrAP+_b89gq5+a0wK=AicMg@mail.gmail.com>
Subject: Re: [PATCH] coco/tdx-host: add Kconfig description
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Chao Gao <chao.gao@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kiryl,

Thanks for the review!

On Mon, Oct 12, 2026 at 1:42=E2=80=AFPM Kiryl Shutsemau <kas@kernel.org> wr=
ote:
>
> On Sun, Oct 04, 2026 at 12:32:37AM +0200, Dmitry Voytik wrote:
> > Fix the issue when the driver always gets compiled as a module.
> > How to reproduce the issue:
> >       make mrproper
> >       make defconfig
> >
> >       ./scripts/config \
> >         -e CMA \
> >         -e ALLOC \
> >         -e KVM \
> >         -e KVM_INTEL \
> >         -e KVM_INTEL_TDX \
> >         -e INTEL_TDX_HOST \
> >         -e TDX_HOST_SERVICES \
> >         --refresh
> >       make olddefconfig
> >       make mod2yesconfig
> >       grep '=3Dm$' .config
> >
> >       returns only this driver as module:
> >         CONFIG_TDX_HOST_SERVICES=3Dm
> >
> > "make menuconfig" doesn't let switch from =3Dm to =3Dy either.
> >
> > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > ---
> >  drivers/virt/coco/tdx-host/Kconfig | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/virt/coco/tdx-host/Kconfig b/drivers/virt/coco/tdx=
-host/Kconfig
> > index 57d0c01a4357..5a13ec6f51e8 100644
> > --- a/drivers/virt/coco/tdx-host/Kconfig
> > +++ b/drivers/virt/coco/tdx-host/Kconfig
> > @@ -1,6 +1,10 @@
> >  config TDX_HOST_SERVICES
> > -     tristate
> > +     tristate "TDX host user interface driver"
> >       depends on INTEL_TDX_HOST
> >       select FW_LOADER
> >       select FW_UPLOAD
> >       default m
> > +     help
> > +       See INTEL_TDX_HOST for details.
> > +
> > +       If unsure, say N.
>
> I would rather keep it hidden and make it follow KVM_INTEL instead:
>
> config TDX_HOST_SERVICES
>         tristate
>         depends on INTEL_TDX_HOST
>         select FW_LOADER
>         select FW_UPLOAD
>         default KVM_INTEL
>
> INTEL_TDX_HOST depends on KVM_INTEL, so this gives =3Dm with kvm-intel as=
 a
> module and =3Dy with it built in, which covers your mod2yesconfig case.
>
> Does it work for you?

Sure, I've retested and sent a v2.

I also rechecked that it still can be built as =3Dm:
./scripts/config \
 -e CMA \
 -e ALLOC \
 -e KVM \
 -m KVM_INTEL \
 -e KVM_INTEL_TDX \
 -e INTEL_TDX_HOST \
 -m TDX_HOST_SERVICES \
 --refresh
I did this because sashiko produced a false warning that it can't be
built as =3Dm.

Thanks!

> --
>   Kiryl Shutsemau / Kirill A. Shutemov

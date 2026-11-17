Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907233;
	b=tOCL7w0vDvy32fiyCYwn7eUBhrylJWbM7o1JUknycfT4ZDnY16UZkhjn1dz6zvH1tor+
	 Gjk8dyAwTSGW4GtwZ1jCCqIWlOoLhFowSLZ06gnozobPM55m/ZwwjgL1CGbpw0eoKsyLo
	 PoSqIK579PhkxrcWOrOP1zU76wedBDNZqQgsvXYuzWRQ09yrK2KzVHO4j/jsLRfrfnf1g
	 k6ou9hw+98+LORSAbQVlaiI7B9fmoPpdBncz5hg85jHmwNIUJ+ec9DMQYnj8AiGEWt8F9
	 r7HS5mofLS52UgEJ2zBAIy1xv/mOorYONKXL02mpooolcas7svuI4F4TrNjxahIUWyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907233;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=YxyWb61l9bZpPKlQ2mqo+AuSKiMQlhMQ26ZWLgbv6HE=;
	b=0tS5LFmEAG5gYUxJ2CixfFWyAKeTy9VsZcVaI5o4nBISRiGKLdjGd4gTD89BXoh240IH
	 X115hQWEF0t04Ev8OcyOgb3EH2xMEoTmq36Pbj1kg276lfdwA6USnNPU4G/O+KXM7jQjI
	 KlUcuKlg3WMpzKzD6qGRf+6iFTyChnmWq6pLAtibbghfLIYadHcNzVFmTm2MN+sv2doy0
	 upGtd4yKw3pDesfm9MfOubk/7FhmDBN/N3r4A8rerYZ7jlZGpVYrndULrTLdSsDZNIhQ/
	 c+Kj0NPXiG18UfTeMySx7dWCVYzJyZ3yXbzNzUnI94RyW4c6wnnLvFdcqfnbfNZMqCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995A3606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995A3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ee029fd76aso3927045e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907231; x=1795512031;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YxyWb61l9bZpPKlQ2mqo+AuSKiMQlhMQ26ZWLgbv6HE=;
        b=pJ/kc1zP0iZuGV3xd+UJEyFgqBRQtctwqyVTi9iF+vd95zn3dEz0lN839rs+dhknmz
         jVWQlx3Mr3aFgwYsUYfPEqmyQA40j+XpRmz9Glxhjy5O4JTkvbUJHxkdQxwIo1REQpX8
         VGWy1x9CjTrJxoMP5zqPOMy2oFcYaL9ozWH2Qr89A13XmsKENyOxG+MIBbkvmBvBItff
         qB08RdfNXfrA0eg1tdUfQ2wEabn2gI/2Fz8AUVD6Y+JUtqiTWO9A6XVlnp7K5u5J2/GX
         oD3YCJ1uhjERDil/9HUoN263eqUxt/nk7DBSMjUJCahqDX2dp4LyVZ4JstmCSt66pYKA
         qudA==
X-Forwarded-Encrypted: i=1; AL+hErE9BIw3lDeqT/dp9svkbDyZ6r71wph6rdwPLrlVMiA9tC1aUAvlUFDqz4Y+lXKXEkg3x1PVo+rn4dAHKPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gNrSXHhamk8Smu9ybND4c410DSPsqjQ9MlY0GL4Zn5LazUYYk
	1ipf4Vo0oaUyUbYgfsxhuWfH9563NRnjfcBMXKbRyHBqpY57YjsHI10idHVpGbPK
X-Gm-Gg: AYBFou2dKv9ZrrSwuxlMNjuUjWmgwNNHRTJcKyVEbI33adx0rPqypazoNJbnxM2JVEu
	Ew+gYVjl6agmJcWz64qdIOduUsui3t6BQuykRWieXqeJ0uMNdl6BO7/N/eV0PuL1xIAFwQX9pZ6
	Jz2cGXBdw21orYfrr1NQiCw492LDF/Um5p1CtpbrGpuL6QkzXl57W3m41cxmYX3nnxKMtAakmSF
	oo7I5BqKwVRMYVbGD6V3pU8RnbRhPcxjrPzGAm5Tn7v+SofpIG6OWOf94OZc+4jcIaDOKAGxRs4
	cCEAS8X3O40Ty/g928qUd7mm6Cn7dWr+MJuP1t6GZZlCxJUkjYhg3IyG3hUlkzYtMHRygUltW/N
	v4+h3vtnCdU3WegJRHPq8ghb7tAMyinZgCNYqletyPbkwppzzejuGg2RVRjILT5QUrGHSGgru+k
	iLxiEx2s2eTfYLMmFRRErtdyTFnI4aREIRADHx7Qn8ZnFnvMSiqY+05yHgbuQCR3z2eubj9agQB
	YxoIhd+U5B3CMrIbzz3ToiAiM2aYCm/Kd5GrTmM7BEqvWRo/rz1qY6kV351IJENZX0WmcGQGrH1
	vg9jZv3dMFyGswSxY48/PxiwAx43eFi279LcK8EOgLhN2pncrsQHyE3uVtR921d+oSTcuVk/+Wy
	GA06SqnV5EoSo
X-Received: by 2002:a05:6122:420e:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee34a468fbmr4941482e0c.8.1794907231476;
        Tue, 17 Nov 2026 01:20:31 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3e11d3c2sm6494995e0c.15.2026.11.17.01.20.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:20:31 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2e14babc8so3631760137.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:20:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzwib/zcm2lPzrQ0W/o99jJVmHU2UiWUzTGAV84eEnVz1xyNgmbifkLUB1mT4nAFAB2x36qjowTkvwEKI=@vger.kernel.org
X-Received: by 2002:a05:6102:54a8:b0:7cc:26a8:e716 with SMTP id
 ada2fe7eead31-7d64d78cb41mr5011377137.18.1794907230719; Tue, 17 Nov 2026
 01:20:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avG9T_NrXRjVDgjh@sirena.co.uk>
In-Reply-To: <avG9T_NrXRjVDgjh@sirena.co.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 10:20:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7hahoo3OPkA1XzVrtDH=AYFqSuMvut3StbO=PKjOYQg@mail.gmail.com>
X-Gm-Features: Aa3M54rvviiSiYUNpCwRJXk2f2O_bmZMXY6_kw3Tpa7INoLk_tUjtbybsex3TUE
Message-ID: <CAMuHMdX7hahoo3OPkA1XzVrtDH=AYFqSuMvut3StbO=PKjOYQg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-memory-fixes tree with
 the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	Kees Cook <kees+treewide@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Mon, 9 Nov 2026 at 13:48, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the drivers-memory-fixes tree got a
> conflict in:
>
>   drivers/memory/fsl_ifc.c
>
> between commit:
>
>   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
>
> from the origin tree and commit:
>
>   a78ee2e05f7c7 ("memory: fsl_ifc: Clear fsl_ifc_ctrl_dev on probe failure and removal")
>
> from the drivers-memory-fixes tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for your resolution!

> --- a/drivers/memory/fsl_ifc.c
> +++ b/drivers/memory/fsl_ifc.c
> @@@ -207,15 -210,15 +210,15 @@@ static int fsl_ifc_ctrl_probe(struct pl
>
>         dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
>
> -       fsl_ifc_ctrl_dev = devm_kzalloc_obj(&dev->dev, *fsl_ifc_ctrl_dev);
> -       if (!fsl_ifc_ctrl_dev)
>  -      ctrl = devm_kzalloc(&dev->dev, sizeof(*ctrl), GFP_KERNEL);
> ++      ctrl = devm_kzalloc_obj(&dev->dev, *fsl_ifc_ctrl_dev);

"*fsl_ifc_ctrl_dev" should be replaced by "*ctrl".

> +       if (!ctrl)
>                 return -ENOMEM;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

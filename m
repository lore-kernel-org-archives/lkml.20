Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793328721;
	b=XRJpHtAGTvHangq2+GA9RPw2u/jGvoS5tuI6kD10KFrvxN6ZTsikogQVAzJXA3gZ3eIF
	 2VcC92LAYMWmNWtL/Ye44z/Dah6jWZu8ZyfWodfcSIvtT/YJfd9SmdduYiMlJun2JruYN
	 gaSblIsKlfT/Bf+x036qfDIvk3hgydD3+5xI6kenusJ7YpmGJQSb4OR6jYhHR3cBDKBV2
	 jGI4W1cIAQRDRkS93z5MJpHZRr2RC4iUFDnFWXpgoQyOyRUKl4TOyzOi6+bt84sGIojXP
	 N5+YyKww0suJx/9iHV0RoPO7jeWz/soEeiZxjQdbu5QAMjt1soCnrl4JyQyV2cBlBDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
	b=hwpfv+l/GNx/cIdSR3afd4oYjA8NctFZ+UlPTooA1UVM4VdU3+I2eMO6nZX9+DlFhgLp
	 gVpX/zmmeH13LdWDFGR0sOV2L2GEHfxEsfyBYvfh/xxQk+iKtPaJb5iam+CxfMl2YPb5z
	 8/0Fm96MeHg+eVsdEBMi1kA1o3ut+wCJcJKlI3zFDnHDILaehBmiC3tG1JRotF/0CVsre
	 w/LrfzJ7AEXFWHnp8deDeOYySRoI+Dk7CvYsAmLF9rdEqQcCvAqDkof9+y841xNDmvLRq
	 7sU1jUaTYXFLcDSuieWFNgSlWe+gf4UXu2uwEQFqmEOB6F5JF1+OxaFzFVEMi2lgkIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=anj5O2Zh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90605606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90605606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=anj5O2Zh
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-676858d42f8so188882d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793328718; cv=none;
        d=google.com; s=arc-20260327;
        b=myhaS8MR7mDdiXgq8I+ceSNKVN0TVk+2AARzL+yEJQ/lZIZNP3liiyNS58p/6mx9OJ
         Mc30CLwFoJjs02nC+wjM+SCK6ufxAI3pOJxEsXn1OU49HjSZCap9SLBhIVLc5IU9gTnd
         h8/u8LQjNVpIjJ1/ej2zjvyCeLgoDPwiA3uG/OXpgbU+6fC6DytxvecHX2ImMQ5Lw9Ek
         nKrQgsXcFr1/Zi99Me7ieDhg5j/4YIHceIw3he0OfW/50bavQvLeDPmlYyBMZbkHxI8Y
         dQxSgaCtnCJ47rKqPS0Q355oCyVb2Yy84mpsFczDFotWkasqg8vxOhXE5lUntnKqsE2Y
         iyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        fh=TdrWzdOs6jURnSTaIwhSU5d2VzbT1konrjEq553fn6A=;
        b=Q+h8VUsr7nfNn8s3RngQ/Ixn1V9BmpiT11058oALlJCikf4PO5cpvFizk0J5BRGCp7
         uIRVzzsqYTL5YVoPbjZOElRfMsLSRlndm9kCm59wxqyCub18lS2sC4iFOZEjuZYaqi5R
         DslC+1fN0+GFO87y/vJYAJFNIqwwHtfp+zS2BdeQl5o9Yc+tsdtdDEpe6yc7Hen24Nyx
         QM7ofthEOwxbiFhEI6jjap4zITl2o5RZzGyzqnGYtH8IG2Hr7L+d5kyhZRQHND3vfeOc
         4WNy/nnMHgTn1rvbj0JI8tTXJxCvECsdMkWWuUta2T5JwIs/B/GyBxRCu5FTe85w6c+e
         GELQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793328718; x=1793933518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        b=anj5O2Zhy7jF+R35kYidt3k4/MWzkf3P/QyOb3TQ16Uu3qHaGHiG51pxHzhlyizr7P
         Vh+n46sEfWvHAe/vKerWeesocifeU5NtsDl3/+MRuxNsD+jCyL3HSe4ecEBHBAVmODHt
         2c7oTBPjzFrwT+RncGhSyaB4/7P2VSMAJQaXWtw6mM8KEKinOpzuHtqM5tYFjo6EW1Pc
         KY58UOAKS1BogHH4ayIcKZRVaHwtNpx7/uqH99y0nB7zYOxBGu0ruAbqGkmibePXIe0M
         AUyyDOPfCnNoJggoBWD56LAQwWbiqS0V8ZdE+Jea9Dm64SBOLJqq9hNqtt7i930x4EbQ
         SOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793328718; x=1793933518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        b=pw/8ErC8Eu6sAJpXGoXW5iEdCu94ZhiqTAeQ8u9MGVhUUSjKorQLHq1yCS/NWXav/f
         EP1gjrtGphcmmYFXKue46CCBq4bdhSt72QV3Ed9OITUESoL9ViDAD08vMNL7bDOtGt6L
         o44Ll7TL3y5HHytxx8FnRqilkZ/DcFnMBTpS3qEloabGbuwK4yUeanJBmHevytUNPdyi
         oHQQj4qbIXyJaeyh0BTVONh7txeZQQj5hDsBu/uhabJWKsy1ViRABsPFZC7KXr+h9/G5
         +DZCxrMS5tYpr2yfnDSRRZs8Y03Ly3WtxL3o3vuD9Hayz3EXK7uhcRHa7yDgaYmB1BwV
         0/1A==
X-Forwarded-Encrypted: i=1; AKwUvBzsla9MtldI838V4k5rMql7A8nskfyF0ZzPkXLdXfWUp9/UZvfCr9FYM1CWweDZD+RW4PfbsEIQhiMgH98=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+s9yVydv0PolYXr8Cql9rzS7CEZbAmsj2iBtc5kND4WTYmm8Z
	OfxnhwwdkyJwKtAa2ckKcPHynCRRx76tpbxNy+XU+aIzGmqionsx3BaIgpg+GHWSF/liqzTj601
	LI3ym1++XNFUT1r3fvAVM70x1tnkyYUNLrOvU4ZuGfg==
X-Gm-Gg: AYBFou2U5s0qGZEUthRkDuQK2hxmeldiwSPdmLJ0el0rj2MhWpeZLDcPyJMaWq8iOtQ
	4uMtMfKklkmvjYixiNQRE0gH0sX/ypbJX9yIqa8PrvCyumQbmUvvxpsURjEetfB8KkysA7rq+UO
	ukcyR4LkEdwSjsYiMS4LQDJwY8P2CxqVOgTRwM/aPqSXawZ69IShl+Q5EHWqXVMb5HElyg83nNJ
	uInL69A2rCfKMKRplKHNPEoawKFjbb9x2oM4aE1cI/jqi/3CSHSCsljsXHNsSbmd++Dj86kcx1y
	DKzIATN92RV9leFgs1AxzO2u5ACDLOriHx7mfz8Mmu9Jj8D/PLgTuyc+jZE2AQZYiRdzsGOcVBk
	i3YjyGf36BKC1wHXz6Wb1A1c9CvpqYbuetNrYZ3hhZw/nblGQWLaj3pa5DeWzJKuGyHGadJn9p7
	cVMcGtnYwoU3jJiXd+hfUevfA=
X-Received: by 2002:a05:690e:454d:10b0:679:a353:7a7d with SMTP id
 956f58d0204a3-67ba4eeac55mr426041d50.53.1793328718349; Thu, 29 Oct 2026
 19:51:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029162343.1896134-1-e@freeshell.de> <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
In-Reply-To: <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 29 Oct 2026 21:51:46 -0500
X-Gm-Features: AclHuK_jwkWhvW67oyVz3_xpn9l6bwLOir-RRbNmugfkCBr6eaFqkHpPNMfZ2UY
Message-ID: <CAEev2e9aYewWgOjxSq6ShaLpj6SaYjxQq+C-L1zX2vHyWH81HA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: enable status of mimsic and
 maplic to okay
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: E Shattow <e@freeshell.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

On Thu, Oct 29, 2026 at 9:04=E2=80=AFPM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> Hi E,
>
> On Thu Oct 29, 2026 at 9:23 AM -0700, E Shattow wrote:
> > Change the "reserved" status of mimsic and maplic to "okay". There is
> > an mainline OpenSBI user of this and setting status okay resolves the
> > stall of Linux when probing peripherals at boot.
>
> Thanks for bringing this here. I still think status =3D "reserved" in
> k3.dtsi is the right description.
>
> (To clarify the Acked-by I gave on the U-Boot thread: it was for
> carrying the override in spacemit-k3-u-boot.dtsi, not for changing
> the kernel DT)
>
> > @@ -1452,7 +1452,7 @@ mimsic: interrupt-controller@f1000000 {
> >                       msi-controller;
> >                       riscv,hart-index-bits =3D <4>;
> >                       riscv,num-ids =3D <511>;
> > -                     status =3D "reserved";
> > +                     status =3D "okay";
> >               };
> >
> >               maplic: interrupt-controller@f1800000 {
> > @@ -1464,7 +1464,7 @@ maplic: interrupt-controller@f1800000 {
> >                       riscv,children =3D <&saplic>;
> >                       riscv,delegation =3D <&saplic 1 512>;
> >                       riscv,num-sources =3D <512>;
> > -                     status =3D "reserved";
> > +                     status =3D "okay";
> >               };
> > Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 =
SoC")
> I don't think this is a bug in the kernel DT either.
>
> This was also discussed when k3.dtsi was reviewed [1]. The DTB built
> from the kernel tree is often loaded directly by the bootloader (e.g.
> from /boot) instead of the FDT that OpenSBI has already fixed up. With
> "okay" there, Linux would probe the M-level IMSIC/APLIC and take an
> access fault. The compromise back then was to keep them out of the
> kernel's view in k3.dtsi ("disabled" at first, "reserved" since v5)
> and enable them for the firmware build in -u-boot.dtsi, which is
> exactly what your U-Boot patch does.
>
> (Also replacing Guodong's address with his current one in Cc.)
>
> [1] https://lore.kernel.org/all/77f9a001-7f0a-4c29-abcb-501e875da117@sifi=
ve.com/

Linux will skip probing the M-IMSIC because of this piece of code in
imsic_get_parent_hartid. It returns -EINVAL unless it sees interrupt
ID 9.

    /*
     * Skip interrupts other than external interrupts for
     * current privilege level.
     */
    if (parent.args[0] !=3D RV_IRQ_EXT)
        return -EINVAL;

I see this in the logs

[    0.000000] riscv-imsic: interrupt-controller@a0000000: no parent
irqs available
[    0.000000] riscv-imsic: interrupt-controller@a0000000: failed to
setup state (error -22)
[    0.000000] OF: of_irq_init: Failed to init
/soc/interrupt-controller@a0000000 ((____ptrval____)), parent
(____ptrval____)
[    0.000000] riscv-imsic: interrupt-controller@a4000000: providing
IPIs using interrupt 1

(a0 is m-imsic, a4 is s-imsic)

[   10.727605] platform cc000000.interrupt-controller: deferred probe
pending: platform: supplier a0000000.interrupt-controller not ready

The M-APLIC probe is deferred, because the M-IMSIC wasn't probed and
there is a dependency in the DT for it.

This shouldn't cause access faults as far as I can tell.

One would have to implement a dt fixup in u-boot like Heinrich
mentions in that thread to solve this.

>
> --
> Troy Mitchell

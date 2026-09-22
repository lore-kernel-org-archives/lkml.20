Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3465448BE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093046; cv=pass; b=RQOfQt/l4hCIxHpAwg7ulW70nsczMxGuCjsSr2ZhmZPGSou5kqDE+nkw7wdj7dL512no/ZQAZlAcyFmFRd3S9l/IR0EQ03ofvhUBNaCeqJzMVsAgsSkwtIoumrOCHvh03ihmoQ4SauDmOStPvISUVwe0HjwtuOzGw+TpGLETmeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093046; c=relaxed/simple;
	bh=KEdmrWiumUeXB4OLzOXyqvUSq3Q91QBd/CBRfrkSmnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvcqBAS6iJfrCs8jArgyYUe3VvZOyliwCnalZnhj52uW6OK2IC+Q55Ia5desMvXTVNWIwgy2BG3TeFaAfx8bI5TUVlSi4qQMT5q9XrUlyHpkI5Etqc0GCzPi6jk+VUxrPsjo9UnrZjH+bKf6I1k6bda+wdhYEm3z862Gd0r8C38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqOz28pp; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqOz28pp"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab19125so4448783d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790093040; cv=none;
        d=google.com; s=arc-20260327;
        b=Rd1GnI6wPwvttHDDePP3TJm3kcO4ecC1W9YbxddIDOeM5xbIljQ6lPQHfNHAsTbd+u
         SN4wG8Wc0NCxRe96zF8ggYnR20d1CCxHX0K3SDh3thiW1v161H1MvF80cQ5uaRAoMdSC
         cwqEp5PeMxK0A8pzrG4nPBREOUqKqJQGihwZfnylpdlc1qC9rYUODwtwzGUQFX7XVowQ
         JOHMfj4A6Q43oYywNugJmhqtoejwccitfbaoLw3l4qgczMqK80vgvUPUFcVauuwzc+TO
         O1OFkQC+61c4WFbLitCiRPFAdecbtTgNchlVrvOInBywQB/cJeq8gmxav4s8w7KpGs5s
         FdqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=;
        fh=UKekYrhBiAgXxzf7EX/X2W6L3k5NsYg/SsbdVQhw3pY=;
        b=bIdORU7u/Y86lKUntwugCly4BGucSaa8AnAVJ3peexAyaXxIMKpXDDme5GgfcC+uiy
         /DVi6qbG+aIlKE73WfFygmzipELxLNS9Tikkf4L+7PAabQkc8v2UD1/GFch/x45s8Sjt
         g0aqaLlNfI7eNryv2LXZfBIW/NnMOawWqGEQg81LshB8pXbj3E7irWoqnE5/iwS4fVP4
         bM76xA7uQMKge/60sRFCHVSJ+U0HhPScdIlf+aWtJZWuV5tAPdI9tQgRJtY2EEYy3Om6
         C53zl/nj+X73aFjyOq226qXPGUQEqAeUw4KnLwmhI3qLe5hU8V5eAmQEzGyFTRWFbJKa
         qCUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790093040; x=1790697840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=;
        b=iqOz28ppYUN7gvnN6YWZ2z718+SxoSgwkvhoHjXKrD/DAIj7yV6jheqrqEfgsw2ezg
         vq7REODx6AO8c4TzANyFIGp1a7vN3f7D1IItZASS2nCOBZdcf/Qzqu5t1jxaB5vBS4Db
         l7mx3K12iu7wgwKR78KyMutgkQZgUqbsxsKeeG5rYrQ0OC8r636TbIkSAV4d3NTHoG5s
         TmFZLHncCucnmJ7HS5hnDFOcpowiTNj5N3heHIrAL8+7AE5xfn1EM7Uz9KCyElWCNjID
         4GV/G0Ufw5HrMn3MkMKCcvDGwa3z7WA172A0dm/Qy/lDuHfNf4CnTG18C6DxMw6acfTU
         OFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093040; x=1790697840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=;
        b=0VOPtY8bIdscY4plsM07NExzgkt3F78OHkCJD9Im0qKA6+nJEq9bLtIerkkO8fiFOt
         UXfWdBlkGHRcOgZ8BLo1QPXVU/y7wChj1S0ESv+KfnpCDn9L7bf6mCB60D079U/o6jeb
         IdGz1eqicjDQS5HDF3X1RY7nepmtb7yqI3i4qC6zYoVCTdviGeJG0H5V9QK/J1SvrLWP
         EfKh90zFDLJ/XaUQyjOyWfDOUJl7MJhGkc9VAbZSHgJDdM37vyCe8kt7YLDncQ1TfveR
         xzdKpaCoGqujFhOFFJI3DK0SISWabHIJ0GUKNR3QNXSrSIXJVXh6s9zwXj9p/qNrC+Hr
         3lNQ==
X-Forwarded-Encrypted: i=1; AKwUvBztBTwDxcYVo14DOlhpY9dOG7sKF09pL9Frvc+RuaJTaM5cUesFRH3nEn1vuetvIKDcUlc/DlVyFHqMvrI=@vger.kernel.org
X-Gm-Message-State: AFuF++np25Up67a+uZvcNeY2QTITzNk2ZJGz7MKpkD+M2SFGc1YvA0v4
	46o9C1jYFY40NV3iOmaPvqMYTs2fY6hfmDPaHZlWNw2T47yAeuJq9fJb0DOOC7Cnntkh1+TZoLD
	MHhQdMuPYy9s/L7HG8Biz4WY3n1JjaxM=
X-Gm-Gg: AYBFou3XxJaRQlWyQp/xHSQ226UHsStoBBNPxyXJiburgGHqm/e1+emvu5xBERe0ojr
	iru9LWpa2LUF+R9m/jZpQiJvOCnxBFDe43RbnEgPyBzAossS0lf+FDFbw9JVZq+4FkU4bLEYNmt
	+nBAoZQqNdDSNtHGUsk+C/6L0nsrP/wc299CHILqd4qq7OKZyM/Jb/w8Qk+PtUvvV4pdaeNNeGq
	H5tdFBr7onOTPAeLJ5+OoMF2HpoI0vqUTWkp78ThO1s9IQ7/Cz97UDmjCT2Szq2BKRbIdLMrQOm
	tI1LINkKur3jk1afYGv8T0fu2rZgLaQ5YOWrvPKuCRkBJMQMT0zbZ9nzmWKtI0PQzToX
X-Received: by 2002:a05:690e:1249:b0:671:502f:dd32 with SMTP id
 956f58d0204a3-6717fd6b6a6mr5447023d50.53.1790093039560; Tue, 22 Sep 2026
 09:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
 <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
 <179008369971.83584.9572254757332285883.b4-review@b4>
In-Reply-To: <179008369971.83584.9572254757332285883.b4-review@b4>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 22 Sep 2026 21:33:48 +0530
X-Gm-Features: AcwNN1Vb40B7-CxaHaopn8HdM12Pklcn_b9p8jPV7ixD3IPvviwFvarSvM72SF0
Message-ID: <CAMFFDGhNg7ogv0NYXe5Vga0Tf+XD85n80=MOwa6FgSX7q9D0ew@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, andrew@lunn.ch, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thank you for the review.

I have successfully rebuilt the B650D4U DTB using multi_v7_defconfig,
with CONFIG_ARCH_ASPEED=3Dy and CONFIG_MACH_ASPEED_G6=3Dy.

I'll correct the GPIOP indentation and retain the review trailers if
another revision is needed.

Thanks,
Prasanth

On Tue, Sep 22, 2026 at 6:58=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> > Add the device tree for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > Describe the BMC memory, SPI NOR flash layout, UART console,
> > GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> > connected to an RTL8211F Ethernet PHY.
> >
> > Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
> >
> > Configure MAC0 to use the RTL8211F in RGMII-ID mode.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> >
>
> *snip*
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > new file mode 100644
> > index 000000000000..a4e384588a54
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
>
> *snip*
>
> > +&gpio0 {
> > +     gpio-line-names =3D
> > +             /* A0-A7 */     "","","","","","","","",
> > +             /* B0-B7 */     "","","","","","","","",
> > +             /* C0-C7 */     "","","","","","","","",
> > +             /* D0-D7 */     "","","","","","","","",
> > +             /* E0-E7 */     "","","","","","","","",
> > +             /* F0-F7 */     "","","","","","","","",
> > +             /* G0-G7 */     "","","","","","","","",
> > +             /* H0-H7 */     "","","","","","","","",
> > +             /* I0-I7 */     "","","","","","","","",
> > +             /* J0-J7 */     "","","","","","","","",
> > +             /* K0-K7 */     "","","","","","","","",
> > +             /* L0-L7 */     "","","","","","","","",
> > +             /* M0-M7 */     "","","","","","","","",
> > +             /* N0-N7 */     "","","","","","","","",
> > +             /* O0-O7 */     "","","","","","","","",
> > +             /* P0-P7 */     "button-reset-n","control-reset-n",
> > +             "button-power-n","control-power-n",
> > +             "button-nmi-n","control-nmi-n",
> > +             "","",
>
> Nit: indentation.
>
> Other than that:
>
> Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
>
> --
> Tan Siewert <tan.siewert@9elements.com>

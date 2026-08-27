Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF48635294E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816806; cv=none; b=XeTc4yD9qx7vCFsQCIxPjf3+VSTgBPLMZr2X0Uq/NEqexq+ZpniFOWRc6ixz80SNYsH3XiN8jzvQmDAbY5ZIsjGIbwJQp8KXeeo+8du0Fip/XbvMKQYhLqQrjKy7eynq5Eab+LdHOJTMeqG+bVPxzWSbJ8imR3kkYMJpqMxGa2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816806; c=relaxed/simple;
	bh=xjGOQAyeG+sLGtpTLpoNkkVbqJYjiP02GBkiprEbtwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOtmTjQyL6NJgLU2kdpNJgROE2E+wF6tvjWhmx29lOU7BstYFyuSAZjzHETWn9xxzSM+aI/W937db/Uw059jxpyK1jbtGw/M68GbCeDx3G+W0HgjaZS5VUCFVn8d6tJHWxrGLjXcYhSZByDnmaRTknywfPU9DFTPVwMg9xLNuJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9690c99c917so518415241.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816804; x=1788421604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvUM4c5tWmaF+uSmQU/koXzbQA9wo3PXrWuljtwS+9I=;
        b=dpXrnhN3h5BbzWhnrjgA6E5uRFqaFe+ZHrz3H7/Lo1Tqw9VCW0WUXjulJcwUs3M+Bk
         eLsxtqSlhEQfu/6WEDG+jPiS/Mn+PPQCtd2z+uiE3KWzvZwwG/2yxG2hyvorE9QpyPfr
         7YgJdT+vvYkl56uw5tjS+ioOKxnycuRxmQwhzmzGJBoDPkdIrIiUj810JMxD7MahZdzC
         W2B3Fis1sqeE4iePrsf9fYF5ysUNK9YB/cEuY6xScbqNF7mXq/1xMo0FYKzXiPJX1H2b
         2B/XtULkfzNBgaW+JnGErlCkR6ZHftd2V3/VG8TBqN6j9vkU8h76GyUSzbrhHbTYj1gx
         l2AA==
X-Forwarded-Encrypted: i=1; AHgh+RrEnQl2Pt2Xih3VJvoahzFGdRP3/JtFftk63DnR9Lcv8ARgBgUK1XF2KGPw4s/dsuj99Kggb6WtxXTcB7c=@vger.kernel.org
X-Gm-Message-State: AFuF++m9+IlKruJVnAA8sbLaK3G5Yoa9XYzwUu1/eDm01MPZtl2xVoUA
	pzywSDSzesBbhjgI1VkdxCxF3QVhFC0ya85ykhawAtj5r5uEJ5Yw6nt2wxkf47N+
X-Gm-Gg: AR+sD13BNYkTPUXdurY9E7YkBGobayPLoEb4gdZfUih98OhAcoSZHfcvI03YBBvtCgo
	IYcatXOG3q1npLKU+UoshoGMcUp1XqNSM5X9J77EB+Ok/f2UZpCA9JczjZi3kuRMjqtQCSXGzBv
	6bf3GCAy9vSGEd/4WnPk+OITEzvjVWBb27Yl4fZXy8G0C3kkQ+Bv5a5cg9B1kbeEjXSCpyknum0
	sNP4ar1phJZFJrbm6QcCE+vOEbcem3KMzHiaUm+fAGyDhm9r22AZhdaogstfWYFXlQxOfgxiibY
	NoJILlJNgKmGtzLYxy8M2txuEVGvMmK5nm0HMTLaQ0D877B4+ytZy+O8K1nQCNnV/efX86XCwrZ
	09oafo0sbq23lbcDBztkTGWEhxl/YzH0GG3o6iXJtV9nu7KQ4eA90hLn3cw5I37LUf0p/5DHCje
	70AdfhECy7ptdJtv2hwMS264k/Ff36HhboKCzpc1dLJQ6xQdOxhNsGXapXJIWQ6eE4cLe8A0XkO
	OxYGZGBb1ohD1FO3RMZkugBiQ==
X-Received: by 2002:a05:6102:f8b:b0:783:f3bf:f9aa with SMTP id ada2fe7eead31-783f3bffb9cmr2396709137.8.1787816803653;
        Thu, 27 Aug 2026 00:46:43 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbde09650sm4237662241.0.2026.08.27.00.46.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:46:42 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-77bf892b496so558306137.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:46:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp/giN1rPjDmUEeI2ywUTqq/fHuL7BGIhanWVfP4CsZvdKY2a/Z7Lx+g8pSnGHYgsYXxwlWIW9CUNqYzPE=@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:77a:3431:669f with SMTP id
 ada2fe7eead31-782c09fedc3mr3945222137.7.1787816802245; Thu, 27 Aug 2026
 00:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com> <CA+V-a8vWaxPyhyBF3wHKrTj0WnimyjxmU7HCD+aD_BazZGdOgg@mail.gmail.com>
In-Reply-To: <CA+V-a8vWaxPyhyBF3wHKrTj0WnimyjxmU7HCD+aD_BazZGdOgg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:46:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfeXq7yNH4n-cMyefHfj_x3u-GbQfzv55h1EX9SfTR_Q@mail.gmail.com>
X-Gm-Features: AcwNN1WD2c4xDDI2BYSA5G3mLqbJIjczt7SqcefQ9gZ9AETqqwoYkM7EIcUyqns
Message-ID: <CAMuHMdXfeXq7yNH4n-cMyefHfj_x3u-GbQfzv55h1EX9SfTR_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot
 partitions read-only
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 26 Aug 2026 at 19:29, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 26 Aug 2026 at 13:28, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
> > > from being modified through the MTD partition interface.
> > >
> > > The corresponding boot partitions on XSPI0 are already marked
> > > read-only.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > > @@ -825,11 +825,13 @@ partitions {
> > >                         partition@0 {
> > >                                 label =3D "bl2-1";
> > >                                 reg =3D <0x00000000 0x00060000>;
> > > +                               read-only;
> > >                         };
> > >
> > >                         partition@60000 {
> > >                                 label =3D "fip-1";
> > >                                 reg =3D <0x00060000 0x007a0000>;
> > > +                               read-only;
> > >                         };
> > >
> > >                         partition@800000 {
> >
> > Makes sense. However, what is the recommended interface to update
> > the bootloader in these partitions?
> >
> The BSP supports updates via the flashwriter tool; there is no
> recommended way as such. Are you hinting to allow this to be done via
> Linux?

Exactly. But as you recommend flashwriter, and the two XSPI instances
should be consistent, I'll just take the patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

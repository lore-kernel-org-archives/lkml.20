Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484AB305678
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765369; cv=pass; b=nyCxUNZNJW44XsfBX5LvSZpFiQtmeTs5zNvfgdbh1ytpOwM8hl7EHDRbrkD0Cv5zN4f+nYoFetml+XxBpQd8QK+QJjREv8M18ZrjiezPP8Eq8A6xsHe/bdghMda4D7zuEgf/iRbBrQBIKEAAUIdmAkeJfeX/p8T9bDcQPeVbiYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765369; c=relaxed/simple;
	bh=PIULD2sfSK88keFpIH5V5f8s/UfnOznWi0dgeAPq4gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7bdRYPR1N2r2U/gEj7RMiw/5/82L7XkMtMDsBFHh9w3IKM3lTNELifDi2e5R4PB3BwcQZKKP3r754fhWPgD0ZPmV2CoRJdyVzW7gwjK0m8iiUX8h5bjVC5kWIEjCa3NfJhhzZVLEhI1+QNieEdZJ9XlBiDBTs7cAi3ugo1tLEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E05CsRpE; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E05CsRpE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b966dd74so5869325e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787765350; cv=none;
        d=google.com; s=arc-20260327;
        b=Vq31gRcEOhTqV/PF5NoTppLTY7i/w56C+YOe3JmmHlCsNhxlAQSaYzftVqQM6kXfNB
         yzU2bukwMjL6HnPXoVKJfhNDQYFvKJCjF4bcCpFd2i8Mh9pk1/XBULXxDtXJwVMbV+mr
         e0qTvFUJEIB37cpI/QRYw20eW/53O/5Tx2bWAiVdmfoatHPAijog6x1oA8Gqdp9VDNWr
         w5MF+R25MwALf55Bed3+G94Yr6TvsRyxsCXnVxe5ZuwsVgSkvK86z6xTK8LG2UVnDI82
         eCvfcAX4V6ErtR5z0rJPxmzPvnLradoBKHao7HnffhYhOSPHvbEAeWlKtlSnQLtFi/pE
         4YBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QXN0egExQUN8IBSJ2IqvNwpvhI9gdkWCNjlrCbNq1Z8=;
        fh=FmvX/+R6yo5EkZ5NYyYzvQkKMNEPb92UoA2Ik/uigvw=;
        b=RydTuIOrt8kEiwYfN/WPCBmGqrXvujq4DAeaV4iONucfLMc+pAAXxGfSS9tHCd+JM3
         sbjLfGF5r6nNyzbHzS2xZWYfm011HpT53JYGDkxb88N7gDgR7X8wF07SzQauaj/sXywM
         /2E43nTLvIvYCxpmX4rVVt+8rNZHojjNMcE5AlwVTVEJo2/7pIj/FdBf1+bbKOg4cYpD
         LqppOR3vlJvaglnj+EVGJ7yvkKrDznGwJbNCXTpIknY0Y6HJugrD8WApCVtmcurn/VK9
         c8vZn8edYQ6geZA1+tvx6KSTxrFy032gjSCiUdVrfi4nm6bf/bhyHbiReRIftD21v5jT
         bUfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787765350; x=1788370150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QXN0egExQUN8IBSJ2IqvNwpvhI9gdkWCNjlrCbNq1Z8=;
        b=E05CsRpE02vTA5otmhUKSb0EWvky69+A+daxwQjuLewClNxTHdCzxP0AbZkpfPl56U
         Rgmtdi9UZDJrX4i+jALLAePZpRHUtuhBAASzJFpuuXQ8HoFAJH7W4pwFpZp02EeGzqfc
         XmFmpx+PAYWaIx09oXhE5U7beVbTqb4+Csa+sCo+C7LgXo6LByAAitmlSVNSLcvNEamI
         lKe3bzxaM6RxbZdbqJHaFLFIpaBDVZC27QjAGnV3f7HxuFlXPHmpZ2Gvp0VYjFFh9qFH
         UIVWgLyNrYq/ifJDDjDpgcisIN/EpvHipKcW2cwZ4O2JSu6pI+5Gpsl/rIBbmrUqnBJ3
         C3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765350; x=1788370150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXN0egExQUN8IBSJ2IqvNwpvhI9gdkWCNjlrCbNq1Z8=;
        b=HrW7F4GxnBUpQ9+6QIQEru9mq9KRV53fI2lZoS6qlbxfsDzhFhwM6M0MSfKpptBsC6
         sK/v3J1LpiUWQCpFrCNsvZXxamfzAMgHHSiG3IVwvxyKkhUzqTSESdumBKsslT0Vh0Px
         l3mBCAr80GU3hDjsLkZYMtlDIMfrLVjSV3QYlFszg6j5hTIntvJSxX/FSV+MhheT8yNJ
         j0B2/iqzqDFP/dgTUmU0PktH4SR2YvOSX4i+cbpi59EnekKM4SvjWwVSwi8z13bWqLpW
         Y+G3f7vAQEb6bz0bB9aHdlFl9gqYPBikCxPMiDY9YeE4ERK5HaJMR5mRAsfdyYxVfT2Q
         ak+A==
X-Forwarded-Encrypted: i=1; AHgh+RqS50c0bjJ/8kZOeoybAGHrjRYXjRq7g8ajjw0J/0xP2Ag0GhEBOPhyO6NH86sfSbNJkZijQCQqA8okU24=@vger.kernel.org
X-Gm-Message-State: AFuF++mnDcqw+3JKsVvltigsaUBTk6r0Wj8JPiHALq10uaE0qzj5+Ung
	7N5S/RzsaOni8n2f1YnE5QhTv4DJy+XTD+rFIPH40dn5IeGBRIrld5Gg98W/DBfxgKWf0CgN+9t
	aXJ9OAx8NpJmlEFd4Ixg2j86a0Cvp+Ao=
X-Gm-Gg: AR+sD121RXlTdBrUgOWfmgbzC91iJa73Uf1tG0ef8wEbeMkZ0oKIcHVMeX7RLmbCwaq
	rSz0r3sY1ZLGRtWLQt/z4w36oOn7VB3mOx0xS+sTIWqSMCPR+cqIsfR1nVTJO6TWGlmaVUM2D3e
	3/H8jMttZ7K07qW6gmZclaM3NewOFFshrwOlEbyDaHswT9Xjm1DIt1T8JUzpCuXK+RNwt4ykK07
	GMp29zeLgDwVidvXjvA7StT9WxJ+imiG+E8GsVISUE8bTk8Y1jiosBdKptJ0M946pPZLmVH6e2l
	Cly8arFUiyX3RmFASpTHP/MueU3dXAPJkOvOyubP6Mj4idzE4PUW9DIKn9J30kuWUsKKOHNJh/e
	Zv2DOITepi94gP+IUoffB4Ooh2/ivhf9Lr5Bw78V58bIK/7Qup94ClyMlvgTysiDvug==
X-Received: by 2002:a05:600c:1552:b0:490:e5c1:b8bf with SMTP id
 5b1f17b1804b1-499dc822d91mr79612305e9.13.1787765349355; Wed, 26 Aug 2026
 10:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
In-Reply-To: <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Aug 2026 18:28:43 +0100
X-Gm-Features: AcwNN1XTZI4bYMbcU-2XeKqWyg1OIm4BXC0WXAgrgMa6hG5Leq-MAga-Sg1fRPY
Message-ID: <CA+V-a8vWaxPyhyBF3wHKrTj0WnimyjxmU7HCD+aD_BazZGdOgg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot
 partitions read-only
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Geert,

On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 26 Aug 2026 at 13:28, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
> > from being modified through the MTD partition interface.
> >
> > The corresponding boot partitions on XSPI0 are already marked
> > read-only.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -825,11 +825,13 @@ partitions {
> >                         partition@0 {
> >                                 label =3D "bl2-1";
> >                                 reg =3D <0x00000000 0x00060000>;
> > +                               read-only;
> >                         };
> >
> >                         partition@60000 {
> >                                 label =3D "fip-1";
> >                                 reg =3D <0x00060000 0x007a0000>;
> > +                               read-only;
> >                         };
> >
> >                         partition@800000 {
>
> Makes sense. However, what is the recommended interface to update
> the bootloader in these partitions?
>
The BSP supports updates via the flashwriter tool; there is no
recommended way as such. Are you hinting to allow this to be done via
Linux?

Cheers,
Prabhakar


> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

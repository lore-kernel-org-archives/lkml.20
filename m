Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F61353A90
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770867; cv=pass; b=CBUnHg1N02O7T9WrzDRju+rzIZAENdm54lwJFQYxd2MzUxcYbrOHaiLt3GVpNxSIeRLro9wfP0sPkUPlwnkK8OfDCwp1FOAOqEZ2jyEAkN/4yBw83WcNtDDKwSLC1LkRRscpgwTMj0nD6yZaR++DeAiKHbqhMS5NFheNSyjF9us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770867; c=relaxed/simple;
	bh=KCb+AEWT222QOqqi/nfb/AJwudII8A22iwSuXfgeJ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuInL9bTXOfRWJxs6dDxC8ro9BvtyHRO5xgFQDPLQZOieFRZxhqoTjo1D+I9gd2CTd6eM+LgEvsjY7Ne1IX5tY7X0GEYA3fWY1c4LXvrybacqwlPgk3CdFlX+N/Duoq9Mog0gnGrYDP4kCPhqXTRmU8dGTqOwt8qQcJ9BNAn8O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=MaM3+GZ8; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="MaM3+GZ8"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d9201076b3so37331795ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788770864; cv=none;
        d=google.com; s=arc-20260327;
        b=M0beR2404OC4HctDugtveGN6ItPqUlTsCQcoeaXRDz92Juox4faIimOEjjQVy531G4
         n+o9t4HwE+Nxn2SWHGkpTf8G1ugunWlOAyQIJzWKV0JhfsSuQPA0ARftHH7wfGbf9aEB
         OHGLyYxjjb+4vPGUBuCKhY+NaqRx6Ttd6mSk7qesc+hxB/nD7PNoR+Fm+6Wr9873iptV
         Tb8agocsQLewD54ZIDwCLQAtiA6B01jDVLwJuzlkKJqM55kh7Cn+1kVnz2AXraIMBw/H
         qescFY9ISjkwMabtM2RXyz9uu/e9XPfWXO/nHz/FoaoKteumlHYt/4TQarx+Tjr5zfrB
         ndaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=;
        fh=HsbLZer0BVxJXiyXS/XFIzoVce8vtL78dRtheJNZxKs=;
        b=o2vH9TzKvk2zgAQB3VwSkvAAL5fA0IbKUegRePu6ulWVWuMR5oLnUWcE3fxLtDjaMq
         AB12PEXT6Db5ADgQTxkz04FzGV9U4CmaxcP4xwYD0nysKfOZyaAl6/eczpQB/y4i7PK1
         iERigqDjFsKLR9bnQJoT+zoEC8flNMBkvDOn6TIuDGy9/sZ9SnfrZ1kgbcUK25wa5qpV
         gCZ/Uhv9ELz7G6je4HvaftIoGGQdjhdmzXMlIYUGP/ucDFOQYyLklp6c7ftwW0d2S9Ta
         RL148nbW+IlTAblCM9lyEsKpE+vQjSF1ZBryTkRGxAYC68FxHkz0IjNfbS9+4KlDwNjx
         iTyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788770864; x=1789375664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=;
        b=MaM3+GZ8CgUjDMCr9OVjhS62XoBR2OhkcGnUyOFxHL/yysmPcnJr88vUUdsA6fk3qg
         sDj0ihjZqfYbfEiOD17ky21fh4irAn67OgELzwnJyT7Bg1M3KCUd29T7R6QWvebfw5AZ
         ZiuCwC28nb6glW1Gh+RU3U26ITznkrlcXDQ7iEOhejEu2HaoBFvOw41UqG7uR81v8fae
         yYFkcoc76cF+70EvjsQNTvhIuHwOfFrf6LTi/zVfR+s9s9mi6U5LrZWGX9eTc8RWDc6I
         dymI4+kM/T1PEr1x+wXDI/sBiKhsn7shAgo0sxCgX3G1wSzyNonEbwG3eBWP+ZCZaSTD
         S1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770864; x=1789375664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=;
        b=mOmfguCw8iom7oJaRoYm67OXhcbwkitTfxr/fh9SGF+5XBBmHd2YhBRHRGyrztEWL1
         VDxethc5w6uGZJ08fEM35KVXeYkSpfQ++8esDE2XvFDX9RZqaKwOY1ICk3kYs54cBnfi
         tri6PxYEnlIaaisOKTvFDvvBIiO+JptX6HcgpvU1W0fMyGf+PurDdL4kcWRqpds3HwZX
         9mexuIaeA2a568I+Wbmwr1EK/N0TH9u8xStcb3vFkqVUeRMPachzVaa35DqxdSzRgJg4
         3XKZYlL5jFtVfhCkhf84KqbR/JCCQp1ffEh48/Emq3y/L+l3eK1zX434mFSfHWl4hjZk
         9NuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNXrErYGZOepdWF2UdaIJSXcFoKn/0X9ozoP+ef4IvKNcjuw5GQMyO13DmkDSM+HMRvtSoys5PCi9TAkM=@vger.kernel.org
X-Gm-Message-State: AFuF++mLk8oxdwY+Hr6WyjbN89sR3Tqrg9IuaKtimHb29uVDVlogN41v
	XfzmFUdOzmk3wshFlEsHf7KuUoV5vzmhzSnXtGozOJri/JBQ0NBXRg0MWzi0rWS0xwibf7PAEAt
	r4jxS116jN4hZ/4fcGvesiwDpPKhudrBXkGpfWw4aa9eg/lpCtm1r
X-Gm-Gg: AYBFou3FABQDiagCIsYjfK+YxzlLMPkmb72gPNkU6Wku95pASPkt+hkMYHNXgTfVcha
	+MF7egslNQkll+lmBXV/Ztf/nPuZEhzKlprQZBDC0hHmXkMokaRCp7Rh5prslVVuZGb7swKErn4
	akk8Dg2IsjWbSfMBGMWDVBKUM39Pw8oA8uiyZWDweQD/pI98C93Dx+71AiMgYIYjJJLipw4ayj5
	itj0WXwmHrmWumeEYp9kDKrs0aUSM88flt2CK2NbQXruiYucnKHcpGNrwLK2PUZJ7EIjz6PPdnO
	2D6xEnu+vGtb1zHBp7DQgPck+Tf9Jky/yk7E3mx9k3HMR7Xd0Io5d+j7rRCEMn72X2f/WR81Tfa
	58LMNG6upa8BN69VTW1z+tcBwgA==
X-Received: by 2002:a17:902:ba98:b0:2d6:fee6:65ae with SMTP id
 d9443c01a7336-2db1232e1c3mr208841035ad.4.1788770863774; Mon, 07 Sep 2026
 01:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
 <20260824110432.1074136-2-robert.marko@sartura.hr> <0cc2d875-7aab-4091-816c-031f21f3cbac@microchip.com>
In-Reply-To: <0cc2d875-7aab-4091-816c-031f21f3cbac@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 7 Sep 2026 10:47:32 +0200
X-Gm-Features: AcwNN1UN3QTAaO3T5aX08ZJGRbzWUSCSQzk2RVV1wbUqXENm6k12pDenn8TnFIY
Message-ID: <CA+HBbNFdqjAJYduFukaZL4+EN12OrsT4qsso95tds828m_z0ag@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: microchip: lan969x: add SDMMC nodes
To: Aubin Constans <aubin.constans@microchip.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 7:14=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> On 24/08/2026 12:56, Robert Marko wrote:
> > Add nodes for both SDMMC controllers.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >   arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 +++++++++++++++++++++=
+
> >   1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/bo=
ot/dts/microchip/lan9691.dtsi
> > index a8541c6a098d..2d943ea75768 100644
> > --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> > +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> > @@ -414,6 +414,30 @@ qspi0: spi@e0804000 {
> >                          status =3D "disabled";
> >                  };
> >
> > +               sdmmc0: mmc@e0830000 {
> > +                       compatible =3D "microchip,lan9691-sdhci",
> > +                                    "microchip,sam9x60-sdhci";
> > +                       reg =3D <0xe0830000 0x00000300>;
> > +                       interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&clks GCK_ID_SDMMC0>, <&clks GCK_ID=
_SDMMC0>;
> > +                       clock-names =3D "hclock", "multclk";
> > +                       assigned-clocks =3D <&clks GCK_ID_SDMMC0>;
> > +                       assigned-clock-rates =3D <100000000>;
>
> If always targeting an e.MMC, capped at the High Speed DDR mode, one migh=
t consider
> a multiple of 52 MHz here.

Hi Aubin,
The issue is that LAN969x cannot derive a 52MHz nor 104Mhz clock.
Requsting 104MHz would be around 111MHz, while with 100MHz the end
clock is 50MHz.

Regards,
Robert
>
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               sdmmc1: mmc@e0838000 {
> > +                       compatible =3D "microchip,lan9691-sdhci",
> > +                                    "microchip,sam9x60-sdhci";
> > +                       reg =3D <0xe0838000 0x00000300>;
> > +                       interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&clks GCK_ID_SDMMC1>, <&clks GCK_ID=
_SDMMC1>;
> > +                       clock-names =3D "hclock", "multclk";
> > +                       assigned-clocks =3D <&clks GCK_ID_SDMMC1>;
> > +                       assigned-clock-rates =3D <45000000>;
> > +                       status =3D "disabled";
> > +               };
> > +
> >                  qspi2: spi@e0834000 {
> >                          compatible =3D "microchip,lan9691-qspi";
> >                          reg =3D <0xe0834000 0x00000100>,
> > --
> > 2.55.0
> >
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

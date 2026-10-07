Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D293440961C;
	Wed,  7 Oct 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355942; cv=none; b=WuHwK0mW7LwweMhXOXUbCtN7L5V/465eKNpbOReEPJFEWeIVwJ0ORzSprzcLZ8D4X4P6wv/3esZ3F9dPDWP4OxMELpox1L+IkcDiDcr8d3+qaT4cSguntd6EAUdK0vu/BIGVZR/vwlUoQgp6WJQAArJ2/HuVKi7lu8oZnj8Evgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355942; c=relaxed/simple;
	bh=OexaRCcgt6XYkDM8a+OmC5h/6OPxo9ybl1gjEFZyPZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XgqEZHsrcP9n5fU5Lift/AQ4yPPd7NIU+3wa2GeBtnVBNPqBl3sUKRoswc6cLjBbdnyi+BzSzjsCSv32HrzgW3KexbiRDSTZx+ixIHwqtvLho8ICgYDNzY/USibN4mfvibhESEpybPl+N7rWJrFGDxjRAqJ0//xRFurv2t2Uqq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=q/j60Yb1; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="q/j60Yb1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OexaRCcgt6XYkDM8a+OmC5h/6OPxo9ybl1gjEFZyPZY=; b=q/j60Yb13/I9m6w0+nIy5uqC3r
	AOYolLvel59Eq9GOidlv2e+1esaRmd1CyZRrut7gT2ANNsVk+AP+6Ui9tdLH6kLIpEPrQO4Oe3uhX
	Sx0wdJQrI2HS8Lk9oZFCM/WICPTAOTOvenLSlTzEeBgZdR9mYxflW2t53TqwejP+Q5DYsavgmIEz0
	k26N7WP4QsnKjHKOcg+Hib/LNWCLoIPqLTTz9lMM4w90fxDt7PFf7LVS02bkZZv3Bwoo7k4wDIhAG
	ohfMTcxE97n8Ijg1cLxTg/9qGS0f1ce9Bf/SS8vXgZFE1tZbWYq1/3/fvYLPZK6oQDOqFMeofJSyM
	1qzK2n4A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELVc-0008ir-0L;
	Wed, 07 Oct 2026 08:52:12 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELVc-000II6-0d;
	Wed, 07 Oct 2026 08:52:11 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for SPI-NOR
 flash
Date: Wed, 07 Oct 2026 08:52:09 +0200
Message-ID: <8205013.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <CAOMZO5AJiSoFb5Fy-LR4=MDqQqhJPvtzLT+-18es8j_HvYqt6w@mail.gmail.com>
References:
 <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
 <5021357.mvXUDI8C0e@steina-w>
 <CAOMZO5AJiSoFb5Fy-LR4=MDqQqhJPvtzLT+-18es8j_HvYqt6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)

Hi Fabio,

Am Dienstag, 6. Oktober 2026, 15:59:22 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Fabio Estevam:
> Hi Alexander,
>=20
> On Tue, Oct 6, 2026 at 10:50=E2=80=AFAM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Am Dienstag, 6. Oktober 2026, 15:46:50 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Frank Li:
> > > On Tue, Oct 06, 2026 at 03:25:10PM +0200, Alexander Stein wrote:
> > > > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > > >
> > > > The FlexSPI controller uses quad SPI with internal clock recovery.
> > > > The clock is therefore restricted to 66.666666 MHz according to
> > > > data sheet.
> > >
> > > Which datasheet? I suppose NOR flash datasheet, can you provide link
> > > here.
> >
> > The i.MX8M Nano data sheet Rev 5 09/2022 section 3.9.1.1 "SDR mode with
> > FlexSPIn_MCR0[RXCLKSRC] =3D 0x0, 0x1, 0x2" Table 55. "FlexSPI input tim=
ing
> > in SDR mode where FlexSPIn_MCR0[RXCLKSRC] =3D 0x0" lists 66 Mhz maximum=
 for
> > "Frequency of operation".
>=20
> From the commit log, I also got the impression you were referring to
> the SPI NOR datasheet.
>=20
> Please clarify that in v2.
>=20
> Also, shouldn't all patches in the series contain a Fixes: tag?

Thanks for the feedback, I'll adjust the commit message in v2 and
add a Fixes: tag as well.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



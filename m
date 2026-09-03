Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C905E449EA0;
	Thu,  3 Sep 2026 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438289; cv=none; b=gjZ9NibbAVZSTT5Av45lkSZmEPXOUjFLEEUhBrwqDrrCOAFbNlj8BxZxVJThg3vCVholQz4BWypQpQkjzPXOAvPGiPQRBnrjbDVlhHAULDo0vy+F3eUNEffO3etFCPweLW0SVOOipmZd5Fom/9GOa3Os1RAq+yHScgfhwbMQTFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438289; c=relaxed/simple;
	bh=Ms+eteCGKpQtgXKqZE6NQzNZKTJtk4Lu4dO7yGhlvAs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=KbliWNcoSWvTUfz8ZnqAS9FseA8DEmLigph6jIyMoZMcN2imvFwAWxA+8L+2x1iymjA/4Q2VA4fnRzsM5DZud5HsZ2Me0clkb4jA7pQ0bsgLOpkffUXKCVsUyTk2ak0kW0jmmDGaF0v8/k1EJLZ3eorWOAYvVow7nmpS0IkD1HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tIZjujDE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tIZjujDE"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 040592335;
	Thu,  3 Sep 2026 14:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788438194;
	bh=Ms+eteCGKpQtgXKqZE6NQzNZKTJtk4Lu4dO7yGhlvAs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tIZjujDELOifpjlFa1/35X9gehBmCui0PnJq/H0kyshj7YDos2KOsbOvEKohS8LhI
	 QNGZloEwuJejSPHZSFYFPIFympDBCpAcfza8OF2iEmzteufHSbCttyTKbd063HAxXK
	 ufRRPq7pw+uH9nmkLx8RBkxoU1PdizqJKeBT9I8o=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntBpR6vjP4Yd8ErVMuLjLshWb+rpfV=dzRNkhLN=K59rnw@mail.gmail.com>
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com> <20260805-media-starvis2-v1-4-91e8e4eae44f@raspberrypi.com> <178840935437.11722.581815298725172345@freya> <CAPY8ntBpR6vjP4Yd8ErVMuLjLshWb+rpfV=dzRNkhLN=K59rnw@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] media: i2c: imx678: Add imx675 support to the driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 03 Sep 2026 17:54:40 +0530
Message-ID: <178843828099.11722.17500645747204456551@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Dave Stevenson (2026-09-03 17:24:19)
[...]
> > > +const struct imx678_variant imx675_variant_def =3D {
> > > +       .name =3D "imx675",
> > > +       .id_reg =3D IMX678_REG_MODULE_ID,
> > > +       .id_value =3D 0x296,
> > > +       .native_area =3D {
> > > +               .top =3D 0,
> > > +               .left =3D 0,
> > > +               .width =3D 2609,
> > > +               .height =3D 1984,
> > > +       },
> > > +       .active_area =3D {
> > > +               .top =3D 0,
> > > +               .left =3D 0,
> > > +               .width =3D 2608,
> > > +               .height =3D 1984,
> > > +       },
> > > +       .pixel_rate =3D 594000000,
> > > +       .pix_per_clk =3D 8,
> > > +       .common_regs =3D imx675_common_regs,
> > > +       .num_common_regs =3D ARRAY_SIZE(imx675_common_regs),
> > > +       .vmax_default =3D 1984 + 40,
> >
> > Same doubt for the VBLANK =3D 40 here as IMX662, although I don't have a
> > datasheet for IMX675.
>=20
> Datasheet lists
>=20
> VTTL (1farame line length or VMAX) =E2=89=A5 PIX_VWIDTH + 70
> Set VTTL to 940 or more.
> VTTL =E2=89=A5 940
>=20
> But verified as working at +40. (I have a module from Soho Enterprises).
> We can go for the more conservative values if preferred. From memory,
> on IMX662 it'll lose about 10% (66fps at 40, ~60fps at 70).
>=20

Ah if it's tested by you I'm fine with going with 40 for now.

One nitpick for your next version, maybe define VBLANK_MIN (40) and use that
along with active_area.height?

Thanks,
Jai

Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0AE2C3255;
	Sat, 19 Sep 2026 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817086; cv=none; b=AqCMOdIn3y7Mi9uyB++4lXfNP8pWlItTPtQx210NokvLx2TeJ6Anp2/pjWKJS6DqFkK5vSQosctWX7cEHwIIkLZMF6gXZrgWhYRMXRyv2r/FgV7fRfx3rHaZTUgW/ERAFDsjk7z8t6oz0v5Nb8LzKZlTurYIuR6LHF96Sv5c/3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817086; c=relaxed/simple;
	bh=Z8wkPmQUbHgQBu1B/ph7jlE+wdo/SOJNVn6V4NgjmD0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Cc:Date:Message-ID; b=DwJo8ZaA7uvitTqQE6UzeTmSWeA4tmV6ydsoCKZqwJ4pbKrJ8bpD1T0PxbvRI6hetY/aibEuLEIAFzrG9mbfXsWKnOkYx9pq/8dM1B5yZOKK15wT0zqemCLB2dumYy/i/LRFpQj4h8IR/0+fHENn1NFmOE0rx8nZ5U9VW4Gcj8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E54UYq9R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E54UYq9R"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9A561CF5;
	Sat, 19 Sep 2026 13:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789816977;
	bh=Z8wkPmQUbHgQBu1B/ph7jlE+wdo/SOJNVn6V4NgjmD0=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=E54UYq9RUqmFHOocoYsZKlZvDH7Nbztbu9QniuXOze6Pmwl2qh/MSaUbG+hg9/O6C
	 p+Amtq/VmdsBU/NaCNpo2P7WPLWQPqbBXoEy2sXATTTPe8CSggBRmLqFE7XV0Ov9/d
	 YgcIvT2PQZrrwwjZHyjz/rFHxkBAp2oDAxg3kCvM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260918192447.GB1465432-robh@kernel.org>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com> <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com> <aqLaLmz7n31P6igy@SMW015318> <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb> <aqLif2zrrsbYd5sM@SMW015318> <aqLk5UAv-j39Jxd3@francesco-nb> <20260918192447.GB1465432-robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>, Rob Herring <robh@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
Cc: Frank Li <Frank.li@oss.nxp.com>, Ernest Van Hoecke <ernestvanhoecke@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
Date: Sat, 19 Sep 2026 12:24:38 +0100
Message-ID: <178981707848.1761404.17065871878122418287@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi all,

+Dave @ Rpi

Quoting Rob Herring (2026-09-18 20:24:47)
> On Thu, Sep 10, 2026 at 07:12:05PM +0200, Francesco Dolcini wrote:
> > On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> > > On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> > > > Hi Frank,
> > > >
> > > > Thanks for reviewing this so quickly.
> > > >
> > > > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > >
> > > > > > Toradex boards route the sideband signals of their 24-pin camera
> > > > > > connectors to different GPIO controllers. Camera overlays which=
 name
> > > > > > those controllers directly must therefore be duplicated for eac=
h host
> > > > > > board.
> > > > > >
> > > > > > Describe reset, power-down, detection and power-control as
> > > > > > connector-local GPIO functions. This lets an accessory overlay =
remain
> > > > > > independent of the host wiring. MIPI CSI-2, I2C, clocks and sup=
plies
> > > > > > remain described separately because the GPIO nexus does not abs=
tract
> > > > > > them.
> > > > > >
> > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > ---
> > > > > >  .../connector/toradex,camera-connector.yaml        | 86 ++++++=
++++++++++++++++
> > > > > >  1 file changed, 86 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/connector/torade=
x,camera-connector.yaml b/Documentation/devicetree/bindings/connector/torad=
ex,camera-connector.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..06e6836e1aa6
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/connector/toradex,camer=
a-connector.yaml
> > > > > > @@ -0,0 +1,86 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/connector/toradex,camera-co=
nnector.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > > > > > +
> > > > > > +title: Toradex camera connector GPIO nexus
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > > > > > +
> > > > > > +description: |
> > > > > > +  Toradex boards provide 24-pin camera connectors carrying MIP=
I CSI-2, I2C,
> > > > > > +  clock, power, and sideband GPIO signals. This binding descri=
bes the sideband
> > > > > > +  signals as a GPIO nexus. The other connector resources remai=
n described by
> > > > > > +  the surrounding board device tree.
> > > > > > +
> > > > > > +  The nexus exposes connector-local GPIO function numbers to c=
amera overlays
> > > > > > +  and maps the functions wired by a carrier board to their GPI=
O controllers.
> > > > > > +  GPIO specifiers contain a function number followed by standa=
rd GPIO flags.
> > > > > > +  A board may omit functions which it does not wire.
> > > > > > +
> > > > > > +  The function numbers are:
> > > > > > +    - 0: Camera reset, connector pin 11
> > > > > > +    - 1: Camera power-down, connector pin 22
> > > > > > +    - 2: Camera identification, connector pin 23
> > > > > > +    - 3: Camera power control, connector pin 24
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: toradex,camera-connector
> > > > >
> > > > > Name is too generally, suggest use board name, we got similar com=
ments at
> > > > >
> > > > > https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@=
oss.nxp.com/
> > > >
> > > > I saw that and it made me reconsider this name.
> > > >
> > > > However, I believe that in our case it is specific enough. It is re=
ally
> > > > the same on all our carrier boards, and Toradex specific. It's also=
 only
> > > > for cameras, which is more defined than just "io". Curious to see if
> > > > others agree or if we should come up with a name for this.
> > >=20
> > > If some days later, you update hardware connector to 30pin from 24pin=
s.
> >=20
> > That connector is there since years, not days.
> >=20
> > We have multiple cameras, designed to mate with it.
> >=20
> > If tomorrow we will define a new camera connector (that is absolutely
> > possible), the new connector will get its name, maybe
> > toradex,camera-connector-v2, or toradex,camera-connector-22pin or
> > whatever that connector would be named, not just in the DT, but also as
> > a product and on the actual HW.
>=20

Diving in because, cameras :D


> I for one hate 'v2' naming.
>=20

Me too. I wouldn't ever call it v2, but a future
toradex,camera-connector-24pin might be appropriate.

Note that I specifically said 24 as an example because there is already
a 22 pin Raspberry Pi connector.

If Toradex were to produce boards with a 22 pin connector, I would
anticipate it to be the same pinout as the Raspberry Pi connector.

Raspberry Pi camera connectors have already somewhat become a defacto
standard (albeit for both positives and negatives there).

So I would imagine if a 22 pin layout were ever made it would be
compatible with RPi 22. And if Toradex ever make a 22 pin connector
which is not RPi compatible ... well I might scream into the void ;-)
but then it would have a toradex prefix I guess!


Equally we have other vendors who have 30 pin connectors (There are
quite a few, so I have myself a research project to go find out how
{in,}compatible they all are here ...)

So, I would imagine if we're giong to name connectors we should set out
an expectation to start with

  toradex,camera-connector-30pin
  raspberrypi,camera-connector-15pin
  raspberrypi,camera-connector-22pin

And if Toradex were to make a *different* 22 pin connector then it would
be:

  toradex,camera-connector-22pin,

But if it's RPi layout, then it would be defined as such.


All that to say - I think Toradex certainly warrant a specific

  toradex,camera-connector

But I think specifiying the pin count already could be useful (but not
essential).

It's a bit like Raspberry Pi's original 15 pin connector. If we wound
the clock back 15 years and tried this with RPi we'd have:

  raspberrypi,camera-connector
  raspberrypi,camera-connector-22pin

I mean that's fine too - but if we're specifying the pin in one we may
as well do it in all...


> I agree the name seems a bit generic, but if you really can't come up=20
> with something better, then fine. The next connector name just has to be =

> something different.

Indeed.

I'm very happy that we have actual progress on how we might handle
camera connectors though!

I'm going to have to try to do the same proposal for RPi connectors
aren't I ;-)

If I post patches, I'll use the full form:

=20
  raspberrypi,camera-connector-15pin
  raspberrypi,camera-connector-22pin


I'm curious if anyone at RPi has any opinion, given it's 'their' standard.

Dave? any thoughts here ?

--
Kieran


>=20
> Rob

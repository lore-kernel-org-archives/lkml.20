Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E442586E;
	Thu, 24 Sep 2026 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233847; cv=none; b=T8iyhDiGDO4unaK8blZpa2YSIYywTL8aqvddOXs81IMAEQj9zPZJ79IoOk76X6QN5uRqvftjZUEwtkidnyQUuJVD+f0bwys1C4lm1qsVG2OxHBadocfr8r5E72WSwEA0XDoXIwh8VUwPZr7n0hV6I6f/7yelG/SV5lEkjKoVzZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233847; c=relaxed/simple;
	bh=UyjFFOIrgFI8xVAwiUJ08110T6a6WRSRh6ivMlZFL5Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZmKA4h2Cy1vyt/uMlpHhH4Dl3F+bxibeBR1+QZdrDTFmvj3WTMYgZs5R7FFT0hJHEfRlsHzhWBlcn/Fi3+mfmoIDqGuZX+qHaZfMYz5rasVkqv+K9dc9NO98Db0tfnVmgwYs2RsY5vPPV2iJy0mvBdRyV9CP3/UNOYv0Y7Y8zRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZiruNqzU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZiruNqzU"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E78EDC48;
	Thu, 24 Sep 2026 09:08:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790233723;
	bh=UyjFFOIrgFI8xVAwiUJ08110T6a6WRSRh6ivMlZFL5Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZiruNqzUAKqrNhYJlP9VSamq0SOPmZCHtnxQzd+tBuYIzD4w7/MElK2tjJAorE+fy
	 CPz+FYTPWKWR5t3mYh0psH3rsI9iwls3eV7KQvOrQP2Ni7LWTvnz46Sl5wWhcK3IiE
	 Rn17qhL62fvtzGgPG/bwGpu9UblJtP5/NWKjwq2I=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <arDZoulyKIzVj-73@francesco-nb>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com> <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com> <aqLaLmz7n31P6igy@SMW015318> <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb> <aqLif2zrrsbYd5sM@SMW015318> <aqLk5UAv-j39Jxd3@francesco-nb> <20260918192447.GB1465432-robh@kernel.org> <178981707848.1761404.17065871878122418287@ping.linuxembedded.co.uk> <arDZoulyKIzVj-73@francesco-nb>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Frank Li <Frank.li@oss.nxp.com>, Ernest Van Hoecke <ernestvanhoecke@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Date: Thu, 24 Sep 2026 08:10:27 +0100
Message-ID: <179023382707.1723501.12070631258057963152@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Francesco,

Quoting Francesco Dolcini (2026-09-21 08:15:46)
> Hello Kieran,
>=20
> On Sat, Sep 19, 2026 at 12:24:38PM +0100, Kieran Bingham wrote:
> > Quoting Rob Herring (2026-09-18 20:24:47)
> > > On Thu, Sep 10, 2026 at 07:12:05PM +0200, Francesco Dolcini wrote:
> > > > On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> > > > > On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> > > > > > Hi Frank,
> > > > > >
> > > > > > Thanks for reviewing this so quickly.
> > > > > >
> > > > > > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > > > > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke w=
rote:
> > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > >
> > > > > > > > Toradex boards route the sideband signals of their 24-pin c=
amera
> > > > > > > > connectors to different GPIO controllers. Camera overlays w=
hich name
> > > > > > > > those controllers directly must therefore be duplicated for=
 each host
> > > > > > > > board.
> > > > > > > >
> > > > > > > > Describe reset, power-down, detection and power-control as
> > > > > > > > connector-local GPIO functions. This lets an accessory over=
lay remain
> > > > > > > > independent of the host wiring. MIPI CSI-2, I2C, clocks and=
 supplies
> > > > > > > > remain described separately because the GPIO nexus does not=
 abstract
> > > > > > > > them.

Will it be possible to extend this to add the mapping for MIPI data and
clock lanes and regulator supplies?

I.e. does this do anything that would push us down a hole that stops us
mapping those signals?

What do we need to do next to be able to map I2C/CSI/Regulators through
a 'nexus' ?


> > > > > > > >
> > > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.=
com>
> > > > > > > > ---
> > > > > > > >  .../connector/toradex,camera-connector.yaml        | 86 ++=
++++++++++++++++++++
> > > > > > > >  1 file changed, 86 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/connector/to=
radex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/t=
oradex,camera-connector.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..06e6836e1aa6
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/connector/toradex,c=
amera-connector.yaml
> > > > > > > > @@ -0,0 +1,86 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/connector/toradex,camer=
a-connector.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > > > > > > > +
> > > > > > > > +title: Toradex camera connector GPIO nexus
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > > > > > > > +
> > > > > > > > +description: |
> > > > > > > > +  Toradex boards provide 24-pin camera connectors carrying=
 MIPI CSI-2, I2C,
> > > > > > > > +  clock, power, and sideband GPIO signals. This binding de=
scribes the sideband
> > > > > > > > +  signals as a GPIO nexus. The other connector resources r=
emain described by
> > > > > > > > +  the surrounding board device tree.
> > > > > > > > +
> > > > > > > > +  The nexus exposes connector-local GPIO function numbers =
to camera overlays
> > > > > > > > +  and maps the functions wired by a carrier board to their=
 GPIO controllers.
> > > > > > > > +  GPIO specifiers contain a function number followed by st=
andard GPIO flags.
> > > > > > > > +  A board may omit functions which it does not wire.
> > > > > > > > +
> > > > > > > > +  The function numbers are:
> > > > > > > > +    - 0: Camera reset, connector pin 11
> > > > > > > > +    - 1: Camera power-down, connector pin 22
> > > > > > > > +    - 2: Camera identification, connector pin 23
> > > > > > > > +    - 3: Camera power control, connector pin 24
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: toradex,camera-connector
> > > > > > >
> > > > > > > Name is too generally, suggest use board name, we got similar=
 comments at
> > > > > > >
> > > > > > > https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.=
liu@oss.nxp.com/
> > > > > >
> > > > > > I saw that and it made me reconsider this name.
> > > > > >
> > > > > > However, I believe that in our case it is specific enough. It i=
s really
> > > > > > the same on all our carrier boards, and Toradex specific. It's =
also only
> > > > > > for cameras, which is more defined than just "io". Curious to s=
ee if
> > > > > > others agree or if we should come up with a name for this.
> > > > >=20
> > > > > If some days later, you update hardware connector to 30pin from 2=
4pins.
> > > >=20
> > > > That connector is there since years, not days.
> > > >=20
> > > > We have multiple cameras, designed to mate with it.
> > > >=20
> > > > If tomorrow we will define a new camera connector (that is absolute=
ly
> > > > possible), the new connector will get its name, maybe
> > > > toradex,camera-connector-v2, or toradex,camera-connector-22pin or
> > > > whatever that connector would be named, not just in the DT, but als=
o as
> > > > a product and on the actual HW.
> > >=20
> >=20
> > Diving in because, cameras :D
> >=20
> >=20
> > > I for one hate 'v2' naming.
> > >=20
> >=20
> > Me too. I wouldn't ever call it v2, but a future
> > toradex,camera-connector-24pin might be appropriate.
> >=20
> > Note that I specifically said 24 as an example because there is already
> > a 22 pin Raspberry Pi connector.
> >=20
> > If Toradex were to produce boards with a 22 pin connector, I would
> > anticipate it to be the same pinout as the Raspberry Pi connector.
> >=20
> > Raspberry Pi camera connectors have already somewhat become a defacto
> > standard (albeit for both positives and negatives there).
> >=20
> > So I would imagine if a 22 pin layout were ever made it would be
> > compatible with RPi 22. And if Toradex ever make a 22 pin connector
> > which is not RPi compatible ... well I might scream into the void ;-)
> > but then it would have a toradex prefix I guess!
> >=20
> >=20
> > Equally we have other vendors who have 30 pin connectors (There are
> > quite a few, so I have myself a research project to go find out how
> > {in,}compatible they all are here ...)
> >=20
> > So, I would imagine if we're giong to name connectors we should set out
> > an expectation to start with
> >=20
> >   toradex,camera-connector-30pin
> >   raspberrypi,camera-connector-15pin
> >   raspberrypi,camera-connector-22pin
> >=20
> > And if Toradex were to make a *different* 22 pin connector then it would
> > be:
> >=20
> >   toradex,camera-connector-22pin,
> >=20
> > But if it's RPi layout, then it would be defined as such.
> >=20
> >=20
> > All that to say - I think Toradex certainly warrant a specific
> >=20
> >   toradex,camera-connector
> >=20
> > But I think specifiying the pin count already could be useful (but not
> > essential).
>=20
> As Toradex, this is how this connector is called, and there is no plan
> to design a new one. If you want a full descriptive name you can call it
> "Toradex MIPI CSI-2 Camera Connector".

I don't think a full description is the issue here, as it's related
to the compatible string which can't have spaces.

In case it wasn't clear - I think toradex,camera-connector is adequate!

It's just that I am 95% certain there will be a future update required
when another connector appears, and if that happens I think it should be
called something more specific than '-v2'. So the bike-shed becomes -
how does that impact to the current name.

I say this explicitly because I wouldn't call the 15 pin RPi connector
'v1' and the 22 pin 'v2'.

If a new connector is designed, then I expect it will serve new
requirements.

> I see no evidence that we are going to have a connector with a different
> amount of pins anytime, if we would redesign the connector today it will

I can imagine some connector updates might happen if(ahem, when?) MIPI
C-PHY gains any popularity on industrial / SBCs / SoMs. Perhaps even
sooner now that you have Qualcomm SoMs on the Aquila IQ-8275 SoMs.

There's always a 'v2' somewhere ;-)


> likely have the same pin count but 1v8 logic instead of 3v3, and your
> proposal would not help.

Ohhh camera connectors really are cursed aren't they :=3D)

Voltage changes indeed might be an interesting adaption, though we don't
specify them now anyway, and I think that's more of a property of the
configuration rather than the 'routing' ? It will be interesting to see
what happens there though.

We only have 'purposes' to the pins at the moment I think?

Its specifying the pin routing I'm concerned about at the moment, which
is I guess why a 'pin count' is an easy refernce to that ?

=20
> A little bit more data on what we have today, the connector is a 24-pin
> 0.5mm pitch FFC/FPC, it goes back to 2017 and it never changed after

Ohhh sorry, I got it wrong, I misread the earlier discussion in this
thread and thought Toradex was 30 pin ... I got the order the wrong way
around!

There are so many variations of CSI2 camera connector from different
vendors, and I'm trying to look at the big picture of how we can
identify and map them.

Ultimately, pin pitch is irrelevant to the DT. I wonder if voltage is
the same, as that will be dealt with by the hardware. We definitely need
to model "These signals need to go to that controller".


> that. It is currently implemented in Apalis, Verdin, Aquila, SMARC and
> OSM Toradex Carrier boards.


Absolutely, and that re-usable connector is a great thing, in an area
with no standardisation, and why I really want to see overlays
abstracted to be able to convey that usefully.

--
Kieran

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304698;
	b=OlSB1p6yfq+EHuTL8HU+gyH0y+Ay3nlWyC5HpPAfLtB/fXBeAaCR8mpTRV77cdjsosMX
	 K4hbEBW0zW+thc8MB4J58SUAR97Kaq7p5KWFhZrxX83mnWraVnnFLVA0KoFMb5JrkPsxa
	 vx/pk0JulhiqqcNmx6dYk5qYtaU/4kbFUcU+Bb9nh5XAah/PHwS4APd0E8oK7W8PIGSt6
	 4Od3jKbzi2GB0OL7jHgOITRdaelbHQ6Jwpq+ujyHzeEYIIqypLopFqHm4ISUylKbvMv63
	 QzthvbBv2LtvGIIgns2ofyPUB7PB6AFTUANwR9q2R1olfrB3UfUSo9HX6MgcuK0RGGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304698;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Last-TLS-Session-Version;
	bh=tmBt6sYT24vHwO8DFI1K9muYtbe1xaw+bJsqvvwHTUY=;
	b=mY/zybo884sKsKZCzbJhmJAisMBPbjEEKHvh1ZGBumvHjjehvM8lNLlqsC9t98t1hrVv
	 GHqbMoCjLWdHs0ghBAsz4x97y64pLz5bQc4xxjDO8qTeJDke6+rsEof3kKvhGyCtJihVy
	 oWG53HUwG7xUlJME5TO8FIB6PVys/mSHgo5LclaGsGyeCDxcKrPMb1f+5Fo9jZQ5Kd99D
	 yRtFUkH1Bs0n9Fik+TZyLcsVzC2GsvULUR4ZPnoKrpAk/WlNAfy9285HNLxt3fHWka1C5
	 0wI5QlDu7kiRsFYbItwOrp8SB6ed2CQ2a/etGoMLpv0H0UaZAeFDZa5xat0yiUhf5zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sNftPQ7J;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEAB606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CEAB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sNftPQ7J
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A2F754E4153D;
	Tue, 10 Nov 2026 09:58:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 558FC60012;
	Tue, 10 Nov 2026 09:58:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D0FC103293C1;
	Tue, 10 Nov 2026 10:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794304692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tmBt6sYT24vHwO8DFI1K9muYtbe1xaw+bJsqvvwHTUY=;
	b=sNftPQ7JxCffzpCoZfWlFJYQG2t7/c1jdbZQL/FST4LFlNnOLf5OvhKFw+fhxhimznlB2B
	Nul0MDLarhQUajmjJA7xLuxKXdytey2bPyaa5x6pCH5SUIbYxy+j1ngE+XDdiCFqrsPnyU
	9HDNu8TNwmrvNpWlV6jziSCE1o6gEN5LdpBduCfy5lVKsKOfZLqpB6mYaoebSPCUc8Ek3/
	k/B6XT4SCS2SpB0/lafJ2SiT7L/43Ab8oalWA97WagosFVmwLmYJcdCqEJyo6d3ImTx1UW
	RAL8Q3rGL8TKQiiyanL2c5rYQcBNXwhh/sHOmUIrcadCz+QJUVFqTfsZVeiW/A==
Message-ID: <a3b9edcfba080b0e92cc0b4e76ad8c9c83256fea.camel@bootlin.com>
Subject: Re: [PATCH 5/5] spi: cadence-xspi: Add workaround for old Marvell
 firmwares
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Bharat Bhushan <bbhushan2@marvell.com>,
 Sunil Kovvuri Goutham <sgoutham@marvell.com>, Tanmay Jagdale	
 <tanmay@marvell.com>
Date: Tue, 10 Nov 2026 10:58:06 +0100
In-Reply-To: <avKmo_zDj3DoUrJo@xhacker>
References: <20261104100643.162694-1-paul.cercueil@bootlin.com>
	 <20261104100643.162694-6-paul.cercueil@bootlin.com>
	 <au8lyXiMUSvcdPWx@xhacker>
	 <0260a1943c59cdda431bb216438d49c3955d93b0.camel@bootlin.com>
	 <avKmo_zDj3DoUrJo@xhacker>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Jisheng,

Le mardi 10 novembre 2026 =C3=A0 13:07 +0800, Jisheng Zhang a =C3=A9crit=C2=
=A0:
> On Mon, Nov 09, 2026 at 05:34:55PM +0100, Paul Cercueil wrote:
> > Hi Mark,
> >=20
> > Le samedi 07 novembre 2026 =C3=A0 21:21 +0800, Jisheng Zhang a =C3=A9cr=
it=C2=A0:
> > > On Wed, Nov 04, 2026 at 11:06:43AM +0100, Paul Cercueil wrote:
> > > > From: Tanmay Jagdale <tanmay@marvell.com>
> > > >=20
> > > > Older firmwares from Marvell used the cdns,xspi-nor compatible stri=
ng
> > > > for the Marvell-specific xSPI IP, which is incompatible.
> > > >=20
> > > > Add a workaround to support this by assuming that if the "xfer" res=
ource
> > > > is found, it means that a Marvell IP is used.
> > > > S>=20
> > > > Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
> > > > Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
> > > > Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> > > > ---
> > > > =C2=A0drivers/spi/spi-cadence-xspi.c | 18 ++++++++++++++----
> > > > =C2=A01 file changed, 14 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-caden=
ce-
> > > > xspi.c
> > > > index 48a109f3fcdb..d326589a6ca3 100644
> > > > --- a/drivers/spi/spi-cadence-xspi.c
> > > > +++ b/drivers/spi/spi-cadence-xspi.c
> > > > @@ -1301,11 +1301,21 @@ static int cdns_xspi_probe(struct
> > > > platform_device
> > > > *pdev)
> > > > =C2=A0	}
> > > > =C2=A0
> > > > =C2=A0#ifdef CONFIG_64BIT
> > > > -	if (cdns_xspi->driver_data->mrvl_hw_overlay) {
> > > > -		res =3D platform_get_resource_byname(pdev,
> > > > IORESOURCE_MEM,
> > > > "xfer");
> > > > -		if (!res)
> > > > -			res =3D platform_get_resource(pdev,
> > > > IORESOURCE_MEM,
> > > > 3);
> > > > +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > "xfer");
> > > > +	if (!res)
> > > > +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 3);
> > >=20
> > > This moves the mrvl specific code to all users, so I believe this
> > > needs dt-binding update.
> >=20
> > I actually disagree here. The binding says that "xfer" is only provided=
 with
>=20
> It's not only "xfer". The code falls back to 4th MEM resoure when "xfer"
> failed.
>=20
> > Marvell-specific compatible strings, and that's correct. The fact that =
some
> > firmwares don't respect this spec is not a problem of the spec itself.
> >=20
> > > From another side, this assumes other users doesn't have 4th resource
> > > but what about if they have? they will get "Marvell-specific xfer
> > > resource passed, but ..." warning below, this confuse the users.
> > > I don't think this workaround can be added to all users.
> >=20
> > Yes, I thought about that and I can understand that you don't like it..=
.
> >=20
> > I originally thought that it was fine because the dt-binding states tha=
t the
> > 4th
> > resource is only for Marvell compatibles; but the binding can change, s=
o
> > it's a
> > bit wobbly.
> >=20
> > I will come up with a better mechanism in the v2.
> >=20
> > > Lastly, does the "firmware" mean dtb? But per my grep, I didn't
> > > find any mrvl dts(i) uses "cdns,xspi-nor" compatible string, so
> > > this means the dtb is outside upstream, then can the firmware
> > > be fixed instead?
> >=20
> > It is dtb and also ACPI. The firmware can and will be fixed, the idea h=
ere
> > is to
> > make sure that the driver still works on older firmwares that haven't b=
een
> > updated yet, because they are out there.
>=20
> If firmware is dtb, the dtb is out of tree, why mainline driver needs to
> workaroud its bug?
> If firmwre is acpi, the commit msg says "used the cdns,xspi-nor
> compatible string", I'm not sure how does ACPI use dt compatbile string?=
=20

It's both dtb and ACPI. The firmware's ACPI table does use the PRP0001 Devi=
ce
Tree namespace HID with the "cdns,xspi-nor" string.

I don't understand your point about the dtb being out-of-tree. It does not
change anything.

Cheers,
-Paul

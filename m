Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507AE521202
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569057; cv=none; b=NwQgtjF5N4n8LJzyHDcTJ/YLzj1omiZAFtHDew6KnJ5SqFeVua6MkN8E4oFbcqSUgqeI8c26JX5GVdfqDpJxurAGge1FfDbwQJUPZbV0A8mLuFfH2TzIsC7qCOJ9fKCaETyCfKaLlt0vqwDsA4LOc4z9BU+C4X3CV9DzfuSenkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569057; c=relaxed/simple;
	bh=IAkNWSB54cPTRZlp0lr/9fg4h/scqOyu3N98Wh9R+D4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fQDsgk8Y+ZTj+GF8UhAWCkGVEtvAWxZgkSSt5Z8ptygXc83zkjvlfgBsU8jQKn1sSE25P0aYj1la4p8TKS0cuprnON6teJs7v0Cd5cFPuc6IkDuHFEAqfT5/07woqGtSaCKEwzqzSqpPQ7gxw0CQ2WVcDX7L4iNyw+7QX7rZ3xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PAFHXDga; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PAFHXDga"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 450961A08AB;
	Wed, 16 Sep 2026 14:30:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1645860337;
	Wed, 16 Sep 2026 14:30:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C273711C7B024;
	Wed, 16 Sep 2026 16:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789569045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ifWQ8YaMc5CQm1ni9DW+Z7Yqh55h/cFdZBqgsTVphkY=;
	b=PAFHXDgagaMbICkI8pF/F5Nz5W1gjfLrs/YkppCqVP1pMYNSPxgzDNoh7q+DYhGicdwrYf
	PT5MKU1C05LYJEvG7c2FAjeCDXZt49uyTEXYiGNsgQEZUIFo9Gn3dNx1y9W9wkLfU/7aPb
	vzohVysiTuf4GVtby1VsmN8oKU9d8Q7ZUe89SyFGWHWqfmxt14PRsnXT7ywBVYdGwH5OlH
	jqCvJ05G71TC8RvUYP+fNsTf78dwavvp6emdYAP1L54EDJ9LaoeEcGMIrOf0hq9e7O2q6s
	lH0l7yhmzYU7wIfR98nbme6zK7TkBj3xK17AW9YJl4T1VYqxyZnDThae3cpVdw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 16:30:37 +0200
Message-Id: <DLGTA297W2SP.36MAJCYAC9O2X@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Cc: "Marek Vasut" <marex@denx.de>, "Stefan Agner" <stefan@agner.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Francesco
 Dolcini" <francesco.dolcini@toradex.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-3-francesco@dolcini.it>
 <178954813309.214898.6895255097019153080.b4-review@b4>
 <20260916091543.GA277833@francesco-nb>
 <DLGP7GKZJBOP.350QK94UOGRYV@bootlin.com>
 <20260916114350.GB284106@francesco-nb>
In-Reply-To: <20260916114350.GB284106@francesco-nb>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Sep 16, 2026 at 1:43 PM CEST, Francesco Dolcini wrote:
> On Wed, Sep 16, 2026 at 01:19:08PM +0200, Luca Ceresoli wrote:
>> On Wed Sep 16, 2026 at 11:15 AM CEST, Francesco Dolcini wrote:
>> > Hello Luca,
>> >
>> > On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
>> >> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format=
. The
>> >> > format reported by the downstream panel or bridge describes the dis=
play
>> >> > input, but it does not describe how the LCDIF data pins are physica=
lly
>> >> > wired on the board.
>> >> >
>> >> > These can differ. For example, a 16-bit LCDIF bus can be connected =
to a
>> >> > 24-bit display by wiring the available color bits to the correspond=
ing
>> >> > display inputs. In that case, using the display's 24-bit format to
>> >> > configure LCDIF selects the wrong data-bus mode and changes the ass=
ignment
>> >> > of color bits on the LCD_DATA pins.
>> >> >
>> >> > Read the optional bus-width endpoint property from the LCDIF output=
 port
>> >> > and use it to select the media bus format used to configure LCDIF. =
This
>> >> > allows the LCDIF bus mode to describe the physical interface
>> >> > independently of the downstream display format.
>> >> >
>> >> > When the optional property is absent, or it has an invalid value, c=
ontinue
>> >> > using the format reported by the downstream display device, preserv=
ing
>> >> > the existing behavior. The code is not validating the DT for
>> >> > correctness and just fall back to the previous behavior in case of
>> >> > errors.
>> >>
>> >> Why? Generally speaking errors are better spotted immediately, not ig=
nored
>> >> silently.
>> >
>> > My understanding is that the C driver code should not validate the DT
>> > and that this is the general recommendation when parsing properties fr=
om
>> > the DT.
>> >
>> > The DT checker is going to spot errors in the DT even earlier and in a
>> > static way.
>>
>> Drivers typically check for invalid values.
>>
>> And people writing their private dts can do mistakes and not run the sta=
tic
>> checks. Bad on their side, sure, but having a runtime error would be use=
ful
>> there.
>
> Understood. I would personally not do it. I can add the required error
> checking code. No other DRM maintainer/reviewer commented so far, so I
> am taking this as a request.
>
> What should I do in case there is an invalid value? Fail or have a
> warning message?

Just fail. You are in the probe path, so it's OK.

>> Also consider potential regressions. Say someone has an invalid value in
>> their product, say bus-width =3D <15>, which works because the default 1=
8
>> which gets used as a fallback happens to be the correct value for their
>> hardware. Some years later we implement the new bus-width =3D <15>, and =
then
>> that user upgrades to a newer kernel and their display won't work becaus=
e
>> it will start using that incorrect bus-witch =3D <15>. Better stopping t=
his
>> before it starts, IMO.
>
> I do not see this situation honestly, if you have a wrong value, e.g. 15
> bits, before this patch is ignored, and after this patch is also
> ignored ...

There is no problem with the code in this patch alone.

The problem is when in two years in the future we do implement 15
bits. (That's an example to explain the principle, I don't expect it to
happen with this driver.) But imagine in the future we add:

	switch (bus_width) {
    +	case 15:
    +		mxsfb->bus_format =3D MEDIA_BUS_FMT_RGB555_1X15;
    +		break;
	case 16:
		mxsfb->bus_format =3D MEDIA_BUS_FMT_RGB565_1X16;
		break;

At that point the device in the wild with the incorrect 'bus-width =3D <15>=
'
will start using RGB555 and fail, because they really have a 18 bit panel
which worked thanks to the automagic "if DT is wrong, let's go with the
default". That's a regression for that device.

Reporting an error from day 0 means 'bus-width =3D <15>' will be blocked, t=
he
device won't probe and the mistake in the device tree gets fixed before
shipping.

I hope it's clearer now.

Cheers,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

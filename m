Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33194F0558
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557570; cv=none; b=HUi1DyMjRB8PrdMx6XM/GMdzg70Ad3M28ZK7q+PiDqZhfzxlXXGLslyJm5s9KdKMyNXmvrLJFX+XqxmPLT6VDX1p9Op5IdvPeK1nPVJDLZFy9l5PYpMGUy9TEUxtLHc011DjSecCUPvzGUfCsDiLl+TZRgBqdfICxfVAvjGlrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557570; c=relaxed/simple;
	bh=DQyerW7t6Bd+bJtenwArRhRB5Pn1kPMUDZ4Lln1tqfw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=K/9BL2Q5IlzzSG44gZmuiXHSyiwJl8Bw8Ze2edF1JDm448tKsk3ETJZaudCXJGaPAyS+fcmEyAvaiIR2U9Ej75LkMZF7NUb67QlqnEg74MRS0TAgu2Jjc+hlEE3h4bLS1UihN53MuK84nqsQM8Zf65P5Tf0oNmSgLv/YPmOPdbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rGjgbUUn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rGjgbUUn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 91400C62215;
	Wed, 16 Sep 2026 11:20:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80BB360337;
	Wed, 16 Sep 2026 11:19:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD72A11C7AFE8;
	Wed, 16 Sep 2026 13:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789557554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DQyerW7t6Bd+bJtenwArRhRB5Pn1kPMUDZ4Lln1tqfw=;
	b=rGjgbUUnMZGoIULBVDkMYvcKXJhf8MHhxSVLnCW7abAyI2qrXQMPNGaH5Kxf5T6waKZcQ8
	reHjxvtYnTQVp7h5B0F+T7Ijeg8nJjtfAHwIJcoI0HLnMMAPQGhw8M5iOfTgFdEAHp0DXg
	tP/VjECAntD4GF9T65VpU1jpwEs3tl6K9jF59W0AimgMer1/QzNwBjyjqYrqnehnFzc001
	OiLl1s37pkgwnWePBneyITwjpC8lOhqe/FUyqLWnF+EXp3uRt1sYTbnZb6+YLQOfOXWP8B
	50UbFG5DdH+0QkPG91JjF+9C8pQg8oXMmnP/nr5NTM2KQGRnRdbJDSJVHsjk8Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 13:19:08 +0200
Message-Id: <DLGP7GKZJBOP.350QK94UOGRYV@bootlin.com>
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
In-Reply-To: <20260916091543.GA277833@francesco-nb>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Sep 16, 2026 at 11:15 AM CEST, Francesco Dolcini wrote:
> Hello Luca,
>
> On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
>> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. T=
he
>> > format reported by the downstream panel or bridge describes the displa=
y
>> > input, but it does not describe how the LCDIF data pins are physically
>> > wired on the board.
>> >
>> > These can differ. For example, a 16-bit LCDIF bus can be connected to =
a
>> > 24-bit display by wiring the available color bits to the corresponding
>> > display inputs. In that case, using the display's 24-bit format to
>> > configure LCDIF selects the wrong data-bus mode and changes the assign=
ment
>> > of color bits on the LCD_DATA pins.
>> >
>> > Read the optional bus-width endpoint property from the LCDIF output po=
rt
>> > and use it to select the media bus format used to configure LCDIF. Thi=
s
>> > allows the LCDIF bus mode to describe the physical interface
>> > independently of the downstream display format.
>> >
>> > When the optional property is absent, or it has an invalid value, cont=
inue
>> > using the format reported by the downstream display device, preserving
>> > the existing behavior. The code is not validating the DT for
>> > correctness and just fall back to the previous behavior in case of
>> > errors.
>>
>> Why? Generally speaking errors are better spotted immediately, not ignor=
ed
>> silently.
>
> My understanding is that the C driver code should not validate the DT
> and that this is the general recommendation when parsing properties from
> the DT.
>
> The DT checker is going to spot errors in the DT even earlier and in a
> static way.

Drivers typically check for invalid values.

And people writing their private dts can do mistakes and not run the static
checks. Bad on their side, sure, but having a runtime error would be useful
there.

Also consider potential regressions. Say someone has an invalid value in
their product, say bus-width =3D <15>, which works because the default 18
which gets used as a fallback happens to be the correct value for their
hardware. Some years later we implement the new bus-width =3D <15>, and the=
n
that user upgrades to a newer kernel and their display won't work because
it will start using that incorrect bus-witch =3D <15>. Better stopping this
before it starts, IMO.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

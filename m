Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847835;
	b=qnsuasJyjlUt6BdZH5p74Wh1DbpaRRtAM7ts1ZOks8LVvQNPnvpuxLlCSxuaiUbxY6V1
	 kjxmKwzR1HX02xl22KGeIYCJfkDZdVfIEYeKhEGwyLA0+IWFvYivr1I4MCmMkhn7tKr3l
	 nGJyntn1wu6WplhFDM036pNMO+nzskZD35D1eiI17FywKtDVPf/VSEqRhCL4swLPm6fvI
	 Boz4l+sZzX4Avv3DKRc1epvSpMSpdPn/N5iDm2FX+dapNoQJiWZbEvTRSNjMJm0eJLBLR
	 9eptJ9LZpDWi9gY3Suoaa9gNgOhemzG6JkoY/zzPgdpd0znY8KQ8/qFdf+Oux61sF1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847835;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3Evw/g3b2Afq/F+Pp6hmq/8zzzcntWEqw95ah21kG1g=;
	b=mKZaU1FjphGBhnUsuFzUUN29smnJDqhEO06tL2Ux7Qv3g/Dp/91kQXf8kmp1XrspDx4Y
	 VvuIzRGiMSJDfEubVErwsbwmsEpbImfXSfVeS47srZXw7pWtB2GgO1T5KT/4oIbwHUZ8D
	 LGQffWj1vFMlwA/yu2jWXivBSZ+XO9tni88FlnSPhOGvYZOT93s4Cfzew+Mr4+mL813Zn
	 541xHFyJrpL33caP7kK4+vMNkQrGUW1IidI/ketemCBb2sZzMgwqfCMeCiyRXWFHo2X0P
	 E0c/4QSuOqDr54AQw8lJeGjNfoK8BpErL1ysVQhVTE/vLGqgIhimx2fF3JYoFqBaaUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B+0klW/J";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2084D606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+0klW/J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42ADE1F000C4;
	Mon, 16 Nov 2026 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794847834;
	bh=3Evw/g3b2Afq/F+Pp6hmq/8zzzcntWEqw95ah21kG1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B+0klW/JkSWnXMRc+kX58Ahqkj20tw4RnMo1Nm7omxRKuyzlbk8HhSoMRLHOFlJza
	 j2d4T6s3g1ym83/F8txPKzmwy3Fxc7Bg4E2KskHdMP+G+/x+mbGSbFgTEmgCLq9GDX
	 2g3nLnwzlTxLPSdt8TftJYs2YvZw+mzhQGkAuBp0o1oh/0PfZKavYOw/p0D1dennhz
	 XB7HlX4oEaz0qf4TQfNE9ifDKEIAmFOMO5W3axMW06IQTuifbNIPdbzReucdTDB4oQ
	 Veskvb9NnRt8PBciQSim7dYhKC0nxdCOKrUWGY7pLrfumSpdWP9FNFeIG7Tb3FvjFw
	 mBuG0bbMoHmBg==
Date: Mon, 16 Nov 2026 17:50:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TcOgeGlt?= Pedraza Padilla <maximpedraza@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] drm/tilcdc: Implement state readout
Message-ID: <avszNevIGlq-SKmp@houat>
References: <20261116142707.1299360-1-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lxs53viba3vsbhoe"
Content-Disposition: inline
In-Reply-To: <20261116142707.1299360-1-maximpedraza@gmail.com>


--lxs53viba3vsbhoe
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 0/4] drm/tilcdc: Implement state readout
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 03:27:03PM +0100, M=E0xim Pedraza Padilla wrote:
> Hi Maxime,
>=20
> Following your suggestion in the boot logo thread ("just implement readout
> then"), this implements hardware state readout for tilcdc on top of your
> v7:
>=20
> https://lore.kernel.org/r/20261029-drm-state-readout-v7-0-25e5163d75c3@ke=
rnel.org

Awesome, thanks a lot for that. I was working on sending v9 today, so
it's a nice timing :)

There's some redundancy with some work I sent since v7, but it looks
pretty ok.

> The goal is that the kernel takes over the display as U-Boot left it, so
> the boot logo stays on screen with no blanking or flicker until userspace
> replaces it.
>=20
> Patch 1 adds an atomic_sro_install_state hook to bridges, and patch 2 uses
> it in the panel bridge, which also reads out the connector and bridge
> state: without that, the core discards the readout of any driver behind a
> panel. Patch 3 is the tilcdc readout itself: CRTC mode from the raster
> timings, primary plane with a non-GEM framebuffer (as tidss does), encoder
> and hw_reset. Patch 4 keeps panel-simple from turning the panel off at
> probe by driving its enable GPIO low.
>=20
> For the backlight, pwm-tiecap needs a .get_state(), otherwise pwm_bl sees
> the PWM disabled and sets duty 0 until the panel is enabled. I sent that
> one separately to Uwe and linux-pwm:
>=20
> https://lore.kernel.org/r/20261116142251.1296742-1-maximpedraza@gmail.com
>=20
> Tested on an AM335x board (Fides T075, out-of-tree DT) with U-Boot
> leaving an 800x480 RGB565 logo:
> - The logo stays on screen, untouched, from U-Boot to userspace, with the
>   backlight on all along.
> - The U-Boot mode doesn't match the one in the DT (16.94 MHz pixel clock
>   and slightly different timings), so the first commit with the panel
>   mode does a full modeset, as expected.

I'm not quite sure I understand what you meant here. If it does a full
modeset, I would expect to see some flicker?

> - First commits from userspace: a framebuffer flip without modeset, a full
>   modeset to the panel mode, and ACTIVE=3D0 then 1. No WARN or oops.
> - With drm.atomic_readout=3D0 the old behaviour comes back: the raster st=
ops
>   and the first commit does a full modeset.
> - Without video set up by U-Boot nothing is adopted and the normal path is
>   taken.
> - The SGX530 driver and a Qt EGLFS application take over from the adopted
>   logo without visible glitches.
>=20
> The DT needs a reserved-memory node for the U-Boot framebuffer, and
> ti,no-reset-on-init on the GPIO banks (and on the PWMSS) so that ti-sysc
> doesn't reset the panel enable and backlight lines.
>=20
> The backlight needs some care. With the PWM configured by the bootloader
> and the pin muxed to it, the handover is seamless. If the bootloader driv=
es
> the backlight some other way, for instance with the pin as a plain GPIO a=
nd
> the PWM stopped, the light goes off when the kernel muxes the pin to the
> PWM, until the panel is enabled. The bootloader has to leave the backlight
> in the state the kernel will read back.
>=20
> After each commit, the comparison still reports some mismatches. As far as
> I can tell they come from the core rather than from tilcdc, but I'd
> appreciate your view:
> - connector_mask and encoder_mask, on a commit that only changes the
>   framebuffer: the connector is not part of the commit, so it's not read
>   back.

Yeah, that's because I wasn't supporting partial pipeline updates in v7.
It should be fixed in v8 onwards.

> - mode_blob, after a modeset: the memcmp() includes the mode type, and
>   DRM_MODE_TYPE_PREFERRED can't be read from the hardware.

Same thing here.

> - With ACTIVE=3D0: crtc, fb, enable, best_encoder and the bridge bus_cfg.
>   The readout sees the raster stopped and can't tell enable=3D1/active=3D0
>   from disabled.

Ditto.

I'll review each patches individually

Thanks!
Maxime

--lxs53viba3vsbhoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCavs0VwAKCRAnX84Zoj2+
dlOgAYD6jwrqZXcoySAlsBNIouDctWT+ue7G+p9C7VaCJvut09GrfSTYuhyGXjvl
ICyJoh0Bf2YrcbEedvv7mnege923SB35KSiJ/I96i2AhZY4ZRHw3W9qVFOWIej8J
c/qvhf0oUw==
=lzWb
-----END PGP SIGNATURE-----

--lxs53viba3vsbhoe--

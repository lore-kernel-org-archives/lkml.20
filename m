Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76DB3E314A;
	Fri,  4 Sep 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511093; cv=none; b=MJric0KBvjX6ySrW8Z1PEXdwlh+rP2B+9SlD2Lhx6I1SSE0Oo+hTtvuJx7iNoXgwVK5S7XjZTlrNcEUPEAhXy7mAN4LJhgZfj5jNzTdVoQb5pKkAmUXUqXYqf/IR21dtiKCeQ4uIxpn3gd0IfnyVDgywC55kp6BxFAHFiBmZPeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511093; c=relaxed/simple;
	bh=bElctS/Ik+js9MaC/z6FVmzZyLr8iSvtdS2Bs/M0p2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5u/ygMAkPmGYfYs+/TnCXOtCr3ocoRTkZ61D0B814UoiSyVp9BfSkPE3aEYruMSTvxpIvTmM1MeU2srHbLPaK+1fwmJI8Vd/AIkVR7G9K1aASHVDFWT0Cus4sQSs97t20BoMkOJuDTIp/tiD9UIRZi6jiRiOR+z7apgsohwIeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTlQChWz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTlQChWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D7B1F00A3E;
	Fri,  4 Sep 2026 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788511091;
	bh=uFsQT1ddKpz+9hW9jtG9cmCPNgQnYsOrVrfp1VEtJc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BTlQChWz33Ek3tA5QJkL22JROr3Td1RGn8CJeU3WX+vxde2lhWz7dLbiWAQbYp+Bv
	 piG2ouRCHsd3Qkh0eBC7Z0XYMUtVdiSwkaIHSab4KJb7Lt7GFaxWIDcPXO22P1v+wZ
	 56SMw1Vc2tFLE+dASjrjdWTpFpcpRMGSOn1zJ4bWhdJcDzbgrajYsyp3mF2IOrl/Fk
	 D4WuuRwKzqJbzMsCHWYxyWma4DwhsJsfrPztJBvsWGzFjMJMctdJ36+oPPu7U0ZxY8
	 M0fQOS7B1cWy92qDsmJN7jF0S2HsvPfdu9YbNseSbWnXDTExowbAU6QXOVHuibkfKd
	 /eS/6uZUBqOzQ==
Date: Fri, 4 Sep 2026 10:38:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org, aisheng.dong@nxp.com, 
	agx@sigxcpu.org, u.kleine-koenig@baylibre.com, marek.vasut@mailbox.org
Subject: Re: [PATCH v9 00/19] Add Freescale i.MX8qxp Display Controller
 support
Message-ID: <apqDKdcQrizwAv6U@houat>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
 <20260714193627.GA9616@francesco-nb>
 <alh4a66fEro05ShA@raspi>
 <20260716062612.GC9973@francesco-nb>
 <alh-6sI4J7vq2drz@raspi>
 <apl4rkHIs9QFuUTE@houat>
 <app836E0_y8lG9T5@raspi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mwzbtbj3gnfo5lzq"
Content-Disposition: inline
In-Reply-To: <app836E0_y8lG9T5@raspi>


--mwzbtbj3gnfo5lzq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 00/19] Add Freescale i.MX8qxp Display Controller
 support
MIME-Version: 1.0

On Fri, Sep 04, 2026 at 04:10:07PM +0800, Liu Ying wrote:
> Hi Maxime,
>=20
> On Thu, Sep 03, 2026 at 03:41:15PM +0200, Maxime Ripard wrote:
> > On Thu, Jul 16, 2026 at 02:49:14PM +0800, Liu Ying wrote:
> > > On Thu, Jul 16, 2026 at 08:26:12AM +0200, Francesco Dolcini wrote:
> > > > On Thu, Jul 16, 2026 at 02:21:31PM +0800, Liu Ying wrote:
> > > > > On Tue, Jul 14, 2026 at 09:36:27PM +0200, Francesco Dolcini wrote:
> > > > > > On Mon, Apr 14, 2025 at 11:50:09AM +0800, Liu Ying wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > This patch series aims to add Freescale i.MX8qxp Display Cont=
roller support.
> > > > > > >=20
> > > > > > > The controller is comprised of three main components that inc=
lude a blit
> > > > > > > engine for 2D graphics accelerations, display controller for =
display output
> > > > > > > processing, as well as a command sequencer.
> > > > > >=20
> > > > > > ...
> > > > > >=20
> > > > > > >=20
> > > > > > > To follow up i.MX8qxp TRM, I changed the controller name to "=
Display Controller"
> > > > > > > instead of the previous "DPU".  "DPU" is only mentioned in th=
e SoC block
> > > > > > > diagram and represents the whole display subsystem which incl=
udes the display
> > > > > > > controller and prefech engines, etc.
> > > > > > >=20
> > > > > > > With an additional patch[1] for simple-pm-bus.c, this series =
facilitates
> > > > > > > testing a LVDS panel on i.MX8qxp MEK.
> > > > > > >=20
> > > > > > > Please do NOT merge patch 14-19.  They are only used to facil=
itate testing
> > > > > > > the LVDS panel.
> > > > > >=20
> > > > > > What's the plan to conclude this work? What's the latest status?
> > > > > > I am looking forward to have a way to use the i.MX8QXP display =
with
> > > > > > mainline, but to my understanding some required changes on the =
SOC dtsi
> > > > > > are not merged.
> > > > > >=20
> > > > > > Can you help?
> > > > >=20
> > > > > I planned to add display controller DT node after prefetch engine=
 support [1]
> > > > > is picked up so that the prefetch engine could be enabled togethe=
r with the
> > > > > display controller.  Just want to avoid a DT that only enables th=
e display
> > > > > controller or bypasses the prefetch engine.  It makes the display=
 controller
> > > > > driver simpler.
> > > > >=20
> > > > > [1] https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4e=
cb6c6d4941@nxp.com/
> > > >=20
> > > > That series is from October 2025, is there anything blocking to mov=
e it
> > > > forward?
> > >=20
> > > It lacks a Reviewed-by tag(at least a Acked-by tag) from a drm-misc c=
ommitter
> > > for every driver patch in that series.  Also, it seems that Marek(Cc'=
ed) is
> > > not a big fan of [1](See i.MX95 display support discussion[2]).
> >=20
> > I was just pointed at this series, and I'm not sure why it's blocked. It
> > looks like you were waiting for a Reviewed-by by a drm-misc maintainer,
> > but I gave mine already and I'm a drm-misc maintainer, sooo... :)
>=20
> Your Reviewed-by tags were on the initial i.MX8qxp Display Controller dri=
ver
> patches.  And, those patches have already landed.
>=20
> Now, I'm waiting for Acked-by or Reviewed-by tags on those driver patches
> which add i.MX8qxp Display Controller *prefetch engines* support.
> 'b4 trailers -u' doesn't include any Reviewed-by from you on those patche=
s...
> I sent v6 prefetch engine patch series[1] just now.
> It would be great to have your Acked-by or Reviewed-by tags on those driv=
er
> patches :)

It looks like you had a reviewed-by by someone on all these patches
already, so you could have merged them.

I do have comments on the series though, see them on your latest
version.

Maxime

--mwzbtbj3gnfo5lzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCapqDbwAKCRAnX84Zoj2+
dhi0AX9V0v+FF43tk17YKUNo7scfgvGnbACB8czD60jcwTcj64E7k+ij/1JqzbGA
dYQ5eMcBfAh3EL8ZwNhP4ydctLhqIq8SSEhX9P4/0uHyhBDfXxEvnEbDT0vpBZlH
aJhlwQhn8g==
=ts7W
-----END PGP SIGNATURE-----

--mwzbtbj3gnfo5lzq--

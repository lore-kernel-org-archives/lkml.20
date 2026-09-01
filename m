Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57173476044;
	Tue,  1 Sep 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254854; cv=pass; b=bCelpd/Zmy+gO2w6ew06/l8kPuZ+fJoUXjfg971SP0uejdwajZ6ns6r+tk6f8dAn9cJ9+4is8kRIcg6x+GSBD8c/LGmjknqjPJhD8kHHFlEEzEWtfDEpsx9gIZhCl81wVQow5FsVgNgq4Rfm828R/DzX2r3jwD/0navUed9CKRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254854; c=relaxed/simple;
	bh=WBNE7bb+LspvvsDuZbtWPwLg8gdow8Zcr50MxcZHNoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQePeAUag4TjqkStc4oHlROEUOIPxeRuoakwWUZNsScypTu8eDdzhjx5ObNo5hGq4WUV7X0QGDBaQFdTQ9jum7xt5MjNATWyC8BtLkK+58OfI8GHOJAlQ2TiUxLhawD+Ty2VYk8r2X5wtnhSGEx1rrrh5ErfJ2rw3B33Sb0LIu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=bW1ntzi3; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="bW1ntzi3"
ARC-Seal: i=1; a=rsa-sha256; t=1788254814; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cELpdRA5MqYthZUDYMBNVCiJz6LkZkvB2kG9NiSJa1/+bujCGJWnrClWtlzf2Mx/feTAY4P3q9hmxhAt+4tTjBNFbeIoNk/5Q9DduNlypASdeuYc8986Y54lcjEYhrRuFqRe5djlb8JvKxWRxuCRyRQtc/nuVrAzZKRar6oPe1I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788254814; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WBNE7bb+LspvvsDuZbtWPwLg8gdow8Zcr50MxcZHNoo=; 
	b=nfGhH4fpIuLXqaDlBAf9j92SMOt5yrZTlmhpfg7RxRrdZfJxGR9BA31OfVN6XX5ItynFFjuRBwTgiI4UN0rb7eLW9y/KiH3hcu1snIcx4CYVmTw4hNoClODKpPpFqWsGVZzsC88rNfU/7YFEp1FE3tcR62ve/FbLyqBi01v9rhM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788254814;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=WBNE7bb+LspvvsDuZbtWPwLg8gdow8Zcr50MxcZHNoo=;
	b=bW1ntzi3KdmC1QB0gXmsJjQwoQBvg7S5/aL7aa//AhJQaMGzSz/babx98M37ylhg
	c0IVKi2zGuw7mpm8YJEwrjMb/HyQqoqKTu9QjGHGeCD6V/re0uuvSUIDiLQ4q5jzwau
	Vew7VZKFqnJGt88JVzrCu7U/SHqglQ1xSVNRBlD0=
Received: by mx.zohomail.com with SMTPS id 1788254812080376.5012000638063;
	Tue, 1 Sep 2026 02:26:52 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 37336181B0C; Tue, 01 Sep 2026 11:26:36 +0200 (CEST)
Date: Tue, 1 Sep 2026 11:26:36 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
Message-ID: <apaVTYiKviNsydUG@venus>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
 <apBi5sGBpPfwTW4G@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3dlaegreqn3h62kc"
Content-Disposition: inline
In-Reply-To: <apBi5sGBpPfwTW4G@vaman>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.233.38
X-ZohoMailClient: External


--3dlaegreqn3h62kc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
MIME-Version: 1.0

Hello Vinod,

On Thu, Aug 27, 2026 at 09:46:38PM +0530, Vinod Koul wrote:
> On 13-08-26, 22:52, Sebastian Reichel wrote:
> > Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> > if the configuration changes or cable orientation changes. This is a
> > problem, as the consumer device will run into undefined behavior.
> >=20
> > With the new PHY notifier API introduced in this patch, the consumer
> > driver can hook into reset events coming from a PHY device to handle the
> > PHY going down gracefully.
>=20
> Hmmm how will phy get notified for these events. Typically there is a
> separate hotplug mechanism to take care of cable changes.
>=20
> Looking at implementation of this, It seems to me there is checked on
> power-on, so maybe notifier maynot be right one... ?

With USB-C you have the TCPM (Type-C Port Manager), which will send
notifications when the plug orientation changed or a different mux
configuration is needed (both information are sourced from USB PD).
You can see typec_switch_register() and typec_mux_register()
registering handlers for these events.

Effectively there is:

1. TCPM providing information about the hardware configuration
2. USB controller driver requesting the USB side (software request)
3. DP controller driver requesting the DP side (software request)

These are combined into the desired PHY state.

If the USB controller driver requested the PHY (happens during
normal driver probe of dwc3) and then you plug a device into the
USB-C port, which changes the mux configuration, the PHY needs to
be restarted/reset. Accessing the USB controller while the PHY is
restarted results in an SError. This part of the series will
mitigate the problem.

Greetings,

-- Sebastian

--3dlaegreqn3h62kc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqWmkgACgkQ2O7X88g7
+pq2yw/9FIRH2tguovlpTzibRD3SnDZDhFzWm7UzNHTuOCL8oXbNeEyCytCKUI64
s1YUTzTNFPRNWl1Zg7KPKNa1RPieRjbqRfgeSLm5DscxeNojst6q4pEwZR21LpLn
+esC2NWPx4Sdx8l7+idIZEQTOiRJgvOOrmvaOdWPCj9j+FprkM1l4SkUt9ZKt3Uy
9T0Ud2hZwSD/hsoT9t2DTzINRv/LIPjBCuaNIglzAgRZYlFjIZQYH0n/ag0XAqat
gXNN2GwPTAZBdLn4SUXmrfFOzPedCQeJA35eGg6MCNsfeSJOAL+X2LCWMs6aYsJL
iJPz2eITM/0o8fP8Fo+7b8ELqaEYiEDpbpbgLxtE97dwlHu3T+6j5+u+MfNqX5J/
gQ8OcmjnlLQOejlJyQlS4c4cKboUE7VRCVNJ8J5K6N7OiqiVPMvgb+wRdFEcoara
zllZekiW1kzY9JfYHDTA2n42E7X6uKl0+/VkhD/jnMlqoRXbRUK/GWXyaaOnDruY
Reyi2fv12V94rAQXIL6DqZeHClUpaPBRgplQZarklVpnONpfUAla/UR9Enf7bul0
qJQyJsUys8hjwKQy+VKtqdt+ac9y2/T7MISxuhtpKVkJWh+5IaLaVsveIbdxFjnK
QJ343srZH6CrqqJ3ZznRZUrddocBc8LTEEAQkXOnMDTGdlP2WZI=
=nOU6
-----END PGP SIGNATURE-----

--3dlaegreqn3h62kc--

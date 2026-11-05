Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879466;
	b=rdByK+hZUsOuI9F0J1V1iUmB4Mw2MyYCBrlA8jwcG2+lJDeq7nqh3F7JSiehSs5QBpbv
	 gSNX6fCEO5A90uFQW/fyOq//zfQ4KUnPNktQ0WDCNDZ3H6EKHeYdxcNcnP/zckwGtgKX8
	 ovPT6hemPXxG+Tu83kGdaL3F/hxfgzpuqZq4S21nx/+UeZKKwcU2+g87OP4QpPpbnMlWW
	 awqqXj1xHdyjWhW3S52wZacqIbyfNlZ31HOYvoj6our7JAyzy3iqnpODcSIlgNPwgjd2z
	 fOXtgtkrDH3WsTA3xifl5G4aFKW+u3+NUtIsTMy9GQtoWHlYoe6clju8H9e44j6mfbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879466;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=4OS3i6eFd7tcdMjfachyyV6i3nKbEcsVPS6UTpVoEG0=;
	b=tOHxZfTWp9S/jCcKqbhi1jo3prnHuPCfi39NRaheqZLhVQuAHN+0F3Vc0P4bf4z++1+c
	 1AWAbQZFJgFhI6+yksFvIca2SsLPmUWngr7nrSSx2Y/+YrjGoXhzssavED1oz/LEaYd67
	 +lHl7YbZC2HRzTd3ACSI9Xy0oDvHTTXvleGoOeXja6A4UcYkV1IGkNNNyS/Ga9ccIHO78
	 +fLEZTfiTtQ5IVUp/6c9vacIgv2L8wqqhG8supMsoNEvVifwNeIvdPNDw01L8T/wxlItf
	 9T4a+2ESIiwZVV6qYekcuLBpap6Au2ErfMzm7C7GblOldwi+fVnuT9MlS0/RqZuSnww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGE+28uN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF64606D819;
	Thu,  5 Nov 2026 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGE+28uN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F30D1F000C1;
	Thu,  5 Nov 2026 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879465;
	bh=4OS3i6eFd7tcdMjfachyyV6i3nKbEcsVPS6UTpVoEG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IGE+28uNn0cQzvWb3P23I+Y3Y9vuvK6VC6xP68IsCJD/M64adDVLKoG85s06au+G1
	 J1Obn+d6Gm+CsWIH23qmxfKWtjQ0P9Ul4EIfHSTFHks5si+zlB3BjKVyxqbtJA0KV9
	 RgnOsaRULKxZIRLpHjq28Z6fmqBclgfbuB3hL9AgqZvHVVjxQ7TVuMPDKi00AdIcDH
	 bQxA0WJJEuNowi3dV+k79udSkhT5NK3lPeUH1B7xkzM5iS5szeFaG+IFgr1S6HFqIh
	 U9aksm3FlI1cHrtihxazmZEWUsN4wicDI/UHDHJ39YRlfInMv35rprdxxUrA6/6WPA
	 pHABR9k1OoZLg==
Date: Thu, 5 Nov 2026 12:51:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang =?utf-8?B?KOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Gary Yang =?utf-8?B?KOadqOaWsOS8nyk=?= <Gary.Yang@cixtech.com>, 
	Fugang Duan =?utf-8?B?KOauteWvjOWImik=?= <fugang.duan@cixtech.com>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v6 0/3] phy: Add CIX Sky1 USB3 PHY support
Message-ID: <20261105-illegal-fervent-swift-3c05c2@quoll>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261105011751.4058411-1-hongliang.yang@cixtech.com>

On Thu, Nov 05, 2026 at 01:17:56AM +0000, Hongliang Yang (=E6=9D=A8=E5=AE=
=8F=E4=BA=AE) wrote:
> This series adds support for the USB3 PHY integrated in the CIX Sky1
> SoC.
>=20
> Patch 1 adds the device tree binding, patch 2 the PHY driver, and
> patch 3 the SoC node plus the board enablement.
>=20
> The PHY provides the SuperSpeed lanes for the Cadence USBSSP
> controllers of the SoC. The block drives both USB3 lanes: it is
> exposed as a single PHY provider with #phy-cells =3D <0>, and its
> init/exit calls are reference counted so that both controllers can
> share it.
>=20
> Tested on Radxa Orion O6 (Sky1) together with the USBSSP controller
> series: the PHY probes and USB 3.x devices enumerate at SuperSpeed.
>=20
> The controller device tree nodes use the PHY phandle added here; the
> USBSSP controller series is posted separately.
>=20
> The series applies on top of v7.4-rc1.
>=20
> Changes in v6:
> - Drop the per-port child nodes; the PHY provider node itself is
>   referenced with #phy-cells =3D <0> and the driver exports a single
>   PHY instance shared by both controllers.
> - Select REGMAP in the PHY Kconfig.
> - Use dev_err_probe() for the reset, clock and regmap acquisition
>   failures in the probe path.
> - Corrected the mail sender name: v5 was sent with a non-ASCII
>   display name in the From header, v6 uses the plain ASCII name
>   that matches the Signed-off-by.

No, you did not.

Best regards,
Krzysztof


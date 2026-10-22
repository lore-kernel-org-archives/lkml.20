Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692797;
	b=NePwQvLvNsQ5QXiLTx/FmCEc2lEnQfHakq94odnGki6BC11m2aRvR6zBvCJ00VgiOk/r
	 DiC2UIdsENkvAiBEiay5dKEbnsk1wy49UefwIIFe6eftp8+CACKnwT3VKq7+Td5ebMzdi
	 C8WwOtp6pJud270jxThjVmtIJCWtgIQt8hpPQpP2gUTujLwe9RhLgKGbBtDTdukRYoQl2
	 QVsvlGvA5D1zDOHfDg4dJ9nM8tuq+fvuULSg3hGh1wSTFBVHguza64G6+YC/CFEOc8Mti
	 O9LZW1gx4ndMVbhhVDS15hMB5MrF1cotYfdMi/BHHV4XbJsHcpP/MwYRyp+UQ9aH+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692797;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QJqrMCm4IHIw5UKCEBlnLwjUBlVqiEPTc5iWgvNluCw=;
	b=DGsBcmeDo+0JukDGi45qt0dWLNTEYciyLHqPPaTeY3Ayjd9pMNyf+tG5G97/IDRrSLsy
	 iZxEfSFGwAtRI9z2YONFAOR/e5aeKGemLinzFErEMqCA91jtoEZn1CHYmelPKZjsA7bIi
	 Wg1bCY4cDQKIoKatI/ZlFBikggI0M38IrKi53QB1DyWsYr6hmPV3E6w+bi+lRGXXOJh/C
	 BdMpCvu/LQVlkA3jWFp2y10VPDYYdkbWqDhnoeB3EHl3repzw0aitijGg2csQEx6mKh25
	 fouLib+Nz00JBmjmvcukYPDy5a8wOqV9xZPS7CZijNS0vq9f5aao6R8AFr9r/WLC4Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CaT8QXJa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0173E606A319;
	Thu, 22 Oct 2026 18:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CaT8QXJa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B571F01825;
	Thu, 22 Oct 2026 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792692796;
	bh=QJqrMCm4IHIw5UKCEBlnLwjUBlVqiEPTc5iWgvNluCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CaT8QXJas15GFkr8qxCUTT5gFSQqnHXVylSuM90EwHPuiOy0+czeo3jj5F6a0xlq2
	 HZMS0rHhRYbNZsdRD54g/04gGplZ/0BG5iL+BJ7qcBM0okM2I+7LF6A/urYcqmWili
	 NVxjLVp+5SwyKbc0X7d4TmAdJoPhQqZiv34tw0fDmWAbvKrmKcKrrJ14eEfH5iQd1d
	 cv4/Pz7GwlMnum9qUIYmiX+uFHI+T95e3kJhtKAgzkA9gCR7QxorKuzS2hFa7lW/Wd
	 R6Vm4wbzH0rrVy7noM+2vABDJwY3cJ+7/vYjc7ux+DZ/e+gEA3wFM6FKk9H8bxspIY
	 JSfEhSXOW2wbw==
Date: Thu, 22 Oct 2026 19:13:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <20261022-speculate-stagnate-6b7d98eb2b0d@spud>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NOfcy5AhWSHOJVoL"
Content-Disposition: inline
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com>

--NOfcy5AhWSHOJVoL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 04:31:25PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>=20
> Toradex boards route the sideband signals of their 24-pin camera
> connectors to different GPIO controllers. Camera overlays which name
> those controllers directly must therefore be duplicated for each host
> board.
>=20
> Describe reset, power-down, detection and power-control as
> connector-local GPIO functions. This lets an accessory overlay remain
> independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> remain described separately because the GPIO nexus does not abstract
> them.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--NOfcy5AhWSHOJVoL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpSNwAKCRB4tDGHoIJi
0ixIAQDnbVkCkuKxskSVSF2V2FdiYpAO+LW5qhoKikflKhcH3QD8DUGoKIoRUdmG
q+MAmuPsmcB5sp+RPAHq2sdqCd+Odg4=
=VPLQ
-----END PGP SIGNATURE-----

--NOfcy5AhWSHOJVoL--

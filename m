Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588541;
	b=bg0CFoXIWEIPX4CJescmjCMta8COtGCHnmVioCzWw0CRM4YZ/56x9yhTHU7jY7Q3bmbM
	 aqhULCy+PMij/lb8TK/n3e5ec8IYRqnD3TxdYLU4XsYgK/NI1pU48bhqn1X9Rn2X9gb5r
	 NB0oXqiOU/jeqtOldAJRO6ZXCADPMEBvi4bxSGBPLnZpHP0tpCkQM57I+g31M3enjnvz5
	 rMApJ5mVKhHVdXM43xXpl7HJzstWntYqxO8AfxUSLOECz5HsNKoIO0YEPOuZglr0slmI3
	 y2B/sUtbBfRAzdC68CLs3sDMSSNwV0ZYiLO/5BTRBZhZc+XwCuFSAtZJJ7vkqRx0/dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588541;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=azItZw37Psv+RIoTb/9kDu9Pry7KMlBGSqn8SyHam7o=;
	b=wM/rn7kmsGd6uPSmdLj+WfpA739RVOs8ThHfytm6tehPoI5gl5BGieAr+JLOe82qavfj
	 jSjuHXpFyBITiup/WeX5Ean+KfdoNjJvTt+TQsygGQr2AmCbSDgsN/YAdk2BnkNr2u1KH
	 1S+wQFmvWc5vMY6anYuIthCXwC2E5u7c9nS1A9ORVTMvWP6iDggqEgOfT934jqefjrxZr
	 wKq0bsZ1EsPo4MTtqmLl09QMTV8s8R8setM37lz4vg/neNLvRQrqG7JX/kz+URtYEU+cQ
	 R10Egi0nZ9hCg8xiQhoa6tyWGKj5c1PUHDkCq5Ca1iP7s2gWUfv7leeyOzKFMMRHOtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4Sr++px;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC65606A8AF;
	Fri, 13 Nov 2026 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4Sr++px
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB541F000C4;
	Fri, 13 Nov 2026 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588540;
	bh=azItZw37Psv+RIoTb/9kDu9Pry7KMlBGSqn8SyHam7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H4Sr++px7qKhjMrUw+S3/EQ3XEJdptnPT2OxPdSmPCb7h7Dy1fyHSsqKUKrVkM2N+
	 XZuJGhoNn6sIdglF0LQb0rxyXW5syUe0gdme21SYJTNZmaIk0uChwY3e3pve9U8KZh
	 1STpJwl5B4ZQGotbPJuYsrns5cJ7URZoJiHmD4LxPC1toTgUf7krlJSe73IqiTb8AC
	 Dw+14CEtlaYz+u4GcEW4yYfxWjZBr2Tf1fvTvW/g2gLkD2/Yef6RSDpylwoRaP74bF
	 Rk2FGruQl10cMYJClg8v2stfO8Gckri6bgpJKvRRYkYDqpkLNQ04IbfIghqT4bMo7B
	 xtOCF0YpA5oPg==
Date: Fri, 13 Nov 2026 16:48:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yannic Moog <y.moog@phytec.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: fsl: Add phyFLEX-i.MX 95 Libra
 RDK
Message-ID: <20261113-succulent-glacier-334cd223f87e@spud>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
 <20261113-wip-bhahn-imx95_upstreaming-v2-1-3ef58af5e689@phytec.de>
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
	protocol="application/pgp-signature"; boundary="HWLnn1zvDEVXTT37"
Content-Disposition: inline
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-1-3ef58af5e689@phytec.de>

--HWLnn1zvDEVXTT37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--HWLnn1zvDEVXTT37
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavc/dwAKCRB4tDGHoIJi
0uC9AQDgV4VJ0N1dSGPsWsIo5QpkDfYLvixZ4fh7GMSS0TzJ6AD+JUdFHpRiNkjK
i0v+d829LihQxaj/1Y9vsNtiJq0giQ0=
=YOMt
-----END PGP SIGNATURE-----

--HWLnn1zvDEVXTT37--

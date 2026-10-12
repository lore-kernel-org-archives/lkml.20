Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03EB39061C;
	Mon, 12 Oct 2026 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832135; cv=none; b=gbTZx7hUHO5bnLg4DocEnwbpAOI58pwQd5ZCtxl6liaEgyTo2wZxvN3CMe0/hfus16gFcCmLnKutso+hGMmLxrYwoSLQ6wKC48fLHX2uZ8cAIVnqzMaBD46JRfolBcRnqTujkCVvcTK9/SiCSEaRoQYLe0NO05/5Z3GmT/aDDkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832135; c=relaxed/simple;
	bh=AH2UirJCWDjtQ8R32qv313a+sS+NLZo8fy7CiVjRpSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yr3tuMn07YTmwkp1rZJ2gohWYLp9Yq3GJXgzyYQqJX1ch9qw0dYsg+1GAQ7lEe+KllwNjwUmcXwPOBxSftcQQIcxLWBjMJUOceKFyA/1dQYRbPktdsuH/AT/X6idesYZ9LBNT1RT8K4r7+24ZvyUQX7N4CZ5ayVmpqhCrdpumwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQ+QH3ab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQ+QH3ab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40A31F0089B;
	Mon, 12 Oct 2026 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832134;
	bh=AH2UirJCWDjtQ8R32qv313a+sS+NLZo8fy7CiVjRpSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kQ+QH3abMyKT2hbftVxX9XFZgH/GiMSWph9bG9HxraLBUjQ0N+StNB9KsQYvvkwiV
	 Pg5zYOmXvvYa3Pav0CLHRkwPPtTepSUXakhiy+ISkksn3WlIRe6epE3tuPBsZD9E4+
	 T4UVCCqYso81hQAHLKcsK2wPvigYccynGcCJo7c/Uqw0lyw2X0CPRH3fr4jJgQtmjQ
	 OUL4qwzUOKo3LY1N/bmEAKbXPpAD99z/H59Ll/FIYaLMbHm8xTH515OFgUxmPdgPPr
	 lhv91rM7LpVaGtuyhW96p//w/btde2nlH81Bun4BOAP31gSqHn8Q52bsNA6PamT9c3
	 scX6AQLgNr2wQ==
Date: Mon, 12 Oct 2026 20:08:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: simple: Add the
 Toradex Apalis iMX6 VGA DAC bridge
Message-ID: <20261012-overtly-powdered-c8c2869e4319@spud>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012-v1-apalis-imx6-enable-vga-v1-1-8905d8746504@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cfz7Ef1U0dsCKRCm"
Content-Disposition: inline
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-1-8905d8746504@toradex.com>

--cfz7Ef1U0dsCKRCm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--cfz7Ef1U0dsCKRCm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0wPwAKCRB4tDGHoIJi
0jlnAP4yIPeZyDrdvqTGaV/8ySZ5uj9SUbamP+03AnBdo4AXpQEAzZ00qNI8KiIV
oDO4vZxCIctnH5UQGVexvOnOtgOWYA0=
=W8Vk
-----END PGP SIGNATURE-----

--cfz7Ef1U0dsCKRCm--

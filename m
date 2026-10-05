Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB1F473C66;
	Mon,  5 Oct 2026 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197528; cv=none; b=VAtKlp02r4t79v0k2Qk8UHGYOID7qMYuFKDbWKG7E+snLLva8R/sxIoNQgO/fn0b10OPZGodw5s1h04ivkM8bcDBEGrfxAVeFrgnq6njPTQMySzQBuuE+VLXSYwsPUo7UtEerYVVSXISPfEX8vbFTN0EVTu3fqWxlmxjwFSvP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197528; c=relaxed/simple;
	bh=ipPqkob72lwiICznw3iaHl72u9I6k7Y65KFgTyU2QgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=givp3oSngCeUxlYz+Lxh30hje+A/VvWwI2IDJQ1qExvWlo5r8R1+mblXyTVE4cLYKr9/e1Kcl3EKseK4Q5mdcRVWy15WUEAXUKAKjljng6/f6hkAy7/6gX8PkiFzJ9LGVzstZtqL5HL5F0xFnDoZMEH+FUZJO1FYxBgJVK2OqUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTNqbbtH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTNqbbtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675E01F000FF;
	Mon,  5 Oct 2026 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791197527;
	bh=ipPqkob72lwiICznw3iaHl72u9I6k7Y65KFgTyU2QgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTNqbbtHgn2jLjA5N+bUnuG27HQLJUe9z/ekE0529Np6+e3GFepNzzvDRoLdgll4F
	 McV6RhaHn/BhB2+Tq/HSopC0dXf8PS3A2A11a18B/Sum08aGXWO7XPD8Q2Yu1hFGNl
	 vnXk0VkSFT29P1tOfFJ07XJPa4kug53ZnWPiYxgsPKKC5fgY4Sf5pbCr6n9waEQRhj
	 0jx/BaNQ5NoSHLHkCjg97ML4Na5gJF6/PwpJoAKHiSJBp8YhG7jrYd8HNXxL0U+jUL
	 /yllv2twSEXc0l88sIWJpsrAXDXqAdw0Ro+5TRww3Zfb7Ie3Z2AeYuWdiaK8MgxfFM
	 moqiLUI7GuyOw==
Date: Mon, 5 Oct 2026 11:52:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
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
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: bridge: Add THine
 THC63LVD827
Message-ID: <asOBT9BYUHgtZHSl@squawk>
References: <20261005095006.20290-1-francesco@dolcini.it>
 <20261005095006.20290-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="of/0ohSULi3F3TqY"
Content-Disposition: inline
In-Reply-To: <20261005095006.20290-2-francesco@dolcini.it>

--of/0ohSULi3F3TqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--of/0ohSULi3F3TqY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasOBTwAKCRB4tDGHoIJi
0rwdAQDSpi5tpG2Muex4r3hjnkzBTH62ffvgnRxZL0zgijNWjQD/XndwmNAxYG0X
KdwDCKu4GpfeSUX1Vk+ZZN6d9WCobwc=
=a/zt
-----END PGP SIGNATURE-----

--of/0ohSULi3F3TqY--

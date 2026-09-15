Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43633ED3CA;
	Tue, 15 Sep 2026 16:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489866; cv=none; b=E5citORQQ/dg6lSujg+GGNAmk+3jGwqYXjeK63wcOIpIg5dQLFgdbtwqRwczWw5cLHLql6VHklrhfhAyiExf7a0sds0TVWbqRiW43bmJObLFqut1yJofGd+MqUXNVOKaaN8yEgud4MPDQFxZPgw8X3abxgvkbCYlbfa78RWdKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489866; c=relaxed/simple;
	bh=30UYlP6ParRa63yvuM0w49yZOb2BNea0YJweSuIHhX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNqGla2RPe1WIHh9NniKZNBPg7GsSX9xrqBHqyXfw1S7QAw43YxXhYcZKciqqxvOiRQlEx+ciyKj3glooNqVlM6Xcq+XMl8tRrZLf6ylQXTYoejIUSyzaz++ZXEIJ8PBGJk/41/jFh9uq6bimwwUtrFsDyGkdGV99fWAHPok9KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPoFbpjb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPoFbpjb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83601F000FF;
	Tue, 15 Sep 2026 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489865;
	bh=30UYlP6ParRa63yvuM0w49yZOb2BNea0YJweSuIHhX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EPoFbpjbWI0XwVX+rUVSVSPZDxH0pycoeOaWxL9/AY4ZMDNrsCP0MTpUOCPVmkcwu
	 kgsHAgYW4xOK1DG+Yko42BmWmLsqTz71xb1Geo0DSVFr3MGo2PL+UXxZqL+XzCPpuk
	 Iuq9wIri+XjvmiQadc6Ef6CLMchqBWoXoW9KCssZ9rC4b0GEBkPnfHR2bWSoYJIBW7
	 D6qLppbaGqC+zAf2qmShKh04JNRyF+fiRCPBHwtRha9aaedUd7y4yjYuVsegm8X9gR
	 841Co+GNp+ezvcsCmZpwn50nYsjfVQQInCLq+HixkWDHk6EKqRNr2ssFKN0JCF912H
	 I+5Y0BGnx0gcQ==
Date: Tue, 15 Sep 2026 17:31:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: add rockchip rk3576 vicap
Message-ID: <20260915-quintet-illusive-1f3d62aefc1e@spud>
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
 <20260915-vicap-rk3576-v1-1-d3f5eb58a0b5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ECQ4r30L3EqSEGAN"
Content-Disposition: inline
In-Reply-To: <20260915-vicap-rk3576-v1-1-d3f5eb58a0b5@gmail.com>

--ECQ4r30L3EqSEGAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ECQ4r30L3EqSEGAN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqlyxAAKCRB4tDGHoIJi
0m7dAQDXJxd4JSFc5q9RF6cxkSGcV5doptDh9Eud28cv+bPggQD9Fu6L0SRFRN9P
Z+/i8kFwYIMibSdSHhK+gHP0w+qDEwA=
=WxqE
-----END PGP SIGNATURE-----

--ECQ4r30L3EqSEGAN--

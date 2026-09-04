Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB704EBAE2;
	Fri,  4 Sep 2026 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534709; cv=none; b=BIrnnFx7IVbMo/8MSRqRHL9Tv8XHPhR+xwxXqdiDkQlBcLR3y4mCCmPXCAjHos8CJao689NF6QeBdyTs4PipoKC4ZB0vD8YOIez03RzJn35h4megk1bdX1P6vabgkMN6n5ZwxBvrrnocbNEwbvOAhs7L0doqHHXAqYJkuBHCbYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534709; c=relaxed/simple;
	bh=qPHCUu5a2yf5C1W6Uxw41KWNe1W+GCT2LpAs64i2nNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DatAZyqCLNaRGNMC3GYeNdqqGXpi+7knWmjMAC9sSbnLOMUWxkCW/vmlWo4ho0mmXviuNYzzSbB7Y/ewLs99l34h2cmC+agFEXq2Lk0mrJoD7X+Lq2GXw7upj6blKDxWXUJibpEfHiMaqPrl+Zju+x9xWbuj6XaTVwI0I+/8A3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irx8WTn+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irx8WTn+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ABF1F00A3D;
	Fri,  4 Sep 2026 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788534707;
	bh=qPHCUu5a2yf5C1W6Uxw41KWNe1W+GCT2LpAs64i2nNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=irx8WTn+Ue7miHSWHIbCAeyaw/+qn2fhNRrrjCGrDAnYRpp+prJQlQtEeDx2xVKgu
	 FzoHUnjezBp4YuNO4dDa/ESNYDPF/NyWsp9Dfqz4Y9EbgokqDMLGJ04oclD4vSUDYf
	 N6SryFQKbVhjWp3Oht9QF5+c+LuxZaBzVvUO1XSQl+qMl2wghpgGh5zYs7hE2udAJx
	 TVurgm1agAdsX0aFFFW9aD20qWreYybyXguvyLDxqPKoEICN6GOUVBpCrNlAKmDHFw
	 huJi5AoY7ooD8CfwmKOfFOAsnt2iv/mhlvfG6wl4sLpF0iK3yMTsJcGQtS3zhXMpm4
	 kebAe5WzCxwnA==
Date: Fri, 4 Sep 2026 16:11:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nuvoton: Add NuMaker compatible
Message-ID: <20260904-vastness-reformist-b28a326166ae@spud>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-1-30ce255a401f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IflJwt5/OHqS5Pxw"
Content-Disposition: inline
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-1-30ce255a401f@bootlin.com>

--IflJwt5/OHqS5Pxw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--IflJwt5/OHqS5Pxw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprfrQAKCRB4tDGHoIJi
0ohoAQDS5QLC2EVOH033EK0ak0gC8BMQhGIKYpXbYsEl2PqaBgD/cgJ7Zuhrzj8N
7+dkfbhhNuOQFiBiqtHyG7URJwwKxA0=
=XDBJ
-----END PGP SIGNATURE-----

--IflJwt5/OHqS5Pxw--

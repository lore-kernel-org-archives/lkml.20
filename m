Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4373E35C6A7;
	Sat,  3 Oct 2026 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791068878; cv=none; b=BZlcZYINq3pJ7av05AFj3fS8NCb7OpHWpGbpsNXNDIGZxLZh0cCxJKTZ1DhSZl11BXDaveVhNVBKigiybLmSgQVJdF57ew6w/IHZAtTmNvimfvyY+zy+vce/rYqP4MD0TJ5RO3hjfHgcjnDroIzB4op0QFycZBcxmjQgjttWg6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791068878; c=relaxed/simple;
	bh=BCRZKUPntkGKG7LvKmUVH/MSIROKVVaS4tMT+/t4bhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWMffuzWU+C9f0oKRAx4wDZI7pdt4jjEBbljvxgZnum+QkQOIo1e+1DGX2m+2+xVJ89G+NNja8/c8x2P47oNNFlvk8EO+hgUauQLKwFXuqeuBqOphjwIPeugpYUdgVjJl/t4w4WFNtP89zUkLKDnFznodWXqXsVNFtskk0KwusA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fB6Nou86; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fB6Nou86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79971F0089B;
	Sat,  3 Oct 2026 23:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791068876;
	bh=BCRZKUPntkGKG7LvKmUVH/MSIROKVVaS4tMT+/t4bhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fB6Nou86sTo0Ufb2hhOATM6/gt3LJ6MkRGF4GLqCDhSn60u01aDDZc/ie9/YmT/hS
	 ZhCEu7U2rmOIfMeaumVq5/qGw+1Xv44Af6t2c/HcxqS2P3NoRpXilth4B/wn9VHwIj
	 VVjBpnrCLnjQkNG+vKwKx9XD2JplPRjxcOj5+0Ifn+12psHQxW4trDyIWKGZ/AEzqx
	 b6EN9q1MQp7ozq24tLEvvPPbXd7vKefTtvm+F5vJ+7gDgV3LKVrU2jxorRpWjJyd78
	 Yd57zcz7s8gUDUqfI4F/G1kiwfRTnZ+L4hv7sVDB6YqgL+N8PI5+qLnwEtKsxg6kcO
	 HfoiWdGdhJqXA==
Date: Sun, 4 Oct 2026 00:07:52 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: reset: Drop obsolete STM32(MP1) RCC bindings
Message-ID: <20261004-scrounger-trimmer-53b614e82dd5@spud>
References: <20261002171412.2716314-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZTcMyPJsOKJ0uRQ9"
Content-Disposition: inline
In-Reply-To: <20261002171412.2716314-1-robh@kernel.org>

--ZTcMyPJsOKJ0uRQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ZTcMyPJsOKJ0uRQ9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasGKyAAKCRB4tDGHoIJi
0rgoAQD+RuZhh0rzm5NhA/IY6kF2ugzkzJwalBN1Qa4jAZ9WpgEA/W42PJ8IkRZ5
9nS2YJbcppBLRYniO032u/hfCUpxzQM=
=CHOp
-----END PGP SIGNATURE-----

--ZTcMyPJsOKJ0uRQ9--

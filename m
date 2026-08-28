Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC6C34A79D;
	Fri, 28 Aug 2026 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932320; cv=none; b=UWteEadpMAWEd2/c2n9DbG7CfR0z/XAfW6jGsdN99hFhoFcx0TdBWg68n99pyhbc/8nKGJ3fRKUzEjmwMNbI2CIr0JziEQOI9oPWlo/XbX0QZCHXYRJ0F6gfmlBXAODS3bnvBlxdCUgu0WwAWuxmIGq8abC5ydyRPO0Y0NRE28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932320; c=relaxed/simple;
	bh=rwoehGGBAhR0cagkpPRWd/9sXoKfT5de8DDZI2psrzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nP+BkaakYtCzESRxUy9aYGHfsg346w2rIK9Pb9dlzCy558ogUeE8kGyQn109QtvqQoA0SIJXojI6bEITf9nsTFp2BFN/hDSxbKsLQEQInLsk1mywqZwy/tieaFUkkN8RuCM4dlqmd9YkGGhEh3VPO7z0ykK+TpeLX2+UM4nI++Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYOIB0VV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYOIB0VV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB071F000E9;
	Fri, 28 Aug 2026 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932318;
	bh=rwoehGGBAhR0cagkpPRWd/9sXoKfT5de8DDZI2psrzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYOIB0VVHL879W4CZ+t6ZiPdxa00oVDK6k1Qp4kHhNNKKL3LOKMko+hY4KCBSxURn
	 GZRgjEdMfKk1K+J6u724ez/Ln24vGwRSI+dAbPcc523LlAMB4VJQEX3vFXSAmwdQV1
	 QzITqOV6jBFZx9CN6LYI+VPeY3Kk3Ovbx6MZ/Q3kCbkN7QD4rMPEl3jB9yFjPDn4pj
	 kETgi2Pmf3Tqhi3zLcBmAUcC3EsfVjMQ5fBUbb62R9Unqg5aguJvtl4nhdzJFquhvi
	 +8dgkia09fTEjt5TJbJUCc0MICC75IjL5ql0TxTKxhPGIc8R7grrLye5oxpzWpmC9Y
	 1HMod6uyozqkA==
Date: Fri, 28 Aug 2026 16:51:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: generic-ehci: Document ST
 STM32MP1 SoC compatibles
Message-ID: <20260828-frisk-mantra-08f44931ffd2@spud>
References: <20260828152130.176171-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SCyc/uFZ5vKiW8zS"
Content-Disposition: inline
In-Reply-To: <20260828152130.176171-1-marex@nabladev.com>

--SCyc/uFZ5vKiW8zS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SCyc/uFZ5vKiW8zS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapGumQAKCRB4tDGHoIJi
0h6ZAQDgyIwsLmoo0BKJh3n9Hrqwx3SjWARrWkEMMmEeISZDuQEA9dj8KZ2AT0Ui
O68HKHtNqAQW+EMjpxySCU5lMLFcmAo=
=m18u
-----END PGP SIGNATURE-----

--SCyc/uFZ5vKiW8zS--

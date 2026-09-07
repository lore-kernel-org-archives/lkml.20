Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B86235AC10;
	Mon,  7 Sep 2026 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802516; cv=none; b=Nd4qMMzOPOF8I7yq8ABCcLlK7XIwyji1haEmay1/0KxA5vG3INUyy1Da/RA5+wBZXmgxZfcPYvY0DJIBuY4ISvt9ZLHGPML7c9KUGfpWALbQuZLeDlA9cc7mlLjwEsXRUaOs4asqr6WJkvHkBLGriffbejYuZ+bXR0xm6ypuQ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802516; c=relaxed/simple;
	bh=YS2TdENoAkBSs68uAXBLssJx4TGpvPEoYo13GnkLfSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJ08YQsXl+af0j+FiEUMOtKMAFikJmGaHxM/JhVp8NGNR31WCrFXhofnJ5A+1nL3kw/+sVDf30MmyZdQgfXq6Vgm1xmjA3WJMrdxCXAR/xh70EV57nugB0YoE0tIFDMrI9W87uvVSXimXB+6aTuSoic8IoWPM23qfZi72o4k7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqf9OZdO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqf9OZdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185411F00A3A;
	Mon,  7 Sep 2026 17:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788802515;
	bh=YS2TdENoAkBSs68uAXBLssJx4TGpvPEoYo13GnkLfSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eqf9OZdOf7BNxrg1YEyyQKxpWYn74BKR3NjWLU0mTrZ3Jx3HvDUXmoM/b7U78X7rQ
	 R74O0RlSwnQQ37Ix3xz+pWDH2Yq15pQAa/7q6W7UZT3mwrR29uMQQVnmRcPpI46KoK
	 Egxqc7C61d3KJpfpWMi9JlDSuIGP1pYDMvb0UVftkKbhvFjBdUxttb61zkwiesYdia
	 niSbc8cSDdi/64syxlCEP6WGHndoPg/+8+lixW/WB/HaEqzoNd5Eydf2ZWE9BeZ2QE
	 vFSw8mP7mpoK0iL8pdQvNaAdeKE+LcW4MvVNOht9zazAYd3hIhLcE4wbcBBaVSATDm
	 fE+0YFuiCD9/A==
Date: Mon, 7 Sep 2026 18:35:11 +0100
From: Conor Dooley <conor@kernel.org>
To: HystericalDragons@proton.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	jensen <jensenhuang@friendlyarm.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
Message-ID: <20260907-skydiver-precise-a8166e576510@spud>
References: <20260905-r28s-upstream-v1-0-f68d5389269a@proton.me>
 <20260905-r28s-upstream-v1-1-f68d5389269a@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TzDQ4robxPUrjxZB"
Content-Disposition: inline
In-Reply-To: <20260905-r28s-upstream-v1-1-f68d5389269a@proton.me>

--TzDQ4robxPUrjxZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TzDQ4robxPUrjxZB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap71zwAKCRB4tDGHoIJi
0l3IAP9ldhaM0bKPJa+3pR2NXhPp8GBNkm5A4DzJj+I/8b2QEwD/RsOooxRq/Gtg
rDS+bDjKm/bt5Y+eOdqCqAI8j5UPngY=
=AxLq
-----END PGP SIGNATURE-----

--TzDQ4robxPUrjxZB--

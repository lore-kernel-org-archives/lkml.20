Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CDA3859E9;
	Mon, 12 Oct 2026 18:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831304; cv=none; b=B2XH9nYTLYfzb6Lpm86GvNF/LZhAp9Mf3P/cPjC9bgAalOsZQqkbEutQ/fZwsdA3eWMMPTVwqh/Uo3rIkMBFyeynbxZU2afJ0NPz/X7WJKk0ajFt0ZXsrH6HX2LY0yacBm0ThDhL1dP1VliwhkSBDj4nRj7KApnd5sEr5SfzwNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831304; c=relaxed/simple;
	bh=lsoi2vg2LB1YdOz216qy3fyKHo1xGtnZSa2C1EmzQQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0XCobojAwgoR+bErRioe0Wwe2Q/07+OuH63k/G4O8sCXQ+IRf9kdBf53ho/OUFdAM2pPYQGICJttSyVYY7V28OMvEXmBouohwvFqGk5c3rsWt/p3hvQsVZlut0fw2chAfNXzm9kKtQ/29ziXSGr0UoRlfOgXQlvW2ud8r8LZCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3ZZ6lS7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3ZZ6lS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E7C1F008A1;
	Mon, 12 Oct 2026 18:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831302;
	bh=lsoi2vg2LB1YdOz216qy3fyKHo1xGtnZSa2C1EmzQQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N3ZZ6lS7EyvdRhDCSwPisPwBsfZDf2U/cgYy+PvafbsVnw+LlKjg0ZUagkVZwZD8x
	 tI9jNpHjsNM78BddwlUemK9w35pF5YQa2i7hTRy1ifBOgubuR0aGVvZ1TosSpnTXyK
	 39GAMsCQZnmBA1siaIrn9LTc+9nk+Pg/I4xieWN1PL0AGWNp0MI613afthXKXiTuq7
	 5B7Pjyy00/y0beE/3uIzUxHZdTYn7nf9L+OxxVg9emSgGzUZkYiKdH02aNYixp5gw0
	 bceU4cUVi6vW6jm4PWx1y67uj83qgIw4/x4dRSYlk6OevQ2E352Cz/buYJHTwBfNIv
	 fFH3BbjZ+LYNQ==
Date: Mon, 12 Oct 2026 19:54:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Miotsuki Mizuno <founder@crepuse.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"jesszhan0024@gmail.com" <jesszhan0024@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"noralf@tronnes.org" <noralf@tronnes.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-mipi-dbi-spi: Add
 UNIHIKER M10 display
Message-ID: <20261012-brunch-mocker-348f76eb943b@spud>
References: <20261012121718.53481-1-founder@crepuse.com>
 <20261012121718.53481-2-founder@crepuse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l0Q0H+qNTOU6/PQ9"
Content-Disposition: inline
In-Reply-To: <20261012121718.53481-2-founder@crepuse.com>

--l0Q0H+qNTOU6/PQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l0Q0H+qNTOU6/PQ9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0tAQAKCRB4tDGHoIJi
0kRKAPwKrVSpWbI+CrbQHAuW1z8jJHJOJ2kY7Fd65yZXVaWM/gD+MGhjR/tpHAvV
hoMubh6PI1wdQ4Mso389MlLQbINTdAc=
=CDyY
-----END PGP SIGNATURE-----

--l0Q0H+qNTOU6/PQ9--

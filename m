Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A84A4998;
	Thu, 24 Sep 2026 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268960; cv=none; b=HGZg44rcu0mRxozSfg2rzw0j5Sbt72gwEjFXeQJAf1zlwAFDut9Zh2Hh78TC6cU6uGgniKwb/IcNtzWCWoA6+yBmEIlOEzPcaBpomkpJ3Hsth1D7GNuN8hO9j5yQJcIWhcVE9s/yt5K3d9eYIO1+6lV/r23FhL7W8zFNpYx9KG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268960; c=relaxed/simple;
	bh=knCgROcnmYPoEvjcB+VjyGP1+q5+TmXLiv1n07EqMTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7NlHMxgL6zClI/HjjcHzBoPrVbHvBhBJTo1OpqTDYxYamX/HnVBljcSJv+N0LG7ScCmvycbkeCLpg5UZyLLUwQMsVq0S9SAbhlNADp1SSeuTnX1lpPy8nhjGA/BVrAc3ZZiUbuYnER6jBNWz4qtJ/h6pfFo4oWvPs3l47LU5N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIVK7rBh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIVK7rBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C611F000FF;
	Thu, 24 Sep 2026 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790268958;
	bh=knCgROcnmYPoEvjcB+VjyGP1+q5+TmXLiv1n07EqMTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZIVK7rBh94LqoK68n9muax1NpkbLgNi1sDQMPepKEBYoLyu9S3IKEChTI2Jh/eVMa
	 G6bR/o/0/T86xkGOA1sVl7sYc8chgUZ+tpf8rtSBk42eYlYNQ23equSWhyHJ4MtBU7
	 +Jqf50mJixFL8z+QFAdRmduv5eMOU4tErxBFIklgTD/C4VteDXfpf9UZrK7OL0yngs
	 vPzFenZe9ODLN2RHpECOmaKkVn2gzhyeVK5fjCRr/pB33LGSqI6/Pv7/RUitRe6feQ
	 UEXpb7HlEDzM1UoOg2ggfabCqWmmy254YFJ4R7IBPQxPf9QhDY7h/NI1NwMPCs2CKn
	 zB69wCFPsx0ng==
Date: Thu, 24 Sep 2026 17:55:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] dt-bindings: media: snps,dw-hdmi-rx: add a port
 for a bridge in front
Message-ID: <20260924-viewer-ambiguity-478a51a69b7d@spud>
References: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
 <20260924-hdmirx-media-v2-3-c12f641d8b0f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZB6G31kz7F672vMQ"
Content-Disposition: inline
In-Reply-To: <20260924-hdmirx-media-v2-3-c12f641d8b0f@pengutronix.de>

--ZB6G31kz7F672vMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ZB6G31kz7F672vMQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVWGgAKCRB4tDGHoIJi
0gxlAPsFfzDQje8u65RJczq9q2EpOFtIwd5KKW2/28m7XZr9iQD+JYgSJH1aPgd8
Wyf3LDB34OiVfX+p4x26PkIM4RXOAgI=
=HLBQ
-----END PGP SIGNATURE-----

--ZB6G31kz7F672vMQ--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31AC493D4E;
	Wed,  7 Oct 2026 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369474; cv=none; b=CDUBkXztWwQfATrdsrKnueDm50MlrzOByvevYL/yXWI19j3aOJaZ2jTewT8oY3aHZd5Qhd5GnKXtC085HVRIMKoFgpr5sFqM6aakPPMFJYD82NepjXn/4ry+W4/tGpa9qwm0wTiqxanqG+QVyPSIdANQ6OaGTR3QU2VhfXkEVIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369474; c=relaxed/simple;
	bh=9oD6SiM7hwS4mmlcxsA+n0Q5aV3xxpYmE/umyOd2pGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZeEI0nH8iVsbwetTraUftC36sCbn7hCnOqiBbIXAHYVeBx+AIay6h4G8ES3ui5RFOWm0lDBZOarEffW42entBWqn1rYiZKqlbTVA1EBxGuCyk+Ru3FlAo1UGe+/reCBKJ9Zrfk6RLVArAImoLq/JAVF0ldaWw+e1u8UwCouvGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pcsj1r22; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pcsj1r22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338281F0089B;
	Wed,  7 Oct 2026 10:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369440;
	bh=9oD6SiM7hwS4mmlcxsA+n0Q5aV3xxpYmE/umyOd2pGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pcsj1r225lp8sruvb80qUYye2yRgjpOzsXpMGfe5MT6Htxc9NcBJyfJHhzK5UMAb+
	 wqp3byxyY+UM/90i6fdFmSJ28wZb0IKmGoM/bsqGVbQa5I3osAdcwsSHjvZLX7Rmzt
	 Ef760I7K4LbvZrGzIvJvG9WATPgVDeNH6a5v6hlRJmgTyhc8Jvu4V66sdPYVOueB85
	 Cxzxhv99kcP7rr5rtEMdvAJiCkTDuEg1iL+K8tu3+jJD+Co6O6SFYfZvhwPYDY7tJ+
	 8cLe5EzOEK+V8Kstc6bLmnXsNFg4Vph0i1BCxE6Hdp+rb4DQaxqnYWCyqwIsW4437H
	 5Y7kVsnbc3v4w==
Date: Wed, 7 Oct 2026 11:37:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: i3c: Add Synaptics sl2610 i3c
Message-ID: <20261007-598c73d6eb56707384cc7bea@squawk>
References: <20261005152425.25319-1-jszhang@kernel.org>
 <20261005152425.25319-4-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knpgiYXBDiWCdQ9M"
Content-Disposition: inline
In-Reply-To: <20261005152425.25319-4-jszhang@kernel.org>

--knpgiYXBDiWCdQ9M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--knpgiYXBDiWCdQ9M
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYg2wAKCRB4tDGHoIJi
0sXmAP98KtEARVi+lXJKBYwfALrNieJYNUSQmj9A09/7o5SCJQEAziQGIGvxEaHm
bCGTqpG/tsLMpvnooIo3xHpFlPk9MAc=
=WnUy
-----END PGP SIGNATURE-----

--knpgiYXBDiWCdQ9M--

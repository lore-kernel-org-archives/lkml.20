Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4830F4D09FA;
	Fri, 25 Sep 2026 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354748; cv=none; b=ZbFg1s+0EB3ariU6G2QUJh6BXAkXPHdwytD6inTW7duFAO8vme7ExtJdh/E7VHQs9jqpYn+okalhG5V124U/8myTd5ORfuWnIFhaZp2HNzUp4IaprW31X29w15+4dL0cgnb865HmDAWfY9HgHLrxD4XQ1YvfLBl69N7l8IMAItQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354748; c=relaxed/simple;
	bh=pTeDDUYpVGe7M/61OjeKHsRil0i2u7a0iXfAqfC2qDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGR25AfmNE7ldpPM93X8w3ohspJU9W1rStEwbDBvbwTwBJ+v/13Sfj/D4tEhmOzRDiGZz1HKEX8pjwb4cMM1OJTkx06Sc9QZHoBxrJvv/6Scfpr3w1USOltC4jQMZvrMWLF6a5D0PeA7L/yCFs3AFyrkdQ89//mk142NQa6+i6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTVAVS87; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTVAVS87"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B8B1F000FF;
	Fri, 25 Sep 2026 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354737;
	bh=pTeDDUYpVGe7M/61OjeKHsRil0i2u7a0iXfAqfC2qDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTVAVS87PFDNYO1ihtNP9LhEW+E5VsAWvO15oeNSOqN8zMkavdxNPpTI8Ak5R8kUZ
	 LXuYJ9KTf2lrQExbq4AGaniedsqj2Up1kF88ad57rB0LGsemzEr4g6/djkPkRovKNQ
	 h99cueIy/iKxxNBICwLYivMbsjaxlbVz8ify8P4w2beydZopnDF4uAmrWC/FTPWnSL
	 iAcdBDUXOucYC0+AmkXIb0U7nim12ZYm7MCBmwiOUHA6OO5GPjioLrtoFTci7f60T6
	 I8P/rW4M485REn5bzDMZGyrUccfRDkmRqf0f6FBgl7jRa0QhdRcZ3QF58H/pPtBDa6
	 oqD77b+8s2mAw==
Date: Fri, 25 Sep 2026 17:45:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v4 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Message-ID: <20260925-bacon-uncured-cc89ab761efa@spud>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
 <20260925085152.41852-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gH3REXVqU2jdjW7C"
Content-Disposition: inline
In-Reply-To: <20260925085152.41852-3-benjamin.gaignard@collabora.com>

--gH3REXVqU2jdjW7C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--gH3REXVqU2jdjW7C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaralLAAKCRB4tDGHoIJi
0plnAP9LM8rGrHulmmHoWd/deDQf6tr9Q5c0S3hW774fYhioYAEArVyQqqAcGZiu
1nqADdmsPGJOoGQ990oWI81L6sOoqgo=
=EY5o
-----END PGP SIGNATURE-----

--gH3REXVqU2jdjW7C--

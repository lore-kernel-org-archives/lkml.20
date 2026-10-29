Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299291;
	b=0Cun+gvV0CJlTM6U+3cqJVCkU+D++MV3KkoJmCauq/ZnyZb/ZtQbfFGaVQm7EBPIbI/d
	 w+lQ2Ro0w7E+SwevlAtJfvvqin5NLX7WE0Wp2kBkraa2zi5/SZxZNsAif3rcjwqHJQk52
	 BjMPkhji3W51appR06aEk8h8pYjV4Anrlq7rwJC+x+A0PUK9iI8lD9bTB5L+hu92bKKKE
	 JEdtHHkGMKxvbdUGIK00+8ZoNWM/61Ia/+j2oE1lNSjetBQdKlPdb5XxNy4NNBONAD9cl
	 /bHGhwQ0bNRkQdHTXjCguWnroAj7KbYVyvSO+6lPHs4rbPdKPVsThghHMraz5aaMlvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299291;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zpRsAkKQVWWJ/+Mql7jkijG3yP3y7gKf7aBhHwE9MJo=;
	b=r3C+mG95LVOePgkXTPrMEtjQqmMjRquLKHXsBtiWwLxDOn2Ycp3rllLu3TU7SPNZxjJc
	 Zdi0F8LbxwsxUxNYaaKqGQYi0tDuMmNEHSy9nQLx+5C47nluZhslpKwSiRuSzFHbgL9Ry
	 RpYTCDOu4xD/SIgBMBCavbgdCsx30IEni6Z1lPtO+V15qTFPD/8nLj7fmVcatoJKizKmq
	 qWKgvWqWOPTeMxunY91JPqyGnVoZjoi8FdyANQDbCSg2s96j8vwmBZD7xZrgmpQXR5tWx
	 eDWAchfIRWIXSSCw4yyOWkiwiP7TrI+j1gUhx1OPd0WcA9wxFzx8M+WIsanHw1YST4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6gYc63H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC7A606A31D;
	Thu, 29 Oct 2026 18:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6gYc63H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060431F01816;
	Thu, 29 Oct 2026 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793299290;
	bh=zpRsAkKQVWWJ/+Mql7jkijG3yP3y7gKf7aBhHwE9MJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P6gYc63HgsT8RGoutLLETMuoHFirUR7/fEKw0SCuMPLycAOuk8It+tEb1qNSqlrVP
	 pyUxzDs7Ea8GVcFART5vqpwaHwyehVBm22PXENpALPR8l7KhpN2nZH/QDBrRX55Pb1
	 WxK2g3/16z626/iauOBtpIEAJf3Yaw4kpp0tbFcZwSnvziYwuFkN9/xey23/e39bld
	 gS8WYN38JV90vPyJq0gwvre8iSSC5piTUDBth5v5qV/8fneGKRViowxmrExXo4xssx
	 EMcuw3kQtKxeQ7dvdLzrKeK9Eds24QlWeDv9xN70BuSWX7imYxv+PMbvuPE8sbmLXJ
	 VKba+M81Y/UOA==
Date: Thu, 29 Oct 2026 18:41:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Lachlan Michael <lachlan.michael@sony.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
	Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com,
	Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Message-ID: <20261029-distress-stimulant-cd5bb18f5ae8@spud>
References: <20261029050002.3880-1-lachlan.michael@sony.com>
 <20261029050002.3880-2-lachlan.michael@sony.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ejNRpVw4Q2PVa/g"
Content-Disposition: inline
In-Reply-To: <20261029050002.3880-2-lachlan.michael@sony.com>

--/ejNRpVw4Q2PVa/g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 02:00:01PM +0900, Lachlan Michael wrote:
> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
> over 2 or 4 data lanes.
>=20
> Add device tree bindings for the sensor.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Conor Dooley <conor@kernel.org>

This is not the tag I provided, I never provide tags using this email
address. Tags must be used without modification.
https://lore.kernel.org/all/20260828-hedging-olive-eaea0b4027a0@spud/


Cheers,
Conor.

--/ejNRpVw4Q2PVa/g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOTVAAKCRB4tDGHoIJi
0qjoAP9qdbwsWjlo5EEBa5G40hfpB+13ddsR41Lu+t50a4y6zQD+INbrg21hcO5g
Z3lNI2Im38qBSvXoFL9uIXtAmhvCZAI=
=FNgY
-----END PGP SIGNATURE-----

--/ejNRpVw4Q2PVa/g--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884EF357CF8;
	Wed, 26 Aug 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761130; cv=none; b=T3NrUpSD2D9qqYLyG3YBvNacrVLtIv9PTldxGKkYy4QlTmc+vbhpPNCsQx2rAmZxnZH/xKmwbFaqUXj3ReZFtGxdYA8RUK1pt6EdAFgr7AP6W1p8PKek5Qn5O0akFlz0yqJV1fnLaYq/a4yRQYDNg7Mk9DxYqj9zHUzxD5S/hk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761130; c=relaxed/simple;
	bh=UkQzmfhiFZsMxRF9Cb3MCLGs1cVtJ4PnTkFGQmnTaxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORrLg4ZCXYa59UqqtmVvJYxkAVIlsY2hu5Xe82ra7HZR2C0/nmLg7rF3QZg07y1SEIgXmeUDES8hZte4klLVOz5YWnoUjSGXYk7GPR8cP6aayvb94XtveFB+9VBy9JtlDj+M8J8tQ7nnxdR8+R7NSDdWaOQsugC117J7HcdbUuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5dWDGww; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5dWDGww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4811B1F000E9;
	Wed, 26 Aug 2026 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787761129;
	bh=UkQzmfhiFZsMxRF9Cb3MCLGs1cVtJ4PnTkFGQmnTaxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A5dWDGwwf4wzryBtm8finbJPqUfCar3ieVla0jpTFxCO16gNA4V8BjMkBHF/V6wb8
	 vDTIHka7cxtkCoUlLDyhjcxWiCTJmeBQhvYhsehYPfX4ETZBdhhxTrm22G08t7BNxJ
	 dgWrhB15FXa0pxJbSegP5FBO/RrJHx9zznjqLhqLEIqA+kffD9mwwMfg+Bwv7cWrnz
	 sTZX5zZJaCpMhYAgOzhow7hFkmBViSMKpAxGITd0YM9eE0X4C8UoeH6lb4lKO0R4lC
	 xsC01ncV+yc2+zauQfL4fyhkSVa/UsBZvUel6JR7i+vxNIaPJ/90+3gItD9Ctd1FcQ
	 TgEhpeUSZwqgw==
Date: Wed, 26 Aug 2026 17:18:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Message-ID: <20260826-chief-constant-cac08f294cb0@spud>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
 <20260826-isi_imx952-v1-3-cbfaaa3f0000@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NoOQJ3UMHdED26Zq"
Content-Disposition: inline
In-Reply-To: <20260826-isi_imx952-v1-3-cbfaaa3f0000@oss.nxp.com>

--NoOQJ3UMHdED26Zq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 12:55:44PM +0800, Guoniu Zhou wrote:
> The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
> primarily addressing RAW data alignment. The core functionality
> remains identical, so the i.MX952 ISI shares the same DT binding
> constraints as the i.MX95 ISI.
>=20
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

pw-bot: changes-requested
(See driver re fallback)

--NoOQJ3UMHdED26Zq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8R5AAKCRB4tDGHoIJi
0kLWAQCiCZUrIRfhrpLA0m+ZMq608jz7v48VMGIeNjfPdnKWBQD/cSfuQwfSySEo
MfhBPakmQDsiMCK+tW2gZmqy0zgJdwc=
=rnvV
-----END PGP SIGNATURE-----

--NoOQJ3UMHdED26Zq--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5448343C043;
	Mon, 31 Aug 2026 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192485; cv=none; b=DYrLHlMz4KU6NSIpFTUBdvxgZIU6dLJOUxlScHiqlpKSsb3cQX216VzX2r+hykwqBW1fHqQ21SqQaJzFmQ30E9b5Te3V0AUMmvtTtExmsN5ePjR6i2G/JBoMNvKWYWm0EvRMGOgt1RJAT0UyjgbYYEVXa07dK+pWfBkxtohR9dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192485; c=relaxed/simple;
	bh=3Vynq3eyR9D6otlOg1mCxMi4f6PjR1A45mbH0owAWkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYeKRHd2H7MffOv1so9rjTnypFLQiZd+QKtp8fDpXyPEWq8KlNPq+frDgoJO54aG1rJ//tBv8f6UIAP7jIEzqes+HBa4IFpX3MxJ7AXEbSAxtNs4MU1+ScCH6TzrkJ/lwgqnm9Oiiln14KBQTmev3qifEt9ggMV1njw5gYNjThg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvJj6/3a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvJj6/3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE6E1F00A3E;
	Mon, 31 Aug 2026 16:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192484;
	bh=3Vynq3eyR9D6otlOg1mCxMi4f6PjR1A45mbH0owAWkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IvJj6/3aqBrI/QT35/fpcVZRyOfWItH0VXOAoZZ6GqV4XsstFm0+dp7If9yxbTH1B
	 njAzDPqL2TcX7bJ+zRiFgmjX+lhmsbGzeEU2g33IprSQsxpd4IELWiHZqsruYG1iaW
	 2VW9UHnSw5JQ9tRK/0AKbpJNHXuSYD/9Rfcz9R0OwklldWttlaHk47X6QaxV2Dg+Bb
	 wvuXilK2kjdTj+gaXRlWttu6hnIzQrZjS6DE9sWAugAwVGTQHpr/qoa2+sUHkHHx2/
	 QobotARceuOkaJP94FXYGEEcJWVLw1VRe7tsJm8s/A+02Yp9UPfvIqlXx0xMRBRwv1
	 CPigM4OsfJSZQ==
Date: Mon, 31 Aug 2026 17:07:59 +0100
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
Subject: Re: [PATCH v2 4/6] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Message-ID: <20260831-pushchair-empirical-034396da2f0e@spud>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pwXx4DOOFbxIx9RZ"
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>

--pwXx4DOOFbxIx9RZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--pwXx4DOOFbxIx9RZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWm3wAKCRB4tDGHoIJi
0ou7AQCfQdXvM1TibmA0/BN+SjYPRIakJo2dh19uu/ch4xXz/QD9F4AbjzK2IupS
KOH1B7ezgchdWNPN3EfZ2Jt3qde19wQ=
=G8I8
-----END PGP SIGNATURE-----

--pwXx4DOOFbxIx9RZ--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986668;
	b=42SG5GdF5GrQ6PvszbXS42qDpR8NRATZbpip8Zv5Ct75hHGSobLvGdFbhD+AhTl4k4n8
	 HwpFogm/uhx+zAOy/wUdvXQXkPYllk2vzxvXYSGmxF7wTtBOgjl7p3AYibFd5duP4Zvs7
	 GgoRT12eaWoPbqZrz4iYRM0VXoPUW42ykRsP4bH5Z4lGk19MN2yVl6quF3NPw/W1ozz1M
	 RSR7GAIYPXoqT+ucBCVN4nxzlI0+wwQxvylgSfzgKf0xsFnoFVPFYG4jXrpdijK0R+G/o
	 4UBBm0YeHTkcwXNnjPIfg/6PE+KuqfOkOp+Yo7J07DOysXT7HUA7IlFXgXzbLQ9/pAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986668;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gzXUUp+3kGXCL2KE4Dw9AAUPV/Re3Wk69iRm3DbCkyo=;
	b=e1cJh9dsCrBGg7KG9Y6ZqQgJS1BeO4Tt2intUGEcIRQois/jKBEHs7MCrRT6K8d2/biU
	 DASEJZG6AJBh1Y/P2jIBlutBfbhCnMBAMqUIWuFzMVHXN0o828EoJclXxHXur49UCHEjT
	 aGpmXm4hoioTy/uEFVYaivoAsKEfJtfipBerYmKoo+DBK3G7qtCQr8RduliP4iPAd4BER
	 kcKQ3GQPUxQGK0FU6ygBwPSL/25Teu6xQLvu/6ImUKZn1TGvQT3Kxnke7Ktr2UrDKrbiP
	 yVUAR2JqPvAn7i7Sj6s7EYodwRjXEJ2tKMWLe0t+YrYVQ0mHnwT9K1qih27Lem/ccJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O83jgpIh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA4606A331;
	Fri,  6 Nov 2026 17:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O83jgpIh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8895E1F0089F;
	Fri,  6 Nov 2026 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986667;
	bh=gzXUUp+3kGXCL2KE4Dw9AAUPV/Re3Wk69iRm3DbCkyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O83jgpIhzzEHm/1SdA1olTRMRaDxmsP1ThiOE0mx5MfOzyJycbPWGBZP0ay0GJZHl
	 4mJPDcjr4ShzQWmb3O9H8tuDW7FvjdV5wJtPqduJFtkY6Fi/K1T+z7NO+NcIAxKfxO
	 yZrG1Y4qJ4cCR3Mba1fo5L8y1gYjtXgynoDubpib8Xc66UJJb5DibAJCUN0p9Ealkj
	 r/qZmvV2gKExI/3wsBtSvDou98UlQHG7wYaasg3EDBpg/SgooMXH8mLP/Zb6hCc4v0
	 MEKCSMDqk7COOIDUcgvWMtUJE5w8v/XoF18GFIc2RZ+0ZN4JauHhrLDBrNmKrlM65U
	 pU+cblhjJpjHQ==
Date: Fri, 6 Nov 2026 17:37:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Message-ID: <20261106-cartload-percent-138747dcd4ad@spud>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-2-duge1256@gmail.com>
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
	protocol="application/pgp-signature"; boundary="Ee509AZx53jUEgBj"
Content-Disposition: inline
In-Reply-To: <20261106060525.346873-2-duge1256@gmail.com>

--Ee509AZx53jUEgBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Ee509AZx53jUEgBj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4QZgAKCRB4tDGHoIJi
0jyOAPi8fHRhLGVqM182Gzy3UpQvIry4Uqap4X2Fotqw5kA7AQCwcUH4NOyFCqIf
ggKPhUszL9Fc0yu8kWw4SOYoDjz/AA==
=q0C3
-----END PGP SIGNATURE-----

--Ee509AZx53jUEgBj--

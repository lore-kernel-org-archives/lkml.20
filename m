Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D3311C32;
	Fri,  2 Oct 2026 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959796; cv=none; b=Orkj17HZL51pfBwGcL0TMSufKWONL+cUd0lEjc/UPxf1ODEHzCra4Hn4k2ih22luzIU3K8bvWhOJqJtXYO6R2N/nsaCFZnRDQ14GGyzjmmXRrmpe9HrQs8s4f84Esb5EXdVcds0BnJ8BEcTSd4RZCZIoE704rBs6OqdvuNx1wt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959796; c=relaxed/simple;
	bh=G4Okv/x23FhMBO+/B4ePTthjPHwfFGhVSGVX7+s/ZjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9wIiKNeRVO4g5fhB4F42/fudoXd1+osEPsewJqRjW4VIKyMr2wrm8jaXGRAI51CNE0AwXojzshoO48s5PgIpRcQzRAjDfc4bl0ZXGm7lRYeAkWPdjfj7GXZRE+2DcwIu6qWWwMZUaSKYlAZV6EtuSLx1DWwGbd1FRCB6Dm9a/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg1/XsmH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg1/XsmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090451F000FF;
	Fri,  2 Oct 2026 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959795;
	bh=G4Okv/x23FhMBO+/B4ePTthjPHwfFGhVSGVX7+s/ZjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pg1/XsmH+d7+eadQzhCsTS14MyZB0vy59qclPJJTU4WgGv16P3mCCvHo/J174itvs
	 mqzwfToYZWbUWXUAGRyV3epwz8jH3Acxe7u4metvBbIVZIyaCHCcZV5WTs2HbfUKWl
	 1GZfro2ueNhfICQoecgbgIvZFSpLkla02UF/h0uBgeB7GTiPQdNqJ0dt9fsYtdqZ2w
	 rGN0zsMno/X5yZP+dZidbua5GaxtAEOU4TiD7oMHccZORRVMpQN1tYAEg2Zg60aW5y
	 JcpXA9hOdogzBHU8a2xWRdp8FbhYqFzidHp6le9tzZiAO2U71BYbG3lJTUIdPF9b/S
	 vYiylgJJEcjyQ==
Date: Fri, 2 Oct 2026 17:49:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: keystone: ti,sci: Correct reg and
 mboxes constraints
Message-ID: <20261002-plow-paternity-f059f34024e8@spud>
References: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m/DhfOejCnplycPG"
Content-Disposition: inline
In-Reply-To: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>

--m/DhfOejCnplycPG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--m/DhfOejCnplycPG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/grgAKCRB4tDGHoIJi
0jR6AP0ZIXTgdFOaUkqfMyferOijuBekqN5LahEr8tjbq1HdNAD8DAhmGCYmXi4a
xPcbVbSWan+n4jGfKCFnBIaiFzym3AY=
=OBEL
-----END PGP SIGNATURE-----

--m/DhfOejCnplycPG--

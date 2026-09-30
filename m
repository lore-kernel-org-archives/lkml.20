Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6794EF12D;
	Wed, 30 Sep 2026 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803033; cv=none; b=jaRyYfA9jxMZKh9moxF0+HSedHArNPJj3VN5MaUUFqZSFuf2uIlTBf3dI1+6F79yzvQNHCuMmuv9KrLABBp1FG7yhluMCwxLdR+vkiCQdK3+nL66c0fr6JkEDthFli2DbQShqxPZJeStzLGVyST1UtIptOhFxYrKrM1t4bgJuPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803033; c=relaxed/simple;
	bh=Yv/LaZ1whxrUp6YSWe41x94vw9lASl7zfoOEpzB4kT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNYeokcgGVvtpyY5J+jO7qmz76m12t8utMQ/8AbA8auhCoWI010rkReuQ12Cjd0uztlk3eHlNiZBnI/TEMrfW47d/yh/YbEp6YfYo9eThiwiZTKeENy5Dq3zqU35iYLUvavnXb0P2zFSVSdpwLbe76y9kWBohtj0/Proe+VgY/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cn8r49hX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cn8r49hX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D941F000FF;
	Wed, 30 Sep 2026 21:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790803032;
	bh=Yv/LaZ1whxrUp6YSWe41x94vw9lASl7zfoOEpzB4kT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cn8r49hXSE5h9zDEuG9m5pTebjggbe10rHZnrmuQSuG6rW63VshomJknZ/R1fyW+G
	 wxiThwcjJ5xJ2SMVzZL7ctJu+c6X0qSV9N+YNwcQdPGFS22pjhq6pdVah3q2Cu+wuP
	 iu7MffNplQCAOxaGadbADxybOBpwRh6x9lSk7DtD4ZB70HF2agNa7ktQC2FmcFulbw
	 RresuIGjiUdAJNnFW7I9Kl52JZGisT7tljTGOES4URzhvGuWJ8AUiFL0dRDDfEBOz+
	 n5m2zNlw5qLq+XY1MKhIrd3yO72ootpKF8LiHHJu23MaCAKpV/YDS6Q+zwLsxUGWQv
	 aTLrXMADoo82w==
Date: Wed, 30 Sep 2026 22:17:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: jassisinghbrar@gmail.com, nm@ti.com, afd@ti.com, u-kumar1@ti.com,
	linux-kernel@vger.kernel.org, vigneshr@ti.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: ti,secure-proxy: Add TDA54
 variant compatible
Message-ID: <20260930-poison-lapdog-9dea8dbedcfb@spud>
References: <20260930172948.2901336-1-b-padhi@ti.com>
 <20260930172948.2901336-2-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7nacEQ+HAcE6wkSf"
Content-Disposition: inline
In-Reply-To: <20260930172948.2901336-2-b-padhi@ti.com>

--7nacEQ+HAcE6wkSf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--7nacEQ+HAcE6wkSf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar18UwAKCRB4tDGHoIJi
0hW+AQCgvh4KaC5rcaRwyc72Y90pEFuQ6RuALUSXNrCa89LShwEA+HBDZsv5v/JS
V6J25TGyrro60BmXE7yAVDIQ09z5EAE=
=0dxY
-----END PGP SIGNATURE-----

--7nacEQ+HAcE6wkSf--

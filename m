Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC394CF468;
	Sun, 18 Oct 2026 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792349717; cv=none; b=Dd/8sOz7fYWJqM3onTrjbfm1NwZ/90qeNNEASpt7yVCU3rBJfKPa9Ayzm76G2+69goarNsBL463VVkyDirhjxM6O81s41e8Mv1CtNXaQDXGi66W1MLWZkZW7IXdGCX0TdfVkvaIsUt+cc91xt3lajly4sCTE5bPFdL2IAgueGhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792349717; c=relaxed/simple;
	bh=2gSnxxp9+S2bdq0tAaJzYOQ5H57L6cyfrw3t5aQGaVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz7mGYKMMAjXVTmS1XFdvQ1lz0UHLbpC9UhYZ9+5SST9ZBHA2xSIcEsLlMgvElsLpQHIT2IXv2NIx0zjDiMrDWU6xXszI/zndieOWyfUtaDQFitiDUs2fwhlNn1RkpPwgU4M/vNrt9pQ6GvpHgWuKhDQnTnEsmgHuMM26WUrw04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSMybtu3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSMybtu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162311F000C4;
	Sun, 18 Oct 2026 18:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792349711;
	bh=2gSnxxp9+S2bdq0tAaJzYOQ5H57L6cyfrw3t5aQGaVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GSMybtu33ErxpZVaCYMWIKIo2Pp8/KxyU8ZDNckbK07yOM+sPMCfV06OMW9wAdvTE
	 qYNrCIAwJZGLZ1qebY6o3CEp5nxNXXH4MZugSgUrmiNVJrqGxNyYKwOHj2FNF+06wu
	 cPaavWZTie+iw/kG5JVBnUzCj4ZFSHtmRJLO4sqaqssasE95rJalIxB3L0Q6wdcw4b
	 1895Op1z2adzlmhVpDyJQNyR436XN+onmfTUwI7Yds0JsDg+kSZAuv1x78oIi4M8k4
	 WMZQMPEy2olwIoEbtKREzh0e1a4pCjr6N/959raE5O05DlHnEvDbLEbFTCT35HHZeX
	 rqD5Ez48Jtesg==
Date: Sun, 18 Oct 2026 19:55:07 +0100
From: Conor Dooley <conor@kernel.org>
To: tianshi12127 <tianshi12127@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: add Smartisan TD4362
Message-ID: <20261018-directive-monopoly-4f8578c9a888@spud>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
 <20261017103250.800109-3-tianshi12127@gmail.com>
 <20261018-snorkel-mollusk-0bfba29ae1f8@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wXstIsICGwWqppAd"
Content-Disposition: inline
In-Reply-To: <20261018-snorkel-mollusk-0bfba29ae1f8@spud>

--wXstIsICGwWqppAd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 07:53:35PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable


Hmm, my review shouldn't have been required.. You forgot to pick up tags
=66rom Krzysztof.

--wXstIsICGwWqppAd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatUWCgAKCRB4tDGHoIJi
0gTsAP9VCGm12+AMkObL7EHRRfHpGWLXc8gfx6dt3Hwj8xb79gEAysfqkG8s7vYO
HZThuz48tY2zLwxH7QI4wg2OeRWrugU=
=PjOH
-----END PGP SIGNATURE-----

--wXstIsICGwWqppAd--

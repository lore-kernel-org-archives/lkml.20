Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1574766A5;
	Wed,  7 Oct 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367244; cv=none; b=sQJbTFZZxymV/5wjOJK9ebS2NSmo8WzZbnSCGJtgBaHKcOtxPgwfKQOgt7i2HXNiq5WisbKb+Jd6o+hL3O+rn9aKNuTLrrHm1qDKlzIh7ZljTABAcLQzQhfULKRZ8DQchlal5qwOT4K1IiX9Fbiw2HXFgOQ87AAFERQvqWakH2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367244; c=relaxed/simple;
	bh=V7saYIf53GZ5gauKLoNnYgicR8tC4J5BgHg+EtXkBGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wfl1G3plrJ4pJ4gkVp/bDFkLPmQRkJ7yQdeS0pdgWi5y1FUsQONuVrBV0ZCq7wlXpdjnA00akwcWhB7Ay0qrE2e7y8m+v2y2ZtsC3Nsj3Lw1LO+auvt24X9QHv0TEVDYHGw4kyzWqSyj9OJmr3KeczIhlzEaF86GGGgI5Vd5lhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiRJmEL7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiRJmEL7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21821F0089B;
	Wed,  7 Oct 2026 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791367234;
	bh=V7saYIf53GZ5gauKLoNnYgicR8tC4J5BgHg+EtXkBGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZiRJmEL7MRgFwY0QwqJIl8MYHjmtk92fHO3nxQ5MR6p7XsWXV2Ga1Yy4pkILZlaRY
	 Z8hoLhlotceRRGB4opMYvDSuDw13EeXZOt+HYc2A5+MD7/13eRrRj/g8KyY9/fVdcG
	 jpbOUVVAlwlq2937U+FvKN2VEKhXpamFsr63S/f403nZdUhJ4uxtbg/jL0rx7GWjkH
	 Bz8Q9llhjv+5iybj99BsR+i+OC0Bjd1bJGURYwh+TGspF63j7FGdPNfVP6urNyvCKM
	 DcR5INOaG8CffLd3zXqU9M/YOJKSJFvRmvyPE45yuftmsbmbDSz0WIv1NeLmHX4/9Q
	 y+HKnubvj9u0g==
Date: Wed, 7 Oct 2026 11:00:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add compatible for
 DCLTek 300249 5.5in panel
Message-ID: <20261007-243ca36059610c8a223cf9d5@squawk>
References: <20261006183455.2350966-1-marc-olivier.champagne@savoirfairelinux.com>
 <20261006183455.2350966-2-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/b8kM83l+jTLXcsu"
Content-Disposition: inline
In-Reply-To: <20261006183455.2350966-2-marc-olivier.champagne@savoirfairelinux.com>

--/b8kM83l+jTLXcsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/b8kM83l+jTLXcsu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYYOwAKCRB4tDGHoIJi
0vELAQDITQy4L4y0dXJQpFnhHmZ6EUpsXq7WWSLWQLz9I7RiBgD/bkEXOVTeVac7
mUJIccxMAnM2ERDXXK9PpwZ/ZBE0kQw=
=fR0K
-----END PGP SIGNATURE-----

--/b8kM83l+jTLXcsu--

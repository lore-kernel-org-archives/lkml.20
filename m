Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910983CF202;
	Thu,  8 Oct 2026 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444635; cv=none; b=N+vYD1fMCCZZ1o9RzGWZBkZAk5j8pmgnh9wcRpRkdKpgD3S5wK149u9B6o+mhkGaKNLWC0JLmSFgqDXEmss+cTKJHw21ywmUYBy5DmyFrdyEcMhLMx12Um+kpLNjTjC7iIC5Olp8nShudn73r2L1q4lHKeqQrBiRUtbs/JuA6h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444635; c=relaxed/simple;
	bh=Sk0BYMvKP32BPnXjM0IQ9naXBgWWYSowbYU4+sVLHwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmoiwGstZKSGpvtzlcl9xWBDzy85XOWHF6iIkxe+aV7QOxzBkWJ2Ww0jEBi8Dc2qUbyT0A1WnGk8jF1WMasC96yGooqf5ZGUppa9/i87anCJlrqqsELWol6Cyp05iujf1+TTlOaK/7fUY2T7FwP0nbK3dHgRWF0hW/CNVh5g1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2X1h/As; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2X1h/As"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668251F000FF;
	Thu,  8 Oct 2026 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444628;
	bh=Sk0BYMvKP32BPnXjM0IQ9naXBgWWYSowbYU4+sVLHwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S2X1h/As+MqJKT2hziqV/nvOA+EvEda+3aqdc8N+uBIkNWz2ZJ4jZr7LSQoCCyyMZ
	 RBPJz3/ADvkZJKQ1j4VnQGEGAjLWFIxtZOTFZx7Jb7ZDqGX1yQ10hIe3sCN4KbDMD4
	 C90IGcV6vNsKBLJlPuwIYuxWzEMTbzUetnbQhHvQA3W6K2Nf1CDwvpidJGCMfNu71e
	 899pB0JzPZJhkNDvuKACXCluLT9bGC3qNOL+p2/lPdkd16rOsOLaXh/L1xRsuSHxQ2
	 ygSLqEPG0Clg6pXwqHVUtk3wQ4A52mVe2D8IFRTPRqOmxpP3TLkXj28RHoZOcjp+YA
	 iTRBw+ow0sgzw==
Date: Thu, 8 Oct 2026 08:30:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	Ondrej Jirman <megi@xff.cz>, Purism Kernel Team <kernel@puri.sm>,
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
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: add compatible for
 DCLTek 300248 10.25in panel
Message-ID: <20261008-829b51900061559b07defdef@squawk>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
 <20261007201859.3709656-4-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7OJMX8pyJ95xL7NY"
Content-Disposition: inline
In-Reply-To: <20261007201859.3709656-4-marc-olivier.champagne@savoirfairelinux.com>

--7OJMX8pyJ95xL7NY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--7OJMX8pyJ95xL7NY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasdGjQAKCRB4tDGHoIJi
0u2rAP95HLnhcmIEBWdEXSqGrHJ4LwcO9JTNJfg8bhgzEV9M7wD+JaK+kOUiDe2U
B0U02bVtgFYAia7GqiYA7G925R/XeQE=
=lJMX
-----END PGP SIGNATURE-----

--7OJMX8pyJ95xL7NY--

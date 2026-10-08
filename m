Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF323DB63D;
	Thu,  8 Oct 2026 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445032; cv=none; b=CMuSWPRG0I49GOB6M6B8educiSgCEHWFj2YPvFbsb2ZYmf/Syzxt4L6p8DS0kB0m5PgFBEBzMmPs178E9EcPXeOimx/LsslXoqqRHKGEIYyHn4SLNEKPku+nOrZtkbaw2iJUpzg2h/d46UdnE+xG09CoHUIUfomTNpQwEQluTBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445032; c=relaxed/simple;
	bh=csl9aH8ZXZ5BYezS42LmJ10c8AfGOfHTWUVgmtvM5/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVOfveXJCxq0AsmFsNCfcyou8Dwq1ubZrdJFj2TrT7jQljzSX2/S7o4Pio320sqZAC0XymUtcuUu+KCtjlH5QHmVwtrQ8W6sa5w0TmT5/wamW9ihzvNZije+VdbF+2aQ8L4N/2WXGoczF3sLE/c2lOpFk2o9MLWMbZMS/rJL2ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZnRqUxi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZnRqUxi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E3C1F00893;
	Thu,  8 Oct 2026 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791445024;
	bh=csl9aH8ZXZ5BYezS42LmJ10c8AfGOfHTWUVgmtvM5/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fZnRqUxi+XAqRFKJXx+iNt27RqfgWj92PWOL37n/WlKFp/bnveXSngEg0xTGhOCzM
	 hpKk3HXRy9ak3MNrPJqSB8UtDLedeSi5cxeBRhq2XnpiBulrjBPYO/ZSVIcOT2Qf9R
	 aXHVM9jjx3cLoXPtyLPMM45aiziZG257eb6O6B4aOvScdNnCtBUDbqcIVvEgpUTCsU
	 0x1/Ub/z/3f1j2aepYxLooFK9+SPClI8cvsHz4Ug1eeMZS9Gx0FZ6m6qVdkxu3rtVt
	 9K8/0WYoha/qZRYlzZnw8elTaCk3nw0ICPP4oMRZPg1r5kTt2gEYoausYl92ljg27z
	 6laVBCEtCcN9Q==
Date: Thu, 8 Oct 2026 08:36:57 +0100
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
Message-ID: <20261008-72e93f89527109ce066c1c23@squawk>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
 <20261007201859.3709656-4-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xR0NGw1ZjiPT2BJX"
Content-Disposition: inline
In-Reply-To: <20261007201859.3709656-4-marc-olivier.champagne@savoirfairelinux.com>

--xR0NGw1ZjiPT2BJX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xR0NGw1ZjiPT2BJX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasdIGQAKCRB4tDGHoIJi
0u9nAQCVz6tUjFksWSbcB7eXoeE3A5h+4UJKvLJME0KldfXzTgEA0xUu6MY2QMdg
9IwrJ1tKPW/a/YqR1LaXmnRTllbDagE=
=31Nh
-----END PGP SIGNATURE-----

--xR0NGw1ZjiPT2BJX--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28553F7A9A;
	Thu, 24 Sep 2026 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270553; cv=none; b=TMsG8olY6iCMZBv8WVr4vEx6c/Z+gBlyUA+ZQPPdy2oZfoAvQJeflx4K2MeVAWnEE2fWlBPv9jvcYONEwvPq/tHsuLfmIPtjmMbgBZ24j2Mhce+jfFcPbB4A93EmjIu617oXm+xG2hkO6g1TvOJaw8HA6u411G82pfFDnp6gP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270553; c=relaxed/simple;
	bh=lmtWZBy0O1BYMwXDoTfJVG+L2Ipk8Fmmw9o9rF9gYsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIqXQ631cK6U2VfwSRFxtWWeBHt8YB8pvBHRG1wwVNVWN0v+X0S2N2cq9405hiqRS+E7yEzTRVtMm37nW4u3mQySjZvXHmnYNF+77EJ6lIcfa7g0tzNYfKypigMkZ/525ZFzzzADk6Tjh9usNOFQLhRV0RH0ybw+x5zc0Geqb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKooTKDc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKooTKDc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC161F000FF;
	Thu, 24 Sep 2026 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790270552;
	bh=lmtWZBy0O1BYMwXDoTfJVG+L2Ipk8Fmmw9o9rF9gYsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LKooTKDcBgSBObvEgwWnbLcrCYZIlQIk3vC7ODnlrW6Vnlo8dFTXSZwFCDxylcJy2
	 IBn4a/kH+JLfUipvTriXPal5yg4bYn5JHWBiuDu4Rx4EAmaVRf8/rV4lAXYA7cEwbe
	 N8GIqV4boo63ghst1SPy4VEi1m9v991I9dN93mWop6GGVAh4TabKCXQAiZ9TDqp0zE
	 jK0eIoX8fv08oiShulydLeno1pMqUl3K0IwWiTjPXtHEGZ7Ghul1zP9f5YHsXry/Q8
	 oOXMR3XDM+7bXv4+3rpjTlAH65ApdCO2zHmerGb8RjoeMlsMTznQwGtxvGdPUo0uWt
	 kSSNMtnVGkzFQ==
Date: Thu, 24 Sep 2026 18:22:28 +0100
From: Conor Dooley <conor@kernel.org>
To: armandas.kvietkus@proton.me
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add Samsung S5K3T2 image
 sensor
Message-ID: <20260924-payphone-ascent-8a07a9ff2e51@spud>
References: <20260924-upstream-s5k3t2-v3-0-a5c58dfcec29@proton.me>
 <20260924-upstream-s5k3t2-v3-1-a5c58dfcec29@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VfuZk6A6o28ch8kP"
Content-Disposition: inline
In-Reply-To: <20260924-upstream-s5k3t2-v3-1-a5c58dfcec29@proton.me>

--VfuZk6A6o28ch8kP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VfuZk6A6o28ch8kP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVcVAAKCRB4tDGHoIJi
0lT3AQC/XmFCZWgpYMuPcQAaU0O9DQsW/VHJ962EUssTDU8RlQD9FNn0/xQr2Z8T
fHKThPhXD8a8w85bJfwPvM00UWHH1wc=
=4IB3
-----END PGP SIGNATURE-----

--VfuZk6A6o28ch8kP--

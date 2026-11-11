Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420010;
	b=OLW37i9F8wpVCTwLylfgA/NU5Je02eilpgKoNwwkQbJYyxEeV3ip3GmRjHrmk5H+JveA
	 nnZO7NA1uXEVfVFosCXwQA/mOZhzpPMzKjtgy5IIgwE702GFaNbGD8Pm6IbXCRDIys9O0
	 0sS+WfW8bbR+yEEBpqVzdaPJ8FsXAScvDGcnq89X05P/O87+CiQx2jJv43AV+BWzzm+Wm
	 TyNOqUvEUyCXEL7y4CWLcc7OAg+t/j6vnKjXgvdjY8v4vdS+pRZS5REMOwHqnBahhiPcJ
	 rdJR+79tJAI4LQMLotvW/hTVuSIn/c5wR1lPXhGt/bDzVG/U3toECh/8PvdxUOcVBNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420010;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X6LkoY2T+5XqiIVPJLrZB7o7nsBxiIRUAXk1fuIrLg8=;
	b=BCQbqTFrbsiYTaFpZbS1DXAhPLdz8ksNCTyGSnU32G0DDm/9asEHrM3lmuPM0PuP8I0F
	 0+vOnfUpc4bneGrQ4ReVTo8c2dsYL3RN8JVer10NFG2ZKo77hfKqXRY2Z2UW4cTkNjOiZ
	 UEpYKtKKPlxJAaZEU5HIKAAtpps195z5AXxj9DKiz/X4/UPRIrVKbee5PXnxtZlPtnsW7
	 vvalWwnd0OSEsPP3HflwPTpeUI34uNYe22cf0BJBg+lTfIQ8BjEosVAjVCvnv4x+64U4N
	 0O14Znv59NV/jLN5EDQ2iMBkvK/VJf34icisS3oV1h4AQ6gG5GicLCW7C91prOBMbOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kxNPqq/G";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EF7606A8B6;
	Wed, 11 Nov 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kxNPqq/G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FED1F00A0D;
	Wed, 11 Nov 2026 18:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794420010;
	bh=X6LkoY2T+5XqiIVPJLrZB7o7nsBxiIRUAXk1fuIrLg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kxNPqq/G4vnx05+7B/7ozWIDuxVAHHzlMvv+ihtaoI9LRepRrNBu/Hw7KxWcDqXYC
	 qonCZ/3f0WcbsuTmJW0lXWdNpsRc9xJn2GWD558yeD+e69HASsXFVUS+WI6FrJLntD
	 tzqxpSFlhofIHGV3zhftCJQiXT4OUk8CQNOEJSHIkAjj6klAcuWBc8J5xb4UAplsgg
	 hQF0HatueKgvQE6XJXYC6H0D4QHvafWLsiFRwSg4GYf/j/j77IrEPxo9EcErbNhALl
	 SY6YSQdoptuojrOx1xbtBAn6M4oBtDSkehhSyfnrndRFR4qUuPEzZNia3dKMYZcU4C
	 kAUWqgR5oSQpw==
Date: Wed, 11 Nov 2026 18:00:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add Genesys Logic GL3525 hub
 controller
Message-ID: <20261111-defiling-barn-bcb612dae73c@spud>
References: <20261111103710.1393311-1-fshao@chromium.org>
 <20261111103710.1393311-2-fshao@chromium.org>
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
	protocol="application/pgp-signature"; boundary="WecG3tIu4Kl4fFzb"
Content-Disposition: inline
In-Reply-To: <20261111103710.1393311-2-fshao@chromium.org>

--WecG3tIu4Kl4fFzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--WecG3tIu4Kl4fFzb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavStJgAKCRB4tDGHoIJi
0hfjAQDtyrcrPKGTnGiSAlxF3REYSJk6EvTfjQtY4moURK4lDwD/YVBaY8gX9Q1c
iH0ej6xAhFZCcCh9+RK3Q9LsLC8kdg8=
=hBak
-----END PGP SIGNATURE-----

--WecG3tIu4Kl4fFzb--

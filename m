Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671739;
	b=IYyWgdyob0j6WkqTv3ATsbxyzMK7gotilY5zyVqcJ8pvXRgk2/ITxEoQVc2OyYmTw2kF
	 QrDzJkb8djqbXR7e2j9JP9zZeHip60svy9lRQWAT8c/H7XgJOfYkNuAYz7HV2bwtdffvH
	 WIjPrS/JZLrlnUKnTlk905maMZv4ejMWkcFRYW6+h8Kx8mzx6KkAQUSkFN2C7J8fBJ5e2
	 qa0QRV9o3VyeloppIX2RKt2sxWePjjBJ8p2xH6SW06pKtBWNWNXFzZvhAMQvm3CQ2jKCn
	 5kMBbUSLo4voRJVI/MX6DDD9ZnjPGvAH1ycZuXhuZ6V9T2U6Qceuuhnq5vL7LdUusSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671739;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=fxsG7s/nP9jQhWaNRX3b4QYNypinmSZSM9Kctebdsng=;
	b=wp/I16oCBnUWmEFS6rjgOkxXJ+8v3b1m48R/Kr+Zu6HP1m+WjEW508sVSn+/CalyXve2
	 64bmVJG0kRInxFDSPpRAwew3s/BqklUalKETxiP5zxyU2FXEzmLhqGe1wAsMcr6EAfxV4
	 MQ4zwONivskCSw8Sxn/wdEfGkGmHh5yJ7kvadgr+MVVjEvZKJwi80VQjgq72UkSbQPmQd
	 UJVAmur106WESrRTTB/Wb7ktlZ+XY8NWv81sR/O/CDL1Y7T3JVJH0LKlaAs39tejd1JmQ
	 Vtl+48oHrFPderQ+XyOZspG/45DRNnXZz0u2WmNUwtgeKSkphpoKooJFGa7lfw0B9Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TAAtEb9Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DE606A31A;
	Thu, 22 Oct 2026 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TAAtEb9Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EF81F000C1;
	Thu, 22 Oct 2026 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792671738;
	bh=fxsG7s/nP9jQhWaNRX3b4QYNypinmSZSM9Kctebdsng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TAAtEb9QLpKoma1Q0gjKIdvfVGSju5O8E1vjEkDxLQIrKu4SAm+Nroh6gcYndvS1d
	 TJB+/U0AKs48eXTWlM1q4Ty1dp8Kqjp0R4h+12uwhixUYQQ8/mJmgLw155gEudH+uq
	 YkQyfNPAWRyrRblC3+t7J4MU7pWWCpdQV5sESq3ICsRta+ibf7cG9dLv1l/Uaep145
	 k3UxRMygXyAfJHSdj+RvN/kcHJtOnOpudZgYWivos2R65zPckMN5n1Joitzx0B0lZo
	 dI+ZDrHAGz4dRoliWYUsRa4kprVsAh3eNWlJPfhEXwFFz5hMBTQhG323H6c0vkf2zO
	 cY6Gk2VkfS6vA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 345A01AC5994; Thu, 22 Oct 2026 13:22:16 +0100 (BST)
Date: Thu, 22 Oct 2026 13:22:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/5] regulator: dt-bindings: Add regulator-boot-force-off
 property
Message-ID: <atn_-NKv45AsROu3@sirena.co.uk>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-1-25f0ffbffa8d@bootlin.com>
 <20261021-wind-reopen-490475bc470d@spud>
 <DMAOMKRB8DT6.2DUZQCDZW47X2@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="pkNQdC15AoDpHePh"
Content-Disposition: inline
In-Reply-To: <DMAOMKRB8DT6.2DUZQCDZW47X2@bootlin.com>
X-Cookie: FEELINGS are cascading over me!!!


--pkNQdC15AoDpHePh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2026 at 07:11:51PM +0200, Paul Louvel wrote:
> On Wed Oct 21, 2026 at 7:01 PM CEST, Conor Dooley wrote:
> > On Wed, Oct 21, 2026 at 12:27:42PM +0200, Paul Louvel wrote:

> >> +  regulator-boot-force-off:
> >> +    description: a regulator may be enabled by default when the system powers up.
> >> +      A consumer may query the regulator's state during boot and disable it if
> >> +      it is already enabled, potentially resulting in an unbalanced disable
> >> +      operation. This property ensures that the regulator is disabled at boot,
> >> +      regardless of its previous state.

> > To be honest, I'm not sure how the commentary about querying the state
> > or being unbalanced is relevant to the description - that sounds like
> > something specific to the linux regulator framework?

I'm fairly sure this is about masking some driver bug, a driver should
never be disabling something it didn't enable.

> Yes it is. Maybe I miss something, does this binding is used outside linux ?

Pretty sure u-boot uses it.

> > In fact, I'm not sure why this is needed at all? Can't you just change
> > the software so that it is okay to disable a regulator that has an
> > explicit enable count of zero?

> Do you mean by calling regulator_force_disable() instead ? I thinked about that
> but I don't think this is ideal.

No, you should only be using that API for recovering from catastrophic
hardware errors where you're cutting power to do something like
preventing physical damange to the system and serious disruption to
other users is an acceptable cost.

--pkNQdC15AoDpHePh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatn/9QAKCRAv73Ows9A4
ibcyAQDAnbZAC1joyjtWIJfqNfT4By0MnDRYQTkbGcBTWj/oLwEA3pV4tzvaNh9w
d2EXmquN8kCQSDRLSPWLMgtTGcUbYwc=
=igGC
-----END PGP SIGNATURE-----

--pkNQdC15AoDpHePh--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865853;
	b=EfGcrWXa/PR5A8BmJedw6xGY/5iYUHpUsFzjQzpzM7DnfbzB6ah1SGKmWVR0RG2Df+If
	 xkqaAnPi8lsAViTpYNwBdQdt18/s2jciAqAlYsE5Oy864XQHIHGdgtjojaoVC8treSg0/
	 u0tUca2bSFpLggji0+2atQgF9tdsUKaQmVLLZvo1LThtC90S9I1gpyIWzgyFOBP25lTc0
	 2uN3QBmWAAiBwmfgDinYIgdjB2R3+1BTVuzYc0revATq3frIcC+V5hoa8AEohvjzwN15i
	 RTFtvoaPdSCRHGE3cDwMtHw9ATmIl/weQ1qu0RApu8ZnJMGQZks4c0xqDnDHERQH1Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865853;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=RLhocTFBLFX1u+UKYUeGwsYASAfHXu4EIw2hqvmM8HA=;
	b=1mDBF/DAn8dfaJWshyyMpAF0oC1bY/8zgvkYHSyz/KqFUIkAU2U7PDy/+64CoFlQgoio
	 QiV5zayzSFpYmpDEipXV28bn7dGbl/zsP38yGAyCMJ1kiMPhoqtIgk0WO2KJyybUaLE9v
	 m/21v+9NI9QXci4Jb4mGZRI4EbxKZL0WaYB0NlJtU2ck0s/E7c9+Hhn4XqfkWguotvN+a
	 MT8LVVTw6UeZ/lfdfO8H0fLXd1HIA0EHeBV/WJofTM46wBEI0eAL1E22mqftSIEoN1Ub+
	 IR/nszSLR5Wc1ff7ukDDpLOQ+lNPHv25fqLctZLigLkJChusRn8cmEkhdMmreML5VIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLoUDnIJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9E6606A31C;
	Mon, 16 Nov 2026 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLoUDnIJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8931F000C5;
	Mon, 16 Nov 2026 21:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794865852;
	bh=RLhocTFBLFX1u+UKYUeGwsYASAfHXu4EIw2hqvmM8HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iLoUDnIJHa2c4nVAnCx1Z/Q0aqmhCETxdgYDGOEoCpD6g0u112ZJK0lma3LuTx193
	 KthE++67nNccnqjecGexoJUj9w2kHugAmNUjQtKV3lBQR32c/fhdP5P4Zo/lz8J1f+
	 gf4mqnaVPnpXnCtBJucz0HWxadByaP0Az6vGG0/dwVA7tWfCSc75kZVIXjnBnK97Qf
	 Ox2ghe53L6jZBfrWJk3erwqj9utgjy8kOzZ+9jOgrE+gyXwWV3D+FaeM5WDy4P9EJR
	 m0R75n62NDA7QI8CtrSDIDRYMtXFpZJRd87TlNrNU9jNjA5NpOpzTLDYxnVEVAxNr2
	 68s3v0K5hI6BQ==
Date: Mon, 16 Nov 2026 21:50:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-next <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the asm-generic tree
Message-ID: <3eddac44-1b12-43e2-b7cc-749ad7e63cd3@sirena.org.uk>
References: <avsfuW1MUYp0jI_I@sirena.org.uk>
 <eb397d2e-a6c7-4838-8240-b3f8854e6109@app.fastmail.com>
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
	protocol="application/pgp-signature"; boundary="6iEMeO29qkIgguii"
Content-Disposition: inline
In-Reply-To: <eb397d2e-a6c7-4838-8240-b3f8854e6109@app.fastmail.com>
X-Cookie: Serenity through viciousness.


--6iEMeO29qkIgguii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:19:28PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 16, 2026, at 16:22, Mark Brown wrote:
> > Commit
> >
> >   5dfaff16e8b90 ("selftests: vDSO: Fix header search list for=20
> > vgetrandom-chacha.S")
> >
> > is missing a Signed-off-by from its committer
>=20
> Fixed now, thanks for letting me know.

This is still present today.

--6iEMeO29qkIgguii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7ergACgkQJNaLcl1U
h9Dg7Qf+NIAe5xAv+Fk+GvbAoqtNjzMmLKTBqQ+Fg+IMX4wDoZge2FW4TjGismfz
oDlhFJOvnhhyWy9usx3+rPLMQcCXyRm08Ro0Y8+R0C7vHoY4lP48DG9kzVnlT4F8
Rj0qTuuq9LhyGijbzjjH33ksCzB8+XTPJy+8QwLsqej9oJGJOrT4sHv0Xu/Hcp/5
DWEtL07dn0cqxVf+ZV/yMeEqnfw4FG4/9OKNFCoSeewtoMK5GVxWyBl2DUjdeG4d
3cBrhujLEtoFcSiNM+ir/mi6yGhddMLPf+QqqxXudmXlMh2tdczvMuxdt5s+ikWw
5VFpZIV99ruZlduvcCaMtILuaCNHyQ==
=Fidq
-----END PGP SIGNATURE-----

--6iEMeO29qkIgguii--

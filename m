Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925751;
	b=b5xjc4bnKf8q/YopDElcbGwYn1hV+YLrM5UH9fLrath4YR1dtZMFKidObJ8ZeoJM+XHl
	 k5TmWRAsCXEkL+tGG/kmyIumsmzmB1KhKcYI0pBz/KhFsamJxwiujnRVSQIaKlUxGaTG/
	 nWKuHSTVdyBEBpFI8BGJCqSV77BKqLYl1y3Q3yr01Qa2LroV+gDl0IKKkBsJ3gnLRvn9w
	 MQH1x/uWOK7tD+kdxplQqrS9uE71HVoSdPJge3CN6q1KsJK9RrwVEfiKCGBLIcqmCLAqf
	 mrcDezusugAOUcPSGf3qMNyC7jmYNmgsCkhtFoAEtAeHRTIh1FUNQ+y24wwlKiI7r4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925751;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Wq1Ppwh2qetKn8ycBcbJQK+Y2/jEYNmfIM9ROWtjjkU=;
	b=TquxHbbtfkowILHUEYHXYyfmyDl2AbD9oOhvyOR6OLY2SjN/jzk8Bq0+VVrzLZjE1XiZ
	 H7d7evleOPi9mzufs9EOg1KMGEg3lUg7D47ME6BY3NAOLwy2PUZgw56cgdduscTx0bPit
	 qXHXnPjkAUZ9qeQy/Hu2GPvOIpVdMHvtbCIkoYC/hhkBhCqa+9st2SC5bmCW6r/dP9e+n
	 9oaqLC49Pih6RkB2gyU99KwuYnJJPC407YbCWF7K5M5ISBxa9Fr7IUNwmWeqPt4UBaF5C
	 HbGwzUdJq6zwi/QtLnncEifO++JkVLmTXtu7hpVnPQs1EohZFPSJVjC2y3JXhXv2Lvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJAv4Nhy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE78E606A31C;
	Tue, 17 Nov 2026 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJAv4Nhy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C641F000C4;
	Tue, 17 Nov 2026 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794925751;
	bh=Wq1Ppwh2qetKn8ycBcbJQK+Y2/jEYNmfIM9ROWtjjkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HJAv4NhypyaeCIB/GJP0eX2Pq+YaPju+VpLPgCJL+BfDGWodkaZMKQtoi5M6NIloA
	 2Yz2AznU9mbumhIT0gsEn4fxPrtZpxf3YFRCh5FSAQ6EiumPZ04DWa2PHyVA8JI/v8
	 +3gNJe9FPpkHjiJ6kcdho52485h7sC3e3eeVbpChEKEh1y1oQk0FTJOP/tHRad80Mk
	 ctTZNht3HKWQclQC5iYucSrwic77tQwtSgzNhvO4BhUt9SpRuYom7Gg2Kjb1aVOVqq
	 M8fR9kCNDv8r7GbDXjrTsUgrf0fGGVEwVLiiO+u7BuNxC3QRchQRkYP8Vq967FPfQ5
	 qWRfE1vG9uHIA==
Received: by venus (Postfix, from userid 1000)
	id 457A018092D; Tue, 17 Nov 2026 15:29:09 +0100 (CET)
Date: Tue, 17 Nov 2026 15:29:09 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Xu Rao <raoxu@uniontech.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the battery tree
Message-ID: <avxjPxO1AEUpnW37@venus>
References: <avtgQAXsxM_J0ScH@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="swtl3vogmmffw7pz"
Content-Disposition: inline
In-Reply-To: <avtgQAXsxM_J0ScH@sirena.org.uk>


--swtl3vogmmffw7pz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the battery tree
MIME-Version: 1.0

Hi,

On Mon, Nov 16, 2026 at 07:57:52PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the battery tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> /tmp/next/build/drivers/power/supply/gpio-charger.c:26:35: error: variabl=
e 'gpio_charger_properties' is not needed and will not be emitted [-Werror,=
-Wunneeded-internal-declaration]
>    26 | static enum power_supply_property gpio_charger_properties[] =3D {
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>=20
> Caused by commit
>=20
>    fad4655224f60 (power: supply: gpio-charger: Keep properties per device)
>=20
> I have used the tree from next-20261113 instead.

Should be fixed.

Thanks for the headsup,

-- Sebastian

--swtl3vogmmffw7pz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr8ZLEACgkQ2O7X88g7
+prvgQ//VTM5MFr6jhnuBPz+fIOYkaN2HeIm8gkzKaZD+AAWaYSumg6u6uDvCxw0
zN1xncMAi08cQ48HBpz0qLBm9KcUsa+TQj+VnBCAFdEN/uHkydCZAPWmUkG2kKEn
VSnJ1WBScx+FWywDQ2TsFT5+a5guLreFw1sz31EKIkcxP6uyyE1rV3kM/xVrUllO
9iaN4/0XKAmYgcrxZ9b2GSVIsDgDDgxqTqtHK7XCGlkOVvUX3Knviru52eD0mNVd
MFEJlMcGity1tFrjgy2U7qcYD1aOz5jo6yIDsIiJEr8+Do0n6EHFbaZf+kIsbugy
2oiC0cmvoxiZSTX7I5bplkLhtC4zoH1KBgE3W2nilpVDCOXUl6ZDCoD/0tTelRDa
Obj1Wgx9CcKnWYZhuEKYb/DEWAIJClZLEisdgC81qyGSO54hg+vefwiCj8LFcfuz
b9KIEXb0QBKorzcMyfOJQ7Qq90mwf9DrsRCR970oVy1YBeHXqpXzOkpP/N2t2Wrw
YEu9YkaKxKrGdVp1ZBXQudKUvXERg4aj9wxDwflCxTzavicsiMziNmCfX/Qo3XKo
FAMlXd62scjzxidDi9uesQpbQiXhMeOgUpxF3dARrkHqxjm4lwLs/F3rMUXLvhsi
KcJ8jCyX5DkiOrRjoxAHJdkqePx81jNj2a4Z53262jfq6KlsLXI=
=SxQB
-----END PGP SIGNATURE-----

--swtl3vogmmffw7pz--

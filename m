Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837958;
	b=peK3sRSxK1earRKvjOYkn9dBVqYwRf/N51mwscbm9kgDwdgOCPJw0NOpDDSkq6L/sQL2
	 uQfCbR+FafhNd1+Gr9bC0212Lru8i1FXwdlFUwWlcRdMJ+F06Qf9oc56VB9MuTfnbVhlz
	 xYQcX1300M3kuRrI3PwMW+zxevCWli3EDjhUJKVya5J5E3YF5RixdnnAzHPR9gMNO/MNG
	 SVaQG4nv+YxhaLifmv1sQvG/NWOPpoD20MzWn4rAKa8KaCoT7h5ukNLDL6d3MFiODNf1/
	 Ub8rdk9Eb6SUowOz4sptIdDovl0vFI2f7bl4kN3wG0HmU0tOxsYFkm1bV05Qxn/vvTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837958;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=h2lWjSoQETtt+rMMEH9f7ek+4yTWCbjIkzaURENrazI=;
	b=Ea74xXFWRK6ojw3FhPDsS+K99Io1F/DoCDSy38qnmG5aprs7czmBvFNqvyotPju7Wq/Q
	 18L+NKEA+HzgMwvU4dEasN/WZC0Bcbjd/6Xab8NmK6f/Tdk3fMAElCK8FT37hw5+sZhFM
	 QEyZOSv8poxihZbUuuyn+raACUZauaOVX+ygOHveXimy1CfJKHtDQ8DhZgore2YYNWs1w
	 JagGQWsuFrAY/CglrRLtg5g4dSEsxUmfTp7ApxPXD8vI1bMnCEyrEU+oysqo5tdRFLpyr
	 c5/5EDAeGXf5rHHtVISaFUVx1EUr/dbQPgvPkjYNJ0ABczXGoWciV8TFoFTTiSumAjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Er4GU8KN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB82606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Er4GU8KN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690B71F000C1;
	Thu,  5 Nov 2026 00:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793837957;
	bh=h2lWjSoQETtt+rMMEH9f7ek+4yTWCbjIkzaURENrazI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Er4GU8KNkfDeH/PGo142NQUEx/UNPv1H8C8sR4n6e8PK92LdgvWk29UwiPVLbLpUq
	 6urlitcIeE9i0fEo6RPQD1+nbmhosn9tb4lxKU7oTfd7toWu7ruHI5KRwwQJn62z1/
	 2G+/fLZXlH/yb1E0ftvk8OfbHk2Hq82gWtC9xPzdyr0VeicaKD3nQVDDp0NNKIPxE4
	 fV1u89+xng/Cwa9JbucD4/pqHjzc6PA99tM0gHOdiIQ3uVEN+5F7mbKw9Q6JC/Ygfw
	 j6OMbHn9+ZWJx6t1TFKi9GBsfvfYBS/PWdyGJWZ4RF1qXXlXxbjsN6lTxGCJoynbiv
	 zFSPsXP5wgz8Q==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 35ACD26931B2; Thu, 05 Nov 2026 00:19:15 +0000 (GMT)
Date: Thu, 5 Nov 2026 00:19:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] regmap: add APIs to bypass regmap_field and work
 with reg_field directly
Message-ID: <c9a8b55f-72be-4196-af43-5a18b38b8b45@sirena.org.uk>
References: <SN1PR12MB2528754CEF9D8E5103ECAE28A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="9Jh3+Dipje6xcLnR"
Content-Disposition: inline
In-Reply-To: <SN1PR12MB2528754CEF9D8E5103ECAE28A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Cookie: Whoever dies with the most toys wins.


--9Jh3+Dipje6xcLnR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 04, 2026 at 06:09:48PM -0600, Victor Chernyakin wrote:

> This is not actually a new idea! Both it and the current *_alloc approach
> were suggested as alternatives right when the regmap_field_* APIs were
> being added [1]. The *_alloc approach was chosen without much
> discussion, but I think (and Patch 2 demonstrates, I hope) that
> this approach is the cleaner one.

The demonstration in patch 2 would be a lot clearer had I been sent
patch 2...

--9Jh3+Dipje6xcLnR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauvLggAKCRAv73Ows9A4
iWhRAQCUcHKq6Keg1iMsIxfjGnu1igDpgu/W49AsvZ7lq2pcKwEA8Bwkm1sLQEK/
guSQFtVGNSuP7sHAw7p6q2GcMGIriAk=
=jK6E
-----END PGP SIGNATURE-----

--9Jh3+Dipje6xcLnR--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885972;
	b=Ua8XAqJfwEphSjRds40EPkGaJJElsmIWo5ipzX4lLfiXkGRlt+RWx0XzWKKRJc7TXFXZ
	 1UBTS8secYpK6/Q0elGO3ceGELESVAzTald5AsOBCNWPfHXLINI1Y9g3hl+AeJvbEqOJ7
	 NRVtUM5kq4KAAMnbyZP0iVS/SkJCn1kZy9MhJSwsB7becXcGkfhTEB9a6ttwKaNSP2Y/I
	 tlDGqRV/myA21BqltnMg3tWEDZHmtXUnigUynLi9fxqhxZnf+recG+EaORJHTlcYZZqUJ
	 0FKrc4KKsDJkMi3KRJTaNMNZxlGnqLhCn7Wb0WHu6Y9kTYOPnKBSlAQtQM1gcxk2m6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885972;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=M/Yw+/Wn9XYUmXtB8QbUyJClTm0Y0fz3vcZQBscEvrU=;
	b=s2zzVFyrlL/0gDuieJle348y+S2V4ueKse2NPGvA4B0tFwAf2CxLhWYZkewObHziLRRq
	 OnnO/68zDqlaWpVZNdlN2IOLd4msajy1IGyITzhChwDG3qlfbe3viHfybWiiesc2UwGOG
	 Ds/oBgMxK/nECucV6z06+j4mJZd3pUaS3Ai/dpy92Q6/iPEz1wBwR2Hf5x2tHIT0Z7lLV
	 m0GS9oSq2/42zUIEb9U4amyWVQaQPcl34wrzSSNIAUA5qTMnABGVVh6/d9g0N2F6P7LfI
	 edqryCCoT1w6h1vzIIgbZz8OasOmXl+ggKT4HIx3swAX1+5iFqTCHUWcayDZ9gvhSmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdEQkCEP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939CA606A31B;
	Thu,  5 Nov 2026 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdEQkCEP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF0B1F000C1;
	Thu,  5 Nov 2026 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885972;
	bh=M/Yw+/Wn9XYUmXtB8QbUyJClTm0Y0fz3vcZQBscEvrU=;
	h=Date:From:To:Cc:Subject;
	b=fdEQkCEPVbqU57vWNN+LJTNDDV58ny9IpbQfVLanGZMZPqnXDln1xlDUbTAwv5r0V
	 tr6o/GZ7oXqGq7TwWBYgy9YMbu8EGr2k0GMMkOGGosPAhxw00TlrV0RZdmEH80LFAV
	 jpn3eJAkyC0Khv8+CDGSqbisaJBrzAzqpTfgdN2qnIrM/zDB2Nc6VoUEyI8HgW/LXS
	 1WjK43mtFzNLlCauGAgv0XqFs66wQnyCvMCDVkW4qTNsORRew7958DD+IMUW/UrGdP
	 SECkwzgITtmJ+WdqUFQyEwCzmxH5D+gVL9aaQESpfFEbLFQ84YHRB7swNs1KczEtF/
	 OZs7m5geP7MJQ==
Date: Thu, 5 Nov 2026 13:39:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the leds-lj tree
Message-ID: <auyHEHDcjYRWM5ip@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="QtfFEAqw6t6ovE4v"
Content-Disposition: inline


--QtfFEAqw6t6ovE4v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the leds-lj tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/leds/leds-pca955x.c:544:37: error: use of undeclared identifier 'client'
  544 |         device_for_each_child_node_scoped(&client->dev, child) {
      |                                            ^
/tmp/next/build/drivers/leds/leds-pca955x.c:544:37: error: use of undeclared identifier 'client'
/tmp/next/build/drivers/leds/leds-pca955x.c:554:25: error: use of undeclared identifier 'client'
  554 |                         devm_release_action(&client->dev, pca955x_fwnode_put,
      |                                              ^
/tmp/next/build/drivers/leds/leds-pca955x.c:559:35: error: use of undeclared identifier 'client'
  559 |                 res = devm_add_action_or_reset(&client->dev,
      |                                                 ^
/tmp/next/build/drivers/leds/leds-pca955x.c:562:11: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
  562 |                         return ERR_PTR(res);
      |                                ^~~~~~~~~~~~
5 errors generated.


Caused by commit

   abeb74220fefe (leds: pca955x: Take a reference on the child firmware node)

I have used the tree from next-20261104 insted.

--QtfFEAqw6t6ovE4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrshw8ACgkQJNaLcl1U
h9BmeAf+O05MiAV2NIVa01XhnHIygBSwORs4S+2xQ+VkpcpadhIAxS1HknNB6jQX
YTb8mw6Vm76mJZYyXDLSoPEv+o63z3e1s6Np6XXOAlhM5kWeeSzwHQst7jKi1SYX
lKgk+KboTdqfvUU3HhhCmI3LUiHic4CpfxFUWgPb3Scaf65WQotWZ6/qDMFr6VUK
/tQ/UYEharzTKIIrgV87sVO69jKan6UGhUSWTn3ELfVNae14kYnqTQSilXvklgRS
VFdbnyfos0zJ5ZEWragNjd2kfof9r7TUq3F1hmYXQZc0y6tMwTLhQTEEDo8DaeX5
6s9PuQB7cxup3WRa0Abm7mQ/K5lMfA==
=MF/R
-----END PGP SIGNATURE-----

--QtfFEAqw6t6ovE4v--

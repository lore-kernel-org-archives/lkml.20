Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989350;
	b=sLSkXGKsDpLBhY3hTb79UxkOK4wTy4dqEAiJMvkoaLiRzinly4X4OIRb6EJ2o6RWt48V
	 FyuEIB80ioT59aG2DgmpbZjyN+nlvY2dQB+O4P/0ht/icxnc8s0fhxCa9iwPfBJRx1mt/
	 sx3QEcCtNPd6N3xOa0hqTgCFnByE15DdCWXPtce44VL/JFRrlR1T5im18mV7NTtrEbt8V
	 ly6Iu/wuz/tulZTJE3WOXpVKHdhkBgGeQKTlWjRT7e7VcBFJOHq4Tyt4lRfaoSL0N4re2
	 XJPtbkg4YTekQTbApNbaQtcsHftWONCB+hJiDeGVr9Kq6UlobufitVROHYpSTHipLZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989350;
	h=Received:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-Cookie;
	bh=0r07gRhJoYV0U2CTt/p05Pz6Buu++NhzWKubwX2Vggs=;
	b=HNQ9MooFsey72dtCGrxIYQbJ9+KuCnIYwMnoc49r5KSeaTeGtICeV3QIM2h404vvFocI
	 Dv7J229DA3OESulPRnXC4LY4jhuFOkJ+3onzRKqqxOktbONwCfFtmuR96eCanJpM0oRqS
	 jbrylCKmqAEmlHj/QDcg5lO0YS5n0lVDyqllv3aAqGTUj4s7aQpfXLLJCmx4ej4y+CPoI
	 urMbGrbE4v7iF4u8w6HzY+NUfz46rNRRniE0cee+1iQAB0qM45wAOkLfGw0yiP+j4vU1G
	 IN7vs8/0D52vQQ6ylaCMqwc+Owy0V9K8u63dy6zCmXEnmsPffN5ceZOKR0fAZYmHVsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbHXGtgm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB2D606A329;
	Fri,  6 Nov 2026 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbHXGtgm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC4E1F0089F;
	Fri,  6 Nov 2026 18:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793989350;
	bh=0r07gRhJoYV0U2CTt/p05Pz6Buu++NhzWKubwX2Vggs=;
	h=Date:From:To:Subject;
	b=JbHXGtgm2JMGh1ZXpKmuzJIIGnVL6+8cLA166dGfALQK/OiVBmlDzVptew7+TbFX9
	 JbTKwhTgI0X3OyUmw9MMrS5OM80jqNfwsyUKXvH4zXJsRD28sRPjoapCesv8Z3o7JR
	 7oQJV2TzQfGRhwsvkl4TZU2bmaZFo/ICzsbOgiDSV2yuCJEflToymkHvTMBaapZ3BJ
	 IJJpHghMSX8ZC9WRZiYT8QicY3o2AQSJ6c6VuyK1xZfdv6fd59qRCN8+FbsB7cxSxm
	 8pWOlR3E1x9R2RxOiaNrDOTcUf0VmcJDzzYY/OX6AAwwITEWjlLWkiQGkUFqL2vWU4
	 H1Jh596ltwAOA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0FB2C1AC5995; Fri, 06 Nov 2026 18:22:28 +0000 (GMT)
Date: Fri, 6 Nov 2026 18:22:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release today
Message-ID: <au4a5I8KcpW337Se@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="skjAh1jPiP1+ojoT"
Content-Disposition: inline
X-Cookie: Victory or defeat!


--skjAh1jPiP1+ojoT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

There will be no -next release today, I might try to finish up the
release tomorrow instead.  As previously advertised Monday is also at
risk.

Thanks,
Mark

--skjAh1jPiP1+ojoT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau4a4wAKCRAv73Ows9A4
iRvaAQCHsfUFpbkU7K4Ew1IJmBo8nZyIc8rGwNlSDYF41X9//AEAvtHL99uuGauu
+gM8OzxZFJrdcZcOO/65EDKLhN3zxws=
=cVVn
-----END PGP SIGNATURE-----

--skjAh1jPiP1+ojoT--

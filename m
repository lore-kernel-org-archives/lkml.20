Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998035C6AA;
	Mon, 21 Sep 2026 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984143; cv=none; b=tc8Z2O+SvCFnJdNmzTisiBaIP/dtGiZzjisEAsBwAK2uj3zlnGJ6Wp5CCGM4weD4HDIReM9EUV1YNbyM/VcmPefevuam9oS5hxXLv+0H81Ldy09QYJDQBbI9nQaBMy9Gv62td1l2D7hcoD69z40DydaIsYQiAPB4AskOUGFSlPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984143; c=relaxed/simple;
	bh=SoPY4AJ/YZYwe4LoPOMKYexrawiYoGYTfX9ycDZEuZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sxVDUhGNwRwV5WTeTg9wj1xm2VfxSZMwnmhfFChJoMmy683yD9HRb50zMx7bEfmV7k+YZy+pXgt51713+gtqd6uP1IZBLIS8cm1YYIc/uN7AuJo1ymRF+bmyIQOYl96bl1J9kSQHYhPEIVzH/tfUvJ9o7lLdISO9aprXqzYt10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnMjV7FU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnMjV7FU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15281F000FF;
	Mon, 21 Sep 2026 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984141;
	bh=4PtBQM8/4lJPiqOGtSMExJYoMVI3LSYR2HJrMhueGqI=;
	h=Date:From:To:Cc:Subject;
	b=VnMjV7FUxmWvugCygL/bCXY7tHg0dCpSLeRyXM2MZOpCM8qOyFlu3P5OTK2xPgsrF
	 vKjs4eOqHn/iRGBJVGoYmzYNP2cLxtSJfSmpPCz1mvTaQHSyc6eRPaRjkStWld+MLD
	 w+Iasp4cYGDKHdB0vUS+apmRxY0fqMbkJgp7ovqURyfF7vNmYEQOvu5RoEXCig6vMH
	 4kZXsbLGCyGLiuweg2QUoubgyuqwsDkNY0h1kTynCkWbe86shnztczWPv3mr2mltEw
	 7lIm1znijtTPJ8yjfseglQVFTOvmBWDIujcVS4r8ZHq9MoGyA9XPC8osgr8csXHjaE
	 /J3BZRciSORnw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F122F1AC52F5; Mon, 21 Sep 2026 10:48:56 +0100 (BST)
Date: Mon, 21 Sep 2026 11:48:56 +0200
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vfs-brauner tree
Message-ID: <arD9iJWhpXDrNVVL@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9NN7GBfm1x/zsFwN"
Content-Disposition: inline


--9NN7GBfm1x/zsFwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  c51e89c5b5db3 ("netfs, afs: Fix symlink reading")

is missing a Signed-off-by from its author

--9NN7GBfm1x/zsFwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqw/YgACgkQJNaLcl1U
h9A8DQf+Lp4jvcKymwmyyCJskQTfEU+gKFuxas44F+wogQjlGPFWNKEfNfaX4Vm3
ej9Cc7jwFJgox8XNRH60AzLa7bDSmx9JrcC7diXaXky7hBjnjcjfW8ZVnwU2fhDH
B5uS6XDhovn29ws07vgFQ/HO1UB4ga5pSEbIMjEU4e1SRgb0bF4cwwcsvz9h/kGU
pHdufrmnIQKhs+1g7C+ol5U2sR/4/xX8m/0sc2e07pafgbuSscFlOLnD5pPiqud8
82qg/H9x7jvfHI2Vr62Z5/vb12cFz8YnE4WpHYLMiuNyZZN7OpmNnMeRVi5uivrP
J9SyJd2kn7CNJcuj4BaF42njH/lqTQ==
=R7N6
-----END PGP SIGNATURE-----

--9NN7GBfm1x/zsFwN--

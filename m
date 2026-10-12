Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E10E38655A;
	Mon, 12 Oct 2026 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823793; cv=none; b=WNZGG7HZDtC9ULQpk1qg3Qwb7IQRgfThVF5XvFIoPSckYIrtABM5b28Eq4TJb1BH15Htv+KB3GO8SQkMFA/g0/seIWQlEqE49hbR/W6PZjvNcmBAt6/7inig8JASxoKetZlNbGaxMc6Dh0fvPQkR/J/rL+HLixEwIeSnAr4Om8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823793; c=relaxed/simple;
	bh=+XyFJs8RhG/8oKKrqGof4RtlE5Q8SdDjgEM5hbR6+Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iex20X8XsKJlGeMz9uFTdJGcRXVPTVnHFuMX90TVV+b5q2vj3/H/0J9T73fNqkqnFMQuZc784pLwWR5A+33jPI6olGCQ9noBkBrbk8mo3nBrheJxafZMynbsMa4/4Gh9uGgkhxsEGSAU6xfMNU1DgtnkpBiO41NUOimcyBy5a5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ey4VgB97; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ey4VgB97"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C751F0089B;
	Mon, 12 Oct 2026 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791823792;
	bh=M8qRe9VTl0D9VD9F/blrY1eiQ5R8O+L6LPf4pYWuS20=;
	h=Date:From:To:Cc:Subject;
	b=ey4VgB97gFXCDI9FAbEfyL0VEJ3geO4Ey9xSMFSUxus2xVO9mlMtEYiUFrfHjZm5T
	 VEA14Hm8SbQ500ntt9jQqGy8m0pWcIrQ6kaBA4DRT6/Y15rASM6T0SKCXsTPUNdxzQ
	 /No28EPT4lV8Ibe7MNc15WSgruTQkV6Wa0NXg7JRT+3gqjuaGufKMpvtG4XhkscFnj
	 +bt1vwPzP0yHO1bPYfbtirJnvjbI8d2k90GOS99carZ9P4f0Kn2nizgAuw5bvrpSLq
	 u03pAUA5MV0+8/axpUeqRUWMBs4dtEmM3RFDCU9iwzbH94KT7LN0lPrEdTMnfkiSGy
	 MbMgYiAm7q0dA==
Date: Mon, 12 Oct 2026 17:49:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the mailbox tree with the devicetree tree
Message-ID: <as0PrXGZghcYA-ZI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L9kfO2VW4phAu214"
Content-Disposition: inline


--L9kfO2VW4phAu214
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mailbox tree got conflicts in:

  Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
  Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt

between commit:

  cfbc5d96e8ff4 ("dt-bindings: mailbox: Delete old 'mailbox.txt' bindings f=
ile")

=66rom the devicetree tree and commits:

  5e80d2b8ecd02 ("dt-bindings: mailbox: Convert hisilicon,hi6220-mbox to DT=
 schema")
  559f3950caa69 ("dt-bindings: mailbox: Convert hisilicon,hi3660-mbox to DT=
 schema")

=66rom the mailbox tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(delete the files)

--L9kfO2VW4phAu214
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrND6wACgkQJNaLcl1U
h9CsVgf+MyJdHT6RbAQfMRnyGN2FtzyhB9dnq/MAFLt02peHWwlgPnwxTS9wQTOW
6381b9uFSchcJUiGymhMt2s/xjQ+WzUd4KhjVQR4I+FRwf7qfCKtbN9q78fDdOdQ
L7WEl3nKt/W4AEFBhJQ6znteNN8L+I+vrhITGJqTcfC3OilsRWqjBFO+ug9OpCMW
7f4JKsaEtZwAD8NUV/X8Dez+dCeQYM05eM4w9Tg/Xo6jZhfYnwTPFkeBQvcNzQnL
Cx4korQ7yKYjRu/dJRyTmL/mVkOIhszazVqOjdjHD0slWqPeuFGqYJJc9TOK57Tk
QO55cqUBC+xMD1P4FbBBvltpzWrjkw==
=CDq8
-----END PGP SIGNATURE-----

--L9kfO2VW4phAu214--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A503B059B;
	Fri,  2 Oct 2026 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964775; cv=none; b=qp0ApvKmCi0HEIReBcuJfoibsvmG2zDmZm+E9FJCta6owZ0Y55xgcuk5BuUOBaFnWVgf9UcZtWuUdVGvbR4KTtM9HFK6ldn+pIxCnooGrWHX0kfVu5kL8n+ufZnX2EGT/2xfnTb4qJfz89TvfuzCE0gmAUh0oq8GGc3vfC86iUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964775; c=relaxed/simple;
	bh=IxRPzbxtL24WZLHn+dvl0qOBFDAZOIvEQZWA1HyVn1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZoES+eai0nB88T9QT525ZfY7xjGeyR4CtxdMuH4Taces8iG0Wos5qGLGhUU5FeKAVW/P5f/G9aNFEuwA4Jo5hY81UlMBMCPgXJLAAzfaierXD/gGBXe9i2sR9T4XzdzDj20usoGUM5SeTrEew/ltsDFNgEgjuSe01kCPFQElDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIvFxm1w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIvFxm1w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E251F000FF;
	Fri,  2 Oct 2026 18:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790964773;
	bh=OcC3IQv3fAogUo4cfnwQRwjg1p+Rf+1KOqWogvTu7RM=;
	h=Date:From:To:Cc:Subject;
	b=LIvFxm1wRa9+86RFdrR92Li8jM5yBeceoKOKAGaomlsNbH0AEWWa6/rYWtWNmtaTn
	 qZopBVz1HsoxPbBnNMm/5HobRMLJsQfQ2BWogmICcu/JB/ixOBpgkX08hsrkiJoSBV
	 YRSHDPc/Sj+Ff5cLApIbVRCRslYHM06uVXN9U8ZypkqQbkuCao4u5mO+8sVIh4dxRe
	 F+RQKdFCI8igjwygL40aZOKJb1gTmk/f7euUbnXrb4/ybsgt1BytC9pj2HQ5/BPoF7
	 JG0nvAsdWyf1lMFJXhPq5/Xzxleh4wCxp8H1VEPLweYkw7+LYyy0Y/ePTt3bVHoAfi
	 ZYokhZS59gjsQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E16421AC57CE; Fri, 02 Oct 2026 19:12:48 +0100 (BST)
Date: Fri, 2 Oct 2026 19:12:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the socfpga tree
Message-ID: <ar_0ICrJtyU20WDO@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZoaKMMD8bbgEyu/H"
Content-Disposition: inline


--ZoaKMMD8bbgEyu/H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  57bf614eb1f31 ("arm64: dts: agilex5: add support for debug daughter card")

is missing a Signed-off-by from its committer

--ZoaKMMD8bbgEyu/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCar/0IAAKCRAv73Ows9A4
iV4sAQDg+aiFr3Gmi7/WboyVGG66ioq4naTi3MwZ2d1rfTFy2AD/Ydd4XUBDiY+O
H/l6NO/Cn0vrkkPK56SP1XUqEtwTYAw=
=3+Hn
-----END PGP SIGNATURE-----

--ZoaKMMD8bbgEyu/H--

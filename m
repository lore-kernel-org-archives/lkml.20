Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663854;
	b=Hn7p5eZlKmroVNCGsQPcaIOdBBLeLA54BdJPiSwOEYO8wMVOC12fBL3gYiPEvkW75Wna
	 1lL7Enwg92uREQn+ovupDgJrYLNEAL5Ec1kGVvmS+gAldBLGUgpHp4PFUy6SlMuLLWa6z
	 axf8jSlpbNxZH3Qud89GR3x4rIf8x+qVgGPegZq3dLW/2l5hAqPuZk6pRCnnCRPEnytyd
	 CfJ+D8kwp0m4bhi9YEFWY/2ZePTvjgNkYsNoyDpc9OeisdTQWU8vVGLxdpdRwiXeJjuIo
	 wXc6Rf9+AgcIe52BNcQ1+KHXPpul7uN8zxMIbxMxbxH+Itk08U/aRfitog3oS9OWTbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663854;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=lvVJh8Kcgzi887Ctx3KcyhyaF3VdA9Wx6owVM2852Bw=;
	b=eiYsP6TQ5my08KZkELgO+jOvrAQOOgZPi44rYZofKk5puHF/TdNxwP5welGHO/gv0RdV
	 Md+sJCvI9cTTe/IUHe7gY1C6mbB913klQg/Z6SJvVJKj5z1ZzM9lzDT8IjNG9l99I5w8U
	 cPy11s/xmvczZTr0OdQShp66VhkRKas7vfK6XmqmIoB+FPMJurnLIlj60fbf3cLNQLBvE
	 zcUofU7zRis6aGquF7T7bsaFZ7yPXHL9TCb5ZgyAb9xZ9KDBoB7AHRW2NqEpBY/Lgz5Oh
	 UTtUshk0RbMY4vbuavB1FrF0fZ/F8vBIVRdOD2pOV7Zlhfa78IVEEPH2fWoT2BNPYRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H835vVL6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF4606A31B;
	Thu, 22 Oct 2026 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H835vVL6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703721F000C1;
	Thu, 22 Oct 2026 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792663853;
	bh=lvVJh8Kcgzi887Ctx3KcyhyaF3VdA9Wx6owVM2852Bw=;
	h=Date:From:To:Cc:Subject;
	b=H835vVL6N4M0tLHhXT+lXgTI1WAgUQK0q2x4py0iNYbCN/gfTYLWrNrpCUombA6G5
	 bt88Ki/HDTg7pILPyVWjEQvpLbNhtFDHFBx5IORCAmx6ql/FbCiBlzc8bx+X3pCm5Y
	 XL/jWEhZE/RKC6LwGu4A8of9IKe/ljIHuMo3DPmpI3pRm26SAIQK35hsWO34jeVKtn
	 WRnHZnTF2nqf9qI5FGU5MRwDBykTFSerTy1ONmEEl5UoWDEYbT6C6GAZ/0Tpx9dBS3
	 VWe7HA5KSf/ZF5SEmd44Re3N+BVFp3LcJEKoFzlAsyNJeLLpxWOmUUY1M4m8bLB98i
	 KnoyNAhZwqPvA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BBD801AC5994; Thu, 22 Oct 2026 11:10:50 +0100 (BST)
Date: Thu, 22 Oct 2026 11:10:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the gpio-brgl-fixes tree
Message-ID: <atnhKmvCCNuS30dj@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="b9DnA3yJB0UaD3eb"
Content-Disposition: inline


--b9DnA3yJB0UaD3eb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  15665047024e3 ("gpiolib: Propagate emulated drive errors when setting arrays")

is missing a Signed-off-by from its author

--b9DnA3yJB0UaD3eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatnhKgAKCRAv73Ows9A4
iQ54APwMMJ5SyCsYq9tfMfLsMLak52/Ip1Vqzmc0XZ66pB066AEAyh1zxEoEZpjc
b6TUJPqvVSTRzqd2+qWcGN+yXP9pOgM=
=aHmL
-----END PGP SIGNATURE-----

--b9DnA3yJB0UaD3eb--

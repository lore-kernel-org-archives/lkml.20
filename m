Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987119;
	b=kGEjZxjNQNCj9hd+ooafIjC6mBfH9jcFwaC/icXlMfZB5BTHfjPlDEnUnB2AdwU1FqTf
	 9Pje4a8lHN8l6JQp2a16oGY7uXEwsqdcMowRCAvTTp1aUR4tiG4J6Yta6qt0NqTYD+VNu
	 l7JNcNxlvD2qywMMOmD0FktheFqMncF/PeJiN/EYuCJpXEnMdKZ2h7dG65dB37uJ0K3au
	 q5AtEG0w3XDi5kJ8PdmLhSoKh1v3Zl8jTgavjxyhvXYQx4kTEMrWaAYNqxZcVScZy0yqt
	 zWJF17GOVRAeAqvvl24dEmpEzdA9wdI3MyncidmhfM2nNNVlmiD2UJgleQUl8rgd5jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987119;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=4tt1lBNXHyqKS0DdGikInOa5eUVxtaX2Gj1ANsRCKyg=;
	b=fOQZ5PtQtE34KWuKSJP0c0i16enmwLJyv6J4nOTDYnZgM0QpOp8/Fy8nFyEK8g1QkMk7
	 b5SwPGHqi1NnC3YCCsVAJ6Nis1Zp+1ctY0zua35/1TksvOldmZ61PCU/tJFZNZ1Jt2DS5
	 5+WOVtv5qodDNG9cnhvvYpu3bIircRZ1rWOnYJe8ptCZ3OiGUVv5hJDsuggpx2P5uEPvr
	 tryJFDTLwMdGXj23vNe18vHWB5+kLuw7f8eFKo955jdM1yFUZ+NTfM8v35agslXdSQpmi
	 wVbzMbPEEA3Vjt2bMbl6Qoqk7dbAnTz5UiVvlOMlR38GXXRevht/O8LxMHD+lF38sEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvtk0ASa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB80606A32D;
	Fri,  6 Nov 2026 17:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvtk0ASa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F298E1F0089F;
	Fri,  6 Nov 2026 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793987119;
	bh=4tt1lBNXHyqKS0DdGikInOa5eUVxtaX2Gj1ANsRCKyg=;
	h=Date:From:To:Cc:Subject;
	b=mvtk0ASabK5rZtepJtz+NzXjN2cUXCjN+3khnOTlXPAY6LCoC12ZBk60PkL3eM0pv
	 MroxK3gCuFpSA2kLyQJleZOiqGpUAAyRrS/V7TzoLv42UR/rolhErjUiIsRSEIHQr9
	 Pv8PLgEs377W2WsmVFpTW8019jFoxl63f+FQooECYQkJ3mF5qyRnocYSU0Ic0g/rOp
	 oh5ztWARYu+fxa/XM0aXeIi3sWc8j/2cMDvLMeTjZfgT/ZoY/JkiDzx+rcBtmzqjwr
	 0zy2bWdqf2mm9aX3AeRiyaEpfGp4gdS0uAyTEaE5Na2LlMoRwlCqeW0EBq9BVo1aqa
	 mTDYnvARrdlUw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E0C591AC5995; Fri, 06 Nov 2026 17:45:16 +0000 (GMT)
Date: Fri, 6 Nov 2026 17:45:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the pinctrl tree
Message-ID: <au4SLJH2hZZpVhGa@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="uf3fNfFcHADBqypd"
Content-Disposition: inline


--uf3fNfFcHADBqypd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0e62a6aadef5b ("pinctrl: realtek: Initialise omitted offset fields to NA in config macros")

Fixes tag

  Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for Realtek  DHC RTD SoCs")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--uf3fNfFcHADBqypd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau4SLAAKCRAv73Ows9A4
idX5AQCJ4Vi5Z5i9TqQa8uG8yf/th2PR7rIlTONqyf7eWULSFAD/d2yyXUz/jj0s
35fYZreVEvCMLri5lWm8IfSRKYTcMgI=
=zha+
-----END PGP SIGNATURE-----

--uf3fNfFcHADBqypd--

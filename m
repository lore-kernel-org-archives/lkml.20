Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1246D579;
	Wed, 23 Sep 2026 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151346; cv=none; b=J+K21bnJ5OwQpZPdxRsgZlx2x8CY/RQwZ00BJ56UZK6GmblkoP2RaOt1G0XS3a7A1yy4I6SbvAuYzXfsC09kQL3w9kbLSCmlMfIZlCnSXfMcYubDr/jtc/lLIs/lTnqcuNpGi73btJp05pxOlmwa4SP6K/ELoY9Y8zmhy6sNYpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151346; c=relaxed/simple;
	bh=pVg19eMhhs1ddv3g1CAi1I36tZhIeXUviIgayD6GwRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bApkeUyiwV13qiyrikAPqiqI1ujg6KKOPKJ4JGQXDKnU0puucwCclyt9tpljq5BDaWXDO6t8dmP6KwMVfKz/d9dvvOXjLxfL/E6k457PE5GKt/AxS2IMzefzGPNy9L/ggVC+Ad5UcJSLNSFPrKHCO6u8tBrIsKJkoQSRDQIEGOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fu8OJtwj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fu8OJtwj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08A41F00893;
	Wed, 23 Sep 2026 08:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151345;
	bh=GcDA4NyFy7G/jZpc6fKUfb3sR8wJ8/1Xhn1QPsipPcE=;
	h=Date:From:To:Cc:Subject;
	b=fu8OJtwj+vwXdoqwtJSEZL0naif0BL7WNiph2AcDgbs8Ru6HSkxdTbOMcHvkAZuGS
	 UxKLVJWkQImWT/fTV940obZIz3NR/ZZ+Ty4xxurZzqTeEuYgfxqvURgoYYb30Y7Rlr
	 A94z25BFg4/bK+oYD9ne8Ku4xkhVYHaMD+g0VAZBd6M2f70l6jir5R7M2S70stLAyu
	 aEaNcNUzFCd2bH5E41mN/8RsNqPWRGq9ThvgNLs9/8K3mPSsdNlI7fcHjzXxKEtKvg
	 kdClRrhIvoD8L153l6L9eGCsOUPTguVQAwP4xZfXCY4oMinaNPuDGZhmPg1AAePEO2
	 z4JDOE/EOkhEg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 26C091AC56E4; Wed, 23 Sep 2026 09:13:27 +0100 (BST)
Date: Wed, 23 Sep 2026 10:13:27 +0200
From: Mark Brown <broonie@kernel.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the bluetooth-fixes tree
Message-ID: <arOKJ8ncdqU5C_EA@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8+Av4OvQ0/zodPNs"
Content-Disposition: inline


--8+Av4OvQ0/zodPNs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  4712bd9a14cbd ("Bluetooth: btintel: validate DDC record lengths")
  7348abd83a3b2 ("Bluetooth: hci_core: free the HCI ID if naming fails")
  ea983244b99a3 ("Bluetooth: hci_core: Fix inquiry cache timestamps on 64-bit systems")
  2b036342b623c ("Bluetooth: btintel_pcie: reject oversized TX packets in send_frame()")
  6d21e89e69775 ("Bluetooth: btintel_pcie: fix plen overflow in btintel_pcie_recv_frame()")
  4145a13c1a044 ("Bluetooth: btintel: fix buffer over-read in btintel_hw_error()")

are missing a Signed-off-by from their committers

--8+Av4OvQ0/zodPNs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqziiYACgkQJNaLcl1U
h9CDcQf/Y8pt5/WfqUBOk8xc4zewB81sZb6tjN4f7ZFZppEtVtnKLEomHBGPSkd6
tN0jElidJHqzMU53XGG8GbYxuW127RTsq0DWsRU/ygupMlsZPUWoXWTVG63nOyzk
ufiTVeAYpypataFKLUUNuHcKajUBMJ0R2u2macDIRghZNJgI7doH9/UeBCLawq+0
QTHndLvMJRfiOyNPdKOlvv7ne4lJWJxkqGoQQW77Vtvos3982xrJgzGURl6NqZeS
MNgdLgvIxBcLdZpklOP/sbVl8jSRt1vccvTD29EvG0TGoQrf01yZgZ6tJqrTiHRE
8AA+5YpTpftVjhd3C32tb6ORndOrRg==
=QxJS
-----END PGP SIGNATURE-----

--8+Av4OvQ0/zodPNs--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C383F3263;
	Wed, 23 Sep 2026 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170430; cv=none; b=navdXbLcPd2OtGT0yuZtp21vYMwKGcXaLMCHnTsZB5Mt+yCYDEwm/WTNj0U1GpJbDUGJ3Sxxwk3TxX/3oXz7YSA6Vr+NvplXESao8+Qd86XJeIhR8arx79p6zXEunmSWBMe/LvIzDD6u70PzI+2B9dtslHfCcxycgfnb4OTWv6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170430; c=relaxed/simple;
	bh=cJDjPJ3bvFxqVQlAA6LZ2U2+NxdbHVYx0aviFK5Levw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XkBtjyM7hmFCBL3o5WFr2F9n6abwZdSTtQhULuOQYynud48J8flRbVTwtU5+dZn84eQmZdW/QOsncufsi/Fw2HvYqKo9EHc4ZsEORyqlomxPTlIiAsHhyP1Jb3Ghip2KC8ZfIAmRd7fI4DIjB4ZU493BzzcH62FFOAQ+2euZRsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjYcB9Gu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjYcB9Gu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0721F000FF;
	Wed, 23 Sep 2026 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170429;
	bh=bZjCZXXBGwfgwqm5KQ9kIuBPUvm+Eyn6NdswjLw/PVQ=;
	h=Date:From:To:Cc:Subject;
	b=cjYcB9GuS/HgcV5N0qqcdG0zablK7zrqs3/l3Xa69aGyrBYMPMEO9oJqmxJCWVyrq
	 L5el2q1n6VsDsxrfePqML2zva58N2N/7pt2IBRQP02Y7uubqnNT7RgozvUyFe7JOoZ
	 7PfZhPXP9OVD1ti4vEM++uGlHsUoWZ3bpOWGRK1xdF8ewjVSkO996vUXtCc9+YQs6Y
	 +8KICy7ZL1xYiSEJFtDsQDZ05cvsjjKzBuf1E5hfpw2u06pLzUoyCLTdpDuI3dVnF1
	 ErvspD5/0CFoFOistgNXE0Thgr+vEdKn/oaPi5UvELQ7X/IP6GzXHXyzObh371PvBP
	 xBJgSqZ7okSTQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C79361AC573B; Wed, 23 Sep 2026 14:33:45 +0100 (BST)
Date: Wed, 23 Sep 2026 15:33:45 +0200
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nishanth Menon <nm@ti.com>
Subject: linux-next: manual merge of the tip tree with the ti tree
Message-ID: <arPVObYK7l38CvdP@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ITIhjJm9oqMDXmWN"
Content-Disposition: inline


--ITIhjJm9oqMDXmWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  e557da9b756db ("arm64: configs: defconfig: Convert TISCI to modules")

=66rom the ti tree and commit:

  bd94bea7165be ("arm64: defconfig: Drop redundant Qualcomm irqchip entries=
")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/configs/defconfig
index c41e5d5dbc81a,978e00891dca8..0000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -1753,10 -1743,8 +1753,8 @@@ CONFIG_PWM_VISCONTI=3D
  CONFIG_PWM_XILINX=3Dm
  CONFIG_SL28CPLD_INTC=3Dy
  CONFIG_XILINX_INTC=3Dy
- CONFIG_QCOM_PDC=3Dy
- CONFIG_QCOM_MPM=3Dy
 -CONFIG_TI_SCI_INTR_IRQCHIP=3Dy
 -CONFIG_TI_SCI_INTA_IRQCHIP=3Dy
 +CONFIG_TI_SCI_INTR_IRQCHIP=3Dm
 +CONFIG_TI_SCI_INTA_IRQCHIP=3Dm
  CONFIG_RESET_GPIO=3Dm
  CONFIG_RESET_IMX7=3Dy
  CONFIG_RESET_QCOM_AOSS=3Dy

--ITIhjJm9oqMDXmWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqz1TgACgkQJNaLcl1U
h9BW6gf+I9StTm84xTEqLf07JS25/84SOuFJ2WnM3ooid8Ytx1frCdZa/AbLZmbt
agwv+V0f06jdRazvWC8F5LyanVCa+LtAIhQq8rBX6RNgpKQnQeTdDbiYUh1JcE5d
EG4m66dOZTRjz8X71fr+zKnAFGNj276zneOO6MiV8zfmiYUMMumTWw7wx7W/Z5Gx
kt/f9XSfAmXZ5HkuvpzS1+af6EGbLBmQo1y+Y/CzUQhyRYml5YCHerVxVVVOkoz4
fEZ93Ed3B/p5CVLpDc6Ro7ROqKhr0KpqpKta3wVqVp+eXZn+0kOND9/FTC6Sg/5o
JzGl+eYRV7MpcO/B1OiXTKacSHtBmw==
=I4w1
-----END PGP SIGNATURE-----

--ITIhjJm9oqMDXmWN--

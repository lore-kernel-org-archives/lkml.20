Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251C247C0EC;
	Mon,  5 Oct 2026 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197841; cv=none; b=f4wEmj+oq6dx1/ih4nQnb4L7xMUIz/DH4F50SGv3S0qBXbIdbYJhsyCKAXWefKIYw5zUXGwqOqmpPb2xfL7Aj0BPLJLCmhUeOTnv9lao8wiy86HgdmotlawpFuCUdYecTldUgEmpH14qIzJ1+ZgY1eSdtmBeMveuWoUdWwPbxAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197841; c=relaxed/simple;
	bh=rTWZbM4pfwc/mDro6FSTBTZK0kbfLYa2SB6GLCsVjUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0NWRT9EgyTQ7Kh+PmFOp+JdflVr/CJjy+CWaPJ8NcPntSyVxvY4XkTA6WmU8MccIjFRQWt8C51/FpfTLjzQMgLPx+LwZLNCVjb+QvnQAH2iu1M5oG9k6iw3jmUaJv/xVivPPYFs5LotKP6ZoejQqdFhRz2sy0wOZ4NKzHYctrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laR//Kh3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laR//Kh3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7FC1F000FF;
	Mon,  5 Oct 2026 10:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791197839;
	bh=6xLLwLidZgnUe0TMCSO79E3gVqVzuOWFlmH7vOndOy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=laR//Kh3gts/XdkBM8E/qd6ZYaMswfoVRAemzc6WBQhlRiKAvZbRscwDn3Qp5CT/V
	 bRBM2seDLsiQzoqLIWGl07tKGZUaQ3GGOFpon6LH5yYXnjgRAo+2vQcNeyvi2TmFWh
	 +If1B+gU10dkaMdyXo4ks4QEs0BPWHbShle+qhrfQpY1PjWpq2DH0IuhQjovzL+1t4
	 EuSf5LVhEAzv7E/OX6wKAMUXPPvWAefnCZ64TbIP8P2zYBjaSt4iWZhrwTdyO5rojK
	 AI2AViODoMRvNJP/aHmzmOTgWdw1fB8oSgxwCDTEW22VtaIvSNshtMIyW3wUszMapO
	 5bzekvd9DHI8g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 51E621AC57CE; Mon, 05 Oct 2026 11:57:17 +0100 (BST)
Date: Mon, 5 Oct 2026 12:57:17 +0200
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ray Wu <ray.wu@amd.com>, Sasha Levin <sashal@kernel.org>,
	Wenjing Liu <wenjing.liu@amd.com>
Subject: Re: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <asOCjVMZtOsKzobZ@sirena.co.uk>
References: <asOByBk2DUB9J4qI@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MFXQkl1fDPAmXANa"
Content-Disposition: inline
In-Reply-To: <asOByBk2DUB9J4qI@sirena.co.uk>
X-Cookie: You will forget that you ever knew me.


--MFXQkl1fDPAmXANa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2026 at 12:54:00PM +0200, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the drm tree got conflicts in:
>=20
>   drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
>   drivers/gpu/drm/amd/display/dc/dml/Makefile

>   ifneq ($(CONFIG_FRAME_WARN),0)
> -     ifneq ($(filter y,$(CONFIG_KASAN) $(CONFIG_KCSAN) $(CONFIG_UBSAN)),)
>  -    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
> ++    ifneq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
>           ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)

This is wrong - it needs the spaces.

--MFXQkl1fDPAmXANa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOCjQAKCRAv73Ows9A4
iRNXAQDBaUhGupjkH4IzKMRv7gP00M7xRgmsytzxV/Wjiya1OgD/aJxeSfDz9FHX
FArJq6Q0VlKYdEBYGeykwrx9rpl8OwM=
=qVb2
-----END PGP SIGNATURE-----

--MFXQkl1fDPAmXANa--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7D2DF6E6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973915; cv=none; b=j0Hqi2pKoYIEJmxQD3tDlaRIkAAgviZid6ncGGl17KvtJz4K6OSQtzXxBI3e8o5vI9DQlTICHjxsNwc1tZU6ggpvYfN47DmVrlUNKn8DX6VYTgdjUIOlRHCg4JaDdsTIScHyiCVcSU5CHTOuKqfu8PUBH3wgOBqx8zOer7O2xCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973915; c=relaxed/simple;
	bh=39Wr/PjY0LpPMtrUwiFipvqyxU/kZQjZHYX4fAC/ssM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=S2maUGxVRIHq7Wu6t9NdZnfLgK99m8c2v9+i4C8QANMrrQcWhGcoJYAcS1+8lgqv+nW7gOYfcWTSCiOOQgI4JzpTtUsfBnINrc07eQM1CCj27eP155MxNUaqUQvpN1Y4Bq2WrlzmWGFCmwrpQWutT04DO5rAfw3nF5vB0CyZslw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kY52ZX2n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kY52ZX2n"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BCE2F1F000FF;
	Mon, 21 Sep 2026 06:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789973913;
	bh=39Wr/PjY0LpPMtrUwiFipvqyxU/kZQjZHYX4fAC/ssM=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=kY52ZX2n2VjUVcmtbfMDjdl/1hGGMsdFNhe/SqkHVJ+tdFRDqA5khE/HB4E/jTyGB
	 hyd1ow6avwf7ee0tjG+6rOuvOt2slnN580/HXeo2Uy/AsXmcl/wbxPeJbpWypvihxl
	 +UzyRZHz+yXd+B7Xd6sCgGwYurLwRZNTUHzDyFJ5Mnkl2uhM1ZEZS/rmaNpBCQAZTY
	 MaVMi624nTDC+T8pPlCPWOivAoN1GwgVIb7HznmywTSPxTPDu5QrwjvXiz79HXJl1t
	 ip+zS2uVd+De0SZDW21Bt2albVQBxwoCU+yR62VjDtwkEkqSYh8iupjYgTPF4qp3G5
	 jVlC4Vd2D398g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1644aa1539b208b61d8d7ad79432b625f9c7c0e6b8f3d4b02bcb4c386c55;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 21 Sep 2026 08:58:29 +0200
Message-Id: <DLKSSLURXYDB.2VSDOA0K7U9MN@kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix deadlock in
 spi_nor_rww_start_exclusive()
From: "Michael Walle" <mwalle@kernel.org>
To: <tze.yee.ng@altera.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1788404586.git.tze.yee.ng@altera.com>
 <46e4e2e31f051f64c120307216ce2766c004d9af.1788404586.git.tze.yee.ng@altera.com>
In-Reply-To: <46e4e2e31f051f64c120307216ce2766c004d9af.1788404586.git.tze.yee.ng@altera.com>

--1644aa1539b208b61d8d7ad79432b625f9c7c0e6b8f3d4b02bcb4c386c55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 3, 2026 at 5:14 AM CEST, tze.yee.ng wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
>
> spi_nor_rww_start_exclusive() takes nor->lock with a bare mutex_lock()
> and returns with it held, while its counterpart
> spi_nor_rww_end_exclusive() re-acquires nor->lock via guard(mutex). Any
> exclusive operation on a read-while-write (SNOR_F_RWW) part thus
> deadlocks against itself.
>
> The exclusive section is serialized by the rww ongoing_io/rd/pe flags,
> so take nor->lock with guard(mutex) like the sibling start helpers.
>
> Fixes: 03e7bb864d9a9 ("mtd: spi-nor: use scope-based mutex cleanup helper=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

This was already fixed in:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?id=3D=
44b8a0bf5f96e8393312fc34b956766882341f16

-michael

--1644aa1539b208b61d8d7ad79432b625f9c7c0e6b8f3d4b02bcb4c386c55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarDVlRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/g0sQGAlsSS3WYcLwNiLX+kgQnKmAmPudCLHyeg
Dgy48x9NAsKlkpD9I/G/O2jrMH8fqZKGAYDEaPAZPlk6MKfWhqhDuRVkqCjB6jT/
86kPLw+Lf8h17KqFdv72zmW31hZiysACbq8=
=qayW
-----END PGP SIGNATURE-----

--1644aa1539b208b61d8d7ad79432b625f9c7c0e6b8f3d4b02bcb4c386c55--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A316B262FD0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111936; cv=none; b=NeQawXRltPP0RIMwv8HuxtccE33yQhjbEHUXc/x+7RrGv18pnUoFDGBqnlLQIkiDErIA3gEKcZg+8g9MjktFttV/DM6XnP9fV4n/A7vvoX222TNmOFwcSP+QpGVp8Efn45U1CNTffOdm3hWQ+Iut1K4mvmuOEOfX4bxT3vRy8+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111936; c=relaxed/simple;
	bh=9JQWLFNh6J1FspffOcNZkL0d1Bovf1abC/QXqLTL+cc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=BtlgavA0ogDWDBe4scxz0dGkHdvWbLf7Ixr2W8jw2A5JrSgdBA71jUgtTKrikDfgLOp+awSvTw/txjk8ulaxPBF9/NHfP5S8pyEhsZBeNfGUS8F75MKGU3KeVw0lSv+TlEbZo5K8vpcGhVtqdUmNCnjdl4UakDeG1HZv+b+lvYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwmiAGF/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwmiAGF/"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B797E1F000FF;
	Fri, 11 Sep 2026 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111935;
	bh=ZzDLyjy/8rt4GojjG6IKZ6vwVdI0G4dwLRnaYESoj7U=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=OwmiAGF/ad83I6IjbAzG1vAD6cQUdDUj8l/2v1CypFl21VraST4jSWqBbU71BUpTJ
	 1rHYHd9cUHtoNZbCfC0xJSQ7IdpkyqvhhZA/PuhK+cR7CLoPBxvHtUZwJq28w3BUm3
	 29T7NggqeOzV7UAssltSib4HDRb1KCAsgfd89fAR5hx+jvA/G+WD+c2e8ylZwidaqK
	 9+OpxR6NDrraGVjRHRxbrcJXGWM0fTWszuRSyfMVTjBKL+7Um4c9gtZdlJIQmBviAw
	 N/CVmQDaNAp5uqDlbT+xe/xMnzOW6c4zCDu2s8DxZpMDr0OAz1xr3M2hi4jKTFdv/E
	 gPViIZ9HAozuQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4411212e04818fb73d29c77707a3998c98d48509491f0db3f0c7977b0839;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 11 Sep 2026 09:32:11 +0200
Message-Id: <DLCB8YQF6G49.1YQJBPWBMZ6IE@kernel.org>
To: "Chen Minqiang" <ptpt52@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: allow force unlocking via DT property
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <2026-08-05171214.2934-1-ptpt52@gmail.com>
 <20260806113733.31042-1-ptpt52@gmail.com>
In-Reply-To: <20260806113733.31042-1-ptpt52@gmail.com>

--4411212e04818fb73d29c77707a3998c98d48509491f0db3f0c7977b0839
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 6, 2026 at 1:37 PM CEST, Chen Minqiang wrote:
> Some SPI NOR flash chips (such as generic or unlisted chips used in vendo=
r
> devices like Tenda AX12L Pro) have Block Protection (BP) bits set in the
> Status Register by bootloaders or factory settings, locking flash blocks.
>
> Because vendors frequently switch between various generic SPI NOR flash
> chips ("Flash Lottery"), it is impractical to upstream explicit chip ID
> flags (SNOR_F_HAS_LOCK) for every possible generic chip variant.
>
> This patch introduces support for the "linux,force-sr-unlock" Device Tree
> property:
> 1. In spi_nor_init_flags(), set the SNOR_F_HAS_LOCK flag on the flash
>    instance if "linux,force-sr-unlock" is present in the flash DT node. T=
his
>    allows spi_nor_late_init_params() to automatically populate default
>    locking_ops without altering swp.c.
> 2. In spi_nor_init(), trigger spi_nor_try_unlock_all() if "linux,force-sr=
-unlock"
>    is set, invoking Linux kernel's native spi_nor_unlock() mechanism.
>
> Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
> ---
> v1 -> v2:
> - Set SNOR_F_HAS_LOCK in spi_nor_init_flags() when "linux,force-sr-unlock=
"
>   is present in DT, allowing spi_nor_late_init_params() to set default
>   locking_ops automatically without modifying swp.c.

I've given you feedback on the v1, there was no reply, so I'm going
to ignore this.

-michael

--4411212e04818fb73d29c77707a3998c98d48509491f0db3f0c7977b0839
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqOuexIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hrUgGAukRRdtCACr9LIqwoWtJi1CwUZH+C0qZN
ZYxM3iKH8SYDHGn6eF7W1my5ebpLbiiiAX4rBV7ScNtHNztqk82pK2whLVWl31/B
qHDS9PKkFncD5+GPwAWjVU8MyZnG2WEbC9c=
=M7iX
-----END PGP SIGNATURE-----

--4411212e04818fb73d29c77707a3998c98d48509491f0db3f0c7977b0839--

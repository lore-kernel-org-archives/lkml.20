Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8440EB9C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374784; cv=none; b=ti02b9aNfoZLRilygFDPXCCvozdg0ZVyqkrolwKsGxKua8iafliPt3WsRblgy36DsUDcCmkjFzQ6T7hv1uKzwTZlRzRJTUG8WSpYntXCT8vCVP74DCTNykX2wzHlhoVh6tnm314/VMwtTIn3t1Ma4dHsfTnxaLTb4TQugPDVyRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374784; c=relaxed/simple;
	bh=7TfHGyLDKigYrKX0lKyKyVlr99ToO+iL4J2l2vtb/vw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=tGN4hyliHqC0Vs5IpBWor7/mKzD/dlDfQ38z1jQxd7IqtBjLpTGwUD8KjPO3fva5igPs9kKs5YaPf//ldvLun7OoUPnTUyi8AW8DX+mQL4Afnpzn1s4VB3C6zYGu6QFa6A5dJ1HPzgAvZkedROrm1p3mPY3PZjza4iAU5fYjyDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjfyVFs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjfyVFs7"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6F2B41F00893;
	Mon, 14 Sep 2026 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374782;
	bh=7TfHGyLDKigYrKX0lKyKyVlr99ToO+iL4J2l2vtb/vw=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=XjfyVFs7ivXy2Ouac5D56JOvm0q33a6bhPNBJ1LbhWBzYrbjUMs9AJIuTY3X9ovoL
	 KXQwkp5Cv0C9+gwY8Q5NdJI3X4SToIGK3hhH/lnoFoicCyggmXmpTsrOiEOOGV6t1l
	 Kfkjf7x/V50/EPpJI1XGENilgx+w09V3g8LTXGIioZxOIrvpJVGB1EoXuiwW0CNOf+
	 AuC6MzVmRxD95LhGcKM6++5Q1piwI/axAhLD9TmelKaB0w0Esj5jPyq+TwN2Bd7OCW
	 n88hTPLMuVKIAILWFiu92uFpWqBR0YNiZ3MdXMJ3Ck8ffwzpUcJhlwudJPos8fqz7a
	 CVgWpUfEo8BkQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=bbbdaab65393f877a3a172d7d3159aff44a70d5f1a437ce91c7acbfe7227;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 14 Sep 2026 10:32:59 +0200
Message-Id: <DLEWF5DGXYAE.179JK12YIHHID@kernel.org>
To: "Itai Handler" <itai.handler@gmail.com>, <pratyush@kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: take the flash lock in
 spi_nor_remove()
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <takahiro.kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-3-itai.handler@gmail.com>
In-Reply-To: <20260910184452.895485-3-itai.handler@gmail.com>

--bbbdaab65393f877a3a172d7d3159aff44a70d5f1a437ce91c7acbfe7227
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 10, 2026 at 8:44 PM CEST, Itai Handler wrote:
> spi_nor_remove() restores the addressing mode with the same unlocked
> call to spi_nor_restore() that spi_nor_shutdown() used before the
> previous patch, and it is exposed the same way: the MTD device is still
> registered at that point, so an unbind can run the restore while another
> thread is in the middle of an operation. A busy flash silently ignores
> the restore, and a restore that lands between two chunks of a read
> switches the chip to 3-byte addressing while the driver keeps sending
> 4 address bytes.
>
> Moving the restore after mtd_device_unregister() would not fix this.
> Since commit 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
> del_mtd_device() drops a reference instead of refusing with -EBUSY when
> the device is in use, so unregistering returns right away and does not
> wait for an operation that is already running.
>
> Take nor->lock for the restore, as spi_nor_shutdown() now does. The
> unregister stays unconditional, so a flash whose restore had to be
> skipped is still torn down.

Why are these two different patches? This should be folded into the
former one.

-michael

--bbbdaab65393f877a3a172d7d3159aff44a70d5f1a437ce91c7acbfe7227
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqexOxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jPmAF9Fy37fgcZRMQrLnNeIYzMnIBHr+NFtkK/
wxEf1Tsr3HfxSUv0lGMQF2kNUt4EA7xVAX48Dw2+6zLI/1HT0PSrykhq9pTN00UY
1mB9KScdZ8z5/bc0x6AggJ15xsgCW3VhI74=
=iJCs
-----END PGP SIGNATURE-----

--bbbdaab65393f877a3a172d7d3159aff44a70d5f1a437ce91c7acbfe7227--

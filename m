Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764053;
	b=Q2usxE6xtK9ojBH0qZEONrOcCWyMVBlhPy9UOY6yA/tddYCpxA/oHvQFlCp9XlG0n9Zg
	 GJ+VoRw3BWo+obU2i3KeiMOfvoEntYVSH4nVKMraiyQsdBzwJZm4Y4A2WU5qLELmMqUDV
	 mXntotWFShZBSR4v+wAX/Vcy7nf+MXDMlp7bhjIl3xbNNCm3WhtoWJuRGPeXUAgyoCv92
	 UmFg2aGlkeOZ7553FFjikrenawGOQ+EesZwF65yr2SYpCGEmp+3rCF5ritucBaA1HJNbT
	 yeAJGBiNCHHYZ5fTpntPHOL4v6ULXRJYWxqo2Ft0T8EjfFqJrmTVymBWWqbBhPcrK/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764053;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=797F4o9CyUJ0EbzFLplHDhntJenClzxqdGSniln5C2A=;
	b=lAfnjeathNZ7pUqlkNvNzKdbvtYkkLfPcMtK66JjVSxiZ95nYiG4sJWvbXGh6tTWuhpX
	 JANYjl2atCvNmR0wCUOiGQyF2wRX6IjAEH4u/2HzQRUjvH/fFRCqQF1W+WtxRSsOGmnVO
	 R0HeFZMeSt0pp6rXQygzYqOtF4Nuu9TXZ4CVQL68Xe+OaMUst6/hWSyuoBM+UlTo7NbG+
	 6M+CwyHRXlaKXvop9iRZD8GBPuzwFqH+h1KglERbH7jYduF8+laUpi7zobyHEK3vnejzo
	 jeVYb/KmHXscDbUaamjFEAvHz91jK5jc0Z65bJyZzjOLAJX7rf/9B6u9MDPKE4Bs6Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SI/+vRkc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F010606A31A;
	Fri, 23 Oct 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SI/+vRkc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C14B1F01825;
	Fri, 23 Oct 2026 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792764052;
	bh=797F4o9CyUJ0EbzFLplHDhntJenClzxqdGSniln5C2A=;
	h=Date:From:To:Cc:Subject;
	b=SI/+vRkcO+mfL8PUdbozOhIQHpgVDYzVuY/U1DHhhCinwDBHsguLaIFjiWRuxZe/y
	 e153xdwX7jPR7axsWtNAX0OP5P6SiKNcSm9VMZZGTg9U1kd+Or7DzqpYF0rDGci8Tf
	 wJA9SJ9Ndg0RcXKnQsPCvzfDlRi7Q/850Ks/S0Qf6hgXbEs1hCBX0tcw6vqliVuzyt
	 PJZJ2GVKv988pvC9sL7k2uAO0O/6mXb7rF4d3DZ31ZYg6oOKs4wSbYBBOwXh+WGh/5
	 r5VwfhrcPigFCL2V3F5zPmAsqFnMlBdWMV84q3mEjnU1YlPfz99f5wvDLibowkE6TJ
	 bkZC45EGANyVQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 540F61AC5994; Fri, 23 Oct 2026 15:00:50 +0100 (BST)
Date: Fri, 23 Oct 2026 15:00:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: linux-next: manual merge of the rust-fixes tree with the origin tree
Message-ID: <attokmkItpQqg6Rb@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="HSckaYExR/YXt0no"
Content-Disposition: inline


--HSckaYExR/YXt0no
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust-fixes tree got a conflict in:

  rust/bindgen_parameters

between commit:

  bc6f2a284c633 ("rust: fwctl: declare cfi_encoding for fwctl_rpc_scope")

=66rom the origin tree and commits:

  01f3e6b4b1c8c ("rust: irq: declare cfi_encoding for irqreturn")
  39fe6892fd52f ("rust: hrtimer: declare cfi_encoding for hrtimer_restart")
  7d109178cd644 ("rust: dma: declare cfi_encoding for dma_data_direction")

=66rom the rust-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/bindgen_parameters
index 39aae62dca669,8577e7663e027..0000000000000
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@@ -27,8 -27,12 +27,14 @@@
  --opaque-type spinlock
 =20
  # enums that appear in indirect function calls should specify a cfi type
+ --newtype-enum dma_data_direction
+ --with-attribute-custom-enum=3Ddma_data_direction=3D'#[cfi_encoding=3D"18=
dma_data_direction"]'
 +--newtype-enum fwctl_rpc_scope
 +--with-attribute-custom-enum=3Dfwctl_rpc_scope=3D'#[cfi_encoding=3D"15fwc=
tl_rpc_scope"]'
+ --newtype-enum hrtimer_restart
+ --with-attribute-custom-enum=3Dhrtimer_restart=3D'#[cfi_encoding=3D"15hrt=
imer_restart"]'
+ --newtype-enum irqreturn
+ --with-attribute-custom-enum=3Dirqreturn=3D'#[cfi_encoding=3D"9irqreturn"=
]'
  --newtype-enum lru_status
  --with-attribute-custom-enum=3Dlru_status=3D'#[cfi_encoding=3D"10lru_stat=
us"]'
 =20

--HSckaYExR/YXt0no
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCattokgAKCRAv73Ows9A4
iVnOAP9jMZhzuGgFpk7toqTs0WJhTh5A8/IlG1olAaxQ0nSqKAD+LEgUylhc7J0O
XQK3R8Ze3HICJwiH49yo5sdroKZ4pwY=
=zD38
-----END PGP SIGNATURE-----

--HSckaYExR/YXt0no--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFEF45FFA7;
	Mon, 14 Sep 2026 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392680; cv=none; b=TcAq7FlZC+xvPyh1YP7+sCJ/EdrygsFFWJTZoCCZwYpD5H2OddwcsN1UFkBnPEeWWOBVuTfUjZnEIXUwgNUJsbkuOvzUFnB0r0WX8EbhbPTiHko2Si6Dqfi7eIdtJc5diLtI3PJf+j7+KaSCrJlxjBvJRF4x2n1NKFZ5/gg5/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392680; c=relaxed/simple;
	bh=HtGcAVmqMWoqS2rOSbrDz0cEVehcqcJJsjKOlER90Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j4zylcoqAQXPL8wwEfsuMaXkFl9dyZkJbanN6ceeWhuZDjGTzYmv9okklZOheFOxdtvI2Idif1UJNA1MqEhhi2PxKBWolPFIcQl3U8dmMp41q1zMk/3ZvS5VxZsMJ4w3vbHViNgha6qEKVXHbAR9+qWU1jB5LxADsjWziTe5R/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzUMzhUE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzUMzhUE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865631F000FF;
	Mon, 14 Sep 2026 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789392678;
	bh=PV9Vv3R+tMI1o+pJSi0BwMQjeMpM7I8wzBrTJUP886I=;
	h=Date:From:To:Cc:Subject;
	b=GzUMzhUEFvLlAuHg76YIn+Q9Af8M1ORNwkC+hfqmYldHkBMJmiJm7Z2fQ//EVP7p3
	 x9GT3iBbHMUeGDC0RWv/9mf/HfLtO8zAI1buAyhO8bUTcItvAdJTF5EaJL/aumfmNa
	 wughE2dOaIoBVmNnGOOAbB/aKHdcIt6prRwWJFShvfJnjFoXHk6wV37GJ5L7XDVkkT
	 jhwALF9UFAvJx33dKkGcbSSpWaJcbJfRlBUqRU2jixCRYke2G4SYhg+bwZCGbZZzTR
	 zV44zKkHupOqybWA2IUK+T4em+N0PPALf1ToTJ2SFvyiTODYHZcKA+UX/uxqXJPICh
	 Qj04oFWF775sg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E0BE21AC52F1; Mon, 14 Sep 2026 14:31:15 +0100 (BST)
Date: Mon, 14 Sep 2026 14:31:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bhargav Joshi <j.bhargav.u@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the phy-next tree with the usb tree
Message-ID: <aqf3I4J3OyKwcg6A@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cj24yMPtpKMXzvCr"
Content-Disposition: inline


--cj24yMPtpKMXzvCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  Documentation/devicetree/bindings/usb/am33xx-usb.txt

between commits:

  d0e95f1c08264 ("dt-bindings: dma: ti,cppi41: Convert to DT schema")
  267e31adc4831 ("dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema=
")
  1c09fe2edad27 ("dt-bindings: usb: ti,musb-am33xx: Convert to DT schema")
  185bb9305937f ("dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to D=
T schema")
  ef7e123401d95 ("dt-bindings: usb: ti,am33xx-usb: Convert to DT schema")

=66rom the usb tree and commit:

  ae6ee6844d5aa ("dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema=
")

=66rom the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(deleted the file)

--cj24yMPtpKMXzvCr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn9yMACgkQJNaLcl1U
h9AigQf/ff8CZHdV406RbEBAEAEUel7qZJLK4jZYWK5z4mbl5EePtsKOTt8On7cA
n43akGE7rAkMW13Dtl+G2FMpijmFd3R5FPOh0MvcqpDVcnN0YutssfaTVnPiz2DN
a1gpfg22mwbEFVul6sis72fx8wVEtlvtDjXGGLCK3Z48ZzXo9hv/GKenKGyvM+4p
7Io1QeUKm0o18OdKYNunFIRQcwlfT61+0mVdeQHJLs0jDFptU8tsZhKFnM+qAA6K
iYUgUyGAwsjf5do92//OhC8mwZJZezdEZxYsYDL5dkQh5Nq8iPggDBMTOg1Wt2Qa
ACWDuzQrE17SEq/iy7mfC131miSUIQ==
=yn08
-----END PGP SIGNATURE-----

--cj24yMPtpKMXzvCr--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78059481FC7;
	Mon, 14 Sep 2026 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397518; cv=none; b=dEIXJbgVGXc4+IJflk17wyGGjyQapq1uEAUhHK8kmp5Ya+8F/VEh9QysgAIZ0cn516grrX9Obl4vdEDgbjTy6j9sCUdbZ/ukYWQwzM+s6zKVPpnghi9fzzMu48hgetokofPGrnKd7KB6ugKMDkufUbonGlL3pyu8IoxCrRoqA3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397518; c=relaxed/simple;
	bh=VfoACWeALQeXlp4xJ1qWx6buQV5mlQjCxsA+DSomCRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hkZ4Lc8+195EDy6WfrGkXXCdtNULHA4IWbuA83yw1NZbOv1mS1Cqri3M8uPSgQ9f/32w2YutN/xe+gYIDOIr8Gq9HJXFT0sTRzCMLI5tgLhJogn8uSZunU9LT4w9cz0wuh7BdaWTa2s8339zbPB7+cpB42qYtaWY2/54oydOl18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjCzVnDd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjCzVnDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB5F1F000FF;
	Mon, 14 Sep 2026 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789397517;
	bh=fNm+wJphthi7XBMHKzlsbKFGQwzn9MbCQDCgSG1EFJc=;
	h=Date:From:To:Cc:Subject;
	b=MjCzVnDdeolDoH+HSk0XgIczFRQs8JuYUpydgBIMSnE6KbRM3KMKQuN+6nebwTrBA
	 YOd3f0EddVDs/bSHj8TGLAFAoZBLI4WcqwdwF4Y/NL2uPDdoRcxtGbTRJSQ10BdyXY
	 SDDgh0lhnS51+cXH7fwzoqDlNjiST5Uu6xX1PLOsVyAkgDlz1BC15vvanvi0Lpjlyt
	 PpnnQVlzlxyOvCiKOsmzXukA5Vat6E+PypgW0DFLzINUHue2gXE3SEjBwNHOtp9Qkv
	 uPgYU1gRFbA6jD0dHxnZyQ4E0HoPFtvuRIEXgi9IqMtX/AO8Eo9yHSfmLkSRSRJttT
	 s/dh+LOOvzPMw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3B0841AC52F1; Mon, 14 Sep 2026 15:51:54 +0100 (BST)
Date: Mon, 14 Sep 2026 15:51:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bhargav Joshi <j.bhargav.u@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the dmaengine tree with the usb tree
Message-ID: <aqgKCmZJtMxQdNFU@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="halWcyrDmXf9qbGr"
Content-Disposition: inline


--halWcyrDmXf9qbGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dmaengine tree got conflicts in:

  Documentation/devicetree/bindings/usb/am33xx-usb.txt
  Documentation/devicetree/bindings/usb/da8xx-usb.txt

between commits:

  d0e95f1c08264 ("dt-bindings: dma: ti,cppi41: Convert to DT schema")
  267e31adc4831 ("dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema=
")
  1c09fe2edad27 ("dt-bindings: usb: ti,musb-am33xx: Convert to DT schema")
  185bb9305937f ("dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to D=
T schema")
  ef7e123401d95 ("dt-bindings: usb: ti,am33xx-usb: Convert to DT schema")
  40d79fbfa9ab8 ("dt-bindings: usb: ti,da830-musb: Convert to DT schema")

=66rom the usb tree and commit:

  c64189e9772d7 ("dt-bindings: dma: ti,cppi41: Convert to DT schema")

=66rom the dmaengine tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(Deleted the files)

--halWcyrDmXf9qbGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoCgkACgkQJNaLcl1U
h9AMFgf/XjmgLPBqBRjNCey1a0L/pSWWedHJavEo57ka8o+aXOvbfLplW/yRgn74
JMf2lDjcLhh8jnylsPOdcr8MVOoYpJ5wd2kKd/j1YBkqW/8NNWrhlav0hiNEhDIm
HJKlnryG/i46DTN2ZTLpA17rG0fFQflbTwVRHTqKK5A3hDhgVayAHyB9NtSTLfh3
zzbp8JkkwSZ+L8sYYDYz8H7iQf/AAq2gRUdxjH9ZG4yJEFniitp9xe5kAtKZf5v1
nJLjagdX/ZupTRW0oOXilQLhSdJ7uZgHrhUTM+MUw/XWSLXfIPdKV/LE2k6thTfE
0WDja9uhBsJFgdPE3AOXKgtU4HPPHw==
=Ir1o
-----END PGP SIGNATURE-----

--halWcyrDmXf9qbGr--

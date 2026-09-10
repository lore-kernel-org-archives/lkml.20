Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0B3515FD;
	Thu, 10 Sep 2026 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050104; cv=none; b=Dh8H6DHtrlVwZga9vbK9RSw6/ATpzp2bVzrvv86bkFeCQj0z2VRyxySejOjhRr+AZDNtR+w2BDipsTUkXbi6mXcLLvbFj8QReeEHei4hkIWMSVMOcQWc7+3oLY2EVoqAueRrhZ0Yqa/rjHiw/rW47V3UDvxnzBO/dfppQkZul54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050104; c=relaxed/simple;
	bh=q9Jq0X6G067OSP5v6HL2t48HWlTbLA9qEp6F/7Uwisc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GmsEeJqcuHJID/qszi12ZHjvElKVJ6UDT3ohijaKlA2xGHrGCK2vUTHkE7qwhrStAxZjtn3IAu9CzSOqseGAeQNGPLtXSeixL2QSGWtIUlrQ1sNrM6Tcj/37QhcDuQk1E14pyHHueR/C9+OF7mNLJEaUYXaRw7PGLLHJtGhBcCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SitB5Tp+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SitB5Tp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305961F000FF;
	Thu, 10 Sep 2026 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050102;
	bh=s7uID5un5koOTLgoILFPBe6BwRVuXzjCjobNtONm5bY=;
	h=Date:From:To:Cc:Subject;
	b=SitB5Tp+2Tzt/EiLGAg/hOm11b/5an2l6aQOl+rWyWe+YCPvXsphVhelsBaUtKHLT
	 cHwaA2on0cOAM6PMTfTIldkRnYSOaU85olY6YYOEssbjtzGAtE0u8DkPBopvaH3ChH
	 vJ8cRkOxU+7dUnqbBfIXnY1khPyEBJ5w3UACbSUQDL/6Wqp/loHM3AlaBOftHCq6dh
	 TyvGIPVxgDbazcsKV4UlMg9VqajtAMTGtrAsNDGfXTjX5+0wyxQ5ip0F3oTk9zh9bK
	 Y0u0XwMpo3R1fRbRUl212S9iG6Dz9g2ItY+nRvhJXoxHZDRf1f4K96QhS2dGvkOjRD
	 JC8CM0HuLMpMQ==
Date: Thu, 10 Sep 2026 15:21:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Jiajia Liu <liujiajia@kylinos.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <aqK88jV3iIf1Lfr7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NTtbaMIbk5oGNkLu"
Content-Disposition: inline


--NTtbaMIbk5oGNkLu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  drivers/bluetooth/btusb.c

between commit:

  e486a891c412d ("Bluetooth: btusb: mediatek: Fix leaked runtime PM referen=
ce in reset")

=66rom the net tree and commit:

  6d437db48c781 ("Bluetooth: btusb: mediatek: Fix leaked runtime PM referen=
ce in reset")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/bluetooth/btusb.c
index 002b9f975710f,a47b51ffdcd0c..0000000000000
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c

--NTtbaMIbk5oGNkLu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqivPEACgkQJNaLcl1U
h9A3Ugf/YRovLpmww0OxGOXjJOKrpqgAIClxXQRqlTbhG8VA5OikswwyKipDMC+w
vmr+m5GFuDmsEQak0wQrFPgScFdzSiREruXLngJAkxaAYcg4gdpk9tNl8hAXIg/d
eVtwzUaVP2uHvy6MhGNFxNqjloFszeyAwQ/wz+NNhzriDO6/wp695N9L0P4ZrRql
/9SzteuJ5wvM8mlUWxsNKu1DG3ZusnDl4xS4ocFuaU6STZF6Tsm9NWvlBZH1XNRQ
lYNZeCeGxAxC9W1cewxY63bTU9heI4X6Lm6PVi38TCZluupDyENRn2jcGYh4yYvp
Axqemie5KQ8bckVKhyVsrnOmWudOcg==
=nL+V
-----END PGP SIGNATURE-----

--NTtbaMIbk5oGNkLu--

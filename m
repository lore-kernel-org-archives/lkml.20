Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECC44BC82;
	Fri,  2 Oct 2026 22:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790980649; cv=none; b=rpyJ+K2nE8g7xwj9DAnqBUAK72iqOLcLndC0s3svUmzRnPmO0bo+16XdAIvXSijR5oXW3KIPeUK5wMODC3ItUxiF+MTqVLkpsydkaN64d996oCqm4hg0F/TrUFv3tinMGrZArbi0NrynuXhBPfoqXVRgBqzQhzrSem+uLiB4Kso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790980649; c=relaxed/simple;
	bh=ZoHmZMtK/rTGVV3D1P2OYNZq7XKNWR+YBlc7qRqnBYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GFMekQ4NxapxTsKKH/quXgTb2Wk73ZJI+xy9j9niKNxCGcmfjKsrSJsZZFK1CmQAtxbHN05LD5MY06c0NhtX4umhWSo0wKEkEBGUNkEi3jyTU3kYgSe2wPgLeDu7VakCIPyI77JLCigg2pd5/arE4fyZ3ON3rCd5AcWPSNw0AsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYPeE/NX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYPeE/NX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A979F1F00898;
	Fri,  2 Oct 2026 22:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790980647;
	bh=i/ORv1F14v+BZParEtlhOutQ4j921JfMV5oqX5YOgpw=;
	h=Date:From:To:Cc:Subject;
	b=cYPeE/NX1Oai+bdZ8cCVOrFD3wFJb3ZNNowSZC4fO65pLh2FPZa+LK5yPCLsL3xlC
	 M4Q1kO5X4y0BX2EdsU7envdqTZ7WnT8BAdiX3OzBtwL5ty4u/pAUBTKrDZWeo+0IQr
	 /YKLMhqd1LieIwI1AJaDXCM9sO2GzU2sG5uphCWkRyjlQparV0y/2rG4H6dsT3QDQv
	 xikxALG1vjfNviBxtEXoRjUq/R1BP5ieZM/4osXybkD5bM3INXURea3kK/l7cakikJ
	 vjmaOQx1VNZuZ5X0Laj7uU5R8pfJAOUBx1asyrUpydaZRpIIPlAzIChK/06b/fPW1S
	 XnVTJXkI7eMQA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 035631AC57CE; Fri, 02 Oct 2026 23:37:17 +0100 (BST)
Date: Sat, 3 Oct 2026 00:37:17 +0200
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marek Vasut <marex@nabladev.com>
Subject: linux-next: manual merge of the riscv-soc tree with the stm32 tree
Message-ID: <asAyHdMiyjWAa9J9@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9t/TIy2mE3HrB5Sg"
Content-Disposition: inline


--9t/TIy2mE3HrB5Sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the riscv-soc tree got conflicts in:

  drivers/soc/Kconfig
  drivers/soc/Makefile

between commit:

  f831584128ac2 ("soc: st: Add STM32MP2 SYSCFG driver")

=66rom the stm32 tree and commit:

  96b35a1251dc9 ("soc: starfive: Add socinfo driver for JHB100 SoC")

=66rom the riscv-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/soc/Kconfig
index dfe5cec592626,b3b01fc38139d..0000000000000
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@@ -24,7 -24,7 +24,8 @@@ source "drivers/soc/renesas/Kconfig
  source "drivers/soc/rockchip/Kconfig"
  source "drivers/soc/samsung/Kconfig"
  source "drivers/soc/sophgo/Kconfig"
 +source "drivers/soc/st/Kconfig"
+ source "drivers/soc/starfive/Kconfig"
  source "drivers/soc/sunxi/Kconfig"
  source "drivers/soc/tegra/Kconfig"
  source "drivers/soc/ti/Kconfig"
diff --cc drivers/soc/Makefile
index 6446c854e5611,009f85ff891a1..0000000000000
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@@ -29,7 -30,7 +29,8 @@@ obj-y				+=3D renesas
  obj-y				+=3D rockchip/
  obj-$(CONFIG_SOC_SAMSUNG)	+=3D samsung/
  obj-y				+=3D sophgo/
 +obj-y				+=3D st/
+ obj-y				+=3D starfive/
  obj-y				+=3D sunxi/
  obj-$(CONFIG_ARCH_TEGRA)	+=3D tegra/
  obj-y				+=3D ti/

--9t/TIy2mE3HrB5Sg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasAyGgAKCRAv73Ows9A4
iXNgAP91xlKywI/OMsfQ2PqtRkUJarRZvLXZZ1VN1FS4xSHBCgD/bKYB/1dBsnNC
TqoPdFAmw6n3wA/RpH3wJFpjFC8Zhw0=
=YwCP
-----END PGP SIGNATURE-----

--9t/TIy2mE3HrB5Sg--

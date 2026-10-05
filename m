Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60BB23D7C2;
	Mon,  5 Oct 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204412; cv=none; b=NdIYRZDHQ8OgErrNtJkjQbP/5CGpNwIPig6UHGGXTovcEunRYwEXMrPgbeZOSVtnjvMxrgsQszpq10IYeKBzHJl5B7nnOU0+4SzrmTEx6uwYfhan5oLGfHRuJx0xg2ika5BrA0z9cVv7gIupGaAem9yrHCzJwtR0T+n5W/7SH1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204412; c=relaxed/simple;
	bh=Vjhj2vJXu78yKfXoliscrD2fK/30+pm5A2kYVPbKNrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJ7KJUA6c9DSTbV2jIgVjEC/ziy5jiyyV9zd3aWMiBuEqgyrH2mKCkAe/OV1UbWsGe5RJ4ZPeKCBBof0toVJa8cGCcqgpRfETs8a+yTIdrIqAzfaLn3NcsBwNqL5ziQ83zxP1QnkOTJLsIWfo2RiqAk+5ZdSXvF22sBGB4mw/cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqBwTNa1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqBwTNa1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E5B1F000FF;
	Mon,  5 Oct 2026 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204411;
	bh=xSQsWrJyGjWrKaFR4gtuCPl6MPlscWhHjH+zcXkkoYA=;
	h=Date:From:To:Cc:Subject;
	b=WqBwTNa1UDrgEs+fx9uQKe0WgzyW2UxJ9149AQpTbrh3pmj4+7pf7lJXVFqnUnxTX
	 PvIOoQy5e4JyIp/GhZhshLQ3HOMgspFP1wMja+jgS43NQcI12Yiynpwa2C5K6KNB3L
	 ZWs3d5/czEcsz+gYpmTghpv5uKAIQa0FMuV90I3J3Z0CW2luu2ImzWIfWK+Vfft84u
	 Xd+dTZXjKHPEJpckpyz/z4Nzzn4N+r8jfiN3RZ5hv/pFtltD4y6UjOfPDYWJJW01fR
	 S21L4fbtuvrEIq1IvL/GvZ22reqFaoySpSyqMbsmDaS9+YBGPwHxQS7Lf/65wswEE/
	 kqFLJJF536uag==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3562D1AC57CE; Mon, 05 Oct 2026 13:46:48 +0100 (BST)
Date: Mon, 5 Oct 2026 14:46:48 +0200
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Georg Wenzel <g.wenzel@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.de>
Subject: linux-next: manual merge of the sound-asoc tree with the sound tree
Message-ID: <asOcOPrfi0lw6NU7@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="71ho3seVYUTYydBh"
Content-Disposition: inline


--71ho3seVYUTYydBh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  include/sound/tas2781.h

between commit:

  3bc4fc135ec74 ("ALSA: hda/tas2781: Enable bass speakers support")

=66rom the sound tree and commit:

  0bebef817d481 ("ASoC: tas2781: Add TAS2573 calibration support")

=66rom the sound-asoc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/sound/tas2781.h
index ccc0142fbad5d,f4275226366de..0000000000000
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@@ -91,18 -98,30 +98,42 @@@
  /* prm_TE_1_Beta1 */
  #define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
 =20
 +/* TAS2563 ASI (Audio Serial Interface) Register Definitions */
 +#define TAS2563_ASI_CFG_REG			TASDEVICE_REG(0x00, 0x00, 0x06)
 +#define TAS2563_ASI_SR_REG			TASDEVICE_REG(0x00, 0x00, 0x07)
 +#define TAS2563_ASI_FS_REG			TASDEVICE_REG(0x00, 0x00, 0x08)
 +#define TAS2563_ASI_DA_REG			TASDEVICE_REG(0x00, 0x00, 0x0a)
 +#define TAS2563_ASI_TDM_REG			TASDEVICE_REG(0x00, 0x00, 0x0b)
 +#define TAS2563_ASI_DL_REG			TASDEVICE_REG(0x00, 0x00, 0x0c)
 +#define TAS2563_ASI_SLOT_REG		TASDEVICE_REG(0x00, 0x00, 0x30)
 +
 +/* TAS2563 ASI Apply Register (triggers configuration update) */
 +#define TAS2563_ASI_APPLY_REG			TASDEVICE_REG(0x00, 0x00, 0x02)
 +
+ #define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
+ /* YM57 */
+ #define TAS2573_FCT_OUTPUT_R0		TASDEVICE_REG(0x00, 0x65, 0x74)
+ /* YM58 */
+ #define TAS2573_FCT_OUTPUT_R0_LOW	TASDEVICE_REG(0x00, 0x65, 0x78)
+ /* YM59 */
+ #define TAS2573_FCT_OUTPUT_INV_R0	TASDEVICE_REG(0x00, 0x65, 0x7C)
+ /* YM61 */
+ #define TAS2573_FCT_OUTPUT_POWERTOT	TASDEVICE_REG(0x00, 0x66, 0x0C)
+ /* YM64 */
+ #define TAS2573_FCT_OUTPUT_F0		TASDEVICE_REG(0x00, 0x65, 0x18)
+ /* YM147 */
+ #define TAS2573_FCT_STATUS_CTRL		TASDEVICE_REG(0x00, 0x68, 0x74)
+ /* YM148 */
+ #define TAS2573_FCT_STATUS_BINNING	TASDEVICE_REG(0x00, 0x68, 0x78)
+ /* YM664 */
+ #define TAS2573_RE_OUT			TASDEVICE_REG(0x00, 0x7A, 0x18)
+ /* YM952 */
+ #define TAS2573_SILENCE_DETECTED	TASDEVICE_REG(0x00, 0x83, 0x60)
+ /* YM954 */
+ #define TAS2573_OPEN_CIRCUIT		TASDEVICE_REG(0x00, 0x83, 0x68)
+ /* YM955 */
+ #define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
+=20
  #define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
  #define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
  #define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)

--71ho3seVYUTYydBh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOcMQAKCRAv73Ows9A4
iY8TAQD3Oh6Zoi1bUVelSR2RfIP4fgrOYS3lGTfoEKm4f9abbAD+OCAdneKLR6e8
8MGsVIaSNa5C5C1CWg3YLw4PJBUHnwc=
=W3Kp
-----END PGP SIGNATURE-----

--71ho3seVYUTYydBh--

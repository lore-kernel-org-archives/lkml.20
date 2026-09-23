Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D0554281F;
	Wed, 23 Sep 2026 22:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201559; cv=none; b=BydhPNUrrbOyhC12xuOPSrDvZtfGRtRGBe5FligZkDclAGtRC6r51CJWDXG3g4bTwIPvx6/eXgtuIQcYy26KPVdFGY+jwtDDOayq9mmQ4Aw/DuUvG1PwU2l1tKEMJTIHpH4Ur5OCQyc10OPmpRRKEd/QMyWmX1YpI+4eWr4v1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201559; c=relaxed/simple;
	bh=n49NSHSRHam8eZXrlL4TZ2hZcCdsvpimB6jWVXLuduY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nLl0EXxrrIuvjrQ2DEEXJojjpEkT8MgUfxXWJeXyuS/03JURFrdH47UIZiLtMKL/TdEJaZwqAZyCB/7mQj0fH3mjGZWq1N9ul//u2I8TojFaRscMNDYV25tO0fUCKDuKwvhN0ahgt5nx5cV3ZRFrSlQXMzsKiGtc0ssDdLg4Tco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S88K1izt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S88K1izt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024941F000FF;
	Wed, 23 Sep 2026 22:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790201558;
	bh=dou7S7Tg8BcLleRG75nWjmDv7eyBLGo7wlB5b1rcOUk=;
	h=Date:From:To:Cc:Subject;
	b=S88K1iztLNbrDYk+WG5rjVJEc84y7/68frIReF9VQxVGBHQFz3/CfNCepswUk66nR
	 AIKtbznaNY8YqnAkIdNVQpf96XajeeWKHcB8xwCc5kmvVhwbL4atog6lvDLXHbAYoL
	 qpyguTiFK4tsmXeyyQBIBpPSiLV3hVy5j5vY1iXFcKd/mr8apcetegQ+TmEfHNK/1R
	 SFU0N5YsQMyUM1K/vcuzaV+vhLhm9x0bvm6Oc6Kvto848C/Ko3EH/U7QtJFxQj9gJ0
	 mE9FeVrtDPQU9PjDveFm3FdCkxxF4jPqkwaQ/gE/L9uXMFMadzO2ybI/3l30LYH6Cr
	 t1mAS9/B6E7AA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B21091AC57C3; Wed, 23 Sep 2026 23:12:35 +0100 (BST)
Date: Wed, 23 Sep 2026 23:12:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>, Yury Norov <ynorov@nvidia.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bitmap tree
Message-ID: <arRO00VFHgqajmoD@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KNPaPQkxmv30PiYG"
Content-Disposition: inline


--KNPaPQkxmv30PiYG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/iio/adc/ad7768.c:470:12: error: call to undeclared =
function 'be16_replace_bits'; ISO C99 and later do not support implicit fun=
ction declarations [-Wimplicit-function-declaration]
  470 |         st->d16 =3D be16_replace_bits(cpu_to_be16(AD7768_SPI_READ_C=
MD), reg,
      |                   ^

due to commit

   508bdb4938928 ("iio: adc: Add AD7768 and AD7768-4 core support")

interacting with

   1c88ceb09d5e5 ("bitfield: get rid of __MAKE_OP machinery")=20

=66rom the bitmap tree, that removed a bunch of function including
be16_replace_bits() which had no in kernel users but the new driver adds
a user.  I have applied the fixup below (which I'll send a a proper
patch shortly) and can carry as required.

=46rom 8eac82a4d67b29972540fdbf603768f222f870ea Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Sep 2026 22:49:22 +0100
Subject: [PATCH] bitfield: Restore be16_replace_bits()

Commit 1c88ceb09d5e5 ("bitfield: get rid of __MAKE_OP machinery")
removed a bunch of unused bitfield operations including
be16_replace_bits() but commit 508bdb4938928 ("iio: adc: Add AD7768 and
AD7768-4 core support") introduces a new user.  Restore the function so
the build still works once both branches are merged.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/bitfield-fix-width.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/bitfield-fix-width.h b/include/linux/bitfield-fi=
x-width.h
index fba86bb76999f..f73b8cd656010 100644
--- a/include/linux/bitfield-fix-width.h
+++ b/include/linux/bitfield-fix-width.h
@@ -93,6 +93,12 @@ u16 be16_get_bits(__be16 v, u16 field)
 	return (be16_to_cpu(v) & field) / field_multiplier(field);
 }
=20
+static __always_inline __must_check
+__be16 be16_replace_bits(__be16 old, u16 val, u16 field)
+{
+	return (old & ~cpu_to_be16(field)) | be16_encode_bits(val, field);
+}
+
 static __always_inline __must_check
 __u16 u16_encode_bits(u16 v, u16 field)
 {
--=20
2.47.3


--KNPaPQkxmv30PiYG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq0TtIACgkQJNaLcl1U
h9D3CAf9FGSc9LSr/A5D1K8pEmgQ1HaTlbx9THJF9rnPJUDx7UQUSRr8WKWpTVFb
go/hQChXKHsx4FhjUlFHHPqDbltIqWk/+xEWjPBEnXFdUSIXxMwYse/EwDR2geBx
IhIe+ySEoIoFUADyqjCjc58QkVryUwqPS8QO/NNDmws2NkAujrQLHcqW3qAcrhTY
YwVXEQtChYRM15wJbGoWPIMkx5xQziJd/n1HWZC5x32KHSr5pkBVoUsjdWrwmp0n
0AwBpOmati9SOGZErkUu2xqbgRB4FGPoRzHBRJ8zgWSWpFy8XIdXb1Bp1mN1cnKz
5K9fLDlqUJwd/FEPh1sy61EhbW4hdA==
=IOEZ
-----END PGP SIGNATURE-----

--KNPaPQkxmv30PiYG--

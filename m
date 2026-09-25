Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181FA463B9B;
	Fri, 25 Sep 2026 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337234; cv=none; b=qEtBZErXN5H2DS8maFzZDbmFKjV6FW1JNvGlai9Gzkf/yk+0wgJIx45bKj5wq9sQWNPhT6qd3ja3GjDSUJ+abhMPkpYisTueZinDoLQZHCRIDvKpE6eAIhvgWH5e3p6J/CeO0a38hUSa/WtpcbrHNHysorn6sHtZ1obMVOccGDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337234; c=relaxed/simple;
	bh=1hp00NwwGZIh6/ZKdJD0stDOzwbKaekl1m6UIAbNdTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mk9MufPp7lMcsBQ38e+Ms9Y1DMzaXGBQrSartH8v7zb3+BVioWEe2rmgYp3V/JErMzBhf0prL4WbRFt0SEmEBXBaBCSleSH9WeOFji/a7Mf5jWNB3fe3bZ6jxTfEh+aOlH94bJcM5z3VCr9qlBpuSAZkY0VmSzbk6pHwPVsFyAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOpPD76N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOpPD76N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669921F00893;
	Fri, 25 Sep 2026 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337233;
	bh=MAKb+IWHrCWpBGqwBJTCjIu2O8HeIqOrScIvHnt6DDo=;
	h=Date:From:To:Cc:Subject;
	b=LOpPD76N24jFhGqjcvHulWGj0ZvKskfRSeAoYyMaXlBb7aHBx2mlyrmKWddBvWM2T
	 o99rxm59fWYK5gbMPltpEnyogc/cGhU2gvEshKE0LSVDy/7sG0ZR8XYfOilCFtqBMu
	 ONCPRWHazFX37/WmxPPL1IyZITFO+7sGOPa52r0ck7WJolR4PpkjUZ+imIlIWau/LY
	 xSZyDeqmHVSMVAO9OrS9ie54JXG2GkeI2mrTmr5M+inEtQ1EntVxYyRX/YQELAZDus
	 rbF3qrLEZBkDCFQefLd82AW581NqjyiyUAsQoGyDuflcK1DqmYge0u5FLDVZnnQIhS
	 A059cdcaG3pIg==
Date: Fri, 25 Sep 2026 12:53:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the qcom tree with the arm64 tree
Message-ID: <arZgzLfF0qjEXPpO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KKwwxbr8loCV/yRB"
Content-Disposition: inline


--KKwwxbr8loCV/yRB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the qcom tree got a conflict in:

  include/linux/mod_devicetable.h

between commit:

  fe7f2a8054433 ("firmware: smccc: Add an Arm SMCCC bus")

=66rom the arm64 tree and commit:

  fe7f2a8054433 ("firmware: smccc: Add an Arm SMCCC bus")

=66rom the qcom tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/mod_devicetable.h
index 318c4b5c3451b,4fe1cd64292f1..0000000000000
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@@ -15,8 -15,6 +15,7 @@@
  #include "device-id/acpi.h"
  #include "device-id/amba.h"
  #include "device-id/ap.h"
- #include "device-id/apr.h"
 +#include "device-id/arm_smccc.h"
  #include "device-id/auxiliary.h"
  #include "device-id/bcma.h"
  #include "device-id/ccw.h"

--KKwwxbr8loCV/yRB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2YMwACgkQJNaLcl1U
h9DoMgf/Vf7qzUbdU8emD3TH06UOA66dwaSDz2/eMbXLDG0uaxvyogQzOEOZF9G0
itJYRBAvwt+yIKRhaN+CGQjjgTlG0WIHcpR9o7shjoyx6Nd0lHd/gBRWtVCzr7Nv
xdtFhVftwnG1UvMSbPZpN1VYelxdCk7TKFhglTwfUt4PBMDdFKRQ39ob8cSwlC9P
RnSHMHfcSxzo6Zhgalm24zbo4XvwpSHNcPUENgHG/11wA6neq9DZRLd6QNaEFh3N
boPE03PKn/YDr1p/Qlj6bnlnt25+Oz70qZ1PM7+m5UawA8io9ctGaH2mr/EUmieE
Z7p4sfNPmmb7h9NQTMSKZwWS8wq39g==
=+ozk
-----END PGP SIGNATURE-----

--KKwwxbr8loCV/yRB--

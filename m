Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854256;
	b=ts5ok5ULEmzIL9UPRaEAGyRR51vpsJNPVmXyv2omoTchewk4aw7nnXWLz0igsFKVb8F0
	 4f/oK8GEgNgpKzqR40iWbCZx7Kz3apWh2sGiy1Yj4uzEznKHuLqkUxVofhLSqWmK+p/yd
	 P3ZyAoSkYvDzkqxqgJSkx+m5QgCCQGclq5F/tfBdKYoexAbkRciRN9EYJb+BoGsbG0Cm8
	 7l2LSRmTMIe9szQazQeMlWeI27DuGeMA8wj9veqcewa9C71krFtkVyXmv9YDw2q1ilBdR
	 ViFLfZFfzK64qfbpie3mvLJrb9ixlHKamPzSdkUVTqTWviw5WsNMvCUPpE+HmB1/azA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854256;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Wox4ZOzSwGPJHcVy6QKzDL2Ln9iyJgKNlHI3UI/3MUA=;
	b=g2o9mbvp7w03OBRPDZgcDnqaLJYK34raL22EvLVLJHqGCylPXQWreUmIOYQg06svpJXx
	 1GlOWXAhdEwv80iH0aHP2zo3zncNVu6KI2WeV8ncoSqypOZ63Y2CKtv+dC7coFnWv9dV1
	 WDhs4MQTg7K0fTgn9zl6NInVUU+YdweinMBKSb/09LBuSBZA2rRHsHKNfSxfwjSYrIU9u
	 zs/6CaL2l4m76oUQFw70Ye2L4L7Bl827lWnYC5ZGFETK6ejah9pNRbh6E3rqTn3UdonH4
	 xPmKFchXJwt1AC1c4SbYucnaDzdtyZI9WUd2PfgdfietdOCu8Bwn60FwH69UMlMkf/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amWOFTsP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0719B606A330;
	Thu,  5 Nov 2026 04:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amWOFTsP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993A71F000C1;
	Thu,  5 Nov 2026 04:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793854255;
	bh=Wox4ZOzSwGPJHcVy6QKzDL2Ln9iyJgKNlHI3UI/3MUA=;
	h=Date:From:To:Cc:Subject;
	b=amWOFTsPJFn2ZloZkSVIVi69ohv7/Chiky/vCmyROQAS9y/sbM0wSHbmYPxJMFd4E
	 m4JF2uJhhl1nMcxY7zvX+XUxN/HF558inw6eyPzoJDEzxJcUPXCJEcYchj9TCshSNv
	 Z2aDBYFNdItDVZFx4x3FisRBG+GwtkOxTxazMloinP56POJqFZ0xzIeiug9+giRhHP
	 TOS0g3Gky/W/Y9GDvn9RsureRjbVKOR0Ma70ZingXbMrZhi/TaeQZcf9LyeKNl44KO
	 olBmAc7fAyJr9dlN+fHn9NVGVXYsCYPCZ0oMSDNYv62ZohGPjpE9vnYw/o2svqqsd6
	 gm2jM0OrMadxQ==
Date: Thu, 5 Nov 2026 04:50:52 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: [GIT PULL] chrome-platform-firmware fixes for v7.4-rc2
Message-ID: <auwLLFIY6FBdB1H0@google.com>
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
	protocol="application/pgp-signature"; boundary="qkPP0LrpTLt/Mg7m"
Content-Disposition: inline


--qkPP0LrpTLt/Mg7m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull chrome-platform-firmware fixes for Linux v7.4-rc2.

Thanks,
Tzung-Bi
------
The following changes since commit f2e05ce9763feb1dd7da15afd2cc61df227ee85a:

  firmware: coreboot: Add CFR firmware attributes driver (2026-09-30 20:34:=
13 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git t=
ags/chrome-platform-firmware-fixes-v7.4-rc2

for you to fetch changes up to 2433db2af8e1482a3a50b8cefaf25cf7e4a9374d:

  firmware: coreboot: Fix CFR error-pointer handling warning (2026-11-02 03=
:11:53 +0000)

----------------------------------------------------------------
chrome-platform-firmware: Fixes for v7.4-rc2

- Don't skip CBMEM entries outside of known memory resources.
- Fix a Coccinelle warning for error-pointer handling in coreboot-cfr.

----------------------------------------------------------------
Micha=C5=82 Kope=C4=87 (1):
      firmware: coreboot: Don't skip CBMEM entries outside of known memory

Sean Rhodes (1):
      firmware: coreboot: Fix CFR error-pointer handling warning

 drivers/firmware/coreboot/coreboot-cfr.c   |  2 +-
 drivers/firmware/coreboot/coreboot_table.c | 42 ++++++++++++++++++--------=
----
 2 files changed, 26 insertions(+), 18 deletions(-)

--qkPP0LrpTLt/Mg7m
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCauwLKgAKCRArxTEGBto8
9H5CAP0YJUF5YMaOLVThFcbuCMkQjtj5eFzEws4Dn1SqQgvINwEAsHJS7i6IHdAs
RHVgX2Z9UPeWFjJV00Kuv/ntlhoj2g4=
=0iYY
-----END PGP SIGNATURE-----

--qkPP0LrpTLt/Mg7m--

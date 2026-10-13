Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590BE514762
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904463; cv=none; b=IsTPIbowhMCpW5CLEOh4QHq2WNz4YJ5zwrRo2ktmE0U/qTb5+YXRQDe4KhfqHF1mcVmwTRgGv0RBZwQYP5DdwzO5aFw2p/h47CmXNbjTtBT7YOPTk5XDhPY1a+i2T/TDuXGHglmjsn7SViycqA9QgFCq208OKToBY6oOSGlXx8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904463; c=relaxed/simple;
	bh=kJrDlXoE5a6jUNqPztV3gwoXijjZr0+JIi8DXVb80bA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0L8xZkjpS6qWqx6xs79dSo3sWoZ3GUpeO/frhT43pwSdbhQawXSbOIl/V2vr42pk4rI/38aBLYnEPFTF6YH4EQqPVIgQjD8tbrNDijoRMLY2mwM1SnAeOPgyH2P6GfEqifFN7nCSQjuzdLOj5cTupVlGuVj1OWVOfX4P8oEv3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbZvV5w+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbZvV5w+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C031F00893;
	Tue, 13 Oct 2026 15:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791904462;
	bh=D0utRe0E62LZUgbcNlAyaZfvr0Rzwu57gIO+FlQ0APE=;
	h=Date:From:To:Cc:Subject;
	b=dbZvV5w+FUVkh/Huf85LYfrrPlgLJyVq/lba1pWxPhJEAE47KeXzmAL0riF1p4gVk
	 yPOkJ3sSCaAxcH+SiHbvFZHw+59cC83QhL+8WA8kPpDRGSbcjNFFzv46E42H7ZUprs
	 MtXUgoMBE+WhOWD43V7bESvX0BuIjKcXXnSUdnGEjudLBWrrP3g9lrbAICONbOUO6G
	 n7GGbBjMKUuRoXo8GMBFXN+D7EsDIr1k/tF682YweXWRYYCqe9ku8u6+U+/c8twRZ/
	 1WuDFEmzws5mKpvpg1NOuVzE6dxRZeCVoignc18watgAZ+aI0R5nQIQ+YEj3xan3eV
	 IM8wL1m7PupTg==
Date: Tue, 13 Oct 2026 16:14:18 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL][1/4] RISC-V firmware drivers for v7.4
Message-ID: <20261013-defame-busload-7eeb111f35ce@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jNpu6dllGuEb8pJn"
Content-Disposition: inline

--jNpu6dllGuEb8pJn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Might be my last mini PR here, since the RISC-V SSE driver is coming via
the actual RISC-V tree, so there'll almost certainly be a much increased
activity here going forwards.

I'm a bit late PR wise (sorry) but I blame conferences and a busy week
beforehand for that...

Thanks,
Conor.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-firmware-for-v7.4

for you to fetch changes up to 525e00a1bbced112f5431448842b27fa7621725f:

  firmware: microchip: use kzalloc_objs() instead of kzalloc() with multiply (2026-09-08 20:36:04 +0100)

----------------------------------------------------------------
RISC-V firmware drivers for v7.4

A single fix/cleanup for the auto update driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Hrushiraj Gandhi (1):
      firmware: microchip: use kzalloc_objs() instead of kzalloc() with multiply

 drivers/firmware/microchip/mpfs-auto-update.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--jNpu6dllGuEb8pJn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5KygAKCRB4tDGHoIJi
0qSOAP49wPHAf2y8sSffTwYr4llUvrZHFI+39OFIeBEQRrhdJAD/QenHTS3mxVus
wzxg9AR4DsaKzhXIwf+qrGDJd4kdOA4=
=3OOu
-----END PGP SIGNATURE-----

--jNpu6dllGuEb8pJn--

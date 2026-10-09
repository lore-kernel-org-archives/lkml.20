Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D2842C508
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538199; cv=none; b=pFvyQFijPm0vcJFthq3I2a8GNPajQ3Msb7KTzA36fS2fDD++PZTxgPio3JsyhWKskRM8rpybBlzeNJ5cmehZJlwCOPCMb3SDlpGjR5JibrFT7boLUgF4VImcKBedkq30NlMgPASbQ39hqfHk8ZMiL4TkTHQxMdFFNAgKzPfHPjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538199; c=relaxed/simple;
	bh=qDEQ1p4XuxHmTM0e7Zo9z3OfKumWMyvwvwAyRR22GhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KI4IsbSSzA/WcvwFbxTK5BJUO7trOnk8lP5gxTVP9PzNkpvjT0R+I/DWT1P9PLSF0F2iUDAmI0qpQxV7loTR0/wivv+MVkYt5viYjuwpXTo1qloZnB8lWxP14CCNbgGuIaHxBxgdOF866/0OQR2MV84sZZZK392pH/XR1cpycG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcrVp6SV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcrVp6SV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1851E1F000FF;
	Fri,  9 Oct 2026 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538198;
	bh=VfqAS3xVtdPGaSLM4cdLGjFENInOxmgNDUluYvb/JrE=;
	h=Date:From:To:Cc:Subject;
	b=dcrVp6SVksawPXTF0QrIhj3mC6m4vitrqttSkM/b5tSj7ZIWeNML7Xlj7zTUZVF0N
	 eunRP0D9kaDbyFj+8iWpR9jd09q5ZWU8HH3P9xZ73Bbbvr2AWR6JFnwcaWVWXs5NuH
	 Hd2yCskSRP6ARpgE29bRaFKw2sRD0lPwlfN3RbBOdw+axF/TPyKGS6XH1gNOU+KaM1
	 sZZqDdojFt5LkizVsNQS7PFNXnxeRFnfNOB1Ao/wad6SxzGC7ub1ciIW0WVKkZ5bZM
	 beevAIcqdz6IzwOMeqK/oo9zdB0QG788wqUMVXPHuDPOcZbfBr30ZvnWdNo54B6byR
	 p35414Dr9pwog==
Date: Fri, 9 Oct 2026 10:29:53 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org, dlemoal@kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RISCV: canaan: Deprecated (oficially) the K210
Message-ID: <20261009-ee797bb64a30cf907f583aca@squawk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kbpjpruCjiPUyCYz"
Content-Disposition: inline

--kbpjpruCjiPUyCYz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Conor Dooley <conor.dooley@microchip.com>

Two years ago, at LPC, the only known user of the k210, Damien, gave his
okay to delete the platform from the kernel but this never actually took
place. Deprecate the platform now, marking it as broken so that users
will have to explicitly re-enable it on updating their kernels.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Another patch written during a talk, but it's simple so suuuuurely it'll
not be broken, right?

---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index c174ac0ec46b..56eeddd94972 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -105,6 +105,7 @@ config ARCH_CANAAN
 config SOC_CANAAN_K210
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU && ARCH_CANAAN
+	depends on BROKEN
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
--=20
2.56.0


--kbpjpruCjiPUyCYz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasi0CQAKCRB4tDGHoIJi
0nBNAP9WUvB1AG2MV6qlC1dSRVmmYzxBAbfVoIRXWQJq7xguwgEA6ZuBNEglwKS8
7suA1k6W5ooSci751bG5jSw9eE061Qg=
=D0eX
-----END PGP SIGNATURE-----

--kbpjpruCjiPUyCYz--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731768;
	b=oSCP87OXWL5o0Y4ORQdO+9c8m8cFoYX1H9sBIA2PbkBs8RuQ82xYkFNeimJbcQn33Vfl
	 uCQQf2a1q42RonPi1sNfqvBXzzupVvLJy8pgr8cHEwaa5+estWTrQtDR9j6mkK979pEoF
	 loE1hIYjCeUzyNWygS/Jo9hZfUPjyH44gqyX3UNj6Y4wulQRN//h0YGecy72fdVF0Ge+X
	 EmN/OyxLQgB7gaVIMycea8etISHRpfA2T6rSxYTn/c7Pytfi+SzUDsfNTEA9/4jCXsbwf
	 z9XpnEigOIuOyyUcnZOvIPnsLReaXGLQCKfCdP3zaDQEaBW3du7xLjsak2tWSFwhe0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731768;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fP04ZpmNAf1RNl3ZAByulH2Uas5k3RTZiNWH+dKnMwo=;
	b=gW97WbrcxYjMr92lR4JkcsnEWUX9nuJiELAKgBteZ0nsnDDdF9RE1SPSgwhLaxF+k8UR
	 +EQvndVwcofTM0z1AYydbnHCzeB+dKCOUaaBJSD7t6yJXjJtFnJk/t60MxZVilMum/c+U
	 muC7uRBv2dKQeOFbAgi6zWkADyFT7lrQThXOIPzw0OtkHO9X8aImOGtMBXF7eL/707dvv
	 jIZOk+D0JwHeB3JDXb2fIse/e1S5uo3+bs23Wvz3HgLHIkroCy94/wRicx8JTOXL1fHqS
	 R+fz7DLPUrpRHKKvuMfIRVXVBx84fK3g27GZYsr6RnTlXsndnS8l7AQbJlj33N0/xJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TqtcnPlE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7FE606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TqtcnPlE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2101F00A02;
	Tue,  3 Nov 2026 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793731768;
	bh=fP04ZpmNAf1RNl3ZAByulH2Uas5k3RTZiNWH+dKnMwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TqtcnPlE2JIVRxHinTkM45BDyZFNL33vRUsIaH5gy0erND8IZE/PO/AYLwrvRTM6Y
	 5BUgp7IW0FX0rdbdfSJiWNF+szFm1J9fVgyuPb97Fhmw0fDCL207QDvHohYqzafnen
	 Rz+jt9L2f9PonF54iQ5GY+qjzCxnd47QXZeIL8U7WkBTg1RuGqXtSAcJlhpDwxqjXL
	 K0x0TCmVTHs7JxwukdlosYfsNSSvFp8Q5KFF3nBU/fI69N0AUfbR+Ym9kBHh9gih5u
	 waKBjpQlMVYzgTFsBc2fT/UHZGGVn5wAIOq0pv35ApWvzFiYlSYKEd7j8wGqX+Rpsx
	 zEw8KwmAL9Dpw==
Date: Tue, 3 Nov 2026 18:49:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <20261103-abnormal-remedy-05f07229b231@spud>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
 <20261102-persuader-catering-5ed81c35ae0e@spud>
 <1bcc885c-b013-4ab3-9b08-1d1f89b09762@mobileye.com>
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
	protocol="application/pgp-signature"; boundary="hbZ37NZYZyvMho4S"
Content-Disposition: inline
In-Reply-To: <1bcc885c-b013-4ab3-9b08-1d1f89b09762@mobileye.com>

--hbZ37NZYZyvMho4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 02:57:29PM +0200, Vladimir Kondratiev wrote:
> Some of issues already fixed on v4.
> - Link to v4:
> https://patch.msgid.link/20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com
>=20
> On 11/2/26 20:46, Conor Dooley wrote:
> > On Mon, Oct 26, 2026 at 11:20:02AM +0200, Vladimir Kondratiev wrote:
> >> The A extension is Zaamo plus Zalrsc. MIPS P8700 implements only
> >> Zalrsc, and its AMO instructions trap to SBI. A typical atomic is
> >> about 40 cycles with LR/SC and about 600 cycles with an emulated AMO,
> >> so keep the existing AMO sequences when the toolchain defines
> >> __riscv_zaamo or __riscv_atomic, and use an LR/SC loop otherwise.
> >>
> >> Add RISCV_ISA_ZAAMO and RISCV_ISA_ZALRSC. Both default on, and that
> >> selection still passes "a" in -march. Zaamo can be turned off only
> >> with CONFIG_NONPORTABLE; Zalrsc remains required because cmpxchg and
> >> the conditional atomics are LR/SC sequences. An LR/SC-only build
> >> passes _zalrsc instead of "a".
> >>
> >> Suggested-by: Chao-ying Fu <cfu@wavecomp.com>
> >> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> >=20
> > As you can see by the lkp reports, this is not the right way to do this.
>=20
> I fixed these lkp reported bugs in v4 by TOOLCHAIN_HAS_ZALRSC that test
> compiler support of _zalrsc in -march

Right, I'll go conjure up a reply to v4 so.

--hbZ37NZYZyvMho4S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauossgAKCRB4tDGHoIJi
0oWwAP495dJRvyantdd0aiHJkf2TkWUWeZTCv+sj8dYEk9iGXAD/frROj/a8WNTi
IF278EwVJ6FvORosO9Yv1LsiVWq4aQM=
=kYd3
-----END PGP SIGNATURE-----

--hbZ37NZYZyvMho4S--

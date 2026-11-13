Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586918;
	b=lw7+ZCy0MH2RN6gRa0GQDSWhfIcFjoVO+7Nz73SAdIGnIOZGELG2vYBMxfQtXR7BZZks
	 bQGMRxUl3DCE+X9utkWRhKDOvqz51N7qgHVy6riThxAMK/VoU0dhHrVjexwOU0feiun4Z
	 kr1e0YLwaVA9zmLZp4UkRgcz0UnR9k0JQA/4PfJCZRTRdIGHMwUxpkP7PFQIaesgwNV9d
	 qeqZsVvPpSvHqwwtFAy1Z74gsxDs+r4Vlb5EXeguJoE5PCLArVIl/fi2+OA5+IGHF7vs+
	 lhoVJe4Cm/G8jdFA7nIhMhoS3xWLrelf/R5t2f1fcUvUjl32tNvR3VtXoov+Oj8Rm7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586918;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fIXPmzhR4Ap9kSK0s1ZKRTXuiT+xn9k/ZdxjDpdymhs=;
	b=ywusnBDBM4u068r+V9KfQXGh8Rb3i3qLEwGhVR/anGTuXryS2rk0Rg0LHDd92nOYP1LJ
	 G1mw/ac0ycPEe31+HYa3XSmmpAb61BPAWVlAOZvdrtlFjYFp0F2+jT75YdeG5TsbfR6TX
	 ZKs3vQ9Z+nOzOiwnTDsGGlRoPQs4sRHYue4zAJzan43KEoISCWZWL8KQSdr46KoR3mD9i
	 Dqyv8b8vmRMlReEwcNxt5/ETiOnhSyd11ccwzUtK6P8vbVaESD/ely2j3oJliyxr/1eHd
	 y5ayckSTDrrZzhdNVPtzS6nP5GXvWJ0k/W4UDC2z6zjOawoKKql34s4/CYfX60AYA3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i5EelJRB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636D606A8B3;
	Fri, 13 Nov 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i5EelJRB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E07C1F000C4;
	Fri, 13 Nov 2026 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586918;
	bh=fIXPmzhR4Ap9kSK0s1ZKRTXuiT+xn9k/ZdxjDpdymhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i5EelJRBHORAp13IHkBsq3E84S2AkEYzM9L5ugnwkXXka+PDWQ+ZldHoj5Y5UDlJg
	 bubhAGlj7FnjrVRDytr8ShilLe/HCl8H7nYzpL29zcPNBH2WFKVbHswekM/W3Shlt+
	 ivhTMgzcIxY/maB8AwarXYoQmvsIntqZ+iOlguNADPyR9npSBV3IIpuATleWJiztaS
	 8uZn+a4uhvMAdh/PzvXMeL63oCgmeVq3PSqq+RPxIqEQalI0FVc/40Dp1Jn9MUmqSv
	 Jdtcd4aXMeQzxdhVVY3dc8l5lxqakYyYPjweUonx4rqUEz4JQ9HyTUJK7SK5Pn94Vj
	 MxKY60igbNkQQ==
Date: Fri, 13 Nov 2026 16:21:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 00/19] riscv: andes: make the LLC driver and cache
 errata generic
Message-ID: <20261113-overcoat-facedown-fcac3e162931@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
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
	protocol="application/pgp-signature"; boundary="lRtlk1dXxjMUQU+8"
Content-Disposition: inline
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>

--lRtlk1dXxjMUQU+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:24PM +0800, Mina Hui-Min Chou wrote:
> The Andes last level cache (LLC) driver and the Andes cache errata were
> written for the AX45MP core in the Renesas RZ/Five. Other Andes cores use
> the same LLC controller and need the same CCTL-based cache maintenance,
> but the driver, its binding and the errata only handle AX45MP.
>=20
> This series makes them generic, in preparation for the Allwinner V821
> SoC [1][2], which uses the Andes A27L2 core [3]. The A27L2 has neither
> IOCP nor Zicbom, so it relies on the LLC driver for DMA cache
> maintenance.
>=20
> The series is organized as follows:
>=20
> - Patches 2-6 rename the AX45MP and L2 identifiers to generic Andes and
>   LLC names, move the Andes CSR definitions to a shared header, and
>   rename ax45mp_cache.c to andes_llcache.c. No functional change.
>=20
> - Patches 1, 7 and 8 are small cleanups. No functional change.
>=20
> - Patches 9-11 fix issues that do not show up on RZ/Five but affect
>   other Andes platforms:
>   - write the full physical address to the 64-bit CCTL registers,
>   - register the CCTL cache ops only when the errata asks for them, so
>     that they do not override Zicbom CMO,
>   - index the per-core CCTL registers by hart ID, not logical CPU
>     number.
>=20
> - Patches 12-15 add andestech,llcache as a generic compatible, keep
>   andestech,ax45mp-cache for existing devicetrees, and add a
>   MAINTAINERS entry for the driver.
>=20
> - Patches 16-18 make the Andes cache errata usable on any Andes SoC:
>   ERRATA_ANDES_CMO no longer depends on ARCH_R9A07G043, Andes cores
>   other than AX45MP use the CCTL ops when they do not implement Zicbom,
>   and the SBI-based IOCP check is limited to RZ/Five.

> - Patch 19 adds the andestech,a27l2 CPU compatible. The V821 devicetree
>   will be submitted separately by Allwinner.

This patch is missing.

--lRtlk1dXxjMUQU+8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavc5IAAKCRB4tDGHoIJi
0moEAQDVBv655Pk8FJSiHbmcw6iWuP15bwLdSG7Or5clXJmJvgD+LbkpwW05yW5Z
7PSdKmrUiXFApjw40K1A9GLE1AmDSgk=
=fCFy
-----END PGP SIGNATURE-----

--lRtlk1dXxjMUQU+8--

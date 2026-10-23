Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778406;
	b=LeJkcBDaUqHIyMn5pWuKBTy8tt4LwITZ9ST0XT7JmR6FAG1GgXFxg9ish3TesiHfzndC
	 Eg7WFTkFhwVdCUTwxJtca89dArluDmiUmVWNLgXVuVyvhwoVa5AyNFDAlMlo9kWUJuJ/W
	 h1sXtAS7LaZ9PRbsE2aqLVR7pvEcBKN7U+gcZZoz8FqKNRLXuqMw7G/8SQWRpURVTlmsN
	 H5Zb/HIF7WsI/eFe2+Zj4J2Ga0e0bEN9YJGMg7CBrWJQGW22sgQXFNBABaNZZTxm0rb9i
	 iMApkQVlneiCE7sXgYoRLnKB8ECQzrvux9mAbC/kBhPJynTR1WMYmQAa9QP8YjccOMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778406;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DDp0A+MFigzxNJJ7aGRNaZ0NPm+pvfW+yAUDHzje9B4=;
	b=mvuh/ex3VAeiE0ss35UGtvsEY7fOBnArCiAQr4DfMj5M+02pWruH59SDQo/m2SWHt16W
	 ds9cf6743ibK9PI1KaNHpMC4uSd2BVs3PYjJb0eqzmRsd2j/ILtU86uvYGd3y8IzvPDfS
	 TU0BA9X6J3bh5ysV/xhnI29nyaNWbM0P+SEqE+XIaCdrr4COGX50bmvX9J2l5hI0+4j0G
	 3ZQrksDga028RVdLVcFIl8IsM/5Sn5Ucla27+ElHbrfVLCMTNQGQ03Kg7CWqdtIs0zSsM
	 YplLR0PD0CMMd3MFfBPVTybCiOETFzIb2hP4268Z1sjH8RtFVs9M4r1iWHYmiSagJ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VfhL0Q0M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE30606A31D;
	Fri, 23 Oct 2026 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VfhL0Q0M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070641F01825;
	Fri, 23 Oct 2026 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792778405;
	bh=DDp0A+MFigzxNJJ7aGRNaZ0NPm+pvfW+yAUDHzje9B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VfhL0Q0ME1zf1G0Ev37XUBSIpVC5MhcWS4fPpuj1be0JwpfaiFNLj7MLQf5Zuq330
	 pZn3wqbBdOrQ0nNxZGThq9eAzYOCthq5WQi4/hbmt5WUKvP9uRCGX7kVo8ZR1GSRnm
	 PoH9rIP37YRaZ8WvQqSBXdRZBH6b6LP5mb4Toq4d+fpx+BQf8zvNaP+MTJ/9R1Yiv1
	 tZbB/iY1IjimtxnR4+Oy3yv32SLN9obPKt1gS95vgd9g+qVQBLj07woSOP3nQj1SuP
	 5+GKyQhMsNqgngZk7yDKPSPZLq99LJ04PEdoHWk9fAsdbFv6mbcvI0I6oVzFBadDi9
	 DDVTZRn+385og==
Date: Fri, 23 Oct 2026 19:00:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
Message-ID: <20261023-bok-thong-0181aa7f3867@spud>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
 <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
 <20261012-numerous-flatworm-9e4cfa659541@spud>
 <325b8836-61a2-4e1c-98e3-92f0a5177f9d@riscstar.com>
 <20261013-stump-reactor-055d05dc5b3a@spud>
 <b904f4ea-e198-488e-a6dd-476d744593da@riscstar.com>
 <20261022-clench-drum-5907c17cb8d2@spud>
 <638e0f29-1ec9-4a6a-8777-fecef1bff409@riscstar.com>
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
	protocol="application/pgp-signature"; boundary="GVAs1dKU9VYJ6n1d"
Content-Disposition: inline
In-Reply-To: <638e0f29-1ec9-4a6a-8777-fecef1bff409@riscstar.com>

--GVAs1dKU9VYJ6n1d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 02:05:12PM -0500, Alex Elder wrote:
> On 10/22/26 1:34 PM, Conor Dooley wrote:
> > On Wed, Oct 21, 2026 at 02:50:41PM -0500, Alex Elder wrote:
>=20
> This syscon driver and "sg2044-topsys.c" are awfully trivial,
> and they seem like they could be wrapped in something along
> the lines of "simple-mfd-i2c.c".

Yea, I guess there could be some sort of trivial driver that covers
these syscons with match data that contains the mfd cells and is
effectively just a probe function that looks like:
static int _probe(struct platform_device *pdev)
{

	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
				   match_data.devs,
				   ARRAY_SIZE(match_data.devs), NULL,
				   0, NULL);
	if (ret)
		return ret;

	return devm_of_platform_populate(dev);
}

The devm_of_platform_populate() you don't need, but there's other
syscons that could use this that contain subnodes too so might as well
accommodate them.

--GVAs1dKU9VYJ6n1d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatugoAAKCRB4tDGHoIJi
0r2KAQCd80g6NJ2CllOLxW6dtWZaZUqTuNmkhDXrHyk74T35qQD+PwOWHbI3TGFj
UdWTac9ync9JrHoKIrmy6eRjwSrt3Qw=
=h2sz
-----END PGP SIGNATURE-----

--GVAs1dKU9VYJ6n1d--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663212;
	b=bl7OaTPBNzzwuWs5P4ONaew+A0jir+jUyN7eKWeHbV7xLG/YAC6xTktJlwI//jJm3ICX
	 9oSzS5AWynWfxz+wEacwLFq9DtKYbbCbQnUj77gUeo3hWNIkpm6HOfUJZJ6O46Eo/xlMN
	 vkbLPkv3iQfE76ACTsVqi9gZs9rYnk2P4Wxxsjh9kJ2emaJ9VmPk/UCeSCT6uk73M0Sm/
	 +YBZITLwRAO3Hst7gnLxPBxJd/SiZkYt8CoARMtsoyRFW945XPCuX6nRhJKxMiuWephQs
	 pDxWnQszwyTLcIdnwQQoW22XUwZgHV5doC2LHCfz/XeKyQrrH5NbAe6zTc0VofH1Oww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663212;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=ty+T3XKGmQYOgpyPiETes65zSCPu5bc1Y40kzLsM+Z8=;
	b=jO9Sc8Cys19k8ggRGIO3WzLKE0LipplY33ffxhDfKERHUWa5USwmotjNhRLZgyPIEsw1
	 G3FTRzg14e0/lCuY1cwXHA+obt2MojPcKdSlOOLiCd0hfa9CFfc5ULikoB98sPz3JTl+G
	 OaIgzhxRlTjEQ42Z6pi+QxVyP9Wzq8JMDkT7zR5DPJfgtx7IePRsrgGcMGUO9ueT1tbQ+
	 98C2fh0dB3Wn24vCskL0qUpgYMtCw5XgbWcQnPTnqH2Vo4yAZRVsTEBKQqoIBykkNJfVc
	 +zjKo+IWdBgBWNoHTyCYOp522CRtBg8fbw+cPoI+6NBTLuxBslgnVGt7j2mCGwHGpuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BIhlPwgR;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455B0606A324;
	Mon,  2 Nov 2026 23:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 455B0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BIhlPwgR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793663209;
	bh=ty+T3XKGmQYOgpyPiETes65zSCPu5bc1Y40kzLsM+Z8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BIhlPwgRRY3F/IaF1fS8kAt+VANxVHaHGXCPMqX+n7qfMf7cA036ILScaswubJMGw
	 0rwafOK4h1CZP7wtJTSJPgtSX6uFLuj1qLEYg8/Xzy1Nl0G+S6zuWn9yCQj0JjhF8m
	 +VGIbbFtPqPM11kmIPW3PkA4uAcaI11GhgYQmcoIpMljQY4ejPorij3WHxQzIYrKx7
	 GPYOrmMHRULsEAAk7umRTzCt29ZxXbImiQr7yCj/CIvDRTsCUyhOs7MIg4xNmlP+IU
	 FDGepeqcnDgSeypnQu2pN7fq7plyspkIH2GWGhl4YmFBhcIpq1njBmKKl5t979mgM/
	 4oajkQSMs+fhQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2002417E0390;
	Tue, 03 Nov 2026 00:46:48 +0100 (CET)
Message-ID: <425fde43eebc2ef0ae9003eb2d97660136ef5867.camel@collabora.com>
Subject: Re: [PATCH] media: rkisp1: Depend on PM
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Igor Velkov <iav@iav.lv>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 18:46:46 -0500
In-Reply-To: <20261103005500.rkisp1-pm-reply-1@iav.lv>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
	 <20261102223316.GB3548113@killaraus.ideasonboard.com>
	 <20261103005500.rkisp1-pm-reply-1@iav.lv>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jcH9UJn3eOaIV2OYZiSi"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-jcH9UJn3eOaIV2OYZiSi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 03 novembre 2026 =C3=A0 02:55 +0200, Igor Velkov a =C3=A9crit=C2=
=A0:
> On Mon, Nov 02, 2026, Laurent Pinchart wrote:
> > > ARCH_ROCKCHIP and arm64 ARCH_MXC select PM,
> >=20
> > Why do we need this patch then ?
>=20
> Only COMPILE_TEST builds reach PM=3Dn, and there the driver still binds a=
nd
> probe reads RKISP1_CIF_VI_ID with the clocks off. Nicolas asked to close
> the PM=3Dn case per driver [1]; rkcif already depends on PM. If you'd rat=
her
> leave COMPILE_TEST-only configs alone, I'll drop it.
>=20
> [1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.ca=
mel@collabora.com


The rkvdec coded was using macros capable of supporting both, so it was log=
ical
to make that functional, though if non of the Rockchip ARCH (32bit and 64bi=
t)
can be built without PM, then indeed we can drop.

Nicolas

--=-jcH9UJn3eOaIV2OYZiSi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaukg5gAKCRDZQZRRKWBy
9KzzAP0WbgVMiRisPpibeaf/Klw5w9dNDtHpqE1NzL69xToaAAD/XGscCptiBTeA
cRT7n+ehVuzM2UT1sfTakdJgafrP7gQ=
=uzM9
-----END PGP SIGNATURE-----

--=-jcH9UJn3eOaIV2OYZiSi--

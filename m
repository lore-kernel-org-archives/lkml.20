Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583357;
	b=sNYa27s2NPSRgtHr5iZsV0hP3vcyP3sybmlUGUTs6teIFIZJ+bONuN6ybT5A7U12hNsr
	 AFZMVPqdc7wqWSmyepHoeFy8+HGpABRnyMp2zzvf6++Ob3OdcKuQFK1/NgxP9sc5belCp
	 VzwtJDif+OTlZ3Oh+O1S1NhgbQD7rYF5L0SrkZ4iRItymJvsdD5VbW8lzgDUSjpQR/x7c
	 JatDeBk+Ji33g48uWTuCEz2jGzDeWGH4QOfE+Y6tkjl49eM3vZQQKVgyCZGxE4VQTwLwd
	 ZPBiIn4i3dEGqXa60jkxZxH32aKpfKiH9aGfnvWyA1h1pamGu5Nd5M97as6/fTwfThA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583357;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=rz93IMDAkHoneXiIeX0ZJ9Q/dVSLcFMM1YZN4Bp5kW0=;
	b=hnF8clMijDwpXU6flPOlW+EpNhzzUrcP4nkoBbAGD5yXYMYr0LuwOB2o37q3Mnp+iBrK
	 uzsk34l3yNnYtM6k3u3kqcNAjj3G0/DZEL32yCBtZiWhHXjgRZUM399lnpwXMhN4K4DyL
	 gFob7ARiJlMkyBJCZVrpCao7uYkp68tyW8ed2jm6iimSpIVlEMEwup4E3Zpp1eDIDILkC
	 4cTW8uXizet5nVka8P+yp+JRUwa0kwnz1mItcUOs8yGNhs1bdIpYWJevCpbDq+miGernm
	 XXOtIF1xqhNoPDwzIC6ad1Er/pd/AfFM3kI6FDzcXFiyinVijjeazWtGGqft9c/W8Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YBoZvUPk;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE65606A323;
	Fri, 13 Nov 2026 15:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YBoZvUPk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794583354;
	bh=rz93IMDAkHoneXiIeX0ZJ9Q/dVSLcFMM1YZN4Bp5kW0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YBoZvUPk40k3teW4EFPC67/Pk8FMm0DK4dgcs+Q6a2DuiZHDVBEXntia0TjKrhhqr
	 HNQf7O+ht8pudGMxNIlqNkL78eMsysTUc1zxAemoAK/lq1fmWV+8pXwn65JYPlSut/
	 28Vvl1pyvOrKQkZijZwmqE0qoEqMux1BmnCndEBTpA25aW0weeTWm7n1RjcJX6l9SD
	 WRqq7VGTypmO+k4oMWd/fDqD+SVH1YQXRBYhKhqqySCggMa+m3tKgZxJK40njnKmVK
	 WFdYmd82paxEln//e2tFEpvRevPqPIX7NEhYgeg8Rs2Dq0vAQ+uRNac0DUsEatsaB/
	 vDINaFvwkeskw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BADC17E0840;
	Fri, 13 Nov 2026 16:22:32 +0100 (CET)
Message-ID: <f8d5854825dccb39741565057d460bb4723db431.camel@collabora.com>
Subject: Re: [PATCH v2 3/6] media: verisilicon: Don't offer VP8 above 1080p
 on the Rockchip VDPU2
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>, Heiko Stuebner	 <heiko@sntech.de>, Boris Brezillon
 <boris.brezillon@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Jeffy Chen	
 <jeffy.chen@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 13 Nov 2026 10:22:30 -0500
In-Reply-To: <CAEy9hNVSC7TAvdLmN-yWH9NdtKH9jgVnyxFwLJ+J2qPZvOQTEA@mail.gmail.com>
References: <20261112-hantro-codec-fixes-v2-0-f44424df585b@gmail.com>
	 <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com>
	 <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
	 <CAEy9hNVSC7TAvdLmN-yWH9NdtKH9jgVnyxFwLJ+J2qPZvOQTEA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-4yY0KbJj6xKjU43niVpD"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-4yY0KbJj6xKjU43niVpD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 13 novembre 2026 =C3=A0 00:00 -0800, Arun Iyengar a =C3=A9crit=
=C2=A0:
> I have no i.MX8M board to check what the VP8 limit is there, so I left
> those tables alone for now. I will take a look at getting a patch for
> this separately.

Ack, separate, later is fine with me.

Nicolas

--=-4yY0KbJj6xKjU43niVpD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavcrNgAKCRDZQZRRKWBy
9GVEAP4zxrBESO8Pzt4btrBZoJ14BJWUThjkW8et96mAQvSCSwEAncpAf7voMdI4
UXfw4UP7YYzkRt17Wyp01B6gYeYhWwI=
=L8JS
-----END PGP SIGNATURE-----

--=-4yY0KbJj6xKjU43niVpD--

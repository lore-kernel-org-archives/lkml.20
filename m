Received: from mail-vs2-f28.google.com (mail-vs2-f28.google.com [74.125.227.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC14EE874
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623502; cv=none; b=Bmia1UXoupBKyfkVO2g/63ta5s5bSCWsCsPWbD+UaepvM45Y7j708yVLrcESviRWodRMJqQ0f8pDEnuYWyRHssmhhymZ2gZ6FEK9YwCro6E4O9L87gZMhzRgXen4Nj8B6vMBiHK7XtkZUalO0k7ZUSaYKauPcn3hQpoStHju1YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623502; c=relaxed/simple;
	bh=XndfIyU6r9YvcxwPv/Mw6ubO64xo7+iWYBKFUNYeDr8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VhjG0P/DJOuaWxzs24AoLCDhAkyyFja+NiE4pkB7NZGYzfqfPGQVWdp8VHUjToQfkshg6aZjGcDeUKgpjhRvAZ3mXKSPRCuTliul482rpIUp6SCKd0KsRld3G020x7wPXJLxKqFykUblyGtnY6nZOxty3+E99soUZGh0wAB9nyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=WbLE3u1q; arc=none smtp.client-ip=74.125.227.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="WbLE3u1q"
Received: by mail-vs2-f28.google.com with SMTP id 71dfb90a1353d-5c9031e714dso1228472e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790623499; x=1791228299; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XndfIyU6r9YvcxwPv/Mw6ubO64xo7+iWYBKFUNYeDr8=;
        b=WbLE3u1qGuJU0T3Pfq596OlPwYRDJF2I+WSbe3cYz62GdB/YEX7FFdyhnbv402JRAQ
         SDvyFIIoSE0i56JdgKBqDQ12STcOHk+fcLCx2036jFlYqo+dPuUOrXuLASdxJWEyd+aT
         rau/1HsBhk3ThxKcfghSBRccG98v3d64BjI/2hbGAO6vnXvKQbx3Ha3M+6/BlBF82jPA
         cYEOlZhWRMcFdTT2srQGMUC8QBlbOwhBqtbcARzssbslPVsVmmgVrUZmp4GySnJx5/Ho
         j91VQLg03wt3VIgAwbGSptxVnAL8cmb8OTfWoab6T8KcwuRt7aEwymiiaxg1hW7UnN1o
         o3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623499; x=1791228299;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XndfIyU6r9YvcxwPv/Mw6ubO64xo7+iWYBKFUNYeDr8=;
        b=hRYUv/sufrJwyUmD0expE3lZ9PChenKcOSlmUnX3XBI9ih/w6MoFZ8+5/V/HFPXhnX
         VVCiA+biqWVy6QuHq4Rll7+QVtrgdavE+NZdlOHOQgXlhvyjRNnxV8JWZudb/CAuzKRa
         kah2UfxXz+cwbSRwcHQSo+BjXfXSfRaSg37chQbogK/xrfJgz5cfdqLzZc/W2kRigejE
         1xvz8XJiuFqIHPEEOTD9RQEtVPndjxl7d6ov1oDoArcQp2pjiTbEvU4jZ5uPv/IYBr4W
         8TteNOddrgsZZidkIfz8u8EBKYC2MkDW0qMHoeFVbnEdPMuTwjL0UJ93jGo91Gt8v4uX
         BldQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/zOLHMlo3qkZaA8rqYiv43oheR6J/DT/SzctYaDDfNq3RFYybosaAJp3fHE2W+Z22LE4ovKao792Tx2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWofpQALBV4fyvhMF12zdrKY45bMFarjjADBamqaI6h3u6nXO9
	CmBcr41PPa7QpzRo2FZr0GWw0voQa1Es/qi3jGLBTbEClfjZa3vslSvgyxxpPuBtnNU=
X-Gm-Gg: AYBFou1NiQJ3j8/EmXfsdkiH+LWGNiPZqt23MoazNzANjroF+B/L8IZ+1g3F1KqMTJg
	DwwGPLlKz1BA6/94NrSJMV0FIL7XwOzhZKXMk4zqqJ4wuTewZKZzy6zO42gVnLA9sfml7HlZd6S
	MeDB8Z/MOhlZidlQsceuT05GANY8hkmeH9wkwTqDfabecv1G56mpDyjgJtrdw/+GeTb2pfByPP1
	iERHSNAF81mUYzYCzmBAFZnvZrr2ES/wPq14FOSCWHeTx9ZqpdsVvgpS4azdofI5BE83w1j7F9D
	2buLsSl28BRwM9fZgkFfbkUcwxOrGbZoYeaFoestr0nhYibva8iskgAvJsSoA8XebZSWdp0LqHx
	A6gUrOI491lYGrY2+K6UnpsaAnLKlT91cNqBhz8XpiomOzH2iwUyvl3MHOyDwIVm+n+H4sQv6VW
	fY42mHXf8/PdKBY91DO5S1z0Z9J/7N8pYydK37CGoE9wCOmLFohmmruqyxuVdLtMu9IjAVJoD2X
	9TLrirG81PbiA==
X-Received: by 2002:a05:6122:1824:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5cc9725e832mr3885568e0c.13.1790623499322;
        Mon, 28 Sep 2026 12:24:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde577632bsm10943087e0c.8.2026.09.28.12.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:24:58 -0700 (PDT)
Message-ID: <c955b80d94f4d9c254c3b3f672a19abd1f7277df.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND] media: imagination: Fix value clamping in
 calculate_qp_tables()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Thorsten Blum <thorsten.blum@linux.dev>, Jai Luthra
	 <jai.luthra@ideasonboard.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, David Huang	
 <d-huang@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Hans Verkuil	
 <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 15:24:56 -0400
In-Reply-To: <apU3tgw67BSgUrPe@linux.dev>
References: <20260727094729.408762-2-thorsten.blum@linux.dev>
	 <178514849109.506511.14905916758246243206@freya>
	 <apU3tgw67BSgUrPe@linux.dev>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VyzvKX7oN+jX10HhRE7L"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-VyzvKX7oN+jX10HhRE7L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 31 ao=C3=BBt 2026 =C3=A0 10:13 +0200, Thorsten Blum a =C3=A9crit=
=C2=A0:
> On Mon, Jul 27, 2026 at 04:04:51PM +0530, Jai Luthra wrote:
> > Quoting Thorsten Blum (2026-07-27 15:17:30)
> > > The local variable val was never clamped to 1 or 255 because the retu=
rn
> > > value of clamp() was not used. Fix this by assigning the clamped valu=
e
> > > back to val.
> > >=20
> > > Fixes: a1e294045885 ("media: imagination: Add E5010 JPEG Encoder driv=
er")
> > > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> >=20
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> Thank you for the review.
>=20
> Could someone please pick this up?


Picked, ty

Nicolas

>=20
> Thanks,
> Thorsten

--=-VyzvKX7oN+jX10HhRE7L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarq/CAAKCRDZQZRRKWBy
9DueAP9U9neAoj+PcUTJFYE6Zxlqr7GMcyTEe3D6YeK0UmxiYgEAn1gfGz+AsGOe
+6P9lstLgvFaztro8Dq2UHArKxoCZg8=
=zCs4
-----END PGP SIGNATURE-----

--=-VyzvKX7oN+jX10HhRE7L--

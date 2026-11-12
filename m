Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500495;
	b=2GwRhcZi6wuuLIS2DarEB5x1Hp9t0PIdwbu6z/cmBYIK51YEnERksKjtAQYPu2kxx4si
	 g7Cla11b1pQ61/RfERd4Tos2OdUHAu6Bz2HVKsPPk66qxl8y/g9/ixPo/O/30cPJB8Hr6
	 QKyarw3n3mzkTsM1Hjz9mdutnc5P4WlLb7wH5Ca65l+OotAKJKD/w78jxrcQfKn1CL+QC
	 wCesuMucMA3eMq6iU1vstBScJ1xtDL3M5xeBhc5jxQNmbH9c7+gjDdmlqM9p3P8WWXsHX
	 JIuqkVRQAczJl8S1MA5N93cJZ7xZUSE+w8iSWnis7cVkbFzc1orBxwrQaNWZ94c745Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500495;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=paD3giawAZujBoqv5ue/Jl1Wh+BLkhbSiFjUwhhSpUw=;
	b=yqKZD74BsI71krWr1hWvzF0NIS9KxUemEZS+zpSfpcHoBoetmW5CmuFUaj0rxpMaWOvU
	 pgqxSrKC7Ka8y7RV69sZvYV0IsNByO8CFKA1XFnImAbnGaKDumeAOEMPqo7qG6FcYYTLl
	 O0f0lJf54og35q9/Qen5GBZw770YdW56TURcYaYUETQxZ3WSKZlovTYTvqNMcJDK9OGw9
	 dwv4WusGtIK7j8QThM4dfM9pWTvGZ3yeW0RXeviG9NrSEyMJYpM76PWdSZdsdZy/ZOiCW
	 EPKhT0P/v4HhzHDXSM26EsPBjhcituikI6KTpAQ1lPCg2dxaXyIWtEh4MccGXKxA2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mMXpdOlM;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5405D606A881;
	Thu, 12 Nov 2026 16:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5405D606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mMXpdOlM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794500488;
	bh=Ao2ebABVG7bIWgifXwZ2GE6bCC2jlMMyNANj8xegV0g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mMXpdOlMeOui3VQvSpNSxi6Y8USsb1d7lkdvAS936fBLcQ7WDcJHU2oixmSN0sDKw
	 uvuj8P5m5AmQ+Pq7xLiDql/0bTZ9kskSnBlIa1oDzQcJCrEFKv6gmLKjxybRfEh8IN
	 BtceEvLuWt0GztCfcu1DgA7i+AL1Fs7AJwzV1uRr7FvhurjCNKdxw+BUsvBagUd/KP
	 iayK2JI8IIOK0RNOZ9OnZ4A7DlRdWPl1GUH33JmL2iGukCOZxPbh+7t0KGZSa3a7qJ
	 3uMb8p1VCVmAX3RAP/m3iNyR5Qnq8JR5xPyW4o0uUvV9cd1LDdobjWN7I2rPAtJ0D1
	 lXSpY93fPC8BA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA1BF17E0564;
	Thu, 12 Nov 2026 17:21:26 +0100 (CET)
Message-ID: <41affe4b832c2625a2bdcbdc26f221dcb17f475d.camel@collabora.com>
Subject: Re: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl	 <martin.blumenstingl@googlemail.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Thu, 12 Nov 2026 11:21:24 -0500
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
	 <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
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
	protocol="application/pgp-signature"; boundary="=-leqE8XX8WzE8OR9XUYh7"
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

--=-leqE8XX8WzE8OR9XUYh7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 22 octobre 2026 =C3=A0 13:26 +0800, Zhentao Guo via B4 Relay a =C3=
=A9crit=C2=A0:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
>=20
> Add SM_LOAD_VIDEO_FW to the secure monitor command enum
> to allow decoder drivers to load firmware through the meson_sm
> interface.
>=20
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>

Any feedback from firmware/meson maintainers already ? Wouldn't this be bet=
ter
as its own patchset and documented as dependency ? Both ways work, but
understand that I cannot take your patches until these are in Linus tree (w=
on't
build). This comments applies to patch 1/2, please coordinate and let us kn=
ow
what is the plan.

Nicolas

> ---
>  include/linux/firmware/meson/meson_sm.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firm=
ware/meson/meson_sm.h
> index 3ebc2bd9a976..3b90b49d0552 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -15,6 +15,7 @@ enum {
>  =09SM_THERMAL_CALIB_READ,
>  =09SM_A1_PWRC_SET,
>  =09SM_A1_PWRC_GET,
> +=09SM_LOAD_VIDEO_FW,
>  };
> =20
>  struct meson_sm_firmware;

--=-leqE8XX8WzE8OR9XUYh7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavXnhQAKCRDZQZRRKWBy
9BwSAQDf3YOlhQDwjAbF/BDv7D+x2Ha2oYxmTkfeKr8mVfUl5AEAihCoYfjm9qiJ
KlkdjP3Jv2cYRwg7V0yeMnfijjyDCw4=
=eTMH
-----END PGP SIGNATURE-----

--=-leqE8XX8WzE8OR9XUYh7--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421456;
	b=cbbgCj/afIqPs3mEuHu+h/HdphZbUknuHhAp7MX5sRHBnni0uFIfXLCNE3d5cBbJ61JI
	 cJsyI/P7K2LGdAM+CoiH/d575fXyNnB8J+wEODa7ElNOh0ShfNdVlVdRaGs3iVYvErBek
	 3pw2AZkCXX44nyfB5NPWtH8S9tW7HVjBCR8K5t9QbyMaRHlda4sVFv2iW02AMoezldF6g
	 u65bztv784oJNckq/lR9MbYYzBZp+tjeUqSEAWoB5h1zRijhLqLylSod8vfo5LFpUnYgT
	 JJWoJphWhUw0j4A53/7H4cFoaeHLhrxuBBoqNX8mGHeK6vc1iUS7fW+ZL3ydVzqfhig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=T/Cug62F0T5BgzSE9J2QbWqWeH1HDNLx89W6EJ+jfRQ=;
	b=Je8ssjPEY0v8FTsufj9XdZ3z1CqdjVCzfwpcii6bc74BYZPSVsdxhp74iB7qUKlLl14r
	 BZ+wmwTXPDWJgsr/z8neoVbYQoEiKsA6poFP35FHOc0dRTD9GASMtAzi+M5CNThmuc4S3
	 cuaSRYOQnQFX2p1YYr6O+fNTHtyC2srcjtim2ECTsBkrMss6dmM7h6fW3Qr3uKex6CQU/
	 PfE4V/mE2xE90TEgK05yxklucEe5TWlSAKGhniV+IAeHT6dS0NdOujsz4uzT2D5HR4mJG
	 5Dott0JiIW2loH5GaFb1DQvSF8371CSQEyHO71Cb7Khw+YqcudGv8sCoef9KTXl5tDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YHRBSwh3;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A056606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A056606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YHRBSwh3
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso26822925e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794421454; x=1795026254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/Cug62F0T5BgzSE9J2QbWqWeH1HDNLx89W6EJ+jfRQ=;
        b=YHRBSwh34NIYtfsSjPBrTnkaZbIbigUxfp8ODDzdV8X6YSbbi++f4LEOnWXiYqgHW2
         VuMN6iIUA69gW4m4+jfz16LNttaRLPG7F02zWW83MEkgpkr2FYvWCxwUHtXh5YR67dwc
         l3JPHMih96I4AlM2djClT1/xt3W6rQ3zNP4vELcqx6Y4ZMyskjIxYvib5bXOPIX2yHFI
         c9Zrnl1d2JvSbOeba2yoKTTpIvz+y9fGyUJukkdUJvuVtdtroxaPEA9M7xWU/sZo6Wio
         kb0JjiqE+G58D0rxnNlT+a/VeYdFrJRlhblAR7kVBdLkiwuOl/w/5owlasVibv9OC+x2
         1UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421454; x=1795026254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/Cug62F0T5BgzSE9J2QbWqWeH1HDNLx89W6EJ+jfRQ=;
        b=mfKutmOaQeLsf67WrHVn66n5+w+ui/GGfpYWsMSwL+NQIQKzi/gw3+dsr1XM5SNtlT
         wfN9JZrOQ7Nk1RnuH6fp6OIOfd8TIB0PkxFU4CVogWvjs/zzafEp6zqEHGp8n2FeW+m+
         wmD845etKCHgEAIa+PqCdj5nY1HxuEb9nbYuCX05HO+4WohmLGYS/zTbGb7dwsW+Cfv3
         uuz0p5u6fxxbTOQMg86+nq/hjtwMv1sXfuPxHUV/kkYI8mzKOBsAH+n03KY+sNG1xAcQ
         AsoZgXBNcoBMIBfdCIcqkFS4MDRTIsGsSNuAzLyJXogx3qwEAYw+U8FDmRj+/pFWUKiY
         wp2A==
X-Forwarded-Encrypted: i=1; AL+hErGcAIF2spG404G1iY535IPfGJ1wLMgPw/0lGvbXty68b5CUMiczLqCQPTk3AnAyfQ2Ttc5OAmTAv8TGgj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UJkg26cX36ybIqAvm3k80qjZFD1gshGwgXLHQZiP+55xNVfiQ
	/ageAvYRId6WOV26IPtAwY1t1t4U2uJV3glXSPNFbh/Tmgg5x7lyg1aUReJLXHOVhTY=
X-Gm-Gg: AYBFou0OYeNj7/7c7PHdH9HXr3NVPw04OykrPhe4Rek1mBNG5HGozrK7diHdNW7MgKd
	9Vt51vgkorEv+phsnQWyMX1jYIsE1ZGvWzhryld+5Iyp9ear5kgSjW8p+9yurUwH+DC5Pi8MFsB
	IExo+Ds8g4TV+6lHZDFQ+v/KBvaeoTXFzuayakCX+bmSTSH6wN/6zWEbnExmqQoaJg8+9p5E3yX
	xWgrr63ZvJ+oByCUiDhWP/G/n8jFGMiWKEwApKWUhej0VFjP9ZHDg+QpRNUhw/5JRcoz521Gnw7
	juwqTMxU2f9u2crBkVtFLJi4qI2Cbuckhs0ZDjX22vUHK0J0xb8j9dy9cjwiEKXVz2jpU7ydK0w
	ZvOnXDZYe750Ur79DfeLiYVoYH40ibDd+fYqrPkUJLAWgpKPBauM059Bg6znU2tjnj1Qlvpaxvv
	SvmDmsLjNGx24m84nMUhBKdgpMFnnwZ9M+HKenxOZ4nQd2i27bOersAvmolPUU+b9harUKjHAol
	g3vS/1PBt/hIl7tWPjvguJQI/wtkjcLEPiZywwWowcM54l2xtwf6SOCEUkYCQXaiI+uNyehsLUs
	qxcIltO77GhQGvgDgDK0B3owVogPHVGgai6HQGSoCnzJP8vkbAkTEPTRKj9k09vidHiX1sBXOKe
	B8TCSpoKH9hukLwqmnQ==
X-Received: by 2002:a05:600c:810c:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4ba09379cc1mr53582795e9.7.1794421453796;
        Wed, 11 Nov 2026 10:24:13 -0800 (PST)
Received: from localhost (p200300f65f19a9045674a4e2f3db58c3.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5674:a4e2:f3db:58c3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb4e251686sm7879725e9.3.2026.11.11.10.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:24:13 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Fix comment about header defining HID_GROUP_ANY
Message-ID: <avSynjK8ZIxQ3Wfs@monoceros>
References: <20260730204136.1606050-2-u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="2y3yufkwod7zojzi"
Content-Disposition: inline
In-Reply-To: <20260730204136.1606050-2-u.kleine-koenig@baylibre.com>


--2y3yufkwod7zojzi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] HID: Fix comment about header defining HID_GROUP_ANY
MIME-Version: 1.0

Hello,

On Thu, Jul 30, 2026 at 10:41:36PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Since commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem
> headers") HID_GROUP_ANY isn't defined in linux/mod_devicetable.h
> (directly) any more. Fix the comment accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
>  include/linux/hid.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index b240baa95ab5..56bd7f274387 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -424,7 +424,7 @@ struct hid_item {
>  /*
>   * HID device groups
>   *
> - * Note: HID_GROUP_ANY is declared in linux/mod_devicetable.h
> + * Note: HID_GROUP_ANY is declared in <linux/device-id/hid.h>
>   * and has a value of 0x0000
>   */
>  #define HID_GROUP_GENERIC			0x0001
>=20
> base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b

This patch still applies to next-20261110. Is it still on someone's
radar?

Best regards
Uwe

--2y3yufkwod7zojzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0sskACgkQj4D7WH0S
/k5uBwgAj7m3B+KJTxJ09WwpnTqKGauOlsDjImVnU2Ev2OhtzpkeIPRBVvEnb16X
6L/rJHa6WFpeju41JGEvT0ZrSAlCiI2pGkmtQlSJTGhw5zSj2oNpLWv24dwPHBlp
ALpXbRYLxlaJ61cGMCvHk2Bv4oCwwPt3eqv5y0Z45f3yyjnA6Soi+G142v2mcfyg
cugcqK2ZEoxLC5IMQYoQsSdGYUvepvZ2NOClUStwk10YBC2NmGgwqxGZk25wniYa
FufdSUpMe1KmCam87ux9xoBXGU/gIPlH7uavpJyTmSRBR3aZMdqPMsA/LxPxnJ+b
ET/zQC4TZ/OBqodl04WATqTgyMzriQ==
=KCRm
-----END PGP SIGNATURE-----

--2y3yufkwod7zojzi--

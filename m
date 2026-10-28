Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174640;
	b=cSTkRt52+QiqWkW/0Wk9NHBXJrhniImCALvxBBuVz4o9QUDTRxTQqBbfbuXm/4ejLUyV
	 eJ7zxRF/QiK+HspSq6GwVoOV7YkySOIGZk6fEpsIecXLnzAjSDpttJk4zrg+Y4fNqQD2J
	 MhqBtyeDK6EhgY/5czCSq9K9VMu7mo880Gjqbly3T5jwUTQ5xKPdRpmzooayyO6tqwlTH
	 zN5lmbrHh2rsKvATGDTIun4q+qaEWofARowb0iAoak14rgqrIzwigEQMpC1eOlGmZXhkW
	 iauxuAuxWTrmpehS7mvLSzIcNEE+POXkNVIBUvG5JHBxXfrOZcribpEkHO/lWR/d6oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cmUygOtzVQYGYmoDrp60NTGZ/egBDRJwiYY9TeXBYAA=;
	b=VzTX1R2j14XV6WzEb8jdF6nncnMqMDQwOaTY877KNQjw4+tuVW62sSv7GLWB6MoBzm8S
	 lzrr9o1Ff671zkHHXtIq2byTq4MnaJVGX+9SkPTwPgl1q4ezFHLfcpmvSzOOLR0lQK+vp
	 bwKg5n6eDhViYw4hZu/qhyLiHVgefTqJ1H9o7J0e50e0kAsIrsezrbqgCqREoW7gk+elL
	 E3dCEo9RpEEMmr7TxzTaXW8wAk/yi6sB9dPpORFprGNptXXd6TIt33NCr/lxoFEUKdrIt
	 Mpqboi8YrrbGI14W5+PbCh3aJrHwxRRjcE/HRcYpntQC5spvuIJ+hYpnrZ6/aEphPQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VeacjZeX;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30362606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30362606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VeacjZeX
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a215e64962so6837075e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793174637; x=1793779437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cmUygOtzVQYGYmoDrp60NTGZ/egBDRJwiYY9TeXBYAA=;
        b=VeacjZeXZ2H13/shN5QKdF0Sxcnm9lpHBcpJfpiq/VZZCzVqilfmiMnO6yd9HPmtP8
         TlP7YPN/+pGErIJoG9jZhviV59zAjTP3slB4ZYlffC2y4ybUKnDtr8VDEBowp1/236dz
         41VKts/axq7MozBdQ1YY2hKuPYsWiXs8pAQof3scRBNPlVaD+qoHb8JXzNRQjfvCr75b
         eBgkGWDxzyyYqgqqf32SsbL+4S69QKep2J7ckixHRyauW04C4j2WRVVeZugAz2hZXeqh
         j/n/IfrenSmA+1cUAixL8t72OKzbOqwY1WpyqJttvkxGfBv2p0MVLHQftbPotHpD4HrN
         s3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793174637; x=1793779437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmUygOtzVQYGYmoDrp60NTGZ/egBDRJwiYY9TeXBYAA=;
        b=UwXBruo5ncn1zgkY6VX7Hn247W/m8hw3DBdENHmV1NEvOnaC+dwyvR8as7RaVRM80I
         qOzfornf32O6ydQgQ15vFwggsEAM21ut3z80dKiYypDixhq9xgxCEKaXMosZXIHmSw8R
         pzOtJgqko0tc54nXmiTsvZGGMhRCyWi5B5eeaRDXxq3U8+a91GHbK4IuLViWMZYAYxLO
         McqqQHNLqCHinGaktyjRS5pxtP124lS7jmAXYwnJz24tfslCb39seE+H8MFPPo1vQMPJ
         CH41qOJSGE+EeL0qiLk0pZ7NgFlZD3C6IchYBc02vlYmR8ZUVjX6HNAOqd12rinPS5KD
         +TXw==
X-Forwarded-Encrypted: i=1; AKwUvBxFPa7jjG67GbUp33Bhsue6Pym6IWBs5vv4thOFb0zYh471XAFSm19X21o91QlymorO6CEpKEPMIX/kCag=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbjoXl2MtvzBUdFzHCtstIFGs7DqiQgvo2HnmB5W7TCS9VIdLg
	+tH85UoKqUNZcDvIstLJkwNH3Xe01zLYBQstrJGgP8eBAC3yCVCkbWfdACRCVWxsLk4=
X-Gm-Gg: AYBFou39ifFynFO42u8PomcDM8b3QRZ2UnfpiUO80gK5+bzlkuUlwyt/U5pbeob8Xam
	cFQ6RX1N/4Se7MX5hKIIZFfDpVlyz+E1qaLh44GIgc0n9cVpNg1c2PDJWA4YqKSDK7keS3U60yQ
	uQxdsDgeQ1ZsPzB66bQqjnb2bHeFUb+yyVxxYCkPCAhpU+ABh9B2QjH/NyDrl3zFi/kZXssJIka
	ReLY4ipBFdVTwSpJJR94ZF7ZaB74CZ1V9pHg+ysEh6W3Xh1qRHCTTfd3zTEnFHkhiGDYyDBVnNc
	UWSU396FAaireOH+8+hZDJ6X7Psx1LaV9smTNGewupqJzUb0uUkpNv7xSUbVBrNj7ieHXeMmevs
	Xn/TuWm+YvW/GlNkCymwiYhYf01308qj4OxZSnCzg2Z4wLfHC+9STOZPte4k5Mggf786BkxhtWj
	jgSJYXHgoh8cRygrlp5c69E+/EYnUUtRA8/al6Vhb5P169Dp0fc5ABuFqkrhSPN7ewdvJVtoMk1
	xf8tvvw7VtET6Fc39Z3jJecrYgdhAKFNAhGO+M330CC7LWPcOLtYiDvmWBeNKKta4dWYCSxDGDN
	u/aA/JWaMrUrXtoCcX/5IB8vuxwRMpY9T6Q5JPwhBJ0QCbxji9VrYZPvynXf/kqH+uvD/BY/TL1
	hOLh8ldXboNfXGMY=
X-Received: by 2002:a05:600c:c117:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a9672030cbmr23350005e9.22.1793174637584;
        Wed, 28 Oct 2026 01:03:57 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d6besm25792835e9.4.2026.10.28.01.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:03:56 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:03:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Danilo Krummrich <dakr@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
Message-ID: <auGsNgw50hDIdm3R@monoceros>
References: <20260908070031.32833-1-kmehltretter@gmail.com>
 <87h5jq8gia.fsf@trenco.lwn.net>
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
	protocol="application/pgp-signature"; boundary="oh5zvfs3ycvvg6bf"
Content-Disposition: inline
In-Reply-To: <87h5jq8gia.fsf@trenco.lwn.net>


--oh5zvfs3ycvvg6bf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello Karl,

On Tue, Sep 15, 2026 at 01:24:29PM -0600, Jonathan Corbet wrote:
> Karl Mehltretter <kmehltretter@gmail.com> writes:
> > Most structs that were defined in <linux/mod_devicetable.h> before were
> > moved to a bus specific header. Follow the movement to get the struct's
> > documentation back.
> >
> > For the list of device ids in basics.rst use an explicit list of all the
> > headers that have kernel-doc annotations and that are not described
> > elsewhere (i.e. pci and mei_cl). <linux/device-id/acpi.h> is left out on
> > purpose, ACPI_DEVICE_CLASS() is not a device id struct.
> >
> > Also repair the referencing in the zh_CN translation of pci.rst and
> > don't duplicate `struct mei_cl_device_id`.
>=20
> This one adds some new build warnings:
>=20
>   Documentation/translations/zh_CN/PCI/pci:98: ./include/linux/pci.h:3: W=
ARNING: Duplicate C declaration, also defined at PCI/pci:3.
>   Declaration is '.. c:struct:: pci_driver'. [duplicate_declaration.c]
>   kernel/Documentation/translations/zh_CN/PCI/pci:106: ./include/linux/de=
vice-id/pci.h:3: WARNING: Duplicate C declaration, also defined at PCI/pci:=
3.
>   Declaration is '.. c:struct:: pci_device_id'. [duplicate_declaration.c]

Do you intend to address this?

Best regards
Uwe

--oh5zvfs3ycvvg6bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhrGcACgkQj4D7WH0S
/k77+AgAlbsTSlbn2W+qPf7ANkGol57boWPL2S0I72TOezIPXND8DYud1c7YRtKB
PhpKb65OvxBNMec8fqyAFR6akXoak+b0LjgivWXWCOLrQOVwd96tYscMz9T9Zo5a
iRhWUg++SffuMe29/9xFDsjM8JgReW0CUhMfsySfbQm/TSFEl5H+4cCJJsGGtfL3
D1yiIWAQh24ef4OCHJjVjXkWufmtZitqRhecerzr0XU23WE5HyloUqa5j9rMKkiL
0zhPpQMkyPgmas+RNzxq8PVExFJdmjzr8D2BSNitOhQYuzUl762KznuCur+bCurI
6r+fdfpC0jZ68DsEx6a7fNVLvdalZg==
=tz1o
-----END PGP SIGNATURE-----

--oh5zvfs3ycvvg6bf--

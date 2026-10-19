Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0B4A483C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403366; cv=none; b=M76cyfITJuWvbyXBbOe6+IM6PsUE9uCatAKTMZvOvTfpqq5nCAFsRbdPlx2HKE6YbMOpWjvYiwmSNOHJ0tqz03AMmQKy/10/Zz0mj60a8oeC+H4aCrYtkpLNIkCAYWRM+HaqsUgANOo4a8O3JfsukDoLlFwgo40R4sOSv+psd8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403366; c=relaxed/simple;
	bh=LoVkudnEHE+WIeJgaRqtpbsATY7rIeSDDyVjIH//S/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7bR/FUV8rkjtnSPoep74yBYkC1Nm+d2dbt4/4kn+n8p1yzyX+WhK/LLKIZ7vgLLmn9BiDEpOpDq1ZrUXalADhXDHkKSux0j9Whu53++DRA8fCqpidse1GjdfqoCJ5qGlFH9HFRtQT/LdvFDeX+M/wbFok0+vZrFDubVrhEBOvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=k2qrceZD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="k2qrceZD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso13298915e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792403362; x=1793008162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h51dTu7vYXnS6uhEmRgLKYl8DreLWEo23XmELOYWKEo=;
        b=k2qrceZDpBx+aSbXykHh0GmwWGKzTc4xKwKoP2NAYTtQ2osG8BEOTRneyvpb7wSYlM
         P4CLnR7TCUMAc/ArOBM2csnLWn01k6OLXX7+Yy1P/zez6K+xIyViqG65dom/sDjmNKuc
         tFzX7j4NveysBBvzoR+b5D/GbnWH2o4AD6VKON85u+/faM0ysZUrE49A7S75iRdXWjYN
         PDEPx0RB+16QI5JxS7zNZRTbczNHpSzsoPW44rVuoQDHCUCbaZAIqU9eayphAlAAXKA6
         2AS0ObZ8CvW6YUb9IOReCWNjR3DiC1kwU4OCCCTH7+voSMm/TtfwhAIruZgAJEpjqiP2
         HhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403362; x=1793008162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h51dTu7vYXnS6uhEmRgLKYl8DreLWEo23XmELOYWKEo=;
        b=IbIRU1zwtY7k82IkQmBJqrhZwNvgCCAjO+vXCsvKCxncSumAW+b5P1K6qVjCIVqbga
         k5rg/a6o99dGZHt4udJu5dI5HNmkeaJIR5CC+aSmAxPqYxMIn0gXgZXbxcw6tx0Zr+IV
         vZUF3sxKZH6TKLYdzwWwa4gWliHm+rFsq9AI4Ga6O0VlRO9arxlmr1llDXeC/Z84367A
         //QH/88EhZlX+3u09B6nrs3xz49zgUm4Kpy1gCxuY7xwDzOZx1qL7yFwxeqolc9WuQEr
         d7nHo/gy4vOLkKxyVelh8FJofT4RvSD0Xj06ib3kea+tesDZPRsHpxEMSdywk7CdHBVa
         AJ5A==
X-Forwarded-Encrypted: i=1; AKwUvBzEZwTuXFPWxMKGMnLdFQwwF9LVQnuhMMecKD/jyuP3gMXHfY6wFZyXyU+51ZOgB5zxSZIixkdu1GxusDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxAI6p9+sdF6QM31MgwWCAgbwjladELMEHxmeHTwFWTxfseVms
	X+0aSct5ZSfcCaBl6QV3MF2WnCWL1GrqEndoqkFHETJPjssPLem8otqQW7xBGtEIISQ=
X-Gm-Gg: AYBFou3EqKvNxyBxZfyzidVNyQOnHsrjOl8E+zIp8fKH99gTEAFqXWG4OpozD0iQeCt
	3E3Bt2iy9rEevvBx09ikZTgCb3O4D+E0XGOYb/SqoYPaJGIbh9B8TNF5zGAusELVFr6P8c6AibA
	/f3PCmeSAO8WWuwJRImY8X3SZvu/yJC/9RFHEqyXCIRckXQHYu3/+hDFgA8BqHwrSKs87Elajco
	/HavVQrYqEUhnVqOKOs09zNvS4RVWBL9kjGw+4W8MqvDJA3Dd+zNh/PAxwI+CQJ5POBlIeHIPEH
	jLqCnelO7rH52RoedCOohrUd1FfX9UtQmOAnuK8gco2U2RdxXkspW9apYppKrjJRejrLHQPy6TG
	d3QkpALKssFgPBoNa4a2oniW4j7C6sqkaP1s/xZj1QluzMXbKIndH40izLh+4JtGfMvUTJmvFtA
	+/Gb/nRqznNiQbQ6pAPt1R2PWEGoyIiljYjmggA9Nr+kcQh/by4oSfUs/g0Q808FAlCj9xsqnBj
	YRBSFG7XmHLCdoRTEWl+BdrlcwEftKYOBE79p/JZur+SdfZXLTDwdtqVBMh2cQOAjaNf54A
X-Received: by 2002:adf:f789:0:b0:48d:ee6c:1c6d with SMTP id ffacd0b85a97d-48e07bc6c54mr9906519f8f.26.1792403362124;
        Mon, 19 Oct 2026 02:49:22 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd4f8bb6sm23600315f8f.34.2026.10.19.02.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:49:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:49:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Albert Esteve <aesteve@redhat.com>, Brian Masney <bmasney@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, David Gow <david@davidgow.net>, 
	David Gstir <david@sigma-star.at>, Eric Biggers <ebiggers@kernel.org>, 
	Eric Chanudet <echanude@redhat.com>, Francois Dugast <francois.dugast@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Johannes Thumshirn <morbidrsa@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, 
	Julian Braha <julianbraha@gmail.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Waqar Hameed <whame@whame.dev>, lpcosse-keysigning@baylibre.com, users@linux.kernel.org, 
	linux-kernel@vger.kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: PGP keysigning at LPC/OSSE 2026
Message-ID: <atXmZVbeFvd8yaC0@monoceros>
References: <lpcosse2026-keysigning@baylibre.com>
 <lpcosse2026-keysigning-list@baylibre.com>
 <aspYFzgcxfOvOUrZ@monoceros>
 <20261019092237.GA749420@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7b64pdtkcn22qdsx"
Content-Disposition: inline
In-Reply-To: <20261019092237.GA749420@killaraus.ideasonboard.com>


--7b64pdtkcn22qdsx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: PGP keysigning at LPC/OSSE 2026
MIME-Version: 1.0

Hello,

On Mon, Oct 19, 2026 at 12:22:37PM +0300, Laurent Pinchart wrote:
> On Sat, Oct 10, 2026 at 05:31:55PM +0200, Uwe Kleine-K=F6nig wrote:
> > the first few signatures appeared in my inbox and on the keyservers,
> > that's great! Please continue.
>=20
> I've received signatures from three people who are not on the list and
> didn't hand me a paper slip separately during the key signing party. Has
> anyone experienced something similar ?

No surprises on my end. But there were a few guys with the list but
without being on it. The respective fingerprints are:

	487E 30CA 9E36 578B 57BD  8B23 52A0 0C47 4880 94F2
	5BF6 7BC5 0826 72CA BB45  ACAE 587C 5ECA 5D0A 306C
	62B1 1398 D01C 2D72 9A38  9808 1DD2 101F 5E0A 2B84
	6425 4695 FFF0 AA44 66CC  19E6 7B96 E816 2A8C F5D1
	8A0F 1015 F0CD 2FE0 3D46  8403 D5A7 6F9F 4045 E78A
	95C6 2D22 48EE 0D8A 44C3  D3B4 26BC FA05 FCF6 0E4C
	9E98 4977 C30D 06BB 2D8C  EC66 442A 4F87 5238 B839
	CDB1 5B32 19FE 00E5 77C7  E3FA 65BA 97B9 EE9C 1459

if it's one of these, it's probably fine.

Best regards
Uwe

--7b64pdtkcn22qdsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrV55sACgkQj4D7WH0S
/k525wgAudcYjSuscEbjLxEaS9Yo6B5S/Qoo7mkFknlAQ6COhmqorPXdXmenbeks
+iJbuTmKcGxUEzZn3gTNtF7b79S3OtFktZ94WcPEJ86wkHItWOCeOA4f4eCEspUO
qIpfcrC76H8JVmnUMG4Ab3WOr+v7LKf4xK9d+F9VzH4p3VwOoCfBOaMET6UIz34J
6Kh1+QVFT7ANNwG74kw/Wp6fN9CHroQc24pCKJ+jDH298wxJzUdojteDswuu/sUO
aIuVZV1GfQkwbXLGGsMKPI6rC0X7Uc3fOA7PUxo7f2Fgn/PgBroypPJJgzWF9lzi
KPHArZQzIfeGVKm0ChglxQLwwV5how==
=taqh
-----END PGP SIGNATURE-----

--7b64pdtkcn22qdsx--

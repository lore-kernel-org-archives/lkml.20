Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AFF3603DB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393409; cv=none; b=rtPyQIcltPDikVRqbkVDf8PQ8bVHMuJ5Xqe8Wcj1k/sZcKcNJodk0BWT6JKN4jofROkwUhJ3G0ViqMhGX1hkRq0sCuIduMmHoPOLvUXzWd1QJiBcqs0pa/FaxOeIUHymsE5Eb0jCq0bEwftlGb9mKHET+5hv8ENN2Nmadjexx60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393409; c=relaxed/simple;
	bh=Q+RRcDh4UKmIKJcO1riE/TsRCut6GRzew3emEAB2HSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBU0+7xT9hvF4x8nZDGIZHItA6Ri4TEY6l3kYC595re+2NvdK+ahA+oj6LpNkxSqV2OE+6TQ4atfS9O79WbVs5djYvpJQ9mH4CTppQ1cZH3SrJ4ewRtav+zszGHLt+SPgS+x3cVUw52kOLJU0d5Mhqz2nzVfrjkcb48GtFg+8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ey0EBFe3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ey0EBFe3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so23544995e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792393407; x=1792998207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+RRcDh4UKmIKJcO1riE/TsRCut6GRzew3emEAB2HSk=;
        b=Ey0EBFe3kGy7HxJybpFxS6tZ67MeRrA+7dux5JOYXl6HnCP8ObAjlP7ArQaflxeW4j
         7foGWmM6OBgr9V+FB/KgTWgbzU8hVBEpmC8gCt5xWjf2mnb7hASs/HO4hyGRCCqXd3+B
         mXELTkr4LoqhkpvrCdvnw9z8mw5p3ulnd5bBq4NaXTT+mVTrw46q55Ct7+uSVapsfTLG
         te+WbEcT5qHoX8wnP/oEQOnfbAhNT5SKXxwkFMi/kY7BYXPByg6/ZLiyafWOTSkRP/J1
         Bs156uqHFWcBaf3mtYomlXYOM3ihv3bPvn/sdXR7kCxE67TWDaiHia5FdP88gwMlRyeX
         q4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393407; x=1792998207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+RRcDh4UKmIKJcO1riE/TsRCut6GRzew3emEAB2HSk=;
        b=Usox6S1fc2x73Do2daCjWjPHSPBpinTDnk5vYzZm3xEZS8ln9jhPSXoitndNb1sIYf
         YyD0eJ2G21HW0/gh5hyycQB0OgLztwPvjerpgSS1D/YUuPUYeV6dinWEp6JJe4TaiA/w
         dkOUXkVYuD4KIbRWDzbW+5+dFpfg2+QafVVpliremGqhJQtQbdWFvU5kGupssahmFO13
         kt7Lcburxev34Th0oHOJ4JlMdgXqQs/7ebScVPT4ZD1OU/mBO3xdirJAiD0R8q7ze6/k
         w4J7kNg/Lzv3tLnv8V+YurLNARIPkIPd/7iQEkbjVHRg7RyntzfQCOv2NVTK6oGS8+5Y
         VDlg==
X-Forwarded-Encrypted: i=1; AKwUvBzqOBiTiwuBz+MOh1nG3ihkQzeyCsVJoF5SP5z/aJW/8uSzWulxg/CaRYRfKRSiUExxIYHJdb93rWhLWk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX0haANn5DXNwV+Gd+WJ1L4bKkmRiNzNLV/Gmhz6TJIfCOxnlS
	OLOszV2Sq3aPfOt3EkSng+jrcXg3EjZuPo6PRZbJrydkMwSwSUbxb4t8EBtFvyo0kdc=
X-Gm-Gg: AYBFou2xYa/T2bLWNcc9MdUKVaUu2ghuYxFbRRvDpr/bPZtnFseC8X7vIuTuHAazgIV
	bCG5u0Q4lhEUZvfWftDtY6XQUZbKdFCJGJH0QB2f0vWr2f4ynXujCFEhdTQnbxr82fjlOGoc5Nd
	Uo4T3nQlMgceqPuRURG9cpVUlnZ60lkUyKhfYls1Q5eNhRfyR1Ha5lox35PrqN0MlQSK2Hkdsxe
	f5/wsqsTxWAZepVeXr4hYtWmVMIsyKvjPWwisaFhIqgPCUVB173r0VYw2/RvGeF5I8ZxSeHS0gp
	eHgx1GHdgsaL5Aeesf/v8af2AWnNVi9SMiv3gQiYZ+uYIYWp+BKDT6JljfuESw5amj6NrlCrs60
	xMrgYMULdkIKM2P2hx/ZtPp7zR49eAN848uB042QRItfj623fK2VFkWl5QJtcIuv+hHp0AuOgsA
	RopvnZgFnyYjIzpDWoJl83JNF+oVZqf8WrHyqv/MEtn/J6AWysK8En0XiYjisfvy7+t8DCc+jjE
	/R2b61pnt7HIj6lIu1BMi7P6mVKvjAwaNmturCnJQqjQphWxX2kOYcJJCMeUA==
X-Received: by 2002:a05:600c:1389:b0:4a1:ad27:e797 with SMTP id 5b1f17b1804b1-4a1d76074c6mr149306765e9.6.1792393406457;
        Mon, 19 Oct 2026 00:03:26 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd5008e7sm20882400f8f.43.2026.10.19.00.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:03:25 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:03:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephan Costa Barros <stephanbrrs8@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mike Looijmans <mike.looijmans@topic.nl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ti-ads1299: add driver for TI ADS1299
Message-ID: <atXAQXmGEeGdJMZQ@monoceros>
References: <20261019001247.483005-1-stephanbrrs8@gmail.com>
 <20261019001247.483005-3-stephanbrrs8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bem7tih7lw4hegfh"
Content-Disposition: inline
In-Reply-To: <20261019001247.483005-3-stephanbrrs8@gmail.com>


--bem7tih7lw4hegfh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] iio: adc: ti-ads1299: add driver for TI ADS1299
MIME-Version: 1.0

Hello,

On Sun, Oct 18, 2026 at 09:12:47PM -0300, Stephan Costa Barros wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/spi/spi.h>

<linux/spi/spi.h> provides both of_device_id and spi_device_id. So there
is no need to also include <linux/mod_devicetable.h>. The latter pulls
in a lot of useless dependencies, so there is actually some harm in
using it.

Best regards
Uwe

--bem7tih7lw4hegfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVwLkACgkQj4D7WH0S
/k7tFAgAuy07Qyb8M0VZ9zMcDlt26Ff3vPHTAn75HqkdKcwS114Jt42Ugs714HUS
+e6hR+YO4BtUqxXTetGlAYQBaBwW1DTE+F3Oe/NbiIiLtwRU34ZAcDV2WhpGZu8s
4rW106ThVsV+LtV7RwM+uTkdOBsjgw9N7S9cUpHzrrAJJ56Uf+vzlc3SxrJvagF8
k/5UVamCKRXMElttYBtZCmZVul2sRRpn0Wk8x79IYqk588VSXvtpolDI89jyyqhb
ApDyKPoTfcXJyCRWA6kJJBZHmKcheVedvx8GXF2zcRwRvFos3ADU6KC4iG2qzoCy
toZ5n1SBq7BVCtebyJ33TSjNnfrc1A==
=VLba
-----END PGP SIGNATURE-----

--bem7tih7lw4hegfh--

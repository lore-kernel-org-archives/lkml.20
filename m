Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887132;
	b=IaG7sOZLn1bFpb8rA6QaA2Ng45qfmlYETN0Oi1SbJiDKhOVW2l4TwwuRz3U+4TF/GV+R
	 P9vyopypRL+0XwnAu+DBV/4wT4bM0F5iCegDoBrP3drEueE10plaHRzvpSq3PkNenuI0w
	 R4uP19ZSh0hSZaYbN7eqaGOfcB015p5Vx3UIAbU8K2ax2kP8ZXwCv0Yadl7rNgKR0vqH4
	 UUf867xIakJ0XAHdnGQNPN6rcO532w3XAJH8zJQFdOu0E0R08cqisyHqaq6tF9/3tlOz5
	 OGJmMyXCZoXJ/sTa5D5MwmLUaTvgwE9oC5gR6DzxC1ri1sor7juXAP3WiILOnAJ9X3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
	b=BgZBbQ0lsf15MsQGlUT1e7/HKAmZUthWcFxu9euQ/v77+l3eFzkbSVkR4aTBV6JeafTA
	 Rg/Jbya7f3G3DYmV+H84t2xDS4rFw9exy3ouXa3nYuJd1uVGOvNF8vBZT83TyUaf3ktGM
	 QyAK7++T1T86t8tQ6geoj/RHHGFbNvSb9CMX4TeO808f9/aCrl2IL+xuSYQG587G1P+BE
	 XCb8FWHDpqTA7JeOEPzNMS2EeSU5ZG32+IFCigli7HVI0O2xV+zvGkUT2egDPejEetEDH
	 RzC6hftSRdftWKxR+k8kKvwypiVS5Uvvnp7D7QnngoaohfO0ja39V4y2csJ6Uc7QHqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E0ibYapT;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21325606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21325606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E0ibYapT
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13770805e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887129; x=1794491929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
        b=E0ibYapTp+snHAaLfFV5C5kwF9bCnW48/3xjOj38X1Awn0rWjO2IHMNwe2sdoJi2Xi
         NhkIaFCvlExF3CunDrqNLZ1BIIvnetZfKieCryQ2Gy3j1wqLADFAsc8CshWNWk7uQ1dY
         XyvQB++g1KA08c/s3njsnCmi0inrSKlArTCe0sVwQzLJ5fNVX8WT6EtdW/qCLhpgoyNy
         jgSQen9y+B0oSNAZJ1B5Zu9ziznXalyeQ4KZi/a0IJmncqqhwgt+mlLGB+bGU7OtYhsa
         Ew4E1J9yz69l37hI/lMxYXUih5vde6EJMuEZAPgxqAMGaH4LX+L1pnUe0fTkPNPLDxuh
         CU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887129; x=1794491929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
        b=gdLJSXbptjslZQkK6w2qo1HuNi6J6HrMadT2gl3GjoZNtv0/DridENFWZdS1RTGflC
         RItMzVnuep02JOntA7u26q2BEcetDB+uOdA0nFI4pog8t1x0IjkPeHjx3Q7t0mxt0yPD
         BDwNNc5F2HAQlu3uSqom3JgJUwqoBH7nPJ2EqSVknrmZpC/unNCwC31ivv+NUMGxCnEe
         czgn/lmYEA4ybfXjtIvZJloj8XiIbGH4+3mOkKwBpqfSfJ1pAVfGe0/FCHm1BoYd36Jy
         /iEDxHQgVal12J9RujTN110bChziF8Ctv59LvNwTUDz8FdRP+bSAo+1F3/HGKlxOZHFA
         2VZw==
X-Forwarded-Encrypted: i=1; AKwUvBzkniUQ6fPrKp2kX8AHNLZE5li9q0ZYxIsioIMxU2V2ZkT2CjR0WOyKntrDh2Bg9cYej0TuPjdVTLtfN44=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zCdAdAjx5pzJaEtpAbucfnNFcw4XjBVYaE0CZwrWH9QagofRV
	FXCNwayQKNBwtADS5qZ9PvF/2SH6zVFO4a01FC/HD32jAQ8mkAar9uy02T/rh2kDhA8=
X-Gm-Gg: AYBFou2iUJmWNcFO0ywSSd2VLoOuFhnIY6m414nc9/oHgJONwvsWU34rabMyr5zGg/M
	ON5vBHemdYySjnhqTQ3tTbt87M91mCjrjKK90LJH9H2MaKobmVHYg58PjO1MztUWpOAyuCyopiL
	n+DpiSCRIoZIORZZLZpcqtMXdKiAQXzjffn1IgViVInYQWw9at8slXnvTrUs8TvS9TJJzTQkhaC
	D4O6344uWvKT3n8syGWTQq7bA595c6DgCE9tjnZ14N1YIOSZ8Y66WMqxG99NPREfN0ZcjTwLTed
	QXoUIlkqlivGmE4LpDMpg6/v+AB03+HIphrnmpk5xWOfHSWrcHzo0VuKDJBkykzLtEXldbk0kXY
	Zh6YdfPUTtNHKs04YBTCL37COCQMUkTBslrJTi38c63GxAikzun8URF6G2UcN4SpISbH2C+3KZ0
	bBcLN99e1PiXiX9///X/tvU6/0dnTieXNPCxlz4kIOtMzeXY3FTTGQBA+2x1yduI24tDNYzPGRW
	heNSrD2Fji9yJ1UoWGriUBrgzMWxFTgkujcd1MLuF2ZE1vPYrOhI/FU6l4/ucqVwjPqW9T9neov
	BnsNigOMb5Bd7+4gN6+kXyfJpoHp
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr375702725e9.22.1793887129505;
        Thu, 05 Nov 2026 05:58:49 -0800 (PST)
Received: from localhost ([194.213.108.8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56ba6bc36sm75097435e9.0.2026.11.05.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:58:48 -0800 (PST)
Date: Thu, 5 Nov 2026 14:58:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] mailbox: sun55i: Add Allwinner A523 message box
 driver
Message-ID: <auyLOc4djmm29Bnz@monoceros>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-3-tcmichals@gmail.com>
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
	protocol="application/pgp-signature"; boundary="6jfoalgweekh6k4p"
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-3-tcmichals@gmail.com>


--6jfoalgweekh6k4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/7] mailbox: sun55i: Add Allwinner A523 message box
 driver
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 12:57:30PM -0600, Tim Michals wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as this pulls in a lot of
unneeded build dependencies.

<linux/platform_device.h> already provides of_device_id which is all you
seem to use here. If you want full iwyu include <linux/device-id/of.h>
instead.

Best regards
Uwe

--6jfoalgweekh6k4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsi5EACgkQj4D7WH0S
/k5vhQf+JI5oqB8wirr4Mfq53+EuIcbqVBMYKSJ4VvYsL5NgmUbk5OmelFsyFXLh
1cTpKfp/pSXjaY74bSTdw8Wzj26UAD6h5WcL7M+Y0R76ERavh1U/j83g7GfDBxJr
eHota1nXeLkRvpDqW7tWDBWn66eu0IeVsO8nlokpZTVhmLk/uFlIIITHp+IbJSUS
oBmB5o0SK31zlNe1wrqwI8jCXjAUPyVcVouZEhNQ5mtIja4FE782+wlnw7agZe69
vl3MG/TIihE7J63RC8U2iKs7BsfN9oB5xF5H8YMQYZ8/3uAj4eNkgFSjpbU8xXtp
IDWe63lnv5ShurGsD35Z20wJbKGEKA==
=hD40
-----END PGP SIGNATURE-----

--6jfoalgweekh6k4p--
